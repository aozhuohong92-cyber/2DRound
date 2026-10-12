"""Encode editable Lua for this client's custom resource loader."""
import struct
MASK=0xffffffff
KEY=struct.unpack('<4I',b'DME90SQ2EU0K6D8A')
def encode(data):
 v=list(struct.unpack('<%dI'%((len(data)+3)//4),data+b'\0'*((-len(data))%4)))+[len(data)]
 n=len(v);z=v[-1];s=0
 for _ in range(6+52//n):
  s=(s+0x7f3a68ce)&MASK;e=(s>>2)&3
  for p in range(n):
   y=v[(p+1)%n]
   mx=(((z>>5 ^ y<<2)+(y>>3 ^ z<<4)) ^ ((s^y)+(KEY[(p&3)^e]^z)))&MASK
   v[p]=(v[p]+mx)&MASK;z=v[p]
 b=bytearray(struct.pack('<%dI'%n,*v))
 if len(b)>=64:
  b[:64]=b[32:64]+b[:32]
  h=0
  for c in b'main':h=(h*4+c*1313*8)&MASK
  for i in range(0,64,8):struct.pack_into('<I',b,i,struct.unpack_from('<I',b,i)[0]^h)
 return b'+K'+b
