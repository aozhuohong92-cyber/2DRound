"""Archive the accepted bottom navigation without modifying runtime assets or layout."""
from pathlib import Path
import hashlib, json, plistlib, shutil
from prepare_assets import ROOT, resolve, dependencies
PROJ = Path(__file__).resolve().parent
DEST = ROOT / 'outputs/界面资源/主城/底部导航'

def write_json(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2))

def main():
    DEST.mkdir(parents=True, exist_ok=True)
    atlas = plistlib.loads(resolve('resource/mainui/mainui.plist').read_bytes())['frames']
    slots = [(1,'主城',50,12),(2,'英雄',150,66),(3,'背包',250,66),(4,'中央草帽骷髅',360,63),(5,'历练',470,66),(6,'公会',570,66),(7,'神技',670,66)]
    manifest = []
    def copy_resource(logical, destination):
        src = resolve(logical)
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, destination)
        digest = hashlib.sha256(src.read_bytes()).hexdigest()
        assert hashlib.sha256(destination.read_bytes()).hexdigest() == digest
        manifest.append({'file': str(destination.relative_to(DEST)), 'logical_path': logical,
                         'original_file': str(src.relative_to(ROOT)), 'sha256': digest, 'bytes': src.stat().st_size})
    # CSB and all shipped transitive dependencies preserve exact frame references.
    csb = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/mainui/mainui_view.csb'
    queue = [csb, 'resource/mainui/mainui.plist', 'resource/common/common.plist']
    seen = set()
    unresolved = []
    while queue:
        logical = queue.pop(0)
        if logical in seen: continue
        seen.add(logical)
        try:
            src = resolve(logical)
        except FileNotFoundError:
            unresolved.append(logical)
            continue
        copy_resource(logical, DEST/'共用原资源'/logical)
        queue.extend(dependencies(logical, src.read_bytes()))
    write_json(DEST/'原CSB未随包提供的依赖.json', unresolved)
    rows=[]
    for index, name, x, y in slots:
        folder = DEST/f'{index:02d}_{name}'
        folder.mkdir(exist_ok=True)
        row={'slot':index,'name':name,'node':f'bottom_container/mainui_tab_{index}',
             'position':{'x':x,'y':y},'source':'Original mainui_view.csb; positions retained unchanged.',
             'shared_assets':'../共用原资源/','status':'真机外观已确认；不代表页面功能已实现'}
        if index != 4:
            frame=f'txt_cn_mainui_200{index}.png'
            assert frame in atlas
            row['icon_frame']=frame
            row['frame_metadata']={key:atlas[key] for key in [frame,'mainui_1022.png','mainui_1023.png']}
            row['normal_frame']='mainui_1022.png';row['selected_frame']='mainui_1023.png'
        else:
            row['effect']={'id':310,'model':'E51130','file':'action','idle_animation':'action1',
                           'selected_animation_from_original_code':'action2','scale':1.3,'position':{'x':5,'y':10},
                           'parent':'mainui_tab_4/icon','verified_animation':'action1'}
            logical='v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E51130/action'
            pending=[logical+'.skel',logical+'.atlas'];copied=set()
            while pending:
                item=pending.pop(0)
                if item in copied:continue
                copied.add(item);src=resolve(item)
                copy_resource(item,folder/'原动画'/Path(item).name)
                pending.extend(dependencies(item,src.read_bytes()))
        write_json(folder/'图标说明.json',row);rows.append(row)
        (folder/'README.md').write_text(f'# {index:02d} {name}\n\n节点：`{row["node"]}`；原坐标：({x}, {y})。\n\n'+('原动画在本目录 `原动画/`，默认 action1、缩放1.3。' if index==4 else f'图标帧：`{row["icon_frame"]}`，使用 `../共用原资源/resource/mainui/mainui.plist` 及同名 PNG。图片为原包加密图集，不是可单独直接打开的 PNG；帧矩形、旋转等参数见图标说明.json。')+'\n\n保持当前图标和位置不变；共享图集不要重复裁切或替换。\n')
    frozen=DEST/'已确认版本';frozen.mkdir(exist_ok=True)
    for rel in ['src/offline/main_city.lua','src/main.lua','stage2-device/maincity-aligned.png','stage2-device/maincity-aligned.log','stage2-device/alignment-verification.json']:
        shutil.copy2(PROJ/rel, frozen/Path(rel).name)
    write_json(DEST/'图标索引.json',rows)
    write_json(DEST/'原资源清单.json',manifest)
    table='\n'.join(f'| {i} | [{name}](./{i:02d}_{name}/README.md) | '+('E51130 / action1' if i==4 else f'txt_cn_mainui_200{i}.png')+' |' for i,name,_,_ in slots)
    (DEST/'README.md').write_text('''# 主城底部导航（已确认，保持不变）

用户已确认当前底部图标。后续开发保持七个槽位、原图标及中央动画不变；如需调整，先以此目录中的真机截图和配置为基准。此目录仅为归档，不改变应用的运行资源。

| 槽位 | 分类 | 原资源 |
|---|---|---|
'''+table+'''

## 查找与复用

- 各图标独立目录保存节点、原坐标、帧名和原plist帧参数。
- 六个普通图标共用原版 mainui 图集；中央草帽骷髅使用独立 Spine 动画。不要把中央槽位的圆形底图 mainui_1024.png 当作完整图标。
- 共用原资源保留完整 CSB、图集及依赖，避免拆分破坏原引擎加载。原图片保留加密字节，不能直接当普通 PNG 预览。
- 已确认版本保存真机全屏截图、日志、APK哈希及当前Lua布局快照；不是运行入口，不应反向覆盖开发代码。
- 原资源清单.json 记录每个文件的逻辑路径、原文件和 SHA256；图标索引.json 可按槽位检索。
- action1外观和中央点击已真机验证；action2仅由原代码确认，未单独验收。图标存在不代表关卡等功能已接通。

整理脚本：`python3 outputs/offline-client/organize_navigation.py`。本次生成后作为已确认基准保留；脚本重跑会更新快照，应在有意更新基准时才运行。
''')
    print(f'Archived {len(slots)} slots and {len(manifest)} original resources: {DEST}')
if __name__=='__main__':main()
