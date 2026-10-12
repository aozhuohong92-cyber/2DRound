"""Archive the drama (闯关) art by category under assets/ui/闯关/, mirroring the
bottom-navigation archive. Runtime assets and layout are not modified; only
original files that already exist locally are copied (no re-extraction)."""
from pathlib import Path
import hashlib, json, plistlib, re, shutil, sys
from prepare_assets import ROOT, resolve, dependencies

PROJ = Path(__file__).resolve().parent
DEST = ROOT / 'assets/ui/闯关'
CFG = ROOT / 'outputs/lua-restored-paths/ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW'
CSB = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/'
NAV = '../../主城/底部导航/'

# Status vocabulary (same as assets/characters): 已确认 / 近似 / 占位 / 缺资源.
CONFIRMED, APPROX, PLACEHOLDER, MISSING = '已确认', '近似', '占位', '缺资源'

manifest = []      # every copied original file
missing = []       # logical paths that are not in the local resource set


def write_json(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding='utf-8')


def copy_resource(logical, folder, copied):
    """Copy a resource and its shipped dependencies under <folder>/原资源/."""
    pending = [logical]
    files = []
    while pending:
        item = pending.pop(0)
        if item in copied:
            continue
        copied.add(item)
        try:
            src = resolve(item)
        except FileNotFoundError:
            if item not in [m['logical_path'] for m in missing]:
                missing.append({'logical_path': item, 'needed_by': str(folder.relative_to(DEST))})
            continue
        data = src.read_bytes()
        target = folder / '原资源' / item
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, target)
        digest = hashlib.sha256(data).hexdigest()
        assert hashlib.sha256(target.read_bytes()).hexdigest() == digest
        row = {'file': str(target.relative_to(DEST)), 'logical_path': item,
               'original_file': str(src.relative_to(ROOT)), 'sha256': digest, 'bytes': len(data)}
        manifest.append(row)
        files.append(row)
        pending.extend(dependencies(item, data))
    return files


def frame_info(plist_logical, names):
    frames = plistlib.loads(resolve(plist_logical).read_bytes())['frames']
    return {n: (frames[n + '.png'] if n + '.png' in frames else None) for n in names}


def item_icons(ids):
    """item id -> (name, icon) from the recovered item tables."""
    found = {}
    for path in CFG.glob('item_data*.lua'):
        text = path.read_text(encoding='utf-8', errors='ignore')
        for i in ids:
            m = re.search(r'\[%d\.0\] = "\{%d, \\"([^"\\]+)\\", (\d+),' % (i, i), text)
            if m and i not in found:
                found[i] = {'name': m.group(1), 'icon': int(m.group(2))}
    return found


def section(number, name, items, notes, readme_extra=''):
    folder = DEST / f'{number:02d}_{name}'
    folder.mkdir(parents=True, exist_ok=True)
    write_json(folder / '说明.json', {'category': name, 'items': items, 'notes': notes})
    rows = '\n'.join(f"| {i['name']} | {i['status']} | {i.get('source', '')} |" for i in items)
    (folder / 'README.md').write_text(
        f'# {number:02d} {name}\n\n| 内容 | 状态 | 来源 |\n|---|---|---|\n{rows}\n\n'
        + '\n'.join('- ' + n for n in notes) + '\n' + readme_extra, encoding='utf-8')
    return folder


def main():
    DEST.mkdir(parents=True, exist_ok=True)
    # Keep the first-version entry notes, which described only enter/return.
    history = DEST / '历史'
    history.mkdir(exist_ok=True)
    for old, new in (('README.md', '第一版入口与返回说明.md'), ('资源清单.json', '第一版资源清单.json')):
        if (DEST / old).exists() and not (history / new).exists():
            shutil.copy2(DEST / old, history / new)

    copied = set()
    battledrama = frame_info('resource/battledrama/battledrama.plist', [
        'battledrama_1001', 'battledrama_1010', 'battledrama_1013', 'battledrama_1016', 'battledrama_1018',
        'battledrama_1020', 'battledrama_1014', 'battledrama_1021', 'battledrama_1024', 'battledrama_1038',
        'battledrama_resoure_1', 'battledrama_resoure_2', 'battledrama_resoure_3', 'battledrama_resoure_4',
        'battledrama_2001', 'battledrama_2005'])
    common = frame_info('resource/common/common.plist', ['txt_cn_common_90022', 'common_1056'])
    icons = item_icons([1, 3, 5, 7, 22, 10001, 29903])

    # 01 背景
    f = section(1, '背景', [
        {'name': '远层森林 m_bg.jpg', 'status': CONFIRMED, 'source': 'resource/bigbg/battle_bg/10008/m_bg.jpg；原坐标 y=736'},
        {'name': '近层森林 map_bg.png', 'status': CONFIRMED, 'source': 'resource/bigbg/battle_bg/10008/map_bg.png；原坐标 y=40，横向重复'},
        {'name': '顶部装饰 pattern_3.png', 'status': APPROX, 'source': 'resource/bigbg/pattern/pattern_3.png；文件存在，用途待取证'},
    ], ['背景音乐 b_001（battle_bg_data.lua:270），未接入。', '近层底部 380px 为面板后的村落，预览时裁掉。'])
    for logical in ('resource/bigbg/battle_bg/10008/m_bg.jpg', 'resource/bigbg/battle_bg/10008/map_bg.png',
                    'resource/bigbg/pattern/pattern_3.png'):
        copy_resource(logical, f, copied)

    # 02 顶部栏
    section(2, '顶部栏', [
        {'name': '头像容器 head_container', 'status': APPROX, 'source': 'mainui_view.csb/top_container；头像图为 CSB 示例'},
        {'name': '昵称 name_label / 等级 lev_label', 'status': APPROX, 'source': '参考图示例值：流年灬贝克 / 124'},
        {'name': '战力 fight_label', 'status': APPROX, 'source': '参考图示例值：1643'},
        {'name': '金币/钻石/第三货币 wealth_label_1..3', 'status': APPROX, 'source': '参考图示例值：8000 / 3601 / 181'},
        {'name': '经验条 exp_bar', 'status': APPROX, 'source': 'mainui_view.csb'},
    ], ['复用主城同一个 mainui_view.csb 与 mainui/common 图集，不在此重复拷贝：见 ' + NAV + '共用原资源/。',
        '数值来自 src/offline/drama_reference.lua，仅显示，不写存档。',
        '闯关页隐藏了活动/红包/提示等主城专属容器。'])

    # 03 右上图标
    f = section(3, '右上图标', [
        {'name': '世界等级按钮「世」', 'status': APPROX, 'source': 'common.plist txt_cn_common_90022；参考图为文字按钮',
         'frame': common['txt_cn_common_90022']},
        {'name': '通关奖励', 'status': APPROX, 'source': 'battledrama_1018 + 底 battledrama_1020', 'frame': battledrama['battledrama_1018']},
        {'name': '日常任务', 'status': APPROX, 'source': 'battledrama_1016 + 底 battledrama_1020', 'frame': battledrama['battledrama_1016']},
        {'name': '小地图外圈/遮罩/旗标', 'status': APPROX, 'source': 'battledrama_1001 / 1010 / 1013'},
        {'name': '小地图底图', 'status': MISSING, 'source': 'resource/bigbg/battle_bg/10008/blayer/small_map.jpg'},
        {'name': '远航节点（远航 200）', 'status': MISSING, 'source': CSB + 'battledrama/battle_drama_qingbao_node.csb；进度环 battledrama_1021'},
        {'name': '在线礼包（钻石 5000 可领取）', 'status': PLACEHOLDER, 'source': 'online_gift_node；礼包底图未取证；钻石图标 resource/item/3.png 本机已有，尚未接入'},
    ], ['图集帧矩形见 说明.json 的 frame 字段；帧在原包加密图集中，不能单独当 PNG 预览。',
        '布局为参考图 900×2000 ×0.8 的设计坐标，已本地构建、未做设备截图验证。'])
    copy_resource('resource/battledrama/battledrama.plist', f, copied)
    write_json(f / '图集帧参数.json', {**battledrama, **common})

    # 04 战场
    f = section(4, '战场', [
        {'name': '我方：路飞 H30104', 'status': CONFIRMED, 'source': '../../characters/路飞/（stand2/action1/action2/hurt/run）'},
        {'name': '命中特效 E80008 / E80009', 'status': CONFIRMED, 'source': '../../characters/路飞/（技能演出已接入）'},
        {'name': '敌方：海贼1号 H30012（首关）', 'status': MISSING, 'source': 'unit_data1.lua:22257；resource Spine 未在本机'},
        {'name': '敌方：索隆组 H30022（伟大航路3）', 'status': MISSING, 'source': 'unit_data1.lua；101031/101032 body_id'},
        {'name': '敌方占位牌', 'status': PLACEHOLDER, 'source': 'src/offline/drama_battle_view.lua'},
        {'name': '血条', 'status': PLACEHOLDER, 'source': '参考图红条；battle_boss_hp_progress.csb 仅用于技能演示'},
    ], ['固定回放只用路飞作为测试角色，不计算伤害。', '参考图中的三个战斗角色模型编号未取证。'])

    # 05 收益挂机
    f = section(5, '收益挂机', [
        {'name': '每分钟收益图标 resoure_1..4', 'status': APPROX, 'source': 'battledrama_resoure_1..4（帧存在，对应关系待核）'},
        {'name': '收益文字 10/m 210/m 35/m 10/m', 'status': APPROX,
         'source': 'hook_items of 10030 = {{5,10},{22,35},{1,210},{7,10}}'},
        {'name': '挂机UP', 'status': PLACEHOLDER, 'source': '原控件未取证'},
        {'name': '资源收集面板', 'status': MISSING, 'source': CSB + 'battle/battle_resources_collect.csb'},
        {'name': '宝箱 Spine + 12:00', 'status': MISSING, 'source': 'effect 282；CSB 缺'},
    ], ['物品图标走 resource/item/<icon>.png，见 缺资源清单.json。'])

    # 06 底部面板
    f = section(6, '底部面板', [
        {'name': '面板 battle_button_list.csb', 'status': CONFIRMED, 'source': CSB + 'battle/battle_button_list.csb（真机已加载）'},
        {'name': '标题 title_pass「伟大航路3」/ 描述《ONE PIECE》', 'status': APPROX, 'source': 'title_pass 节点；描述为代码内创建，覆盖显示'},
        {'name': '详情 / 快速挂机 / 奖励栏框 / WANTED 板', 'status': APPROX, 'source': 'CSB 内节点，P0 曾隐藏，参考模式重新显示，位置未设备验证'},
        {'name': '挑战BOSS 按钮', 'status': CONFIRMED, 'source': 'guildsign_battle_boss_btn；仅入口门控 + 固定回放'},
        {'name': '奖励 4 格图标', 'status': MISSING, 'source': 'resource/item/{3,7,10001,29997}.png；仅 3.png（钻石）本机已有，其余 3 个缺'},
        {'name': 'BOSS 悬赏人像', 'status': MISSING, 'source': 'resource/headicon/b<head_icon>.jpg'},
        {'name': '「我要变强」encounter_btn', 'status': PLACEHOLDER, 'source': '参考图无此项，保持隐藏'},
    ], ['面板位置 panel:setPosition(width/2, -33)，层级 5，低于底栏 10。',
        '奖励 show_items 前 4 项：钻石、远航情报、突破卡、3星随机碎片。'])
    copy_resource(CSB + 'battle/battle_button_list.csb', f, copied)
    copy_resource('resource/battle/battle.plist', f, copied)

    # 07 底栏
    section(7, '底栏', [
        {'name': '七槽底栏 + 中央草帽 action1', 'status': CONFIRMED, 'source': NAV + 'README.md（用户已确认，保持不变）'},
    ], ['闯关页完整复用主城底栏；点击「主城」返回。', '不要在此目录重复拷贝或改动，修改请回到主城/底部导航基准。'])

    # missing list: required-but-absent resources, with where they are used
    needed = [
        (CSB + 'battle/battle_resources_collect.csb', '05_收益挂机', 'battle_drama_top_view.lua:1444'),
        (CSB + 'battledrama/battle_drama_qingbao_node.csb', '03_右上图标', 'battle_drama_top_view.lua:1042'),
        ('resource/bigbg/battle_bg/10008/blayer/small_map.jpg', '03_右上图标', 'battle_drama_top_view.lua:921'),
        ('resource/headicon/b20101.jpg', '06_底部面板', 'battle_drama_top_view.lua:1812（101031 head_icon=20101）'),
        ('v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/H30022/stand2.skel', '04_战场', 'unit_data1.lua（敌方 body_id）'),
        ('v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/H30012/stand2.skel', '04_战场', 'unit_data1.lua:22257'),
    ] + [(f'resource/item/{icon}.png', '06_底部面板/05_收益挂机', f'item {iid} {name}')
         for iid, (name, icon) in ((i, (v['name'], v['icon'])) for i, v in sorted(icons.items()))]
    absent, rows = [], []
    for logical, used_by, where in needed:
        try:
            resolve(logical)
            status = '本机已有'
        except FileNotFoundError:
            status = MISSING
            absent.append(logical)
        rows.append({'logical_path': logical, 'used_by': used_by, 'where': where, 'status': status})
    needed = rows
    write_json(DEST / '缺资源清单.json', {
        'note': '这些文件在本机资源集中不存在；占位显示。需从原机器 apk-extracted 拷回，不要重新解包 APK。',
        'items': needed, 'absent_count': len(absent)})

    write_json(DEST / '原资源清单.json', manifest)
    (DEST / 'README.md').write_text(f'''# 闯关界面美术（按类别归档）

参考画面：用户提供的闯关截图（伟大航路3，900×2000）。每个子目录是一类美术，
含 `说明.json`（逐项状态、来源、帧参数）与 `README.md`；已有的原资源按原逻辑路径
放在 `原资源/` 下（原加密字节，不是可直接预览的 PNG）。

| 目录 | 内容 | 状态概览 |
|---|---|---|
| [01_背景](01_背景/README.md) | 森林远/近层、顶部装饰 | 已确认 |
| [02_顶部栏](02_顶部栏/README.md) | 头像、昵称、战力、货币 | 近似（示例值） |
| [03_右上图标](03_右上图标/README.md) | 世界等级、通关奖励、日常任务、小地图、远航 | 近似 / 缺资源 |
| [04_战场](04_战场/README.md) | 我方路飞、敌方、血条 | 路飞已确认，敌方缺资源 |
| [05_收益挂机](05_收益挂机/README.md) | 每分钟收益、挂机UP、宝箱 | 近似 / 缺资源 |
| [06_底部面板](06_底部面板/README.md) | 标题、奖励栏、WANTED、挑战BOSS | 面板已确认，图标缺资源 |
| [07_底栏](07_底栏/README.md) | 七槽底栏 | 已确认，保持不变 |

状态词：**已确认**（已在真机/模拟器加载验证）、**近似**（用已有资源或示例值还原，
未逐像素对齐或未设备验证）、**占位**（带标签的占位块）、**缺资源**（本机没有该文件）。

## 索引

- `原资源清单.json`：每个已拷贝文件的逻辑路径、原文件、SHA256（共 {len(manifest)} 个）。
- `缺资源清单.json`：需从原机器拷回的文件（{len(absent)} 个本机缺失）。
- `历史/`：第一版（入口与返回）的说明和清单，保留不改。

## 代码映射

| 文件 | 作用 |
|---|---|
| `src/offline/drama_scene.lua` | 场景、背景、原按钮 CSB、挑战入口 |
| `src/offline/drama_reference.lua` / `drama_reference_view.lua` | 参考截图示例值与右上/收益/奖励布局 |
| `src/offline/drama_catalog.lua` | 10010 / 10030 关卡字段（带来源） |
| `src/offline/drama_replay.lua` / `drama_battle_view.lua` / `drama_record.lua` | 固定回放状态机、视图、独立测试记录 |
| `src/offline/main_city.lua` | 复用主城顶部栏与底栏 |

整理脚本：`python3 outputs/offline-client/organize_drama.py`（只读本地已有资源，重跑会覆盖本目录生成物）。
''', encoding='utf-8')
    print(f'archived {len(manifest)} files, {len(absent)} missing: {DEST}')


if __name__ == '__main__':
    main()
