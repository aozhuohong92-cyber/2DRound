"""Archive hero portrait art under assets/ui/英雄/ (module layout, like 闯关/主城).

Input: the user-supplied, already-decoded archive (unzipped by the caller into an
empty directory). The decoded WebP bytes are copied unchanged; nothing is
re-extracted from the APK. Usage:
    python3 organize_heroes.py <unpacked dir containing manifest.json>
"""
from pathlib import Path
import hashlib, json, shutil, sys

ROOT = Path(__file__).resolve().parents[2]
DEST = ROOT / 'assets/ui/英雄'


def image_kind(data):
    if data[:4] == b'RIFF' and data[8:12] == b'WEBP':
        return 'webp'
    if data[:8] == b'\x89PNG\r\n\x1a\n':
        return 'png'
    return None


def main(src):
    src = Path(src)
    manifest = json.loads((src / 'manifest.json').read_text(encoding='utf-8'))
    heads, cards = DEST / '头像', DEST / '图鉴立绘'
    for folder in (heads, cards, DEST / '预览'):
        folder.mkdir(parents=True, exist_ok=True)
    rows, bad = [], []
    for image in manifest['images']:
        original = src / image['decoded']
        data = original.read_bytes()
        fmt = image_kind(data)
        if fmt is None:
            bad.append(image['path'])
            continue
        if image['path'].startswith('resource/headicon/'):
            target = heads / f"{image['id']}.{fmt}"
            kind = 'headicon'
        else:
            target = cards / f"partnercard_{image['id']}.{fmt}"
            kind = 'partnercard'
        shutil.copy2(original, target)
        digest = hashlib.sha256(data).hexdigest()
        assert hashlib.sha256(target.read_bytes()).hexdigest() == digest
        rows.append({'kind': kind, 'format': fmt, 'id': image['id'], 'logical_path': image['path'],
                     'file': str(target.relative_to(DEST)), 'sha256': digest, 'bytes': len(data),
                     'original_package_file': image['source'], 'original_package_sha256': image['source_sha256']})
    assert not bad, f'unknown image payloads: {bad[:5]}'
    for name in ('headicons-preview.jpg', 'cards-preview.jpg'):
        shutil.copy2(src / name, DEST / '预览' / name)
    (DEST / '原资源清单.json').write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding='utf-8')
    (DEST / '缺失清单.json').write_text(json.dumps({
        'note': '配置里有、但提供的素材中没有该精确路径的英雄；不代表原包没有其他编号。',
        'missing_paths': manifest['missing_hero_paths']}, ensure_ascii=False, indent=2), encoding='utf-8')
    n_head = sum(r['kind'] == 'headicon' for r in rows)
    n_card = sum(r['kind'] == 'partnercard' for r in rows)
    (DEST / 'README.md').write_text(f'''# 英雄美术（头像与图鉴立绘）

来源：用户提供的「英雄头像与图鉴立绘_原版恢复」，由本机原包资源解码得到（2026-10-13）。
本目录保存解码后的图片原字节（多数为 WebP，少数为 PNG，未转换、未裁剪，格式见 `原资源清单.json` 的 format），原包加密文件名与 SHA-256 记录在
`原资源清单.json`。共 {n_head} 张头像、{n_card} 张图鉴立绘。

| 目录 | 内容 | 逻辑路径（运行时） | 用途 |
|---|---|---|---|
| `头像/<编号>.webp 或 .png` | 英雄头像 | `resource/headicon/<编号>.png` | 英雄列表、阵容等小头像 |
| `图鉴立绘/partnercard_<编号>.webp 或 .png` | 图鉴卡片立绘 | `resource/bigbg/partnercard/partnercard_<编号>.png` | 图鉴列表卡片 |
| `预览/` | 全部图片的编号预览 | — | 人工核对 |
| `技能图标/` | 按英雄分目录的技能图标（独立归档，见其 README） | `resource/skillicon/<图标编号>.png` | 英雄详情的技能图标 |
| `缺失清单.json` | 配置有但素材里没有的精确路径 | — | 待补 |

## 规则

- 运行时一律以 `.png` 逻辑名加载；原游戏同样是「WebP/PNG 字节 + .png 扩展名」，引擎按文件头识别。
- **头像与立绘同编号不保证画的是同一人**（例：10101 头像是普通海贼，partnercard_10101 是持双剑角色）。
  图鉴按原代码 `partnercard_<bid>` 取图，不要用头像推断人物。
- 已有立绘 {n_card} 张，其余英雄图鉴卡暂用头像/文字占位；数量不是原包全部，只是按配置编号确认的结果。
- 构建时由 `outputs/offline-client/hero_art.py` 把本目录文件按逻辑路径打进 APK，
  不在仓库里另存一份运行时副本。
- 重新归档：`python3 outputs/offline-client/organize_heroes.py <解压目录>`。
''', encoding='utf-8')
    print(f'archived heads={n_head} cards={n_card} -> {DEST}')


if __name__ == '__main__':
    main(sys.argv[1])
