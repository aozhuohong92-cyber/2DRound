"""APK packaging checks for Android AssetManager requirements.

The bundled Cocos2d-x engine plays sound effects through SoundPool using
AssetManager.openFd(). That API only accepts assets that are stored
(uncompressed) and 4-byte aligned; a deflated entry fails at runtime with
"can not be opened as a file descriptor; it is probably compressed".
Audio must therefore never be deflated in the APK.
"""
from pathlib import Path
import struct, zipfile

AUDIO_EXT = ('.mp3', '.ogg', '.wav', '.m4a', '.aac', '.caf', '.wma', '.flac')


def is_audio(name):
    return str(name).lower().endswith(AUDIO_EXT)


def _stored_data_offset(raw, info):
    raw.seek(info.header_offset)
    header = raw.read(30)
    if len(header) != 30:
        raise ValueError('truncated local file header: ' + info.filename)
    name_len, extra_len = struct.unpack('<IHHHHHIIIHH', header)[9:11]
    return info.header_offset + 30 + name_len + extra_len


def audio_entries(path):
    """Yield one dict per audio entry describing compression and alignment."""
    path = Path(path)
    with zipfile.ZipFile(path) as z, path.open('rb') as raw:
        for info in z.infolist():
            if not is_audio(info.filename):
                continue
            offset = _stored_data_offset(raw, info)
            yield {'name': info.filename, 'compress_type': info.compress_type,
                   'data_offset': offset, 'aligned4': offset % 4 == 0,
                   'size': info.file_size}


def assert_audio_uncompressed(path):
    """Fail if any audio entry is deflated or misaligned; return count checked."""
    problems, checked = [], 0
    for row in audio_entries(path):
        checked += 1
        if row['compress_type'] != zipfile.ZIP_STORED:
            problems.append('%s is deflated (compress_type=%d)' % (row['name'], row['compress_type']))
        if not row['aligned4']:
            problems.append('%s is not 4-byte aligned (data offset %d)' % (row['name'], row['data_offset']))
    if problems:
        raise AssertionError('APK audio packaging check failed:\n  ' + '\n  '.join(problems))
    return checked
