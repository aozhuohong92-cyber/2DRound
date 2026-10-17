"""Archive hero skill icons under assets/ui/英雄/技能图标/ (module layout).

Input: the user-supplied package (already unzipped by the caller into an empty directory,
the folder that contains manifest.json). Files are copied unchanged. Usage:
    python3 organize_skill_icons.py <unpacked dir containing manifest.json>
"""
from pathlib import Path
import hashlib, json, re, shutil, sys

ROOT = Path(__file__).resolve().parents[2]
DEST = ROOT / 'assets/ui/英雄/技能图标'
PNG = b'\x89PNG\r\n\x1a\n'


def main(src):
    src = Path(src)
    manifest = json.loads((src / 'manifest.json').read_text(encoding='utf-8'))
    if DEST.exists():
        shutil.rmtree(DEST)
    DEST.mkdir(parents=True)
    rows, icons = [], {}
    for folder in sorted(p for p in src.iterdir() if p.is_dir()):
        (DEST / folder.name).mkdir()
        for f in sorted(folder.iterdir()):
            data = f.read_bytes()
            if f.suffix == '.png':
                assert data[:8] == PNG, f'not a PNG: {f}'
                icon = re.search(r'图标(\d+)\.png$', f.name)
                assert icon, f'unexpected file name: {f.name}'
                digest = hashlib.sha256(data).hexdigest()
                # The same icon id must always carry the same bytes.
                assert icons.setdefault(icon.group(1), digest) == digest, f'conflicting icon {icon.group(1)}'
                rows.append({'hero_folder': folder.name, 'file': f'{folder.name}/{f.name}',
                             'icon_id': int(icon.group(1)), 'sha256': digest, 'bytes': len(data)})
            shutil.copy2(f, DEST / folder.name / f.name)
    for name in ('manifest.csv', 'manifest.json', '全部技能图标总览.jpg'):
        shutil.copy2(src / name, DEST / name)
    shutil.copy2(src / '说明.md', DEST / '来源说明.md')
    (DEST / '原资源清单.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
    counts = manifest['counts']
    (DEST / 'README.md').write_text(f'''# 英雄技能图标

来源：用户提供的「英雄技能图标.zip」（由原包资源解码整理，2026-10-17）。文件按英雄分目录，
`<英雄编号>_<英雄名>/<技能槽>_<技能名>_<技能编号>_图标<图标编号>.png`，内容原样保留。

| 项 | 数量 |
|---|---|
| 英雄配置 | {counts['hero_configs']} |
| 有技能图标的英雄 | {counts['heroes_with_skill_icons']} |
| 无技能配置的英雄（蛋头岛占位，目录里只有 `缺失说明.txt`） | {counts['heroes_without_skill_config']} |
| 技能槽图标 | {counts['skill_slots']} |
| 唯一图标（按图标编号） | {counts['unique_icons']} |

## 规则

- 运行时逻辑路径是 `resource/skillicon/<图标编号>.png`；构建时由 `hero_art.py` 按图标编号去重后打进 APK
  （原游戏的哈希路径，PNG 字节），仓库里不另存运行时副本。
- 3 个原包缺失的图标（30031、54900、405181）用默认普通攻击图标 20000 的图像顶替，详见 `manifest.json`。
- 索隆(新世界)第 5 槽引用的技能编号 227404 在技能表里不存在，没有图标，未伪造。
- 8 个蛋头岛英雄原客户端没有技能表，因此目录为空。
- `manifest.csv` 便于筛选；`原资源清单.json` 记录每个文件的 SHA-256；`全部技能图标总览.jpg` 用于人工核对。
- 重新归档：`python3 outputs/offline-client/organize_skill_icons.py <解压目录>`。
''', encoding='utf-8')
    print(f'archived files={len(rows)} unique_icons={len(icons)} -> {DEST}')


if __name__ == '__main__':
    main(sys.argv[1])
