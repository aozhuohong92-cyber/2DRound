#!/usr/bin/env python3
"""Read-only dependency audit for the offline client (stage 0).

Standard library only, and no import of prepare_assets/pack_lua: it must run to completion
(write its reports, return 1) even when work/ and outputs/apk-extracted/ are entirely absent.
It never unpacks, builds or touches a device. Env overrides (for tests):
OFFLINE_APK_EXTRACTED, OFFLINE_WORK.
"""
from collections import defaultdict
from datetime import datetime
from pathlib import Path
import argparse, hashlib, json, os, re, shutil, socket, subprocess, sys

PROJ = Path(__file__).resolve().parent
ROOT = PROJ.parents[1]
APK = Path(os.environ.get('OFFLINE_APK_EXTRACTED', ROOT / 'outputs/apk-extracted'))
WORK = Path(os.environ.get('OFFLINE_WORK', ROOT / 'work'))
REPO_ROOTS = [ROOT / 'assets', PROJ / 'assets']
NEW_ROOT = '/Users/mountainwalkeralliance/Documents/code/海贼王'
OLD_ROOT_FALLBACK = '/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba'
ENTRY_LUAC = 'D6D87D9149AFCAB5.luac'  # replaced by the offline main; build.py skips the original
SDK = Path(os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT') or Path.home() / 'Library/Android/sdk')
BT = SDK / 'build-tools/35.0.1'

REPORT_JSON = PROJ / 'missing-assets.json'
REPORT_MD = PROJ / '依赖恢复清单.md'
LIST_CORE = PROJ / 'restore-files.txt'
LIST_LUAC = PROJ / 'restore-files-luac.txt'
LIST_MCP = PROJ / 'restore-files-cocos-mcp.txt'


def load_json(path, default):
    try:
        return json.loads(Path(path).read_text(encoding='utf-8'))
    except (OSError, ValueError):
        return default


def sha256_file(p):
    h = hashlib.sha256()
    with open(p, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()


def human(n):
    n = float(n or 0)
    for unit in ('B', 'KB', 'MB', 'GB'):
        if n < 1024 or unit == 'GB':
            return f'{n:.0f} {unit}' if unit == 'B' else f'{n:.1f} {unit}'
        n /= 1024


def relroot(p):
    try:
        return Path(p).relative_to(ROOT).as_posix()
    except ValueError:
        return str(p)


def run_quiet(cmd, timeout=8):
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        return r.returncode, (r.stdout + r.stderr).strip()
    except (OSError, subprocess.SubprocessError) as e:
        return 127, str(e)


class Sizes:
    """File sizes on the original machine, from migration-manifest.json (no copy needed)."""

    def __init__(self):
        m = load_json(ROOT / 'outputs/migration-manifest.json', {})
        self.files = m.get('files', {}) if isinstance(m.get('files'), dict) else {}
        self.old_root = m.get('old_root') or OLD_ROOT_FALLBACK
        self.new_root = m.get('new_root') or NEW_ROOT

    def size(self, rel):
        row = self.files.get(rel)
        return row[1] if row else None

    def under(self, prefix):
        return [(k, v[1]) for k, v in self.files.items() if k.startswith(prefix)]


def entry(rel, purpose, sizes, required=True, group='A', note=None, local=None):
    local = Path(local) if local else ROOT / rel
    return {'rel': rel, 'purpose': purpose, 'required': required, 'group': group, 'note': note,
            'present': local.exists(), 'bytes': sizes.size(rel),
            'primary_source': f'{sizes.new_root}/{rel}', 'backup_source': f'{sizes.old_root}/{rel}',
            'local_target': str(ROOT / rel)}


# ---------------------------------------------------------------- resources
def repo_index():
    idx = {}
    for root in REPO_ROOTS:
        if root.is_dir():
            for f in sorted(root.rglob('*')):
                if f.is_file():
                    idx.setdefault(sha256_file(f), f)
    return idx


def audit_resources(sizes):
    manifest = load_json(PROJ / 'asset-manifest.json', {})
    rows = manifest.get('resources', {})
    unresolved = set(manifest.get('unresolved_dependencies', []))
    idx = repo_index()
    refby = defaultdict(list)
    for name, r in rows.items():
        for d in r.get('dependencies', []):
            refby[d].append(name)
    out = []
    for name, r in sorted(rows.items()):
        apk_file = APK / r['archive']
        rel = 'outputs/apk-extracted/' + r['archive']
        status, repo_path = 'missing', None
        if apk_file.is_file():
            status = 'present'
        elif r['sha256'] in idx:
            status, repo_path = 'in_repo', relroot(idx[r['sha256']])
        else:
            for root in REPO_ROOTS:
                for f in (root.rglob(Path(name).name) if root.is_dir() else []):
                    if f.is_file() and f.as_posix().endswith('/' + name):
                        status, repo_path = 'hash_mismatch', relroot(f)
        unknown = [d for d in r.get('dependencies', []) if d not in rows and d not in unresolved]
        out.append({'logical': name, 'status': status, 'archive': r['archive'], 'source_rel': rel,
                    'bytes': r['bytes'], 'sha256': r['sha256'], 'repo_path': repo_path,
                    'size_on_original_machine': sizes.size(rel),
                    'referenced_by': sorted(refby.get(name, [])), 'seed': name not in refby,
                    'unknown_dependencies': unknown, 'kind': Path(name).suffix.lstrip('.')})
    return out, sorted(unresolved)


# ---------------------------------------------------------------- lua
def read_text(p):
    return Path(p).read_text(encoding='utf-8', errors='replace')


def audit_lua(sizes):
    restored = ROOT / 'outputs/lua-restored-paths'
    name_map = load_json(ROOT / 'outputs/resource-name-map.json', {})
    own = sorted((PROJ / 'src').rglob('*.lua'))
    req_re = re.compile(r"""require\s*\(?\s*['"]([^'"]+)['"]""")
    own_requires = sorted({m for p in own for m in req_re.findall(read_text(p))})
    external = [r for r in own_requires if not r.startswith('offline.')]

    # Symbols that exist only because the original Lua framework layer (cocos/**) defines them.
    dotted, globs = set(), set()
    for p in sorted((restored / 'cocos').rglob('*.lua')) if (restored / 'cocos').is_dir() else []:
        for line in read_text(p).splitlines():
            m = re.match(r'^(ccui|cc|ccs|ccb|ccexp|sp)\.([A-Za-z_]\w*)\s*=', line)
            if m:
                dotted.add(f'{m.group(1)}.{m.group(2)}')
            m = re.match(r'^function\s+([A-Za-z_]\w*)\s*\(', line) or re.match(r'^([A-Za-z_]\w*)\s*=\s*function', line)
            if m and len(m.group(1)) > 3:
                globs.add(m.group(1))
    hits = defaultdict(list)
    for p in own:
        text = read_text(p)
        for s in dotted:
            if re.search(r'(?<![\w.])' + re.escape(s) + r'\b', text):
                hits[s].append(relroot(p))
        for s in globs:
            if re.search(r'(?<![\w.:])' + re.escape(s) + r'\s*\(', text):
                hits[s].append(relroot(p))

    # Original module list: module_include.lua -> resource-name-map -> HASH luac.
    mi_files = sorted(restored.rglob('module_include.lua'))
    modules = sorted(set(re.findall(r'"([A-Za-z0-9_.]+)"', read_text(mi_files[0])))) if mi_files else []
    by_suffix = {k[:-5]: v for k, v in name_map.items() if k.endswith('.luac')}
    resolved, unmapped = [], []
    for mod in modules:
        path = mod.replace('.', '/')
        key = next((k for k in by_suffix if k == path or k.endswith('/' + path)), None)
        (resolved if key else unmapped).append(mod if not key else {'module': mod, 'luac': by_suffix[key]})

    # Static closure from the offline code's own requires (empty when it requires nothing original).
    closure, todo = set(), list(external)
    while todo:
        mod = todo.pop()
        if mod in closure:
            continue
        closure.add(mod)
        f = restored / (mod.replace('.', '/') + '.lua')
        if f.is_file():
            todo.extend(r for r in req_re.findall(read_text(f)) if r not in closure)

    luac = [(k, s) for k, s in sizes.under('outputs/apk-extracted/') if k.endswith('.luac') and not k.endswith('/' + ENTRY_LUAC)]
    native = []
    ns = ROOT / 'outputs/native-analysis/native-strings.txt'
    if ns.is_file():
        for i, line in enumerate(read_text(ns).splitlines(), 1):
            if re.search(r'\.luac\b|\?\.lua|^main\.lua$|cocos\.init|game_start', line) and len(native) < 12:
                native.append({'line': i, 'text': line.strip()})
    reasons = [
        ('自有 Lua 未 require 任何原模块' if not external else
         f'自有 Lua require 了原模块: {external}'),
        ('framework 层符号命中: ' + ', '.join(sorted(hits)) if hits else '未发现依赖原 cocos/* Lua framework 的符号'),
        '原生加载器（LuaStack::executeScriptFile/luaLoadBuffer、loader 路径）是否会在启动时按名批量载入 luac，'
        '尚无静态或真机证据确认 —— 无法确认的部分按“保守全量”处理',
    ]
    return {
        'mode': 'conservative_full', 'confirmed_subset': False,
        'subset_candidate_modules': sorted(closure),
        'own_external_requires': external, 'framework_symbol_hits': {k: sorted(set(v)) for k, v in sorted(hits.items())},
        'module_include_modules': len(modules), 'module_include_mapped': len(resolved),
        'module_include_unmapped': unmapped,
        'luac_files_to_copy': len(luac), 'luac_bytes': sum(s for _, s in luac),
        'entry_luac_excluded': ENTRY_LUAC, 'native_loader_evidence': native, 'reasons': reasons,
        'luac_list': sorted(k for k, _ in luac),
    }


# ---------------------------------------------------------------- tools
def local_jdk_home():
    for cand in (WORK / 'tools/jdk-17/Contents/Home', WORK / 'tools/jdk-17'):
        if (cand / 'bin/java').is_file():
            return cand
    return None


def audit_tools():
    t = []
    jh = local_jdk_home()
    if jh:
        os.environ['JAVA_HOME'] = str(jh)
        os.environ['PATH'] = str(jh / 'bin') + os.pathsep + os.environ.get('PATH', '')

    def add(name, ok, detail, required=True, scope='build'):
        t.append({'name': name, 'ok': bool(ok), 'detail': detail, 'required': required, 'scope': scope})

    rc, out = run_quiet(['java', '-version'])
    add('JDK (java)', rc == 0, out.splitlines()[0] if rc == 0 and out else 'Unable to locate a Java Runtime')
    rc, out = run_quiet(['keytool', '-help'])
    add('keytool', rc == 0, 'ok' if rc == 0 else 'unavailable (needs JDK)', required=False)
    add('Android SDK', SDK.is_dir(), str(SDK))
    add('build-tools 35.0.1', BT.is_dir(), str(BT))
    for n in ('aapt2', 'apksigner', 'zipalign'):
        add(n, (BT / n).is_file(), str(BT / n))
    jar = SDK / 'platforms/android-35/android.jar'
    add('platforms/android-35/android.jar', jar.is_file(), str(jar))
    local = WORK / 'tools/LuaJIT-2.1/src/luajit'
    found, notes = None, []
    for cand in (str(local) if local.is_file() else None, shutil.which('luajit')):
        if not cand:
            continue
        rc, out = run_quiet([cand, '-e', 'os.exit(0)'])
        if rc == 0:
            found = cand
            break
        notes.append(f'{cand} 无法执行（{out.splitlines()[0] if out else rc}）')
    add('luajit', found, found or ('; '.join(notes) or 'not in work/tools or PATH') + '；可 brew install luajit', scope='verify')
    add('clang', shutil.which('clang'), shutil.which('clang') or 'missing', scope='verify')
    adb = SDK / 'platform-tools/adb'
    add('adb', adb.is_file() or shutil.which('adb'), str(adb), required=False, scope='device')
    return t


def probe_cocos_mcp(sizes):
    mcp_dir = WORK / 'mcp-install/cocos-creator-mcp'
    ext = ROOT / 'outputs/cocos-mcp-workbench/extensions/cocos-creator-mcp'
    healthy = False
    try:
        with socket.create_connection(('127.0.0.1', 3000), timeout=0.5):
            healthy = True
    except OSError:
        pass
    editors = [str(p) for pat in ('Cocos/Creator/*/CocosCreator.app', 'Cocos Creator*.app', 'CocosCreator*.app')
               for p in Path('/Applications').glob(pat)]
    dashboard = Path('/Applications/CocosDashboard.app').is_dir()
    files = sizes.under('work/mcp-install/cocos-creator-mcp/')
    return {'mcp_dir_present': mcp_dir.is_dir(), 'extension_link_resolves': ext.exists(),
            'extension_link_target': os.readlink(ext) if ext.is_symlink() else None,
            'localhost_3000_listening': healthy, 'cocos_creator_apps': editors, 'cocos_dashboard_installed': dashboard,
            'mcp_dir_files_on_original': len(files), 'mcp_dir_bytes_on_original': sum(s for _, s in files),
            'launcher': 'outputs/mcp-setup/启动Cocos工作台.command',
            'note': '本会话未加载任何 Cocos MCP 工具；UI/场景工作与验收须在 MCP 可用后进行，不用其他引擎替代。'}


# ---------------------------------------------------------------- orchestration
def build_report():
    sizes = Sizes()
    resources, unresolved = audit_resources(sizes)
    lua = audit_lua(sizes)
    tools = audit_tools()
    mcp = probe_cocos_mcp(sizes)
    core = [
        entry('outputs/apk-extracted/classes.dex', '原包 Java DEX，build.py 直接打入 APK', sizes, local=APK / 'classes.dex'),
        entry('outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so', '原生 Cocos2d-x/Lua 引擎库', sizes,
              local=APK / 'lib/arm64-v8a/libcocos2dlua.so'),
        entry('work/offline-build/offline-debug.jks', '调试签名；覆盖安装旧测试包时必需（换签名只能先卸载旧包）', sizes,
              group='C', local=WORK / 'offline-build/offline-debug.jks',
              note='缺失时 build.py 不再默认生成；需 --new-keystore 且必须先卸载 org.local.onepiece.offline'),
        entry('work/tools/LuaJIT-2.1/src/luajit', 'verify.py 运行 Lua 单测；也可 brew install luajit 代替', sizes,
              required=False, group='C', local=WORK / 'tools/LuaJIT-2.1/src/luajit'),
        entry('work/offline-build/mobile_capture.py', '真机截图脚本（可选；需配合其 venv，或改用 adb screencap）', sizes,
              required=False, group='C', local=WORK / 'offline-build/mobile_capture.py'),
    ]
    missing = [r for r in resources if r['status'] in ('missing', 'hash_mismatch')]
    luac_present = sum(1 for k in lua['luac_list'] if (APK / k.split('outputs/apk-extracted/', 1)[1]).is_file())
    blockers = []
    for e in core:
        if e['required'] and not e['present']:
            blockers.append(e['rel'])
    jks = next(e for e in core if e['rel'].endswith('offline-debug.jks'))
    if not jks['present'] and jks['rel'] not in blockers:
        blockers.append(jks['rel'])
    if luac_present < lua['luac_files_to_copy']:
        blockers.append(f"luac ×{lua['luac_files_to_copy'] - luac_present} (conservative_full)")
    blockers += [r['logical'] for r in missing]
    blockers += [f"tool:{t['name']}" for t in tools if t['required'] and not t['ok']]
    luajit_ok = next(t for t in tools if t['name'] == 'luajit')['ok']
    build_tools_ok = all(t['ok'] for t in tools if t['required'] and t['scope'] == 'build')
    ready_build = not blockers and build_tools_ok
    summary = {
        'resources_total': len(resources),
        'present': sum(r['status'] == 'present' for r in resources),
        'in_repo': sum(r['status'] == 'in_repo' for r in resources),
        'missing': sum(r['status'] == 'missing' for r in resources),
        'hash_mismatch': sum(r['status'] == 'hash_mismatch' for r in resources),
        'missing_bytes': sum(r['bytes'] for r in missing),
        'luac_to_copy': lua['luac_files_to_copy'], 'luac_present': luac_present,
        'ready_for_build': ready_build,
        'ready_for_verify': ready_build and luajit_ok,
        'ready_for_cocos_mcp_work': mcp['mcp_dir_present'] and mcp['localhost_3000_listening'],
        'visual_acceptance': 'waiting_for_user_video',
    }
    return {
        'generated_at': datetime.now().isoformat(timespec='seconds'),
        'status': 'ready' if ready_build else 'waiting_for_dependencies',
        'summary': summary, 'blockers': blockers,
        'acceptance': {
            'status': 'waiting_for_user_video',
            'rule': '画面验收必须等用户提供参考视频；以视频抽帧与设备截图/照片逐项对比为准。'
                    'docs/reference-video 现有仅是抽帧与时间线，不替代用户后续提供的视频。',
            'apk_build': 'waiting_for_dependencies' if not ready_build else 'ready',
        },
        'paths': {'root': str(ROOT), 'apk_extracted': str(APK), 'work': str(WORK)},
        'resources': resources, 'unresolved_editor_defaults': unresolved,
        'lua_dependency': {k: v for k, v in lua.items() if k != 'luac_list'},
        'binaries': core, 'tools': tools, 'cocos_mcp': mcp,
    }, core, missing, lua, sizes


def write_lists(core, missing, lua, mcp, sizes):
    LIST_CORE.write_text('\n'.join([e['rel'] for e in core if e['required'] or e['group'] == 'C']
                                   + [r['source_rel'] for r in missing]) + '\n')
    LIST_LUAC.write_text('\n'.join(lua['luac_list']) + '\n')
    LIST_MCP.write_text('work/mcp-install/cocos-creator-mcp/\n')


def write_md(rep, core, missing, lua, sizes):
    s, m = rep['summary'], rep['cocos_mcp']
    new, old = sizes.new_root, sizes.old_root
    L = ['# 依赖恢复清单（阶段 0，自动生成）', '',
         f"生成时间：{rep['generated_at']}　状态：**{rep['status']}**", '',
         '> APK 构建与画面验收均为“等待依赖”。画面验收另需**用户提供的参考视频**，以抽帧与设备照片/截图对比为准，收到前不做视觉验收。',
         '> 拷回的文件只放本地运行目录（`work/`、`outputs/apk-extracted/` 已在 `.gitignore` 中），不要提交 Git。', '',
         '## 摘要', '',
         f"- 运行资源 {s['resources_total']} 个：present {s['present']}、仓库已有且哈希一致 {s['in_repo']}、"
         f"**缺失 {s['missing']}**（{human(s['missing_bytes'])}）、哈希不一致 {s['hash_mismatch']}",
         f"- luac：需拷 {s['luac_to_copy']} 个（{human(lua['luac_bytes'])}），模式 **保守全量**；已有 {s['luac_present']}",
         f"- ready_for_build={s['ready_for_build']}　ready_for_verify={s['ready_for_verify']}　"
         f"ready_for_cocos_mcp_work={s['ready_for_cocos_mcp_work']}", '']

    def table(rows):
        L.extend(['| 原机器主路径 | 备用旧路径 | 本机目标 | 用途 | 大小 | 状态 |', '|---|---|---|---|---|---|'])
        for e in rows:
            L.append(f"| `{e['primary_source']}` | `{e['backup_source']}` | `{e['local_target']}` | {e['purpose']}"
                     f"{'；' + e['note'] if e.get('note') else ''} | {human(e['bytes']) if e['bytes'] else '未知'} | "
                     f"{'已有' if e['present'] else '缺失'} |")
        L.append('')

    L += ['## A 构建必需（二进制）', '']
    table([e for e in core if e['group'] == 'A'])
    L += [f"**luac（{lua['luac_files_to_copy']} 个，{human(lua['luac_bytes'])}）**：路径 `outputs/apk-extracted/assets/HASH/<x>/<HASH>.luac`，"
          f"清单见 `restore-files-luac.txt`；入口 `{ENTRY_LUAC}` 由离线 main 替换，不必拷。", '',
          '依赖判定：' + '；'.join(lua['reasons']) + '。', '']
    L += ['## B 缺失运行资源', '']
    L.extend(['| 逻辑路径 | 原机器主路径 | 大小 | 引用方 |', '|---|---|---|---|'])
    for r in missing:
        L.append(f"| `{r['logical']}` | `{new}/{r['source_rel']}` | {human(r['bytes'])} | "
                 f"{', '.join('`' + x.split('/')[-1] + '`' for x in r['referenced_by']) or '种子资源'} |")
    L += ['', f"备用旧路径前缀：`{old}/`。仓库已有且哈希一致的 {s['in_repo']} 个资源无需拷回，由 prepare_assets 回退使用。", '']
    L += ['## C 验收工具', '']
    table([e for e in core if e['group'] == 'C'])
    L += ['`offline-debug.jks` 缺失时：要么拷回；要么先卸载手机上的 `org.local.onepiece.offline` 再用 `build.py --new-keystore` 生成新签名。', '']
    L += ['## D Cocos MCP（UI/场景工作必需）', '',
          f"- `work/mcp-install/cocos-creator-mcp`：本机{'已有' if m['mcp_dir_present'] else '缺失'}；原机器上 "
          f"{m['mcp_dir_files_on_original']} 个文件 / {human(m['mcp_dir_bytes_on_original'])}（含依赖则偏大，可在原机器上重装）",
          f"- `outputs/cocos-mcp-workbench/extensions/cocos-creator-mcp` 软链指向 `{m['extension_link_target']}`，当前{'有效' if m['extension_link_resolves'] else '断开'}",
          f"- Cocos Creator 编辑器：{', '.join(m['cocos_creator_apps']) or '本机未发现'}（Dashboard {'已装' if m.get('cocos_dashboard_installed') else '未装'}）；127.0.0.1:3000 {'在线' if m['localhost_3000_listening'] else '未监听'}",
          f"- 启动入口：`{m['launcher']}`；清单 `restore-files-cocos-mcp.txt`", '']
    L += ['## 工具链', '', '| 工具 | 状态 | 说明 |', '|---|---|---|']
    for t in rep['tools']:
        L.append(f"| {t['name']} | {'OK' if t['ok'] else ('缺失' if t['required'] else '缺失（可选）')} | {t['detail']} |")
    L += ['', '## 在原机器上执行 rsync（清单文件位于 outputs/offline-client/，路径均相对项目根；`-a` 保证目录递归）', '',
          '```sh', f'SRC="{new}"', 'DEST=/path/to/transfer   # 或直接写本机 /Users/test0/Documents/code/2DRound', '',
          '# 核心二进制 + 缺失资源 + 验收工具', f'rsync -av --files-from=restore-files.txt "$SRC"/ "$DEST"/',
          '# luac（保守全量）', f'rsync -av --files-from=restore-files-luac.txt "$SRC"/ "$DEST"/',
          '# Cocos MCP（目录）', f'rsync -a --files-from=restore-files-cocos-mcp.txt "$SRC"/ "$DEST"/', '',
          '# 备用：新目录不可用时，改用旧路径', f'SRC_OLD="{old}"',
          'rsync -av --files-from=restore-files.txt "$SRC_OLD"/ "$DEST"/', '```', '']
    REPORT_MD.write_text('\n'.join(L), encoding='utf-8')


def run(write=True, quiet=False):
    rep, core, missing, lua, sizes = build_report()
    if write:
        REPORT_JSON.write_text(json.dumps(rep, ensure_ascii=False, indent=2), encoding='utf-8')
        write_lists(core, missing, lua, rep['cocos_mcp'], sizes)
        write_md(rep, core, missing, lua, sizes)
    if not quiet:
        s = rep['summary']
        print(f"status={rep['status']} resources: present={s['present']} in_repo={s['in_repo']} "
              f"missing={s['missing']} hash_mismatch={s['hash_mismatch']} | luac {s['luac_present']}/{s['luac_to_copy']} (conservative_full)")
        print(f"ready_for_build={s['ready_for_build']} ready_for_verify={s['ready_for_verify']} "
              f"cocos_mcp={s['ready_for_cocos_mcp_work']} visual_acceptance={s['visual_acceptance']}")
        if write:
            print('wrote', relroot(REPORT_JSON), relroot(REPORT_MD), 'and restore-files*.txt')
    return 0 if rep['status'] == 'ready' else 1


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--no-write', action='store_true', help='print summary only')
    sys.exit(run(write=not ap.parse_args().no_write))
