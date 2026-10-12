import sys,re,json,collections,os
from pathlib import Path
sys.path.insert(0,'outputs/recovery-tools');from resource_hash import resource_hash
root=Path('outputs');assets=root/'apk-extracted/assets';available={p.stem:p for p in assets.rglob('*') if p.is_file()}; matches={}; candidates=set()
for name in ['main','config','config_init','config_demo','file_update','sdk_function','url_config','url_config_local']:
 candidates.add(name+'.luac')
for p in (root/'src/client/lua').glob('*.lua'):
 s=p.read_text(errors='replace')
 for name in re.findall(r'(?:layout_name\s*=|getTargetCSB\(|initLayoutFile\()\s*"([^"]+)"',s):
  candidates.add('SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/'+name+'.csb')
 for folder, name in re.findall(r'getPlistImgForDownLoad\("([^"]+)",\s*"([^"]+)"',s):
  for ext in ['png','jpg']:candidates.add('resource/'+folder+'/'+name+'.'+ext)
 for name in re.findall(r'(?:require|import)\s*\(?\s*["\']([^"\']+)',s):
  candidates.add(name.replace('.','/')+'.luac')
 for name in re.findall(r'["\']([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)+)["\']',s):
  candidates.add(name.replace('.','/')+'.luac')
 for name in re.findall(r'["\']([^"\'\n]+\.(?:png|jpg|csb|atlas|skel|mp3|plist|json|ttf|fsh|mp4))["\']',s):
  candidates.add(name);candidates.add('res/'+name)
for p in assets.rglob('*'):
 if not p.is_file() or p.suffix not in ['.csb','.atlas','.plist','.json']:continue
 for v in re.findall(rb'[A-Za-z0-9_./\-]+\.(?:png|jpg|csb|atlas|skel|mp3|plist|json|ttf|fsh|mp4)',p.read_bytes()):
  n=v.decode();candidates.add(n);candidates.add('res/'+n)
for name in sorted(candidates):
 if '%' in name or name.startswith('/') or '..' in name.split('/'):continue
 h=resource_hash(name);p=available.get(h)
 if p and p.suffix==Path(name).suffix:matches[name]=p.relative_to(root).as_posix()
(root/'resource-name-map.json').write_text(json.dumps(matches,ensure_ascii=False,indent=2));code=root/'lua-restored-paths';code.mkdir(exist_ok=True);code_rows=[]
for name,asset in matches.items():
 if not name.endswith('.luac'):continue
 src=root/'src/client/lua'/(Path(asset).stem+'.lua')
 if not src.exists():continue
 dst=(code/name).with_suffix('.lua');dst.parent.mkdir(parents=True,exist_ok=True)
 if not dst.exists():os.link(src,dst)
 code_rows.append({'path':dst.relative_to(root).as_posix(),'hash':src.stem})
(root/'restored-code-paths.json').write_text(json.dumps(code_rows,ensure_ascii=False,indent=2));print('candidates',len(candidates),'matched',len(matches),'code paths',len(code_rows),'kinds',collections.Counter(Path(n).suffix for n in matches))
