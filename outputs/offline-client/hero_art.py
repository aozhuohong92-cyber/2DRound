"""Hero portrait art packaging: maps the archive under assets/ui/英雄/ to the
logical paths the game code loads (resource/headicon/<id>.png and
resource/bigbg/partnercard/partnercard_<id>.png)."""
from pathlib import Path
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
