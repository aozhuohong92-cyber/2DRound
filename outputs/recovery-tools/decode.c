/* Reconstructed from this APK's ARM64 FileUtils routines.
 * This decodes local assets only; it is not original project source. */
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#define DELTA 0x7f3a68ceU
#define MX (((z>>5 ^ y<<2) + (y>>3 ^ z<<4)) ^ ((sum^y) + (key[(p&3)^e]^z)))
int decode(const unsigned char *input, int size, const unsigned char *k, unsigned char *output) {
 if(size<10 || input[0]!=0x2b || input[1]!=0x4b) return -1;
 size-=2; unsigned char *b=malloc((size+3)&~3); memset(b,0,(size+3)&~3);memcpy(b,input+2,size);
 uint32_t hash=0; const char *name="main"; for(int i=0;name[i];i++)hash=hash*4+(uint32_t)name[i]*1313*8;
 if(size>=64){for(int i=0;i<64;i+=8){uint32_t v;memcpy(&v,b+i,4);v^=hash;memcpy(b+i,&v,4);}unsigned char tmp[32];memcpy(tmp,b,32);memcpy(b,b+32,32);memcpy(b+32,tmp,32);}
 uint32_t *v=(uint32_t*)b, key[4];memcpy(key,k,16);unsigned n=(size+3)/4;uint32_t y=v[0],z,sum=(6+52/n)*DELTA;unsigned p,e;
 while(sum){e=(sum>>2)&3;for(p=n-1;p>0;p--){z=v[p-1];y=v[p]-=MX;}z=v[n-1];p=0;y=v[0]-=MX;sum-=DELTA;}
 uint32_t len=v[n-1];if(len<n*4-7 || len>n*4-4){free(b);return -2;}memcpy(output,b,len);free(b);return len;
}
