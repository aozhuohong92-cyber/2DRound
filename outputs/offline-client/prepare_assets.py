"""Resolve original asset dependencies without copying or changing source assets."""
from pathlib import Path, PurePosixPath
import hashlib, json, os, plistlib, re, subprocess, sys
PROJ = Path(__file__).resolve().parent
ROOT = PROJ.parents[1]
APK_EXTRACTED = Path(os.environ.get('OFFLINE_APK_EXTRACTED', ROOT / 'outputs/apk-extracted'))
# Repo-archived copies of original resources; usable only when the SHA256 matches asset-manifest.json.
REPO_ROOTS = [ROOT / 'assets', PROJ / 'assets']
sys.path.insert(0, str(ROOT / 'outputs/recovery-tools'))
from resource_hash import resource_hash
SPINE = 'v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/H30104/'
CSB = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battle/battle_boss_hp_progress.csb'
SEEDS = ['resource/bigbg/battle_bg/10032/b_bg.jpg', 'fonts/mini.ttf', CSB]
SEEDS += [SPINE + action + '.' + ext for action in ('stand2', 'action1', 'action2', 'hurt', 'run', 'action9') for ext in ('skel', 'atlas')]

SEEDS += ['sound/battle/'+s+'.mp3' for s in ('b_dirk1','b_effect_cut01','b_effect_cut02','b_baoqi1','b_skill_sprint')]

SEEDS += ['v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/'+id+'/action.'+ext for id in ('E80008','E80009','E54320') for ext in ('skel','atlas')]

# Stage 2 (main city -> naming -> basic summon -> formation). CSB paths follow
# PathTool.getTargetCSB(); atlas/frames follow PathTool.getTargetRes()/getPlistImgForDownLoad().
CSB_DIR = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/'
STAGE2 = [
    CSB_DIR + 'mainui/mainui_view.csb', 'resource/mainui/mainui.plist',
    'resource/common/common.plist', 'resource/centerscene/centerscene.plist',
    CSB_DIR + 'roleinfo/role_setname_view.csb', 'resource/face/face.plist',
    CSB_DIR + 'recruithero/recruit_hero_window.csb', 'resource/recruithero/recruithero.plist',
    CSB_DIR + 'hero/formation_select_panel.csb', 'resource/form/form.plist',
]
STAGE2 += ['resource/centerscene/centercity/1/' + name for name in ('1.png', '2.png', '3.png', '4.jpg')]
STAGE2 += ['v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E51130/action.' + ext for ext in ('skel', 'atlas')]
SEEDS += STAGE2

# Stage 3: main-city drama entry preview. The default drama destination is the
# battle scene (not the chapter-map popup): Darma -> BattleController:createMap
# -> BattleSceneNewView:createHorizontalMap -> BattleDramaController:openBattleDramaUI.
STAGE3 = [
    CSB_DIR + 'battle/battle_button_list.csb',
    'resource/battle/battle.plist',
    'resource/battledrama/battledrama.plist',
    'resource/bigbg/pattern/pattern_3.png',
    'resource/bigbg/battle_bg/10008/m_bg.jpg',
    'resource/bigbg/battle_bg/10008/map_bg.png',
    # Item icon used by the reference drama screen (diamond); other item icons are not local.
    'resource/item/3.png',
]
SEEDS += STAGE3

_repo_index = None
_expected = None

def _sha256_file(p):
    h = hashlib.sha256()
    with open(p, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()

def _manifest_resources():
    """Expected sha256/bytes per resource. The committed (HEAD) manifest wins over the working
    copy, which every prepare() run rewrites with whatever it found."""
    out = {}
    try:
        out.update(json.loads((PROJ / 'asset-manifest.json').read_text())['resources'])
    except (OSError, ValueError, KeyError):
        pass
    try:
        r = subprocess.run(['git', 'show', 'HEAD:outputs/offline-client/asset-manifest.json'],
                           cwd=ROOT, capture_output=True, timeout=10)
        if r.returncode == 0:
            out.update(json.loads(r.stdout)['resources'])
    except (OSError, subprocess.SubprocessError, ValueError, KeyError):
        pass
    return out

def _expected_sha(name):
    global _expected
    if _expected is None:
        _expected = {k: (v.get('sha256'), v.get('bytes')) for k, v in _manifest_resources().items()}
    return (_expected.get(name) or (None, None))[0]

def _repo_fallback(name):
    """Return a repo-archived file whose SHA256 equals the recorded one, else None.
    A same-named repo file with different bytes is an error, never a silent substitute."""
    global _repo_index
    expected = _expected_sha(name)
    if not expected:
        return None
    if _repo_index is None:
        # Only files whose size matches some expected resource can possibly match; hash just those.
        sizes = {b for _, b in _expected.values() if b is not None}
        _repo_index = {}
        for root in REPO_ROOTS:
            for f in sorted(root.rglob('*')) if root.is_dir() else []:
                if f.is_file() and (not sizes or f.stat().st_size in sizes):
                    _repo_index.setdefault(_sha256_file(f), f)
    hit = _repo_index.get(expected)
    if hit:
        return hit
    for root in REPO_ROOTS:
        for f in (root.rglob(PurePosixPath(name).name) if root.is_dir() else []):
            if f.is_file() and f.as_posix().endswith('/' + name):
                raise ValueError(f'SHA256 mismatch for fallback {name}: {f} is {_sha256_file(f)}, expected {expected}')
    return None

def resolve(name):
    if name.startswith('/') or '..' in PurePosixPath(name).parts:
        raise ValueError('Unsafe resource path: ' + name)
    h = resource_hash(name)
    p = APK_EXTRACTED / 'assets/HASH' / h[0] / (h + PurePosixPath(name).suffix)
    if not p.is_file():
        fb = _repo_fallback(name)
        if fb is None:
            raise FileNotFoundError(name + ' -> ' + str(p))
        return fb
    return p

def canonical_archive(name):
    h = resource_hash(name)
    return 'assets/HASH/' + h[0] + '/' + h + PurePosixPath(name).suffix

def source_path(row):
    """Local file to pack for a manifest row: the repo fallback when one was used."""
    return ROOT / (row.get('fallback_from') or row['source'])

def dependencies(name, data):
    parent = PurePosixPath(name).parent
    if name.endswith('.atlas'):
        lines = data.decode('utf-8-sig').splitlines()
        # A page name occurs at the beginning of each blank-line-separated block.
        return [str(parent / line.strip()) for i, line in enumerate(lines)
                if line.strip() and (i == 0 or not lines[i-1].strip()) and ':' not in line]
    if name.endswith('.plist'):
        meta = plistlib.loads(data).get('metadata', {})
        page = meta.get('textureFileName') or meta.get('realTextureFileName')
        return [str(parent / page)] if page else [str(PurePosixPath(name).with_suffix('.png'))]
    if name.endswith('.csb'):
        # Frame names are resolved through the referenced plist; only full paths are files.
        refs = re.findall(rb'[A-Za-z0-9_./-]+\.(?:png|jpg|plist|ttf|csb)', data)
        return sorted({s.decode() for s in refs if b'/' in s})
    return []

def prepare():
    # Declared seeds are required; dependencies discovered inside CSB/atlas/plist are best-effort,
    # because CocosStudio CSB files also reference editor defaults (e.g. Default/Button_Disable.png)
    # that were never shipped as hashed assets.
    pending = [(name, True) for name in SEEDS]
    rows, unresolved = {}, []
    while pending:
        name, required = pending.pop(0)
        if name in rows:
            continue
        try:
            p = resolve(name)
        except (FileNotFoundError, ValueError) as e:
            if required:
                raise
            if isinstance(e, ValueError):
                print('WARNING: optional dependency skipped:', e, file=sys.stderr)
            unresolved.append(name)
            continue
        data = p.read_bytes()
        deps = dependencies(name, data)
        archive = canonical_archive(name)
        # Record where the bytes really came from, so an OFFLINE_APK_EXTRACTED override stays usable.
        src = p if APK_EXTRACTED in p.parents else ROOT / 'outputs/apk-extracted' / archive
        row = {'source': str(src.relative_to(ROOT)) if ROOT in src.parents else str(src), 'archive': archive,
               'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(), 'dependencies': deps}
        if APK_EXTRACTED not in p.parents:
            row['fallback_from'] = str(p.relative_to(ROOT))
        rows[name] = row
        pending.extend((dep, False) for dep in deps)
    report = {'status': 'dependencies_resolved_runtime_pending', 'resources': rows,
              'unresolved_dependencies': sorted(set(unresolved)),
              'model': 'H30104', 'partner_id': 20510,
              'notes': 'Original partner_data 20510_5 maps to H30104. Runtime rendering remains unverified.'}
    (PROJ / 'asset-manifest.json').write_text(json.dumps(report, ensure_ascii=False, indent=2))
    return rows

if __name__ == '__main__':
    rows = prepare()
    print(f'{len(rows)} resources resolved, {sum(r["bytes"] for r in rows.values())} bytes; runtime pending')
