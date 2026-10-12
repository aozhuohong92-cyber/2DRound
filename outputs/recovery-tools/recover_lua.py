#!/usr/bin/env python3
"""Decode the Lua files from the specific 航海冒险 APK analyzed in this report.
Does not execute the recovered game code or contact game servers.
Usage: python3 recover_lua.py EXTRACTED_APK_DIRECTORY BYTECODE_OUTPUT_DIRECTORY
Requires clang/gcc. The key and algorithm are specific to the supplied APK.
"""
from pathlib import Path
import ctypes,subprocess,platform,tempfile,json,sys
KEY=b'DME90SQ2EU0K6D8A'
def main():
 if len(sys.argv)!=3:raise SystemExit(__doc__)
 src=Path(sys.argv[1]);out=Path(sys.argv[2]);out.mkdir(parents=True,exist_ok=True)
 with tempfile.TemporaryDirectory() as d:
  libpath=Path(d)/'decoder.so';cmd=['clang','-O2','-shared']
  if sys.platform=='darwin':cmd+=['-arch',platform.machine()]
  else:cmd+=['-fPIC']
  cmd+=['-o',str(libpath),str(Path(__file__).with_name('decode.c'))];subprocess.run(cmd,check=True)
  lib=ctypes.CDLL(str(libpath));lib.decode.argtypes=[ctypes.c_char_p,ctypes.c_int,ctypes.c_char_p,ctypes.c_void_p];lib.decode.restype=ctypes.c_int
  rows=[]
  for p in sorted(src.rglob('*.luac')):
   b=p.read_bytes();buf=ctypes.create_string_buffer(len(b));n=lib.decode(b,len(b),KEY,buf)
   if n<0:raise RuntimeError(f'Decode failed: {p}, error {n}')
   data=buf.raw[:n]
   if not data.startswith(b'\x1bLJ\x02'):raise RuntimeError(f'Unexpected bytecode: {p}')
   (out/p.name).write_bytes(data);rows.append({'input':str(p),'bytes':n})
  (out/'decode-status.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2));print(f'Decoded {len(rows)} LuaJIT files')
if __name__=='__main__':main()
