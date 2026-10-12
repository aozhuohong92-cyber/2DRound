from pathlib import Path
import json,re,collections
root=Path('outputs');rows=[]; protocols=[];modules=collections.defaultdict(list)
for p in sorted((root/'lua-decompiled').glob('*.lua')):
 s=p.read_text(errors='replace'); name=None;kind='其他'
 for pat in [r'^([A-Za-z_][\w.]*)\s*=\s*\1\s+or\s+BaseClass',r'^Config\.([\w]+)\s*=',r'^([A-Za-z_][\w]*)\s*=\s*\1\s+or\s*\{',r'^function ([A-Za-z_][\w]+)[.:]']:
  m=re.search(pat,s,re.M)
  if m:name=m.group(1);break
 if name:
  if 'Controller' in name:kind='控制器'
  elif 'Model' in name:kind='数据模型'
  elif 'Event' in name:kind='事件'
  elif any(x in name for x in ['Window','Panel','View','Item','Tab']):kind='界面'
  elif re.search(r'^Config\.',s,re.M):kind='配置'
  elif 'Battle' in name:kind='战斗'
 else:name=p.stem
 refs=sorted(set(re.findall(r'(?:require|import)\s*\(?\s*["\']([^"\']+)',s)))
 rows.append({'name':name,'kind':kind,'file':p.relative_to(root).as_posix(),'lines':len(s.splitlines()),'requires':refs})
 modules[kind].append(rows[-1])
 for id,handler in re.findall(r':RegisterProtocal\((\d+),\s*"([^"]+)"',s):protocols.append({'id':int(id),'handler':handler,'module':name,'file':p.relative_to(root).as_posix()})
(root/'code-index.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2));(root/'protocol-index.json').write_text(json.dumps(protocols,ensure_ascii=False,indent=2))
text=['# Lua 代码索引','', '名称从反编译代码里的类名/全局名推断，不代表已恢复原始源码路径。slot/uv 等是反编译器生成的变量名；生成成功不等于功能正确。','']
for kind,rs in modules.items():
 text+=['## '+kind,'','| 模块/名称 | 代码 | 行数 |','|---|---|---|']
 for r in sorted(rs,key=lambda r:r['name']):text.append(f"| {r['name']} | [{Path(r['file']).name}]({(root/r['file']).resolve()}) | {r['lines']} |")
 text.append('')
(root/'代码索引.md').write_text('\n'.join(text));print('indexed',len(rows),'protocol registrations',len(protocols),'kinds',dict(collections.Counter(r['kind'] for r in rows)))
