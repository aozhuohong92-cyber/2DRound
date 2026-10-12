"""Reconstructed resource-name hash for the supplied APK, not a standard hash."""
SEEDS=[0x0c3d5e7f,0x1b4c6d8e,0x2a5b7c9d,0x306a9b0c]
TABLE=[]
a,b=0x200f1,0x4c72b
for i in range(256):
 a1=a*3%0x77ff77;b1=b*3%0xff77ff
 a=a1*3%0x77ff77;b=b1*3%0xff77ff
 TABLE.append(((a1&0x77ff)<<16)|(b1&0xff77))
def resource_hash(s):
 raw=s.encode();n=len(raw);a=(SEEDS[n%3]-127*n)&0xffffffff;b=(SEEDS[n%3+1]-254*n)&0xffffffff
 for i,c in enumerate(raw.lower(),1):
  a=((a+b+13*(c+i))&0xffffffff)^TABLE[c%255]
  b=((b+31*(c+i)+a)&0xffffffff)^TABLE[c%255]
 return f'{a:08X}{b:08X}'
if __name__=='__main__':
 for s in ['main.lua','src/main.lua','main.luac','src/main.luac','config.lua','file_update.lua']:
  print(s,resource_hash(s))
