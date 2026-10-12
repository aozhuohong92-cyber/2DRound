"""Resolve original asset dependencies without copying or changing source assets."""
from pathlib import Path, PurePosixPath
import hashlib, json, plistlib, re, sys
PROJ = Path(__file__).resolve().parent
ROOT = PROJ.parents[1]
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
]
SEEDS += STAGE3

def resolve(name):
    if name.startswith('/') or '..' in PurePosixPath(name).parts:
        raise ValueError('Unsafe resource path: ' + name)
    h = resource_hash(name)
    p = ROOT / 'outputs/apk-extracted/assets/HASH' / h[0] / (h + PurePosixPath(name).suffix)
    if not p.is_file():
        raise FileNotFoundError(name + ' -> ' + str(p))
    return p

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
        except FileNotFoundError:
            if required:
                raise
            unresolved.append(name)
            continue
        data = p.read_bytes()
        deps = dependencies(name, data)
        rows[name] = {'source': str(p.relative_to(ROOT)),
                      'archive': 'assets/' + str(p.relative_to(ROOT / 'outputs/apk-extracted/assets')),
                      'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(), 'dependencies': deps}
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
