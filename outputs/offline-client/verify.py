"""Local stage-1 validation; never installs an APK or accesses a phone."""
from pathlib import Path
import argparse, ctypes, hashlib, json, plistlib, re, shutil, subprocess, sys, tempfile, zipfile
from bundle import bundle
from pack_lua import encode
from prepare_assets import prepare, source_path
from zipcheck import assert_audio_uncompressed
PROJ = Path(__file__).resolve().parent
ROOT = PROJ.parents[1]
BUILD = ROOT / 'work/offline-build'
def find_luajit():
    # First candidate that actually executes: the bundled work/ binary may be the wrong CPU arch.
    for cand in (ROOT / 'work/tools/LuaJIT-2.1/src/luajit', shutil.which('luajit')):
        if cand and Path(cand).is_file():
            try:
                if subprocess.run([str(cand), '-e', 'os.exit(0)'], capture_output=True, timeout=10).returncode == 0:
                    return Path(cand)
            except (OSError, subprocess.SubprocessError):
                pass
    return None
LUA = find_luajit()

def verify(apk=False):
    if LUA is None:
        sys.exit('luajit not found (work/tools/LuaJIT-2.1 or PATH). Run: python3 outputs/offline-client/check_env.py')
    resources = prepare()
    source, modules = bundle(PROJ, resources)
    BUILD.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='stage1-', dir=BUILD) as temp:
        temp = Path(temp)
        script = temp / 'main.lua'
        script.write_bytes(source)
        subprocess.run([str(LUA), '-e', 'assert(loadfile(arg[0])); os.exit(0)', '--', str(script)], check=True)
        result = subprocess.run([str(LUA), str(PROJ / 'tests/test_core.lua'), str(PROJ), str(temp)],
                                check=True, text=True, capture_output=True)
        print(result.stdout, end='')
        subprocess.run([str(LUA), str(PROJ / 'tests/test_skills.lua'), str(PROJ)], check=True)
        libpath = temp / 'decoder.dylib'
        subprocess.run(['clang', '-O2', '-shared', '-o', str(libpath), str(ROOT / 'outputs/recovery-tools/decode.c')], check=True)
        lib = ctypes.CDLL(str(libpath))
        lib.decode.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.c_char_p, ctypes.c_void_p]
        lib.decode.restype = ctypes.c_int
        cases = [bytes((i * 73 + 19) % 256 for i in range(n)) for n in (1, 2, 3, 4, 7, 8, 55, 56, 57, 59, 60, 61, 63, 64, 65, 127, 128, 129, 1024, 4096)] + [source]
        for data in cases:
            packed = encode(data)
            out = ctypes.create_string_buffer(len(packed))
            size = lib.decode(packed, len(packed), b'DME90SQ2EU0K6D8A', out)
            assert size == len(data) and out.raw[:size] == data
        # Check every CSB image frame is provided by its transitive plist dependencies.
        frames = set()
        for name, row in resources.items():
            if name.endswith('.plist'):
                frames.update(plistlib.loads(source_path(row).read_bytes()).get('frames', {}))
        csb_frames = set()
        for name, row in resources.items():
            if name.endswith('.csb'):
                refs = re.findall(rb'[A-Za-z0-9_./-]+\.(?:png|jpg)', source_path(row).read_bytes())
                csb_frames.update(s.decode() for s in refs if b'/' not in s)
        assert not csb_frames - frames, f'Missing CSB frames: {csb_frames - frames}'
        apk_hash = None
        audio_checked = None
        if apk:
            path = PROJ / 'offline-client.apk'
            with zipfile.ZipFile(path) as z:
                assert len(z.namelist()) == len(set(z.namelist())), 'duplicate archive names'
                for row in resources.values():
                    assert hashlib.sha256(z.read(row['archive'])).hexdigest() == row['sha256']
                assert z.read('assets/HASH/D/D6D87D9149AFCAB5.luac') == encode(source)
            # AssetManager.openFd (sound effects) needs stored, 4-byte aligned audio.
            audio_checked = assert_audio_uncompressed(path)
            apk_hash = hashlib.sha256(path.read_bytes()).hexdigest()
    report = {'stage': 1, 'core_tests': int(re.search(r'TOTAL (\d+) PASS', result.stdout).group(1)), 'skill_test_groups': 5, 'encoding_roundtrips': len(cases), 'resources': len(resources),
              'csb_frames_resolved': len(csb_frames), 'bundled_modules': modules, 'syntax': 'PASS',
              'apk_sha256': apk_hash, 'audio_uncompressed': audio_checked, 'device_tested': False,
              'limitations': ['Native Spine/CSB rendering and input require later device verification.',
                              'Offline fixture data does not reproduce original server rules.',
                              'Two-slot recovery may restore the preceding committed revision; no fsync guarantee.']}
    (PROJ / 'local-verification.json').write_text(json.dumps(report, ensure_ascii=False, indent=2))
    print(json.dumps(report, ensure_ascii=False, indent=2))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('--apk', action='store_true')
    try:
        verify(parser.parse_args().apk)
    except FileNotFoundError as e:
        sys.exit(f'dependency missing: {e}\nRun: python3 outputs/offline-client/check_env.py (acceptance waits for dependencies)')
