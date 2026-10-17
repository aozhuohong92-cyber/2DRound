"""Hero portrait art packaging: maps the archive under assets/ui/英雄/ to the
logical paths the game code loads (resource/headicon/<id>.png and
resource/bigbg/partnercard/partnercard_<id>.png)."""
from pathlib import Path
import re
from prepare_assets import canonical_archive

ROOT = Path(__file__).resolve().parents[2]
ART = ROOT / 'assets/ui/英雄'


def iter_hero_art():
    """Yield (apk entry name, local file).

    The engine resolves logical names through the resource hash, so the payload is
    stored under assets/HASH/<h0>/<hash>.png exactly where the original game keeps it
    (here with the already decoded image bytes)."""
    if (ART / '头像').is_dir():
        for p in sorted((ART / '头像').iterdir()):
            if p.suffix in ('.webp', '.png'):
                yield canonical_archive(f'resource/headicon/{p.stem}.png'), p
    if (ART / '图鉴立绘').is_dir():
        for p in sorted((ART / '图鉴立绘').iterdir()):
            if p.suffix in ('.webp', '.png'):
                yield canonical_archive(f'resource/bigbg/partnercard/{p.stem}.png'), p
    # Skill icons: one APK entry per unique icon id (hero folders repeat shared icons).
    skills = ART / '技能图标'
    if skills.is_dir():
        seen = set()
        for p in sorted(skills.glob('*/*.png')):
            m = re.search(r'图标(\d+)\.png$', p.name)
            if m and m.group(1) not in seen:
                seen.add(m.group(1))
                yield canonical_archive(f'resource/skillicon/{m.group(1)}.png'), p
    # Panel portraits: our own logical path (the original game has no such resource name).
    portraits = ART / '面板人物'
    if portraits.is_dir():
        for p in sorted(portraits.glob('*.png')):
            m = re.match(r'^(\d+)_', p.name)
            if m:
                yield canonical_archive(f'resource/heroportrait/{m.group(1)}.png'), p
