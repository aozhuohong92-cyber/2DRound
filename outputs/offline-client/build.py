from pathlib import Path
import subprocess,zipfile,json
from pack_lua import encode
from prepare_assets import prepare
from bundle import bundle
from zipcheck import assert_audio_uncompressed, is_audio
ROOT=Path(__file__).resolve().parents[2];PROJ=Path(__file__).resolve().parent;BUILD=ROOT/'work/offline-build';BUILD.mkdir(exist_ok=True)
SDK=Path.home()/'Library/Android/sdk';BT=SDK/'build-tools/35.0.1'
def run(*args):subprocess.run([str(a) for a in args],check=True)
resources=prepare()
source, modules=bundle(PROJ, resources)
(BUILD/'bundled-main.lua').write_bytes(source)
run(BT/'aapt2','compile','--dir',PROJ/'res','-o',BUILD/'resources.zip')
run(BT/'aapt2','link',BUILD/'resources.zip','--manifest',PROJ/'AndroidManifest.xml','-I',SDK/'platforms/android-35/android.jar','-o',BUILD/'base.apk')
with zipfile.ZipFile(BUILD/'base.apk') as base,zipfile.ZipFile(BUILD/'unsigned.apk','w',zipfile.ZIP_DEFLATED,compresslevel=3) as z:
 for n in base.namelist():z.writestr(n,base.read(n))
 apk=ROOT/'outputs/apk-extracted'
 for n in ['classes.dex','lib/arm64-v8a/libcocos2dlua.so']:z.write(apk/n,n)
 for p in (apk/'assets').rglob('*.luac'):
  if p.name!='D6D87D9149AFCAB5.luac':z.write(p,str(p.relative_to(apk)))
 main=encode(source)
 for n in ['assets/src/main.lua','assets/main.lua','assets/main.luac','assets/HASH/main.lua','assets/HASH/main.luac','assets/HASH/D/D6D87D9149AFCAB5.luac']:z.writestr(n,main)
 for row in resources.values():
  z.write(ROOT/row['source'],row['archive'],compress_type=zipfile.ZIP_STORED if is_audio(row['archive']) else zipfile.ZIP_DEFLATED)
 included={row['archive'] for row in resources.values()}
 extra=PROJ/'assets'
 if extra.exists():
  for p in extra.rglob('*'):
   if p.is_file():
    arc='assets/'+str(p.relative_to(extra))
    if arc not in included:z.write(p,arc,compress_type=zipfile.ZIP_STORED if is_audio(arc) else zipfile.ZIP_DEFLATED)
run(BT/'zipalign','-f','4',BUILD/'unsigned.apk',BUILD/'aligned.apk')
key=BUILD/'offline-debug.jks'
if not key.exists():run('keytool','-genkeypair','-keystore',key,'-storepass','android','-keypass','android','-alias','offline-debug','-dname','CN=Local Offline Client','-keyalg','RSA','-validity','3650')
run(BT/'apksigner','sign','--ks',key,'--ks-pass','pass:android','--key-pass','pass:android','--out',PROJ/'offline-client.apk',BUILD/'aligned.apk')
run(BT/'apksigner','verify',PROJ/'offline-client.apk')
# Android AssetManager.openFd (sound effects) needs stored, 4-byte aligned audio.
audio_uncompressed=assert_audio_uncompressed(PROJ/'offline-client.apk')
print(PROJ/'offline-client.apk')

(PROJ/'build-report.json').write_text(json.dumps({'modules': modules, 'resources': len(resources), 'signature_verified': True, 'audio_uncompressed': audio_uncompressed, 'device_tested': False, 'stage': 1}, indent=2))
