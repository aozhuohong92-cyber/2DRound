import sys,struct,io
sys.path.insert(0,'work/pythonlibs')
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import *
from elftools.elf.elffile import ELFFile
from pathlib import Path
b=Path('outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so').read_bytes(); elf=ELFFile(io.BytesIO(b))
u=Uc(UC_ARCH_ARM64,UC_MODE_ARM); u.mem_map(0,0x2000000); u.mem_map(0x3000000,0x200000)
for seg in elf.iter_segments():
 if seg['p_type']=='PT_LOAD': u.mem_write(seg['p_vaddr'],seg.data())
for sec in elf.iter_sections():
 if sec['sh_type']!='SHT_RELA': continue
 syms=elf.get_section(sec['sh_link'])
 for r in sec.iter_relocations():
  typ=r['r_info_type']; val=r['r_addend']
  if typ in (257,1025,1026): val+=syms.get_symbol(r['r_info_sym'])['st_value']
  elif typ!=1027: continue
  u.mem_write(r['r_offset'],struct.pack('<Q',val))
u.mem_write(0xf401c8,struct.pack('<Q',0x3100000))
def hook(u,a,size,data):
 if a in (0x39aa60,0x39af30):
  d=u.reg_read(UC_ARM64_REG_X0); s=u.reg_read(UC_ARM64_REG_X1); n=u.reg_read(UC_ARM64_REG_X2)
  u.mem_write(d,bytes(u.mem_read(s,n)) if a==0x39aa60 else bytes([s&255])*n)
  u.reg_write(UC_ARM64_REG_PC,u.reg_read(UC_ARM64_REG_LR))
u.hook_add(UC_HOOK_CODE,hook)
def call(a,*args):
 u.reg_write(UC_ARM64_REG_SP,0x31f0000); u.reg_write(UC_ARM64_REG_LR,0x3000000)
 for r,v in zip([UC_ARM64_REG_X0,UC_ARM64_REG_X1,UC_ARM64_REG_X2],args):u.reg_write(r,v)
 try:u.emu_start(a,0x3000000,count=1000000)
 except Exception:
  print('PC',hex(u.reg_read(UC_ARM64_REG_PC)));raise

def digest(s):
 raw=s.encode(); u.mem_write(0x3010000,bytes(256));u.mem_write(0x3020000,struct.pack('<Q',0x3030018));u.mem_write(0x3030000,struct.pack('<QQq',len(raw),len(raw),-1)+raw+b'\0')
 call(0x3b7370,0x3010000,0x3020000);call(0x3b73e8,0x3010000)
 return bytes(u.mem_read(0x301006c,16))
if __name__=='__main__':
 d=digest('main'); tableaddr=struct.unpack('<Q',u.mem_read(0xf44168,8))[0]; table=bytes(u.mem_read(tableaddr,37));print('digest',d.hex(),'table',table,'key',bytes(table[(x%255)//7] for x in d));Path('work/lua-key.bin').write_bytes(bytes(table[(x%255)//7] for x in d))
