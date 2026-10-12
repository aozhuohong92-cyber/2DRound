
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000009ebf3c <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE>:
  9ec000: bd40cba2     	ldr	s2, [x29, #0xc8]
  9ec004: 910062a0     	add	x0, x21, #0x18
  9ec008: bd40cfa1     	ldr	s1, [x29, #0xcc]
  9ec00c: 910363b9     	add	x25, x29, #0xd8
  9ec010: bd40d3a0     	ldr	s0, [x29, #0xd0]
  9ec014: aa0003e1     	mov	x1, x0
  9ec018: 1e220902     	fmul	s2, s8, s2
  9ec01c: f9004fa0     	str	x0, [x29, #0x98]
  9ec020: 1e210901     	fmul	s1, s8, s1
  9ec024: aa1903e0     	mov	x0, x25
  9ec028: 1e200900     	fmul	s0, s8, s0
  9ec02c: bd405aa8     	ldr	s8, [x21, #0x58]
  9ec030: bd00cba2     	str	s2, [x29, #0xc8]
  9ec034: bd00cfa1     	str	s1, [x29, #0xcc]
  9ec038: bd00d3a0     	str	s0, [x29, #0xd0]
  9ec03c: 9400561d     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec040: bd40dba2     	ldr	s2, [x29, #0xd8]
  9ec044: 910092a0     	add	x0, x21, #0x24
  9ec048: bd40dfa1     	ldr	s1, [x29, #0xdc]
  9ec04c: 9103a3ba     	add	x26, x29, #0xe8
  9ec050: bd40e3a0     	ldr	s0, [x29, #0xe0]
  9ec054: aa0003e1     	mov	x1, x0
  9ec058: 1e280842     	fmul	s2, s2, s8
  9ec05c: f9004ba0     	str	x0, [x29, #0x90]
  9ec060: 1e210901     	fmul	s1, s8, s1
  9ec064: aa1a03e0     	mov	x0, x26
  9ec068: 1e200900     	fmul	s0, s8, s0
  9ec06c: bd405ea8     	ldr	s8, [x21, #0x5c]
  9ec070: bd00dba2     	str	s2, [x29, #0xd8]
  9ec074: bd00dfa1     	str	s1, [x29, #0xdc]
  9ec078: bd00e3a0     	str	s0, [x29, #0xe0]
  9ec07c: 9400560d     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec080: bd40eba1     	ldr	s1, [x29, #0xe8]
  9ec084: 51000680     	sub	w0, w20, #0x1
  9ec088: bd40efa0     	ldr	s0, [x29, #0xec]
  9ec08c: 91000400     	add	x0, x0, #0x1
  9ec090: bd40f3a2     	ldr	s2, [x29, #0xf0]
  9ec094: 910423bc     	add	x28, x29, #0x108
  9ec098: 1e280821     	fmul	s1, s1, s8
  9ec09c: 8b0012e0     	add	x0, x23, x0, lsl #4
  9ec0a0: 1e200900     	fmul	s0, s8, s0
  9ec0a4: f90047a0     	str	x0, [x29, #0x88]
  9ec0a8: 1e220908     	fmul	s8, s8, s2
  9ec0ac: 9104a3a0     	add	x0, x29, #0x128
  9ec0b0: 9103e3b4     	add	x20, x29, #0xf8
  9ec0b4: f90043a0     	str	x0, [x29, #0x80]
  9ec0b8: 910463b5     	add	x21, x29, #0x118
  9ec0bc: 910523bb     	add	x27, x29, #0x148
  9ec0c0: 9104e3b6     	add	x22, x29, #0x138
  9ec0c4: bd00eba1     	str	s1, [x29, #0xe8]
  9ec0c8: bd00efa0     	str	s0, [x29, #0xec]
  9ec0cc: bd00f3a8     	str	s8, [x29, #0xf0]
  9ec0d0: 14000053     	b	0x9ec21c <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x2e0>
  9ec0d4: aa1403e0     	mov	x0, x20
  9ec0d8: aa1303e1     	mov	x1, x19
  9ec0dc: 940055f5     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec0e0: bd400282     	ldr	s2, [x20]
  9ec0e4: aa1403e0     	mov	x0, x20
  9ec0e8: bd400681     	ldr	s1, [x20, #0x4]
  9ec0ec: bd400a80     	ldr	s0, [x20, #0x8]
  9ec0f0: bd400305     	ldr	s5, [x24]
  9ec0f4: bd400704     	ldr	s4, [x24, #0x4]
  9ec0f8: bd400b03     	ldr	s3, [x24, #0x8]
  9ec0fc: 1e253842     	fsub	s2, s2, s5
  9ec100: 1e243821     	fsub	s1, s1, s4
  9ec104: 1e233800     	fsub	s0, s0, s3
  9ec108: bd000282     	str	s2, [x20]
  9ec10c: bd000681     	str	s1, [x20, #0x4]
  9ec110: f9400282     	ldr	x2, [x20]
  9ec114: bd000a80     	str	s0, [x20, #0x8]
  9ec118: b9400a81     	ldr	w1, [x20, #0x8]
  9ec11c: f9000262     	str	x2, [x19]
  9ec120: b9000a61     	str	w1, [x19, #0x8]
  9ec124: 940055c5     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec128: f9404fa1     	ldr	x1, [x29, #0x98]
  9ec12c: aa1703e0     	mov	x0, x23
  9ec130: 9400567e     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ec134: 1e202018     	fcmpe	s0, #0.0
  9ec138: 54000ded     	b.le	0x9ec2f4 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x3b8>
  9ec13c: aa1503e0     	mov	x0, x21
  9ec140: aa1303e1     	mov	x1, x19
  9ec144: 940055db     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec148: bd4002a2     	ldr	s2, [x21]
  9ec14c: aa1503e0     	mov	x0, x21
  9ec150: bd4006a1     	ldr	s1, [x21, #0x4]
  9ec154: bd400aa0     	ldr	s0, [x21, #0x8]
  9ec158: bd400325     	ldr	s5, [x25]
  9ec15c: bd400724     	ldr	s4, [x25, #0x4]
  9ec160: bd400b23     	ldr	s3, [x25, #0x8]
  9ec164: 1e253842     	fsub	s2, s2, s5
  9ec168: 1e243821     	fsub	s1, s1, s4
  9ec16c: 1e233800     	fsub	s0, s0, s3
  9ec170: bd0002a2     	str	s2, [x21]
  9ec174: bd0006a1     	str	s1, [x21, #0x4]
  9ec178: f94002a2     	ldr	x2, [x21]
  9ec17c: bd000aa0     	str	s0, [x21, #0x8]
  9ec180: b9400aa1     	ldr	w1, [x21, #0x8]
  9ec184: f9000262     	str	x2, [x19]
  9ec188: b9000a61     	str	w1, [x19, #0x8]
  9ec18c: 940055ab     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec190: f9404ba1     	ldr	x1, [x29, #0x90]
  9ec194: aa1703e0     	mov	x0, x23
  9ec198: 94005664     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ec19c: 1e202018     	fcmpe	s0, #0.0
  9ec1a0: 540007ed     	b.le	0x9ec29c <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x360>
  9ec1a4: aa1603e0     	mov	x0, x22
  9ec1a8: aa1303e1     	mov	x1, x19
  9ec1ac: 940055c1     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec1b0: bd4002c2     	ldr	s2, [x22]
  9ec1b4: aa1603e0     	mov	x0, x22
  9ec1b8: bd4006c1     	ldr	s1, [x22, #0x4]
  9ec1bc: bd400ac0     	ldr	s0, [x22, #0x8]
  9ec1c0: bd400345     	ldr	s5, [x26]
  9ec1c4: bd400744     	ldr	s4, [x26, #0x4]
  9ec1c8: bd400b43     	ldr	s3, [x26, #0x8]
  9ec1cc: 1e253842     	fsub	s2, s2, s5
  9ec1d0: 1e243821     	fsub	s1, s1, s4
  9ec1d4: 1e233800     	fsub	s0, s0, s3
  9ec1d8: bd0002c2     	str	s2, [x22]
  9ec1dc: bd0006c1     	str	s1, [x22, #0x4]
  9ec1e0: f94002c2     	ldr	x2, [x22]
  9ec1e4: bd000ac0     	str	s0, [x22, #0x8]
  9ec1e8: b9400ac1     	ldr	w1, [x22, #0x8]
  9ec1ec: f9000262     	str	x2, [x19]
  9ec1f0: b9000a61     	str	w1, [x19, #0x8]
  9ec1f4: 94005591     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec1f8: aa1703e0     	mov	x0, x23
  9ec1fc: aa1303e1     	mov	x1, x19
  9ec200: 94000262     	bl	0x9ecb88 <_ZNK7cocos2d5Plane7getSideERKNS_4Vec3E>
  9ec204: 7100041f     	cmp	w0, #0x1
  9ec208: 54000b80     	b.eq	0x9ec378 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x43c>
  9ec20c: f94047a0     	ldr	x0, [x29, #0x88]
  9ec210: 910042f7     	add	x23, x23, #0x10
  9ec214: eb0002ff     	cmp	x23, x0
  9ec218: 540009c0     	b.eq	0x9ec350 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x414>
  9ec21c: f94057a2     	ldr	x2, [x29, #0xa8]
  9ec220: aa1703e0     	mov	x0, x23
  9ec224: f94053a1     	ldr	x1, [x29, #0xa0]
  9ec228: f9400043     	ldr	x3, [x2]
  9ec22c: b9400842     	ldr	w2, [x2, #0x8]
  9ec230: f9000263     	str	x3, [x19]
  9ec234: b9000a62     	str	w2, [x19, #0x8]
  9ec238: 9400563c     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ec23c: 1e202018     	fcmpe	s0, #0.0
  9ec240: 54fff4ac     	b.gt	0x9ec0d4 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x198>
  9ec244: aa1c03e0     	mov	x0, x28
  9ec248: aa1303e1     	mov	x1, x19
  9ec24c: 94005599     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec250: bd400382     	ldr	s2, [x28]
  9ec254: aa1c03e0     	mov	x0, x28
  9ec258: bd400781     	ldr	s1, [x28, #0x4]
  9ec25c: bd400b80     	ldr	s0, [x28, #0x8]
  9ec260: bd400305     	ldr	s5, [x24]
  9ec264: bd400704     	ldr	s4, [x24, #0x4]
  9ec268: bd400b03     	ldr	s3, [x24, #0x8]
  9ec26c: 1e252842     	fadd	s2, s2, s5
  9ec270: 1e242821     	fadd	s1, s1, s4
  9ec274: 1e232800     	fadd	s0, s0, s3
  9ec278: bd000382     	str	s2, [x28]
  9ec27c: bd000781     	str	s1, [x28, #0x4]
  9ec280: f9400382     	ldr	x2, [x28]
  9ec284: bd000b80     	str	s0, [x28, #0x8]
  9ec288: b9400b81     	ldr	w1, [x28, #0x8]
  9ec28c: f9000262     	str	x2, [x19]
  9ec290: b9000a61     	str	w1, [x19, #0x8]
  9ec294: 94005569     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec298: 17ffffa4     	b	0x9ec128 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x1ec>
  9ec29c: aa1b03e0     	mov	x0, x27
  9ec2a0: aa1303e1     	mov	x1, x19
  9ec2a4: 94005583     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec2a8: bd400362     	ldr	s2, [x27]
  9ec2ac: aa1b03e0     	mov	x0, x27
  9ec2b0: bd400761     	ldr	s1, [x27, #0x4]
  9ec2b4: bd400b60     	ldr	s0, [x27, #0x8]
  9ec2b8: bd400345     	ldr	s5, [x26]
  9ec2bc: bd400744     	ldr	s4, [x26, #0x4]
  9ec2c0: bd400b43     	ldr	s3, [x26, #0x8]
  9ec2c4: 1e252842     	fadd	s2, s2, s5
  9ec2c8: 1e242821     	fadd	s1, s1, s4
  9ec2cc: 1e232800     	fadd	s0, s0, s3
  9ec2d0: bd000362     	str	s2, [x27]
  9ec2d4: bd000761     	str	s1, [x27, #0x4]
  9ec2d8: f9400362     	ldr	x2, [x27]
  9ec2dc: bd000b60     	str	s0, [x27, #0x8]
  9ec2e0: b9400b61     	ldr	w1, [x27, #0x8]
  9ec2e4: f9000262     	str	x2, [x19]
  9ec2e8: b9000a61     	str	w1, [x19, #0x8]
  9ec2ec: 94005553     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec2f0: 17ffffc2     	b	0x9ec1f8 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x2bc>
  9ec2f4: f94043a0     	ldr	x0, [x29, #0x80]
  9ec2f8: aa1303e1     	mov	x1, x19
  9ec2fc: 9400556d     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec300: f94043a1     	ldr	x1, [x29, #0x80]
  9ec304: bd400325     	ldr	s5, [x25]
  9ec308: bd400724     	ldr	s4, [x25, #0x4]
  9ec30c: aa0103e0     	mov	x0, x1
  9ec310: bd400022     	ldr	s2, [x1]
  9ec314: bd400421     	ldr	s1, [x1, #0x4]
  9ec318: bd400820     	ldr	s0, [x1, #0x8]
  9ec31c: bd400b23     	ldr	s3, [x25, #0x8]
  9ec320: 1e252842     	fadd	s2, s2, s5
  9ec324: 1e242821     	fadd	s1, s1, s4
  9ec328: 1e232800     	fadd	s0, s0, s3
  9ec32c: bd000022     	str	s2, [x1]
  9ec330: bd000421     	str	s1, [x1, #0x4]
  9ec334: f9400022     	ldr	x2, [x1]
  9ec338: bd000820     	str	s0, [x1, #0x8]
  9ec33c: b9400821     	ldr	w1, [x1, #0x8]
  9ec340: f9000262     	str	x2, [x19]
  9ec344: b9000a61     	str	w1, [x19, #0x8]
  9ec348: 9400553c     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec34c: 17ffff91     	b	0x9ec190 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x254>
  9ec350: aa1a03e0     	mov	x0, x26
  9ec354: b9007fbf     	str	wzr, [x29, #0x7c]
  9ec358: 94005538     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec35c: aa1903e0     	mov	x0, x25
  9ec360: 94005536     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec364: aa1803e0     	mov	x0, x24
  9ec368: 94005534     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec36c: aa1303e0     	mov	x0, x19
  9ec370: 94005532     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec374: 17ffff03     	b	0x9ebf80 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x44>
  9ec378: aa1a03e0     	mov	x0, x26
  9ec37c: 17fffff7     	b	0x9ec358 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x41c>
  9ec380: aa0003f4     	mov	x20, x0
  9ec384: aa1a03e0     	mov	x0, x26
  9ec388: 9400552c     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec38c: aa1903e0     	mov	x0, x25
  9ec390: 9400552a     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec394: aa1803e0     	mov	x0, x24
  9ec398: 94005528     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec39c: aa1303e0     	mov	x0, x19
  9ec3a0: 94005526     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec3a4: aa1403e0     	mov	x0, x20
  9ec3a8: 9407dace     	bl	0xbe2ee0 <_Unwind_Resume>
  9ec3ac: 97e6bbfd     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ec3b0: aa0003f4     	mov	x20, x0
  9ec3b4: 17fffffa     	b	0x9ec39c <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x460>
  9ec3b8: aa0003f4     	mov	x20, x0
  9ec3bc: 17fffff6     	b	0x9ec394 <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x458>
  9ec3c0: aa0003f4     	mov	x20, x0
  9ec3c4: 17fffff2     	b	0x9ec38c <_ZNK7cocos2d7Frustum14isOutOfFrustumERKNS_3OBBE+0x450>

00000000009ec3c8 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE>:
  9ec3c8: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9ec3cc: 910003fd     	mov	x29, sp
  9ec3d0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ec3d4: 90002ab7     	adrp	x23, 0xf40000
  9ec3d8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ec3dc: aa0003f6     	mov	x22, x0
  9ec3e0: aa0103e0     	mov	x0, x1
  9ec3e4: f940e6e1     	ldr	x1, [x23, #0x1c8]
  9ec3e8: 910163b5     	add	x21, x29, #0x58
  9ec3ec: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ec3f0: 910123b4     	add	x20, x29, #0x48
  9ec3f4: f9400021     	ldr	x1, [x1]
  9ec3f8: f90037a1     	str	x1, [x29, #0x68]
  9ec3fc: 97fde87b     	bl	0x9665e8 <_ZNK7cocos2d6Camera23getViewProjectionMatrixEv>
  9ec400: aa0003f3     	mov	x19, x0
  9ec404: aa1403e0     	mov	x0, x20
  9ec408: bd400e65     	ldr	s5, [x19, #0xc]
  9ec40c: bd400260     	ldr	s0, [x19]
  9ec410: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec414: bd401261     	ldr	s1, [x19, #0x10]
  9ec418: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec41c: bd402262     	ldr	s2, [x19, #0x20]
  9ec420: 1e2028a0     	fadd	s0, s5, s0
  9ec424: 1e212881     	fadd	s1, s4, s1
  9ec428: 1e222862     	fadd	s2, s3, s2
  9ec42c: 94005509     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec430: aa1503e0     	mov	x0, x21
  9ec434: aa1403e1     	mov	x1, x20
  9ec438: 9400551e     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec43c: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec440: aa1603e0     	mov	x0, x22
  9ec444: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec448: aa1503e1     	mov	x1, x21
  9ec44c: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec450: 1e214021     	fneg	s1, s1
  9ec454: 1e214000     	fneg	s0, s0
  9ec458: 1e214042     	fneg	s2, s2
  9ec45c: bd005fa1     	str	s1, [x29, #0x5c]
  9ec460: bd0063a0     	str	s0, [x29, #0x60]
  9ec464: bd005ba2     	str	s2, [x29, #0x58]
  9ec468: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec46c: bd403260     	ldr	s0, [x19, #0x30]
  9ec470: 1e202820     	fadd	s0, s1, s0
  9ec474: 94000149     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec478: aa1503e0     	mov	x0, x21
  9ec47c: 910042d8     	add	x24, x22, #0x10
  9ec480: 940054ee     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec484: aa1403e0     	mov	x0, x20
  9ec488: 940054ec     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec48c: bd400e65     	ldr	s5, [x19, #0xc]
  9ec490: aa1403e0     	mov	x0, x20
  9ec494: bd400260     	ldr	s0, [x19]
  9ec498: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec49c: bd401261     	ldr	s1, [x19, #0x10]
  9ec4a0: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec4a4: bd402262     	ldr	s2, [x19, #0x20]
  9ec4a8: 1e2038a0     	fsub	s0, s5, s0
  9ec4ac: 1e213881     	fsub	s1, s4, s1
  9ec4b0: 1e223862     	fsub	s2, s3, s2
  9ec4b4: 940054e7     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec4b8: aa1503e0     	mov	x0, x21
  9ec4bc: aa1403e1     	mov	x1, x20
  9ec4c0: 940054fc     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec4c4: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec4c8: aa1803e0     	mov	x0, x24
  9ec4cc: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec4d0: aa1503e1     	mov	x1, x21
  9ec4d4: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec4d8: 1e214021     	fneg	s1, s1
  9ec4dc: 1e214000     	fneg	s0, s0
  9ec4e0: 1e214042     	fneg	s2, s2
  9ec4e4: bd005fa1     	str	s1, [x29, #0x5c]
  9ec4e8: bd0063a0     	str	s0, [x29, #0x60]
  9ec4ec: bd005ba2     	str	s2, [x29, #0x58]
  9ec4f0: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec4f4: bd403260     	ldr	s0, [x19, #0x30]
  9ec4f8: 1e203820     	fsub	s0, s1, s0
  9ec4fc: 94000127     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec500: aa1503e0     	mov	x0, x21
  9ec504: 910082d8     	add	x24, x22, #0x20
  9ec508: 940054cc     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec50c: aa1403e0     	mov	x0, x20
  9ec510: 940054ca     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec514: bd400e65     	ldr	s5, [x19, #0xc]
  9ec518: aa1403e0     	mov	x0, x20
  9ec51c: bd400660     	ldr	s0, [x19, #0x4]
  9ec520: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec524: bd401661     	ldr	s1, [x19, #0x14]
  9ec528: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec52c: bd402662     	ldr	s2, [x19, #0x24]
  9ec530: 1e2028a0     	fadd	s0, s5, s0
  9ec534: 1e212881     	fadd	s1, s4, s1
  9ec538: 1e222862     	fadd	s2, s3, s2
  9ec53c: 940054c5     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec540: aa1503e0     	mov	x0, x21
  9ec544: aa1403e1     	mov	x1, x20
  9ec548: 940054da     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec54c: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec550: aa1803e0     	mov	x0, x24
  9ec554: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec558: aa1503e1     	mov	x1, x21
  9ec55c: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec560: 1e214021     	fneg	s1, s1
  9ec564: 1e214000     	fneg	s0, s0
  9ec568: 1e214042     	fneg	s2, s2
  9ec56c: bd005fa1     	str	s1, [x29, #0x5c]
  9ec570: bd0063a0     	str	s0, [x29, #0x60]
  9ec574: bd005ba2     	str	s2, [x29, #0x58]
  9ec578: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec57c: bd403660     	ldr	s0, [x19, #0x34]
  9ec580: 1e202820     	fadd	s0, s1, s0
  9ec584: 94000105     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec588: aa1503e0     	mov	x0, x21
  9ec58c: 9100c2d8     	add	x24, x22, #0x30
  9ec590: 940054aa     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec594: aa1403e0     	mov	x0, x20
  9ec598: 940054a8     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec59c: bd400e65     	ldr	s5, [x19, #0xc]
  9ec5a0: aa1403e0     	mov	x0, x20
  9ec5a4: bd400660     	ldr	s0, [x19, #0x4]
  9ec5a8: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec5ac: bd401661     	ldr	s1, [x19, #0x14]
  9ec5b0: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec5b4: bd402662     	ldr	s2, [x19, #0x24]
  9ec5b8: 1e2038a0     	fsub	s0, s5, s0
  9ec5bc: 1e213881     	fsub	s1, s4, s1
  9ec5c0: 1e223862     	fsub	s2, s3, s2
  9ec5c4: 940054a3     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec5c8: aa1503e0     	mov	x0, x21
  9ec5cc: aa1403e1     	mov	x1, x20
  9ec5d0: 940054b8     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec5d4: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec5d8: aa1803e0     	mov	x0, x24
  9ec5dc: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec5e0: aa1503e1     	mov	x1, x21
  9ec5e4: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec5e8: 1e214021     	fneg	s1, s1
  9ec5ec: 1e214000     	fneg	s0, s0
  9ec5f0: 1e214042     	fneg	s2, s2
  9ec5f4: bd005fa1     	str	s1, [x29, #0x5c]
  9ec5f8: bd0063a0     	str	s0, [x29, #0x60]
  9ec5fc: bd005ba2     	str	s2, [x29, #0x58]
  9ec600: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec604: bd403660     	ldr	s0, [x19, #0x34]
  9ec608: 1e203820     	fsub	s0, s1, s0
  9ec60c: 940000e3     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec610: aa1503e0     	mov	x0, x21
  9ec614: 910102d8     	add	x24, x22, #0x40
  9ec618: 94005488     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec61c: aa1403e0     	mov	x0, x20
  9ec620: 94005486     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec624: bd400e65     	ldr	s5, [x19, #0xc]
  9ec628: aa1403e0     	mov	x0, x20
  9ec62c: bd400a60     	ldr	s0, [x19, #0x8]
  9ec630: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec634: bd401a61     	ldr	s1, [x19, #0x18]
  9ec638: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec63c: bd402a62     	ldr	s2, [x19, #0x28]
  9ec640: 1e2028a0     	fadd	s0, s5, s0
  9ec644: 1e212881     	fadd	s1, s4, s1
  9ec648: 1e222862     	fadd	s2, s3, s2
  9ec64c: 94005481     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec650: aa1503e0     	mov	x0, x21
  9ec654: aa1403e1     	mov	x1, x20
  9ec658: 94005496     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec65c: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec660: aa1803e0     	mov	x0, x24
  9ec664: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec668: aa1503e1     	mov	x1, x21
  9ec66c: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec670: 1e214021     	fneg	s1, s1
  9ec674: 1e214000     	fneg	s0, s0
  9ec678: 1e214042     	fneg	s2, s2
  9ec67c: bd005fa1     	str	s1, [x29, #0x5c]
  9ec680: bd0063a0     	str	s0, [x29, #0x60]
  9ec684: bd005ba2     	str	s2, [x29, #0x58]
  9ec688: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec68c: bd403a60     	ldr	s0, [x19, #0x38]
  9ec690: 1e202820     	fadd	s0, s1, s0
  9ec694: 940000c1     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec698: aa1503e0     	mov	x0, x21
  9ec69c: 910142d6     	add	x22, x22, #0x50
  9ec6a0: 94005466     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec6a4: aa1403e0     	mov	x0, x20
  9ec6a8: 94005464     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec6ac: bd400e65     	ldr	s5, [x19, #0xc]
  9ec6b0: aa1403e0     	mov	x0, x20
  9ec6b4: bd400a60     	ldr	s0, [x19, #0x8]
  9ec6b8: bd401e64     	ldr	s4, [x19, #0x1c]
  9ec6bc: bd401a61     	ldr	s1, [x19, #0x18]
  9ec6c0: bd402e63     	ldr	s3, [x19, #0x2c]
  9ec6c4: bd402a62     	ldr	s2, [x19, #0x28]
  9ec6c8: 1e2038a0     	fsub	s0, s5, s0
  9ec6cc: 1e213881     	fsub	s1, s4, s1
  9ec6d0: 1e223862     	fsub	s2, s3, s2
  9ec6d4: 9400545f     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec6d8: aa1503e0     	mov	x0, x21
  9ec6dc: aa1403e1     	mov	x1, x20
  9ec6e0: 94005474     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec6e4: bd405ba2     	ldr	s2, [x29, #0x58]
  9ec6e8: aa1603e0     	mov	x0, x22
  9ec6ec: bd405fa1     	ldr	s1, [x29, #0x5c]
  9ec6f0: aa1503e1     	mov	x1, x21
  9ec6f4: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec6f8: 1e214021     	fneg	s1, s1
  9ec6fc: 1e214000     	fneg	s0, s0
  9ec700: 1e214042     	fneg	s2, s2
  9ec704: bd005fa1     	str	s1, [x29, #0x5c]
  9ec708: bd0063a0     	str	s0, [x29, #0x60]
  9ec70c: bd005ba2     	str	s2, [x29, #0x58]
  9ec710: bd403e61     	ldr	s1, [x19, #0x3c]
  9ec714: bd403a60     	ldr	s0, [x19, #0x38]
  9ec718: 1e203820     	fsub	s0, s1, s0
  9ec71c: 9400009f     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ec720: aa1503e0     	mov	x0, x21
  9ec724: 94005445     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec728: aa1403e0     	mov	x0, x20
  9ec72c: 94005443     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec730: f940e6f7     	ldr	x23, [x23, #0x1c8]
  9ec734: f94037a1     	ldr	x1, [x29, #0x68]
  9ec738: f94002e0     	ldr	x0, [x23]
  9ec73c: eb00003f     	cmp	x1, x0
  9ec740: 540000c1     	b.ne	0x9ec758 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x390>
  9ec744: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ec748: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ec74c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ec750: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9ec754: d65f03c0     	ret
  9ec758: 97e6bb12     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ec75c: aa0003f3     	mov	x19, x0
  9ec760: aa1503e0     	mov	x0, x21
  9ec764: 94005435     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec768: aa1403e0     	mov	x0, x20
  9ec76c: 94005433     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec770: aa1303e0     	mov	x0, x19
  9ec774: 9407d9db     	bl	0xbe2ee0 <_Unwind_Resume>
  9ec778: aa0003f3     	mov	x19, x0
  9ec77c: 17fffffb     	b	0x9ec768 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3a0>
  9ec780: 17fffff7     	b	0x9ec75c <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x394>
  9ec784: 17fffffd     	b	0x9ec778 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3b0>
  9ec788: 17fffff5     	b	0x9ec75c <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x394>
  9ec78c: 17fffffb     	b	0x9ec778 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3b0>
  9ec790: 17fffff3     	b	0x9ec75c <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x394>
  9ec794: 17fffff9     	b	0x9ec778 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3b0>
  9ec798: 17fffff1     	b	0x9ec75c <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x394>
  9ec79c: 17fffff7     	b	0x9ec778 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3b0>
  9ec7a0: 17ffffef     	b	0x9ec75c <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x394>
  9ec7a4: 17fffff5     	b	0x9ec778 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE+0x3b0>

00000000009ec7a8 <_ZN7cocos2d7Frustum11initFrustumEPKNS_6CameraE>:
  9ec7a8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ec7ac: 910003fd     	mov	x29, sp
  9ec7b0: f9000bf3     	str	x19, [sp, #0x10]
  9ec7b4: 52800033     	mov	w19, #0x1               // =1
  9ec7b8: 39018413     	strb	w19, [x0, #0x61]
  9ec7bc: 97ffff03     	bl	0x9ec3c8 <_ZN7cocos2d7Frustum11createPlaneEPKNS_6CameraE>
  9ec7c0: 2a1303e0     	mov	w0, w19
  9ec7c4: f9400bf3     	ldr	x19, [sp, #0x10]
  9ec7c8: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ec7cc: d65f03c0     	ret

00000000009ec7d0 <_ZN7cocos2d5PlaneC2Ev>:
  9ec7d0: 1e2703e0     	fmov	s0, wzr
  9ec7d4: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ec7d8: 1e2e1002     	fmov	s2, #1.00000000
  9ec7dc: 910003fd     	mov	x29, sp
  9ec7e0: 1e204001     	fmov	s1, s0
  9ec7e4: f9000bf3     	str	x19, [sp, #0x10]
  9ec7e8: aa0003f3     	mov	x19, x0
  9ec7ec: 94005419     	bl	0xa01850 <_ZN7cocos2d4Vec3C2Efff>
  9ec7f0: 1e2703e0     	fmov	s0, wzr
  9ec7f4: bd000e60     	str	s0, [x19, #0xc]
  9ec7f8: f9400bf3     	ldr	x19, [sp, #0x10]
  9ec7fc: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ec800: d65f03c0     	ret

00000000009ec804 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_S3_>:
  9ec804: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
  9ec808: 910003fd     	mov	x29, sp
  9ec80c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ec810: 90002ab3     	adrp	x19, 0xf40000
  9ec814: aa0003f4     	mov	x20, x0
  9ec818: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ec81c: aa0103f5     	mov	x21, x1
  9ec820: aa0203f6     	mov	x22, x2
  9ec824: aa0203e1     	mov	x1, x2
  9ec828: f940e662     	ldr	x2, [x19, #0x1c8]
  9ec82c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ec830: 910163b7     	add	x23, x29, #0x58
  9ec834: f90027a3     	str	x3, [x29, #0x48]
  9ec838: f9400042     	ldr	x2, [x2]
  9ec83c: aa1703e0     	mov	x0, x23
  9ec840: f9003fa2     	str	x2, [x29, #0x78]
  9ec844: 9101a3b8     	add	x24, x29, #0x68
  9ec848: 9400541a     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec84c: bd405ba0     	ldr	s0, [x29, #0x58]
  9ec850: f94027a3     	ldr	x3, [x29, #0x48]
  9ec854: bd4002a2     	ldr	s2, [x21]
  9ec858: aa1803e0     	mov	x0, x24
  9ec85c: bd4006a1     	ldr	s1, [x21, #0x4]
  9ec860: aa0303e1     	mov	x1, x3
  9ec864: 1e223802     	fsub	s2, s0, s2
  9ec868: bd405fa0     	ldr	s0, [x29, #0x5c]
  9ec86c: bd400aa3     	ldr	s3, [x21, #0x8]
  9ec870: 1e213801     	fsub	s1, s0, s1
  9ec874: bd4063a0     	ldr	s0, [x29, #0x60]
  9ec878: bd005ba2     	str	s2, [x29, #0x58]
  9ec87c: 1e233800     	fsub	s0, s0, s3
  9ec880: bd005fa1     	str	s1, [x29, #0x5c]
  9ec884: bd0063a0     	str	s0, [x29, #0x60]
  9ec888: 9400540a     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec88c: bd406ba0     	ldr	s0, [x29, #0x68]
  9ec890: aa1703e0     	mov	x0, x23
  9ec894: bd4002c2     	ldr	s2, [x22]
  9ec898: aa1803e1     	mov	x1, x24
  9ec89c: bd4006c1     	ldr	s1, [x22, #0x4]
  9ec8a0: aa1403e2     	mov	x2, x20
  9ec8a4: 1e223802     	fsub	s2, s0, s2
  9ec8a8: bd406fa0     	ldr	s0, [x29, #0x6c]
  9ec8ac: bd400ac3     	ldr	s3, [x22, #0x8]
  9ec8b0: 1e213801     	fsub	s1, s0, s1
  9ec8b4: bd4073a0     	ldr	s0, [x29, #0x70]
  9ec8b8: bd006ba2     	str	s2, [x29, #0x68]
  9ec8bc: 1e233800     	fsub	s0, s0, s3
  9ec8c0: bd006fa1     	str	s1, [x29, #0x6c]
  9ec8c4: bd0073a0     	str	s0, [x29, #0x70]
  9ec8c8: 94005472     	bl	0xa01a90 <_ZN7cocos2d4Vec35crossERKS0_S2_PS0_>
  9ec8cc: aa1403e0     	mov	x0, x20
  9ec8d0: 940054ce     	bl	0xa01c08 <_ZN7cocos2d4Vec39normalizeEv>
  9ec8d4: aa1403e0     	mov	x0, x20
  9ec8d8: aa1503e1     	mov	x1, x21
  9ec8dc: 94005493     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ec8e0: aa1803e0     	mov	x0, x24
  9ec8e4: bd000e80     	str	s0, [x20, #0xc]
  9ec8e8: 940053d4     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec8ec: aa1703e0     	mov	x0, x23
  9ec8f0: 940053d2     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec8f4: f940e673     	ldr	x19, [x19, #0x1c8]
  9ec8f8: f9403fa1     	ldr	x1, [x29, #0x78]
  9ec8fc: f9400260     	ldr	x0, [x19]
  9ec900: eb00003f     	cmp	x1, x0
  9ec904: 540000c1     	b.ne	0x9ec91c <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_S3_+0x118>
  9ec908: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ec90c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ec910: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ec914: a8c87bfd     	ldp	x29, x30, [sp], #0x80
  9ec918: d65f03c0     	ret
  9ec91c: 97e6baa1     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ec920: aa0003f3     	mov	x19, x0
  9ec924: aa1803e0     	mov	x0, x24
  9ec928: 940053c4     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec92c: aa1703e0     	mov	x0, x23
  9ec930: 940053c2     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec934: aa1303e0     	mov	x0, x19
  9ec938: 9407d96a     	bl	0xbe2ee0 <_Unwind_Resume>
  9ec93c: aa0003f3     	mov	x19, x0
  9ec940: 17fffffb     	b	0x9ec92c <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_S3_+0x128>

00000000009ec944 <_ZN7cocos2d5PlaneC2ERKNS_4Vec3ES3_S3_>:
  9ec944: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9ec948: 910003fd     	mov	x29, sp
  9ec94c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ec950: aa0003f3     	mov	x19, x0
  9ec954: f90017a1     	str	x1, [x29, #0x28]
  9ec958: f9001ba2     	str	x2, [x29, #0x30]
  9ec95c: f9001fa3     	str	x3, [x29, #0x38]
  9ec960: 940053b7     	bl	0xa0183c <_ZN7cocos2d4Vec3C2Ev>
  9ec964: f94017a1     	ldr	x1, [x29, #0x28]
  9ec968: aa1303e0     	mov	x0, x19
  9ec96c: f9401ba2     	ldr	x2, [x29, #0x30]
  9ec970: f9401fa3     	ldr	x3, [x29, #0x38]
  9ec974: 97ffffa4     	bl	0x9ec804 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_S3_>
  9ec978: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ec97c: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9ec980: d65f03c0     	ret
  9ec984: aa0003f4     	mov	x20, x0
  9ec988: aa1303e0     	mov	x0, x19
  9ec98c: 940053ab     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ec990: aa1403e0     	mov	x0, x20
  9ec994: 9407d953     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>:
  9ec998: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9ec99c: 910003fd     	mov	x29, sp
  9ec9a0: bd400423     	ldr	s3, [x1, #0x4]
  9ec9a4: 6d02a7e8     	stp	d8, d9, [sp, #0x28]
  9ec9a8: bd400022     	ldr	s2, [x1]
  9ec9ac: f90013f5     	str	x21, [sp, #0x20]
  9ec9b0: 1e230863     	fmul	s3, s3, s3
  9ec9b4: bd400821     	ldr	s1, [x1, #0x8]
  9ec9b8: 1e204009     	fmov	s9, s0
  9ec9bc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ec9c0: 1f020c42     	fmadd	s2, s2, s2, s3
  9ec9c4: 90002ab3     	adrp	x19, 0xf40000
  9ec9c8: aa0003f4     	mov	x20, x0
  9ec9cc: f940e660     	ldr	x0, [x19, #0x1c8]
  9ec9d0: f9400000     	ldr	x0, [x0]
  9ec9d4: f90037a0     	str	x0, [x29, #0x68]
  9ec9d8: 1f010821     	fmadd	s1, s1, s1, s2
  9ec9dc: 1e21c020     	fsqrt	s0, s1
  9ec9e0: 1e202000     	fcmp	s0, s0
  9ec9e4: 54000421     	b.ne	0x9eca68 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef+0xd0>
  9ec9e8: 1e2e1001     	fmov	s1, #1.00000000
  9ec9ec: 910163b5     	add	x21, x29, #0x58
  9ec9f0: aa1503e0     	mov	x0, x21
  9ec9f4: 1e201828     	fdiv	s8, s1, s0
  9ec9f8: 940053ae     	bl	0xa018b0 <_ZN7cocos2d4Vec3C2ERKS0_>
  9ec9fc: bd405ba2     	ldr	s2, [x29, #0x58]
  9eca00: aa1503e0     	mov	x0, x21
  9eca04: bd405fa1     	ldr	s1, [x29, #0x5c]
  9eca08: bd4063a0     	ldr	s0, [x29, #0x60]
  9eca0c: 1e280842     	fmul	s2, s2, s8
  9eca10: 1e210901     	fmul	s1, s8, s1
  9eca14: 1e200900     	fmul	s0, s8, s0
  9eca18: bd005ba2     	str	s2, [x29, #0x58]
  9eca1c: bd005fa1     	str	s1, [x29, #0x5c]
  9eca20: f9402fa1     	ldr	x1, [x29, #0x58]
  9eca24: bd0063a0     	str	s0, [x29, #0x60]
  9eca28: f9000281     	str	x1, [x20]
  9eca2c: b94063a1     	ldr	w1, [x29, #0x60]
  9eca30: b9000a81     	str	w1, [x20, #0x8]
  9eca34: 94005381     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9eca38: 1e280928     	fmul	s8, s9, s8
  9eca3c: f94037a1     	ldr	x1, [x29, #0x68]
  9eca40: bd000e88     	str	s8, [x20, #0xc]
  9eca44: f940e673     	ldr	x19, [x19, #0x1c8]
  9eca48: f9400260     	ldr	x0, [x19]
  9eca4c: eb00003f     	cmp	x1, x0
  9eca50: 54000161     	b.ne	0x9eca7c <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef+0xe4>
  9eca54: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9eca58: 6d42a7e8     	ldp	d8, d9, [sp, #0x28]
  9eca5c: f94013f5     	ldr	x21, [sp, #0x20]
  9eca60: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9eca64: d65f03c0     	ret
  9eca68: 1e204020     	fmov	s0, s1
  9eca6c: f90027a1     	str	x1, [x29, #0x48]
  9eca70: 97e6b960     	bl	0x39aff0 <sqrtf@plt>
  9eca74: f94027a1     	ldr	x1, [x29, #0x48]
  9eca78: 17ffffdc     	b	0x9ec9e8 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef+0x50>
  9eca7c: 97e6ba49     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009eca80 <_ZN7cocos2d5PlaneC2ERKNS_4Vec3Ef>:
  9eca80: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9eca84: 910003fd     	mov	x29, sp
  9eca88: a90153f3     	stp	x19, x20, [sp, #0x10]
  9eca8c: 3d800fa0     	str	q0, [x29, #0x30]
  9eca90: aa0003f3     	mov	x19, x0
  9eca94: f90017a1     	str	x1, [x29, #0x28]
  9eca98: 94005369     	bl	0xa0183c <_ZN7cocos2d4Vec3C2Ev>
  9eca9c: 3dc00fa0     	ldr	q0, [x29, #0x30]
  9ecaa0: f94017a1     	ldr	x1, [x29, #0x28]
  9ecaa4: aa1303e0     	mov	x0, x19
  9ecaa8: 97ffffbc     	bl	0x9ec998 <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3Ef>
  9ecaac: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ecab0: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9ecab4: d65f03c0     	ret
  9ecab8: aa0003f4     	mov	x20, x0
  9ecabc: aa1303e0     	mov	x0, x19
  9ecac0: 9400535e     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ecac4: aa1403e0     	mov	x0, x20
  9ecac8: 9407d906     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ecacc <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_>:
  9ecacc: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9ecad0: 910003fd     	mov	x29, sp
  9ecad4: f9000bf3     	str	x19, [sp, #0x10]
  9ecad8: aa0003f3     	mov	x19, x0
  9ecadc: f9400023     	ldr	x3, [x1]
  9ecae0: f9000003     	str	x3, [x0]
  9ecae4: f90017a2     	str	x2, [x29, #0x28]
  9ecae8: b9400821     	ldr	w1, [x1, #0x8]
  9ecaec: b9000801     	str	w1, [x0, #0x8]
  9ecaf0: 94005446     	bl	0xa01c08 <_ZN7cocos2d4Vec39normalizeEv>
  9ecaf4: f94017a2     	ldr	x2, [x29, #0x28]
  9ecaf8: aa1303e0     	mov	x0, x19
  9ecafc: aa0203e1     	mov	x1, x2
  9ecb00: 9400540a     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ecb04: bd000e60     	str	s0, [x19, #0xc]
  9ecb08: f9400bf3     	ldr	x19, [sp, #0x10]
  9ecb0c: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9ecb10: d65f03c0     	ret

00000000009ecb14 <_ZN7cocos2d5PlaneC2ERKNS_4Vec3ES3_>:
  9ecb14: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9ecb18: 910003fd     	mov	x29, sp
  9ecb1c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ecb20: aa0003f3     	mov	x19, x0
  9ecb24: f90013a1     	str	x1, [x29, #0x20]
  9ecb28: f90017a2     	str	x2, [x29, #0x28]
  9ecb2c: 94005344     	bl	0xa0183c <_ZN7cocos2d4Vec3C2Ev>
  9ecb30: f94013a1     	ldr	x1, [x29, #0x20]
  9ecb34: aa1303e0     	mov	x0, x19
  9ecb38: f94017a2     	ldr	x2, [x29, #0x28]
  9ecb3c: 97ffffe4     	bl	0x9ecacc <_ZN7cocos2d5Plane9initPlaneERKNS_4Vec3ES3_>
  9ecb40: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ecb44: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9ecb48: d65f03c0     	ret
  9ecb4c: aa0003f4     	mov	x20, x0
  9ecb50: aa1303e0     	mov	x0, x19
  9ecb54: 94005339     	bl	0xa01838 <_ZN7cocos2d4Vec3D2Ev>
  9ecb58: aa1403e0     	mov	x0, x20
  9ecb5c: 9407d8e1     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ecb60 <_ZNK7cocos2d5Plane10dist2PlaneERKNS_4Vec3E>:
  9ecb60: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ecb64: 910003fd     	mov	x29, sp
  9ecb68: f9000bf3     	str	x19, [sp, #0x10]
  9ecb6c: aa0003f3     	mov	x19, x0
  9ecb70: 940053ee     	bl	0xa01b28 <_ZNK7cocos2d4Vec33dotERKS0_>
  9ecb74: bd400e61     	ldr	s1, [x19, #0xc]
  9ecb78: f9400bf3     	ldr	x19, [sp, #0x10]
  9ecb7c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ecb80: 1e213800     	fsub	s0, s0, s1
  9ecb84: d65f03c0     	ret

00000000009ecb88 <_ZNK7cocos2d5Plane7getSideERKNS_4Vec3E>:
  9ecb88: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9ecb8c: 910003fd     	mov	x29, sp
  9ecb90: 97fffff4     	bl	0x9ecb60 <_ZNK7cocos2d5Plane10dist2PlaneERKNS_4Vec3E>
  9ecb94: 1e202018     	fcmpe	s0, #0.0
  9ecb98: 52800020     	mov	w0, #0x1                // =1
  9ecb9c: 5400006c     	b.gt	0x9ecba8 <_ZNK7cocos2d5Plane7getSideERKNS_4Vec3E+0x20>
  9ecba0: 52800040     	mov	w0, #0x2                // =2
  9ecba4: 1a9f4000     	csel	w0, w0, wzr, mi
  9ecba8: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ecbac: d65f03c0     	ret

00000000009ecbb0 <_ZN7cocos2d9FileUtils11writeToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_>:
  9ecbb0: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9ecbb4: 910003fd     	mov	x29, sp
  9ecbb8: f9400003     	ldr	x3, [x0]
  9ecbbc: f9406863     	ldr	x3, [x3, #0xd0]
  9ecbc0: d63f0060     	blr	x3
  9ecbc4: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ecbc8: d65f03c0     	ret

00000000009ecbcc <_ZN7cocos2d9FileUtils10resetCacheEj>:
  9ecbcc: b9484407     	ldr	w7, [x0, #0x844]
  9ecbd0: 52891a63     	mov	w3, #0x48d3             // =18643
  9ecbd4: 72a22243     	movk	w3, #0x1112, lsl #16
  9ecbd8: b9484809     	ldr	w9, [x0, #0x848]
  9ecbdc: 528125a2     	mov	w2, #0x92d              // =2349
  9ecbe0: 529feeea     	mov	w10, #0xff77            // =65399
  9ecbe4: 0b0704e7     	add	w7, w7, w7, lsl #1
  9ecbe8: 72a40222     	movk	w2, #0x2011, lsl #16
  9ecbec: 0b090529     	add	w9, w9, w9, lsl #1
  9ecbf0: 72a00eea     	movk	w10, #0x77, lsl #16
  9ecbf4: 9ba37ce6     	umull	x6, w7, w3
  9ecbf8: 9ba27d22     	umull	x2, w9, w2
  9ecbfc: d360fcc6     	lsr	x6, x6, #32
  9ecc00: 528effec     	mov	w12, #0x77ff            // =30719
  9ecc04: 4b0600e3     	sub	w3, w7, w6
  9ecc08: d360fc42     	lsr	x2, x2, #32
  9ecc0c: 72a01fec     	movk	w12, #0xff, lsl #16
  9ecc10: 52891a65     	mov	w5, #0x48d3             // =18643
  9ecc14: 0b4304c3     	add	w3, w6, w3, lsr #1
  9ecc18: 53157c42     	lsr	w2, w2, #21
  9ecc1c: 53167c63     	lsr	w3, w3, #22
  9ecc20: 72a22245     	movk	w5, #0x1112, lsl #16
  9ecc24: 1b0ca442     	msub	w2, w2, w12, w9
  9ecc28: 1b0a9c63     	msub	w3, w3, w10, w7
  9ecc2c: 8b214807     	add	x7, x0, w1, uxtw #2
  9ecc30: 11040029     	add	w9, w1, #0x100
  9ecc34: 528125a4     	mov	w4, #0x92d              // =2349
  9ecc38: 0b02044c     	add	w12, w2, w2, lsl #1
  9ecc3c: 72a40224     	movk	w4, #0x2011, lsl #16
  9ecc40: 0b03046a     	add	w10, w3, w3, lsl #1
  9ecc44: 529feee8     	mov	w8, #0xff77             // =65399
  9ecc48: 9ba47d84     	umull	x4, w12, w4
  9ecc4c: 9ba57d41     	umull	x1, w10, w5
  9ecc50: 2a0803eb     	mov	w11, w8
  9ecc54: 528effe6     	mov	w6, #0x77ff             // =30719
  9ecc58: d360fc21     	lsr	x1, x1, #32
  9ecc5c: 72a00eeb     	movk	w11, #0x77, lsl #16
  9ecc60: 4b010145     	sub	w5, w10, w1
  9ecc64: d360fc84     	lsr	x4, x4, #32
  9ecc68: 32101ccd     	orr	w13, w6, #0xff0000
  9ecc6c: 53157c84     	lsr	w4, w4, #21
  9ecc70: 0b450425     	add	w5, w1, w5, lsr #1
  9ecc74: 0a060063     	and	w3, w3, w6
  9ecc78: 53167ca5     	lsr	w5, w5, #22
  9ecc7c: 91001129     	add	x9, x9, #0x4
  9ecc80: 1b04b1a4     	msub	w4, w13, w4, w12
  9ecc84: 1b0ba8a5     	msub	w5, w5, w11, w10
  9ecc88: 0a080042     	and	w2, w2, w8
  9ecc8c: 0a080088     	and	w8, w4, w8
  9ecc90: 0a0600a1     	and	w1, w5, w6
  9ecc94: 2a034043     	orr	w3, w2, w3, lsl #16
  9ecc98: b90010e3     	str	w3, [x7, #0x10]
  9ecc9c: 2a014101     	orr	w1, w8, w1, lsl #16
  9ecca0: b8297801     	str	w1, [x0, x9, lsl #2]
  9ecca4: b9084405     	str	w5, [x0, #0x844]
  9ecca8: b9084804     	str	w4, [x0, #0x848]
  9eccac: d65f03c0     	ret

00000000009eccb0 <_ZNK7cocos2d9FileUtils25getSearchResolutionsOrderEv>:
  9eccb0: 9122c000     	add	x0, x0, #0x8b0
  9eccb4: d65f03c0     	ret

00000000009eccb8 <_ZNK7cocos2d9FileUtils14getSearchPathsEv>:
  9eccb8: 91232000     	add	x0, x0, #0x8c8
  9eccbc: d65f03c0     	ret

00000000009eccc0 <_ZNK7cocos2d9FileUtils14isAbsolutePathERKSs>:
  9eccc0: f9400020     	ldr	x0, [x1]
  9eccc4: 39c00000     	ldrsb	w0, [x0]
  9eccc8: 7100bc1f     	cmp	w0, #0x2f
  9ecccc: 1a9f17e0     	cset	w0, eq
  9eccd0: d65f03c0     	ret

00000000009eccd4 <_ZN7cocos2d9FileUtils14setPopupNotifyEb>:
  9eccd4: 90002b80     	adrp	x0, 0xf5c000 <Gost28147_CryptoProParamSetB+0x78>
  9eccd8: 392f8001     	strb	w1, [x0, #0xbe0]
  9eccdc: d65f03c0     	ret

00000000009ecce0 <_ZNK7cocos2d9FileUtils13isPopupNotifyEv>:
  9ecce0: 90002b80     	adrp	x0, 0xf5c000 <Gost28147_CryptoProParamSetB+0x78>
  9ecce4: 396f8000     	ldrb	w0, [x0, #0xbe0]
  9ecce8: d65f03c0     	ret

00000000009eccec <_ZN7cocos2d9FileUtils15valueMapCompactERSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEE>:
  9eccec: d65f03c0     	ret

00000000009eccf0 <_ZN7cocos2d9FileUtils18valueVectorCompactERSt6vectorINS_5ValueESaIS2_EE>:
  9eccf0: d65f03c0     	ret

00000000009eccf4 <_ZN7cocos2d22ResizableBufferAdapterINS_4DataEED2Ev>:
  9eccf4: d65f03c0     	ret

00000000009eccf8 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EED2Ev>:
  9eccf8: d65f03c0     	ret

00000000009eccfc <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv>:
  9eccfc: aa0003e1     	mov	x1, x0
  9ecd00: 91004000     	add	x0, x0, #0x10
  9ecd04: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9ecd08: 910003fd     	mov	x29, sp
  9ecd0c: f9400821     	ldr	x1, [x1, #0x10]
  9ecd10: f9400021     	ldr	x1, [x1]
  9ecd14: d63f0020     	blr	x1
  9ecd18: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ecd1c: d65f03c0     	ret

00000000009ecd20 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEE6_M_runEv>:
  9ecd20: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9ecd24: 910003fd     	mov	x29, sp
  9ecd28: f9401401     	ldr	x1, [x0, #0x28]
  9ecd2c: f9400c02     	ldr	x2, [x0, #0x18]
  9ecd30: 36000121     	tbz	w1, #0x0, 0x9ecd54 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEE6_M_runEv+0x34>
  9ecd34: 9341fc21     	asr	x1, x1, #1
  9ecd38: f9401003     	ldr	x3, [x0, #0x20]
  9ecd3c: 8b010040     	add	x0, x2, x1
  9ecd40: f8616841     	ldr	x1, [x2, x1]
  9ecd44: f8636823     	ldr	x3, [x1, x3]
  9ecd48: d63f0060     	blr	x3
  9ecd4c: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ecd50: d65f03c0     	ret
  9ecd54: f9401003     	ldr	x3, [x0, #0x20]
  9ecd58: 8b810440     	add	x0, x2, x1, asr #1
  9ecd5c: d63f0060     	blr	x3
  9ecd60: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ecd64: d65f03c0     	ret

00000000009ecd68 <_ZN7cocos2d9FileUtils15setWritablePathERKSs>:
  9ecd68: 91248000     	add	x0, x0, #0x920
  9ecd6c: 14077755     	b	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>

00000000009ecd70 <_ZN7cocos2d9FileUtils10getdirpathEv>:
  9ecd70: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9ecd74: 910003fd     	mov	x29, sp
  9ecd78: f9000bf3     	str	x19, [sp, #0x10]
  9ecd7c: 90002ab3     	adrp	x19, 0xf40000
  9ecd80: f9443801     	ldr	x1, [x0, #0x870]
  9ecd84: 9100c3a2     	add	x2, x29, #0x30
  9ecd88: aa0803e0     	mov	x0, x8
  9ecd8c: f90017a8     	str	x8, [x29, #0x28]
  9ecd90: f940e673     	ldr	x19, [x19, #0x1c8]
  9ecd94: f9400263     	ldr	x3, [x19]
  9ecd98: f9001fa3     	str	x3, [x29, #0x38]
  9ecd9c: 9407688d     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ecda0: f9401fa2     	ldr	x2, [x29, #0x38]
  9ecda4: f9400261     	ldr	x1, [x19]
  9ecda8: f94017a8     	ldr	x8, [x29, #0x28]
  9ecdac: eb01005f     	cmp	x2, x1
  9ecdb0: aa0803e0     	mov	x0, x8
  9ecdb4: 54000081     	b.ne	0x9ecdc4 <_ZN7cocos2d9FileUtils10getdirpathEv+0x54>
  9ecdb8: f9400bf3     	ldr	x19, [sp, #0x10]
  9ecdbc: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9ecdc0: d65f03c0     	ret
  9ecdc4: 97e6b977     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009ecdc8 <_ZN7cocos2d22ResizableBufferAdapterINS_4DataEED0Ev>:
  9ecdc8: 14063c50     	b	0xb7bf08 <_ZdlPv>

00000000009ecdcc <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EED0Ev>:
  9ecdcc: 14063c4f     	b	0xb7bf08 <_ZdlPv>

00000000009ecdd0 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv>:
  9ecdd0: 14063c4e     	b	0xb7bf08 <_ZdlPv>

00000000009ecdd4 <_ZNK7cocos2d9FileUtils16getSuitableFOpenERKSs>:
  9ecdd4: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ecdd8: aa0803e0     	mov	x0, x8
  9ecddc: 910003fd     	mov	x29, sp
  9ecde0: f9000fa8     	str	x8, [x29, #0x18]
  9ecde4: 940776d7     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9ecde8: f9400fa8     	ldr	x8, [x29, #0x18]
  9ecdec: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ecdf0: aa0803e0     	mov	x0, x8
  9ecdf4: d65f03c0     	ret

00000000009ecdf8 <_ZN7cocos2d9FileUtils17writeStringToFileERKSsS2_>:
  9ecdf8: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9ecdfc: 910003fd     	mov	x29, sp
  9ece00: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ece04: 90002ab4     	adrp	x20, 0xf40000
  9ece08: 910123b3     	add	x19, x29, #0x48
  9ece0c: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ece10: aa0203f6     	mov	x22, x2
  9ece14: aa0003f5     	mov	x21, x0
  9ece18: f940e682     	ldr	x2, [x20, #0x1c8]
  9ece1c: aa1303e0     	mov	x0, x19
  9ece20: f9001fa1     	str	x1, [x29, #0x38]
  9ece24: f9400042     	ldr	x2, [x2]
  9ece28: f9002fa2     	str	x2, [x29, #0x58]
  9ece2c: 94009e40     	bl	0xa1472c <_ZN7cocos2d4DataC2Ev>
  9ece30: f9401fa1     	ldr	x1, [x29, #0x38]
  9ece34: aa1303e0     	mov	x0, x19
  9ece38: f9400021     	ldr	x1, [x1]
  9ece3c: f85e8022     	ldur	x2, [x1, #-0x18]
  9ece40: 94009e4a     	bl	0xa14768 <_ZN7cocos2d4Data7fastSetEPhl>
  9ece44: f94002a3     	ldr	x3, [x21]
  9ece48: aa1503e0     	mov	x0, x21
  9ece4c: aa1303e1     	mov	x1, x19
  9ece50: aa1603e2     	mov	x2, x22
  9ece54: f9406463     	ldr	x3, [x3, #0xc8]
  9ece58: d63f0060     	blr	x3
  9ece5c: 2a0003f5     	mov	w21, w0
  9ece60: d2800001     	mov	x1, #0x0                // =0
  9ece64: aa1303e0     	mov	x0, x19
  9ece68: d2800002     	mov	x2, #0x0                // =0
  9ece6c: 94009e3f     	bl	0xa14768 <_ZN7cocos2d4Data7fastSetEPhl>
  9ece70: aa1303e0     	mov	x0, x19
  9ece74: 94009e4b     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9ece78: f940e694     	ldr	x20, [x20, #0x1c8]
  9ece7c: f9402fa2     	ldr	x2, [x29, #0x58]
  9ece80: 2a1503e0     	mov	w0, w21
  9ece84: f9400281     	ldr	x1, [x20]
  9ece88: eb01005f     	cmp	x2, x1
  9ece8c: 540000a1     	b.ne	0x9ecea0 <_ZN7cocos2d9FileUtils17writeStringToFileERKSsS2_+0xa8>
  9ece90: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ece94: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ece98: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9ece9c: d65f03c0     	ret
  9ecea0: 97e6b940     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ecea4: aa0003f4     	mov	x20, x0
  9ecea8: aa1303e0     	mov	x0, x19
  9eceac: 94009e3d     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9eceb0: aa1403e0     	mov	x0, x20
  9eceb4: 9407d80b     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009eceb8 <_ZN7cocos2d9FileUtils15getDataFromFileERKSs>:
  9eceb8: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9ecebc: 910003fd     	mov	x29, sp
  9ecec0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ecec4: 90002ab3     	adrp	x19, 0xf40000
  9ecec8: f90013f5     	str	x21, [sp, #0x20]
  9ececc: aa0003f5     	mov	x21, x0
  9eced0: aa0803e0     	mov	x0, x8
  9eced4: aa0803f4     	mov	x20, x8
  9eced8: f9001fa1     	str	x1, [x29, #0x38]
  9ecedc: f940e662     	ldr	x2, [x19, #0x1c8]
  9ecee0: f9400042     	ldr	x2, [x2]
  9ecee4: f9002fa2     	str	x2, [x29, #0x58]
  9ecee8: 94009e11     	bl	0xa1472c <_ZN7cocos2d4DataC2Ev>
  9eceec: f9002bb4     	str	x20, [x29, #0x50]
  9ecef0: 90002ac3     	adrp	x3, 0xf44000
  9ecef4: f94002a4     	ldr	x4, [x21]
  9ecef8: f9401fa1     	ldr	x1, [x29, #0x38]
  9ecefc: aa1503e0     	mov	x0, x21
  9ecf00: 910123a2     	add	x2, x29, #0x48
  9ecf04: f9479063     	ldr	x3, [x3, #0xf20]
  9ecf08: f9401484     	ldr	x4, [x4, #0x28]
  9ecf0c: 91004063     	add	x3, x3, #0x10
  9ecf10: f90027a3     	str	x3, [x29, #0x48]
  9ecf14: d63f0080     	blr	x4
  9ecf18: f940e673     	ldr	x19, [x19, #0x1c8]
  9ecf1c: aa1403e0     	mov	x0, x20
  9ecf20: f9402fa2     	ldr	x2, [x29, #0x58]
  9ecf24: f9400261     	ldr	x1, [x19]
  9ecf28: eb01005f     	cmp	x2, x1
  9ecf2c: 540000a1     	b.ne	0x9ecf40 <_ZN7cocos2d9FileUtils15getDataFromFileERKSs+0x88>
  9ecf30: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ecf34: f94013f5     	ldr	x21, [sp, #0x20]
  9ecf38: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9ecf3c: d65f03c0     	ret
  9ecf40: 97e6b918     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ecf44: aa0003f3     	mov	x19, x0
  9ecf48: aa1403e0     	mov	x0, x20
  9ecf4c: 94009e15     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9ecf50: aa1303e0     	mov	x0, x19
  9ecf54: 9407d7e3     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ecf58 <_ZNK7cocos2d22ResizableBufferAdapterINS_4DataEE6bufferEv>:
  9ecf58: f9400400     	ldr	x0, [x0, #0x8]
  9ecf5c: 14009dff     	b	0xa14758 <_ZNK7cocos2d4Data8getBytesEv>

00000000009ecf60 <_ZN7cocos2d9FileUtils8setCacheEm>:
  9ecf60: b201f3e2     	mov	x2, #-0x5555555555555556 // =-6148914691236517206
  9ecf64: 53196024     	lsl	w4, w1, #7
  9ecf68: 91000442     	add	x2, x2, #0x1
  9ecf6c: 53185c23     	lsl	w3, w1, #8
  9ecf70: 4b010084     	sub	w4, w4, w1
  9ecf74: 4b010463     	sub	w3, w3, w1, lsl #1
  9ecf78: 9bc27c22     	umulh	x2, x1, x2
  9ecf7c: f9443006     	ldr	x6, [x0, #0x860]
  9ecf80: d341fc42     	lsr	x2, x2, #1
  9ecf84: f9443805     	ldr	x5, [x0, #0x870]
  9ecf88: 8b020442     	add	x2, x2, x2, lsl #1
  9ecf8c: cb020021     	sub	x1, x1, x2
  9ecf90: 8b010801     	add	x1, x0, x1, lsl #2
  9ecf94: b9483422     	ldr	w2, [x1, #0x834]
  9ecf98: 4b040044     	sub	w4, w2, w4
  9ecf9c: b9000804     	str	w4, [x0, #0x8]
  9ecfa0: b9483821     	ldr	w1, [x1, #0x838]
  9ecfa4: 4b030023     	sub	w3, w1, w3
  9ecfa8: b9000c03     	str	w3, [x0, #0xc]
  9ecfac: 394000c0     	ldrb	w0, [x6]
  9ecfb0: 8b002000     	add	x0, x0, x0, lsl #8
  9ecfb4: 8b004000     	add	x0, x0, x0, lsl #16
  9ecfb8: 8b008000     	add	x0, x0, x0, lsl #32
  9ecfbc: f90000a0     	str	x0, [x5]
  9ecfc0: d65f03c0     	ret

00000000009ecfc4 <_ZN7cocos2d9FileUtils11getFileSizeEPKcPj>:
  9ecfc4: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9ecfc8: 910003fd     	mov	x29, sp
  9ecfcc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ecfd0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ecfd4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ecfd8: aa0003f4     	mov	x20, x0
  9ecfdc: aa0103f3     	mov	x19, x1
  9ecfe0: 39400020     	ldrb	w0, [x1]
  9ecfe4: aa0203f8     	mov	x24, x2
  9ecfe8: 34000440     	cbz	w0, 0x9ed070 <_ZN7cocos2d9FileUtils11getFileSizeEPKcPj+0xac>
  9ecfec: b9400056     	ldr	w22, [x2]
  9ecff0: aa0103f7     	mov	x23, x1
  9ecff4: b9400455     	ldr	w21, [x2, #0x4]
  9ecff8: 97e6b7ca     	bl	0x39af20 <tolower@plt>
  9ecffc: 910006f7     	add	x23, x23, #0x1
  9ed000: 52901023     	mov	w3, #0x8081             // =32897
  9ed004: 4b1302e1     	sub	w1, w23, w19
  9ed008: 72b01003     	movk	w3, #0x8080, lsl #16
  9ed00c: 0b010001     	add	w1, w0, w1
  9ed010: 531c6c24     	lsl	w4, w1, #4
  9ed014: 531b6825     	lsl	w5, w1, #5
  9ed018: 9ba37c03     	umull	x3, w0, w3
  9ed01c: 4b010884     	sub	w4, w4, w1, lsl #2
  9ed020: 4b0100a5     	sub	w5, w5, w1
  9ed024: d360fc63     	lsr	x3, x3, #32
  9ed028: 0b010081     	add	w1, w4, w1
  9ed02c: 53077c63     	lsr	w3, w3, #7
  9ed030: 0b150021     	add	w1, w1, w21
  9ed034: 53185c64     	lsl	w4, w3, #8
  9ed038: 0b160036     	add	w22, w1, w22
  9ed03c: 4b030083     	sub	w3, w4, w3
  9ed040: 0b1500b5     	add	w21, w5, w21
  9ed044: 4b030003     	sub	w3, w0, w3
  9ed048: 8b030a81     	add	x1, x20, x3, lsl #2
  9ed04c: b9401022     	ldr	w2, [x1, #0x10]
  9ed050: 4a0202d6     	eor	w22, w22, w2
  9ed054: b9000316     	str	w22, [x24]
  9ed058: 0b1602b5     	add	w21, w21, w22
  9ed05c: b9401022     	ldr	w2, [x1, #0x10]
  9ed060: 4a0202b5     	eor	w21, w21, w2
  9ed064: b9000715     	str	w21, [x24, #0x4]
  9ed068: 394002e0     	ldrb	w0, [x23]
  9ed06c: 35fffc60     	cbnz	w0, 0x9ecff8 <_ZN7cocos2d9FileUtils11getFileSizeEPKcPj+0x34>
  9ed070: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed074: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ed078: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ed07c: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9ed080: d65f03c0     	ret

00000000009ed084 <_ZN7cocos2d9FileUtils7unZlibsEPcj>:
  9ed084: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ed088: d2a02004     	mov	x4, #0x1000000          // =16777216
  9ed08c: 910003fd     	mov	x29, sp
  9ed090: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed094: f0002a93     	adrp	x19, 0xf40000
  9ed098: 910143b4     	add	x20, x29, #0x50
  9ed09c: f9001bf7     	str	x23, [sp, #0x30]
  9ed0a0: 2a0203f7     	mov	w23, w2
  9ed0a4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ed0a8: f940e673     	ldr	x19, [x19, #0x1c8]
  9ed0ac: aa0103f5     	mov	x21, x1
  9ed0b0: aa0403e0     	mov	x0, x4
  9ed0b4: d2800021     	mov	x1, #0x1                // =1
  9ed0b8: f81f0e84     	str	x4, [x20, #-0x10]!
  9ed0bc: f9400262     	ldr	x2, [x19]
  9ed0c0: f90027a2     	str	x2, [x29, #0x48]
  9ed0c4: 97e6ba63     	bl	0x39ba50 <calloc@plt>
  9ed0c8: aa0003f6     	mov	x22, x0
  9ed0cc: aa1403e1     	mov	x1, x20
  9ed0d0: aa1503e2     	mov	x2, x21
  9ed0d4: 2a1703e3     	mov	w3, w23
  9ed0d8: 94062fa4     	bl	0xb78f68 <uncompress>
  9ed0dc: 6b1f001f     	cmp	w0, wzr
  9ed0e0: f94027a2     	ldr	x2, [x29, #0x48]
  9ed0e4: 9a9502c0     	csel	x0, x22, x21, eq
  9ed0e8: f9400261     	ldr	x1, [x19]
  9ed0ec: eb01005f     	cmp	x2, x1
  9ed0f0: 540000c1     	b.ne	0x9ed108 <_ZN7cocos2d9FileUtils7unZlibsEPcj+0x84>
  9ed0f4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed0f8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ed0fc: f9401bf7     	ldr	x23, [sp, #0x30]
  9ed100: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9ed104: d65f03c0     	ret
  9ed108: 97e6b8a6     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009ed10c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii>:
  9ed10c: f0002a87     	adrp	x7, 0xf40000
  9ed110: 710004bf     	cmp	w5, #0x1
  9ed114: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9ed118: 910003fd     	mov	x29, sp
  9ed11c: f940e4e0     	ldr	x0, [x7, #0x1c8]
  9ed120: f9400000     	ldr	x0, [x0]
  9ed124: f9002fa0     	str	x0, [x29, #0x58]
  9ed128: 54000200     	b.eq	0x9ed168 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x5c>
  9ed12c: 710008bf     	cmp	w5, #0x2
  9ed130: 54000960     	b.eq	0x9ed25c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x150>
  9ed134: 71000cbf     	cmp	w5, #0x3
  9ed138: 54000a00     	b.eq	0x9ed278 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x16c>
  9ed13c: b9400081     	ldr	w1, [x4]
  9ed140: 91000860     	add	x0, x3, #0x2
  9ed144: 51000821     	sub	w1, w1, #0x2
  9ed148: b9000081     	str	w1, [x4]
  9ed14c: f940e4e7     	ldr	x7, [x7, #0x1c8]
  9ed150: f9402fa2     	ldr	x2, [x29, #0x58]
  9ed154: f94000e1     	ldr	x1, [x7]
  9ed158: eb01005f     	cmp	x2, x1
  9ed15c: 54000a01     	b.ne	0x9ed29c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x190>
  9ed160: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9ed164: d65f03c0     	ret
  9ed168: 39400060     	ldrb	w0, [x3]
  9ed16c: 7100801f     	cmp	w0, #0x20
  9ed170: 54fffe61     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed174: 39400460     	ldrb	w0, [x3, #0x1]
  9ed178: 7100f81f     	cmp	w0, #0x3e
  9ed17c: 54fffe01     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed180: b9400085     	ldr	w5, [x4]
  9ed184: 91000860     	add	x0, x3, #0x2
  9ed188: 510008a5     	sub	w5, w5, #0x2
  9ed18c: b9000085     	str	w5, [x4]
  9ed190: 7100fcbf     	cmp	w5, #0x3f
  9ed194: 54fffdcd     	b.le	0x9ed14c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x40>
  9ed198: 39c00025     	ldrsb	w5, [x1]
  9ed19c: 340007c5     	cbz	w5, 0x9ed294 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x188>
  9ed1a0: 12001842     	and	w2, w2, #0x7f
  9ed1a4: 52800006     	mov	w6, #0x0                // =0
  9ed1a8: 5280a428     	mov	w8, #0x521              // =1313
  9ed1ac: 1b087ca4     	mul	w4, w5, w8
  9ed1b0: 38c01c25     	ldrsb	w5, [x1, #0x1]!
  9ed1b4: 531d7084     	lsl	w4, w4, #3
  9ed1b8: 1b0210c6     	madd	w6, w6, w2, w4
  9ed1bc: 35ffff85     	cbnz	w5, 0x9ed1ac <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0xa0>
  9ed1c0: b840206c     	ldur	w12, [x3, #0x2]
  9ed1c4: 91008862     	add	x2, x3, #0x22
  9ed1c8: b840a06b     	ldur	w11, [x3, #0xa]
  9ed1cc: 910063a1     	add	x1, x29, #0x18
  9ed1d0: b841206a     	ldur	w10, [x3, #0x12]
  9ed1d4: 4a06018c     	eor	w12, w12, w6
  9ed1d8: b841a069     	ldur	w9, [x3, #0x1a]
  9ed1dc: 4a06016b     	eor	w11, w11, w6
  9ed1e0: b8422068     	ldur	w8, [x3, #0x22]
  9ed1e4: 4a06014a     	eor	w10, w10, w6
  9ed1e8: b842a065     	ldur	w5, [x3, #0x2a]
  9ed1ec: 4a060129     	eor	w9, w9, w6
  9ed1f0: b8432064     	ldur	w4, [x3, #0x32]
  9ed1f4: 4a060108     	eor	w8, w8, w6
  9ed1f8: b843a06d     	ldur	w13, [x3, #0x3a]
  9ed1fc: 4a0600a5     	eor	w5, w5, w6
  9ed200: b800206c     	stur	w12, [x3, #0x2]
  9ed204: 4a060084     	eor	w4, w4, w6
  9ed208: b800a06b     	stur	w11, [x3, #0xa]
  9ed20c: 4a0601a6     	eor	w6, w13, w6
  9ed210: b801206a     	stur	w10, [x3, #0x12]
  9ed214: b801a069     	stur	w9, [x3, #0x1a]
  9ed218: b8022068     	stur	w8, [x3, #0x22]
  9ed21c: b802a065     	stur	w5, [x3, #0x2a]
  9ed220: b8032064     	stur	w4, [x3, #0x32]
  9ed224: b803a066     	stur	w6, [x3, #0x3a]
  9ed228: a9027c3f     	stp	xzr, xzr, [x1, #0x20]
  9ed22c: a9402448     	ldp	x8, x9, [x2]
  9ed230: a9402c0a     	ldp	x10, x11, [x0]
  9ed234: a9002408     	stp	x8, x9, [x0]
  9ed238: a9411404     	ldp	x4, x5, [x0, #0x10]
  9ed23c: a9412448     	ldp	x8, x9, [x2, #0x10]
  9ed240: a9012408     	stp	x8, x9, [x0, #0x10]
  9ed244: a9037c3f     	stp	xzr, xzr, [x1, #0x30]
  9ed248: a9002c2a     	stp	x10, x11, [x1]
  9ed24c: a9011424     	stp	x4, x5, [x1, #0x10]
  9ed250: a9002c4a     	stp	x10, x11, [x2]
  9ed254: a9011444     	stp	x4, x5, [x2, #0x10]
  9ed258: 17ffffbd     	b	0x9ed14c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x40>
  9ed25c: 39400060     	ldrb	w0, [x3]
  9ed260: 7100ec1f     	cmp	w0, #0x3b
  9ed264: 54fff6c1     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed268: 39400460     	ldrb	w0, [x3, #0x1]
  9ed26c: 7103801f     	cmp	w0, #0xe0
  9ed270: 54fff661     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed274: 17ffffc3     	b	0x9ed180 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x74>
  9ed278: 39400060     	ldrb	w0, [x3]
  9ed27c: 7100ac1f     	cmp	w0, #0x2b
  9ed280: 54fff5e1     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed284: 39400460     	ldrb	w0, [x3, #0x1]
  9ed288: 71012c1f     	cmp	w0, #0x4b
  9ed28c: 54fff581     	b.ne	0x9ed13c <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x30>
  9ed290: 17ffffbc     	b	0x9ed180 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0x74>
  9ed294: 52800006     	mov	w6, #0x0                // =0
  9ed298: 17ffffca     	b	0x9ed1c0 <_ZN7cocos2d9FileUtils13isFileExist__EPKcjPKhRii+0xb4>
  9ed29c: 97e6b841     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009ed2a0 <_ZN7cocos2d9FileUtils11getFileDataERKSsPKcPl>:
  9ed2a0: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9ed2a4: 910003fd     	mov	x29, sp
  9ed2a8: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed2ac: f0002a93     	adrp	x19, 0xf40000
  9ed2b0: 910123b4     	add	x20, x29, #0x48
  9ed2b4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ed2b8: aa0003f5     	mov	x21, x0
  9ed2bc: aa1403e0     	mov	x0, x20
  9ed2c0: f940e662     	ldr	x2, [x19, #0x1c8]
  9ed2c4: aa0303f6     	mov	x22, x3
  9ed2c8: f9001fa1     	str	x1, [x29, #0x38]
  9ed2cc: f9400042     	ldr	x2, [x2]
  9ed2d0: f90037a2     	str	x2, [x29, #0x68]
  9ed2d4: 94009d16     	bl	0xa1472c <_ZN7cocos2d4DataC2Ev>
  9ed2d8: f90033b4     	str	x20, [x29, #0x60]
  9ed2dc: f0002aa3     	adrp	x3, 0xf44000
  9ed2e0: f94002a4     	ldr	x4, [x21]
  9ed2e4: f9401fa1     	ldr	x1, [x29, #0x38]
  9ed2e8: aa1503e0     	mov	x0, x21
  9ed2ec: 910163a2     	add	x2, x29, #0x58
  9ed2f0: f9479063     	ldr	x3, [x3, #0xf20]
  9ed2f4: f9401484     	ldr	x4, [x4, #0x28]
  9ed2f8: 91004063     	add	x3, x3, #0x10
  9ed2fc: f9002fa3     	str	x3, [x29, #0x58]
  9ed300: d63f0080     	blr	x4
  9ed304: 35000220     	cbnz	w0, 0x9ed348 <_ZN7cocos2d9FileUtils11getFileDataERKSsPKcPl+0xa8>
  9ed308: aa1403e0     	mov	x0, x20
  9ed30c: aa1603e1     	mov	x1, x22
  9ed310: 94009d69     	bl	0xa148b4 <_ZN7cocos2d4Data10takeBufferEPl>
  9ed314: aa0003f5     	mov	x21, x0
  9ed318: aa1403e0     	mov	x0, x20
  9ed31c: 94009d21     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9ed320: f940e673     	ldr	x19, [x19, #0x1c8]
  9ed324: f94037a2     	ldr	x2, [x29, #0x68]
  9ed328: aa1503e0     	mov	x0, x21
  9ed32c: f9400261     	ldr	x1, [x19]
  9ed330: eb01005f     	cmp	x2, x1
  9ed334: 54000101     	b.ne	0x9ed354 <_ZN7cocos2d9FileUtils11getFileDataERKSsPKcPl+0xb4>
  9ed338: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed33c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ed340: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9ed344: d65f03c0     	ret
  9ed348: f90002df     	str	xzr, [x22]
  9ed34c: d2800015     	mov	x21, #0x0               // =0
  9ed350: 17fffff2     	b	0x9ed318 <_ZN7cocos2d9FileUtils11getFileDataERKSsPKcPl+0x78>
  9ed354: 97e6b813     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ed358: aa0003f3     	mov	x19, x0
  9ed35c: aa1403e0     	mov	x0, x20
  9ed360: 94009d10     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9ed364: aa1303e0     	mov	x0, x19
  9ed368: 9407d6de     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ed36c <_ZNK7cocos2d9FileUtils24isDirectoryExistInternalERKSs>:
  9ed36c: a9b57bfd     	stp	x29, x30, [sp, #-0xb0]!
  9ed370: 910003fd     	mov	x29, sp
  9ed374: f9000bf3     	str	x19, [sp, #0x10]
  9ed378: f0002a93     	adrp	x19, 0xf40000
  9ed37c: f9400020     	ldr	x0, [x1]
  9ed380: 9100a3a1     	add	x1, x29, #0x28
  9ed384: f940e662     	ldr	x2, [x19, #0x1c8]
  9ed388: f9400042     	ldr	x2, [x2]
  9ed38c: f90057a2     	str	x2, [x29, #0xa8]
  9ed390: 97e6b9fc     	bl	0x39bb80 <stat@plt>
  9ed394: 52800001     	mov	w1, #0x0                // =0
  9ed398: 350000a0     	cbnz	w0, 0x9ed3ac <_ZNK7cocos2d9FileUtils24isDirectoryExistInternalERKSs+0x40>
  9ed39c: b9403ba0     	ldr	w0, [x29, #0x38]
  9ed3a0: 12140c00     	and	w0, w0, #0xf000
  9ed3a4: 7140101f     	cmp	w0, #0x4, lsl #12       // =0x4000
  9ed3a8: 1a9f17e1     	cset	w1, eq
  9ed3ac: f940e673     	ldr	x19, [x19, #0x1c8]
  9ed3b0: 2a0103e0     	mov	w0, w1
  9ed3b4: f94057a2     	ldr	x2, [x29, #0xa8]
  9ed3b8: f9400261     	ldr	x1, [x19]
  9ed3bc: eb01005f     	cmp	x2, x1
  9ed3c0: 54000081     	b.ne	0x9ed3d0 <_ZNK7cocos2d9FileUtils24isDirectoryExistInternalERKSs+0x64>
  9ed3c4: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed3c8: a8cb7bfd     	ldp	x29, x30, [sp], #0xb0
  9ed3cc: d65f03c0     	ret
  9ed3d0: 97e6b7f4     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009ed3d4 <_ZN7cocos2d9FileUtils10removeFileERKSs>:
  9ed3d4: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9ed3d8: 910003fd     	mov	x29, sp
  9ed3dc: f9400020     	ldr	x0, [x1]
  9ed3e0: 97e6b650     	bl	0x39ad20 <remove@plt>
  9ed3e4: 6b1f001f     	cmp	w0, wzr
  9ed3e8: 1a9f17e0     	cset	w0, eq
  9ed3ec: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9ed3f0: d65f03c0     	ret

00000000009ed3f4 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_>:
  9ed3f4: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9ed3f8: 910003fd     	mov	x29, sp
  9ed3fc: f9000bf3     	str	x19, [sp, #0x10]
  9ed400: aa0103f3     	mov	x19, x1
  9ed404: f9400020     	ldr	x0, [x1]
  9ed408: f9400041     	ldr	x1, [x2]
  9ed40c: f90017a2     	str	x2, [x29, #0x28]
  9ed410: 97e6b5b8     	bl	0x39aaf0 <rename@plt>
  9ed414: 2a0003e3     	mov	w3, w0
  9ed418: f94017a2     	ldr	x2, [x29, #0x28]
  9ed41c: 52800020     	mov	w0, #0x1                // =1
  9ed420: 340000e3     	cbz	w3, 0x9ed43c <_ZN7cocos2d9FileUtils10renameFileERKSsS2_+0x48>
  9ed424: f9400261     	ldr	x1, [x19]
  9ed428: 90001620     	adrp	x0, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9ed42c: f9400042     	ldr	x2, [x2]
  9ed430: 9106e000     	add	x0, x0, #0x1b8
  9ed434: 94007607     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9ed438: 52800000     	mov	w0, #0x0                // =0
  9ed43c: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed440: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9ed444: d65f03c0     	ret

00000000009ed448 <_ZN7cocos2d22ResizableBufferAdapterINS_4DataEE6resizeEm>:
  9ed448: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ed44c: 910003fd     	mov	x29, sp
  9ed450: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed454: aa0003f4     	mov	x20, x0
  9ed458: f9400400     	ldr	x0, [x0, #0x8]
  9ed45c: aa0103f3     	mov	x19, x1
  9ed460: 94009cc0     	bl	0xa14760 <_ZNK7cocos2d4Data7getSizeEv>
  9ed464: eb13001f     	cmp	x0, x19
  9ed468: 54000083     	b.lo	0x9ed478 <_ZN7cocos2d22ResizableBufferAdapterINS_4DataEE6resizeEm+0x30>
  9ed46c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed470: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed474: d65f03c0     	ret
  9ed478: f9400680     	ldr	x0, [x20, #0x8]
  9ed47c: 94009cb7     	bl	0xa14758 <_ZNK7cocos2d4Data8getBytesEv>
  9ed480: aa1303e1     	mov	x1, x19
  9ed484: 97e6b64f     	bl	0x39adc0 <realloc@plt>
  9ed488: aa0003e1     	mov	x1, x0
  9ed48c: b4ffff00     	cbz	x0, 0x9ed46c <_ZN7cocos2d22ResizableBufferAdapterINS_4DataEE6resizeEm+0x24>
  9ed490: f9400680     	ldr	x0, [x20, #0x8]
  9ed494: aa1303e2     	mov	x2, x19
  9ed498: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed49c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed4a0: 14009cb2     	b	0xa14768 <_ZN7cocos2d4Data7fastSetEPhl>

00000000009ed4a4 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info>:
  9ed4a4: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ed4a8: 910003fd     	mov	x29, sp
  9ed4ac: f9400422     	ldr	x2, [x1, #0x8]
  9ed4b0: d0002aa1     	adrp	x1, 0xf43000
  9ed4b4: f9000bf3     	str	x19, [sp, #0x10]
  9ed4b8: aa0003f3     	mov	x19, x0
  9ed4bc: f945dc21     	ldr	x1, [x1, #0xbb8]
  9ed4c0: eb01005f     	cmp	x2, x1
  9ed4c4: 54000160     	b.eq	0x9ed4f0 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info+0x4c>
  9ed4c8: 39c00040     	ldrsb	w0, [x2]
  9ed4cc: 7100a81f     	cmp	w0, #0x2a
  9ed4d0: 54000080     	b.eq	0x9ed4e0 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info+0x3c>
  9ed4d4: aa0203e0     	mov	x0, x2
  9ed4d8: 97e6b902     	bl	0x39b8e0 <strcmp@plt>
  9ed4dc: 340000a0     	cbz	w0, 0x9ed4f0 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info+0x4c>
  9ed4e0: d2800000     	mov	x0, #0x0                // =0
  9ed4e4: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed4e8: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed4ec: d65f03c0     	ret
  9ed4f0: 91004260     	add	x0, x19, #0x10
  9ed4f4: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed4f8: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed4fc: d65f03c0     	ret

00000000009ed500 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_>:
  9ed500: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ed504: 910003fd     	mov	x29, sp
  9ed508: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed50c: f0002a94     	adrp	x20, 0xf40000
  9ed510: f9001bf7     	str	x23, [sp, #0x30]
  9ed514: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ed518: aa0203f6     	mov	x22, x2
  9ed51c: aa0103f7     	mov	x23, x1
  9ed520: f940e682     	ldr	x2, [x20, #0x1c8]
  9ed524: aa0003f5     	mov	x21, x0
  9ed528: aa0803e0     	mov	x0, x8
  9ed52c: aa0803f3     	mov	x19, x8
  9ed530: f9400042     	ldr	x2, [x2]
  9ed534: f90027a2     	str	x2, [x29, #0x48]
  9ed538: 94077502     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9ed53c: f94002e1     	ldr	x1, [x23]
  9ed540: f85e8020     	ldur	x0, [x1, #-0x18]
  9ed544: b4000300     	cbz	x0, 0x9ed5a4 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0xa4>
  9ed548: 8b000020     	add	x0, x1, x0
  9ed54c: 38dff000     	ldursb	w0, [x0, #-0x1]
  9ed550: 7100bc1f     	cmp	w0, #0x2f
  9ed554: 54000280     	b.eq	0x9ed5a4 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0xa4>
  9ed558: f9400260     	ldr	x0, [x19]
  9ed55c: f85e8001     	ldur	x1, [x0, #-0x18]
  9ed560: f85f0002     	ldur	x2, [x0, #-0x10]
  9ed564: 91000437     	add	x23, x1, #0x1
  9ed568: eb0202ff     	cmp	x23, x2
  9ed56c: 54000469     	b.ls	0x9ed5f8 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0xf8>
  9ed570: aa1303e0     	mov	x0, x19
  9ed574: aa1703e1     	mov	x1, x23
  9ed578: 940767ca     	bl	0xbc74a0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48e78>
  9ed57c: f9400260     	ldr	x0, [x19]
  9ed580: f85e8001     	ldur	x1, [x0, #-0x18]
  9ed584: 528005e2     	mov	w2, #0x2f               // =47
  9ed588: 38216802     	strb	w2, [x0, x1]
  9ed58c: 90002ae0     	adrp	x0, 0xf49000
  9ed590: f9400261     	ldr	x1, [x19]
  9ed594: f947ec00     	ldr	x0, [x0, #0xfd8]
  9ed598: d1006022     	sub	x2, x1, #0x18
  9ed59c: eb00005f     	cmp	x2, x0
  9ed5a0: 54000401     	b.ne	0x9ed620 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x120>
  9ed5a4: aa1303e0     	mov	x0, x19
  9ed5a8: aa1603e1     	mov	x1, x22
  9ed5ac: 94076920     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9ed5b0: f94002a2     	ldr	x2, [x21]
  9ed5b4: aa1503e0     	mov	x0, x21
  9ed5b8: aa1303e1     	mov	x1, x19
  9ed5bc: f940cc42     	ldr	x2, [x2, #0x198]
  9ed5c0: d63f0040     	blr	x2
  9ed5c4: 53001c00     	uxtb	w0, w0
  9ed5c8: 34000200     	cbz	w0, 0x9ed608 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x108>
  9ed5cc: f940e694     	ldr	x20, [x20, #0x1c8]
  9ed5d0: aa1303e0     	mov	x0, x19
  9ed5d4: f94027a2     	ldr	x2, [x29, #0x48]
  9ed5d8: f9400281     	ldr	x1, [x20]
  9ed5dc: eb01005f     	cmp	x2, x1
  9ed5e0: 54000281     	b.ne	0x9ed630 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x130>
  9ed5e4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed5e8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ed5ec: f9401bf7     	ldr	x23, [sp, #0x30]
  9ed5f0: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9ed5f4: d65f03c0     	ret
  9ed5f8: b85f8002     	ldur	w2, [x0, #-0x8]
  9ed5fc: 6b1f005f     	cmp	w2, wzr
  9ed600: 54fffb8c     	b.gt	0x9ed570 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x70>
  9ed604: 17ffffe0     	b	0x9ed584 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x84>
  9ed608: d00013e1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9ed60c: aa1303e0     	mov	x0, x19
  9ed610: 91330021     	add	x1, x1, #0xcc0
  9ed614: d2800002     	mov	x2, #0x0                // =0
  9ed618: 94076fe3     	bl	0xbc95a4 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4af7c>
  9ed61c: 17ffffec     	b	0x9ed5cc <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0xcc>
  9ed620: b81f803f     	stur	wzr, [x1, #-0x8]
  9ed624: f81e8037     	stur	x23, [x1, #-0x18]
  9ed628: 3837683f     	strb	wzr, [x1, x23]
  9ed62c: 17ffffde     	b	0x9ed5a4 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0xa4>
  9ed630: 97e6b75c     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ed634: f9400261     	ldr	x1, [x19]
  9ed638: aa0003f3     	mov	x19, x0
  9ed63c: d1006020     	sub	x0, x1, #0x18
  9ed640: 90002ae1     	adrp	x1, 0xf49000
  9ed644: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ed648: eb01001f     	cmp	x0, x1
  9ed64c: 54000060     	b.eq	0x9ed658 <_ZNK7cocos2d9FileUtils34getFullPathForDirectoryAndFilenameERKSsS2_+0x158>
  9ed650: 910103a1     	add	x1, x29, #0x40
  9ed654: 97e6c78b     	bl	0x39f480 <.text+0x3170>
  9ed658: aa1303e0     	mov	x0, x19
  9ed65c: 9407d621     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ed660 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs>:
  9ed660: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ed664: 910003fd     	mov	x29, sp
  9ed668: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed66c: f90013f5     	str	x21, [sp, #0x20]
  9ed670: f0002a93     	adrp	x19, 0xf40000
  9ed674: 90002af5     	adrp	x21, 0xf49000
  9ed678: f9400004     	ldr	x4, [x0]
  9ed67c: 9100e3a2     	add	x2, x29, #0x38
  9ed680: f90023a8     	str	x8, [x29, #0x40]
  9ed684: f940e665     	ldr	x5, [x19, #0x1c8]
  9ed688: aa0803f4     	mov	x20, x8
  9ed68c: f947eea3     	ldr	x3, [x21, #0xfd8]
  9ed690: 91006063     	add	x3, x3, #0x18
  9ed694: f94000a5     	ldr	x5, [x5]
  9ed698: f9000103     	str	x3, [x8]
  9ed69c: b0002aa3     	adrp	x3, 0xf42000
  9ed6a0: f90027a5     	str	x5, [x29, #0x48]
  9ed6a4: f9401484     	ldr	x4, [x4, #0x28]
  9ed6a8: f942bc63     	ldr	x3, [x3, #0x578]
  9ed6ac: 91004063     	add	x3, x3, #0x10
  9ed6b0: f9001fa3     	str	x3, [x29, #0x38]
  9ed6b4: d63f0080     	blr	x4
  9ed6b8: f940e673     	ldr	x19, [x19, #0x1c8]
  9ed6bc: aa1403e0     	mov	x0, x20
  9ed6c0: f94027a2     	ldr	x2, [x29, #0x48]
  9ed6c4: f9400261     	ldr	x1, [x19]
  9ed6c8: eb01005f     	cmp	x2, x1
  9ed6cc: 540000a1     	b.ne	0x9ed6e0 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0x80>
  9ed6d0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed6d4: f94013f5     	ldr	x21, [sp, #0x20]
  9ed6d8: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9ed6dc: d65f03c0     	ret
  9ed6e0: 97e6b730     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ed6e4: f9400281     	ldr	x1, [x20]
  9ed6e8: aa0003f3     	mov	x19, x0
  9ed6ec: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9ed6f0: d1006020     	sub	x0, x1, #0x18
  9ed6f4: eb15001f     	cmp	x0, x21
  9ed6f8: 54000060     	b.eq	0x9ed704 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xa4>
  9ed6fc: 9100c3a1     	add	x1, x29, #0x30
  9ed700: 97e6c760     	bl	0x39f480 <.text+0x3170>
  9ed704: aa1303e0     	mov	x0, x19
  9ed708: 9407d5f6     	bl	0xbe2ee0 <_Unwind_Resume>
  9ed70c: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9ed710: 92fc0001     	mov	x1, #0x1fffffffffffffff // =2305843009213693951
  9ed714: 910003fd     	mov	x29, sp
  9ed718: f9000bf3     	str	x19, [sp, #0x10]
  9ed71c: eb01001f     	cmp	x0, x1
  9ed720: 540001a8     	b.hi	0x9ed754 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xf4>
  9ed724: d37df002     	lsl	x2, x0, #3
  9ed728: f90017a2     	str	x2, [x29, #0x28]
  9ed72c: aa0203e0     	mov	x0, x2
  9ed730: 940640b6     	bl	0xb7da08 <_Znwm>
  9ed734: aa0003f3     	mov	x19, x0
  9ed738: f94017a2     	ldr	x2, [x29, #0x28]
  9ed73c: 52800001     	mov	w1, #0x0                // =0
  9ed740: 97e6b5fc     	bl	0x39af30 <memset@plt>
  9ed744: aa1303e0     	mov	x0, x19
  9ed748: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed74c: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9ed750: d65f03c0     	ret
  9ed754: 94075e49     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>
  9ed758: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ed75c: 910003fd     	mov	x29, sp
  9ed760: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed764: f0002a93     	adrp	x19, 0xf40000
  9ed768: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ed76c: aa0003f6     	mov	x22, x0
  9ed770: d2800500     	mov	x0, #0x28               // =40
  9ed774: f940e661     	ldr	x1, [x19, #0x1c8]
  9ed778: f9400021     	ldr	x1, [x1]
  9ed77c: f90027a1     	str	x1, [x29, #0x48]
  9ed780: 940640a2     	bl	0xb7da08 <_Znwm>
  9ed784: aa0003f4     	mov	x20, x0
  9ed788: aa0003f5     	mov	x21, x0
  9ed78c: aa1603e1     	mov	x1, x22
  9ed790: f800869f     	str	xzr, [x20], #0x8
  9ed794: aa1403e0     	mov	x0, x20
  9ed798: 9407746a     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9ed79c: 91002280     	add	x0, x20, #0x8
  9ed7a0: 910022c1     	add	x1, x22, #0x8
  9ed7a4: 9401324c     	bl	0xa3a0d4 <_ZN7cocos2d5ValueC2ERKS0_>
  9ed7a8: f940e673     	ldr	x19, [x19, #0x1c8]
  9ed7ac: aa1503e0     	mov	x0, x21
  9ed7b0: f94027a2     	ldr	x2, [x29, #0x48]
  9ed7b4: f9400261     	ldr	x1, [x19]
  9ed7b8: eb01005f     	cmp	x2, x1
  9ed7bc: 540000a1     	b.ne	0x9ed7d0 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0x170>
  9ed7c0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed7c4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ed7c8: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9ed7cc: d65f03c0     	ret
  9ed7d0: 97e6b6f4     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ed7d4: f94006a1     	ldr	x1, [x21, #0x8]
  9ed7d8: aa0003f3     	mov	x19, x0
  9ed7dc: d1006020     	sub	x0, x1, #0x18
  9ed7e0: 90002ae1     	adrp	x1, 0xf49000
  9ed7e4: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ed7e8: eb01001f     	cmp	x0, x1
  9ed7ec: 54000060     	b.eq	0x9ed7f8 <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0x198>
  9ed7f0: 910103a1     	add	x1, x29, #0x40
  9ed7f4: 97e6c723     	bl	0x39f480 <.text+0x3170>
  9ed7f8: aa1303e0     	mov	x0, x19
  9ed7fc: 94063b6a     	bl	0xb7c5a4 <__cxa_begin_catch>
  9ed800: aa1503e0     	mov	x0, x21
  9ed804: 940639c1     	bl	0xb7bf08 <_ZdlPv>
  9ed808: 94063f3b     	bl	0xb7d4f4 <__cxa_rethrow>
  9ed80c: 17fffffc     	b	0x9ed7fc <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0x19c>
  9ed810: f9001fa0     	str	x0, [x29, #0x38]
  9ed814: 94063b8c     	bl	0xb7c644 <__cxa_end_catch>
  9ed818: f9401fa0     	ldr	x0, [x29, #0x38]
  9ed81c: 9407d5b1     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ed820 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev>:
  9ed820: d0002aa1     	adrp	x1, 0xf43000
  9ed824: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ed828: 910003fd     	mov	x29, sp
  9ed82c: f9416821     	ldr	x1, [x1, #0x2d0]
  9ed830: f9000bf3     	str	x19, [sp, #0x10]
  9ed834: f9400813     	ldr	x19, [x0, #0x10]
  9ed838: 91004021     	add	x1, x1, #0x10
  9ed83c: f9000001     	str	x1, [x0]
  9ed840: b4000173     	cbz	x19, 0x9ed86c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x4c>
  9ed844: f0002aa0     	adrp	x0, 0xf44000
  9ed848: f9445000     	ldr	x0, [x0, #0x8a0]
  9ed84c: b4000160     	cbz	x0, 0x9ed878 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x58>
  9ed850: 91002260     	add	x0, x19, #0x8
  9ed854: 885ffc01     	ldaxr	w1, [x0]
  9ed858: 51000422     	sub	w2, w1, #0x1
  9ed85c: 8803fc02     	stlxr	w3, w2, [x0]
  9ed860: 35ffffa3     	cbnz	w3, 0x9ed854 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x34>
  9ed864: 7100043f     	cmp	w1, #0x1
  9ed868: 54000220     	b.eq	0x9ed8ac <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x8c>
  9ed86c: f9400bf3     	ldr	x19, [sp, #0x10]
  9ed870: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed874: d65f03c0     	ret
  9ed878: b9400a60     	ldr	w0, [x19, #0x8]
  9ed87c: 51000401     	sub	w1, w0, #0x1
  9ed880: 7100041f     	cmp	w0, #0x1
  9ed884: b9000a61     	str	w1, [x19, #0x8]
  9ed888: 54ffff21     	b.ne	0x9ed86c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x4c>
  9ed88c: f9400261     	ldr	x1, [x19]
  9ed890: aa1303e0     	mov	x0, x19
  9ed894: f9400821     	ldr	x1, [x1, #0x10]
  9ed898: d63f0020     	blr	x1
  9ed89c: b9400e60     	ldr	w0, [x19, #0xc]
  9ed8a0: 51000401     	sub	w1, w0, #0x1
  9ed8a4: b9000e61     	str	w1, [x19, #0xc]
  9ed8a8: 1400000a     	b	0x9ed8d0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0xb0>
  9ed8ac: f9400261     	ldr	x1, [x19]
  9ed8b0: aa1303e0     	mov	x0, x19
  9ed8b4: f9400821     	ldr	x1, [x1, #0x10]
  9ed8b8: d63f0020     	blr	x1
  9ed8bc: 91003261     	add	x1, x19, #0xc
  9ed8c0: 885ffc20     	ldaxr	w0, [x1]
  9ed8c4: 51000402     	sub	w2, w0, #0x1
  9ed8c8: 8803fc22     	stlxr	w3, w2, [x1]
  9ed8cc: 35ffffa3     	cbnz	w3, 0x9ed8c0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0xa0>
  9ed8d0: 7100041f     	cmp	w0, #0x1
  9ed8d4: 54fffcc1     	b.ne	0x9ed86c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x4c>
  9ed8d8: f9400261     	ldr	x1, [x19]
  9ed8dc: aa1303e0     	mov	x0, x19
  9ed8e0: f9400c21     	ldr	x1, [x1, #0x18]
  9ed8e4: d63f0020     	blr	x1
  9ed8e8: 17ffffe1     	b	0x9ed86c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED2Ev+0x4c>

00000000009ed8ec <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev>:
  9ed8ec: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9ed8f0: 910003fd     	mov	x29, sp
  9ed8f4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed8f8: aa0003f3     	mov	x19, x0
  9ed8fc: d0002aa0     	adrp	x0, 0xf43000
  9ed900: f9416800     	ldr	x0, [x0, #0x2d0]
  9ed904: f9400a74     	ldr	x20, [x19, #0x10]
  9ed908: 91004000     	add	x0, x0, #0x10
  9ed90c: f9000260     	str	x0, [x19]
  9ed910: b4000174     	cbz	x20, 0x9ed93c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x50>
  9ed914: f0002aa0     	adrp	x0, 0xf44000
  9ed918: f9445000     	ldr	x0, [x0, #0x8a0]
  9ed91c: b4000180     	cbz	x0, 0x9ed94c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x60>
  9ed920: 91002280     	add	x0, x20, #0x8
  9ed924: 885ffc01     	ldaxr	w1, [x0]
  9ed928: 51000422     	sub	w2, w1, #0x1
  9ed92c: 8803fc02     	stlxr	w3, w2, [x0]
  9ed930: 35ffffa3     	cbnz	w3, 0x9ed924 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x38>
  9ed934: 7100043f     	cmp	w1, #0x1
  9ed938: 54000240     	b.eq	0x9ed980 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x94>
  9ed93c: aa1303e0     	mov	x0, x19
  9ed940: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ed944: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9ed948: 14063970     	b	0xb7bf08 <_ZdlPv>
  9ed94c: b9400a80     	ldr	w0, [x20, #0x8]
  9ed950: 51000401     	sub	w1, w0, #0x1
  9ed954: 7100041f     	cmp	w0, #0x1
  9ed958: b9000a81     	str	w1, [x20, #0x8]
  9ed95c: 54ffff01     	b.ne	0x9ed93c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x50>
  9ed960: f9400281     	ldr	x1, [x20]
  9ed964: aa1403e0     	mov	x0, x20
  9ed968: f9400821     	ldr	x1, [x1, #0x10]
  9ed96c: d63f0020     	blr	x1
  9ed970: b9400e80     	ldr	w0, [x20, #0xc]
  9ed974: 51000401     	sub	w1, w0, #0x1
  9ed978: b9000e81     	str	w1, [x20, #0xc]
  9ed97c: 1400000a     	b	0x9ed9a4 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xb8>
  9ed980: f9400281     	ldr	x1, [x20]
  9ed984: aa1403e0     	mov	x0, x20
  9ed988: f9400821     	ldr	x1, [x1, #0x10]
  9ed98c: d63f0020     	blr	x1
  9ed990: 91003281     	add	x1, x20, #0xc
  9ed994: 885ffc20     	ldaxr	w0, [x1]
  9ed998: 51000402     	sub	w2, w0, #0x1
  9ed99c: 8803fc22     	stlxr	w3, w2, [x1]
  9ed9a0: 35ffffa3     	cbnz	w3, 0x9ed994 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xa8>
  9ed9a4: 7100041f     	cmp	w0, #0x1
  9ed9a8: 54fffca1     	b.ne	0x9ed93c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x50>
  9ed9ac: f9400281     	ldr	x1, [x20]
  9ed9b0: aa1403e0     	mov	x0, x20
  9ed9b4: f9400c21     	ldr	x1, [x1, #0x18]
  9ed9b8: d63f0020     	blr	x1
  9ed9bc: 17ffffe0     	b	0x9ed93c <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x50>
  9ed9c0: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ed9c4: 910003fd     	mov	x29, sp
  9ed9c8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ed9cc: f0002a95     	adrp	x21, 0xf40000
  9ed9d0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ed9d4: aa0003f3     	mov	x19, x0
  9ed9d8: 90002af4     	adrp	x20, 0xf49000
  9ed9dc: f940e6a0     	ldr	x0, [x21, #0x1c8]
  9ed9e0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ed9e4: f9400000     	ldr	x0, [x0]
  9ed9e8: f90027a0     	str	x0, [x29, #0x48]
  9ed9ec: b4000653     	cbz	x19, 0x9edab4 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x1c8>
  9ed9f0: f0002ab6     	adrp	x22, 0xf44000
  9ed9f4: 910103b7     	add	x23, x29, #0x40
  9ed9f8: 1400000a     	b	0x9eda20 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x134>
  9ed9fc: f9400661     	ldr	x1, [x19, #0x8]
  9eda00: f947ee82     	ldr	x2, [x20, #0xfd8]
  9eda04: d1006020     	sub	x0, x1, #0x18
  9eda08: eb02001f     	cmp	x0, x2
  9eda0c: 54000361     	b.ne	0x9eda78 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x18c>
  9eda10: aa1303e0     	mov	x0, x19
  9eda14: aa1803f3     	mov	x19, x24
  9eda18: 9406393c     	bl	0xb7bf08 <_ZdlPv>
  9eda1c: b40004d8     	cbz	x24, 0x9edab4 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x1c8>
  9eda20: f9400a61     	ldr	x1, [x19, #0x10]
  9eda24: f947ee82     	ldr	x2, [x20, #0xfd8]
  9eda28: d1006020     	sub	x0, x1, #0x18
  9eda2c: f9400278     	ldr	x24, [x19]
  9eda30: eb02001f     	cmp	x0, x2
  9eda34: 54fffe40     	b.eq	0x9ed9fc <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x110>
  9eda38: f94452c2     	ldr	x2, [x22, #0x8a0]
  9eda3c: b4000582     	cbz	x2, 0x9edaec <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x200>
  9eda40: d1002021     	sub	x1, x1, #0x8
  9eda44: 885ffc22     	ldaxr	w2, [x1]
  9eda48: 51000443     	sub	w3, w2, #0x1
  9eda4c: 8804fc23     	stlxr	w4, w3, [x1]
  9eda50: 35ffffa4     	cbnz	w4, 0x9eda44 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x158>
  9eda54: 6b1f005f     	cmp	w2, wzr
  9eda58: 54fffd2c     	b.gt	0x9ed9fc <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x110>
  9eda5c: aa1703e1     	mov	x1, x23
  9eda60: 94077357     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eda64: f9400661     	ldr	x1, [x19, #0x8]
  9eda68: f947ee82     	ldr	x2, [x20, #0xfd8]
  9eda6c: d1006020     	sub	x0, x1, #0x18
  9eda70: eb02001f     	cmp	x0, x2
  9eda74: 54fffce0     	b.eq	0x9eda10 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x124>
  9eda78: f94452c2     	ldr	x2, [x22, #0x8a0]
  9eda7c: b4000302     	cbz	x2, 0x9edadc <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x1f0>
  9eda80: d1002021     	sub	x1, x1, #0x8
  9eda84: 885ffc22     	ldaxr	w2, [x1]
  9eda88: 51000443     	sub	w3, w2, #0x1
  9eda8c: 8804fc23     	stlxr	w4, w3, [x1]
  9eda90: 35ffffa4     	cbnz	w4, 0x9eda84 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x198>
  9eda94: 6b1f005f     	cmp	w2, wzr
  9eda98: 54fffbcc     	b.gt	0x9eda10 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x124>
  9eda9c: aa1703e1     	mov	x1, x23
  9edaa0: 94077347     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edaa4: aa1303e0     	mov	x0, x19
  9edaa8: aa1803f3     	mov	x19, x24
  9edaac: 94063917     	bl	0xb7bf08 <_ZdlPv>
  9edab0: b5fffb98     	cbnz	x24, 0x9eda20 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x134>
  9edab4: f940e6b5     	ldr	x21, [x21, #0x1c8]
  9edab8: f94027a1     	ldr	x1, [x29, #0x48]
  9edabc: f94002a0     	ldr	x0, [x21]
  9edac0: eb00003f     	cmp	x1, x0
  9edac4: 540001c1     	b.ne	0x9edafc <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x210>
  9edac8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9edacc: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9edad0: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9edad4: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9edad8: d65f03c0     	ret
  9edadc: b85f8022     	ldur	w2, [x1, #-0x8]
  9edae0: 51000443     	sub	w3, w2, #0x1
  9edae4: b81f8023     	stur	w3, [x1, #-0x8]
  9edae8: 17ffffeb     	b	0x9eda94 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x1a8>
  9edaec: b85f8022     	ldur	w2, [x1, #-0x8]
  9edaf0: 51000443     	sub	w3, w2, #0x1
  9edaf4: b81f8023     	stur	w3, [x1, #-0x8]
  9edaf8: 17ffffd7     	b	0x9eda54 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0x168>
  9edafc: 97e6b629     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009edb00 <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv>:
  9edb00: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9edb04: 910003fd     	mov	x29, sp
  9edb08: a90153f3     	stp	x19, x20, [sp, #0x10]
  9edb0c: aa0003f4     	mov	x20, x0
  9edb10: f9447c00     	ldr	x0, [x0, #0x8f8]
  9edb14: 97ffffab     	bl	0x9ed9c0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xd4>
  9edb18: f9447a82     	ldr	x2, [x20, #0x8f0]
  9edb1c: 52800001     	mov	w1, #0x0                // =0
  9edb20: f9447680     	ldr	x0, [x20, #0x8e8]
  9edb24: d37df042     	lsl	x2, x2, #3
  9edb28: 97e6b502     	bl	0x39af30 <memset@plt>
  9edb2c: f904829f     	str	xzr, [x20, #0x900]
  9edb30: f9047e9f     	str	xzr, [x20, #0x8f8]
  9edb34: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9edb38: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9edb3c: d65f03c0     	ret
  9edb40: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9edb44: 910003fd     	mov	x29, sp
  9edb48: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9edb4c: f0002a96     	adrp	x22, 0xf40000
  9edb50: 90002af5     	adrp	x21, 0xf49000
  9edb54: a90153f3     	stp	x19, x20, [sp, #0x10]
  9edb58: aa0003f3     	mov	x19, x0
  9edb5c: f940e6c0     	ldr	x0, [x22, #0x1c8]
  9edb60: a90363f7     	stp	x23, x24, [sp, #0x30]
  9edb64: f9400000     	ldr	x0, [x0]
  9edb68: f90027a0     	str	x0, [x29, #0x48]
  9edb6c: b4000413     	cbz	x19, 0x9edbec <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0xec>
  9edb70: f0002ab7     	adrp	x23, 0xf44000
  9edb74: 910103b8     	add	x24, x29, #0x40
  9edb78: 14000005     	b	0x9edb8c <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x8c>
  9edb7c: aa1303e0     	mov	x0, x19
  9edb80: aa1403f3     	mov	x19, x20
  9edb84: 940638e1     	bl	0xb7bf08 <_ZdlPv>
  9edb88: b4000334     	cbz	x20, 0x9edbec <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0xec>
  9edb8c: aa1303e0     	mov	x0, x19
  9edb90: f8408414     	ldr	x20, [x0], #0x8
  9edb94: 91002000     	add	x0, x0, #0x8
  9edb98: 94012ee5     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9edb9c: f9400661     	ldr	x1, [x19, #0x8]
  9edba0: f947eea2     	ldr	x2, [x21, #0xfd8]
  9edba4: d1006020     	sub	x0, x1, #0x18
  9edba8: eb02001f     	cmp	x0, x2
  9edbac: 54fffe80     	b.eq	0x9edb7c <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x7c>
  9edbb0: f94452e2     	ldr	x2, [x23, #0x8a0]
  9edbb4: b4000302     	cbz	x2, 0x9edc14 <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x114>
  9edbb8: d1002021     	sub	x1, x1, #0x8
  9edbbc: 885ffc22     	ldaxr	w2, [x1]
  9edbc0: 51000443     	sub	w3, w2, #0x1
  9edbc4: 8804fc23     	stlxr	w4, w3, [x1]
  9edbc8: 35ffffa4     	cbnz	w4, 0x9edbbc <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0xbc>
  9edbcc: 6b1f005f     	cmp	w2, wzr
  9edbd0: 54fffd6c     	b.gt	0x9edb7c <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x7c>
  9edbd4: aa1803e1     	mov	x1, x24
  9edbd8: 940772f9     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edbdc: aa1303e0     	mov	x0, x19
  9edbe0: aa1403f3     	mov	x19, x20
  9edbe4: 940638c9     	bl	0xb7bf08 <_ZdlPv>
  9edbe8: b5fffd34     	cbnz	x20, 0x9edb8c <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x8c>
  9edbec: f940e6d6     	ldr	x22, [x22, #0x1c8]
  9edbf0: f94027a1     	ldr	x1, [x29, #0x48]
  9edbf4: f94002c0     	ldr	x0, [x22]
  9edbf8: eb00003f     	cmp	x1, x0
  9edbfc: 54000141     	b.ne	0x9edc24 <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0x124>
  9edc00: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9edc04: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9edc08: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9edc0c: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9edc10: d65f03c0     	ret
  9edc14: b85f8022     	ldur	w2, [x1, #-0x8]
  9edc18: 51000443     	sub	w3, w2, #0x1
  9edc1c: b81f8023     	stur	w3, [x1, #-0x8]
  9edc20: 17ffffeb     	b	0x9edbcc <_ZN7cocos2d9FileUtils18purgeCachedEntriesEv+0xcc>
  9edc24: 97e6b5df     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009edc28 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_>:
  9edc28: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9edc2c: 910003fd     	mov	x29, sp
  9edc30: a90153f3     	stp	x19, x20, [sp, #0x10]
  9edc34: f0002a94     	adrp	x20, 0xf40000
  9edc38: 910163b3     	add	x19, x29, #0x58
  9edc3c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9edc40: aa0303f7     	mov	x23, x3
  9edc44: f90027a2     	str	x2, [x29, #0x48]
  9edc48: f940e684     	ldr	x4, [x20, #0x1c8]
  9edc4c: aa0103f8     	mov	x24, x1
  9edc50: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9edc54: aa0003f6     	mov	x22, x0
  9edc58: aa1303e0     	mov	x0, x19
  9edc5c: f9400083     	ldr	x3, [x4]
  9edc60: f90037a3     	str	x3, [x29, #0x68]
  9edc64: 94077337     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9edc68: f94027a2     	ldr	x2, [x29, #0x48]
  9edc6c: aa1303e0     	mov	x0, x19
  9edc70: aa0203e1     	mov	x1, x2
  9edc74: 9407676e     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9edc78: 910183b5     	add	x21, x29, #0x60
  9edc7c: aa1803e1     	mov	x1, x24
  9edc80: aa1503e0     	mov	x0, x21
  9edc84: 9407732f     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9edc88: aa1503e0     	mov	x0, x21
  9edc8c: aa1703e1     	mov	x1, x23
  9edc90: 94076767     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9edc94: f94002c3     	ldr	x3, [x22]
  9edc98: aa1603e0     	mov	x0, x22
  9edc9c: aa1303e1     	mov	x1, x19
  9edca0: aa1503e2     	mov	x2, x21
  9edca4: f9409863     	ldr	x3, [x3, #0x130]
  9edca8: d63f0060     	blr	x3
  9edcac: 90002af3     	adrp	x19, 0xf49000
  9edcb0: f94033a1     	ldr	x1, [x29, #0x60]
  9edcb4: 2a0003f6     	mov	w22, w0
  9edcb8: d1006020     	sub	x0, x1, #0x18
  9edcbc: f947ee62     	ldr	x2, [x19, #0xfd8]
  9edcc0: eb02001f     	cmp	x0, x2
  9edcc4: 54000221     	b.ne	0x9edd08 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xe0>
  9edcc8: f9402fa1     	ldr	x1, [x29, #0x58]
  9edccc: f947ee73     	ldr	x19, [x19, #0xfd8]
  9edcd0: d1006020     	sub	x0, x1, #0x18
  9edcd4: eb13001f     	cmp	x0, x19
  9edcd8: 54000321     	b.ne	0x9edd3c <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x114>
  9edcdc: f940e694     	ldr	x20, [x20, #0x1c8]
  9edce0: 2a1603e0     	mov	w0, w22
  9edce4: f94037a2     	ldr	x2, [x29, #0x68]
  9edce8: f9400281     	ldr	x1, [x20]
  9edcec: eb01005f     	cmp	x2, x1
  9edcf0: 54000501     	b.ne	0x9edd90 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x168>
  9edcf4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9edcf8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9edcfc: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9edd00: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9edd04: d65f03c0     	ret
  9edd08: f0002aa2     	adrp	x2, 0xf44000
  9edd0c: f9445042     	ldr	x2, [x2, #0x8a0]
  9edd10: b4000382     	cbz	x2, 0x9edd80 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x158>
  9edd14: d1002021     	sub	x1, x1, #0x8
  9edd18: 885ffc22     	ldaxr	w2, [x1]
  9edd1c: 51000443     	sub	w3, w2, #0x1
  9edd20: 8804fc23     	stlxr	w4, w3, [x1]
  9edd24: 35ffffa4     	cbnz	w4, 0x9edd18 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xf0>
  9edd28: 6b1f005f     	cmp	w2, wzr
  9edd2c: 54fffcec     	b.gt	0x9edcc8 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xa0>
  9edd30: 910143a1     	add	x1, x29, #0x50
  9edd34: 940772a2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edd38: 17ffffe4     	b	0x9edcc8 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xa0>
  9edd3c: f0002aa2     	adrp	x2, 0xf44000
  9edd40: f9445042     	ldr	x2, [x2, #0x8a0]
  9edd44: b4000162     	cbz	x2, 0x9edd70 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x148>
  9edd48: d1002021     	sub	x1, x1, #0x8
  9edd4c: 885ffc22     	ldaxr	w2, [x1]
  9edd50: 51000443     	sub	w3, w2, #0x1
  9edd54: 8804fc23     	stlxr	w4, w3, [x1]
  9edd58: 35ffffa4     	cbnz	w4, 0x9edd4c <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x124>
  9edd5c: 6b1f005f     	cmp	w2, wzr
  9edd60: 54fffbec     	b.gt	0x9edcdc <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xb4>
  9edd64: aa1503e1     	mov	x1, x21
  9edd68: 94077295     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edd6c: 17ffffdc     	b	0x9edcdc <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0xb4>
  9edd70: b85f8022     	ldur	w2, [x1, #-0x8]
  9edd74: 51000443     	sub	w3, w2, #0x1
  9edd78: b81f8023     	stur	w3, [x1, #-0x8]
  9edd7c: 17fffff8     	b	0x9edd5c <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x134>
  9edd80: b85f8022     	ldur	w2, [x1, #-0x8]
  9edd84: 51000443     	sub	w3, w2, #0x1
  9edd88: b81f8023     	stur	w3, [x1, #-0x8]
  9edd8c: 17ffffe7     	b	0x9edd28 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x100>
  9edd90: 97e6b584     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9edd94: 90002af3     	adrp	x19, 0xf49000
  9edd98: aa0003f4     	mov	x20, x0
  9edd9c: f94033a0     	ldr	x0, [x29, #0x60]
  9edda0: f947ee61     	ldr	x1, [x19, #0xfd8]
  9edda4: d1006000     	sub	x0, x0, #0x18
  9edda8: eb01001f     	cmp	x0, x1
  9eddac: 54000060     	b.eq	0x9eddb8 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x190>
  9eddb0: 910143a1     	add	x1, x29, #0x50
  9eddb4: 97e6c5b3     	bl	0x39f480 <.text+0x3170>
  9eddb8: f9402fa0     	ldr	x0, [x29, #0x58]
  9eddbc: f947ee73     	ldr	x19, [x19, #0xfd8]
  9eddc0: d1006000     	sub	x0, x0, #0x18
  9eddc4: eb13001f     	cmp	x0, x19
  9eddc8: 54000060     	b.eq	0x9eddd4 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x1ac>
  9eddcc: 910143a1     	add	x1, x29, #0x50
  9eddd0: 97e6c5ac     	bl	0x39f480 <.text+0x3170>
  9eddd4: aa1403e0     	mov	x0, x20
  9eddd8: 9407d442     	bl	0xbe2ee0 <_Unwind_Resume>
  9edddc: 90002ae1     	adrp	x1, 0xf49000
  9edde0: aa0003f3     	mov	x19, x0
  9edde4: f9402fa0     	ldr	x0, [x29, #0x58]
  9edde8: f947ec21     	ldr	x1, [x1, #0xfd8]
  9eddec: d1006000     	sub	x0, x0, #0x18
  9eddf0: eb01001f     	cmp	x0, x1
  9eddf4: 54000060     	b.eq	0x9ede00 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x1d8>
  9eddf8: 910183a1     	add	x1, x29, #0x60
  9eddfc: 97e6c5a1     	bl	0x39f480 <.text+0x3170>
  9ede00: aa1303e0     	mov	x0, x19
  9ede04: 9407d437     	bl	0xbe2ee0 <_Unwind_Resume>
  9ede08: 17ffffe3     	b	0x9edd94 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x16c>
  9ede0c: aa0003f4     	mov	x20, x0
  9ede10: 90002af3     	adrp	x19, 0xf49000
  9ede14: 17ffffe9     	b	0x9eddb8 <_ZN7cocos2d9FileUtils10renameFileERKSsS2_S2_+0x190>

00000000009ede18 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_>:
  9ede18: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9ede1c: 910003fd     	mov	x29, sp
  9ede20: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ede24: f0002a94     	adrp	x20, 0xf40000
  9ede28: aa0003f3     	mov	x19, x0
  9ede2c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ede30: aa0203f7     	mov	x23, x2
  9ede34: f90023f9     	str	x25, [sp, #0x40]
  9ede38: f940e683     	ldr	x3, [x20, #0x1c8]
  9ede3c: aa0103f9     	mov	x25, x1
  9ede40: 92800002     	mov	x2, #-0x1               // =-1
  9ede44: 528005e1     	mov	w1, #0x2f               // =47
  9ede48: aa1703e0     	mov	x0, x23
  9ede4c: 910163b8     	add	x24, x29, #0x58
  9ede50: f9400063     	ldr	x3, [x3]
  9ede54: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ede58: f90037a3     	str	x3, [x29, #0x68]
  9ede5c: aa0803f6     	mov	x22, x8
  9ede60: 94076994     	bl	0xbc84b0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49e88>
  9ede64: 91000403     	add	x3, x0, #0x1
  9ede68: aa1703e1     	mov	x1, x23
  9ede6c: aa1803e0     	mov	x0, x24
  9ede70: d2800002     	mov	x2, #0x0                // =0
  9ede74: 910183b5     	add	x21, x29, #0x60
  9ede78: 94076349     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9ede7c: f9400262     	ldr	x2, [x19]
  9ede80: aa1503e8     	mov	x8, x21
  9ede84: aa1303e0     	mov	x0, x19
  9ede88: aa1903e1     	mov	x1, x25
  9ede8c: f940c842     	ldr	x2, [x2, #0x190]
  9ede90: d63f0040     	blr	x2
  9ede94: f9402fa2     	ldr	x2, [x29, #0x58]
  9ede98: f94033a1     	ldr	x1, [x29, #0x60]
  9ede9c: f85e8043     	ldur	x3, [x2, #-0x18]
  9edea0: f85e8020     	ldur	x0, [x1, #-0x18]
  9edea4: f85f0044     	ldur	x4, [x2, #-0x10]
  9edea8: 8b000060     	add	x0, x3, x0
  9edeac: eb04001f     	cmp	x0, x4
  9edeb0: 54000089     	b.ls	0x9edec0 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xa8>
  9edeb4: f85f0021     	ldur	x1, [x1, #-0x10]
  9edeb8: eb01001f     	cmp	x0, x1
  9edebc: 540003e9     	b.ls	0x9edf38 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x120>
  9edec0: aa1803e0     	mov	x0, x24
  9edec4: aa1503e1     	mov	x1, x21
  9edec8: 940766d9     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9edecc: f9400001     	ldr	x1, [x0]
  9eded0: 90002af3     	adrp	x19, 0xf49000
  9eded4: f90002c1     	str	x1, [x22]
  9eded8: f947ee61     	ldr	x1, [x19, #0xfd8]
  9ededc: 91006022     	add	x2, x1, #0x18
  9edee0: f9000002     	str	x2, [x0]
  9edee4: f94033a2     	ldr	x2, [x29, #0x60]
  9edee8: d1006040     	sub	x0, x2, #0x18
  9edeec: eb01001f     	cmp	x0, x1
  9edef0: 54000461     	b.ne	0x9edf7c <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x164>
  9edef4: f9402fa1     	ldr	x1, [x29, #0x58]
  9edef8: f947ee73     	ldr	x19, [x19, #0xfd8]
  9edefc: d1006020     	sub	x0, x1, #0x18
  9edf00: eb13001f     	cmp	x0, x19
  9edf04: 54000221     	b.ne	0x9edf48 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x130>
  9edf08: f940e694     	ldr	x20, [x20, #0x1c8]
  9edf0c: aa1603e0     	mov	x0, x22
  9edf10: f94037a2     	ldr	x2, [x29, #0x68]
  9edf14: f9400281     	ldr	x1, [x20]
  9edf18: eb01005f     	cmp	x2, x1
  9edf1c: 540005a1     	b.ne	0x9edfd0 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x1b8>
  9edf20: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9edf24: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9edf28: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9edf2c: f94023f9     	ldr	x25, [sp, #0x40]
  9edf30: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9edf34: d65f03c0     	ret
  9edf38: aa1503e0     	mov	x0, x21
  9edf3c: d2800001     	mov	x1, #0x0                // =0
  9edf40: 94076e1a     	bl	0xbc97a8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4b180>
  9edf44: 17ffffe2     	b	0x9edecc <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xb4>
  9edf48: f0002aa2     	adrp	x2, 0xf44000
  9edf4c: f9445042     	ldr	x2, [x2, #0x8a0]
  9edf50: b4000382     	cbz	x2, 0x9edfc0 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x1a8>
  9edf54: d1002021     	sub	x1, x1, #0x8
  9edf58: 885ffc22     	ldaxr	w2, [x1]
  9edf5c: 51000443     	sub	w3, w2, #0x1
  9edf60: 8804fc23     	stlxr	w4, w3, [x1]
  9edf64: 35ffffa4     	cbnz	w4, 0x9edf58 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x140>
  9edf68: 6b1f005f     	cmp	w2, wzr
  9edf6c: 54fffcec     	b.gt	0x9edf08 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xf0>
  9edf70: aa1503e1     	mov	x1, x21
  9edf74: 94077212     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edf78: 17ffffe4     	b	0x9edf08 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xf0>
  9edf7c: f0002aa1     	adrp	x1, 0xf44000
  9edf80: f9445021     	ldr	x1, [x1, #0x8a0]
  9edf84: b4000161     	cbz	x1, 0x9edfb0 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x198>
  9edf88: d1002042     	sub	x2, x2, #0x8
  9edf8c: 885ffc41     	ldaxr	w1, [x2]
  9edf90: 51000423     	sub	w3, w1, #0x1
  9edf94: 8804fc43     	stlxr	w4, w3, [x2]
  9edf98: 35ffffa4     	cbnz	w4, 0x9edf8c <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x174>
  9edf9c: 6b1f003f     	cmp	w1, wzr
  9edfa0: 54fffaac     	b.gt	0x9edef4 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xdc>
  9edfa4: 910143a1     	add	x1, x29, #0x50
  9edfa8: 94077205     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9edfac: 17ffffd2     	b	0x9edef4 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0xdc>
  9edfb0: b85f8041     	ldur	w1, [x2, #-0x8]
  9edfb4: 51000423     	sub	w3, w1, #0x1
  9edfb8: b81f8043     	stur	w3, [x2, #-0x8]
  9edfbc: 17fffff8     	b	0x9edf9c <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x184>
  9edfc0: b85f8022     	ldur	w2, [x1, #-0x8]
  9edfc4: 51000443     	sub	w3, w2, #0x1
  9edfc8: b81f8023     	stur	w3, [x1, #-0x8]
  9edfcc: 17ffffe7     	b	0x9edf68 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x150>
  9edfd0: 97e6b4f4     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9edfd4: 90002af3     	adrp	x19, 0xf49000
  9edfd8: aa0003f4     	mov	x20, x0
  9edfdc: f94033a0     	ldr	x0, [x29, #0x60]
  9edfe0: f947ee61     	ldr	x1, [x19, #0xfd8]
  9edfe4: d1006000     	sub	x0, x0, #0x18
  9edfe8: eb01001f     	cmp	x0, x1
  9edfec: 54000060     	b.eq	0x9edff8 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x1e0>
  9edff0: 910143a1     	add	x1, x29, #0x50
  9edff4: 97e6c523     	bl	0x39f480 <.text+0x3170>
  9edff8: f9402fa0     	ldr	x0, [x29, #0x58]
  9edffc: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee000: d1006000     	sub	x0, x0, #0x18
  9ee004: eb13001f     	cmp	x0, x19
  9ee008: 54000060     	b.eq	0x9ee014 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x1fc>
  9ee00c: 910143a1     	add	x1, x29, #0x50
  9ee010: 97e6c51c     	bl	0x39f480 <.text+0x3170>
  9ee014: aa1403e0     	mov	x0, x20
  9ee018: 9407d3b2     	bl	0xbe2ee0 <_Unwind_Resume>
  9ee01c: aa0003f4     	mov	x20, x0
  9ee020: f0002ad3     	adrp	x19, 0xf49000
  9ee024: 17fffff5     	b	0x9edff8 <_ZN7cocos2d9FileUtils24fullPathFromRelativeFileERKSsS2_+0x1e0>

00000000009ee028 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs>:
  9ee028: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9ee02c: 910003fd     	mov	x29, sp
  9ee030: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee034: d0002a93     	adrp	x19, 0xf40000
  9ee038: f90013f5     	str	x21, [sp, #0x20]
  9ee03c: f9001fa2     	str	x2, [x29, #0x38]
  9ee040: aa0103f5     	mov	x21, x1
  9ee044: f940e660     	ldr	x0, [x19, #0x1c8]
  9ee048: f9400000     	ldr	x0, [x0]
  9ee04c: f9002fa0     	str	x0, [x29, #0x58]
  9ee050: 97e70123     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  9ee054: f9400003     	ldr	x3, [x0]
  9ee058: f9401fa2     	ldr	x2, [x29, #0x38]
  9ee05c: 910143a8     	add	x8, x29, #0x50
  9ee060: aa0203e1     	mov	x1, x2
  9ee064: f9407062     	ldr	x2, [x3, #0xe0]
  9ee068: d63f0040     	blr	x2
  9ee06c: 90001381     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9ee070: f9402ba0     	ldr	x0, [x29, #0x50]
  9ee074: 910ec021     	add	x1, x1, #0x3b0
  9ee078: 97e6b5f2     	bl	0x39b840 <fopen@plt>
  9ee07c: f0002ac1     	adrp	x1, 0xf49000
  9ee080: f9402ba2     	ldr	x2, [x29, #0x50]
  9ee084: aa0003f4     	mov	x20, x0
  9ee088: d1006040     	sub	x0, x2, #0x18
  9ee08c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ee090: eb01001f     	cmp	x0, x1
  9ee094: 54000321     	b.ne	0x9ee0f8 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0xd0>
  9ee098: b40002d4     	cbz	x20, 0x9ee0f0 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0xc8>
  9ee09c: aa1503e0     	mov	x0, x21
  9ee0a0: 940099b0     	bl	0xa14760 <_ZNK7cocos2d4Data7getSizeEv>
  9ee0a4: f9001fa0     	str	x0, [x29, #0x38]
  9ee0a8: aa1503e0     	mov	x0, x21
  9ee0ac: 940099ab     	bl	0xa14758 <_ZNK7cocos2d4Data8getBytesEv>
  9ee0b0: f9401fa1     	ldr	x1, [x29, #0x38]
  9ee0b4: d2800022     	mov	x2, #0x1                // =1
  9ee0b8: aa1403e3     	mov	x3, x20
  9ee0bc: 97e6b6f9     	bl	0x39bca0 <fwrite@plt>
  9ee0c0: aa1403e0     	mov	x0, x20
  9ee0c4: 97e6b827     	bl	0x39c160 <fclose@plt>
  9ee0c8: 52800020     	mov	w0, #0x1                // =1
  9ee0cc: f940e673     	ldr	x19, [x19, #0x1c8]
  9ee0d0: f9402fa2     	ldr	x2, [x29, #0x58]
  9ee0d4: f9400261     	ldr	x1, [x19]
  9ee0d8: eb01005f     	cmp	x2, x1
  9ee0dc: 54000301     	b.ne	0x9ee13c <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0x114>
  9ee0e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ee0e4: f94013f5     	ldr	x21, [sp, #0x20]
  9ee0e8: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9ee0ec: d65f03c0     	ret
  9ee0f0: 52800000     	mov	w0, #0x0                // =0
  9ee0f4: 17fffff6     	b	0x9ee0cc <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0xa4>
  9ee0f8: d0002aa1     	adrp	x1, 0xf44000
  9ee0fc: f9445021     	ldr	x1, [x1, #0x8a0]
  9ee100: b4000161     	cbz	x1, 0x9ee12c <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0x104>
  9ee104: d1002042     	sub	x2, x2, #0x8
  9ee108: 885ffc41     	ldaxr	w1, [x2]
  9ee10c: 51000423     	sub	w3, w1, #0x1
  9ee110: 8804fc43     	stlxr	w4, w3, [x2]
  9ee114: 35ffffa4     	cbnz	w4, 0x9ee108 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0xe0>
  9ee118: 6b1f003f     	cmp	w1, wzr
  9ee11c: 54fffbec     	b.gt	0x9ee098 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0x70>
  9ee120: 910123a1     	add	x1, x29, #0x48
  9ee124: 940771a6     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee128: 17ffffdc     	b	0x9ee098 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0x70>
  9ee12c: b85f8041     	ldur	w1, [x2, #-0x8]
  9ee130: 51000423     	sub	w3, w1, #0x1
  9ee134: b81f8043     	stur	w3, [x2, #-0x8]
  9ee138: 17fffff8     	b	0x9ee118 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0xf0>
  9ee13c: 97e6b499     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ee140: f0002ac1     	adrp	x1, 0xf49000
  9ee144: aa0003f3     	mov	x19, x0
  9ee148: f9402ba0     	ldr	x0, [x29, #0x50]
  9ee14c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ee150: d1006000     	sub	x0, x0, #0x18
  9ee154: eb01001f     	cmp	x0, x1
  9ee158: 54000060     	b.eq	0x9ee164 <_ZN7cocos2d9FileUtils15writeDataToFileERKNS_4DataERKSs+0x13c>
  9ee15c: 910123a1     	add	x1, x29, #0x48
  9ee160: 97e6c4c8     	bl	0x39f480 <.text+0x3170>
  9ee164: aa1303e0     	mov	x0, x19
  9ee168: 9407d35e     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ee16c <_ZNK7cocos2d9FileUtils11isFileExistERKSs>:
  9ee16c: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9ee170: 910003fd     	mov	x29, sp
  9ee174: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee178: d0002a93     	adrp	x19, 0xf40000
  9ee17c: f9400002     	ldr	x2, [x0]
  9ee180: f90013f5     	str	x21, [sp, #0x20]
  9ee184: aa0003f4     	mov	x20, x0
  9ee188: aa0103f5     	mov	x21, x1
  9ee18c: f940e663     	ldr	x3, [x19, #0x1c8]
  9ee190: f9408042     	ldr	x2, [x2, #0x100]
  9ee194: f9400063     	ldr	x3, [x3]
  9ee198: f90027a3     	str	x3, [x29, #0x48]
  9ee19c: d63f0040     	blr	x2
  9ee1a0: 53001c00     	uxtb	w0, w0
  9ee1a4: f9400282     	ldr	x2, [x20]
  9ee1a8: 35000320     	cbnz	w0, 0x9ee20c <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xa0>
  9ee1ac: f9402042     	ldr	x2, [x2, #0x40]
  9ee1b0: aa1403e0     	mov	x0, x20
  9ee1b4: aa1503e1     	mov	x1, x21
  9ee1b8: 910103a8     	add	x8, x29, #0x40
  9ee1bc: d63f0040     	blr	x2
  9ee1c0: f94023a2     	ldr	x2, [x29, #0x40]
  9ee1c4: f0002ac1     	adrp	x1, 0xf49000
  9ee1c8: d1006040     	sub	x0, x2, #0x18
  9ee1cc: f85e8043     	ldur	x3, [x2, #-0x18]
  9ee1d0: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ee1d4: eb1f007f     	cmp	x3, xzr
  9ee1d8: 1a9f07f4     	cset	w20, ne
  9ee1dc: eb01001f     	cmp	x0, x1
  9ee1e0: 54000221     	b.ne	0x9ee224 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xb8>
  9ee1e4: f940e673     	ldr	x19, [x19, #0x1c8]
  9ee1e8: 2a1403e0     	mov	w0, w20
  9ee1ec: f94027a2     	ldr	x2, [x29, #0x48]
  9ee1f0: f9400261     	ldr	x1, [x19]
  9ee1f4: eb01005f     	cmp	x2, x1
  9ee1f8: 54000381     	b.ne	0x9ee268 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xfc>
  9ee1fc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ee200: f94013f5     	ldr	x21, [sp, #0x20]
  9ee204: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9ee208: d65f03c0     	ret
  9ee20c: f940cc42     	ldr	x2, [x2, #0x198]
  9ee210: aa1403e0     	mov	x0, x20
  9ee214: aa1503e1     	mov	x1, x21
  9ee218: d63f0040     	blr	x2
  9ee21c: 53001c14     	uxtb	w20, w0
  9ee220: 17fffff1     	b	0x9ee1e4 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0x78>
  9ee224: d0002aa1     	adrp	x1, 0xf44000
  9ee228: f9445021     	ldr	x1, [x1, #0x8a0]
  9ee22c: b4000161     	cbz	x1, 0x9ee258 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xec>
  9ee230: d1002042     	sub	x2, x2, #0x8
  9ee234: 885ffc41     	ldaxr	w1, [x2]
  9ee238: 51000423     	sub	w3, w1, #0x1
  9ee23c: 8804fc43     	stlxr	w4, w3, [x2]
  9ee240: 35ffffa4     	cbnz	w4, 0x9ee234 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xc8>
  9ee244: 6b1f003f     	cmp	w1, wzr
  9ee248: 54fffcec     	b.gt	0x9ee1e4 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0x78>
  9ee24c: 9100e3a1     	add	x1, x29, #0x38
  9ee250: 9407715b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee254: 17ffffe4     	b	0x9ee1e4 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0x78>
  9ee258: b85f8041     	ldur	w1, [x2, #-0x8]
  9ee25c: 51000423     	sub	w3, w1, #0x1
  9ee260: b81f8043     	stur	w3, [x2, #-0x8]
  9ee264: 17fffff8     	b	0x9ee244 <_ZNK7cocos2d9FileUtils11isFileExistERKSs+0xd8>
  9ee268: 97e6b44e     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009ee26c <_ZN7cocos2d9FileUtils15removeDirectoryERKSs>:
  9ee26c: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
  9ee270: 910003fd     	mov	x29, sp
  9ee274: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee278: d0002a94     	adrp	x20, 0xf40000
  9ee27c: f90023f9     	str	x25, [sp, #0x40]
  9ee280: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ee284: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ee288: f940e683     	ldr	x3, [x20, #0x1c8]
  9ee28c: aa0103f9     	mov	x25, x1
  9ee290: 910183b7     	add	x23, x29, #0x60
  9ee294: 9101c3b6     	add	x22, x29, #0x70
  9ee298: b0001381     	adrp	x1, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9ee29c: aa1703e0     	mov	x0, x23
  9ee2a0: f9400063     	ldr	x3, [x3]
  9ee2a4: 911cc021     	add	x1, x1, #0x730
  9ee2a8: aa1603e2     	mov	x2, x22
  9ee2ac: f9003fa3     	str	x3, [x29, #0x78]
  9ee2b0: f0002ad3     	adrp	x19, 0xf49000
  9ee2b4: 9101a3b5     	add	x21, x29, #0x68
  9ee2b8: 94076346     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ee2bc: f9400321     	ldr	x1, [x25]
  9ee2c0: aa1503e0     	mov	x0, x21
  9ee2c4: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ee2c8: f85e8021     	ldur	x1, [x1, #-0x18]
  9ee2cc: 91006042     	add	x2, x2, #0x18
  9ee2d0: f90037a2     	str	x2, [x29, #0x68]
  9ee2d4: 91000421     	add	x1, x1, #0x1
  9ee2d8: 94076472     	bl	0xbc74a0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48e78>
  9ee2dc: f0001678     	adrp	x24, 0xcbd000 <_ZTSN7cocos2d12experimental11FrameBufferE+0x6ba0>
  9ee2e0: aa1503e0     	mov	x0, x21
  9ee2e4: 913c8301     	add	x1, x24, #0xf20
  9ee2e8: d2800022     	mov	x2, #0x1                // =1
  9ee2ec: 94076640     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9ee2f0: aa1503e0     	mov	x0, x21
  9ee2f4: aa1903e1     	mov	x1, x25
  9ee2f8: 940765cd     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9ee2fc: aa1503e0     	mov	x0, x21
  9ee300: 913c8301     	add	x1, x24, #0xf20
  9ee304: d2800022     	mov	x2, #0x1                // =1
  9ee308: 94076639     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9ee30c: aa0003e3     	mov	x3, x0
  9ee310: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ee314: aa1703e0     	mov	x0, x23
  9ee318: aa1603e1     	mov	x1, x22
  9ee31c: 91006042     	add	x2, x2, #0x18
  9ee320: f9400064     	ldr	x4, [x3]
  9ee324: f9003ba4     	str	x4, [x29, #0x70]
  9ee328: f9000062     	str	x2, [x3]
  9ee32c: 940765c0     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9ee330: f9403ba1     	ldr	x1, [x29, #0x70]
  9ee334: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ee338: d1006020     	sub	x0, x1, #0x18
  9ee33c: eb02001f     	cmp	x0, x2
  9ee340: 54000361     	b.ne	0x9ee3ac <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x140>
  9ee344: f94037a1     	ldr	x1, [x29, #0x68]
  9ee348: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ee34c: d1006020     	sub	x0, x1, #0x18
  9ee350: eb02001f     	cmp	x0, x2
  9ee354: 54000461     	b.ne	0x9ee3e0 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x174>
  9ee358: f94033a0     	ldr	x0, [x29, #0x60]
  9ee35c: 97e6b661     	bl	0x39bce0 <system@plt>
  9ee360: f94033a1     	ldr	x1, [x29, #0x60]
  9ee364: 2a2003e0     	mvn	w0, w0
  9ee368: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee36c: 531f7c15     	lsr	w21, w0, #31
  9ee370: d1006020     	sub	x0, x1, #0x18
  9ee374: eb13001f     	cmp	x0, x19
  9ee378: 540004e1     	b.ne	0x9ee414 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1a8>
  9ee37c: f940e694     	ldr	x20, [x20, #0x1c8]
  9ee380: 2a1503e0     	mov	w0, w21
  9ee384: f9403fa2     	ldr	x2, [x29, #0x78]
  9ee388: f9400281     	ldr	x1, [x20]
  9ee38c: eb01005f     	cmp	x2, x1
  9ee390: 54000741     	b.ne	0x9ee478 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x20c>
  9ee394: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ee398: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ee39c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ee3a0: f94023f9     	ldr	x25, [sp, #0x40]
  9ee3a4: a8c87bfd     	ldp	x29, x30, [sp], #0x80
  9ee3a8: d65f03c0     	ret
  9ee3ac: d0002aa2     	adrp	x2, 0xf44000
  9ee3b0: f9445042     	ldr	x2, [x2, #0x8a0]
  9ee3b4: b40005a2     	cbz	x2, 0x9ee468 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1fc>
  9ee3b8: d1002021     	sub	x1, x1, #0x8
  9ee3bc: 885ffc22     	ldaxr	w2, [x1]
  9ee3c0: 51000443     	sub	w3, w2, #0x1
  9ee3c4: 8804fc23     	stlxr	w4, w3, [x1]
  9ee3c8: 35ffffa4     	cbnz	w4, 0x9ee3bc <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x150>
  9ee3cc: 6b1f005f     	cmp	w2, wzr
  9ee3d0: 54fffbac     	b.gt	0x9ee344 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0xd8>
  9ee3d4: 910163a1     	add	x1, x29, #0x58
  9ee3d8: 940770f9     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee3dc: 17ffffda     	b	0x9ee344 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0xd8>
  9ee3e0: d0002aa2     	adrp	x2, 0xf44000
  9ee3e4: f9445042     	ldr	x2, [x2, #0x8a0]
  9ee3e8: b4000382     	cbz	x2, 0x9ee458 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1ec>
  9ee3ec: d1002021     	sub	x1, x1, #0x8
  9ee3f0: 885ffc22     	ldaxr	w2, [x1]
  9ee3f4: 51000443     	sub	w3, w2, #0x1
  9ee3f8: 8804fc23     	stlxr	w4, w3, [x1]
  9ee3fc: 35ffffa4     	cbnz	w4, 0x9ee3f0 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x184>
  9ee400: 6b1f005f     	cmp	w2, wzr
  9ee404: 54fffaac     	b.gt	0x9ee358 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0xec>
  9ee408: aa1603e1     	mov	x1, x22
  9ee40c: 940770ec     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee410: 17ffffd2     	b	0x9ee358 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0xec>
  9ee414: d0002aa2     	adrp	x2, 0xf44000
  9ee418: f9445042     	ldr	x2, [x2, #0x8a0]
  9ee41c: b4000162     	cbz	x2, 0x9ee448 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1dc>
  9ee420: d1002021     	sub	x1, x1, #0x8
  9ee424: 885ffc22     	ldaxr	w2, [x1]
  9ee428: 51000443     	sub	w3, w2, #0x1
  9ee42c: 8804fc23     	stlxr	w4, w3, [x1]
  9ee430: 35ffffa4     	cbnz	w4, 0x9ee424 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1b8>
  9ee434: 6b1f005f     	cmp	w2, wzr
  9ee438: 54fffa2c     	b.gt	0x9ee37c <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x110>
  9ee43c: aa1603e1     	mov	x1, x22
  9ee440: 940770df     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee444: 17ffffce     	b	0x9ee37c <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x110>
  9ee448: b85f8022     	ldur	w2, [x1, #-0x8]
  9ee44c: 51000443     	sub	w3, w2, #0x1
  9ee450: b81f8023     	stur	w3, [x1, #-0x8]
  9ee454: 17fffff8     	b	0x9ee434 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x1c8>
  9ee458: b85f8022     	ldur	w2, [x1, #-0x8]
  9ee45c: 51000443     	sub	w3, w2, #0x1
  9ee460: b81f8023     	stur	w3, [x1, #-0x8]
  9ee464: 17ffffe7     	b	0x9ee400 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x194>
  9ee468: b85f8022     	ldur	w2, [x1, #-0x8]
  9ee46c: 51000443     	sub	w3, w2, #0x1
  9ee470: b81f8023     	stur	w3, [x1, #-0x8]
  9ee474: 17ffffd6     	b	0x9ee3cc <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x160>
  9ee478: 97e6b3ca     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ee47c: aa0003f4     	mov	x20, x0
  9ee480: f9403ba0     	ldr	x0, [x29, #0x70]
  9ee484: f947ee61     	ldr	x1, [x19, #0xfd8]
  9ee488: d1006000     	sub	x0, x0, #0x18
  9ee48c: eb01001f     	cmp	x0, x1
  9ee490: 54000060     	b.eq	0x9ee49c <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x230>
  9ee494: 910163a1     	add	x1, x29, #0x58
  9ee498: 97e6c3fa     	bl	0x39f480 <.text+0x3170>
  9ee49c: f94037a0     	ldr	x0, [x29, #0x68]
  9ee4a0: f947ee61     	ldr	x1, [x19, #0xfd8]
  9ee4a4: d1006000     	sub	x0, x0, #0x18
  9ee4a8: eb01001f     	cmp	x0, x1
  9ee4ac: 54000060     	b.eq	0x9ee4b8 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x24c>
  9ee4b0: aa1603e1     	mov	x1, x22
  9ee4b4: 97e6c3f3     	bl	0x39f480 <.text+0x3170>
  9ee4b8: f94033a0     	ldr	x0, [x29, #0x60]
  9ee4bc: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee4c0: d1006000     	sub	x0, x0, #0x18
  9ee4c4: eb13001f     	cmp	x0, x19
  9ee4c8: 54000060     	b.eq	0x9ee4d4 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x268>
  9ee4cc: aa1603e1     	mov	x1, x22
  9ee4d0: 97e6c3ec     	bl	0x39f480 <.text+0x3170>
  9ee4d4: aa1403e0     	mov	x0, x20
  9ee4d8: 9407d282     	bl	0xbe2ee0 <_Unwind_Resume>
  9ee4dc: aa0003f4     	mov	x20, x0
  9ee4e0: 17ffffef     	b	0x9ee49c <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x230>
  9ee4e4: 17fffffe     	b	0x9ee4dc <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x270>
  9ee4e8: aa0003f4     	mov	x20, x0
  9ee4ec: 17fffff3     	b	0x9ee4b8 <_ZN7cocos2d9FileUtils15removeDirectoryERKSs+0x24c>

00000000009ee4f0 <_ZN7cocos2d9FileUtils11getFileSizeERKSs>:
  9ee4f0: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
  9ee4f4: 910003fd     	mov	x29, sp
  9ee4f8: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ee4fc: d0002a97     	adrp	x23, 0xf40000
  9ee500: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ee504: 910123b5     	add	x21, x29, #0x48
  9ee508: aa0103f6     	mov	x22, x1
  9ee50c: f940e6e2     	ldr	x2, [x23, #0x1c8]
  9ee510: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee514: aa0003f4     	mov	x20, x0
  9ee518: aa1503e0     	mov	x0, x21
  9ee51c: f9400042     	ldr	x2, [x2]
  9ee520: f0002ad3     	adrp	x19, 0xf49000
  9ee524: f9006fa2     	str	x2, [x29, #0xd8]
  9ee528: 94077106     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9ee52c: f9400282     	ldr	x2, [x20]
  9ee530: aa1403e0     	mov	x0, x20
  9ee534: aa1603e1     	mov	x1, x22
  9ee538: f9408042     	ldr	x2, [x2, #0x100]
  9ee53c: d63f0040     	blr	x2
  9ee540: 53001c00     	uxtb	w0, w0
  9ee544: 340002c0     	cbz	w0, 0x9ee59c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0xac>
  9ee548: f94027a0     	ldr	x0, [x29, #0x48]
  9ee54c: 910163a1     	add	x1, x29, #0x58
  9ee550: 97e6b58c     	bl	0x39bb80 <stat@plt>
  9ee554: 350009a0     	cbnz	w0, 0x9ee688 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x198>
  9ee558: f94047b4     	ldr	x20, [x29, #0x88]
  9ee55c: f94027a0     	ldr	x0, [x29, #0x48]
  9ee560: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee564: d1006001     	sub	x1, x0, #0x18
  9ee568: eb13003f     	cmp	x1, x19
  9ee56c: 54000481     	b.ne	0x9ee5fc <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x10c>
  9ee570: f940e6e1     	ldr	x1, [x23, #0x1c8]
  9ee574: aa1403e0     	mov	x0, x20
  9ee578: f9406fa2     	ldr	x2, [x29, #0xd8]
  9ee57c: f9400021     	ldr	x1, [x1]
  9ee580: eb01005f     	cmp	x2, x1
  9ee584: 54000881     	b.ne	0x9ee694 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x1a4>
  9ee588: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ee58c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ee590: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ee594: a8ce7bfd     	ldp	x29, x30, [sp], #0xe0
  9ee598: d65f03c0     	ret
  9ee59c: f9400282     	ldr	x2, [x20]
  9ee5a0: 910143b8     	add	x24, x29, #0x50
  9ee5a4: aa1803e8     	mov	x8, x24
  9ee5a8: aa1403e0     	mov	x0, x20
  9ee5ac: aa1603e1     	mov	x1, x22
  9ee5b0: f0002ad3     	adrp	x19, 0xf49000
  9ee5b4: f9402042     	ldr	x2, [x2, #0x40]
  9ee5b8: d63f0040     	blr	x2
  9ee5bc: aa1503e0     	mov	x0, x21
  9ee5c0: aa1803e1     	mov	x1, x24
  9ee5c4: 9407668a     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9ee5c8: f9402ba1     	ldr	x1, [x29, #0x50]
  9ee5cc: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ee5d0: d1006020     	sub	x0, x1, #0x18
  9ee5d4: eb02001f     	cmp	x0, x2
  9ee5d8: 540002e1     	b.ne	0x9ee634 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x144>
  9ee5dc: f94027a0     	ldr	x0, [x29, #0x48]
  9ee5e0: f85e8001     	ldur	x1, [x0, #-0x18]
  9ee5e4: b5fffb41     	cbnz	x1, 0x9ee54c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x5c>
  9ee5e8: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee5ec: d1006001     	sub	x1, x0, #0x18
  9ee5f0: d2800014     	mov	x20, #0x0               // =0
  9ee5f4: eb13003f     	cmp	x1, x19
  9ee5f8: 54fffbc0     	b.eq	0x9ee570 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x80>
  9ee5fc: d0002aa2     	adrp	x2, 0xf44000
  9ee600: f9445042     	ldr	x2, [x2, #0x8a0]
  9ee604: b40003a2     	cbz	x2, 0x9ee678 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x188>
  9ee608: d1002000     	sub	x0, x0, #0x8
  9ee60c: 885ffc02     	ldaxr	w2, [x0]
  9ee610: 51000443     	sub	w3, w2, #0x1
  9ee614: 8804fc03     	stlxr	w4, w3, [x0]
  9ee618: 35ffffa4     	cbnz	w4, 0x9ee60c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x11c>
  9ee61c: 6b1f005f     	cmp	w2, wzr
  9ee620: 54fffa8c     	b.gt	0x9ee570 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x80>
  9ee624: aa0103e0     	mov	x0, x1
  9ee628: 910143a1     	add	x1, x29, #0x50
  9ee62c: 94077064     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee630: 17ffffd0     	b	0x9ee570 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x80>
  9ee634: d0002aa2     	adrp	x2, 0xf44000
  9ee638: f9445042     	ldr	x2, [x2, #0x8a0]
  9ee63c: b4000162     	cbz	x2, 0x9ee668 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x178>
  9ee640: d1002021     	sub	x1, x1, #0x8
  9ee644: 885ffc22     	ldaxr	w2, [x1]
  9ee648: 51000443     	sub	w3, w2, #0x1
  9ee64c: 8804fc23     	stlxr	w4, w3, [x1]
  9ee650: 35ffffa4     	cbnz	w4, 0x9ee644 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x154>
  9ee654: 6b1f005f     	cmp	w2, wzr
  9ee658: 54fffc2c     	b.gt	0x9ee5dc <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0xec>
  9ee65c: 910163a1     	add	x1, x29, #0x58
  9ee660: 94077057     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee664: 17ffffde     	b	0x9ee5dc <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0xec>
  9ee668: b85f8022     	ldur	w2, [x1, #-0x8]
  9ee66c: 51000443     	sub	w3, w2, #0x1
  9ee670: b81f8023     	stur	w3, [x1, #-0x8]
  9ee674: 17fffff8     	b	0x9ee654 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x164>
  9ee678: b85f8002     	ldur	w2, [x0, #-0x8]
  9ee67c: 51000443     	sub	w3, w2, #0x1
  9ee680: b81f8003     	stur	w3, [x0, #-0x8]
  9ee684: 17ffffe6     	b	0x9ee61c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x12c>
  9ee688: f94027a0     	ldr	x0, [x29, #0x48]
  9ee68c: 92800014     	mov	x20, #-0x1              // =-1
  9ee690: 17ffffb4     	b	0x9ee560 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x70>
  9ee694: 97e6b343     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ee698: aa0003f4     	mov	x20, x0
  9ee69c: f94027a0     	ldr	x0, [x29, #0x48]
  9ee6a0: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ee6a4: d1006000     	sub	x0, x0, #0x18
  9ee6a8: eb13001f     	cmp	x0, x19
  9ee6ac: 54000060     	b.eq	0x9ee6b8 <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x1c8>
  9ee6b0: 910103a1     	add	x1, x29, #0x40
  9ee6b4: 97e6c373     	bl	0x39f480 <.text+0x3170>
  9ee6b8: aa1403e0     	mov	x0, x20
  9ee6bc: 9407d209     	bl	0xbe2ee0 <_Unwind_Resume>
  9ee6c0: f0002ad3     	adrp	x19, 0xf49000
  9ee6c4: aa0003f4     	mov	x20, x0
  9ee6c8: f9402ba0     	ldr	x0, [x29, #0x50]
  9ee6cc: f947ee61     	ldr	x1, [x19, #0xfd8]
  9ee6d0: d1006000     	sub	x0, x0, #0x18
  9ee6d4: eb01001f     	cmp	x0, x1
  9ee6d8: 54fffe20     	b.eq	0x9ee69c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x1ac>
  9ee6dc: 910163a1     	add	x1, x29, #0x58
  9ee6e0: 97e6c368     	bl	0x39f480 <.text+0x3170>
  9ee6e4: 17ffffee     	b	0x9ee69c <_ZN7cocos2d9FileUtils11getFileSizeERKSs+0x1ac>

00000000009ee6e8 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl>:
  9ee6e8: a9a17bfd     	stp	x29, x30, [sp, #-0x1f0]!
  9ee6ec: 910003fd     	mov	x29, sp
  9ee6f0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee6f4: d0002a93     	adrp	x19, 0xf40000
  9ee6f8: f9400020     	ldr	x0, [x1]
  9ee6fc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ee700: aa0203f6     	mov	x22, x2
  9ee704: f90027a1     	str	x1, [x29, #0x48]
  9ee708: f940e662     	ldr	x2, [x19, #0x1c8]
  9ee70c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ee710: aa0303f7     	mov	x23, x3
  9ee714: f9400042     	ldr	x2, [x2]
  9ee718: f900007f     	str	xzr, [x3]
  9ee71c: f900f7a2     	str	x2, [x29, #0x1e8]
  9ee720: f85e8000     	ldur	x0, [x0, #-0x18]
  9ee724: b40007e0     	cbz	x0, 0x9ee820 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x138>
  9ee728: 97e6ff6d     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  9ee72c: f9400002     	ldr	x2, [x0]
  9ee730: 910163b5     	add	x21, x29, #0x58
  9ee734: f94027a1     	ldr	x1, [x29, #0x48]
  9ee738: aa1503e8     	mov	x8, x21
  9ee73c: f9407042     	ldr	x2, [x2, #0xe0]
  9ee740: d63f0040     	blr	x2
  9ee744: f94002a0     	ldr	x0, [x21]
  9ee748: 94024275     	bl	0xa7f11c <_ZN7cocos2d7unzOpenEPKc>
  9ee74c: f0002ac1     	adrp	x1, 0xf49000
  9ee750: f94002a2     	ldr	x2, [x21]
  9ee754: aa0003f4     	mov	x20, x0
  9ee758: d1006040     	sub	x0, x2, #0x18
  9ee75c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ee760: eb01001f     	cmp	x0, x1
  9ee764: 54000621     	b.ne	0x9ee828 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x140>
  9ee768: b40005d4     	cbz	x20, 0x9ee820 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x138>
  9ee76c: f94002c1     	ldr	x1, [x22]
  9ee770: aa1403e0     	mov	x0, x20
  9ee774: 52800022     	mov	w2, #0x1                // =1
  9ee778: 940242db     	bl	0xa7f2e4 <_ZN7cocos2d13unzLocateFileEPvPKci>
  9ee77c: 350004e0     	cbnz	w0, 0x9ee818 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x130>
  9ee780: aa1403e0     	mov	x0, x20
  9ee784: aa1503e1     	mov	x1, x21
  9ee788: 910383a2     	add	x2, x29, #0xe0
  9ee78c: d2802083     	mov	x3, #0x104              // =260
  9ee790: d2800004     	mov	x4, #0x0                // =0
  9ee794: d2800005     	mov	x5, #0x0                // =0
  9ee798: d2800006     	mov	x6, #0x0                // =0
  9ee79c: d2800007     	mov	x7, #0x0                // =0
  9ee7a0: 94023fd3     	bl	0xa7e6ec <_ZN7cocos2d21unzGetCurrentFileInfoEPvPNS_15unz_file_info_sEPcmS0_mS3_m>
  9ee7a4: 350003a0     	cbnz	w0, 0x9ee818 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x130>
  9ee7a8: aa1403e0     	mov	x0, x20
  9ee7ac: 94024613     	bl	0xa7fff8 <_ZN7cocos2d18unzOpenCurrentFileEPv>
  9ee7b0: 35000340     	cbnz	w0, 0x9ee818 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x130>
  9ee7b4: f9401eb8     	ldr	x24, [x21, #0x38]
  9ee7b8: aa1803e0     	mov	x0, x24
  9ee7bc: 97e6b309     	bl	0x39b3e0 <malloc@plt>
  9ee7c0: aa0003f6     	mov	x22, x0
  9ee7c4: aa1603e1     	mov	x1, x22
  9ee7c8: aa1403e0     	mov	x0, x20
  9ee7cc: 2a1803e2     	mov	w2, w24
  9ee7d0: 94024383     	bl	0xa7f5dc <_ZN7cocos2d18unzReadCurrentFileEPvS0_j>
  9ee7d4: f9401ea0     	ldr	x0, [x21, #0x38]
  9ee7d8: f90002e0     	str	x0, [x23]
  9ee7dc: aa1403e0     	mov	x0, x20
  9ee7e0: 94024484     	bl	0xa7f9f0 <_ZN7cocos2d19unzCloseCurrentFileEPv>
  9ee7e4: aa1403e0     	mov	x0, x20
  9ee7e8: 940244a8     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9ee7ec: f940e673     	ldr	x19, [x19, #0x1c8]
  9ee7f0: aa1603e0     	mov	x0, x22
  9ee7f4: f940f7a2     	ldr	x2, [x29, #0x1e8]
  9ee7f8: f9400261     	ldr	x1, [x19]
  9ee7fc: eb01005f     	cmp	x2, x1
  9ee800: 54000361     	b.ne	0x9ee86c <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x184>
  9ee804: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ee808: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ee80c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ee810: a8df7bfd     	ldp	x29, x30, [sp], #0x1f0
  9ee814: d65f03c0     	ret
  9ee818: d2800016     	mov	x22, #0x0               // =0
  9ee81c: 17fffff2     	b	0x9ee7e4 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0xfc>
  9ee820: d2800016     	mov	x22, #0x0               // =0
  9ee824: 17fffff2     	b	0x9ee7ec <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x104>
  9ee828: d0002aa1     	adrp	x1, 0xf44000
  9ee82c: f9445021     	ldr	x1, [x1, #0x8a0]
  9ee830: b4000161     	cbz	x1, 0x9ee85c <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x174>
  9ee834: d1002042     	sub	x2, x2, #0x8
  9ee838: 885ffc41     	ldaxr	w1, [x2]
  9ee83c: 51000423     	sub	w3, w1, #0x1
  9ee840: 8804fc43     	stlxr	w4, w3, [x2]
  9ee844: 35ffffa4     	cbnz	w4, 0x9ee838 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x150>
  9ee848: 6b1f003f     	cmp	w1, wzr
  9ee84c: 54fff8ec     	b.gt	0x9ee768 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x80>
  9ee850: 910143a1     	add	x1, x29, #0x50
  9ee854: 94076fda     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ee858: 17ffffc4     	b	0x9ee768 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x80>
  9ee85c: b85f8041     	ldur	w1, [x2, #-0x8]
  9ee860: 51000423     	sub	w3, w1, #0x1
  9ee864: b81f8043     	stur	w3, [x2, #-0x8]
  9ee868: 17fffff8     	b	0x9ee848 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x160>
  9ee86c: 97e6b2cd     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ee870: f94002a1     	ldr	x1, [x21]
  9ee874: aa0003f3     	mov	x19, x0
  9ee878: d1006020     	sub	x0, x1, #0x18
  9ee87c: f0002ac1     	adrp	x1, 0xf49000
  9ee880: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ee884: eb01001f     	cmp	x0, x1
  9ee888: 54000060     	b.eq	0x9ee894 <_ZN7cocos2d9FileUtils18getFileDataFromZipERKSsS2_Pl+0x1ac>
  9ee88c: 910143a1     	add	x1, x29, #0x50
  9ee890: 97e6c2fc     	bl	0x39f480 <.text+0x3170>
  9ee894: aa1303e0     	mov	x0, x19
  9ee898: 9407d192     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009ee89c <_ZN7cocos2d9FileUtils15getAllFileListsEPKc>:
  9ee89c: a9b67bfd     	stp	x29, x30, [sp, #-0xa0]!
  9ee8a0: 910003fd     	mov	x29, sp
  9ee8a4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ee8a8: d0002a96     	adrp	x22, 0xf40000
  9ee8ac: aa0103f5     	mov	x21, x1
  9ee8b0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ee8b4: aa0003f3     	mov	x19, x0
  9ee8b8: aa0103e0     	mov	x0, x1
  9ee8bc: f940e6c1     	ldr	x1, [x22, #0x1c8]
  9ee8c0: 910223b4     	add	x20, x29, #0x88
  9ee8c4: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ee8c8: f90023f9     	str	x25, [sp, #0x40]
  9ee8cc: 9101c3b8     	add	x24, x29, #0x70
  9ee8d0: f9400021     	ldr	x1, [x1]
  9ee8d4: 910203b7     	add	x23, x29, #0x80
  9ee8d8: f9004fa1     	str	x1, [x29, #0x98]
  9ee8dc: 9101e3b9     	add	x25, x29, #0x78
  9ee8e0: 97e6b26c     	bl	0x39b290 <strlen@plt>
  9ee8e4: aa0003e1     	mov	x1, x0
  9ee8e8: f9400262     	ldr	x2, [x19]
  9ee8ec: aa1303e0     	mov	x0, x19
  9ee8f0: f940bc42     	ldr	x2, [x2, #0x178]
  9ee8f4: d63f0040     	blr	x2
  9ee8f8: aa1303e2     	mov	x2, x19
  9ee8fc: aa1303e0     	mov	x0, x19
  9ee900: aa1503e1     	mov	x1, x21
  9ee904: f8408443     	ldr	x3, [x2], #0x8
  9ee908: f940b463     	ldr	x3, [x3, #0x168]
  9ee90c: d63f0060     	blr	x3
  9ee910: f9002fb4     	str	x20, [x29, #0x58]
  9ee914: f9442e61     	ldr	x1, [x19, #0x858]
  9ee918: aa1403e0     	mov	x0, x20
  9ee91c: b9400a62     	ldr	w2, [x19, #0x8]
  9ee920: 97e6b5a8     	bl	0x39bfc0 <sprintf@plt>
  9ee924: b9400e64     	ldr	w4, [x19, #0xc]
  9ee928: f9402fa3     	ldr	x3, [x29, #0x58]
  9ee92c: f9443661     	ldr	x1, [x19, #0x868]
  9ee930: 39c223a2     	ldrsb	w2, [x29, #0x88]
  9ee934: f9443a60     	ldr	x0, [x19, #0x870]
  9ee938: 97e6b5a2     	bl	0x39bfc0 <sprintf@plt>
  9ee93c: aa1503e1     	mov	x1, x21
  9ee940: aa1703e2     	mov	x2, x23
  9ee944: aa1803e0     	mov	x0, x24
  9ee948: 940761a2     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ee94c: 528005c1     	mov	w1, #0x2e               // =46
  9ee950: 92800002     	mov	x2, #-0x1               // =-1
  9ee954: aa1803e0     	mov	x0, x24
  9ee958: 940766d6     	bl	0xbc84b0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49e88>
  9ee95c: aa0003f4     	mov	x20, x0
  9ee960: b00013e1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9ee964: aa1903e0     	mov	x0, x25
  9ee968: 91330021     	add	x1, x1, #0xcc0
  9ee96c: aa1703e2     	mov	x2, x23
  9ee970: 94076198     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ee974: b100069f     	cmn	x20, #0x1
  9ee978: 540005c0     	b.eq	0x9eea30 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x194>
  9ee97c: f9403ba0     	ldr	x0, [x29, #0x70]
  9ee980: f85e8003     	ldur	x3, [x0, #-0x18]
  9ee984: eb03029f     	cmp	x20, x3
  9ee988: 54000c88     	b.hi	0x9eeb18 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x27c>
  9ee98c: aa1703e0     	mov	x0, x23
  9ee990: aa1803e1     	mov	x1, x24
  9ee994: aa1403e2     	mov	x2, x20
  9ee998: 92800003     	mov	x3, #-0x1               // =-1
  9ee99c: 94076080     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9ee9a0: aa1903e0     	mov	x0, x25
  9ee9a4: aa1703e1     	mov	x1, x23
  9ee9a8: 94076591     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9ee9ac: f0002ad4     	adrp	x20, 0xf49000
  9ee9b0: f94043a1     	ldr	x1, [x29, #0x80]
  9ee9b4: d1006020     	sub	x0, x1, #0x18
  9ee9b8: f947ee82     	ldr	x2, [x20, #0xfd8]
  9ee9bc: eb02001f     	cmp	x0, x2
  9ee9c0: 54000781     	b.ne	0x9eeab0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x214>
  9ee9c4: f9443a60     	ldr	x0, [x19, #0x870]
  9ee9c8: f00015c1     	adrp	x1, 0xca9000 <CAST_version+0xcc0>
  9ee9cc: f9403fa3     	ldr	x3, [x29, #0x78]
  9ee9d0: 911e6021     	add	x1, x1, #0x798
  9ee9d4: aa0003e2     	mov	x2, x0
  9ee9d8: 97e6b57a     	bl	0x39bfc0 <sprintf@plt>
  9ee9dc: f9403fa1     	ldr	x1, [x29, #0x78]
  9ee9e0: f947ee82     	ldr	x2, [x20, #0xfd8]
  9ee9e4: d1006020     	sub	x0, x1, #0x18
  9ee9e8: eb02001f     	cmp	x0, x2
  9ee9ec: 540002e1     	b.ne	0x9eea48 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x1ac>
  9ee9f0: f9403bb3     	ldr	x19, [x29, #0x70]
  9ee9f4: f947ee94     	ldr	x20, [x20, #0xfd8]
  9ee9f8: d1006260     	sub	x0, x19, #0x18
  9ee9fc: eb14001f     	cmp	x0, x20
  9eea00: 540003e1     	b.ne	0x9eea7c <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x1e0>
  9eea04: f940e6c0     	ldr	x0, [x22, #0x1c8]
  9eea08: f9404fa1     	ldr	x1, [x29, #0x98]
  9eea0c: f9400000     	ldr	x0, [x0]
  9eea10: eb00003f     	cmp	x1, x0
  9eea14: 54000801     	b.ne	0x9eeb14 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x278>
  9eea18: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9eea1c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9eea20: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9eea24: f94023f9     	ldr	x25, [sp, #0x40]
  9eea28: a8ca7bfd     	ldp	x29, x30, [sp], #0xa0
  9eea2c: d65f03c0     	ret
  9eea30: f0002ad4     	adrp	x20, 0xf49000
  9eea34: f9403fa1     	ldr	x1, [x29, #0x78]
  9eea38: d1006020     	sub	x0, x1, #0x18
  9eea3c: f947ee82     	ldr	x2, [x20, #0xfd8]
  9eea40: eb02001f     	cmp	x0, x2
  9eea44: 54fffd60     	b.eq	0x9ee9f0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x154>
  9eea48: d0002aa2     	adrp	x2, 0xf44000
  9eea4c: f9445042     	ldr	x2, [x2, #0x8a0]
  9eea50: b40004a2     	cbz	x2, 0x9eeae4 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x248>
  9eea54: d1002021     	sub	x1, x1, #0x8
  9eea58: 885ffc22     	ldaxr	w2, [x1]
  9eea5c: 51000443     	sub	w3, w2, #0x1
  9eea60: 8804fc23     	stlxr	w4, w3, [x1]
  9eea64: 35ffffa4     	cbnz	w4, 0x9eea58 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x1bc>
  9eea68: 6b1f005f     	cmp	w2, wzr
  9eea6c: 54fffc2c     	b.gt	0x9ee9f0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x154>
  9eea70: aa1703e1     	mov	x1, x23
  9eea74: 94076f52     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eea78: 17ffffde     	b	0x9ee9f0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x154>
  9eea7c: d0002aa1     	adrp	x1, 0xf44000
  9eea80: f9445021     	ldr	x1, [x1, #0x8a0]
  9eea84: b4000381     	cbz	x1, 0x9eeaf4 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x258>
  9eea88: d1002273     	sub	x19, x19, #0x8
  9eea8c: 885ffe61     	ldaxr	w1, [x19]
  9eea90: 51000422     	sub	w2, w1, #0x1
  9eea94: 8803fe62     	stlxr	w3, w2, [x19]
  9eea98: 35ffffa3     	cbnz	w3, 0x9eea8c <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x1f0>
  9eea9c: 6b1f003f     	cmp	w1, wzr
  9eeaa0: 54fffb2c     	b.gt	0x9eea04 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x168>
  9eeaa4: aa1703e1     	mov	x1, x23
  9eeaa8: 94076f45     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eeaac: 17ffffd6     	b	0x9eea04 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x168>
  9eeab0: d0002aa2     	adrp	x2, 0xf44000
  9eeab4: f9445042     	ldr	x2, [x2, #0x8a0]
  9eeab8: b4000262     	cbz	x2, 0x9eeb04 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x268>
  9eeabc: d1002021     	sub	x1, x1, #0x8
  9eeac0: 885ffc22     	ldaxr	w2, [x1]
  9eeac4: 51000443     	sub	w3, w2, #0x1
  9eeac8: 8804fc23     	stlxr	w4, w3, [x1]
  9eeacc: 35ffffa4     	cbnz	w4, 0x9eeac0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x224>
  9eead0: 6b1f005f     	cmp	w2, wzr
  9eead4: 54fff78c     	b.gt	0x9ee9c4 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x128>
  9eead8: 9101a3a1     	add	x1, x29, #0x68
  9eeadc: 94076f38     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eeae0: 17ffffb9     	b	0x9ee9c4 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x128>
  9eeae4: b85f8022     	ldur	w2, [x1, #-0x8]
  9eeae8: 51000443     	sub	w3, w2, #0x1
  9eeaec: b81f8023     	stur	w3, [x1, #-0x8]
  9eeaf0: 17ffffde     	b	0x9eea68 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x1cc>
  9eeaf4: b85f8261     	ldur	w1, [x19, #-0x8]
  9eeaf8: 51000422     	sub	w2, w1, #0x1
  9eeafc: b81f8262     	stur	w2, [x19, #-0x8]
  9eeb00: 17ffffe7     	b	0x9eea9c <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x200>
  9eeb04: b85f8022     	ldur	w2, [x1, #-0x8]
  9eeb08: 51000443     	sub	w3, w2, #0x1
  9eeb0c: b81f8023     	stur	w3, [x1, #-0x8]
  9eeb10: 17fffff0     	b	0x9eead0 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x234>
  9eeb14: 97e6b223     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9eeb18: d0000fa0     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9eeb1c: d0000fa1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9eeb20: 912f0000     	add	x0, x0, #0xbc0
  9eeb24: 912fe021     	add	x1, x1, #0xbf8
  9eeb28: aa1403e2     	mov	x2, x20
  9eeb2c: 94075a5b     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>
  9eeb30: aa0003f3     	mov	x19, x0
  9eeb34: f0002ad4     	adrp	x20, 0xf49000
  9eeb38: f9403fa0     	ldr	x0, [x29, #0x78]
  9eeb3c: f947ee81     	ldr	x1, [x20, #0xfd8]
  9eeb40: d1006000     	sub	x0, x0, #0x18
  9eeb44: eb01001f     	cmp	x0, x1
  9eeb48: 54000060     	b.eq	0x9eeb54 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x2b8>
  9eeb4c: 9101a3a1     	add	x1, x29, #0x68
  9eeb50: 97e6c24c     	bl	0x39f480 <.text+0x3170>
  9eeb54: f9403ba0     	ldr	x0, [x29, #0x70]
  9eeb58: f947ee94     	ldr	x20, [x20, #0xfd8]
  9eeb5c: d1006000     	sub	x0, x0, #0x18
  9eeb60: eb14001f     	cmp	x0, x20
  9eeb64: 54000060     	b.eq	0x9eeb70 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x2d4>
  9eeb68: 9101a3a1     	add	x1, x29, #0x68
  9eeb6c: 97e6c245     	bl	0x39f480 <.text+0x3170>
  9eeb70: aa1303e0     	mov	x0, x19
  9eeb74: 9407d0db     	bl	0xbe2ee0 <_Unwind_Resume>
  9eeb78: f0002ad4     	adrp	x20, 0xf49000
  9eeb7c: aa0003f3     	mov	x19, x0
  9eeb80: f94043a0     	ldr	x0, [x29, #0x80]
  9eeb84: f947ee81     	ldr	x1, [x20, #0xfd8]
  9eeb88: d1006000     	sub	x0, x0, #0x18
  9eeb8c: eb01001f     	cmp	x0, x1
  9eeb90: 54fffd40     	b.eq	0x9eeb38 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x29c>
  9eeb94: 9101a3a1     	add	x1, x29, #0x68
  9eeb98: 97e6c23a     	bl	0x39f480 <.text+0x3170>
  9eeb9c: 17ffffe7     	b	0x9eeb38 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x29c>
  9eeba0: aa0003f3     	mov	x19, x0
  9eeba4: f0002ad4     	adrp	x20, 0xf49000
  9eeba8: 17ffffeb     	b	0x9eeb54 <_ZN7cocos2d9FileUtils15getAllFileListsEPKc+0x2b8>

00000000009eebac <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_>:
  9eebac: a9b57bfd     	stp	x29, x30, [sp, #-0xb0]!
  9eebb0: 910003fd     	mov	x29, sp
  9eebb4: a90573fb     	stp	x27, x28, [sp, #0x50]
  9eebb8: d0002a9c     	adrp	x28, 0xf40000
  9eebbc: f90037a2     	str	x2, [x29, #0x68]
  9eebc0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9eebc4: f940e782     	ldr	x2, [x28, #0x1c8]
  9eebc8: 910203b8     	add	x24, x29, #0x80
  9eebcc: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9eebd0: aa0003fa     	mov	x26, x0
  9eebd4: aa1803e0     	mov	x0, x24
  9eebd8: f9400042     	ldr	x2, [x2]
  9eebdc: 910223b9     	add	x25, x29, #0x88
  9eebe0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9eebe4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9eebe8: f90057a2     	str	x2, [x29, #0xa8]
  9eebec: aa0103f6     	mov	x22, x1
  9eebf0: aa0803f4     	mov	x20, x8
  9eebf4: f90033a3     	str	x3, [x29, #0x60]
  9eebf8: 94076f52     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9eebfc: 910283b7     	add	x23, x29, #0xa0
  9eec00: b00013e1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9eec04: aa1903e0     	mov	x0, x25
  9eec08: 91330021     	add	x1, x1, #0xcc0
  9eec0c: aa1703e2     	mov	x2, x23
  9eec10: 940760f0     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9eec14: f00013a1     	adrp	x1, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9eec18: aa1603e0     	mov	x0, x22
  9eec1c: 913d4021     	add	x1, x1, #0xf50
  9eec20: 92800002     	mov	x2, #-0x1               // =-1
  9eec24: d2800023     	mov	x3, #0x1                // =1
  9eec28: f0002ad3     	adrp	x19, 0xf49000
  9eec2c: 9407669d     	bl	0xbc86a0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a078>
  9eec30: b100041f     	cmn	x0, #0x1
  9eec34: 54000460     	b.eq	0x9eecc0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x114>
  9eec38: 91000415     	add	x21, x0, #0x1
  9eec3c: 910243bb     	add	x27, x29, #0x90
  9eec40: aa1b03e0     	mov	x0, x27
  9eec44: aa1603e1     	mov	x1, x22
  9eec48: d2800002     	mov	x2, #0x0                // =0
  9eec4c: aa1503e3     	mov	x3, x21
  9eec50: f0002ad3     	adrp	x19, 0xf49000
  9eec54: 94075fd2     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9eec58: aa1903e0     	mov	x0, x25
  9eec5c: aa1b03e1     	mov	x1, x27
  9eec60: 940764e3     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9eec64: f9404ba1     	ldr	x1, [x29, #0x90]
  9eec68: f947ee62     	ldr	x2, [x19, #0xfd8]
  9eec6c: d1006020     	sub	x0, x1, #0x18
  9eec70: eb02001f     	cmp	x0, x2
  9eec74: 54000d21     	b.ne	0x9eee18 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x26c>
  9eec78: f94002c0     	ldr	x0, [x22]
  9eec7c: f85e8003     	ldur	x3, [x0, #-0x18]
  9eec80: eb0302bf     	cmp	x21, x3
  9eec84: 54001288     	b.hi	0x9eeed4 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x328>
  9eec88: 910263bb     	add	x27, x29, #0x98
  9eec8c: aa1603e1     	mov	x1, x22
  9eec90: aa1b03e0     	mov	x0, x27
  9eec94: aa1503e2     	mov	x2, x21
  9eec98: 92800003     	mov	x3, #-0x1               // =-1
  9eec9c: 94075fc0     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9eeca0: aa1803e0     	mov	x0, x24
  9eeca4: aa1b03e1     	mov	x1, x27
  9eeca8: 940764d1     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9eecac: f9404fa1     	ldr	x1, [x29, #0x98]
  9eecb0: f947ee62     	ldr	x2, [x19, #0xfd8]
  9eecb4: d1006020     	sub	x0, x1, #0x18
  9eecb8: eb02001f     	cmp	x0, x2
  9eecbc: 54000c81     	b.ne	0x9eee4c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2a0>
  9eecc0: f94033a1     	ldr	x1, [x29, #0x60]
  9eecc4: aa1403e0     	mov	x0, x20
  9eecc8: 94076f1e     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9eeccc: aa1403e0     	mov	x0, x20
  9eecd0: aa1903e1     	mov	x1, x25
  9eecd4: 94076356     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9eecd8: f94037a1     	ldr	x1, [x29, #0x68]
  9eecdc: aa1403e0     	mov	x0, x20
  9eece0: 94076353     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9eece4: f9400343     	ldr	x3, [x26]
  9eece8: aa1703e8     	mov	x8, x23
  9eecec: aa1a03e0     	mov	x0, x26
  9eecf0: aa1403e1     	mov	x1, x20
  9eecf4: aa1803e2     	mov	x2, x24
  9eecf8: f940d863     	ldr	x3, [x3, #0x1b0]
  9eecfc: d63f0060     	blr	x3
  9eed00: aa1403e0     	mov	x0, x20
  9eed04: aa1703e1     	mov	x1, x23
  9eed08: 940764b9     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9eed0c: f94053a1     	ldr	x1, [x29, #0xa0]
  9eed10: f947ee62     	ldr	x2, [x19, #0xfd8]
  9eed14: d1006020     	sub	x0, x1, #0x18
  9eed18: eb02001f     	cmp	x0, x2
  9eed1c: 54000301     	b.ne	0x9eed7c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x1d0>
  9eed20: f94047a1     	ldr	x1, [x29, #0x88]
  9eed24: f947ee62     	ldr	x2, [x19, #0xfd8]
  9eed28: d1006020     	sub	x0, x1, #0x18
  9eed2c: eb02001f     	cmp	x0, x2
  9eed30: 54000401     	b.ne	0x9eedb0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x204>
  9eed34: f94043a1     	ldr	x1, [x29, #0x80]
  9eed38: f947ee73     	ldr	x19, [x19, #0xfd8]
  9eed3c: d1006020     	sub	x0, x1, #0x18
  9eed40: eb13001f     	cmp	x0, x19
  9eed44: 54000501     	b.ne	0x9eede4 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x238>
  9eed48: f940e781     	ldr	x1, [x28, #0x1c8]
  9eed4c: aa1403e0     	mov	x0, x20
  9eed50: f94057a2     	ldr	x2, [x29, #0xa8]
  9eed54: f9400021     	ldr	x1, [x1]
  9eed58: eb01005f     	cmp	x2, x1
  9eed5c: 54000ba1     	b.ne	0x9eeed0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x324>
  9eed60: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9eed64: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9eed68: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9eed6c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9eed70: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9eed74: a8cb7bfd     	ldp	x29, x30, [sp], #0xb0
  9eed78: d65f03c0     	ret
  9eed7c: d0002aa2     	adrp	x2, 0xf44000
  9eed80: f9445042     	ldr	x2, [x2, #0x8a0]
  9eed84: b40008e2     	cbz	x2, 0x9eeea0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2f4>
  9eed88: d1002021     	sub	x1, x1, #0x8
  9eed8c: 885ffc22     	ldaxr	w2, [x1]
  9eed90: 51000443     	sub	w3, w2, #0x1
  9eed94: 8804fc23     	stlxr	w4, w3, [x1]
  9eed98: 35ffffa4     	cbnz	w4, 0x9eed8c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x1e0>
  9eed9c: 6b1f005f     	cmp	w2, wzr
  9eeda0: 54fffc0c     	b.gt	0x9eed20 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x174>
  9eeda4: 910263a1     	add	x1, x29, #0x98
  9eeda8: 94076e85     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eedac: 17ffffdd     	b	0x9eed20 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x174>
  9eedb0: d0002aa2     	adrp	x2, 0xf44000
  9eedb4: f9445042     	ldr	x2, [x2, #0x8a0]
  9eedb8: b40006c2     	cbz	x2, 0x9eee90 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2e4>
  9eedbc: d1002021     	sub	x1, x1, #0x8
  9eedc0: 885ffc22     	ldaxr	w2, [x1]
  9eedc4: 51000443     	sub	w3, w2, #0x1
  9eedc8: 8804fc23     	stlxr	w4, w3, [x1]
  9eedcc: 35ffffa4     	cbnz	w4, 0x9eedc0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x214>
  9eedd0: 6b1f005f     	cmp	w2, wzr
  9eedd4: 54fffb0c     	b.gt	0x9eed34 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x188>
  9eedd8: aa1703e1     	mov	x1, x23
  9eeddc: 94076e78     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eede0: 17ffffd5     	b	0x9eed34 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x188>
  9eede4: d0002aa2     	adrp	x2, 0xf44000
  9eede8: f9445042     	ldr	x2, [x2, #0x8a0]
  9eedec: b40004a2     	cbz	x2, 0x9eee80 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2d4>
  9eedf0: d1002021     	sub	x1, x1, #0x8
  9eedf4: 885ffc22     	ldaxr	w2, [x1]
  9eedf8: 51000443     	sub	w3, w2, #0x1
  9eedfc: 8804fc23     	stlxr	w4, w3, [x1]
  9eee00: 35ffffa4     	cbnz	w4, 0x9eedf4 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x248>
  9eee04: 6b1f005f     	cmp	w2, wzr
  9eee08: 54fffa0c     	b.gt	0x9eed48 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x19c>
  9eee0c: aa1703e1     	mov	x1, x23
  9eee10: 94076e6b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eee14: 17ffffcd     	b	0x9eed48 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x19c>
  9eee18: d0002aa2     	adrp	x2, 0xf44000
  9eee1c: f9445042     	ldr	x2, [x2, #0x8a0]
  9eee20: b4000482     	cbz	x2, 0x9eeeb0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x304>
  9eee24: d1002021     	sub	x1, x1, #0x8
  9eee28: 885ffc22     	ldaxr	w2, [x1]
  9eee2c: 51000443     	sub	w3, w2, #0x1
  9eee30: 8804fc23     	stlxr	w4, w3, [x1]
  9eee34: 35ffffa4     	cbnz	w4, 0x9eee28 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x27c>
  9eee38: 6b1f005f     	cmp	w2, wzr
  9eee3c: 54fff1ec     	b.gt	0x9eec78 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0xcc>
  9eee40: aa1703e1     	mov	x1, x23
  9eee44: 94076e5e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eee48: 17ffff8c     	b	0x9eec78 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0xcc>
  9eee4c: d0002aa2     	adrp	x2, 0xf44000
  9eee50: f9445042     	ldr	x2, [x2, #0x8a0]
  9eee54: b4000362     	cbz	x2, 0x9eeec0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x314>
  9eee58: d1002021     	sub	x1, x1, #0x8
  9eee5c: 885ffc22     	ldaxr	w2, [x1]
  9eee60: 51000443     	sub	w3, w2, #0x1
  9eee64: 8804fc23     	stlxr	w4, w3, [x1]
  9eee68: 35ffffa4     	cbnz	w4, 0x9eee5c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2b0>
  9eee6c: 6b1f005f     	cmp	w2, wzr
  9eee70: 54fff28c     	b.gt	0x9eecc0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x114>
  9eee74: aa1703e1     	mov	x1, x23
  9eee78: 94076e51     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9eee7c: 17ffff91     	b	0x9eecc0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x114>
  9eee80: b85f8022     	ldur	w2, [x1, #-0x8]
  9eee84: 51000443     	sub	w3, w2, #0x1
  9eee88: b81f8023     	stur	w3, [x1, #-0x8]
  9eee8c: 17ffffde     	b	0x9eee04 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x258>
  9eee90: b85f8022     	ldur	w2, [x1, #-0x8]
  9eee94: 51000443     	sub	w3, w2, #0x1
  9eee98: b81f8023     	stur	w3, [x1, #-0x8]
  9eee9c: 17ffffcd     	b	0x9eedd0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x224>
  9eeea0: b85f8022     	ldur	w2, [x1, #-0x8]
  9eeea4: 51000443     	sub	w3, w2, #0x1
  9eeea8: b81f8023     	stur	w3, [x1, #-0x8]
  9eeeac: 17ffffbc     	b	0x9eed9c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x1f0>
  9eeeb0: b85f8022     	ldur	w2, [x1, #-0x8]
  9eeeb4: 51000443     	sub	w3, w2, #0x1
  9eeeb8: b81f8023     	stur	w3, [x1, #-0x8]
  9eeebc: 17ffffdf     	b	0x9eee38 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x28c>
  9eeec0: b85f8022     	ldur	w2, [x1, #-0x8]
  9eeec4: 51000443     	sub	w3, w2, #0x1
  9eeec8: b81f8023     	stur	w3, [x1, #-0x8]
  9eeecc: 17ffffe8     	b	0x9eee6c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x2c0>
  9eeed0: 97e6b134     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9eeed4: d0000fa0     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9eeed8: d0000fa1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9eeedc: 912f0000     	add	x0, x0, #0xbc0
  9eeee0: 912fe021     	add	x1, x1, #0xbf8
  9eeee4: aa1503e2     	mov	x2, x21
  9eeee8: 9407596c     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>
  9eeeec: aa0003f5     	mov	x21, x0
  9eeef0: f94047a0     	ldr	x0, [x29, #0x88]
  9eeef4: f947ee61     	ldr	x1, [x19, #0xfd8]
  9eeef8: d1006000     	sub	x0, x0, #0x18
  9eeefc: eb01001f     	cmp	x0, x1
  9eef00: 54000060     	b.eq	0x9eef0c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x360>
  9eef04: 9101e3a1     	add	x1, x29, #0x78
  9eef08: 97e6c15e     	bl	0x39f480 <.text+0x3170>
  9eef0c: f94043a0     	ldr	x0, [x29, #0x80]
  9eef10: f947ee73     	ldr	x19, [x19, #0xfd8]
  9eef14: d1006000     	sub	x0, x0, #0x18
  9eef18: eb13001f     	cmp	x0, x19
  9eef1c: 54000060     	b.eq	0x9eef28 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x37c>
  9eef20: 9101e3a1     	add	x1, x29, #0x78
  9eef24: 97e6c157     	bl	0x39f480 <.text+0x3170>
  9eef28: aa1503e0     	mov	x0, x21
  9eef2c: 9407cfed     	bl	0xbe2ee0 <_Unwind_Resume>
  9eef30: aa0003f5     	mov	x21, x0
  9eef34: f94053a0     	ldr	x0, [x29, #0xa0]
  9eef38: f947ee61     	ldr	x1, [x19, #0xfd8]
  9eef3c: d1006000     	sub	x0, x0, #0x18
  9eef40: eb01001f     	cmp	x0, x1
  9eef44: 54000060     	b.eq	0x9eef50 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x3a4>
  9eef48: 910263a1     	add	x1, x29, #0x98
  9eef4c: 97e6c14d     	bl	0x39f480 <.text+0x3170>
  9eef50: f9400280     	ldr	x0, [x20]
  9eef54: f947ee61     	ldr	x1, [x19, #0xfd8]
  9eef58: d1006000     	sub	x0, x0, #0x18
  9eef5c: eb01001f     	cmp	x0, x1
  9eef60: 54fffc80     	b.eq	0x9eeef0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x344>
  9eef64: 910263a1     	add	x1, x29, #0x98
  9eef68: 97e6c146     	bl	0x39f480 <.text+0x3170>
  9eef6c: 17ffffe1     	b	0x9eeef0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x344>
  9eef70: aa0003f5     	mov	x21, x0
  9eef74: 17fffff7     	b	0x9eef50 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x3a4>
  9eef78: aa0003f5     	mov	x21, x0
  9eef7c: f0002ad3     	adrp	x19, 0xf49000
  9eef80: 17ffffe3     	b	0x9eef0c <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x360>
  9eef84: f0002ad3     	adrp	x19, 0xf49000
  9eef88: aa0003f5     	mov	x21, x0
  9eef8c: f9404ba0     	ldr	x0, [x29, #0x90]
  9eef90: f947ee61     	ldr	x1, [x19, #0xfd8]
  9eef94: d1006000     	sub	x0, x0, #0x18
  9eef98: eb01001f     	cmp	x0, x1
  9eef9c: 54fffaa0     	b.eq	0x9eeef0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x344>
  9eefa0: aa1703e1     	mov	x1, x23
  9eefa4: 97e6c137     	bl	0x39f480 <.text+0x3170>
  9eefa8: 17ffffd2     	b	0x9eeef0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x344>
  9eefac: aa0003f5     	mov	x21, x0
  9eefb0: f9404fa0     	ldr	x0, [x29, #0x98]
  9eefb4: f947ee61     	ldr	x1, [x19, #0xfd8]
  9eefb8: d1006000     	sub	x0, x0, #0x18
  9eefbc: eb01001f     	cmp	x0, x1
  9eefc0: 54fff980     	b.eq	0x9eeef0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x344>
  9eefc4: 17fffff7     	b	0x9eefa0 <_ZNK7cocos2d9FileUtils18getPathForFilenameERKSsS2_S2_+0x3f4>

00000000009eefc8 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs>:
  9eefc8: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9eefcc: aa0103e0     	mov	x0, x1
  9eefd0: 92800002     	mov	x2, #-0x1               // =-1
  9eefd4: 910003fd     	mov	x29, sp
  9eefd8: a90363f7     	stp	x23, x24, [sp, #0x30]
  9eefdc: d0002a98     	adrp	x24, 0xf40000
  9eefe0: aa0803f7     	mov	x23, x8
  9eefe4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9eefe8: f0002ad3     	adrp	x19, 0xf49000
  9eefec: aa0103f4     	mov	x20, x1
  9eeff0: f940e703     	ldr	x3, [x24, #0x1c8]
  9eeff4: 528005c1     	mov	w1, #0x2e               // =46
  9eeff8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9eeffc: f947ee75     	ldr	x21, [x19, #0xfd8]
  9ef000: f9400063     	ldr	x3, [x3]
  9ef004: 910062b5     	add	x21, x21, #0x18
  9ef008: f9000115     	str	x21, [x8]
  9ef00c: f9002fa3     	str	x3, [x29, #0x58]
  9ef010: 94076528     	bl	0xbc84b0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49e88>
  9ef014: b100041f     	cmn	x0, #0x1
  9ef018: aa0003e2     	mov	x2, x0
  9ef01c: 540005a0     	b.eq	0x9ef0d0 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x108>
  9ef020: f9400280     	ldr	x0, [x20]
  9ef024: f85e8003     	ldur	x3, [x0, #-0x18]
  9ef028: eb03005f     	cmp	x2, x3
  9ef02c: 54000ba8     	b.hi	0x9ef1a0 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x1d8>
  9ef030: 910143b5     	add	x21, x29, #0x50
  9ef034: aa1403e1     	mov	x1, x20
  9ef038: aa1503e0     	mov	x0, x21
  9ef03c: 94075ed8     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9ef040: aa1703e0     	mov	x0, x23
  9ef044: aa1503e1     	mov	x1, x21
  9ef048: 940763e9     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9ef04c: f9402ba1     	ldr	x1, [x29, #0x50]
  9ef050: f947ee62     	ldr	x2, [x19, #0xfd8]
  9ef054: d1006020     	sub	x0, x1, #0x18
  9ef058: eb02001f     	cmp	x0, x2
  9ef05c: 54000581     	b.ne	0x9ef10c <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x144>
  9ef060: f94002f4     	ldr	x20, [x23]
  9ef064: b85f8280     	ldur	w0, [x20, #-0x8]
  9ef068: 37f804a0     	tbnz	w0, #0x1f, 0x9ef0fc <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x134>
  9ef06c: aa1703e0     	mov	x0, x23
  9ef070: 94076894     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9ef074: f94002f4     	ldr	x20, [x23]
  9ef078: b85f8280     	ldur	w0, [x20, #-0x8]
  9ef07c: 37f80400     	tbnz	w0, #0x1f, 0x9ef0fc <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x134>
  9ef080: aa1703e0     	mov	x0, x23
  9ef084: 9407688f     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9ef088: f94002f6     	ldr	x22, [x23]
  9ef08c: b85f82c0     	ldur	w0, [x22, #-0x8]
  9ef090: f85e82d5     	ldur	x21, [x22, #-0x18]
  9ef094: 8b1502d5     	add	x21, x22, x21
  9ef098: 37f80080     	tbnz	w0, #0x1f, 0x9ef0a8 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0xe0>
  9ef09c: aa1703e0     	mov	x0, x23
  9ef0a0: 94076888     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9ef0a4: f94002f6     	ldr	x22, [x23]
  9ef0a8: eb15029f     	cmp	x20, x21
  9ef0ac: 54000120     	b.eq	0x9ef0d0 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x108>
  9ef0b0: cb1402b5     	sub	x21, x21, x20
  9ef0b4: d2800013     	mov	x19, #0x0               // =0
  9ef0b8: 38f36a80     	ldrsb	w0, [x20, x19]
  9ef0bc: 97e6af99     	bl	0x39af20 <tolower@plt>
  9ef0c0: 38336ac0     	strb	w0, [x22, x19]
  9ef0c4: 91000673     	add	x19, x19, #0x1
  9ef0c8: eb15027f     	cmp	x19, x21
  9ef0cc: 54ffff61     	b.ne	0x9ef0b8 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0xf0>
  9ef0d0: f940e718     	ldr	x24, [x24, #0x1c8]
  9ef0d4: aa1703e0     	mov	x0, x23
  9ef0d8: f9402fa2     	ldr	x2, [x29, #0x58]
  9ef0dc: f9400301     	ldr	x1, [x24]
  9ef0e0: eb01005f     	cmp	x2, x1
  9ef0e4: 54000361     	b.ne	0x9ef150 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x188>
  9ef0e8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ef0ec: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ef0f0: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ef0f4: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9ef0f8: d65f03c0     	ret
  9ef0fc: f85e8295     	ldur	x21, [x20, #-0x18]
  9ef100: aa1403f6     	mov	x22, x20
  9ef104: 8b150295     	add	x21, x20, x21
  9ef108: 17ffffe8     	b	0x9ef0a8 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0xe0>
  9ef10c: b0002aa2     	adrp	x2, 0xf44000
  9ef110: f9445042     	ldr	x2, [x2, #0x8a0]
  9ef114: b4000162     	cbz	x2, 0x9ef140 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x178>
  9ef118: d1002021     	sub	x1, x1, #0x8
  9ef11c: 885ffc22     	ldaxr	w2, [x1]
  9ef120: 51000443     	sub	w3, w2, #0x1
  9ef124: 8804fc23     	stlxr	w4, w3, [x1]
  9ef128: 35ffffa4     	cbnz	w4, 0x9ef11c <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x154>
  9ef12c: 6b1f005f     	cmp	w2, wzr
  9ef130: 54fff98c     	b.gt	0x9ef060 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x98>
  9ef134: 910123a1     	add	x1, x29, #0x48
  9ef138: 94076da1     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef13c: 17ffffc9     	b	0x9ef060 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x98>
  9ef140: b85f8022     	ldur	w2, [x1, #-0x8]
  9ef144: 51000443     	sub	w3, w2, #0x1
  9ef148: b81f8023     	stur	w3, [x1, #-0x8]
  9ef14c: 17fffff8     	b	0x9ef12c <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x164>
  9ef150: 97e6b094     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ef154: aa0003f4     	mov	x20, x0
  9ef158: f9402ba0     	ldr	x0, [x29, #0x50]
  9ef15c: f947ee61     	ldr	x1, [x19, #0xfd8]
  9ef160: d1006000     	sub	x0, x0, #0x18
  9ef164: eb01001f     	cmp	x0, x1
  9ef168: 54000060     	b.eq	0x9ef174 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x1ac>
  9ef16c: 910123a1     	add	x1, x29, #0x48
  9ef170: 97e6c0c4     	bl	0x39f480 <.text+0x3170>
  9ef174: f94002e0     	ldr	x0, [x23]
  9ef178: f947ee73     	ldr	x19, [x19, #0xfd8]
  9ef17c: d1006000     	sub	x0, x0, #0x18
  9ef180: eb13001f     	cmp	x0, x19
  9ef184: 54000060     	b.eq	0x9ef190 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x1c8>
  9ef188: 910123a1     	add	x1, x29, #0x48
  9ef18c: 97e6c0bd     	bl	0x39f480 <.text+0x3170>
  9ef190: aa1403e0     	mov	x0, x20
  9ef194: 9407cf53     	bl	0xbe2ee0 <_Unwind_Resume>
  9ef198: aa0003f4     	mov	x20, x0
  9ef19c: 17fffff6     	b	0x9ef174 <_ZNK7cocos2d9FileUtils16getFileExtensionERKSs+0x1ac>
  9ef1a0: b0000fa0     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9ef1a4: b0000fa1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9ef1a8: 912f0000     	add	x0, x0, #0xbc0
  9ef1ac: 912fe021     	add	x1, x1, #0xbf8
  9ef1b0: 940758ba     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>

00000000009ef1b4 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj>:
  9ef1b4: a9b67bfd     	stp	x29, x30, [sp, #-0xa0]!
  9ef1b8: d0001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9ef1bc: 910003fd     	mov	x29, sp
  9ef1c0: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9ef1c4: b0002a9a     	adrp	x26, 0xf40000
  9ef1c8: aa0303f9     	mov	x25, x3
  9ef1cc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ef1d0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ef1d4: f940e746     	ldr	x6, [x26, #0x1c8]
  9ef1d8: 9101e3b4     	add	x20, x29, #0x78
  9ef1dc: 910243b8     	add	x24, x29, #0x90
  9ef1e0: 9107a021     	add	x1, x1, #0x1e8
  9ef1e4: a90573fb     	stp	x27, x28, [sp, #0x50]
  9ef1e8: f94000c3     	ldr	x3, [x6]
  9ef1ec: aa0003f7     	mov	x23, x0
  9ef1f0: aa0203fc     	mov	x28, x2
  9ef1f4: aa1403e0     	mov	x0, x20
  9ef1f8: aa1803e2     	mov	x2, x24
  9ef1fc: 2a0403fb     	mov	w27, w4
  9ef200: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ef204: f90037a5     	str	x5, [x29, #0x68]
  9ef208: d0002ad6     	adrp	x22, 0xf49000
  9ef20c: f9004fa3     	str	x3, [x29, #0x98]
  9ef210: 94075f70     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ef214: f9403fa0     	ldr	x0, [x29, #0x78]
  9ef218: d2800013     	mov	x19, #0x0               // =0
  9ef21c: f947eec1     	ldr	x1, [x22, #0xfd8]
  9ef220: 528005f5     	mov	w21, #0x2f              // =47
  9ef224: f85e8002     	ldur	x2, [x0, #-0x18]
  9ef228: 91006021     	add	x1, x1, #0x18
  9ef22c: f90043a1     	str	x1, [x29, #0x80]
  9ef230: b50000c2     	cbnz	x2, 0x9ef248 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x94>
  9ef234: 1400001a     	b	0x9ef29c <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0xe8>
  9ef238: f85e8001     	ldur	x1, [x0, #-0x18]
  9ef23c: 91000673     	add	x19, x19, #0x1
  9ef240: eb01027f     	cmp	x19, x1
  9ef244: 540002c2     	b.hs	0x9ef29c <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0xe8>
  9ef248: b85f8000     	ldur	w0, [x0, #-0x8]
  9ef24c: 37f80060     	tbnz	w0, #0x1f, 0x9ef258 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0xa4>
  9ef250: aa1403e0     	mov	x0, x20
  9ef254: 9407681b     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9ef258: f9400280     	ldr	x0, [x20]
  9ef25c: 8b130002     	add	x2, x0, x19
  9ef260: 38f36801     	ldrsb	w1, [x0, x19]
  9ef264: 7101703f     	cmp	w1, #0x5c
  9ef268: 54fffe81     	b.ne	0x9ef238 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x84>
  9ef26c: b85f8000     	ldur	w0, [x0, #-0x8]
  9ef270: 37f800a0     	tbnz	w0, #0x1f, 0x9ef284 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0xd0>
  9ef274: aa1403e0     	mov	x0, x20
  9ef278: 94076812     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9ef27c: f9400282     	ldr	x2, [x20]
  9ef280: 8b130042     	add	x2, x2, x19
  9ef284: 39000055     	strb	w21, [x2]
  9ef288: 91000673     	add	x19, x19, #0x1
  9ef28c: f9400280     	ldr	x0, [x20]
  9ef290: f85e8001     	ldur	x1, [x0, #-0x18]
  9ef294: eb01027f     	cmp	x19, x1
  9ef298: 54fffd83     	b.lo	0x9ef248 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x94>
  9ef29c: 910203b3     	add	x19, x29, #0x80
  9ef2a0: aa1403e1     	mov	x1, x20
  9ef2a4: aa1303e0     	mov	x0, x19
  9ef2a8: 94076e06     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9ef2ac: d00013a1     	adrp	x1, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9ef2b0: aa1403e0     	mov	x0, x20
  9ef2b4: 913d4021     	add	x1, x1, #0xf50
  9ef2b8: 92800002     	mov	x2, #-0x1               // =-1
  9ef2bc: d2800023     	mov	x3, #0x1                // =1
  9ef2c0: 9407642d     	bl	0xbc8374 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49d4c>
  9ef2c4: b100041f     	cmn	x0, #0x1
  9ef2c8: 54000260     	b.eq	0x9ef314 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x160>
  9ef2cc: 91000402     	add	x2, x0, #0x1
  9ef2d0: f9403fa0     	ldr	x0, [x29, #0x78]
  9ef2d4: f85e8003     	ldur	x3, [x0, #-0x18]
  9ef2d8: eb03005f     	cmp	x2, x3
  9ef2dc: 540012e8     	b.hi	0x9ef538 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x384>
  9ef2e0: 910223b5     	add	x21, x29, #0x88
  9ef2e4: aa1403e1     	mov	x1, x20
  9ef2e8: aa1503e0     	mov	x0, x21
  9ef2ec: 92800003     	mov	x3, #-0x1               // =-1
  9ef2f0: 94075e2b     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9ef2f4: aa1303e0     	mov	x0, x19
  9ef2f8: aa1503e1     	mov	x1, x21
  9ef2fc: 9407633c     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9ef300: f94047a1     	ldr	x1, [x29, #0x88]
  9ef304: f947eec2     	ldr	x2, [x22, #0xfd8]
  9ef308: d1006020     	sub	x0, x1, #0x18
  9ef30c: eb02001f     	cmp	x0, x2
  9ef310: 54000c01     	b.ne	0x9ef490 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2dc>
  9ef314: 90001121     	adrp	x1, 0xc13000 <_ZTSSt5_BindIFSt7_Mem_fnIM6GLNodeFvRKN7cocos2d4Mat4EjEEPS1_S3_jEE+0x1120>
  9ef318: aa1303e0     	mov	x0, x19
  9ef31c: 910fc021     	add	x1, x1, #0x3f0
  9ef320: 92800002     	mov	x2, #-0x1               // =-1
  9ef324: d2800023     	mov	x3, #0x1                // =1
  9ef328: 94076413     	bl	0xbc8374 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49d4c>
  9ef32c: b100041f     	cmn	x0, #0x1
  9ef330: aa0003e3     	mov	x3, x0
  9ef334: 540001a0     	b.eq	0x9ef368 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x1b4>
  9ef338: aa1803e0     	mov	x0, x24
  9ef33c: aa1303e1     	mov	x1, x19
  9ef340: d2800002     	mov	x2, #0x0                // =0
  9ef344: 94075e16     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9ef348: aa1303e0     	mov	x0, x19
  9ef34c: aa1803e1     	mov	x1, x24
  9ef350: 94076327     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9ef354: f9404ba1     	ldr	x1, [x29, #0x90]
  9ef358: f947eec2     	ldr	x2, [x22, #0xfd8]
  9ef35c: d1006020     	sub	x0, x1, #0x18
  9ef360: eb02001f     	cmp	x0, x2
  9ef364: 54000b01     	b.ne	0x9ef4c4 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x310>
  9ef368: f94043a1     	ldr	x1, [x29, #0x80]
  9ef36c: f90033a1     	str	x1, [x29, #0x60]
  9ef370: aa0103e0     	mov	x0, x1
  9ef374: 97e6afc7     	bl	0x39b290 <strlen@plt>
  9ef378: aa0003f3     	mov	x19, x0
  9ef37c: f94002e5     	ldr	x5, [x23]
  9ef380: aa1703e0     	mov	x0, x23
  9ef384: f94033a1     	ldr	x1, [x29, #0x60]
  9ef388: 2a1303e2     	mov	w2, w19
  9ef38c: aa1c03e3     	mov	x3, x28
  9ef390: aa1903e4     	mov	x4, x25
  9ef394: f940c4a6     	ldr	x6, [x5, #0x188]
  9ef398: 2a1b03e5     	mov	w5, w27
  9ef39c: d63f00c0     	blr	x6
  9ef3a0: f94002e6     	ldr	x6, [x23]
  9ef3a4: aa0003e1     	mov	x1, x0
  9ef3a8: b9400322     	ldr	w2, [x25]
  9ef3ac: aa1703e0     	mov	x0, x23
  9ef3b0: f94043a3     	ldr	x3, [x29, #0x80]
  9ef3b4: 2a1303e4     	mov	w4, w19
  9ef3b8: f94037a5     	ldr	x5, [x29, #0x68]
  9ef3bc: f940c0c6     	ldr	x6, [x6, #0x180]
  9ef3c0: d63f00c0     	blr	x6
  9ef3c4: f94043a1     	ldr	x1, [x29, #0x80]
  9ef3c8: aa0003f5     	mov	x21, x0
  9ef3cc: f947eec2     	ldr	x2, [x22, #0xfd8]
  9ef3d0: d1006020     	sub	x0, x1, #0x18
  9ef3d4: eb02001f     	cmp	x0, x2
  9ef3d8: 54000261     	b.ne	0x9ef424 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x270>
  9ef3dc: f9403fb3     	ldr	x19, [x29, #0x78]
  9ef3e0: f947eed6     	ldr	x22, [x22, #0xfd8]
  9ef3e4: d1006274     	sub	x20, x19, #0x18
  9ef3e8: eb16029f     	cmp	x20, x22
  9ef3ec: 54000361     	b.ne	0x9ef458 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2a4>
  9ef3f0: f940e741     	ldr	x1, [x26, #0x1c8]
  9ef3f4: aa1503e0     	mov	x0, x21
  9ef3f8: f9404fa2     	ldr	x2, [x29, #0x98]
  9ef3fc: f9400021     	ldr	x1, [x1]
  9ef400: eb01005f     	cmp	x2, x1
  9ef404: 54000c61     	b.ne	0x9ef590 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x3dc>
  9ef408: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ef40c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ef410: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ef414: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9ef418: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9ef41c: a8ca7bfd     	ldp	x29, x30, [sp], #0xa0
  9ef420: d65f03c0     	ret
  9ef424: b0002aa2     	adrp	x2, 0xf44000
  9ef428: f9445042     	ldr	x2, [x2, #0x8a0]
  9ef42c: b4000662     	cbz	x2, 0x9ef4f8 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x344>
  9ef430: d1002021     	sub	x1, x1, #0x8
  9ef434: 885ffc22     	ldaxr	w2, [x1]
  9ef438: 51000443     	sub	w3, w2, #0x1
  9ef43c: 8804fc23     	stlxr	w4, w3, [x1]
  9ef440: 35ffffa4     	cbnz	w4, 0x9ef434 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x280>
  9ef444: 6b1f005f     	cmp	w2, wzr
  9ef448: 54fffcac     	b.gt	0x9ef3dc <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x228>
  9ef44c: aa1803e1     	mov	x1, x24
  9ef450: 94076cdb     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef454: 17ffffe2     	b	0x9ef3dc <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x228>
  9ef458: b0002aa0     	adrp	x0, 0xf44000
  9ef45c: f9445000     	ldr	x0, [x0, #0x8a0]
  9ef460: b4000540     	cbz	x0, 0x9ef508 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x354>
  9ef464: d1002273     	sub	x19, x19, #0x8
  9ef468: 885ffe60     	ldaxr	w0, [x19]
  9ef46c: 51000401     	sub	w1, w0, #0x1
  9ef470: 8802fe61     	stlxr	w2, w1, [x19]
  9ef474: 35ffffa2     	cbnz	w2, 0x9ef468 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2b4>
  9ef478: 6b1f001f     	cmp	w0, wzr
  9ef47c: 54fffbac     	b.gt	0x9ef3f0 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x23c>
  9ef480: aa1403e0     	mov	x0, x20
  9ef484: aa1803e1     	mov	x1, x24
  9ef488: 94076ccd     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef48c: 17ffffd9     	b	0x9ef3f0 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x23c>
  9ef490: b0002aa2     	adrp	x2, 0xf44000
  9ef494: f9445042     	ldr	x2, [x2, #0x8a0]
  9ef498: b4000402     	cbz	x2, 0x9ef518 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x364>
  9ef49c: d1002021     	sub	x1, x1, #0x8
  9ef4a0: 885ffc22     	ldaxr	w2, [x1]
  9ef4a4: 51000443     	sub	w3, w2, #0x1
  9ef4a8: 8804fc23     	stlxr	w4, w3, [x1]
  9ef4ac: 35ffffa4     	cbnz	w4, 0x9ef4a0 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2ec>
  9ef4b0: 6b1f005f     	cmp	w2, wzr
  9ef4b4: 54fff30c     	b.gt	0x9ef314 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x160>
  9ef4b8: aa1803e1     	mov	x1, x24
  9ef4bc: 94076cc0     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef4c0: 17ffff95     	b	0x9ef314 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x160>
  9ef4c4: b0002aa2     	adrp	x2, 0xf44000
  9ef4c8: f9445042     	ldr	x2, [x2, #0x8a0]
  9ef4cc: b40002e2     	cbz	x2, 0x9ef528 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x374>
  9ef4d0: d1002021     	sub	x1, x1, #0x8
  9ef4d4: 885ffc22     	ldaxr	w2, [x1]
  9ef4d8: 51000443     	sub	w3, w2, #0x1
  9ef4dc: 8804fc23     	stlxr	w4, w3, [x1]
  9ef4e0: 35ffffa4     	cbnz	w4, 0x9ef4d4 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x320>
  9ef4e4: 6b1f005f     	cmp	w2, wzr
  9ef4e8: 54fff40c     	b.gt	0x9ef368 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x1b4>
  9ef4ec: 910223a1     	add	x1, x29, #0x88
  9ef4f0: 94076cb3     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef4f4: 17ffff9d     	b	0x9ef368 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x1b4>
  9ef4f8: b85f8022     	ldur	w2, [x1, #-0x8]
  9ef4fc: 51000443     	sub	w3, w2, #0x1
  9ef500: b81f8023     	stur	w3, [x1, #-0x8]
  9ef504: 17ffffd0     	b	0x9ef444 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x290>
  9ef508: b85f8260     	ldur	w0, [x19, #-0x8]
  9ef50c: 51000401     	sub	w1, w0, #0x1
  9ef510: b81f8261     	stur	w1, [x19, #-0x8]
  9ef514: 17ffffd9     	b	0x9ef478 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2c4>
  9ef518: b85f8022     	ldur	w2, [x1, #-0x8]
  9ef51c: 51000443     	sub	w3, w2, #0x1
  9ef520: b81f8023     	stur	w3, [x1, #-0x8]
  9ef524: 17ffffe3     	b	0x9ef4b0 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x2fc>
  9ef528: b85f8022     	ldur	w2, [x1, #-0x8]
  9ef52c: 51000443     	sub	w3, w2, #0x1
  9ef530: b81f8023     	stur	w3, [x1, #-0x8]
  9ef534: 17ffffec     	b	0x9ef4e4 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x330>
  9ef538: b0000fa0     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9ef53c: b0000fa1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9ef540: 912f0000     	add	x0, x0, #0xbc0
  9ef544: 912fe021     	add	x1, x1, #0xbf8
  9ef548: 940757d4     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>
  9ef54c: aa0003f3     	mov	x19, x0
  9ef550: f94043a0     	ldr	x0, [x29, #0x80]
  9ef554: f947eec1     	ldr	x1, [x22, #0xfd8]
  9ef558: d1006000     	sub	x0, x0, #0x18
  9ef55c: eb01001f     	cmp	x0, x1
  9ef560: 54000060     	b.eq	0x9ef56c <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x3b8>
  9ef564: 9101c3a1     	add	x1, x29, #0x70
  9ef568: 97e6bfc6     	bl	0x39f480 <.text+0x3170>
  9ef56c: f9403fa0     	ldr	x0, [x29, #0x78]
  9ef570: f947eed6     	ldr	x22, [x22, #0xfd8]
  9ef574: d1006000     	sub	x0, x0, #0x18
  9ef578: eb16001f     	cmp	x0, x22
  9ef57c: 54000060     	b.eq	0x9ef588 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x3d4>
  9ef580: 910203a1     	add	x1, x29, #0x80
  9ef584: 97e6bfbf     	bl	0x39f480 <.text+0x3170>
  9ef588: aa1303e0     	mov	x0, x19
  9ef58c: 9407ce55     	bl	0xbe2ee0 <_Unwind_Resume>
  9ef590: 97e6af84     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9ef594: aa0003f3     	mov	x19, x0
  9ef598: f94047a0     	ldr	x0, [x29, #0x88]
  9ef59c: f947eec1     	ldr	x1, [x22, #0xfd8]
  9ef5a0: d1006000     	sub	x0, x0, #0x18
  9ef5a4: eb01001f     	cmp	x0, x1
  9ef5a8: 54fffd40     	b.eq	0x9ef550 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x39c>
  9ef5ac: aa1803e1     	mov	x1, x24
  9ef5b0: 97e6bfb4     	bl	0x39f480 <.text+0x3170>
  9ef5b4: 17ffffe7     	b	0x9ef550 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x39c>
  9ef5b8: aa0003f3     	mov	x19, x0
  9ef5bc: f9404ba0     	ldr	x0, [x29, #0x90]
  9ef5c0: f947eec1     	ldr	x1, [x22, #0xfd8]
  9ef5c4: d1006000     	sub	x0, x0, #0x18
  9ef5c8: eb01001f     	cmp	x0, x1
  9ef5cc: 54fffc20     	b.eq	0x9ef550 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x39c>
  9ef5d0: 910223a1     	add	x1, x29, #0x88
  9ef5d4: 97e6bfab     	bl	0x39f480 <.text+0x3170>
  9ef5d8: 17ffffde     	b	0x9ef550 <_ZN7cocos2d9FileUtils14getFileNameExtEPKcPhRiiPj+0x39c>

00000000009ef5dc <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj>:
  9ef5dc: a9ae7bfd     	stp	x29, x30, [sp, #-0x120]!
  9ef5e0: 910003fd     	mov	x29, sp
  9ef5e4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9ef5e8: b0002a93     	adrp	x19, 0xf40000
  9ef5ec: 910263b4     	add	x20, x29, #0x98
  9ef5f0: a90573fb     	stp	x27, x28, [sp, #0x50]
  9ef5f4: aa0103fc     	mov	x28, x1
  9ef5f8: aa0303e1     	mov	x1, x3
  9ef5fc: f940e663     	ldr	x3, [x19, #0x1c8]
  9ef600: a90363f7     	stp	x23, x24, [sp, #0x30]
  9ef604: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9ef608: f9400063     	ldr	x3, [x3]
  9ef60c: 910243b7     	add	x23, x29, #0x90
  9ef610: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9ef614: aa1703e0     	mov	x0, x23
  9ef618: 2a0203fa     	mov	w26, w2
  9ef61c: b90000bf     	str	wzr, [x5]
  9ef620: 9101e3a2     	add	x2, x29, #0x78
  9ef624: f90037a5     	str	x5, [x29, #0x68]
  9ef628: f9008fa3     	str	x3, [x29, #0x118]
  9ef62c: 94075e69     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9ef630: aa1403e0     	mov	x0, x20
  9ef634: aa1703e1     	mov	x1, x23
  9ef638: 97e71f4e     	bl	0x3b7370 <_ZN6MYHASHC2ERKSs>
  9ef63c: 910223a8     	add	x8, x29, #0x88
  9ef640: aa1403e0     	mov	x0, x20
  9ef644: 97e71faa     	bl	0x3b74ec <_ZN6MYHASH5toStrEv>
  9ef648: d0002ad4     	adrp	x20, 0xf49000
  9ef64c: f9404ba1     	ldr	x1, [x29, #0x90]
  9ef650: d1006020     	sub	x0, x1, #0x18
  9ef654: f947ee82     	ldr	x2, [x20, #0xfd8]
  9ef658: eb02001f     	cmp	x0, x2
  9ef65c: 54001801     	b.ne	0x9ef95c <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x380>
  9ef660: f94047b5     	ldr	x21, [x29, #0x88]
  9ef664: 53027f5b     	lsr	w27, w26, #2
  9ef668: aa1503e0     	mov	x0, x21
  9ef66c: 97e6af09     	bl	0x39b290 <strlen@plt>
  9ef670: aa0003f9     	mov	x25, x0
  9ef674: d2800200     	mov	x0, #0x10               // =16
  9ef678: 92407f36     	and	x22, x25, #0xffffffff
  9ef67c: 97e6af59     	bl	0x39b3e0 <malloc@plt>
  9ef680: aa0003f8     	mov	x24, x0
  9ef684: aa1503e1     	mov	x1, x21
  9ef688: aa1603e2     	mov	x2, x22
  9ef68c: 97e6acf5     	bl	0x39aa60 <memcpy@plt>
  9ef690: 52800202     	mov	w2, #0x10               // =16
  9ef694: 8b160300     	add	x0, x24, x22
  9ef698: 52800001     	mov	w1, #0x0                // =0
  9ef69c: 4b190042     	sub	w2, w2, w25
  9ef6a0: 97e6ae24     	bl	0x39af30 <memset@plt>
  9ef6a4: 12000740     	and	w0, w26, #0x3
  9ef6a8: 34001440     	cbz	w0, 0x9ef930 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x354>
  9ef6ac: 1100077b     	add	w27, w27, #0x1
  9ef6b0: 531e7762     	lsl	w2, w27, #2
  9ef6b4: f90033a2     	str	x2, [x29, #0x60]
  9ef6b8: aa0203e0     	mov	x0, x2
  9ef6bc: aa0203f6     	mov	x22, x2
  9ef6c0: 97e6af48     	bl	0x39b3e0 <malloc@plt>
  9ef6c4: aa0003f9     	mov	x25, x0
  9ef6c8: f94033a2     	ldr	x2, [x29, #0x60]
  9ef6cc: 52800001     	mov	w1, #0x0                // =0
  9ef6d0: 97e6ae18     	bl	0x39af30 <memset@plt>
  9ef6d4: d2800000     	mov	x0, #0x0                // =0
  9ef6d8: 53027c02     	lsr	w2, w0, #2
  9ef6dc: 38606b81     	ldrb	w1, [x28, x0]
  9ef6e0: 531d0403     	ubfiz	w3, w0, #3, #2
  9ef6e4: 91000400     	add	x0, x0, #0x1
  9ef6e8: 1ac32021     	lsl	w1, w1, w3
  9ef6ec: 6b00035f     	cmp	w26, w0
  9ef6f0: b8625b23     	ldr	w3, [x25, w2, uxtw #2]
  9ef6f4: 2a010061     	orr	w1, w3, w1
  9ef6f8: b8225b21     	str	w1, [x25, w2, uxtw #2]
  9ef6fc: 54fffee8     	b.hi	0x9ef6d8 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0xfc>
  9ef700: d2800200     	mov	x0, #0x10               // =16
  9ef704: 97e6af37     	bl	0x39b3e0 <malloc@plt>
  9ef708: aa0003fa     	mov	x26, x0
  9ef70c: a9007c1f     	stp	xzr, xzr, [x0]
  9ef710: 39402304     	ldrb	w4, [x24, #0x8]
  9ef714: 7100076b     	subs	w11, w27, #0x1
  9ef718: b9400b41     	ldr	w1, [x26, #0x8]
  9ef71c: aa1903ea     	mov	x10, x25
  9ef720: 39400700     	ldrb	w0, [x24, #0x1]
  9ef724: b9400f42     	ldr	w2, [x26, #0xc]
  9ef728: 2a010084     	orr	w4, w4, w1
  9ef72c: 39402703     	ldrb	w3, [x24, #0x9]
  9ef730: 39403309     	ldrb	w9, [x24, #0xc]
  9ef734: 39403701     	ldrb	w1, [x24, #0xd]
  9ef738: 39400308     	ldrb	w8, [x24]
  9ef73c: 2a020122     	orr	w2, w9, w2
  9ef740: 39401707     	ldrb	w7, [x24, #0x5]
  9ef744: 2a032084     	orr	w4, w4, w3, lsl #8
  9ef748: 39400b05     	ldrb	w5, [x24, #0x2]
  9ef74c: 2a012042     	orr	w2, w2, w1, lsl #8
  9ef750: 39401b03     	ldrb	w3, [x24, #0x6]
  9ef754: 2a002108     	orr	w8, w8, w0, lsl #8
  9ef758: 39402b01     	ldrb	w1, [x24, #0xa]
  9ef75c: 39403b00     	ldrb	w0, [x24, #0xe]
  9ef760: 2a054108     	orr	w8, w8, w5, lsl #16
  9ef764: 39401309     	ldrb	w9, [x24, #0x4]
  9ef768: 2a014084     	orr	w4, w4, w1, lsl #16
  9ef76c: 39400f05     	ldrb	w5, [x24, #0x3]
  9ef770: 2a072127     	orr	w7, w9, w7, lsl #8
  9ef774: 2a004042     	orr	w2, w2, w0, lsl #16
  9ef778: 2a0340e7     	orr	w7, w7, w3, lsl #16
  9ef77c: 39402f01     	ldrb	w1, [x24, #0xb]
  9ef780: 39401f03     	ldrb	w3, [x24, #0x7]
  9ef784: 2a056105     	orr	w5, w8, w5, lsl #24
  9ef788: 39403f00     	ldrb	w0, [x24, #0xf]
  9ef78c: 2a016081     	orr	w1, w4, w1, lsl #24
  9ef790: b9000345     	str	w5, [x26]
  9ef794: 2a0360e3     	orr	w3, w7, w3, lsl #24
  9ef798: b9000b41     	str	w1, [x26, #0x8]
  9ef79c: 2a006040     	orr	w0, w2, w0, lsl #24
  9ef7a0: b9000743     	str	w3, [x26, #0x4]
  9ef7a4: b9000f40     	str	w0, [x26, #0xc]
  9ef7a8: b9400321     	ldr	w1, [x25]
  9ef7ac: 54000620     	b.eq	0x9ef870 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x294>
  9ef7b0: 52800680     	mov	w0, #0x34               // =52
  9ef7b4: 528d19c9     	mov	w9, #0x68ce             // =26830
  9ef7b8: 72afe749     	movk	w9, #0x7f3a, lsl #16
  9ef7bc: 8b2b4b2a     	add	x10, x25, w11, uxtw #2
  9ef7c0: 1adb0804     	udiv	w4, w0, w27
  9ef7c4: 1100189b     	add	w27, w4, #0x6
  9ef7c8: 1b097f69     	mul	w9, w27, w9
  9ef7cc: 34000529     	cbz	w9, 0x9ef870 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x294>
  9ef7d0: 53027d2c     	lsr	w12, w9, #2
  9ef7d4: 2a0b03e2     	mov	w2, w11
  9ef7d8: 51000445     	sub	w5, w2, #0x1
  9ef7dc: 4a0c0044     	eor	w4, w2, w12
  9ef7e0: 12000484     	and	w4, w4, #0x3
  9ef7e4: 53037c23     	lsr	w3, w1, #3
  9ef7e8: 531e7428     	lsl	w8, w1, #2
  9ef7ec: 4a090021     	eor	w1, w1, w9
  9ef7f0: b8655b20     	ldr	w0, [x25, w5, uxtw #2]
  9ef7f4: b8645b44     	ldr	w4, [x26, w4, uxtw #2]
  9ef7f8: b8625b27     	ldr	w7, [x25, w2, uxtw #2]
  9ef7fc: 4a040004     	eor	w4, w0, w4
  9ef800: 4a001063     	eor	w3, w3, w0, lsl #4
  9ef804: 4a401500     	eor	w0, w8, w0, lsr #5
  9ef808: 0b010081     	add	w1, w4, w1
  9ef80c: 0b000060     	add	w0, w3, w0
  9ef810: 4a000021     	eor	w1, w1, w0
  9ef814: 4b0100e1     	sub	w1, w7, w1
  9ef818: b8225b21     	str	w1, [x25, w2, uxtw #2]
  9ef81c: 2a0503e2     	mov	w2, w5
  9ef820: 35fffdc5     	cbnz	w5, 0x9ef7d8 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x1fc>
  9ef824: 1200058c     	and	w12, w12, #0x3
  9ef828: b9400144     	ldr	w4, [x10]
  9ef82c: 4a090027     	eor	w7, w1, w9
  9ef830: b9400325     	ldr	w5, [x25]
  9ef834: 531c6c83     	lsl	w3, w4, #4
  9ef838: 53057c82     	lsr	w2, w4, #5
  9ef83c: b86c5b40     	ldr	w0, [x26, w12, uxtw #2]
  9ef840: 4a410c63     	eor	w3, w3, w1, lsr #3
  9ef844: 4a010841     	eor	w1, w2, w1, lsl #2
  9ef848: 5292e64c     	mov	w12, #0x9732            // =38706
  9ef84c: 4a000080     	eor	w0, w4, w0
  9ef850: 0b010061     	add	w1, w3, w1
  9ef854: 0b0000e0     	add	w0, w7, w0
  9ef858: 72b018ac     	movk	w12, #0x80c5, lsl #16
  9ef85c: 4a000021     	eor	w1, w1, w0
  9ef860: 2b0c0129     	adds	w9, w9, w12
  9ef864: 4b0100a1     	sub	w1, w5, w1
  9ef868: b9000321     	str	w1, [x25]
  9ef86c: 54fffb21     	b.ne	0x9ef7d0 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x1f4>
  9ef870: b940015b     	ldr	w27, [x10]
  9ef874: 51001ec0     	sub	w0, w22, #0x7
  9ef878: d280001c     	mov	x28, #0x0               // =0
  9ef87c: 6b00037f     	cmp	w27, w0
  9ef880: 54000083     	b.lo	0x9ef890 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x2b4>
  9ef884: 510012d6     	sub	w22, w22, #0x4
  9ef888: 6b16037f     	cmp	w27, w22
  9ef88c: 54000309     	b.ls	0x9ef8ec <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x310>
  9ef890: aa1903e0     	mov	x0, x25
  9ef894: 97e6b187     	bl	0x39beb0 <free@plt>
  9ef898: aa1a03e0     	mov	x0, x26
  9ef89c: 97e6b185     	bl	0x39beb0 <free@plt>
  9ef8a0: aa1803e0     	mov	x0, x24
  9ef8a4: 97e6b183     	bl	0x39beb0 <free@plt>
  9ef8a8: f947ee94     	ldr	x20, [x20, #0xfd8]
  9ef8ac: d10062a0     	sub	x0, x21, #0x18
  9ef8b0: eb14001f     	cmp	x0, x20
  9ef8b4: 540006e1     	b.ne	0x9ef990 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3b4>
  9ef8b8: f940e673     	ldr	x19, [x19, #0x1c8]
  9ef8bc: aa1c03e0     	mov	x0, x28
  9ef8c0: f9408fa2     	ldr	x2, [x29, #0x118]
  9ef8c4: f9400261     	ldr	x1, [x19]
  9ef8c8: eb01005f     	cmp	x2, x1
  9ef8cc: 54000a21     	b.ne	0x9efa10 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x434>
  9ef8d0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9ef8d4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9ef8d8: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9ef8dc: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9ef8e0: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9ef8e4: a8d27bfd     	ldp	x29, x30, [sp], #0x120
  9ef8e8: d65f03c0     	ret
  9ef8ec: 11000760     	add	w0, w27, #0x1
  9ef8f0: 97e6aebc     	bl	0x39b3e0 <malloc@plt>
  9ef8f4: aa0003fc     	mov	x28, x0
  9ef8f8: d2800000     	mov	x0, #0x0                // =0
  9ef8fc: 3400013b     	cbz	w27, 0x9ef920 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x344>
  9ef900: 53027c01     	lsr	w1, w0, #2
  9ef904: 531d0402     	ubfiz	w2, w0, #3, #2
  9ef908: b8615b21     	ldr	w1, [x25, w1, uxtw #2]
  9ef90c: 1ac22421     	lsr	w1, w1, w2
  9ef910: 38206b81     	strb	w1, [x28, x0]
  9ef914: 91000400     	add	x0, x0, #0x1
  9ef918: 6b00037f     	cmp	w27, w0
  9ef91c: 54ffff28     	b.hi	0x9ef900 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x324>
  9ef920: f94037a0     	ldr	x0, [x29, #0x68]
  9ef924: 383b4b9f     	strb	wzr, [x28, w27, uxtw]
  9ef928: b900001b     	str	w27, [x0]
  9ef92c: 17ffffd9     	b	0x9ef890 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x2b4>
  9ef930: 531e7762     	lsl	w2, w27, #2
  9ef934: f90033a2     	str	x2, [x29, #0x60]
  9ef938: aa0203e0     	mov	x0, x2
  9ef93c: aa0203f6     	mov	x22, x2
  9ef940: 97e6aea8     	bl	0x39b3e0 <malloc@plt>
  9ef944: aa0003f9     	mov	x25, x0
  9ef948: f94033a2     	ldr	x2, [x29, #0x60]
  9ef94c: 52800001     	mov	w1, #0x0                // =0
  9ef950: 97e6ad78     	bl	0x39af30 <memset@plt>
  9ef954: 35ffec1a     	cbnz	w26, 0x9ef6d4 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0xf8>
  9ef958: 17ffff6a     	b	0x9ef700 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x124>
  9ef95c: b0002aa2     	adrp	x2, 0xf44000
  9ef960: f9445042     	ldr	x2, [x2, #0x8a0]
  9ef964: b4000382     	cbz	x2, 0x9ef9d4 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3f8>
  9ef968: d1002021     	sub	x1, x1, #0x8
  9ef96c: 885ffc22     	ldaxr	w2, [x1]
  9ef970: 51000443     	sub	w3, w2, #0x1
  9ef974: 8804fc23     	stlxr	w4, w3, [x1]
  9ef978: 35ffffa4     	cbnz	w4, 0x9ef96c <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x390>
  9ef97c: 6b1f005f     	cmp	w2, wzr
  9ef980: 54ffe70c     	b.gt	0x9ef660 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x84>
  9ef984: 910203a1     	add	x1, x29, #0x80
  9ef988: 94076b8d     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef98c: 17ffff35     	b	0x9ef660 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x84>
  9ef990: b0002aa1     	adrp	x1, 0xf44000
  9ef994: f9445021     	ldr	x1, [x1, #0x8a0]
  9ef998: b4000161     	cbz	x1, 0x9ef9c4 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3e8>
  9ef99c: d10022b5     	sub	x21, x21, #0x8
  9ef9a0: 885ffea1     	ldaxr	w1, [x21]
  9ef9a4: 51000422     	sub	w2, w1, #0x1
  9ef9a8: 8803fea2     	stlxr	w3, w2, [x21]
  9ef9ac: 35ffffa3     	cbnz	w3, 0x9ef9a0 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3c4>
  9ef9b0: 6b1f003f     	cmp	w1, wzr
  9ef9b4: 54fff82c     	b.gt	0x9ef8b8 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x2dc>
  9ef9b8: aa1703e1     	mov	x1, x23
  9ef9bc: 94076b80     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9ef9c0: 17ffffbe     	b	0x9ef8b8 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x2dc>
  9ef9c4: b85f82a1     	ldur	w1, [x21, #-0x8]
  9ef9c8: 51000422     	sub	w2, w1, #0x1
  9ef9cc: b81f82a2     	stur	w2, [x21, #-0x8]
  9ef9d0: 17fffff8     	b	0x9ef9b0 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3d4>
  9ef9d4: b85f8022     	ldur	w2, [x1, #-0x8]
  9ef9d8: 51000443     	sub	w3, w2, #0x1
  9ef9dc: b81f8023     	stur	w3, [x1, #-0x8]
  9ef9e0: 17ffffe7     	b	0x9ef97c <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x3a0>
  9ef9e4: d0002ac1     	adrp	x1, 0xf49000
  9ef9e8: aa0003f3     	mov	x19, x0
  9ef9ec: f9404ba0     	ldr	x0, [x29, #0x90]
  9ef9f0: f947ec21     	ldr	x1, [x1, #0xfd8]
  9ef9f4: d1006000     	sub	x0, x0, #0x18
  9ef9f8: eb01001f     	cmp	x0, x1
  9ef9fc: 54000060     	b.eq	0x9efa08 <_ZN7cocos2d9FileUtils12isFileExist_EPhjPKcjPj+0x42c>
  9efa00: 910203a1     	add	x1, x29, #0x80
  9efa04: 97e6be9f     	bl	0x39f480 <.text+0x3170>
  9efa08: aa1303e0     	mov	x0, x19
  9efa0c: 9407cd35     	bl	0xbe2ee0 <_Unwind_Resume>
  9efa10: 97e6ae64     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009efa14 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE>:
  9efa14: a9af7bfd     	stp	x29, x30, [sp, #-0x110]!
  9efa18: 910003fd     	mov	x29, sp
  9efa1c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9efa20: b0002a93     	adrp	x19, 0xf40000
  9efa24: f9400020     	ldr	x0, [x1]
  9efa28: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9efa2c: aa0203f6     	mov	x22, x2
  9efa30: f90023f9     	str	x25, [sp, #0x40]
  9efa34: f940e662     	ldr	x2, [x19, #0x1c8]
  9efa38: 52800034     	mov	w20, #0x1               // =1
  9efa3c: f85e8000     	ldur	x0, [x0, #-0x18]
  9efa40: a90363f7     	stp	x23, x24, [sp, #0x30]
  9efa44: f9400042     	ldr	x2, [x2]
  9efa48: f90087a2     	str	x2, [x29, #0x108]
  9efa4c: b50001a0     	cbnz	x0, 0x9efa80 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x6c>
  9efa50: f940e673     	ldr	x19, [x19, #0x1c8]
  9efa54: 2a1403e0     	mov	w0, w20
  9efa58: f94087a2     	ldr	x2, [x29, #0x108]
  9efa5c: f9400261     	ldr	x1, [x19]
  9efa60: eb01005f     	cmp	x2, x1
  9efa64: 54001041     	b.ne	0x9efc6c <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x258>
  9efa68: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9efa6c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9efa70: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9efa74: f94023f9     	ldr	x25, [sp, #0x40]
  9efa78: a8d17bfd     	ldp	x29, x30, [sp], #0x110
  9efa7c: d65f03c0     	ret
  9efa80: f9002fa1     	str	x1, [x29, #0x58]
  9efa84: 97e6fa96     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  9efa88: f9400002     	ldr	x2, [x0]
  9efa8c: 9101c3b8     	add	x24, x29, #0x70
  9efa90: f9402fa1     	ldr	x1, [x29, #0x58]
  9efa94: aa1803e8     	mov	x8, x24
  9efa98: aa0003f7     	mov	x23, x0
  9efa9c: d0002ad5     	adrp	x21, 0xf49000
  9efaa0: f9402042     	ldr	x2, [x2, #0x40]
  9efaa4: d63f0040     	blr	x2
  9efaa8: f9403ba1     	ldr	x1, [x29, #0x70]
  9efaac: f85e8020     	ldur	x0, [x1, #-0x18]
  9efab0: b5000240     	cbnz	x0, 0x9efaf8 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xe4>
  9efab4: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9efab8: d1006020     	sub	x0, x1, #0x18
  9efabc: eb15001f     	cmp	x0, x21
  9efac0: 54fffc80     	b.eq	0x9efa50 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x3c>
  9efac4: b0002aa2     	adrp	x2, 0xf44000
  9efac8: f9445042     	ldr	x2, [x2, #0x8a0]
  9efacc: b4000c02     	cbz	x2, 0x9efc4c <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x238>
  9efad0: d1002021     	sub	x1, x1, #0x8
  9efad4: 885ffc22     	ldaxr	w2, [x1]
  9efad8: 51000443     	sub	w3, w2, #0x1
  9efadc: 8804fc23     	stlxr	w4, w3, [x1]
  9efae0: 35ffffa4     	cbnz	w4, 0x9efad4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xc0>
  9efae4: 6b1f005f     	cmp	w2, wzr
  9efae8: 54fffb4c     	b.gt	0x9efa50 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x3c>
  9efaec: 9101e3a1     	add	x1, x29, #0x78
  9efaf0: 94076b33     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9efaf4: 17ffffd7     	b	0x9efa50 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x3c>
  9efaf8: f94002e2     	ldr	x2, [x23]
  9efafc: 9101e3a8     	add	x8, x29, #0x78
  9efb00: aa1703e0     	mov	x0, x23
  9efb04: aa1803e1     	mov	x1, x24
  9efb08: f9407042     	ldr	x2, [x2, #0xe0]
  9efb0c: d63f0040     	blr	x2
  9efb10: f0001301     	adrp	x1, 0xc52000 <_ZTSSt23_Sp_counted_ptr_inplaceIN7cocos2d3MapIPNS0_4NodeEPN12cocosbuilder19CCBAnimationManagerEEESaIS7_ELN9__gnu_cxx12_Lock_policyE2EE+0x80>
  9efb14: f9403fa0     	ldr	x0, [x29, #0x78]
  9efb18: 91394021     	add	x1, x1, #0xe50
  9efb1c: 97e6af49     	bl	0x39b840 <fopen@plt>
  9efb20: f9403fa1     	ldr	x1, [x29, #0x78]
  9efb24: aa0003f4     	mov	x20, x0
  9efb28: f947eea2     	ldr	x2, [x21, #0xfd8]
  9efb2c: d1006020     	sub	x0, x1, #0x18
  9efb30: eb02001f     	cmp	x0, x2
  9efb34: 54000621     	b.ne	0x9efbf8 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x1e4>
  9efb38: b40007b4     	cbz	x20, 0x9efc2c <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x218>
  9efb3c: aa1403e0     	mov	x0, x20
  9efb40: 97e6b09c     	bl	0x39bdb0 <fileno@plt>
  9efb44: 910223a1     	add	x1, x29, #0x88
  9efb48: 97e6ad42     	bl	0x39b050 <fstat@plt>
  9efb4c: 3100041f     	cmn	w0, #0x1
  9efb50: 54000740     	b.eq	0x9efc38 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x224>
  9efb54: f9405fb7     	ldr	x23, [x29, #0xb8]
  9efb58: aa1703e0     	mov	x0, x23
  9efb5c: 97e6ae21     	bl	0x39b3e0 <malloc@plt>
  9efb60: aa0003f8     	mov	x24, x0
  9efb64: d2800021     	mov	x1, #0x1                // =1
  9efb68: aa1703e2     	mov	x2, x23
  9efb6c: aa1403e3     	mov	x3, x20
  9efb70: 97e6afac     	bl	0x39ba20 <fread@plt>
  9efb74: aa0003f9     	mov	x25, x0
  9efb78: aa1403e0     	mov	x0, x20
  9efb7c: 97e6b179     	bl	0x39c160 <fclose@plt>
  9efb80: eb1902ff     	cmp	x23, x25
  9efb84: 54000308     	b.hi	0x9efbe4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x1d0>
  9efb88: 97f55686     	bl	0x7455a0 <_ZN15ResourcesDecode12sharedDecodeEv>
  9efb8c: aa1803e1     	mov	x1, x24
  9efb90: aa1703e2     	mov	x2, x23
  9efb94: 910203a3     	add	x3, x29, #0x80
  9efb98: 97f556da     	bl	0x745700 <_ZN15ResourcesDecode10decodeDataEPhlPl>
  9efb9c: f94002c2     	ldr	x2, [x22]
  9efba0: aa0003f7     	mov	x23, x0
  9efba4: f94043a1     	ldr	x1, [x29, #0x80]
  9efba8: aa1603e0     	mov	x0, x22
  9efbac: f9400842     	ldr	x2, [x2, #0x10]
  9efbb0: d63f0040     	blr	x2
  9efbb4: f94002c1     	ldr	x1, [x22]
  9efbb8: aa1603e0     	mov	x0, x22
  9efbbc: f9400c21     	ldr	x1, [x1, #0x18]
  9efbc0: d63f0020     	blr	x1
  9efbc4: f94043a2     	ldr	x2, [x29, #0x80]
  9efbc8: aa1703e1     	mov	x1, x23
  9efbcc: 52800014     	mov	w20, #0x0               // =0
  9efbd0: 97e6aba4     	bl	0x39aa60 <memcpy@plt>
  9efbd4: aa1703e0     	mov	x0, x23
  9efbd8: 940630ce     	bl	0xb7bf10 <_ZdaPv>
  9efbdc: f9403ba1     	ldr	x1, [x29, #0x70]
  9efbe0: 17ffffb5     	b	0x9efab4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xa0>
  9efbe4: aa1803e0     	mov	x0, x24
  9efbe8: 52800074     	mov	w20, #0x3               // =3
  9efbec: 97e6b0b1     	bl	0x39beb0 <free@plt>
  9efbf0: f9403ba1     	ldr	x1, [x29, #0x70]
  9efbf4: 17ffffb0     	b	0x9efab4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xa0>
  9efbf8: b0002aa2     	adrp	x2, 0xf44000
  9efbfc: f9445042     	ldr	x2, [x2, #0x8a0]
  9efc00: b40002e2     	cbz	x2, 0x9efc5c <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x248>
  9efc04: d1002021     	sub	x1, x1, #0x8
  9efc08: 885ffc22     	ldaxr	w2, [x1]
  9efc0c: 51000443     	sub	w3, w2, #0x1
  9efc10: 8804fc23     	stlxr	w4, w3, [x1]
  9efc14: 35ffffa4     	cbnz	w4, 0x9efc08 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x1f4>
  9efc18: 6b1f005f     	cmp	w2, wzr
  9efc1c: 54fff8ec     	b.gt	0x9efb38 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x124>
  9efc20: 910223a1     	add	x1, x29, #0x88
  9efc24: 94076ae6     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9efc28: 17ffffc4     	b	0x9efb38 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x124>
  9efc2c: f9403ba1     	ldr	x1, [x29, #0x70]
  9efc30: 52800054     	mov	w20, #0x2               // =2
  9efc34: 17ffffa0     	b	0x9efab4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xa0>
  9efc38: aa1403e0     	mov	x0, x20
  9efc3c: 97e6b149     	bl	0x39c160 <fclose@plt>
  9efc40: f9403ba1     	ldr	x1, [x29, #0x70]
  9efc44: 52800074     	mov	w20, #0x3               // =3
  9efc48: 17ffff9b     	b	0x9efab4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xa0>
  9efc4c: b85f8022     	ldur	w2, [x1, #-0x8]
  9efc50: 51000443     	sub	w3, w2, #0x1
  9efc54: b81f8023     	stur	w3, [x1, #-0x8]
  9efc58: 17ffffa3     	b	0x9efae4 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0xd0>
  9efc5c: b85f8022     	ldur	w2, [x1, #-0x8]
  9efc60: 51000443     	sub	w3, w2, #0x1
  9efc64: b81f8023     	stur	w3, [x1, #-0x8]
  9efc68: 17ffffec     	b	0x9efc18 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x204>
  9efc6c: 97e6adcd     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9efc70: d0002ad5     	adrp	x21, 0xf49000
  9efc74: aa0003f3     	mov	x19, x0
  9efc78: f9403fa0     	ldr	x0, [x29, #0x78]
  9efc7c: f947eea1     	ldr	x1, [x21, #0xfd8]
  9efc80: d1006000     	sub	x0, x0, #0x18
  9efc84: eb01001f     	cmp	x0, x1
  9efc88: 54000060     	b.eq	0x9efc94 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x280>
  9efc8c: 910223a1     	add	x1, x29, #0x88
  9efc90: 97e6bdfc     	bl	0x39f480 <.text+0x3170>
  9efc94: f9403ba0     	ldr	x0, [x29, #0x70]
  9efc98: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9efc9c: d1006000     	sub	x0, x0, #0x18
  9efca0: eb15001f     	cmp	x0, x21
  9efca4: 54000060     	b.eq	0x9efcb0 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x29c>
  9efca8: 9101a3a1     	add	x1, x29, #0x68
  9efcac: 97e6bdf5     	bl	0x39f480 <.text+0x3170>
  9efcb0: aa1303e0     	mov	x0, x19
  9efcb4: 9407cc8b     	bl	0xbe2ee0 <_Unwind_Resume>
  9efcb8: aa0003f3     	mov	x19, x0
  9efcbc: 17fffff6     	b	0x9efc94 <_ZN7cocos2d9FileUtils11getContentsERKSsPNS_15ResizableBufferE+0x280>

00000000009efcc0 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci>:
  9efcc0: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9efcc4: 910003fd     	mov	x29, sp
  9efcc8: a90153f3     	stp	x19, x20, [sp, #0x10]
  9efccc: b0002a93     	adrp	x19, 0xf40000
  9efcd0: aa0003f4     	mov	x20, x0
  9efcd4: b9407000     	ldr	w0, [x0, #0x70]
  9efcd8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9efcdc: f940e664     	ldr	x4, [x19, #0x1c8]
  9efce0: f9400084     	ldr	x4, [x4]
  9efce4: f90027a4     	str	x4, [x29, #0x48]
  9efce8: 35000140     	cbnz	w0, 0x9efd10 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x50>
  9efcec: f940e673     	ldr	x19, [x19, #0x1c8]
  9efcf0: f94027a1     	ldr	x1, [x29, #0x48]
  9efcf4: f9400260     	ldr	x0, [x19]
  9efcf8: eb00003f     	cmp	x1, x0
  9efcfc: 54000621     	b.ne	0x9efdc0 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x100>
  9efd00: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9efd04: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9efd08: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9efd0c: d65f03c0     	ret
  9efd10: 910103b5     	add	x21, x29, #0x40
  9efd14: 9100e3b6     	add	x22, x29, #0x38
  9efd18: aa1503e0     	mov	x0, x21
  9efd1c: aa0203e1     	mov	x1, x2
  9efd20: 93407c62     	sxtw	x2, w3
  9efd24: aa1603e3     	mov	x3, x22
  9efd28: 94075c5b     	bl	0xbc6e94 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4886c>
  9efd2c: b9407280     	ldr	w0, [x20, #0x70]
  9efd30: 7100041f     	cmp	w0, #0x1
  9efd34: 54000360     	b.eq	0x9efda0 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0xe0>
  9efd38: 340000e0     	cbz	w0, 0x9efd54 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x94>
  9efd3c: 51000c00     	sub	w0, w0, #0x3
  9efd40: 7100081f     	cmp	w0, #0x2
  9efd44: 54000088     	b.hi	0x9efd54 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x94>
  9efd48: 9101a280     	add	x0, x20, #0x68
  9efd4c: aa1503e1     	mov	x1, x21
  9efd50: 94075f37     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9efd54: d0002ac1     	adrp	x1, 0xf49000
  9efd58: f94023a2     	ldr	x2, [x29, #0x40]
  9efd5c: d1006040     	sub	x0, x2, #0x18
  9efd60: f947ec21     	ldr	x1, [x1, #0xfd8]
  9efd64: eb01001f     	cmp	x0, x1
  9efd68: 54fffc20     	b.eq	0x9efcec <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x2c>
  9efd6c: b0002aa1     	adrp	x1, 0xf44000
  9efd70: f9445021     	ldr	x1, [x1, #0x8a0]
  9efd74: b40001e1     	cbz	x1, 0x9efdb0 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0xf0>
  9efd78: d1002042     	sub	x2, x2, #0x8
  9efd7c: 885ffc41     	ldaxr	w1, [x2]
  9efd80: 51000423     	sub	w3, w1, #0x1
  9efd84: 8804fc43     	stlxr	w4, w3, [x2]
  9efd88: 35ffffa4     	cbnz	w4, 0x9efd7c <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0xbc>
  9efd8c: 6b1f003f     	cmp	w1, wzr
  9efd90: 54fffaec     	b.gt	0x9efcec <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x2c>
  9efd94: aa1603e1     	mov	x1, x22
  9efd98: 94076a89     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9efd9c: 17ffffd4     	b	0x9efcec <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x2c>
  9efda0: 91018280     	add	x0, x20, #0x60
  9efda4: aa1503e1     	mov	x1, x21
  9efda8: 94076b46     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9efdac: 17ffffea     	b	0x9efd54 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x94>
  9efdb0: b85f8041     	ldur	w1, [x2, #-0x8]
  9efdb4: 51000423     	sub	w3, w1, #0x1
  9efdb8: b81f8043     	stur	w3, [x2, #-0x8]
  9efdbc: 17fffff4     	b	0x9efd8c <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0xcc>
  9efdc0: 97e6ad78     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9efdc4: d0002ac1     	adrp	x1, 0xf49000
  9efdc8: aa0003f3     	mov	x19, x0
  9efdcc: f94023a0     	ldr	x0, [x29, #0x40]
  9efdd0: f947ec21     	ldr	x1, [x1, #0xfd8]
  9efdd4: d1006000     	sub	x0, x0, #0x18
  9efdd8: eb01001f     	cmp	x0, x1
  9efddc: 54000060     	b.eq	0x9efde8 <_ZN7cocos2d9DictMaker11textHandlerEPvPKci+0x128>
  9efde0: aa1603e1     	mov	x1, x22
  9efde4: 97e6bda7     	bl	0x39f480 <.text+0x3170>
  9efde8: aa1303e0     	mov	x0, x19
  9efdec: 9407cc3d     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009efdf0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv>:
  9efdf0: d1400bff     	sub	sp, sp, #0x2, lsl #12   // =0x2000
  9efdf4: b0002a81     	adrp	x1, 0xf40000
  9efdf8: d10883ff     	sub	sp, sp, #0x220
  9efdfc: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9efe00: 910003fd     	mov	x29, sp
  9efe04: f940e422     	ldr	x2, [x1, #0x1c8]
  9efe08: f9400001     	ldr	x1, [x0]
  9efe0c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9efe10: 910a03b8     	add	x24, x29, #0x280
  9efe14: f9400042     	ldr	x2, [x2]
  9efe18: a90153f3     	stp	x19, x20, [sp, #0x10]
  9efe1c: f9404421     	ldr	x1, [x1, #0x88]
  9efe20: d1064314     	sub	x20, x24, #0x190
  9efe24: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9efe28: f9113fa2     	str	x2, [x29, #0x2278]
  9efe2c: aa1403e8     	mov	x8, x20
  9efe30: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9efe34: a90573fb     	stp	x27, x28, [sp, #0x50]
  9efe38: aa0003f9     	mov	x25, x0
  9efe3c: 91262013     	add	x19, x0, #0x988
  9efe40: d63f0020     	blr	x1
  9efe44: d0001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9efe48: aa1403e0     	mov	x0, x20
  9efe4c: 9107e021     	add	x1, x1, #0x1f8
  9efe50: d28000c2     	mov	x2, #0x6                // =6
  9efe54: 94075f66     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9efe58: d0002ad6     	adrp	x22, 0xf49000
  9efe5c: d1076302     	sub	x2, x24, #0x1d8
  9efe60: f9400004     	ldr	x4, [x0]
  9efe64: f947eec3     	ldr	x3, [x22, #0xfd8]
  9efe68: f9000044     	str	x4, [x2]
  9efe6c: 91006062     	add	x2, x3, #0x18
  9efe70: f9000002     	str	x2, [x0]
  9efe74: f9400281     	ldr	x1, [x20]
  9efe78: d1006020     	sub	x0, x1, #0x18
  9efe7c: eb03001f     	cmp	x0, x3
  9efe80: 54003e61     	b.ne	0x9f064c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x85c>
  9efe84: f9400322     	ldr	x2, [x25]
  9efe88: aa1903e0     	mov	x0, x25
  9efe8c: d1076301     	sub	x1, x24, #0x1d8
  9efe90: f9408c42     	ldr	x2, [x2, #0x118]
  9efe94: d63f0040     	blr	x2
  9efe98: f9400322     	ldr	x2, [x25]
  9efe9c: aa1303e1     	mov	x1, x19
  9efea0: d1064308     	sub	x8, x24, #0x190
  9efea4: aa1903e0     	mov	x0, x25
  9efea8: f9402043     	ldr	x3, [x2, #0x40]
  9efeac: f9401053     	ldr	x19, [x2, #0x20]
  9efeb0: d63f0060     	blr	x3
  9efeb4: d106c308     	sub	x8, x24, #0x1b0
  9efeb8: aa1903e0     	mov	x0, x25
  9efebc: d1064301     	sub	x1, x24, #0x190
  9efec0: d63f0260     	blr	x19
  9efec4: d1064300     	sub	x0, x24, #0x190
  9efec8: f947eec2     	ldr	x2, [x22, #0xfd8]
  9efecc: f9400001     	ldr	x1, [x0]
  9efed0: d1006020     	sub	x0, x1, #0x18
  9efed4: eb02001f     	cmp	x0, x2
  9efed8: 54003a01     	b.ne	0x9f0618 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x828>
  9efedc: d106c300     	sub	x0, x24, #0x1b0
  9efee0: 9400921e     	bl	0xa14758 <_ZNK7cocos2d4Data8getBytesEv>
  9efee4: aa0003f3     	mov	x19, x0
  9efee8: d106c300     	sub	x0, x24, #0x1b0
  9efeec: 9400921d     	bl	0xa14760 <_ZNK7cocos2d4Data7getSizeEv>
  9efef0: aa0003e1     	mov	x1, x0
  9efef4: aa1303e0     	mov	x0, x19
  9efef8: 94023c8f     	bl	0xa7f134 <_ZN7cocos2d13unzOpenBufferEPKvm>
  9efefc: f9004fa0     	str	x0, [x29, #0x98]
  9eff00: b4001960     	cbz	x0, 0x9f022c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x43c>
  9eff04: d1068301     	sub	x1, x24, #0x1a0
  9eff08: 940239db     	bl	0xa7e674 <_ZN7cocos2d16unzGetGlobalInfoEPvPNS_17unz_global_info_sE>
  9eff0c: 34000560     	cbz	w0, 0x9effb8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1c8>
  9eff10: b0002aa0     	adrp	x0, 0xf44000
  9eff14: f9445000     	ldr	x0, [x0, #0x8a0]
  9eff18: b4002b40     	cbz	x0, 0x9f0480 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x690>
  9eff1c: 91256333     	add	x19, x25, #0x958
  9eff20: aa1303e0     	mov	x0, x19
  9eff24: 97e6adef     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9eff28: 35005fe0     	cbnz	w0, 0x9f0b24 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xd34>
  9eff2c: 12800021     	mov	w1, #-0x2               // =-2
  9eff30: aa1303e0     	mov	x0, x19
  9eff34: b9098321     	str	w1, [x25, #0x980]
  9eff38: 97e6aaea     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9eff3c: 90001380     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9eff40: f944c721     	ldr	x1, [x25, #0x988]
  9eff44: 91166000     	add	x0, x0, #0x598
  9eff48: 94006b42     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9eff4c: f9404fa0     	ldr	x0, [x29, #0x98]
  9eff50: 94023ece     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9eff54: 52800017     	mov	w23, #0x0               // =0
  9eff58: d1076313     	sub	x19, x24, #0x1d8
  9eff5c: d106c300     	sub	x0, x24, #0x1b0
  9eff60: 94009210     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9eff64: f947eed6     	ldr	x22, [x22, #0xfd8]
  9eff68: f9400274     	ldr	x20, [x19]
  9eff6c: d1006295     	sub	x21, x20, #0x18
  9eff70: eb1602bf     	cmp	x21, x22
  9eff74: 54003361     	b.ne	0x9f05e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x7f0>
  9eff78: b0002a80     	adrp	x0, 0xf40000
  9eff7c: f9513fb3     	ldr	x19, [x29, #0x2278]
  9eff80: f940e401     	ldr	x1, [x0, #0x1c8]
  9eff84: 2a1703e0     	mov	w0, w23
  9eff88: f9400021     	ldr	x1, [x1]
  9eff8c: eb01027f     	cmp	x19, x1
  9eff90: 54005cc1     	b.ne	0x9f0b28 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xd38>
  9eff94: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9eff98: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9eff9c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9effa0: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9effa4: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9effa8: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9effac: 910883ff     	add	sp, sp, #0x220
  9effb0: 91400bff     	add	sp, sp, #0x2, lsl #12   // =0x2000
  9effb4: d65f03c0     	ret
  9effb8: d1068302     	sub	x2, x24, #0x1a0
  9effbc: 90001380     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9effc0: 91170000     	add	x0, x0, #0x5c0
  9effc4: f9400041     	ldr	x1, [x2]
  9effc8: f9400442     	ldr	x2, [x2, #0x8]
  9effcc: 94006b21     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9effd0: d1068300     	sub	x0, x24, #0x1a0
  9effd4: b909833f     	str	wzr, [x25, #0x980]
  9effd8: f9400000     	ldr	x0, [x0]
  9effdc: b4002440     	cbz	x0, 0x9f0464 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x674>
  9effe0: d2800c80     	mov	x0, #0x64               // =100
  9effe4: f90037a0     	str	x0, [x29, #0x68]
  9effe8: d2800020     	mov	x0, #0x1                // =1
  9effec: f9003ba0     	str	x0, [x29, #0x70]
  9efff0: d1064300     	sub	x0, x24, #0x190
  9efff4: f90033a0     	str	x0, [x29, #0x60]
  9efff8: d1042300     	sub	x0, x24, #0x108
  9efffc: f90043a0     	str	x0, [x29, #0x80]
  9f0000: d1074300     	sub	x0, x24, #0x1d0
  9f0004: d107631a     	sub	x26, x24, #0x1d8
  9f0008: f9003fa0     	str	x0, [x29, #0x78]
  9f000c: d1072317     	sub	x23, x24, #0x1c8
  9f0010: d106e300     	sub	x0, x24, #0x1b8
  9f0014: f9004ba0     	str	x0, [x29, #0x90]
  9f0018: f9404fa0     	ldr	x0, [x29, #0x98]
  9f001c: d2802003     	mov	x3, #0x100              // =256
  9f0020: f94033a1     	ldr	x1, [x29, #0x60]
  9f0024: d2800004     	mov	x4, #0x0                // =0
  9f0028: f94043a2     	ldr	x2, [x29, #0x80]
  9f002c: d2800005     	mov	x5, #0x0                // =0
  9f0030: d2800006     	mov	x6, #0x0                // =0
  9f0034: d2800007     	mov	x7, #0x0                // =0
  9f0038: 940239ad     	bl	0xa7e6ec <_ZN7cocos2d21unzGetCurrentFileInfoEPvPNS_15unz_file_info_sEPcmS0_mS3_m>
  9f003c: 35003e40     	cbnz	w0, 0x9f0804 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa14>
  9f0040: f9403fb4     	ldr	x20, [x29, #0x78]
  9f0044: aa1a03e1     	mov	x1, x26
  9f0048: aa1403e0     	mov	x0, x20
  9f004c: 94076a3d     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f0050: f94043b3     	ldr	x19, [x29, #0x80]
  9f0054: aa1303e0     	mov	x0, x19
  9f0058: 97e6ac8e     	bl	0x39b290 <strlen@plt>
  9f005c: aa0003e2     	mov	x2, x0
  9f0060: aa1303e1     	mov	x1, x19
  9f0064: aa1403e0     	mov	x0, x20
  9f0068: 94075ee1     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9f006c: f94043b3     	ldr	x19, [x29, #0x80]
  9f0070: aa1303e0     	mov	x0, x19
  9f0074: 97e6ac87     	bl	0x39b290 <strlen@plt>
  9f0078: 8b000260     	add	x0, x19, x0
  9f007c: 38dff000     	ldursb	w0, [x0, #-0x1]
  9f0080: 7100bc1f     	cmp	w0, #0x2f
  9f0084: 54002660     	b.eq	0x9f0550 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x760>
  9f0088: f94043a1     	ldr	x1, [x29, #0x80]
  9f008c: aa1703e0     	mov	x0, x23
  9f0090: f9404ba2     	ldr	x2, [x29, #0x90]
  9f0094: 94075bcf     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f0098: b00013bc     	adrp	x28, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9f009c: aa1703e0     	mov	x0, x23
  9f00a0: 913d4381     	add	x1, x28, #0xf50
  9f00a4: d2800002     	mov	x2, #0x0                // =0
  9f00a8: d2800023     	mov	x3, #0x1                // =1
  9f00ac: 94075fe2     	bl	0xbc8034 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49a0c>
  9f00b0: b100041f     	cmn	x0, #0x1
  9f00b4: aa0003f3     	mov	x19, x0
  9f00b8: 54001300     	b.eq	0x9f0318 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x528>
  9f00bc: f0000fa0     	adrp	x0, 0xbe7000 <_ZTSN7cocos2d6DeviceE+0xd20>
  9f00c0: d1070315     	sub	x21, x24, #0x1c0
  9f00c4: 911a001b     	add	x27, x0, #0x680
  9f00c8: 1400000e     	b	0x9f0100 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x310>
  9f00cc: 97e6b025     	bl	0x39c160 <fclose@plt>
  9f00d0: aa1703e0     	mov	x0, x23
  9f00d4: 913d4381     	add	x1, x28, #0xf50
  9f00d8: 91000662     	add	x2, x19, #0x1
  9f00dc: d2800023     	mov	x3, #0x1                // =1
  9f00e0: 94075fd5     	bl	0xbc8034 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49a0c>
  9f00e4: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f00e8: aa0003f3     	mov	x19, x0
  9f00ec: d1006280     	sub	x0, x20, #0x18
  9f00f0: eb01001f     	cmp	x0, x1
  9f00f4: 54000f61     	b.ne	0x9f02e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x4f0>
  9f00f8: b100067f     	cmn	x19, #0x1
  9f00fc: 540010e0     	b.eq	0x9f0318 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x528>
  9f0100: aa1503e0     	mov	x0, x21
  9f0104: aa1703e1     	mov	x1, x23
  9f0108: d2800002     	mov	x2, #0x0                // =0
  9f010c: aa1303e3     	mov	x3, x19
  9f0110: 94075aa3     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9f0114: f9400342     	ldr	x2, [x26]
  9f0118: aa1503e0     	mov	x0, x21
  9f011c: d2800001     	mov	x1, #0x0                // =0
  9f0120: f85e8043     	ldur	x3, [x2, #-0x18]
  9f0124: 940765a1     	bl	0xbc97a8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4b180>
  9f0128: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f012c: f9400014     	ldr	x20, [x0]
  9f0130: 91006022     	add	x2, x1, #0x18
  9f0134: f9000002     	str	x2, [x0]
  9f0138: f94002a2     	ldr	x2, [x21]
  9f013c: d1006040     	sub	x0, x2, #0x18
  9f0140: eb01001f     	cmp	x0, x1
  9f0144: 54000b41     	b.ne	0x9f02ac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x4bc>
  9f0148: aa1403e0     	mov	x0, x20
  9f014c: aa1b03e1     	mov	x1, x27
  9f0150: 97e6adbc     	bl	0x39b840 <fopen@plt>
  9f0154: b5fffbc0     	cbnz	x0, 0x9f00cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x2dc>
  9f0158: f9400323     	ldr	x3, [x25]
  9f015c: aa1403e1     	mov	x1, x20
  9f0160: f9404ba0     	ldr	x0, [x29, #0x90]
  9f0164: d1078302     	sub	x2, x24, #0x1e0
  9f0168: f9408863     	ldr	x3, [x3, #0x110]
  9f016c: f90047a3     	str	x3, [x29, #0x88]
  9f0170: 94075b98     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f0174: f9404ba1     	ldr	x1, [x29, #0x90]
  9f0178: aa1903e0     	mov	x0, x25
  9f017c: f94047a3     	ldr	x3, [x29, #0x88]
  9f0180: d63f0060     	blr	x3
  9f0184: f9404ba1     	ldr	x1, [x29, #0x90]
  9f0188: 53001c04     	uxtb	w4, w0
  9f018c: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0190: f9400021     	ldr	x1, [x1]
  9f0194: d1006020     	sub	x0, x1, #0x18
  9f0198: eb02001f     	cmp	x0, x2
  9f019c: 54000681     	b.ne	0x9f026c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x47c>
  9f01a0: 35fff984     	cbnz	w4, 0x9f00d0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x2e0>
  9f01a4: 90002ab5     	adrp	x21, 0xf44000
  9f01a8: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f01ac: b4003260     	cbz	x0, 0x9f07f8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa08>
  9f01b0: 91256333     	add	x19, x25, #0x958
  9f01b4: aa1303e0     	mov	x0, x19
  9f01b8: 97e6ad4a     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f01bc: 35003d40     	cbnz	w0, 0x9f0964 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb74>
  9f01c0: 12800081     	mov	w1, #-0x5               // =-5
  9f01c4: aa1303e0     	mov	x0, x19
  9f01c8: b9098321     	str	w1, [x25, #0x980]
  9f01cc: 97e6aa45     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f01d0: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f01d4: aa1403e1     	mov	x1, x20
  9f01d8: 91184000     	add	x0, x0, #0x610
  9f01dc: 94006a9d     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f01e0: f9404fa0     	ldr	x0, [x29, #0x98]
  9f01e4: 94023e29     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9f01e8: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f01ec: d1006280     	sub	x0, x20, #0x18
  9f01f0: eb01001f     	cmp	x0, x1
  9f01f4: 54001760     	b.eq	0x9f04e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6f0>
  9f01f8: f94452a1     	ldr	x1, [x21, #0x8a0]
  9f01fc: b4003a81     	cbz	x1, 0x9f094c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb5c>
  9f0200: d1002294     	sub	x20, x20, #0x8
  9f0204: 885ffe93     	ldaxr	w19, [x20]
  9f0208: 51000661     	sub	w1, w19, #0x1
  9f020c: 8802fe81     	stlxr	w2, w1, [x20]
  9f0210: 35ffffa2     	cbnz	w2, 0x9f0204 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x414>
  9f0214: 2a1303e1     	mov	w1, w19
  9f0218: 6b1f003f     	cmp	w1, wzr
  9f021c: 5400162c     	b.gt	0x9f04e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6f0>
  9f0220: d106e301     	sub	x1, x24, #0x1b8
  9f0224: 94076966     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0228: 140000ae     	b	0x9f04e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6f0>
  9f022c: 90002aa0     	adrp	x0, 0xf44000
  9f0230: f9445000     	ldr	x0, [x0, #0x8a0]
  9f0234: b4002260     	cbz	x0, 0x9f0680 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x890>
  9f0238: 91256333     	add	x19, x25, #0x958
  9f023c: aa1303e0     	mov	x0, x19
  9f0240: 97e6ad28     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f0244: 350038e0     	cbnz	w0, 0x9f0960 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb70>
  9f0248: 12800001     	mov	w1, #-0x1               // =-1
  9f024c: aa1303e0     	mov	x0, x19
  9f0250: b9098321     	str	w1, [x25, #0x980]
  9f0254: 97e6aa23     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f0258: b0001600     	adrp	x0, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f025c: f944c721     	ldr	x1, [x25, #0x988]
  9f0260: 91080000     	add	x0, x0, #0x200
  9f0264: 94006a7b     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f0268: 17ffff3b     	b	0x9eff54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x164>
  9f026c: 90002aa2     	adrp	x2, 0xf44000
  9f0270: f9445042     	ldr	x2, [x2, #0x8a0]
  9f0274: b4002302     	cbz	x2, 0x9f06d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x8e4>
  9f0278: d1002021     	sub	x1, x1, #0x8
  9f027c: 885ffc22     	ldaxr	w2, [x1]
  9f0280: 51000443     	sub	w3, w2, #0x1
  9f0284: 8805fc23     	stlxr	w5, w3, [x1]
  9f0288: 35ffffa5     	cbnz	w5, 0x9f027c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x48c>
  9f028c: 6b1f005f     	cmp	w2, wzr
  9f0290: 54fff88c     	b.gt	0x9f01a0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x3b0>
  9f0294: aa1503e1     	mov	x1, x21
  9f0298: f90047a4     	str	x4, [x29, #0x88]
  9f029c: 94076948     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f02a0: f94047a4     	ldr	x4, [x29, #0x88]
  9f02a4: 35fff164     	cbnz	w4, 0x9f00d0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x2e0>
  9f02a8: 17ffffbf     	b	0x9f01a4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x3b4>
  9f02ac: 90002aa1     	adrp	x1, 0xf44000
  9f02b0: f9445021     	ldr	x1, [x1, #0x8a0]
  9f02b4: b4000641     	cbz	x1, 0x9f037c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x58c>
  9f02b8: d1002042     	sub	x2, x2, #0x8
  9f02bc: 885ffc41     	ldaxr	w1, [x2]
  9f02c0: 51000423     	sub	w3, w1, #0x1
  9f02c4: 8804fc43     	stlxr	w4, w3, [x2]
  9f02c8: 35ffffa4     	cbnz	w4, 0x9f02bc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x4cc>
  9f02cc: 6b1f003f     	cmp	w1, wzr
  9f02d0: 54fff3cc     	b.gt	0x9f0148 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x358>
  9f02d4: f9404ba1     	ldr	x1, [x29, #0x90]
  9f02d8: 94076939     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f02dc: 17ffff9b     	b	0x9f0148 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x358>
  9f02e0: 90002aa1     	adrp	x1, 0xf44000
  9f02e4: f9445021     	ldr	x1, [x1, #0x8a0]
  9f02e8: b4000521     	cbz	x1, 0x9f038c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x59c>
  9f02ec: d1002294     	sub	x20, x20, #0x8
  9f02f0: 885ffe81     	ldaxr	w1, [x20]
  9f02f4: 51000422     	sub	w2, w1, #0x1
  9f02f8: 8803fe82     	stlxr	w3, w2, [x20]
  9f02fc: 35ffffa3     	cbnz	w3, 0x9f02f0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x500>
  9f0300: 6b1f003f     	cmp	w1, wzr
  9f0304: 54ffefac     	b.gt	0x9f00f8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x308>
  9f0308: f9404ba1     	ldr	x1, [x29, #0x90]
  9f030c: 9407692c     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0310: b100067f     	cmn	x19, #0x1
  9f0314: 54ffef61     	b.ne	0x9f0100 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x310>
  9f0318: f9404fa0     	ldr	x0, [x29, #0x98]
  9f031c: 94023f37     	bl	0xa7fff8 <_ZN7cocos2d18unzOpenCurrentFileEPv>
  9f0320: 35002a00     	cbnz	w0, 0x9f0860 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa70>
  9f0324: f9403fa0     	ldr	x0, [x29, #0x78]
  9f0328: d0001361     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9f032c: 910ec021     	add	x1, x1, #0x3b0
  9f0330: f9400000     	ldr	x0, [x0]
  9f0334: 97e6ad43     	bl	0x39b840 <fopen@plt>
  9f0338: aa0003f5     	mov	x21, x0
  9f033c: b4002b60     	cbz	x0, 0x9f08a8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xab8>
  9f0340: d1002314     	sub	x20, x24, #0x8
  9f0344: f9404fa0     	ldr	x0, [x29, #0x98]
  9f0348: aa1403e1     	mov	x1, x20
  9f034c: 52840002     	mov	w2, #0x2000             // =8192
  9f0350: 94023ca3     	bl	0xa7f5dc <_ZN7cocos2d18unzReadCurrentFileEPvS0_j>
  9f0354: 6b1f001f     	cmp	w0, wzr
  9f0358: 2a0003f3     	mov	w19, w0
  9f035c: 5400098b     	b.lt	0x9f048c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x69c>
  9f0360: 540001e0     	b.eq	0x9f039c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x5ac>
  9f0364: aa1403e0     	mov	x0, x20
  9f0368: 93407e61     	sxtw	x1, w19
  9f036c: d2800022     	mov	x2, #0x1                // =1
  9f0370: aa1503e3     	mov	x3, x21
  9f0374: 97e6ae4b     	bl	0x39bca0 <fwrite@plt>
  9f0378: 17fffff3     	b	0x9f0344 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x554>
  9f037c: b85f8041     	ldur	w1, [x2, #-0x8]
  9f0380: 51000423     	sub	w3, w1, #0x1
  9f0384: b81f8043     	stur	w3, [x2, #-0x8]
  9f0388: 17ffffd1     	b	0x9f02cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x4dc>
  9f038c: b85f8281     	ldur	w1, [x20, #-0x8]
  9f0390: 51000422     	sub	w2, w1, #0x1
  9f0394: b81f8282     	stur	w2, [x20, #-0x8]
  9f0398: 17ffffda     	b	0x9f0300 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x510>
  9f039c: aa1503e0     	mov	x0, x21
  9f03a0: 97e6af70     	bl	0x39c160 <fclose@plt>
  9f03a4: f94002e1     	ldr	x1, [x23]
  9f03a8: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f03ac: d1006020     	sub	x0, x1, #0x18
  9f03b0: eb02001f     	cmp	x0, x2
  9f03b4: 54002081     	b.ne	0x9f07c4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9d4>
  9f03b8: f9404fa0     	ldr	x0, [x29, #0x98]
  9f03bc: 94023d8d     	bl	0xa7f9f0 <_ZN7cocos2d19unzCloseCurrentFileEPv>
  9f03c0: b9498720     	ldr	w0, [x25, #0x984]
  9f03c4: 34000be0     	cbz	w0, 0x9f0540 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x750>
  9f03c8: d1068300     	sub	x0, x24, #0x1a0
  9f03cc: f94037a2     	ldr	x2, [x29, #0x68]
  9f03d0: b9498321     	ldr	w1, [x25, #0x980]
  9f03d4: f9403bb4     	ldr	x20, [x29, #0x70]
  9f03d8: f9400000     	ldr	x0, [x0]
  9f03dc: 9ac00855     	udiv	x21, x2, x0
  9f03e0: 6b0102bf     	cmp	w21, w1
  9f03e4: 540001ad     	b.le	0x9f0418 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x628>
  9f03e8: 90002aa1     	adrp	x1, 0xf44000
  9f03ec: f9445021     	ldr	x1, [x1, #0x8a0]
  9f03f0: b40017a1     	cbz	x1, 0x9f06e4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x8f4>
  9f03f4: 91256333     	add	x19, x25, #0x958
  9f03f8: aa1303e0     	mov	x0, x19
  9f03fc: 97e6acb9     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f0400: 35002ae0     	cbnz	w0, 0x9f095c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb6c>
  9f0404: b9098335     	str	w21, [x25, #0x980]
  9f0408: aa1303e0     	mov	x0, x19
  9f040c: 97e6a9b5     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f0410: d1068300     	sub	x0, x24, #0x1a0
  9f0414: f9400000     	ldr	x0, [x0]
  9f0418: f9403ba1     	ldr	x1, [x29, #0x70]
  9f041c: eb01001f     	cmp	x0, x1
  9f0420: 54001368     	b.hi	0x9f068c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x89c>
  9f0424: f9403fa0     	ldr	x0, [x29, #0x78]
  9f0428: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f042c: f9400001     	ldr	x1, [x0]
  9f0430: d1006020     	sub	x0, x1, #0x18
  9f0434: eb02001f     	cmp	x0, x2
  9f0438: 54001941     	b.ne	0x9f0760 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x970>
  9f043c: f9403ba1     	ldr	x1, [x29, #0x70]
  9f0440: d1068300     	sub	x0, x24, #0x1a0
  9f0444: 91000421     	add	x1, x1, #0x1
  9f0448: f9003ba1     	str	x1, [x29, #0x70]
  9f044c: f9400000     	ldr	x0, [x0]
  9f0450: f94037a1     	ldr	x1, [x29, #0x68]
  9f0454: eb14001f     	cmp	x0, x20
  9f0458: 91019021     	add	x1, x1, #0x64
  9f045c: f90037a1     	str	x1, [x29, #0x68]
  9f0460: 54ffddc8     	b.hi	0x9f0018 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x228>
  9f0464: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f0468: 911ae000     	add	x0, x0, #0x6b8
  9f046c: 940069f9     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f0470: f9404fa0     	ldr	x0, [x29, #0x98]
  9f0474: 94023d85     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9f0478: 52800037     	mov	w23, #0x1               // =1
  9f047c: 17fffeb7     	b	0x9eff58 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x168>
  9f0480: 12800020     	mov	w0, #-0x2               // =-2
  9f0484: b9098320     	str	w0, [x25, #0x980]
  9f0488: 17fffead     	b	0x9eff3c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x14c>
  9f048c: 90002ab5     	adrp	x21, 0xf44000
  9f0490: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f0494: b4001480     	cbz	x0, 0x9f0724 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x934>
  9f0498: 91256334     	add	x20, x25, #0x958
  9f049c: aa1403e0     	mov	x0, x20
  9f04a0: 97e6ac90     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f04a4: 35002fc0     	cbnz	w0, 0x9f0a9c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xcac>
  9f04a8: 12800101     	mov	w1, #-0x9               // =-9
  9f04ac: aa1403e0     	mov	x0, x20
  9f04b0: b9098321     	str	w1, [x25, #0x980]
  9f04b4: 97e6a98b     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f04b8: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f04bc: d1042301     	sub	x1, x24, #0x108
  9f04c0: 9119c000     	add	x0, x0, #0x670
  9f04c4: 2a1303e2     	mov	w2, w19
  9f04c8: 940069e2     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f04cc: f9404fb3     	ldr	x19, [x29, #0x98]
  9f04d0: aa1303e0     	mov	x0, x19
  9f04d4: 94023d47     	bl	0xa7f9f0 <_ZN7cocos2d19unzCloseCurrentFileEPv>
  9f04d8: aa1303e0     	mov	x0, x19
  9f04dc: 94023d6b     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9f04e0: d1072300     	sub	x0, x24, #0x1c8
  9f04e4: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f04e8: f9400001     	ldr	x1, [x0]
  9f04ec: d1006020     	sub	x0, x1, #0x18
  9f04f0: eb02001f     	cmp	x0, x2
  9f04f4: 54001501     	b.ne	0x9f0794 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9a4>
  9f04f8: d1074300     	sub	x0, x24, #0x1d0
  9f04fc: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f0500: f9400013     	ldr	x19, [x0]
  9f0504: d1006260     	sub	x0, x19, #0x18
  9f0508: eb01001f     	cmp	x0, x1
  9f050c: 54ffd240     	b.eq	0x9eff54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x164>
  9f0510: f94452b5     	ldr	x21, [x21, #0x8a0]
  9f0514: b40019f5     	cbz	x21, 0x9f0850 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa60>
  9f0518: d1002273     	sub	x19, x19, #0x8
  9f051c: 885ffe61     	ldaxr	w1, [x19]
  9f0520: 51000422     	sub	w2, w1, #0x1
  9f0524: 8803fe62     	stlxr	w3, w2, [x19]
  9f0528: 35ffffa3     	cbnz	w3, 0x9f051c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x72c>
  9f052c: 6b1f003f     	cmp	w1, wzr
  9f0530: 54ffd12c     	b.gt	0x9eff54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x164>
  9f0534: d106e301     	sub	x1, x24, #0x1b8
  9f0538: 940768a1     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f053c: 17fffe86     	b	0x9eff54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x164>
  9f0540: d1068300     	sub	x0, x24, #0x1a0
  9f0544: f9403bb4     	ldr	x20, [x29, #0x70]
  9f0548: f9400000     	ldr	x0, [x0]
  9f054c: 17ffffb3     	b	0x9f0418 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x628>
  9f0550: f9403fa1     	ldr	x1, [x29, #0x78]
  9f0554: aa1703e0     	mov	x0, x23
  9f0558: f9400323     	ldr	x3, [x25]
  9f055c: d1070302     	sub	x2, x24, #0x1c0
  9f0560: f9400021     	ldr	x1, [x1]
  9f0564: f9408873     	ldr	x19, [x3, #0x110]
  9f0568: 94075a9a     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f056c: aa1903e0     	mov	x0, x25
  9f0570: aa1703e1     	mov	x1, x23
  9f0574: d63f0260     	blr	x19
  9f0578: f94002e1     	ldr	x1, [x23]
  9f057c: 53001c13     	uxtb	w19, w0
  9f0580: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0584: d1006020     	sub	x0, x1, #0x18
  9f0588: eb02001f     	cmp	x0, x2
  9f058c: 54000b01     	b.ne	0x9f06ec <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x8fc>
  9f0590: 35fff153     	cbnz	w19, 0x9f03b8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x5c8>
  9f0594: 90002ab5     	adrp	x21, 0xf44000
  9f0598: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f059c: b4001d20     	cbz	x0, 0x9f0940 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb50>
  9f05a0: 91256333     	add	x19, x25, #0x958
  9f05a4: aa1303e0     	mov	x0, x19
  9f05a8: 97e6ac4e     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f05ac: 35002460     	cbnz	w0, 0x9f0a38 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc48>
  9f05b0: 12800061     	mov	w1, #-0x4               // =-4
  9f05b4: aa1303e0     	mov	x0, x19
  9f05b8: b9098321     	str	w1, [x25, #0x980]
  9f05bc: 97e6a949     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f05c0: d1074301     	sub	x1, x24, #0x1d0
  9f05c4: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f05c8: 91184000     	add	x0, x0, #0x610
  9f05cc: f9400021     	ldr	x1, [x1]
  9f05d0: 940069a0     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f05d4: f9404fa0     	ldr	x0, [x29, #0x98]
  9f05d8: 94023d2c     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9f05dc: 17ffffc7     	b	0x9f04f8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x708>
  9f05e0: 90002aa0     	adrp	x0, 0xf44000
  9f05e4: f9445000     	ldr	x0, [x0, #0x8a0]
  9f05e8: b4000ac0     	cbz	x0, 0x9f0740 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x950>
  9f05ec: d1002294     	sub	x20, x20, #0x8
  9f05f0: 885ffe80     	ldaxr	w0, [x20]
  9f05f4: 51000401     	sub	w1, w0, #0x1
  9f05f8: 8802fe81     	stlxr	w2, w1, [x20]
  9f05fc: 35ffffa2     	cbnz	w2, 0x9f05f0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x800>
  9f0600: 6b1f001f     	cmp	w0, wzr
  9f0604: 54ffcbac     	b.gt	0x9eff78 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x188>
  9f0608: aa1503e0     	mov	x0, x21
  9f060c: d1064301     	sub	x1, x24, #0x190
  9f0610: 9407686b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0614: 17fffe59     	b	0x9eff78 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x188>
  9f0618: 90002aa2     	adrp	x2, 0xf44000
  9f061c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f0620: b4000982     	cbz	x2, 0x9f0750 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x960>
  9f0624: d1002021     	sub	x1, x1, #0x8
  9f0628: 885ffc22     	ldaxr	w2, [x1]
  9f062c: 51000443     	sub	w3, w2, #0x1
  9f0630: 8804fc23     	stlxr	w4, w3, [x1]
  9f0634: 35ffffa4     	cbnz	w4, 0x9f0628 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x838>
  9f0638: 6b1f005f     	cmp	w2, wzr
  9f063c: 54ffc50c     	b.gt	0x9efedc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xec>
  9f0640: d1068301     	sub	x1, x24, #0x1a0
  9f0644: 9407685e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0648: 17fffe25     	b	0x9efedc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xec>
  9f064c: 90002aa2     	adrp	x2, 0xf44000
  9f0650: f9445042     	ldr	x2, [x2, #0x8a0]
  9f0654: b40006e2     	cbz	x2, 0x9f0730 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x940>
  9f0658: d1002021     	sub	x1, x1, #0x8
  9f065c: 885ffc22     	ldaxr	w2, [x1]
  9f0660: 51000443     	sub	w3, w2, #0x1
  9f0664: 8804fc23     	stlxr	w4, w3, [x1]
  9f0668: 35ffffa4     	cbnz	w4, 0x9f065c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x86c>
  9f066c: 6b1f005f     	cmp	w2, wzr
  9f0670: 54ffc0ac     	b.gt	0x9efe84 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x94>
  9f0674: d1068301     	sub	x1, x24, #0x1a0
  9f0678: 94076851     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f067c: 17fffe02     	b	0x9efe84 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x94>
  9f0680: 12800000     	mov	w0, #-0x1               // =-1
  9f0684: b9098320     	str	w0, [x25, #0x980]
  9f0688: 17fffef4     	b	0x9f0258 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x468>
  9f068c: f9404fa0     	ldr	x0, [x29, #0x98]
  9f0690: 94023b11     	bl	0xa7f2d4 <_ZN7cocos2d15unzGoToNextFileEPv>
  9f0694: 34ffec80     	cbz	w0, 0x9f0424 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x634>
  9f0698: 90002ab5     	adrp	x21, 0xf44000
  9f069c: 91256333     	add	x19, x25, #0x958
  9f06a0: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f06a4: b4001f20     	cbz	x0, 0x9f0a88 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc98>
  9f06a8: aa1303e0     	mov	x0, x19
  9f06ac: 97e6ac0d     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f06b0: 35001ea0     	cbnz	w0, 0x9f0a84 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc94>
  9f06b4: 12800121     	mov	w1, #-0xa               // =-10
  9f06b8: aa1303e0     	mov	x0, x19
  9f06bc: b9098321     	str	w1, [x25, #0x980]
  9f06c0: 97e6a908     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f06c4: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f06c8: 911a8000     	add	x0, x0, #0x6a0
  9f06cc: 94006961     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f06d0: 17ffffc1     	b	0x9f05d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x7e4>
  9f06d4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f06d8: 51000443     	sub	w3, w2, #0x1
  9f06dc: b81f8023     	stur	w3, [x1, #-0x8]
  9f06e0: 17fffeeb     	b	0x9f028c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x49c>
  9f06e4: b9098335     	str	w21, [x25, #0x980]
  9f06e8: 17ffff4c     	b	0x9f0418 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x628>
  9f06ec: 90002aa2     	adrp	x2, 0xf44000
  9f06f0: f9445042     	ldr	x2, [x2, #0x8a0]
  9f06f4: b4001042     	cbz	x2, 0x9f08fc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb0c>
  9f06f8: d1002021     	sub	x1, x1, #0x8
  9f06fc: 885ffc22     	ldaxr	w2, [x1]
  9f0700: 51000443     	sub	w3, w2, #0x1
  9f0704: 8804fc23     	stlxr	w4, w3, [x1]
  9f0708: 35ffffa4     	cbnz	w4, 0x9f06fc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x90c>
  9f070c: 6b1f005f     	cmp	w2, wzr
  9f0710: 54fff40c     	b.gt	0x9f0590 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x7a0>
  9f0714: f9404ba1     	ldr	x1, [x29, #0x90]
  9f0718: 94076829     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f071c: 35ffe4f3     	cbnz	w19, 0x9f03b8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x5c8>
  9f0720: 17ffff9d     	b	0x9f0594 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x7a4>
  9f0724: 12800100     	mov	w0, #-0x9               // =-9
  9f0728: b9098320     	str	w0, [x25, #0x980]
  9f072c: 17ffff63     	b	0x9f04b8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6c8>
  9f0730: b85f8022     	ldur	w2, [x1, #-0x8]
  9f0734: 51000443     	sub	w3, w2, #0x1
  9f0738: b81f8023     	stur	w3, [x1, #-0x8]
  9f073c: 17ffffcc     	b	0x9f066c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x87c>
  9f0740: b85f8280     	ldur	w0, [x20, #-0x8]
  9f0744: 51000401     	sub	w1, w0, #0x1
  9f0748: b81f8281     	stur	w1, [x20, #-0x8]
  9f074c: 17ffffad     	b	0x9f0600 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x810>
  9f0750: b85f8022     	ldur	w2, [x1, #-0x8]
  9f0754: 51000443     	sub	w3, w2, #0x1
  9f0758: b81f8023     	stur	w3, [x1, #-0x8]
  9f075c: 17ffffb7     	b	0x9f0638 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x848>
  9f0760: 90002aa2     	adrp	x2, 0xf44000
  9f0764: f9445042     	ldr	x2, [x2, #0x8a0]
  9f0768: b40006c2     	cbz	x2, 0x9f0840 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa50>
  9f076c: d1002021     	sub	x1, x1, #0x8
  9f0770: 885ffc22     	ldaxr	w2, [x1]
  9f0774: 51000443     	sub	w3, w2, #0x1
  9f0778: 8804fc23     	stlxr	w4, w3, [x1]
  9f077c: 35ffffa4     	cbnz	w4, 0x9f0770 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x980>
  9f0780: 6b1f005f     	cmp	w2, wzr
  9f0784: 54ffe5cc     	b.gt	0x9f043c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x64c>
  9f0788: f9404ba1     	ldr	x1, [x29, #0x90]
  9f078c: 9407680c     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0790: 17ffff2b     	b	0x9f043c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x64c>
  9f0794: f94452a2     	ldr	x2, [x21, #0x8a0]
  9f0798: b4000aa2     	cbz	x2, 0x9f08ec <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xafc>
  9f079c: d1002021     	sub	x1, x1, #0x8
  9f07a0: 885ffc22     	ldaxr	w2, [x1]
  9f07a4: 51000443     	sub	w3, w2, #0x1
  9f07a8: 8804fc23     	stlxr	w4, w3, [x1]
  9f07ac: 35ffffa4     	cbnz	w4, 0x9f07a0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9b0>
  9f07b0: 6b1f005f     	cmp	w2, wzr
  9f07b4: 54ffea2c     	b.gt	0x9f04f8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x708>
  9f07b8: d106e301     	sub	x1, x24, #0x1b8
  9f07bc: 94076800     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f07c0: 17ffff4e     	b	0x9f04f8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x708>
  9f07c4: 90002aa2     	adrp	x2, 0xf44000
  9f07c8: 91004003     	add	x3, x0, #0x10
  9f07cc: f9445042     	ldr	x2, [x2, #0x8a0]
  9f07d0: b40009e2     	cbz	x2, 0x9f090c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb1c>
  9f07d4: 885ffc62     	ldaxr	w2, [x3]
  9f07d8: 51000441     	sub	w1, w2, #0x1
  9f07dc: 8804fc61     	stlxr	w4, w1, [x3]
  9f07e0: 35ffffa4     	cbnz	w4, 0x9f07d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9e4>
  9f07e4: 6b1f005f     	cmp	w2, wzr
  9f07e8: 54ffde8c     	b.gt	0x9f03b8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x5c8>
  9f07ec: f9404ba1     	ldr	x1, [x29, #0x90]
  9f07f0: 940767f3     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f07f4: 17fffef1     	b	0x9f03b8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x5c8>
  9f07f8: 12800080     	mov	w0, #-0x5               // =-5
  9f07fc: b9098320     	str	w0, [x25, #0x980]
  9f0800: 17fffe74     	b	0x9f01d0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x3e0>
  9f0804: 90002aa0     	adrp	x0, 0xf44000
  9f0808: f9445000     	ldr	x0, [x0, #0x8a0]
  9f080c: b4000880     	cbz	x0, 0x9f091c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb2c>
  9f0810: 91256333     	add	x19, x25, #0x958
  9f0814: aa1303e0     	mov	x0, x19
  9f0818: 97e6abb2     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f081c: 350013c0     	cbnz	w0, 0x9f0a94 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xca4>
  9f0820: 12800041     	mov	w1, #-0x3               // =-3
  9f0824: aa1303e0     	mov	x0, x19
  9f0828: b9098321     	str	w1, [x25, #0x980]
  9f082c: 97e6a8ad     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f0830: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f0834: 9117e000     	add	x0, x0, #0x5f8
  9f0838: 94006906     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f083c: 17fffdc4     	b	0x9eff4c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x15c>
  9f0840: b85f8022     	ldur	w2, [x1, #-0x8]
  9f0844: 51000443     	sub	w3, w2, #0x1
  9f0848: b81f8023     	stur	w3, [x1, #-0x8]
  9f084c: 17ffffcd     	b	0x9f0780 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x990>
  9f0850: b85f8261     	ldur	w1, [x19, #-0x8]
  9f0854: 51000422     	sub	w2, w1, #0x1
  9f0858: b81f8262     	stur	w2, [x19, #-0x8]
  9f085c: 17ffff34     	b	0x9f052c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x73c>
  9f0860: 90002ab5     	adrp	x21, 0xf44000
  9f0864: 91256333     	add	x19, x25, #0x958
  9f0868: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f086c: b4000640     	cbz	x0, 0x9f0934 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb44>
  9f0870: aa1303e0     	mov	x0, x19
  9f0874: 97e6ab9b     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f0878: 35000de0     	cbnz	w0, 0x9f0a34 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc44>
  9f087c: 128000a1     	mov	w1, #-0x6               // =-6
  9f0880: aa1303e0     	mov	x0, x19
  9f0884: b9098321     	str	w1, [x25, #0x980]
  9f0888: 97e6a896     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f088c: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f0890: d1042301     	sub	x1, x24, #0x108
  9f0894: 9118c000     	add	x0, x0, #0x630
  9f0898: 940068ee     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f089c: f9404fa0     	ldr	x0, [x29, #0x98]
  9f08a0: 94023c7a     	bl	0xa7fa88 <_ZN7cocos2d8unzCloseEPv>
  9f08a4: 17ffff0f     	b	0x9f04e0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6f0>
  9f08a8: 90002ab5     	adrp	x21, 0xf44000
  9f08ac: 91256333     	add	x19, x25, #0x958
  9f08b0: f94452a0     	ldr	x0, [x21, #0x8a0]
  9f08b4: b40003a0     	cbz	x0, 0x9f0928 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb38>
  9f08b8: aa1303e0     	mov	x0, x19
  9f08bc: 97e6ab89     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f08c0: 35000ec0     	cbnz	w0, 0x9f0a98 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xca8>
  9f08c4: 128000c1     	mov	w1, #-0x7               // =-7
  9f08c8: aa1303e0     	mov	x0, x19
  9f08cc: b9098321     	str	w1, [x25, #0x980]
  9f08d0: 97e6a884     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f08d4: d1074301     	sub	x1, x24, #0x1d0
  9f08d8: f0001360     	adrp	x0, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f08dc: 91192000     	add	x0, x0, #0x648
  9f08e0: f9400021     	ldr	x1, [x1]
  9f08e4: 940068db     	bl	0xa0ac50 <_ZN7cocos2d3logEPKcz>
  9f08e8: 17fffef9     	b	0x9f04cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x6dc>
  9f08ec: b85f8022     	ldur	w2, [x1, #-0x8]
  9f08f0: 51000443     	sub	w3, w2, #0x1
  9f08f4: b81f8023     	stur	w3, [x1, #-0x8]
  9f08f8: 17ffffae     	b	0x9f07b0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9c0>
  9f08fc: b85f8022     	ldur	w2, [x1, #-0x8]
  9f0900: 51000443     	sub	w3, w2, #0x1
  9f0904: b81f8023     	stur	w3, [x1, #-0x8]
  9f0908: 17ffff81     	b	0x9f070c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x91c>
  9f090c: b85f8022     	ldur	w2, [x1, #-0x8]
  9f0910: 51000443     	sub	w3, w2, #0x1
  9f0914: b81f8023     	stur	w3, [x1, #-0x8]
  9f0918: 17ffffb3     	b	0x9f07e4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x9f4>
  9f091c: 12800040     	mov	w0, #-0x3               // =-3
  9f0920: b9098320     	str	w0, [x25, #0x980]
  9f0924: 17ffffc3     	b	0x9f0830 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa40>
  9f0928: 128000c0     	mov	w0, #-0x7               // =-7
  9f092c: b9098320     	str	w0, [x25, #0x980]
  9f0930: 17ffffe9     	b	0x9f08d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xae4>
  9f0934: 128000a0     	mov	w0, #-0x6               // =-6
  9f0938: b9098320     	str	w0, [x25, #0x980]
  9f093c: 17ffffd4     	b	0x9f088c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xa9c>
  9f0940: 12800060     	mov	w0, #-0x4               // =-4
  9f0944: b9098320     	str	w0, [x25, #0x980]
  9f0948: 17ffff1e     	b	0x9f05c0 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x7d0>
  9f094c: b85f8281     	ldur	w1, [x20, #-0x8]
  9f0950: 51000422     	sub	w2, w1, #0x1
  9f0954: b81f8282     	stur	w2, [x20, #-0x8]
  9f0958: 17fffe30     	b	0x9f0218 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x428>
  9f095c: 940753fb     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0960: 940753fa     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0964: 940753f9     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0968: d1070301     	sub	x1, x24, #0x1c0
  9f096c: aa0003f3     	mov	x19, x0
  9f0970: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0974: f9400020     	ldr	x0, [x1]
  9f0978: d1006000     	sub	x0, x0, #0x18
  9f097c: eb02001f     	cmp	x0, x2
  9f0980: 54000060     	b.eq	0x9f098c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb9c>
  9f0984: d106e301     	sub	x1, x24, #0x1b8
  9f0988: 97e6babe     	bl	0x39f480 <.text+0x3170>
  9f098c: d1072300     	sub	x0, x24, #0x1c8
  9f0990: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f0994: f9400000     	ldr	x0, [x0]
  9f0998: d1006000     	sub	x0, x0, #0x18
  9f099c: eb01001f     	cmp	x0, x1
  9f09a0: 54000060     	b.eq	0x9f09ac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbbc>
  9f09a4: d1078301     	sub	x1, x24, #0x1e0
  9f09a8: 97e6bab6     	bl	0x39f480 <.text+0x3170>
  9f09ac: d1074300     	sub	x0, x24, #0x1d0
  9f09b0: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f09b4: f9400000     	ldr	x0, [x0]
  9f09b8: d1006000     	sub	x0, x0, #0x18
  9f09bc: eb01001f     	cmp	x0, x1
  9f09c0: 54000060     	b.eq	0x9f09cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbdc>
  9f09c4: d1078301     	sub	x1, x24, #0x1e0
  9f09c8: 97e6baae     	bl	0x39f480 <.text+0x3170>
  9f09cc: d106c300     	sub	x0, x24, #0x1b0
  9f09d0: 94008f74     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  9f09d4: d1076314     	sub	x20, x24, #0x1d8
  9f09d8: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f09dc: f9400280     	ldr	x0, [x20]
  9f09e0: d1006000     	sub	x0, x0, #0x18
  9f09e4: eb16001f     	cmp	x0, x22
  9f09e8: 54000060     	b.eq	0x9f09f4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc04>
  9f09ec: d1074301     	sub	x1, x24, #0x1d0
  9f09f0: 97e6baa4     	bl	0x39f480 <.text+0x3170>
  9f09f4: aa1303e0     	mov	x0, x19
  9f09f8: 9407c93a     	bl	0xbe2ee0 <_Unwind_Resume>
  9f09fc: aa0003f3     	mov	x19, x0
  9f0a00: 17ffffe3     	b	0x9f098c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb9c>
  9f0a04: aa0003f3     	mov	x19, x0
  9f0a08: 17ffffe9     	b	0x9f09ac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbbc>
  9f0a0c: d1074301     	sub	x1, x24, #0x1d0
  9f0a10: aa0003f3     	mov	x19, x0
  9f0a14: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0a18: f9400020     	ldr	x0, [x1]
  9f0a1c: d1006000     	sub	x0, x0, #0x18
  9f0a20: eb02001f     	cmp	x0, x2
  9f0a24: 54fffd40     	b.eq	0x9f09cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbdc>
  9f0a28: d106e301     	sub	x1, x24, #0x1b8
  9f0a2c: 97e6ba95     	bl	0x39f480 <.text+0x3170>
  9f0a30: 17ffffe7     	b	0x9f09cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbdc>
  9f0a34: 940753c5     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0a38: 940753c4     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0a3c: d106e301     	sub	x1, x24, #0x1b8
  9f0a40: aa0003f3     	mov	x19, x0
  9f0a44: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0a48: f9400020     	ldr	x0, [x1]
  9f0a4c: d1006000     	sub	x0, x0, #0x18
  9f0a50: eb02001f     	cmp	x0, x2
  9f0a54: 54000060     	b.eq	0x9f0a60 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc70>
  9f0a58: d1070301     	sub	x1, x24, #0x1c0
  9f0a5c: 97e6ba89     	bl	0x39f480 <.text+0x3170>
  9f0a60: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f0a64: d1006280     	sub	x0, x20, #0x18
  9f0a68: eb01001f     	cmp	x0, x1
  9f0a6c: 54fff900     	b.eq	0x9f098c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb9c>
  9f0a70: d1070301     	sub	x1, x24, #0x1c0
  9f0a74: 97e6ba83     	bl	0x39f480 <.text+0x3170>
  9f0a78: 17ffffc5     	b	0x9f098c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xb9c>
  9f0a7c: aa0003f3     	mov	x19, x0
  9f0a80: 17fffff8     	b	0x9f0a60 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc70>
  9f0a84: 940753b1     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0a88: 12800120     	mov	w0, #-0xa               // =-10
  9f0a8c: b9098320     	str	w0, [x25, #0x980]
  9f0a90: 17ffff0d     	b	0x9f06c4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x8d4>
  9f0a94: 940753ad     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0a98: 940753ac     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0a9c: 940753ab     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0aa0: d1072301     	sub	x1, x24, #0x1c8
  9f0aa4: aa0003f3     	mov	x19, x0
  9f0aa8: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0aac: f9400020     	ldr	x0, [x1]
  9f0ab0: d1006000     	sub	x0, x0, #0x18
  9f0ab4: eb02001f     	cmp	x0, x2
  9f0ab8: 54fff7a0     	b.eq	0x9f09ac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbbc>
  9f0abc: d106e301     	sub	x1, x24, #0x1b8
  9f0ac0: 97e6ba70     	bl	0x39f480 <.text+0x3170>
  9f0ac4: 17ffffba     	b	0x9f09ac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbbc>
  9f0ac8: aa0003f3     	mov	x19, x0
  9f0acc: 17ffffc2     	b	0x9f09d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbe4>
  9f0ad0: d1064301     	sub	x1, x24, #0x190
  9f0ad4: aa0003f3     	mov	x19, x0
  9f0ad8: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f0adc: f9400020     	ldr	x0, [x1]
  9f0ae0: d1006000     	sub	x0, x0, #0x18
  9f0ae4: eb02001f     	cmp	x0, x2
  9f0ae8: 54fff760     	b.eq	0x9f09d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbe4>
  9f0aec: d1068301     	sub	x1, x24, #0x1a0
  9f0af0: 97e6ba64     	bl	0x39f480 <.text+0x3170>
  9f0af4: 17ffffb8     	b	0x9f09d4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbe4>
  9f0af8: d1064301     	sub	x1, x24, #0x190
  9f0afc: aa0003f3     	mov	x19, x0
  9f0b00: f9400020     	ldr	x0, [x1]
  9f0b04: b0002ac1     	adrp	x1, 0xf49000
  9f0b08: d1006000     	sub	x0, x0, #0x18
  9f0b0c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0b10: eb01001f     	cmp	x0, x1
  9f0b14: 54fff700     	b.eq	0x9f09f4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc04>
  9f0b18: d1068301     	sub	x1, x24, #0x1a0
  9f0b1c: 97e6ba59     	bl	0x39f480 <.text+0x3170>
  9f0b20: 17ffffb5     	b	0x9f09f4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xc04>
  9f0b24: 94075389     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>
  9f0b28: 97e6aa1e     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f0b2c: aa0003f3     	mov	x19, x0
  9f0b30: 17ffffa7     	b	0x9f09cc <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xbdc>
  9f0b34: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f0b38: 910003fd     	mov	x29, sp
  9f0b3c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f0b40: 90002a93     	adrp	x19, 0xf40000
  9f0b44: f9001bf7     	str	x23, [sp, #0x30]
  9f0b48: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f0b4c: aa0103f5     	mov	x21, x1
  9f0b50: b9400801     	ldr	w1, [x0, #0x8]
  9f0b54: f940e662     	ldr	x2, [x19, #0x1c8]
  9f0b58: aa0003f6     	mov	x22, x0
  9f0b5c: 71001c3f     	cmp	w1, #0x7
  9f0b60: f9400042     	ldr	x2, [x2]
  9f0b64: f9002fa2     	str	x2, [x29, #0x58]
  9f0b68: 54000820     	b.eq	0x9f0c6c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe7c>
  9f0b6c: 7100083f     	cmp	w1, #0x2
  9f0b70: 54000bc0     	b.eq	0x9f0ce8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xef8>
  9f0b74: 51001022     	sub	w2, w1, #0x4
  9f0b78: 7100045f     	cmp	w2, #0x1
  9f0b7c: 540002e9     	b.ls	0x9f0bd8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xde8>
  9f0b80: 7100183f     	cmp	w1, #0x6
  9f0b84: 54000580     	b.eq	0x9f0c34 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe44>
  9f0b88: 7100203f     	cmp	w1, #0x8
  9f0b8c: 54001000     	b.eq	0x9f0d8c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xf9c>
  9f0b90: 7100243f     	cmp	w1, #0x9
  9f0b94: d2800001     	mov	x1, #0x0                // =0
  9f0b98: 540000a1     	b.ne	0x9f0bac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xdbc>
  9f0b9c: 94011a59     	bl	0xa37500 <_ZNK7cocos2d5Value10asValueMapEv>
  9f0ba0: aa1503e1     	mov	x1, x21
  9f0ba4: 940000b1     	bl	0x9f0e68 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1078>
  9f0ba8: aa0003e1     	mov	x1, x0
  9f0bac: f940e673     	ldr	x19, [x19, #0x1c8]
  9f0bb0: aa0103e0     	mov	x0, x1
  9f0bb4: f9402fa2     	ldr	x2, [x29, #0x58]
  9f0bb8: f9400261     	ldr	x1, [x19]
  9f0bbc: eb01005f     	cmp	x2, x1
  9f0bc0: 54001361     	b.ne	0x9f0e2c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x103c>
  9f0bc4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f0bc8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f0bcc: f9401bf7     	ldr	x23, [sp, #0x30]
  9f0bd0: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f0bd4: d65f03c0     	ret
  9f0bd8: b0001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f0bdc: aa1503e0     	mov	x0, x21
  9f0be0: 91088021     	add	x1, x1, #0x220
  9f0be4: 940229ba     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0be8: aa0003f4     	mov	x20, x0
  9f0bec: 910143a8     	add	x8, x29, #0x50
  9f0bf0: aa1603e0     	mov	x0, x22
  9f0bf4: 94011892     	bl	0xa36e3c <_ZNK7cocos2d5Value8asStringEv>
  9f0bf8: f9402ba1     	ldr	x1, [x29, #0x50]
  9f0bfc: aa1503e0     	mov	x0, x21
  9f0c00: 94022aba     	bl	0xa7b6e8 <_ZN8tinyxml211XMLDocument7NewTextEPKc>
  9f0c04: b0002ac1     	adrp	x1, 0xf49000
  9f0c08: f9402ba2     	ldr	x2, [x29, #0x50]
  9f0c0c: aa0003f5     	mov	x21, x0
  9f0c10: d1006040     	sub	x0, x2, #0x18
  9f0c14: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0c18: eb01001f     	cmp	x0, x1
  9f0c1c: 54000e61     	b.ne	0x9f0de8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xff8>
  9f0c20: aa1503e1     	mov	x1, x21
  9f0c24: aa1403e0     	mov	x0, x20
  9f0c28: 940221c8     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0c2c: aa1403e1     	mov	x1, x20
  9f0c30: 17ffffdf     	b	0x9f0bac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xdbc>
  9f0c34: 910143a8     	add	x8, x29, #0x50
  9f0c38: 94011881     	bl	0xa36e3c <_ZNK7cocos2d5Value8asStringEv>
  9f0c3c: f9402ba1     	ldr	x1, [x29, #0x50]
  9f0c40: aa1503e0     	mov	x0, x21
  9f0c44: 940229a2     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0c48: b0002ac1     	adrp	x1, 0xf49000
  9f0c4c: f9402ba2     	ldr	x2, [x29, #0x50]
  9f0c50: aa0003f4     	mov	x20, x0
  9f0c54: d1006040     	sub	x0, x2, #0x18
  9f0c58: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0c5c: eb01001f     	cmp	x0, x1
  9f0c60: 540007a1     	b.ne	0x9f0d54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xf64>
  9f0c64: aa1403e1     	mov	x1, x20
  9f0c68: 17ffffd1     	b	0x9f0bac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xdbc>
  9f0c6c: 90001561     	adrp	x1, 0xc9c000 <ECDH_version+0x100>
  9f0c70: aa1503e0     	mov	x0, x21
  9f0c74: 911cc021     	add	x1, x1, #0x730
  9f0c78: 94022995     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0c7c: aa0003f4     	mov	x20, x0
  9f0c80: 910143a8     	add	x8, x29, #0x50
  9f0c84: aa1603e0     	mov	x0, x22
  9f0c88: 9401186d     	bl	0xa36e3c <_ZNK7cocos2d5Value8asStringEv>
  9f0c8c: f9402ba1     	ldr	x1, [x29, #0x50]
  9f0c90: aa1503e0     	mov	x0, x21
  9f0c94: 94022a95     	bl	0xa7b6e8 <_ZN8tinyxml211XMLDocument7NewTextEPKc>
  9f0c98: b0002ac1     	adrp	x1, 0xf49000
  9f0c9c: f9402ba2     	ldr	x2, [x29, #0x50]
  9f0ca0: aa0003f5     	mov	x21, x0
  9f0ca4: d1006040     	sub	x0, x2, #0x18
  9f0ca8: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0cac: eb01001f     	cmp	x0, x1
  9f0cb0: 54fffb80     	b.eq	0x9f0c20 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe30>
  9f0cb4: 90002aa1     	adrp	x1, 0xf44000
  9f0cb8: f9445021     	ldr	x1, [x1, #0x8a0]
  9f0cbc: b4000a81     	cbz	x1, 0x9f0e0c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x101c>
  9f0cc0: d1002042     	sub	x2, x2, #0x8
  9f0cc4: 885ffc41     	ldaxr	w1, [x2]
  9f0cc8: 51000423     	sub	w3, w1, #0x1
  9f0ccc: 8804fc43     	stlxr	w4, w3, [x2]
  9f0cd0: 35ffffa4     	cbnz	w4, 0x9f0cc4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xed4>
  9f0cd4: 6b1f003f     	cmp	w1, wzr
  9f0cd8: 54fffa4c     	b.gt	0x9f0c20 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe30>
  9f0cdc: 910123a1     	add	x1, x29, #0x48
  9f0ce0: 940766b7     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0ce4: 17ffffcf     	b	0x9f0c20 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe30>
  9f0ce8: d00014c1     	adrp	x1, 0xc8a000 <EVP_version+0x1d20>
  9f0cec: aa1503e0     	mov	x0, x21
  9f0cf0: 9117c021     	add	x1, x1, #0x5f0
  9f0cf4: 94022976     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0cf8: aa0003f4     	mov	x20, x0
  9f0cfc: 910143a8     	add	x8, x29, #0x50
  9f0d00: aa1603e0     	mov	x0, x22
  9f0d04: 9401184e     	bl	0xa36e3c <_ZNK7cocos2d5Value8asStringEv>
  9f0d08: f9402ba1     	ldr	x1, [x29, #0x50]
  9f0d0c: aa1503e0     	mov	x0, x21
  9f0d10: 94022a76     	bl	0xa7b6e8 <_ZN8tinyxml211XMLDocument7NewTextEPKc>
  9f0d14: b0002ac1     	adrp	x1, 0xf49000
  9f0d18: f9402ba2     	ldr	x2, [x29, #0x50]
  9f0d1c: aa0003f5     	mov	x21, x0
  9f0d20: d1006040     	sub	x0, x2, #0x18
  9f0d24: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0d28: eb01001f     	cmp	x0, x1
  9f0d2c: 54fff7a0     	b.eq	0x9f0c20 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe30>
  9f0d30: 90002aa1     	adrp	x1, 0xf44000
  9f0d34: f9445021     	ldr	x1, [x1, #0x8a0]
  9f0d38: b40006a1     	cbz	x1, 0x9f0e0c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x101c>
  9f0d3c: d1002042     	sub	x2, x2, #0x8
  9f0d40: 885ffc41     	ldaxr	w1, [x2]
  9f0d44: 51000423     	sub	w3, w1, #0x1
  9f0d48: 8804fc43     	stlxr	w4, w3, [x2]
  9f0d4c: 34fffc44     	cbz	w4, 0x9f0cd4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xee4>
  9f0d50: 17fffffc     	b	0x9f0d40 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xf50>
  9f0d54: 90002aa1     	adrp	x1, 0xf44000
  9f0d58: f9445021     	ldr	x1, [x1, #0x8a0]
  9f0d5c: b4000601     	cbz	x1, 0x9f0e1c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x102c>
  9f0d60: d1002042     	sub	x2, x2, #0x8
  9f0d64: 885ffc41     	ldaxr	w1, [x2]
  9f0d68: 51000423     	sub	w3, w1, #0x1
  9f0d6c: 8804fc43     	stlxr	w4, w3, [x2]
  9f0d70: 35ffffa4     	cbnz	w4, 0x9f0d64 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xf74>
  9f0d74: 6b1f003f     	cmp	w1, wzr
  9f0d78: 54fff76c     	b.gt	0x9f0c64 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe74>
  9f0d7c: 910123a1     	add	x1, x29, #0x48
  9f0d80: 9407668f     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f0d84: aa1403e1     	mov	x1, x20
  9f0d88: 17ffff89     	b	0x9f0bac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xdbc>
  9f0d8c: 940119d9     	bl	0xa374f0 <_ZNK7cocos2d5Value13asValueVectorEv>
  9f0d90: aa0003f7     	mov	x23, x0
  9f0d94: d0001361     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9f0d98: aa1503e0     	mov	x0, x21
  9f0d9c: 91280021     	add	x1, x1, #0xa00
  9f0da0: 9402294b     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0da4: f94002f6     	ldr	x22, [x23]
  9f0da8: f94006f7     	ldr	x23, [x23, #0x8]
  9f0dac: aa0003f4     	mov	x20, x0
  9f0db0: eb1702df     	cmp	x22, x23
  9f0db4: 54fff580     	b.eq	0x9f0c64 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xe74>
  9f0db8: aa1503e1     	mov	x1, x21
  9f0dbc: aa1603e0     	mov	x0, x22
  9f0dc0: 97ffff5d     	bl	0x9f0b34 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xd44>
  9f0dc4: aa0003e1     	mov	x1, x0
  9f0dc8: b4000060     	cbz	x0, 0x9f0dd4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xfe4>
  9f0dcc: aa1403e0     	mov	x0, x20
  9f0dd0: 9402215e     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0dd4: 910042d6     	add	x22, x22, #0x10
  9f0dd8: eb1602ff     	cmp	x23, x22
  9f0ddc: 54fffee1     	b.ne	0x9f0db8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xfc8>
  9f0de0: aa1403e1     	mov	x1, x20
  9f0de4: 17ffff72     	b	0x9f0bac <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xdbc>
  9f0de8: 90002aa1     	adrp	x1, 0xf44000
  9f0dec: f9445021     	ldr	x1, [x1, #0x8a0]
  9f0df0: b40000e1     	cbz	x1, 0x9f0e0c <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x101c>
  9f0df4: d1002042     	sub	x2, x2, #0x8
  9f0df8: 885ffc41     	ldaxr	w1, [x2]
  9f0dfc: 51000423     	sub	w3, w1, #0x1
  9f0e00: 8804fc43     	stlxr	w4, w3, [x2]
  9f0e04: 34fff684     	cbz	w4, 0x9f0cd4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xee4>
  9f0e08: 17fffffc     	b	0x9f0df8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1008>
  9f0e0c: b85f8041     	ldur	w1, [x2, #-0x8]
  9f0e10: 51000423     	sub	w3, w1, #0x1
  9f0e14: b81f8043     	stur	w3, [x2, #-0x8]
  9f0e18: 17ffffaf     	b	0x9f0cd4 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xee4>
  9f0e1c: b85f8041     	ldur	w1, [x2, #-0x8]
  9f0e20: 51000423     	sub	w3, w1, #0x1
  9f0e24: b81f8043     	stur	w3, [x2, #-0x8]
  9f0e28: 17ffffd3     	b	0x9f0d74 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xf84>
  9f0e2c: 97e6a95d     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f0e30: b0002ac1     	adrp	x1, 0xf49000
  9f0e34: aa0003f3     	mov	x19, x0
  9f0e38: f9402ba0     	ldr	x0, [x29, #0x50]
  9f0e3c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f0e40: d1006000     	sub	x0, x0, #0x18
  9f0e44: eb01001f     	cmp	x0, x1
  9f0e48: 54000060     	b.eq	0x9f0e54 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1064>
  9f0e4c: 910123a1     	add	x1, x29, #0x48
  9f0e50: 97e6b98c     	bl	0x39f480 <.text+0x3170>
  9f0e54: aa1303e0     	mov	x0, x19
  9f0e58: 9407c822     	bl	0xbe2ee0 <_Unwind_Resume>
  9f0e5c: 17fffff5     	b	0x9f0e30 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1040>
  9f0e60: 17fffff4     	b	0x9f0e30 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1040>
  9f0e64: 17fffff3     	b	0x9f0e30 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1040>
  9f0e68: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f0e6c: 910003fd     	mov	x29, sp
  9f0e70: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f0e74: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f0e78: aa0003f3     	mov	x19, x0
  9f0e7c: aa0103f5     	mov	x21, x1
  9f0e80: aa0103e0     	mov	x0, x1
  9f0e84: f00013a1     	adrp	x1, 0xc67000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x3c10>
  9f0e88: 91354021     	add	x1, x1, #0xd50
  9f0e8c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f0e90: 9402290f     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0e94: f9400a73     	ldr	x19, [x19, #0x10]
  9f0e98: 900014d8     	adrp	x24, 0xc88000 <lh_version+0x310>
  9f0e9c: aa0003f7     	mov	x23, x0
  9f0ea0: 911d4318     	add	x24, x24, #0x750
  9f0ea4: b4000333     	cbz	x19, 0x9f0f08 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1118>
  9f0ea8: aa1803e1     	mov	x1, x24
  9f0eac: aa1503e0     	mov	x0, x21
  9f0eb0: 91002274     	add	x20, x19, #0x8
  9f0eb4: 94022906     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0eb8: aa0003f6     	mov	x22, x0
  9f0ebc: aa1603e1     	mov	x1, x22
  9f0ec0: aa1703e0     	mov	x0, x23
  9f0ec4: 94022121     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0ec8: f9400661     	ldr	x1, [x19, #0x8]
  9f0ecc: aa1503e0     	mov	x0, x21
  9f0ed0: 94022a06     	bl	0xa7b6e8 <_ZN8tinyxml211XMLDocument7NewTextEPKc>
  9f0ed4: aa0003e1     	mov	x1, x0
  9f0ed8: aa1603e0     	mov	x0, x22
  9f0edc: 9402211b     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0ee0: aa1503e1     	mov	x1, x21
  9f0ee4: 91002280     	add	x0, x20, #0x8
  9f0ee8: 97ffff13     	bl	0x9f0b34 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xd44>
  9f0eec: aa0003f4     	mov	x20, x0
  9f0ef0: aa0003e1     	mov	x1, x0
  9f0ef4: aa1703e0     	mov	x0, x23
  9f0ef8: b4000054     	cbz	x20, 0x9f0f00 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1110>
  9f0efc: 94022113     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0f00: f9400273     	ldr	x19, [x19]
  9f0f04: b5fffd33     	cbnz	x19, 0x9f0ea8 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x10b8>
  9f0f08: aa1703e0     	mov	x0, x23
  9f0f0c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f0f10: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f0f14: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f0f18: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f0f1c: d65f03c0     	ret

00000000009f0f20 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_>:
  9f0f20: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f0f24: 910003fd     	mov	x29, sp
  9f0f28: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f0f2c: 90002a94     	adrp	x20, 0xf40000
  9f0f30: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f0f34: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f0f38: b0002ad5     	adrp	x21, 0xf49000
  9f0f3c: aa0203f8     	mov	x24, x2
  9f0f40: f940e682     	ldr	x2, [x20, #0x1c8]
  9f0f44: aa0103f7     	mov	x23, x1
  9f0f48: aa0003f6     	mov	x22, x0
  9f0f4c: d2805000     	mov	x0, #0x280              // =640
  9f0f50: f9404ea1     	ldr	x1, [x21, #0x98]
  9f0f54: f9400042     	ldr	x2, [x2]
  9f0f58: f9002fa2     	str	x2, [x29, #0x58]
  9f0f5c: 940632c7     	bl	0xb7da78 <_ZnwmRKSt9nothrow_t>
  9f0f60: aa0003f3     	mov	x19, x0
  9f0f64: b4000a20     	cbz	x0, 0x9f10a8 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x188>
  9f0f68: 52800021     	mov	w1, #0x1                // =1
  9f0f6c: 52800002     	mov	w2, #0x0                // =0
  9f0f70: 9402287c     	bl	0xa7b160 <_ZN8tinyxml211XMLDocumentC2EbNS_10WhitespaceE>
  9f0f74: b0001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f0f78: aa1303e0     	mov	x0, x19
  9f0f7c: 910a4021     	add	x1, x1, #0x290
  9f0f80: 94022a59     	bl	0xa7b8e4 <_ZN8tinyxml211XMLDocument14NewDeclarationEPKc>
  9f0f84: b4000860     	cbz	x0, 0x9f1090 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x170>
  9f0f88: aa0003e1     	mov	x1, x0
  9f0f8c: aa1303e0     	mov	x0, x19
  9f0f90: 940220ee     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0f94: b0001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f0f98: aa1303e0     	mov	x0, x19
  9f0f9c: 9108a021     	add	x1, x1, #0x228
  9f0fa0: 940228cb     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0fa4: aa0003e1     	mov	x1, x0
  9f0fa8: aa1303e0     	mov	x0, x19
  9f0fac: 940220e7     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0fb0: b00012e1     	adrp	x1, 0xc4d000 <_ZZN9rapidjson8internal5Pow10EiE1e+0x9a0>
  9f0fb4: aa1303e0     	mov	x0, x19
  9f0fb8: 910e6021     	add	x1, x1, #0x398
  9f0fbc: 940228c4     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f0fc0: aa0003f5     	mov	x21, x0
  9f0fc4: f0001401     	adrp	x1, 0xc73000 <dtls1_version_str+0x2150>
  9f0fc8: 91380021     	add	x1, x1, #0xe00
  9f0fcc: 94022761     	bl	0xa7ad50 <_ZN8tinyxml210XMLElement21FindOrCreateAttributeEPKc>
  9f0fd0: d00013a1     	adrp	x1, 0xc66000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x2c10>
  9f0fd4: 91218021     	add	x1, x1, #0x860
  9f0fd8: 940222c8     	bl	0xa79af8 <_ZN8tinyxml212XMLAttribute12SetAttributeEPKc>
  9f0fdc: b40005b5     	cbz	x21, 0x9f1090 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x170>
  9f0fe0: aa1503e1     	mov	x1, x21
  9f0fe4: aa1303e0     	mov	x0, x19
  9f0fe8: 940220d8     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f0fec: aa1703e0     	mov	x0, x23
  9f0ff0: aa1303e1     	mov	x1, x19
  9f0ff4: 97ffff9d     	bl	0x9f0e68 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0x1078>
  9f0ff8: b40004c0     	cbz	x0, 0x9f1090 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x170>
  9f0ffc: aa0003e1     	mov	x1, x0
  9f1000: aa1503e0     	mov	x0, x21
  9f1004: 940220d1     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f1008: f94002c2     	ldr	x2, [x22]
  9f100c: aa1803e1     	mov	x1, x24
  9f1010: aa1603e0     	mov	x0, x22
  9f1014: 910143a8     	add	x8, x29, #0x50
  9f1018: f9407042     	ldr	x2, [x2, #0xe0]
  9f101c: d63f0040     	blr	x2
  9f1020: f9402ba1     	ldr	x1, [x29, #0x50]
  9f1024: aa1303e0     	mov	x0, x19
  9f1028: 52800002     	mov	w2, #0x0                // =0
  9f102c: 94022f13     	bl	0xa7cc78 <_ZN8tinyxml211XMLDocument8SaveFileEPKcb>
  9f1030: 90002ac1     	adrp	x1, 0xf49000
  9f1034: f9402ba2     	ldr	x2, [x29, #0x50]
  9f1038: 2a0003f5     	mov	w21, w0
  9f103c: d1006040     	sub	x0, x2, #0x18
  9f1040: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f1044: eb01001f     	cmp	x0, x1
  9f1048: 54000341     	b.ne	0x9f10b0 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x190>
  9f104c: f9400261     	ldr	x1, [x19]
  9f1050: aa1303e0     	mov	x0, x19
  9f1054: 6b1f02bf     	cmp	w21, wzr
  9f1058: 1a9f17f3     	cset	w19, eq
  9f105c: f9404421     	ldr	x1, [x1, #0x88]
  9f1060: d63f0020     	blr	x1
  9f1064: 2a1303e0     	mov	w0, w19
  9f1068: f940e694     	ldr	x20, [x20, #0x1c8]
  9f106c: f9402fb3     	ldr	x19, [x29, #0x58]
  9f1070: f9400281     	ldr	x1, [x20]
  9f1074: eb01027f     	cmp	x19, x1
  9f1078: 540003e1     	b.ne	0x9f10f4 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x1d4>
  9f107c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f1080: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f1084: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f1088: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f108c: d65f03c0     	ret
  9f1090: f9400261     	ldr	x1, [x19]
  9f1094: aa1303e0     	mov	x0, x19
  9f1098: f9404421     	ldr	x1, [x1, #0x88]
  9f109c: d63f0020     	blr	x1
  9f10a0: 52800000     	mov	w0, #0x0                // =0
  9f10a4: 17fffff1     	b	0x9f1068 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x148>
  9f10a8: 52800000     	mov	w0, #0x0                // =0
  9f10ac: 17ffffef     	b	0x9f1068 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x148>
  9f10b0: f0002a81     	adrp	x1, 0xf44000
  9f10b4: f9445021     	ldr	x1, [x1, #0x8a0]
  9f10b8: b4000161     	cbz	x1, 0x9f10e4 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x1c4>
  9f10bc: d1002042     	sub	x2, x2, #0x8
  9f10c0: 885ffc41     	ldaxr	w1, [x2]
  9f10c4: 51000423     	sub	w3, w1, #0x1
  9f10c8: 8804fc43     	stlxr	w4, w3, [x2]
  9f10cc: 35ffffa4     	cbnz	w4, 0x9f10c0 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x1a0>
  9f10d0: 6b1f003f     	cmp	w1, wzr
  9f10d4: 54fffbcc     	b.gt	0x9f104c <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x12c>
  9f10d8: 910123a1     	add	x1, x29, #0x48
  9f10dc: 940765b8     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f10e0: 17ffffdb     	b	0x9f104c <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x12c>
  9f10e4: b85f8041     	ldur	w1, [x2, #-0x8]
  9f10e8: 51000423     	sub	w3, w1, #0x1
  9f10ec: b81f8043     	stur	w3, [x2, #-0x8]
  9f10f0: 17fffff8     	b	0x9f10d0 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x1b0>
  9f10f4: 97e6a8ab     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f10f8: f9404ea1     	ldr	x1, [x21, #0x98]
  9f10fc: aa0003f4     	mov	x20, x0
  9f1100: aa1303e0     	mov	x0, x19
  9f1104: 94062b82     	bl	0xb7bf0c <_ZdlPvRKSt9nothrow_t>
  9f1108: aa1403e0     	mov	x0, x20
  9f110c: 9407c775     	bl	0xbe2ee0 <_Unwind_Resume>
  9f1110: 90002ac1     	adrp	x1, 0xf49000
  9f1114: aa0003f3     	mov	x19, x0
  9f1118: f9402ba0     	ldr	x0, [x29, #0x50]
  9f111c: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f1120: d1006000     	sub	x0, x0, #0x18
  9f1124: eb01001f     	cmp	x0, x1
  9f1128: 54000060     	b.eq	0x9f1134 <_ZN7cocos2d9FileUtils19writeValueMapToFileERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEERS8_+0x214>
  9f112c: 910123a1     	add	x1, x29, #0x48
  9f1130: 97e6b8d4     	bl	0x39f480 <.text+0x3170>
  9f1134: aa1303e0     	mov	x0, x19
  9f1138: 9407c76a     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f113c <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs>:
  9f113c: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
  9f1140: 910003fd     	mov	x29, sp
  9f1144: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f1148: f0002a75     	adrp	x21, 0xf40000
  9f114c: f9002bfb     	str	x27, [sp, #0x50]
  9f1150: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1154: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f1158: 90002ad3     	adrp	x19, 0xf49000
  9f115c: aa0203f9     	mov	x25, x2
  9f1160: f940e6a2     	ldr	x2, [x21, #0x1c8]
  9f1164: aa0103fa     	mov	x26, x1
  9f1168: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f116c: f9404e61     	ldr	x1, [x19, #0x98]
  9f1170: aa0003f8     	mov	x24, x0
  9f1174: f9400042     	ldr	x2, [x2]
  9f1178: d2805000     	mov	x0, #0x280              // =640
  9f117c: f9003fa2     	str	x2, [x29, #0x78]
  9f1180: 9406323e     	bl	0xb7da78 <_ZnwmRKSt9nothrow_t>
  9f1184: aa0003f4     	mov	x20, x0
  9f1188: b4000c60     	cbz	x0, 0x9f1314 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1d8>
  9f118c: 52800021     	mov	w1, #0x1                // =1
  9f1190: 52800002     	mov	w2, #0x0                // =0
  9f1194: 940227f3     	bl	0xa7b160 <_ZN8tinyxml211XMLDocumentC2EbNS_10WhitespaceE>
  9f1198: 90001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f119c: aa1403e0     	mov	x0, x20
  9f11a0: 910a4021     	add	x1, x1, #0x290
  9f11a4: 940229d0     	bl	0xa7b8e4 <_ZN8tinyxml211XMLDocument14NewDeclarationEPKc>
  9f11a8: b4000aa0     	cbz	x0, 0x9f12fc <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1c0>
  9f11ac: aa0003e1     	mov	x1, x0
  9f11b0: aa1403e0     	mov	x0, x20
  9f11b4: 94022065     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f11b8: 90001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f11bc: aa1403e0     	mov	x0, x20
  9f11c0: 9108a021     	add	x1, x1, #0x228
  9f11c4: 94022842     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f11c8: aa0003e1     	mov	x1, x0
  9f11cc: aa1403e0     	mov	x0, x20
  9f11d0: 9402205e     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f11d4: 900012e1     	adrp	x1, 0xc4d000 <_ZZN9rapidjson8internal5Pow10EiE1e+0x9a0>
  9f11d8: aa1403e0     	mov	x0, x20
  9f11dc: 910e6021     	add	x1, x1, #0x398
  9f11e0: 9402283b     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f11e4: aa0003fb     	mov	x27, x0
  9f11e8: d0001401     	adrp	x1, 0xc73000 <dtls1_version_str+0x2150>
  9f11ec: 91380021     	add	x1, x1, #0xe00
  9f11f0: 940226d8     	bl	0xa7ad50 <_ZN8tinyxml210XMLElement21FindOrCreateAttributeEPKc>
  9f11f4: b00013a1     	adrp	x1, 0xc66000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x2c10>
  9f11f8: 91218021     	add	x1, x1, #0x860
  9f11fc: 9402223f     	bl	0xa79af8 <_ZN8tinyxml212XMLAttribute12SetAttributeEPKc>
  9f1200: b40007fb     	cbz	x27, 0x9f12fc <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1c0>
  9f1204: aa1b03e1     	mov	x1, x27
  9f1208: aa1403e0     	mov	x0, x20
  9f120c: 9402204f     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f1210: b0001361     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9f1214: aa1403e0     	mov	x0, x20
  9f1218: 91280021     	add	x1, x1, #0xa00
  9f121c: 9402282c     	bl	0xa7b2cc <_ZN8tinyxml211XMLDocument10NewElementEPKc>
  9f1220: f9400756     	ldr	x22, [x26, #0x8]
  9f1224: f9400353     	ldr	x19, [x26]
  9f1228: aa0003f7     	mov	x23, x0
  9f122c: eb16027f     	cmp	x19, x22
  9f1230: 54000160     	b.eq	0x9f125c <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x120>
  9f1234: aa1403e1     	mov	x1, x20
  9f1238: aa1303e0     	mov	x0, x19
  9f123c: 97fffe3e     	bl	0x9f0b34 <_ZN7cocos2d9FileUtils15uncompressAsyncEv+0xd44>
  9f1240: aa0003e1     	mov	x1, x0
  9f1244: b4000060     	cbz	x0, 0x9f1250 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x114>
  9f1248: aa1703e0     	mov	x0, x23
  9f124c: 9402203f     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f1250: 91004273     	add	x19, x19, #0x10
  9f1254: eb1302df     	cmp	x22, x19
  9f1258: 54fffee1     	b.ne	0x9f1234 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0xf8>
  9f125c: b4000517     	cbz	x23, 0x9f12fc <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1c0>
  9f1260: aa1703e1     	mov	x1, x23
  9f1264: aa1b03e0     	mov	x0, x27
  9f1268: 94022038     	bl	0xa79348 <_ZN8tinyxml27XMLNode14InsertEndChildEPS0_>
  9f126c: f9400302     	ldr	x2, [x24]
  9f1270: aa1903e1     	mov	x1, x25
  9f1274: aa1803e0     	mov	x0, x24
  9f1278: 9101c3a8     	add	x8, x29, #0x70
  9f127c: f9407042     	ldr	x2, [x2, #0xe0]
  9f1280: d63f0040     	blr	x2
  9f1284: f9403ba1     	ldr	x1, [x29, #0x70]
  9f1288: aa1403e0     	mov	x0, x20
  9f128c: 52800002     	mov	w2, #0x0                // =0
  9f1290: 94022e7a     	bl	0xa7cc78 <_ZN8tinyxml211XMLDocument8SaveFileEPKcb>
  9f1294: 90002ac1     	adrp	x1, 0xf49000
  9f1298: f9403ba2     	ldr	x2, [x29, #0x70]
  9f129c: 2a0003f3     	mov	w19, w0
  9f12a0: d1006040     	sub	x0, x2, #0x18
  9f12a4: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f12a8: eb01001f     	cmp	x0, x1
  9f12ac: 54000381     	b.ne	0x9f131c <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1e0>
  9f12b0: f9400281     	ldr	x1, [x20]
  9f12b4: 6b1f027f     	cmp	w19, wzr
  9f12b8: aa1403e0     	mov	x0, x20
  9f12bc: 1a9f17f3     	cset	w19, eq
  9f12c0: f9404421     	ldr	x1, [x1, #0x88]
  9f12c4: d63f0020     	blr	x1
  9f12c8: 2a1303e0     	mov	w0, w19
  9f12cc: f940e6b5     	ldr	x21, [x21, #0x1c8]
  9f12d0: f9403fb3     	ldr	x19, [x29, #0x78]
  9f12d4: f94002a1     	ldr	x1, [x21]
  9f12d8: eb01027f     	cmp	x19, x1
  9f12dc: 54000421     	b.ne	0x9f1360 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x224>
  9f12e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f12e4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f12e8: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f12ec: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f12f0: f9402bfb     	ldr	x27, [sp, #0x50]
  9f12f4: a8c87bfd     	ldp	x29, x30, [sp], #0x80
  9f12f8: d65f03c0     	ret
  9f12fc: f9400281     	ldr	x1, [x20]
  9f1300: aa1403e0     	mov	x0, x20
  9f1304: f9404421     	ldr	x1, [x1, #0x88]
  9f1308: d63f0020     	blr	x1
  9f130c: 52800000     	mov	w0, #0x0                // =0
  9f1310: 17ffffef     	b	0x9f12cc <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x190>
  9f1314: 52800000     	mov	w0, #0x0                // =0
  9f1318: 17ffffed     	b	0x9f12cc <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x190>
  9f131c: f0002a81     	adrp	x1, 0xf44000
  9f1320: f9445021     	ldr	x1, [x1, #0x8a0]
  9f1324: b4000161     	cbz	x1, 0x9f1350 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x214>
  9f1328: d1002042     	sub	x2, x2, #0x8
  9f132c: 885ffc41     	ldaxr	w1, [x2]
  9f1330: 51000423     	sub	w3, w1, #0x1
  9f1334: 8804fc43     	stlxr	w4, w3, [x2]
  9f1338: 35ffffa4     	cbnz	w4, 0x9f132c <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x1f0>
  9f133c: 6b1f003f     	cmp	w1, wzr
  9f1340: 54fffb8c     	b.gt	0x9f12b0 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x174>
  9f1344: 9101a3a1     	add	x1, x29, #0x68
  9f1348: 9407651d     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f134c: 17ffffd9     	b	0x9f12b0 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x174>
  9f1350: b85f8041     	ldur	w1, [x2, #-0x8]
  9f1354: 51000423     	sub	w3, w1, #0x1
  9f1358: b81f8043     	stur	w3, [x2, #-0x8]
  9f135c: 17fffff8     	b	0x9f133c <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x200>
  9f1360: 97e6a810     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f1364: f9404e61     	ldr	x1, [x19, #0x98]
  9f1368: aa0003f3     	mov	x19, x0
  9f136c: aa1403e0     	mov	x0, x20
  9f1370: 94062ae7     	bl	0xb7bf0c <_ZdlPvRKSt9nothrow_t>
  9f1374: aa1303e0     	mov	x0, x19
  9f1378: 9407c6da     	bl	0xbe2ee0 <_Unwind_Resume>
  9f137c: 90002ac1     	adrp	x1, 0xf49000
  9f1380: aa0003f3     	mov	x19, x0
  9f1384: f9403ba0     	ldr	x0, [x29, #0x70]
  9f1388: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f138c: d1006000     	sub	x0, x0, #0x18
  9f1390: eb01001f     	cmp	x0, x1
  9f1394: 54000060     	b.eq	0x9f13a0 <_ZN7cocos2d9FileUtils22writeValueVectorToFileERKSt6vectorINS_5ValueESaIS2_EERKSs+0x264>
  9f1398: 9101a3a1     	add	x1, x29, #0x68
  9f139c: 97e6b839     	bl	0x39f480 <.text+0x3170>
  9f13a0: aa1303e0     	mov	x0, x19
  9f13a4: 9407c6cf     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f13a8 <_ZN7cocos2d9FileUtils15destroyInstanceEv>:
  9f13a8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f13ac: 910003fd     	mov	x29, sp
  9f13b0: f9000bf3     	str	x19, [sp, #0x10]
  9f13b4: f0002a93     	adrp	x19, 0xf44000
  9f13b8: f9477260     	ldr	x0, [x19, #0xee0]
  9f13bc: f9400000     	ldr	x0, [x0]
  9f13c0: b4000080     	cbz	x0, 0x9f13d0 <_ZN7cocos2d9FileUtils15destroyInstanceEv+0x28>
  9f13c4: f9400001     	ldr	x1, [x0]
  9f13c8: f9400421     	ldr	x1, [x1, #0x8]
  9f13cc: d63f0020     	blr	x1
  9f13d0: f9477273     	ldr	x19, [x19, #0xee0]
  9f13d4: f900027f     	str	xzr, [x19]
  9f13d8: f9400bf3     	ldr	x19, [sp, #0x10]
  9f13dc: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f13e0: d65f03c0     	ret

00000000009f13e4 <_ZN7cocos2d9FileUtils11setDelegateEPS0_>:
  9f13e4: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f13e8: 910003fd     	mov	x29, sp
  9f13ec: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f13f0: f0002a93     	adrp	x19, 0xf44000
  9f13f4: aa0003f4     	mov	x20, x0
  9f13f8: f9477260     	ldr	x0, [x19, #0xee0]
  9f13fc: f9400000     	ldr	x0, [x0]
  9f1400: b4000080     	cbz	x0, 0x9f1410 <_ZN7cocos2d9FileUtils11setDelegateEPS0_+0x2c>
  9f1404: f9400001     	ldr	x1, [x0]
  9f1408: f9400421     	ldr	x1, [x1, #0x8]
  9f140c: d63f0020     	blr	x1
  9f1410: f9477273     	ldr	x19, [x19, #0xee0]
  9f1414: f9000274     	str	x20, [x19]
  9f1418: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f141c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f1420: d65f03c0     	ret

00000000009f1424 <_ZN7cocos2d9FileUtils26setDefaultResourceRootPathERKSs>:
  9f1424: 91238000     	add	x0, x0, #0x8e0
  9f1428: 140765a6     	b	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>

00000000009f142c <_ZNK7cocos2d9FileUtils20isFileExistInZipFileERKSs>:
  9f142c: f9449400     	ldr	x0, [x0, #0x928]
  9f1430: b4000040     	cbz	x0, 0x9f1438 <_ZNK7cocos2d9FileUtils20isFileExistInZipFileERKSs+0xc>
  9f1434: 140131b7     	b	0xa3db10 <_ZNK7cocos2d7ZipFile10fileExistsERKSs>
  9f1438: 52800000     	mov	w0, #0x0                // =0
  9f143c: d65f03c0     	ret

00000000009f1440 <_ZNK7cocos2d9FileUtils13isZipFilePathERKSs>:
  9f1440: 52800000     	mov	w0, #0x0                // =0
  9f1444: d65f03c0     	ret

00000000009f1448 <_ZN7cocos2d9FileUtils18uncompressProgressEv>:
  9f1448: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9f144c: 910003fd     	mov	x29, sp
  9f1450: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1454: f0002a73     	adrp	x19, 0xf40000
  9f1458: aa0003f4     	mov	x20, x0
  9f145c: b9498400     	ldr	w0, [x0, #0x984]
  9f1460: f90013f5     	str	x21, [sp, #0x20]
  9f1464: f940e661     	ldr	x1, [x19, #0x1c8]
  9f1468: f9400021     	ldr	x1, [x1]
  9f146c: f90027a1     	str	x1, [x29, #0x48]
  9f1470: 340003a0     	cbz	w0, 0x9f14e4 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0x9c>
  9f1474: f0002a81     	adrp	x1, 0xf44000
  9f1478: f9445021     	ldr	x1, [x1, #0x8a0]
  9f147c: b4000461     	cbz	x1, 0x9f1508 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0xc0>
  9f1480: 91256295     	add	x21, x20, #0x958
  9f1484: aa1503e0     	mov	x0, x21
  9f1488: 97e6a896     	bl	0x39b6e0 <pthread_mutex_lock@plt>
  9f148c: 35000560     	cbnz	w0, 0x9f1538 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0xf0>
  9f1490: aa1503e0     	mov	x0, x21
  9f1494: b9498295     	ldr	w21, [x20, #0x980]
  9f1498: 97e6a592     	bl	0x39aae0 <pthread_mutex_unlock@plt>
  9f149c: b9498680     	ldr	w0, [x20, #0x984]
  9f14a0: b90033a0     	str	w0, [x29, #0x30]
  9f14a4: 528001a0     	mov	w0, #0xd                // =13
  9f14a8: b9003ba0     	str	w0, [x29, #0x38]
  9f14ac: 9100c3a0     	add	x0, x29, #0x30
  9f14b0: b90037b5     	str	w21, [x29, #0x34]
  9f14b4: f90023a0     	str	x0, [x29, #0x40]
  9f14b8: 9400fd06     	bl	0xa308d0 <_ZN7cocos2d19ScriptEngineManager11getInstanceEv>
  9f14bc: f9400002     	ldr	x2, [x0]
  9f14c0: 9100e3a1     	add	x1, x29, #0x38
  9f14c4: aa0203e0     	mov	x0, x2
  9f14c8: f9400042     	ldr	x2, [x2]
  9f14cc: f9403c42     	ldr	x2, [x2, #0x78]
  9f14d0: d63f0040     	blr	x2
  9f14d4: 71018ebf     	cmp	w21, #0x63
  9f14d8: 5400006d     	b.le	0x9f14e4 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0x9c>
  9f14dc: b9498680     	ldr	w0, [x20, #0x984]
  9f14e0: 35000180     	cbnz	w0, 0x9f1510 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0xc8>
  9f14e4: f940e673     	ldr	x19, [x19, #0x1c8]
  9f14e8: f94027a1     	ldr	x1, [x29, #0x48]
  9f14ec: f9400260     	ldr	x0, [x19]
  9f14f0: eb00003f     	cmp	x1, x0
  9f14f4: 54000201     	b.ne	0x9f1534 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0xec>
  9f14f8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f14fc: f94013f5     	ldr	x21, [sp, #0x20]
  9f1500: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9f1504: d65f03c0     	ret
  9f1508: b9498295     	ldr	w21, [x20, #0x980]
  9f150c: 17ffffe5     	b	0x9f14a0 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0x58>
  9f1510: 9400fcf0     	bl	0xa308d0 <_ZN7cocos2d19ScriptEngineManager11getInstanceEv>
  9f1514: f9400002     	ldr	x2, [x0]
  9f1518: b9498681     	ldr	w1, [x20, #0x984]
  9f151c: aa0203e0     	mov	x0, x2
  9f1520: f9400042     	ldr	x2, [x2]
  9f1524: f9402842     	ldr	x2, [x2, #0x50]
  9f1528: d63f0040     	blr	x2
  9f152c: b909869f     	str	wzr, [x20, #0x984]
  9f1530: 17ffffed     	b	0x9f14e4 <_ZN7cocos2d9FileUtils18uncompressProgressEv+0x9c>
  9f1534: 97e6a79b     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f1538: 94075104     	bl	0xbc5948 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x47320>

00000000009f153c <_ZN7cocos2d9DictMakerD2Ev>:
  9f153c: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f1540: d0002a81     	adrp	x1, 0xf43000
  9f1544: 910003fd     	mov	x29, sp
  9f1548: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f154c: f0002a76     	adrp	x22, 0xf40000
  9f1550: f9448821     	ldr	x1, [x1, #0x910]
  9f1554: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1558: aa0003f4     	mov	x20, x0
  9f155c: f9409400     	ldr	x0, [x0, #0x128]
  9f1560: f940e6c2     	ldr	x2, [x22, #0x1c8]
  9f1564: 91004021     	add	x1, x1, #0x10
  9f1568: f940aa93     	ldr	x19, [x20, #0x150]
  9f156c: f9400042     	ldr	x2, [x2]
  9f1570: f9001fa2     	str	x2, [x29, #0x38]
  9f1574: f9000281     	str	x1, [x20]
  9f1578: f940ba95     	ldr	x21, [x20, #0x170]
  9f157c: b4000140     	cbz	x0, 0x9f15a4 <_ZN7cocos2d9DictMakerD2Ev+0x68>
  9f1580: 910022b5     	add	x21, x21, #0x8
  9f1584: eb15027f     	cmp	x19, x21
  9f1588: 540000c2     	b.hs	0x9f15a0 <_ZN7cocos2d9DictMakerD2Ev+0x64>
  9f158c: f8408660     	ldr	x0, [x19], #0x8
  9f1590: 94062a5e     	bl	0xb7bf08 <_ZdlPv>
  9f1594: eb1302bf     	cmp	x21, x19
  9f1598: 54ffffa8     	b.hi	0x9f158c <_ZN7cocos2d9DictMakerD2Ev+0x50>
  9f159c: f9409680     	ldr	x0, [x20, #0x128]
  9f15a0: 94062a5a     	bl	0xb7bf08 <_ZdlPv>
  9f15a4: f9406e80     	ldr	x0, [x20, #0xd8]
  9f15a8: f9408293     	ldr	x19, [x20, #0x100]
  9f15ac: f9409295     	ldr	x21, [x20, #0x120]
  9f15b0: b4000140     	cbz	x0, 0x9f15d8 <_ZN7cocos2d9DictMakerD2Ev+0x9c>
  9f15b4: 910022b5     	add	x21, x21, #0x8
  9f15b8: eb15027f     	cmp	x19, x21
  9f15bc: 540000c2     	b.hs	0x9f15d4 <_ZN7cocos2d9DictMakerD2Ev+0x98>
  9f15c0: f8408660     	ldr	x0, [x19], #0x8
  9f15c4: 94062a51     	bl	0xb7bf08 <_ZdlPv>
  9f15c8: eb1302bf     	cmp	x21, x19
  9f15cc: 54ffffa8     	b.hi	0x9f15c0 <_ZN7cocos2d9DictMakerD2Ev+0x84>
  9f15d0: f9406e80     	ldr	x0, [x20, #0xd8]
  9f15d4: 94062a4d     	bl	0xb7bf08 <_ZdlPv>
  9f15d8: f9404680     	ldr	x0, [x20, #0x88]
  9f15dc: f9405a93     	ldr	x19, [x20, #0xb0]
  9f15e0: f9406a95     	ldr	x21, [x20, #0xd0]
  9f15e4: b4000140     	cbz	x0, 0x9f160c <_ZN7cocos2d9DictMakerD2Ev+0xd0>
  9f15e8: 910022b5     	add	x21, x21, #0x8
  9f15ec: eb15027f     	cmp	x19, x21
  9f15f0: 540000c2     	b.hs	0x9f1608 <_ZN7cocos2d9DictMakerD2Ev+0xcc>
  9f15f4: f8408660     	ldr	x0, [x19], #0x8
  9f15f8: 94062a44     	bl	0xb7bf08 <_ZdlPv>
  9f15fc: eb1302bf     	cmp	x21, x19
  9f1600: 54ffffa8     	b.hi	0x9f15f4 <_ZN7cocos2d9DictMakerD2Ev+0xb8>
  9f1604: f9404680     	ldr	x0, [x20, #0x88]
  9f1608: 94062a40     	bl	0xb7bf08 <_ZdlPv>
  9f160c: 90002ad3     	adrp	x19, 0xf49000
  9f1610: f9403681     	ldr	x1, [x20, #0x68]
  9f1614: d1006020     	sub	x0, x1, #0x18
  9f1618: f947ee62     	ldr	x2, [x19, #0xfd8]
  9f161c: eb02001f     	cmp	x0, x2
  9f1620: 540003c1     	b.ne	0x9f1698 <_ZN7cocos2d9DictMakerD2Ev+0x15c>
  9f1624: f9403281     	ldr	x1, [x20, #0x60]
  9f1628: f947ee73     	ldr	x19, [x19, #0xfd8]
  9f162c: d1006020     	sub	x0, x1, #0x18
  9f1630: eb13001f     	cmp	x0, x19
  9f1634: 540004c1     	b.ne	0x9f16cc <_ZN7cocos2d9DictMakerD2Ev+0x190>
  9f1638: f9402693     	ldr	x19, [x20, #0x48]
  9f163c: f9402a95     	ldr	x21, [x20, #0x50]
  9f1640: eb15027f     	cmp	x19, x21
  9f1644: 540000e0     	b.eq	0x9f1660 <_ZN7cocos2d9DictMakerD2Ev+0x124>
  9f1648: aa1303e0     	mov	x0, x19
  9f164c: 91004273     	add	x19, x19, #0x10
  9f1650: 94012037     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f1654: eb1302bf     	cmp	x21, x19
  9f1658: 54ffff81     	b.ne	0x9f1648 <_ZN7cocos2d9DictMakerD2Ev+0x10c>
  9f165c: f9402695     	ldr	x21, [x20, #0x48]
  9f1660: b4000075     	cbz	x21, 0x9f166c <_ZN7cocos2d9DictMakerD2Ev+0x130>
  9f1664: aa1503e0     	mov	x0, x21
  9f1668: 94062a28     	bl	0xb7bf08 <_ZdlPv>
  9f166c: 91004280     	add	x0, x20, #0x10
  9f1670: 97e73abb     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f1674: f940e6d6     	ldr	x22, [x22, #0x1c8]
  9f1678: f9401fa1     	ldr	x1, [x29, #0x38]
  9f167c: f94002c0     	ldr	x0, [x22]
  9f1680: eb00003f     	cmp	x1, x0
  9f1684: 540004e1     	b.ne	0x9f1720 <_ZN7cocos2d9DictMakerD2Ev+0x1e4>
  9f1688: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f168c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f1690: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f1694: d65f03c0     	ret
  9f1698: f0002a82     	adrp	x2, 0xf44000
  9f169c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f16a0: b4000382     	cbz	x2, 0x9f1710 <_ZN7cocos2d9DictMakerD2Ev+0x1d4>
  9f16a4: d1002021     	sub	x1, x1, #0x8
  9f16a8: 885ffc22     	ldaxr	w2, [x1]
  9f16ac: 51000443     	sub	w3, w2, #0x1
  9f16b0: 8804fc23     	stlxr	w4, w3, [x1]
  9f16b4: 35ffffa4     	cbnz	w4, 0x9f16a8 <_ZN7cocos2d9DictMakerD2Ev+0x16c>
  9f16b8: 6b1f005f     	cmp	w2, wzr
  9f16bc: 54fffb4c     	b.gt	0x9f1624 <_ZN7cocos2d9DictMakerD2Ev+0xe8>
  9f16c0: 9100c3a1     	add	x1, x29, #0x30
  9f16c4: 9407643e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f16c8: 17ffffd7     	b	0x9f1624 <_ZN7cocos2d9DictMakerD2Ev+0xe8>
  9f16cc: f0002a82     	adrp	x2, 0xf44000
  9f16d0: f9445042     	ldr	x2, [x2, #0x8a0]
  9f16d4: b4000162     	cbz	x2, 0x9f1700 <_ZN7cocos2d9DictMakerD2Ev+0x1c4>
  9f16d8: d1002021     	sub	x1, x1, #0x8
  9f16dc: 885ffc22     	ldaxr	w2, [x1]
  9f16e0: 51000443     	sub	w3, w2, #0x1
  9f16e4: 8804fc23     	stlxr	w4, w3, [x1]
  9f16e8: 35ffffa4     	cbnz	w4, 0x9f16dc <_ZN7cocos2d9DictMakerD2Ev+0x1a0>
  9f16ec: 6b1f005f     	cmp	w2, wzr
  9f16f0: 54fffa4c     	b.gt	0x9f1638 <_ZN7cocos2d9DictMakerD2Ev+0xfc>
  9f16f4: 9100c3a1     	add	x1, x29, #0x30
  9f16f8: 94076431     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f16fc: 17ffffcf     	b	0x9f1638 <_ZN7cocos2d9DictMakerD2Ev+0xfc>
  9f1700: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1704: 51000443     	sub	w3, w2, #0x1
  9f1708: b81f8023     	stur	w3, [x1, #-0x8]
  9f170c: 17fffff8     	b	0x9f16ec <_ZN7cocos2d9DictMakerD2Ev+0x1b0>
  9f1710: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1714: 51000443     	sub	w3, w2, #0x1
  9f1718: b81f8023     	stur	w3, [x1, #-0x8]
  9f171c: 17ffffe7     	b	0x9f16b8 <_ZN7cocos2d9DictMakerD2Ev+0x17c>
  9f1720: 97e6a720     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f1724 <_ZN7cocos2d9DictMakerD0Ev>:
  9f1724: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f1728: d0002a81     	adrp	x1, 0xf43000
  9f172c: 910003fd     	mov	x29, sp
  9f1730: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f1734: f0002a76     	adrp	x22, 0xf40000
  9f1738: f9448821     	ldr	x1, [x1, #0x910]
  9f173c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1740: aa0003f4     	mov	x20, x0
  9f1744: f9409400     	ldr	x0, [x0, #0x128]
  9f1748: f940e6c2     	ldr	x2, [x22, #0x1c8]
  9f174c: 91004021     	add	x1, x1, #0x10
  9f1750: f940aa93     	ldr	x19, [x20, #0x150]
  9f1754: f9400042     	ldr	x2, [x2]
  9f1758: f9001fa2     	str	x2, [x29, #0x38]
  9f175c: f9000281     	str	x1, [x20]
  9f1760: f940ba95     	ldr	x21, [x20, #0x170]
  9f1764: b4000140     	cbz	x0, 0x9f178c <_ZN7cocos2d9DictMakerD0Ev+0x68>
  9f1768: 910022b5     	add	x21, x21, #0x8
  9f176c: eb15027f     	cmp	x19, x21
  9f1770: 540000c2     	b.hs	0x9f1788 <_ZN7cocos2d9DictMakerD0Ev+0x64>
  9f1774: f8408660     	ldr	x0, [x19], #0x8
  9f1778: 940629e4     	bl	0xb7bf08 <_ZdlPv>
  9f177c: eb1302bf     	cmp	x21, x19
  9f1780: 54ffffa8     	b.hi	0x9f1774 <_ZN7cocos2d9DictMakerD0Ev+0x50>
  9f1784: f9409680     	ldr	x0, [x20, #0x128]
  9f1788: 940629e0     	bl	0xb7bf08 <_ZdlPv>
  9f178c: f9406e80     	ldr	x0, [x20, #0xd8]
  9f1790: f9408293     	ldr	x19, [x20, #0x100]
  9f1794: f9409295     	ldr	x21, [x20, #0x120]
  9f1798: b4000140     	cbz	x0, 0x9f17c0 <_ZN7cocos2d9DictMakerD0Ev+0x9c>
  9f179c: 910022b5     	add	x21, x21, #0x8
  9f17a0: eb15027f     	cmp	x19, x21
  9f17a4: 540000c2     	b.hs	0x9f17bc <_ZN7cocos2d9DictMakerD0Ev+0x98>
  9f17a8: f8408660     	ldr	x0, [x19], #0x8
  9f17ac: 940629d7     	bl	0xb7bf08 <_ZdlPv>
  9f17b0: eb1302bf     	cmp	x21, x19
  9f17b4: 54ffffa8     	b.hi	0x9f17a8 <_ZN7cocos2d9DictMakerD0Ev+0x84>
  9f17b8: f9406e80     	ldr	x0, [x20, #0xd8]
  9f17bc: 940629d3     	bl	0xb7bf08 <_ZdlPv>
  9f17c0: f9404680     	ldr	x0, [x20, #0x88]
  9f17c4: f9405a93     	ldr	x19, [x20, #0xb0]
  9f17c8: f9406a95     	ldr	x21, [x20, #0xd0]
  9f17cc: b4000140     	cbz	x0, 0x9f17f4 <_ZN7cocos2d9DictMakerD0Ev+0xd0>
  9f17d0: 910022b5     	add	x21, x21, #0x8
  9f17d4: eb15027f     	cmp	x19, x21
  9f17d8: 540000c2     	b.hs	0x9f17f0 <_ZN7cocos2d9DictMakerD0Ev+0xcc>
  9f17dc: f8408660     	ldr	x0, [x19], #0x8
  9f17e0: 940629ca     	bl	0xb7bf08 <_ZdlPv>
  9f17e4: eb1302bf     	cmp	x21, x19
  9f17e8: 54ffffa8     	b.hi	0x9f17dc <_ZN7cocos2d9DictMakerD0Ev+0xb8>
  9f17ec: f9404680     	ldr	x0, [x20, #0x88]
  9f17f0: 940629c6     	bl	0xb7bf08 <_ZdlPv>
  9f17f4: 90002ad3     	adrp	x19, 0xf49000
  9f17f8: f9403681     	ldr	x1, [x20, #0x68]
  9f17fc: d1006020     	sub	x0, x1, #0x18
  9f1800: f947ee62     	ldr	x2, [x19, #0xfd8]
  9f1804: eb02001f     	cmp	x0, x2
  9f1808: 54000401     	b.ne	0x9f1888 <_ZN7cocos2d9DictMakerD0Ev+0x164>
  9f180c: f9403281     	ldr	x1, [x20, #0x60]
  9f1810: f947ee73     	ldr	x19, [x19, #0xfd8]
  9f1814: d1006020     	sub	x0, x1, #0x18
  9f1818: eb13001f     	cmp	x0, x19
  9f181c: 54000501     	b.ne	0x9f18bc <_ZN7cocos2d9DictMakerD0Ev+0x198>
  9f1820: f9402693     	ldr	x19, [x20, #0x48]
  9f1824: f9402a95     	ldr	x21, [x20, #0x50]
  9f1828: eb15027f     	cmp	x19, x21
  9f182c: 540000e0     	b.eq	0x9f1848 <_ZN7cocos2d9DictMakerD0Ev+0x124>
  9f1830: aa1303e0     	mov	x0, x19
  9f1834: 91004273     	add	x19, x19, #0x10
  9f1838: 94011fbd     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f183c: eb1302bf     	cmp	x21, x19
  9f1840: 54ffff81     	b.ne	0x9f1830 <_ZN7cocos2d9DictMakerD0Ev+0x10c>
  9f1844: f9402695     	ldr	x21, [x20, #0x48]
  9f1848: b4000075     	cbz	x21, 0x9f1854 <_ZN7cocos2d9DictMakerD0Ev+0x130>
  9f184c: aa1503e0     	mov	x0, x21
  9f1850: 940629ae     	bl	0xb7bf08 <_ZdlPv>
  9f1854: 91004280     	add	x0, x20, #0x10
  9f1858: 97e73a41     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f185c: aa1403e0     	mov	x0, x20
  9f1860: 940629aa     	bl	0xb7bf08 <_ZdlPv>
  9f1864: f940e6d6     	ldr	x22, [x22, #0x1c8]
  9f1868: f9401fa1     	ldr	x1, [x29, #0x38]
  9f186c: f94002c0     	ldr	x0, [x22]
  9f1870: eb00003f     	cmp	x1, x0
  9f1874: 540004e1     	b.ne	0x9f1910 <_ZN7cocos2d9DictMakerD0Ev+0x1ec>
  9f1878: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f187c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f1880: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f1884: d65f03c0     	ret
  9f1888: f0002a82     	adrp	x2, 0xf44000
  9f188c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f1890: b4000382     	cbz	x2, 0x9f1900 <_ZN7cocos2d9DictMakerD0Ev+0x1dc>
  9f1894: d1002021     	sub	x1, x1, #0x8
  9f1898: 885ffc22     	ldaxr	w2, [x1]
  9f189c: 51000443     	sub	w3, w2, #0x1
  9f18a0: 8804fc23     	stlxr	w4, w3, [x1]
  9f18a4: 35ffffa4     	cbnz	w4, 0x9f1898 <_ZN7cocos2d9DictMakerD0Ev+0x174>
  9f18a8: 6b1f005f     	cmp	w2, wzr
  9f18ac: 54fffb0c     	b.gt	0x9f180c <_ZN7cocos2d9DictMakerD0Ev+0xe8>
  9f18b0: 9100c3a1     	add	x1, x29, #0x30
  9f18b4: 940763c2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f18b8: 17ffffd5     	b	0x9f180c <_ZN7cocos2d9DictMakerD0Ev+0xe8>
  9f18bc: f0002a82     	adrp	x2, 0xf44000
  9f18c0: f9445042     	ldr	x2, [x2, #0x8a0]
  9f18c4: b4000162     	cbz	x2, 0x9f18f0 <_ZN7cocos2d9DictMakerD0Ev+0x1cc>
  9f18c8: d1002021     	sub	x1, x1, #0x8
  9f18cc: 885ffc22     	ldaxr	w2, [x1]
  9f18d0: 51000443     	sub	w3, w2, #0x1
  9f18d4: 8804fc23     	stlxr	w4, w3, [x1]
  9f18d8: 35ffffa4     	cbnz	w4, 0x9f18cc <_ZN7cocos2d9DictMakerD0Ev+0x1a8>
  9f18dc: 6b1f005f     	cmp	w2, wzr
  9f18e0: 54fffa0c     	b.gt	0x9f1820 <_ZN7cocos2d9DictMakerD0Ev+0xfc>
  9f18e4: 9100c3a1     	add	x1, x29, #0x30
  9f18e8: 940763b5     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f18ec: 17ffffcd     	b	0x9f1820 <_ZN7cocos2d9DictMakerD0Ev+0xfc>
  9f18f0: b85f8022     	ldur	w2, [x1, #-0x8]
  9f18f4: 51000443     	sub	w3, w2, #0x1
  9f18f8: b81f8023     	stur	w3, [x1, #-0x8]
  9f18fc: 17fffff8     	b	0x9f18dc <_ZN7cocos2d9DictMakerD0Ev+0x1b8>
  9f1900: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1904: 51000443     	sub	w3, w2, #0x1
  9f1908: b81f8023     	stur	w3, [x1, #-0x8]
  9f190c: 17ffffe7     	b	0x9f18a8 <_ZN7cocos2d9DictMakerD0Ev+0x184>
  9f1910: 97e6a6a4     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f1914 <_ZN7cocos2d9FileUtilsC2Ev>:
  9f1914: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9f1918: 52936181     	mov	w1, #0x9b0c             // =39692
  9f191c: 528bcfe4     	mov	w4, #0x5e7f             // =24191
  9f1920: 910003fd     	mov	x29, sp
  9f1924: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1928: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f192c: aa0003f3     	mov	x19, x0
  9f1930: f0002a76     	adrp	x22, 0xf40000
  9f1934: d0002a80     	adrp	x0, 0xf43000
  9f1938: f9002bfb     	str	x27, [sp, #0x50]
  9f193c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f1940: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f1944: 72a60d41     	movk	w1, #0x306a, lsl #16
  9f1948: f940e6c5     	ldr	x5, [x22, #0x1c8]
  9f194c: f9428c00     	ldr	x0, [x0, #0x518]
  9f1950: 528db1c3     	mov	w3, #0x6d8e             // =28046
  9f1954: b9084261     	str	w1, [x19, #0x840]
  9f1958: 90001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f195c: 910ae021     	add	x1, x1, #0x2b8
  9f1960: f9042a61     	str	x1, [x19, #0x850]
  9f1964: 90001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f1968: f94000a5     	ldr	x5, [x5]
  9f196c: 910b0021     	add	x1, x1, #0x2c0
  9f1970: 91004000     	add	x0, x0, #0x10
  9f1974: f9042e61     	str	x1, [x19, #0x858]
  9f1978: 528f93a2     	mov	w2, #0x7c9d             // =31901
  9f197c: 90001601     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f1980: 72a187a4     	movk	w4, #0xc3d, lsl #16
  9f1984: 72a36983     	movk	w3, #0x1b4c, lsl #16
  9f1988: 72a54b62     	movk	w2, #0x2a5b, lsl #16
  9f198c: 9106c021     	add	x1, x1, #0x1b0
  9f1990: b9083664     	str	w4, [x19, #0x834]
  9f1994: b9083a63     	str	w3, [x19, #0x838]
  9f1998: 9121e277     	add	x23, x19, #0x878
  9f199c: b9083e62     	str	w2, [x19, #0x83c]
  9f19a0: f9043261     	str	x1, [x19, #0x860]
  9f19a4: f9000260     	str	x0, [x19]
  9f19a8: d2800200     	mov	x0, #0x10               // =16
  9f19ac: f90037a5     	str	x5, [x29, #0x68]
  9f19b0: 97e6a68c     	bl	0x39b3e0 <malloc@plt>
  9f19b4: f9043660     	str	x0, [x19, #0x868]
  9f19b8: d2800400     	mov	x0, #0x20               // =32
  9f19bc: 97e6a689     	bl	0x39b3e0 <malloc@plt>
  9f19c0: f904467f     	str	xzr, [x19, #0x888]
  9f19c4: f9043a60     	str	x0, [x19, #0x870]
  9f19c8: 91226262     	add	x2, x19, #0x898
  9f19cc: f9000eff     	str	xzr, [x23, #0x18]
  9f19d0: aa0203e0     	mov	x0, x2
  9f19d4: 1e2e1000     	fmov	s0, #1.00000000
  9f19d8: d2800141     	mov	x1, #0xa                // =10
  9f19dc: f904527f     	str	xzr, [x19, #0x8a0]
  9f19e0: bd089a60     	str	s0, [x19, #0x898]
  9f19e4: 9407514d     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f19e8: f100041f     	cmp	x0, #0x1
  9f19ec: f90006e0     	str	x0, [x23, #0x8]
  9f19f0: 540008c0     	b.eq	0x9f1b08 <_ZN7cocos2d9FileUtilsC2Ev+0x1f4>
  9f19f4: 97ffef46     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f19f8: 9122c279     	add	x25, x19, #0x8b0
  9f19fc: f9043e60     	str	x0, [x19, #0x878]
  9f1a00: f9045a7f     	str	xzr, [x19, #0x8b0]
  9f1a04: 9123227a     	add	x26, x19, #0x8c8
  9f1a08: 90002ad5     	adrp	x21, 0xf49000
  9f1a0c: 9123a278     	add	x24, x19, #0x8e8
  9f1a10: f900073f     	str	xzr, [x25, #0x8]
  9f1a14: 91242274     	add	x20, x19, #0x908
  9f1a18: f9000b3f     	str	xzr, [x25, #0x10]
  9f1a1c: aa1403e0     	mov	x0, x20
  9f1a20: f904667f     	str	xzr, [x19, #0x8c8]
  9f1a24: d2800141     	mov	x1, #0xa                // =10
  9f1a28: f900075f     	str	xzr, [x26, #0x8]
  9f1a2c: f9000b5f     	str	xzr, [x26, #0x10]
  9f1a30: 1e2e1000     	fmov	s0, #1.00000000
  9f1a34: f947eea2     	ldr	x2, [x21, #0xfd8]
  9f1a38: f9047e7f     	str	xzr, [x19, #0x8f8]
  9f1a3c: 91006042     	add	x2, x2, #0x18
  9f1a40: f9047262     	str	x2, [x19, #0x8e0]
  9f1a44: f9000f1f     	str	xzr, [x24, #0x18]
  9f1a48: bd090a60     	str	s0, [x19, #0x908]
  9f1a4c: f900069f     	str	xzr, [x20, #0x8]
  9f1a50: 94075132     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f1a54: f9000700     	str	x0, [x24, #0x8]
  9f1a58: f100041f     	cmp	x0, #0x1
  9f1a5c: 540005c0     	b.eq	0x9f1b14 <_ZN7cocos2d9FileUtilsC2Ev+0x200>
  9f1a60: 92fc0001     	mov	x1, #0x1fffffffffffffff // =2305843009213693951
  9f1a64: eb01001f     	cmp	x0, x1
  9f1a68: 540005e8     	b.hi	0x9f1b24 <_ZN7cocos2d9FileUtilsC2Ev+0x210>
  9f1a6c: d37df014     	lsl	x20, x0, #3
  9f1a70: aa1403e0     	mov	x0, x20
  9f1a74: 94062fe5     	bl	0xb7da08 <_Znwm>
  9f1a78: 52800001     	mov	w1, #0x0                // =0
  9f1a7c: aa1403e2     	mov	x2, x20
  9f1a80: aa0003fb     	mov	x27, x0
  9f1a84: 97e6a52b     	bl	0x39af30 <memset@plt>
  9f1a88: d00013c1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f1a8c: f904767b     	str	x27, [x19, #0x8e8]
  9f1a90: 91248260     	add	x0, x19, #0x920
  9f1a94: 91330021     	add	x1, x1, #0xcc0
  9f1a98: 910183a2     	add	x2, x29, #0x60
  9f1a9c: 9407554d     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f1aa0: 9124c261     	add	x1, x19, #0x930
  9f1aa4: f904967f     	str	xzr, [x19, #0x928]
  9f1aa8: 91256260     	add	x0, x19, #0x958
  9f1aac: a9007c3f     	stp	xzr, xzr, [x1]
  9f1ab0: a9017c3f     	stp	xzr, xzr, [x1, #0x10]
  9f1ab4: f904aa7f     	str	xzr, [x19, #0x950]
  9f1ab8: a9007c1f     	stp	xzr, xzr, [x0]
  9f1abc: a9017c1f     	stp	xzr, xzr, [x0, #0x10]
  9f1ac0: f904be7f     	str	xzr, [x19, #0x978]
  9f1ac4: b909827f     	str	wzr, [x19, #0x980]
  9f1ac8: b909867f     	str	wzr, [x19, #0x984]
  9f1acc: f94037a1     	ldr	x1, [x29, #0x68]
  9f1ad0: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9f1ad4: 910062b5     	add	x21, x21, #0x18
  9f1ad8: f904c675     	str	x21, [x19, #0x988]
  9f1adc: f940e6d6     	ldr	x22, [x22, #0x1c8]
  9f1ae0: f94002c0     	ldr	x0, [x22]
  9f1ae4: eb00003f     	cmp	x1, x0
  9f1ae8: 540001c1     	b.ne	0x9f1b20 <_ZN7cocos2d9FileUtilsC2Ev+0x20c>
  9f1aec: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f1af0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f1af4: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f1af8: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f1afc: f9402bfb     	ldr	x27, [sp, #0x50]
  9f1b00: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9f1b04: d65f03c0     	ret
  9f1b08: f9001aff     	str	xzr, [x23, #0x30]
  9f1b0c: 9122a260     	add	x0, x19, #0x8a8
  9f1b10: 17ffffba     	b	0x9f19f8 <_ZN7cocos2d9FileUtilsC2Ev+0xe4>
  9f1b14: f9001b1f     	str	xzr, [x24, #0x30]
  9f1b18: 9124627b     	add	x27, x19, #0x918
  9f1b1c: 17ffffdb     	b	0x9f1a88 <_ZN7cocos2d9FileUtilsC2Ev+0x174>
  9f1b20: 97e6a620     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f1b24: 94074d55     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>
  9f1b28: aa0003f4     	mov	x20, x0
  9f1b2c: f9447260     	ldr	x0, [x19, #0x8e0]
  9f1b30: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9f1b34: d1006000     	sub	x0, x0, #0x18
  9f1b38: eb15001f     	cmp	x0, x21
  9f1b3c: 54000060     	b.eq	0x9f1b48 <_ZN7cocos2d9FileUtilsC2Ev+0x234>
  9f1b40: 910183a1     	add	x1, x29, #0x60
  9f1b44: 97e6b64f     	bl	0x39f480 <.text+0x3170>
  9f1b48: f9446660     	ldr	x0, [x19, #0x8c8]
  9f1b4c: f9400741     	ldr	x1, [x26, #0x8]
  9f1b50: 97e6b65c     	bl	0x39f4c0 <.text+0x31b0>
  9f1b54: f9446660     	ldr	x0, [x19, #0x8c8]
  9f1b58: b4000040     	cbz	x0, 0x9f1b60 <_ZN7cocos2d9FileUtilsC2Ev+0x24c>
  9f1b5c: 940628eb     	bl	0xb7bf08 <_ZdlPv>
  9f1b60: f9445a60     	ldr	x0, [x19, #0x8b0]
  9f1b64: f9400721     	ldr	x1, [x25, #0x8]
  9f1b68: 97e6b656     	bl	0x39f4c0 <.text+0x31b0>
  9f1b6c: f9445a60     	ldr	x0, [x19, #0x8b0]
  9f1b70: b4000040     	cbz	x0, 0x9f1b78 <_ZN7cocos2d9FileUtilsC2Ev+0x264>
  9f1b74: 940628e5     	bl	0xb7bf08 <_ZdlPv>
  9f1b78: aa1703e0     	mov	x0, x23
  9f1b7c: 97e73978     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f1b80: aa1403e0     	mov	x0, x20
  9f1b84: 9407c4d7     	bl	0xbe2ee0 <_Unwind_Resume>
  9f1b88: aa0003f4     	mov	x20, x0
  9f1b8c: aa1803e0     	mov	x0, x24
  9f1b90: 97f5ed0a     	bl	0x76cfb8 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f1b94: 17ffffe6     	b	0x9f1b2c <_ZN7cocos2d9FileUtilsC2Ev+0x218>

00000000009f1b98 <_ZN7cocos2d9FileUtilsD2Ev>:
  9f1b98: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f1b9c: d0002a81     	adrp	x1, 0xf43000
  9f1ba0: 910003fd     	mov	x29, sp
  9f1ba4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f1ba8: f0002a75     	adrp	x21, 0xf40000
  9f1bac: aa0003f6     	mov	x22, x0
  9f1bb0: f9428c21     	ldr	x1, [x1, #0x518]
  9f1bb4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1bb8: f940e6a2     	ldr	x2, [x21, #0x1c8]
  9f1bbc: 91004021     	add	x1, x1, #0x10
  9f1bc0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f1bc4: f90023f9     	str	x25, [sp, #0x40]
  9f1bc8: f9400042     	ldr	x2, [x2]
  9f1bcc: f9449400     	ldr	x0, [x0, #0x928]
  9f1bd0: f9002fa2     	str	x2, [x29, #0x58]
  9f1bd4: f90002c1     	str	x1, [x22]
  9f1bd8: b4000080     	cbz	x0, 0x9f1be8 <_ZN7cocos2d9FileUtilsD2Ev+0x50>
  9f1bdc: f9400001     	ldr	x1, [x0]
  9f1be0: f9400421     	ldr	x1, [x1, #0x8]
  9f1be4: d63f0020     	blr	x1
  9f1be8: b94986c0     	ldr	w0, [x22, #0x984]
  9f1bec: f90496df     	str	xzr, [x22, #0x928]
  9f1bf0: 35000d40     	cbnz	w0, 0x9f1d98 <_ZN7cocos2d9FileUtilsD2Ev+0x200>
  9f1bf4: 90002ad4     	adrp	x20, 0xf49000
  9f1bf8: f944c6c1     	ldr	x1, [x22, #0x988]
  9f1bfc: d1006020     	sub	x0, x1, #0x18
  9f1c00: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1c04: eb02001f     	cmp	x0, x2
  9f1c08: 54000e41     	b.ne	0x9f1dd0 <_ZN7cocos2d9FileUtilsD2Ev+0x238>
  9f1c0c: f94492c1     	ldr	x1, [x22, #0x920]
  9f1c10: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1c14: d1006020     	sub	x0, x1, #0x18
  9f1c18: eb02001f     	cmp	x0, x2
  9f1c1c: 540010e1     	b.ne	0x9f1e38 <_ZN7cocos2d9FileUtilsD2Ev+0x2a0>
  9f1c20: 9123a2c0     	add	x0, x22, #0x8e8
  9f1c24: 97f5ece5     	bl	0x76cfb8 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f1c28: f94472c1     	ldr	x1, [x22, #0x8e0]
  9f1c2c: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1c30: d1006020     	sub	x0, x1, #0x18
  9f1c34: eb02001f     	cmp	x0, x2
  9f1c38: 54000e61     	b.ne	0x9f1e04 <_ZN7cocos2d9FileUtilsD2Ev+0x26c>
  9f1c3c: f94466d3     	ldr	x19, [x22, #0x8c8]
  9f1c40: f9446ad7     	ldr	x23, [x22, #0x8d0]
  9f1c44: eb17027f     	cmp	x19, x23
  9f1c48: 54000360     	b.eq	0x9f1cb4 <_ZN7cocos2d9FileUtilsD2Ev+0x11c>
  9f1c4c: f0002a98     	adrp	x24, 0xf44000
  9f1c50: 910143b9     	add	x25, x29, #0x50
  9f1c54: 14000004     	b	0x9f1c64 <_ZN7cocos2d9FileUtilsD2Ev+0xcc>
  9f1c58: 91002273     	add	x19, x19, #0x8
  9f1c5c: eb1302ff     	cmp	x23, x19
  9f1c60: 54000280     	b.eq	0x9f1cb0 <_ZN7cocos2d9FileUtilsD2Ev+0x118>
  9f1c64: f9400261     	ldr	x1, [x19]
  9f1c68: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1c6c: d1006020     	sub	x0, x1, #0x18
  9f1c70: eb02001f     	cmp	x0, x2
  9f1c74: 54ffff20     	b.eq	0x9f1c58 <_ZN7cocos2d9FileUtilsD2Ev+0xc0>
  9f1c78: f9445302     	ldr	x2, [x24, #0x8a0]
  9f1c7c: b4000862     	cbz	x2, 0x9f1d88 <_ZN7cocos2d9FileUtilsD2Ev+0x1f0>
  9f1c80: d1002021     	sub	x1, x1, #0x8
  9f1c84: 885ffc22     	ldaxr	w2, [x1]
  9f1c88: 51000443     	sub	w3, w2, #0x1
  9f1c8c: 8804fc23     	stlxr	w4, w3, [x1]
  9f1c90: 35ffffa4     	cbnz	w4, 0x9f1c84 <_ZN7cocos2d9FileUtilsD2Ev+0xec>
  9f1c94: 6b1f005f     	cmp	w2, wzr
  9f1c98: 54fffe0c     	b.gt	0x9f1c58 <_ZN7cocos2d9FileUtilsD2Ev+0xc0>
  9f1c9c: aa1903e1     	mov	x1, x25
  9f1ca0: 91002273     	add	x19, x19, #0x8
  9f1ca4: 940762c6     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f1ca8: eb1302ff     	cmp	x23, x19
  9f1cac: 54fffdc1     	b.ne	0x9f1c64 <_ZN7cocos2d9FileUtilsD2Ev+0xcc>
  9f1cb0: f94466d7     	ldr	x23, [x22, #0x8c8]
  9f1cb4: b4000077     	cbz	x23, 0x9f1cc0 <_ZN7cocos2d9FileUtilsD2Ev+0x128>
  9f1cb8: aa1703e0     	mov	x0, x23
  9f1cbc: 94062893     	bl	0xb7bf08 <_ZdlPv>
  9f1cc0: f9445ad3     	ldr	x19, [x22, #0x8b0]
  9f1cc4: f9445ed7     	ldr	x23, [x22, #0x8b8]
  9f1cc8: eb17027f     	cmp	x19, x23
  9f1ccc: 54000360     	b.eq	0x9f1d38 <_ZN7cocos2d9FileUtilsD2Ev+0x1a0>
  9f1cd0: f0002a98     	adrp	x24, 0xf44000
  9f1cd4: 910143b9     	add	x25, x29, #0x50
  9f1cd8: 14000004     	b	0x9f1ce8 <_ZN7cocos2d9FileUtilsD2Ev+0x150>
  9f1cdc: 91002273     	add	x19, x19, #0x8
  9f1ce0: eb1302ff     	cmp	x23, x19
  9f1ce4: 54000280     	b.eq	0x9f1d34 <_ZN7cocos2d9FileUtilsD2Ev+0x19c>
  9f1ce8: f9400261     	ldr	x1, [x19]
  9f1cec: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1cf0: d1006020     	sub	x0, x1, #0x18
  9f1cf4: eb02001f     	cmp	x0, x2
  9f1cf8: 54ffff20     	b.eq	0x9f1cdc <_ZN7cocos2d9FileUtilsD2Ev+0x144>
  9f1cfc: f9445302     	ldr	x2, [x24, #0x8a0]
  9f1d00: b40003c2     	cbz	x2, 0x9f1d78 <_ZN7cocos2d9FileUtilsD2Ev+0x1e0>
  9f1d04: d1002021     	sub	x1, x1, #0x8
  9f1d08: 885ffc22     	ldaxr	w2, [x1]
  9f1d0c: 51000443     	sub	w3, w2, #0x1
  9f1d10: 8804fc23     	stlxr	w4, w3, [x1]
  9f1d14: 35ffffa4     	cbnz	w4, 0x9f1d08 <_ZN7cocos2d9FileUtilsD2Ev+0x170>
  9f1d18: 6b1f005f     	cmp	w2, wzr
  9f1d1c: 54fffe0c     	b.gt	0x9f1cdc <_ZN7cocos2d9FileUtilsD2Ev+0x144>
  9f1d20: aa1903e1     	mov	x1, x25
  9f1d24: 91002273     	add	x19, x19, #0x8
  9f1d28: 940762a5     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f1d2c: eb1302ff     	cmp	x23, x19
  9f1d30: 54fffdc1     	b.ne	0x9f1ce8 <_ZN7cocos2d9FileUtilsD2Ev+0x150>
  9f1d34: f9445ad7     	ldr	x23, [x22, #0x8b0]
  9f1d38: b4000077     	cbz	x23, 0x9f1d44 <_ZN7cocos2d9FileUtilsD2Ev+0x1ac>
  9f1d3c: aa1703e0     	mov	x0, x23
  9f1d40: 94062872     	bl	0xb7bf08 <_ZdlPv>
  9f1d44: 9121e2c0     	add	x0, x22, #0x878
  9f1d48: 97e73905     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f1d4c: f940e6b5     	ldr	x21, [x21, #0x1c8]
  9f1d50: f9402fa1     	ldr	x1, [x29, #0x58]
  9f1d54: f94002a0     	ldr	x0, [x21]
  9f1d58: eb00003f     	cmp	x1, x0
  9f1d5c: 54000a01     	b.ne	0x9f1e9c <_ZN7cocos2d9FileUtilsD2Ev+0x304>
  9f1d60: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f1d64: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f1d68: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f1d6c: f94023f9     	ldr	x25, [sp, #0x40]
  9f1d70: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f1d74: d65f03c0     	ret
  9f1d78: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1d7c: 51000443     	sub	w3, w2, #0x1
  9f1d80: b81f8023     	stur	w3, [x1, #-0x8]
  9f1d84: 17ffffe5     	b	0x9f1d18 <_ZN7cocos2d9FileUtilsD2Ev+0x180>
  9f1d88: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1d8c: 51000443     	sub	w3, w2, #0x1
  9f1d90: b81f8023     	stur	w3, [x1, #-0x8]
  9f1d94: 17ffffc0     	b	0x9f1c94 <_ZN7cocos2d9FileUtilsD2Ev+0xfc>
  9f1d98: 9400face     	bl	0xa308d0 <_ZN7cocos2d19ScriptEngineManager11getInstanceEv>
  9f1d9c: f9400002     	ldr	x2, [x0]
  9f1da0: b94986c1     	ldr	w1, [x22, #0x984]
  9f1da4: 90002ad4     	adrp	x20, 0xf49000
  9f1da8: aa0203e0     	mov	x0, x2
  9f1dac: f9400042     	ldr	x2, [x2]
  9f1db0: f9402842     	ldr	x2, [x2, #0x50]
  9f1db4: d63f0040     	blr	x2
  9f1db8: b90986df     	str	wzr, [x22, #0x984]
  9f1dbc: f944c6c1     	ldr	x1, [x22, #0x988]
  9f1dc0: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f1dc4: d1006020     	sub	x0, x1, #0x18
  9f1dc8: eb02001f     	cmp	x0, x2
  9f1dcc: 54fff200     	b.eq	0x9f1c0c <_ZN7cocos2d9FileUtilsD2Ev+0x74>
  9f1dd0: f0002a82     	adrp	x2, 0xf44000
  9f1dd4: f9445042     	ldr	x2, [x2, #0x8a0]
  9f1dd8: b4000522     	cbz	x2, 0x9f1e7c <_ZN7cocos2d9FileUtilsD2Ev+0x2e4>
  9f1ddc: d1002021     	sub	x1, x1, #0x8
  9f1de0: 885ffc22     	ldaxr	w2, [x1]
  9f1de4: 51000443     	sub	w3, w2, #0x1
  9f1de8: 8804fc23     	stlxr	w4, w3, [x1]
  9f1dec: 35ffffa4     	cbnz	w4, 0x9f1de0 <_ZN7cocos2d9FileUtilsD2Ev+0x248>
  9f1df0: 6b1f005f     	cmp	w2, wzr
  9f1df4: 54fff0cc     	b.gt	0x9f1c0c <_ZN7cocos2d9FileUtilsD2Ev+0x74>
  9f1df8: 910143a1     	add	x1, x29, #0x50
  9f1dfc: 94076270     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f1e00: 17ffff83     	b	0x9f1c0c <_ZN7cocos2d9FileUtilsD2Ev+0x74>
  9f1e04: f0002a82     	adrp	x2, 0xf44000
  9f1e08: f9445042     	ldr	x2, [x2, #0x8a0]
  9f1e0c: b4000402     	cbz	x2, 0x9f1e8c <_ZN7cocos2d9FileUtilsD2Ev+0x2f4>
  9f1e10: d1002021     	sub	x1, x1, #0x8
  9f1e14: 885ffc22     	ldaxr	w2, [x1]
  9f1e18: 51000443     	sub	w3, w2, #0x1
  9f1e1c: 8804fc23     	stlxr	w4, w3, [x1]
  9f1e20: 35ffffa4     	cbnz	w4, 0x9f1e14 <_ZN7cocos2d9FileUtilsD2Ev+0x27c>
  9f1e24: 6b1f005f     	cmp	w2, wzr
  9f1e28: 54fff0ac     	b.gt	0x9f1c3c <_ZN7cocos2d9FileUtilsD2Ev+0xa4>
  9f1e2c: 910143a1     	add	x1, x29, #0x50
  9f1e30: 94076263     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f1e34: 17ffff82     	b	0x9f1c3c <_ZN7cocos2d9FileUtilsD2Ev+0xa4>
  9f1e38: f0002a82     	adrp	x2, 0xf44000
  9f1e3c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f1e40: b4000162     	cbz	x2, 0x9f1e6c <_ZN7cocos2d9FileUtilsD2Ev+0x2d4>
  9f1e44: d1002021     	sub	x1, x1, #0x8
  9f1e48: 885ffc22     	ldaxr	w2, [x1]
  9f1e4c: 51000443     	sub	w3, w2, #0x1
  9f1e50: 8804fc23     	stlxr	w4, w3, [x1]
  9f1e54: 35ffffa4     	cbnz	w4, 0x9f1e48 <_ZN7cocos2d9FileUtilsD2Ev+0x2b0>
  9f1e58: 6b1f005f     	cmp	w2, wzr
  9f1e5c: 54ffee2c     	b.gt	0x9f1c20 <_ZN7cocos2d9FileUtilsD2Ev+0x88>
  9f1e60: 910143a1     	add	x1, x29, #0x50
  9f1e64: 94076256     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f1e68: 17ffff6e     	b	0x9f1c20 <_ZN7cocos2d9FileUtilsD2Ev+0x88>
  9f1e6c: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1e70: 51000443     	sub	w3, w2, #0x1
  9f1e74: b81f8023     	stur	w3, [x1, #-0x8]
  9f1e78: 17fffff8     	b	0x9f1e58 <_ZN7cocos2d9FileUtilsD2Ev+0x2c0>
  9f1e7c: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1e80: 51000443     	sub	w3, w2, #0x1
  9f1e84: b81f8023     	stur	w3, [x1, #-0x8]
  9f1e88: 17ffffda     	b	0x9f1df0 <_ZN7cocos2d9FileUtilsD2Ev+0x258>
  9f1e8c: b85f8022     	ldur	w2, [x1, #-0x8]
  9f1e90: 51000443     	sub	w3, w2, #0x1
  9f1e94: b81f8023     	stur	w3, [x1, #-0x8]
  9f1e98: 17ffffe3     	b	0x9f1e24 <_ZN7cocos2d9FileUtilsD2Ev+0x28c>
  9f1e9c: 97e6a541     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f1ea0 <_ZN7cocos2d9FileUtilsD0Ev>:
  9f1ea0: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f1ea4: 910003fd     	mov	x29, sp
  9f1ea8: f9000bf3     	str	x19, [sp, #0x10]
  9f1eac: aa0003f3     	mov	x19, x0
  9f1eb0: 97ffff3a     	bl	0x9f1b98 <_ZN7cocos2d9FileUtilsD2Ev>
  9f1eb4: aa1303e0     	mov	x0, x19
  9f1eb8: f9400bf3     	ldr	x19, [sp, #0x10]
  9f1ebc: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f1ec0: 14062812     	b	0xb7bf08 <_ZdlPv>

00000000009f1ec4 <_ZN7cocos2d9FileUtils27setFilenameLookupDictionaryERKSt13unordered_mapISsNS_5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEE>:
  9f1ec4: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9f1ec8: 910003fd     	mov	x29, sp
  9f1ecc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1ed0: aa0003f3     	mov	x19, x0
  9f1ed4: f9447c00     	ldr	x0, [x0, #0x8f8]
  9f1ed8: f90013f5     	str	x21, [sp, #0x20]
  9f1edc: aa0103f5     	mov	x21, x1
  9f1ee0: 97ffeeb8     	bl	0x9ed9c0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xd4>
  9f1ee4: f9447a62     	ldr	x2, [x19, #0x8f0]
  9f1ee8: 52800001     	mov	w1, #0x0                // =0
  9f1eec: f9447660     	ldr	x0, [x19, #0x8e8]
  9f1ef0: d37df042     	lsl	x2, x2, #3
  9f1ef4: 97e6a40f     	bl	0x39af30 <memset@plt>
  9f1ef8: f904827f     	str	xzr, [x19, #0x900]
  9f1efc: f9047e7f     	str	xzr, [x19, #0x8f8]
  9f1f00: 9121e260     	add	x0, x19, #0x878
  9f1f04: aa1503e1     	mov	x1, x21
  9f1f08: f94013f5     	ldr	x21, [sp, #0x20]
  9f1f0c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f1f10: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9f1f14: 17e9347a     	b	0x43f0fc <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEEaSERKSH_>

00000000009f1f18 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi>:
  9f1f18: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f1f1c: 910003fd     	mov	x29, sp
  9f1f20: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f1f24: f0002a74     	adrp	x20, 0xf40000
  9f1f28: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f1f2c: aa0003f6     	mov	x22, x0
  9f1f30: 91262000     	add	x0, x0, #0x988
  9f1f34: f940e683     	ldr	x3, [x20, #0x1c8]
  9f1f38: 910103b5     	add	x21, x29, #0x40
  9f1f3c: f9001fa2     	str	x2, [x29, #0x38]
  9f1f40: f9400063     	ldr	x3, [x3]
  9f1f44: f9002fa3     	str	x3, [x29, #0x58]
  9f1f48: 940762de     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9f1f4c: f90023bf     	str	xzr, [x29, #0x40]
  9f1f50: f9401fa2     	ldr	x2, [x29, #0x38]
  9f1f54: d2800800     	mov	x0, #0x40               // =64
  9f1f58: b90986c2     	str	w2, [x22, #0x984]
  9f1f5c: 94062eab     	bl	0xb7da08 <_Znwm>
  9f1f60: aa0003e2     	mov	x2, x0
  9f1f64: 52800021     	mov	w1, #0x1                // =1
  9f1f68: b9000801     	str	w1, [x0, #0x8]
  9f1f6c: b9000c01     	str	w1, [x0, #0xc]
  9f1f70: b0002aa1     	adrp	x1, 0xf46000
  9f1f74: aa0003f3     	mov	x19, x0
  9f1f78: f947a021     	ldr	x1, [x1, #0xf40]
  9f1f7c: 91004021     	add	x1, x1, #0x10
  9f1f80: f8010441     	str	x1, [x2], #0x10
  9f1f84: d0002a61     	adrp	x1, 0xf3f000
  9f1f88: f900045f     	str	xzr, [x2, #0x8]
  9f1f8c: f900085f     	str	xzr, [x2, #0x10]
  9f1f90: f945e821     	ldr	x1, [x1, #0xbd0]
  9f1f94: f9001416     	str	x22, [x0, #0x28]
  9f1f98: 91004021     	add	x1, x1, #0x10
  9f1f9c: f9000801     	str	x1, [x0, #0x10]
  9f1fa0: d0002aa1     	adrp	x1, 0xf47000
  9f1fa4: f9401821     	ldr	x1, [x1, #0x30]
  9f1fa8: f9001801     	str	x1, [x0, #0x30]
  9f1fac: 90002aa1     	adrp	x1, 0xf45000
  9f1fb0: f9001c1f     	str	xzr, [x0, #0x38]
  9f1fb4: f9446c21     	ldr	x1, [x1, #0x8d8]
  9f1fb8: 97ffed3b     	bl	0x9ed4a4 <_ZNSt23_Sp_counted_ptr_inplaceINSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS5_EEEESaISC_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info>
  9f1fbc: f90027a0     	str	x0, [x29, #0x48]
  9f1fc0: 910123a1     	add	x1, x29, #0x48
  9f1fc4: aa1503e0     	mov	x0, x21
  9f1fc8: f9002bb3     	str	x19, [x29, #0x50]
  9f1fcc: 940766a8     	bl	0xbcba6c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4d444>
  9f1fd0: f9402bb3     	ldr	x19, [x29, #0x50]
  9f1fd4: b4000173     	cbz	x19, 0x9f2000 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0xe8>
  9f1fd8: f0002a80     	adrp	x0, 0xf44000
  9f1fdc: f9445000     	ldr	x0, [x0, #0x8a0]
  9f1fe0: b4000300     	cbz	x0, 0x9f2040 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x128>
  9f1fe4: 91002260     	add	x0, x19, #0x8
  9f1fe8: 885ffc01     	ldaxr	w1, [x0]
  9f1fec: 51000422     	sub	w2, w1, #0x1
  9f1ff0: 8803fc02     	stlxr	w3, w2, [x0]
  9f1ff4: 35ffffa3     	cbnz	w3, 0x9f1fe8 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0xd0>
  9f1ff8: 7100043f     	cmp	w1, #0x1
  9f1ffc: 540003c0     	b.eq	0x9f2074 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x15c>
  9f2000: aa1503e0     	mov	x0, x21
  9f2004: 94076634     	bl	0xbcb8d4 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4d2ac>
  9f2008: f94023a0     	ldr	x0, [x29, #0x40]
  9f200c: d2800001     	mov	x1, #0x0                // =0
  9f2010: 97e6a5f4     	bl	0x39b7e0 <pthread_equal@plt>
  9f2014: 340005a0     	cbz	w0, 0x9f20c8 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x1b0>
  9f2018: f940e694     	ldr	x20, [x20, #0x1c8]
  9f201c: 52800020     	mov	w0, #0x1                // =1
  9f2020: f9402fa2     	ldr	x2, [x29, #0x58]
  9f2024: f9400281     	ldr	x1, [x20]
  9f2028: eb01005f     	cmp	x2, x1
  9f202c: 54000501     	b.ne	0x9f20cc <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x1b4>
  9f2030: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f2034: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2038: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f203c: d65f03c0     	ret
  9f2040: b9400a60     	ldr	w0, [x19, #0x8]
  9f2044: 51000401     	sub	w1, w0, #0x1
  9f2048: 7100041f     	cmp	w0, #0x1
  9f204c: b9000a61     	str	w1, [x19, #0x8]
  9f2050: 54fffd81     	b.ne	0x9f2000 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0xe8>
  9f2054: f9400261     	ldr	x1, [x19]
  9f2058: aa1303e0     	mov	x0, x19
  9f205c: f9400821     	ldr	x1, [x1, #0x10]
  9f2060: d63f0020     	blr	x1
  9f2064: b9400e60     	ldr	w0, [x19, #0xc]
  9f2068: 51000401     	sub	w1, w0, #0x1
  9f206c: b9000e61     	str	w1, [x19, #0xc]
  9f2070: 1400000a     	b	0x9f2098 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x180>
  9f2074: f9400261     	ldr	x1, [x19]
  9f2078: aa1303e0     	mov	x0, x19
  9f207c: f9400821     	ldr	x1, [x1, #0x10]
  9f2080: d63f0020     	blr	x1
  9f2084: 91003261     	add	x1, x19, #0xc
  9f2088: 885ffc20     	ldaxr	w0, [x1]
  9f208c: 51000402     	sub	w2, w0, #0x1
  9f2090: 8803fc22     	stlxr	w3, w2, [x1]
  9f2094: 35ffffa3     	cbnz	w3, 0x9f2088 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x170>
  9f2098: 7100041f     	cmp	w0, #0x1
  9f209c: 54fffb21     	b.ne	0x9f2000 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0xe8>
  9f20a0: f9400261     	ldr	x1, [x19]
  9f20a4: aa1303e0     	mov	x0, x19
  9f20a8: f9400c21     	ldr	x1, [x1, #0x18]
  9f20ac: d63f0020     	blr	x1
  9f20b0: 17ffffd4     	b	0x9f2000 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0xe8>
  9f20b4: aa0003f3     	mov	x19, x0
  9f20b8: f94023a0     	ldr	x0, [x29, #0x40]
  9f20bc: d2800001     	mov	x1, #0x0                // =0
  9f20c0: 97e6a5c8     	bl	0x39b7e0 <pthread_equal@plt>
  9f20c4: 35000100     	cbnz	w0, 0x9f20e4 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x1cc>
  9f20c8: 94062cb8     	bl	0xb7d3a8 <_ZSt9terminatev>
  9f20cc: 97e6a4b5     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f20d0: f9402ba1     	ldr	x1, [x29, #0x50]
  9f20d4: aa0003f3     	mov	x19, x0
  9f20d8: b4000061     	cbz	x1, 0x9f20e4 <_ZN7cocos2d9FileUtils11uncompress2ERKSsi+0x1cc>
  9f20dc: aa0103e0     	mov	x0, x1
  9f20e0: 97ee354f     	bl	0x57f61c <_ZNSt5dequeISsSaISsEED2Ev+0x2e0>
  9f20e4: aa1303e0     	mov	x0, x19
  9f20e8: 9407c37e     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f20ec <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE>:
  9f20ec: a9b67bfd     	stp	x29, x30, [sp, #-0xa0]!
  9f20f0: 910003fd     	mov	x29, sp
  9f20f4: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f20f8: aa0003f9     	mov	x25, x0
  9f20fc: d0002a60     	adrp	x0, 0xf40000
  9f2100: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f2104: aa0103f5     	mov	x21, x1
  9f2108: f0002ab6     	adrp	x22, 0xf49000
  9f210c: f940e401     	ldr	x1, [x0, #0x1c8]
  9f2110: 910243ba     	add	x26, x29, #0x90
  9f2114: f9447f20     	ldr	x0, [x25, #0x8f8]
  9f2118: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f211c: f9400021     	ldr	x1, [x1]
  9f2120: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f2124: f9004fa1     	str	x1, [x29, #0x98]
  9f2128: d0002a98     	adrp	x24, 0xf44000
  9f212c: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f2130: 97ffee24     	bl	0x9ed9c0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xd4>
  9f2134: f9447b22     	ldr	x2, [x25, #0x8f0]
  9f2138: 52800001     	mov	w1, #0x0                // =0
  9f213c: f9447720     	ldr	x0, [x25, #0x8e8]
  9f2140: d37df042     	lsl	x2, x2, #3
  9f2144: 97e6a37b     	bl	0x39af30 <memset@plt>
  9f2148: f9446737     	ldr	x23, [x25, #0x8c8]
  9f214c: f9446b34     	ldr	x20, [x25, #0x8d0]
  9f2150: f9047f3f     	str	xzr, [x25, #0x8f8]
  9f2154: aa1703f3     	mov	x19, x23
  9f2158: f904833f     	str	xzr, [x25, #0x900]
  9f215c: eb1402ff     	cmp	x23, x20
  9f2160: 540000a1     	b.ne	0x9f2174 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x88>
  9f2164: 14000017     	b	0x9f21c0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0xd4>
  9f2168: 91002273     	add	x19, x19, #0x8
  9f216c: eb13029f     	cmp	x20, x19
  9f2170: 54000280     	b.eq	0x9f21c0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0xd4>
  9f2174: f9400261     	ldr	x1, [x19]
  9f2178: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f217c: d1006020     	sub	x0, x1, #0x18
  9f2180: eb02001f     	cmp	x0, x2
  9f2184: 54ffff20     	b.eq	0x9f2168 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x7c>
  9f2188: f9445302     	ldr	x2, [x24, #0x8a0]
  9f218c: b40018e2     	cbz	x2, 0x9f24a8 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x3bc>
  9f2190: d1002021     	sub	x1, x1, #0x8
  9f2194: 885ffc22     	ldaxr	w2, [x1]
  9f2198: 51000443     	sub	w3, w2, #0x1
  9f219c: 8804fc23     	stlxr	w4, w3, [x1]
  9f21a0: 35ffffa4     	cbnz	w4, 0x9f2194 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0xa8>
  9f21a4: 6b1f005f     	cmp	w2, wzr
  9f21a8: 54fffe0c     	b.gt	0x9f2168 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x7c>
  9f21ac: aa1a03e1     	mov	x1, x26
  9f21b0: 91002273     	add	x19, x19, #0x8
  9f21b4: 94076182     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f21b8: eb13029f     	cmp	x20, x19
  9f21bc: 54fffdc1     	b.ne	0x9f2174 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x88>
  9f21c0: f9046b37     	str	x23, [x25, #0x8d0]
  9f21c4: f94002b4     	ldr	x20, [x21]
  9f21c8: f94006bb     	ldr	x27, [x21, #0x8]
  9f21cc: eb1b029f     	cmp	x20, x27
  9f21d0: 540017a0     	b.eq	0x9f24c4 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x3d8>
  9f21d4: 9101e3a0     	add	x0, x29, #0x78
  9f21d8: f90033a0     	str	x0, [x29, #0x60]
  9f21dc: f0001380     	adrp	x0, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9f21e0: 5280001a     	mov	w26, #0x0               // =0
  9f21e4: 913d4000     	add	x0, x0, #0xf50
  9f21e8: f0002ab6     	adrp	x22, 0xf49000
  9f21ec: 910203b8     	add	x24, x29, #0x80
  9f21f0: 910223b3     	add	x19, x29, #0x88
  9f21f4: 9123833c     	add	x28, x25, #0x8e0
  9f21f8: 910243b7     	add	x23, x29, #0x90
  9f21fc: f90037a0     	str	x0, [x29, #0x68]
  9f2200: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f2204: aa1903e0     	mov	x0, x25
  9f2208: f9400323     	ldr	x3, [x25]
  9f220c: aa1403e1     	mov	x1, x20
  9f2210: 91006042     	add	x2, x2, #0x18
  9f2214: f9000262     	str	x2, [x19]
  9f2218: f9000302     	str	x2, [x24]
  9f221c: f9408062     	ldr	x2, [x3, #0x100]
  9f2220: d63f0040     	blr	x2
  9f2224: 53001c00     	uxtb	w0, w0
  9f2228: 35000080     	cbnz	w0, 0x9f2238 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x14c>
  9f222c: aa1803e0     	mov	x0, x24
  9f2230: aa1c03e1     	mov	x1, x28
  9f2234: 94076223     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9f2238: aa1703e0     	mov	x0, x23
  9f223c: aa1803e1     	mov	x1, x24
  9f2240: 940761c0     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f2244: aa1703e0     	mov	x0, x23
  9f2248: aa1403e1     	mov	x1, x20
  9f224c: 940755f8     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9f2250: aa1303e0     	mov	x0, x19
  9f2254: aa1703e1     	mov	x1, x23
  9f2258: 94075765     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9f225c: f94002e1     	ldr	x1, [x23]
  9f2260: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f2264: d1006020     	sub	x0, x1, #0x18
  9f2268: eb02001f     	cmp	x0, x2
  9f226c: 54000ec1     	b.ne	0x9f2444 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x358>
  9f2270: f9400260     	ldr	x0, [x19]
  9f2274: f85e8015     	ldur	x21, [x0, #-0x18]
  9f2278: b40001d5     	cbz	x21, 0x9f22b0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x1c4>
  9f227c: b85f8001     	ldur	w1, [x0, #-0x8]
  9f2280: d10006b5     	sub	x21, x21, #0x1
  9f2284: 37f80081     	tbnz	w1, #0x1f, 0x9f2294 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x1a8>
  9f2288: aa1303e0     	mov	x0, x19
  9f228c: 94075c0d     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9f2290: f9400260     	ldr	x0, [x19]
  9f2294: 38f56800     	ldrsb	w0, [x0, x21]
  9f2298: 7100bc1f     	cmp	w0, #0x2f
  9f229c: 540000a0     	b.eq	0x9f22b0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x1c4>
  9f22a0: f94037a1     	ldr	x1, [x29, #0x68]
  9f22a4: aa1303e0     	mov	x0, x19
  9f22a8: d2800022     	mov	x2, #0x1                // =1
  9f22ac: 94075650     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9f22b0: 350000fa     	cbnz	w26, 0x9f22cc <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x1e0>
  9f22b4: f9400260     	ldr	x0, [x19]
  9f22b8: f9400381     	ldr	x1, [x28]
  9f22bc: f85e8002     	ldur	x2, [x0, #-0x18]
  9f22c0: f85e8023     	ldur	x3, [x1, #-0x18]
  9f22c4: eb03005f     	cmp	x2, x3
  9f22c8: 54000620     	b.eq	0x9f238c <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x2a0>
  9f22cc: 91232335     	add	x21, x25, #0x8c8
  9f22d0: f94006a0     	ldr	x0, [x21, #0x8]
  9f22d4: f9400aa1     	ldr	x1, [x21, #0x10]
  9f22d8: eb01001f     	cmp	x0, x1
  9f22dc: 54000680     	b.eq	0x9f23ac <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x2c0>
  9f22e0: b4000080     	cbz	x0, 0x9f22f0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x204>
  9f22e4: aa1303e1     	mov	x1, x19
  9f22e8: 94076196     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f22ec: f94006a0     	ldr	x0, [x21, #0x8]
  9f22f0: 91002000     	add	x0, x0, #0x8
  9f22f4: f90006a0     	str	x0, [x21, #0x8]
  9f22f8: f9400261     	ldr	x1, [x19]
  9f22fc: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f2300: d1006020     	sub	x0, x1, #0x18
  9f2304: eb02001f     	cmp	x0, x2
  9f2308: 54000621     	b.ne	0x9f23cc <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x2e0>
  9f230c: f9400301     	ldr	x1, [x24]
  9f2310: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f2314: d1006020     	sub	x0, x1, #0x18
  9f2318: eb02001f     	cmp	x0, x2
  9f231c: 540007a1     	b.ne	0x9f2410 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x324>
  9f2320: 91002294     	add	x20, x20, #0x8
  9f2324: eb14037f     	cmp	x27, x20
  9f2328: 54fff6c1     	b.ne	0x9f2200 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x114>
  9f232c: 3500017a     	cbnz	w26, 0x9f2358 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x26c>
  9f2330: f94006a0     	ldr	x0, [x21, #0x8]
  9f2334: f9400ab3     	ldr	x19, [x21, #0x10]
  9f2338: 91238321     	add	x1, x25, #0x8e0
  9f233c: eb00027f     	cmp	x19, x0
  9f2340: 54000bc0     	b.eq	0x9f24b8 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x3cc>
  9f2344: b4000060     	cbz	x0, 0x9f2350 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x264>
  9f2348: 9407617e     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f234c: f94006a0     	ldr	x0, [x21, #0x8]
  9f2350: 91002000     	add	x0, x0, #0x8
  9f2354: f90006a0     	str	x0, [x21, #0x8]
  9f2358: d0002a60     	adrp	x0, 0xf40000
  9f235c: f9404fa1     	ldr	x1, [x29, #0x98]
  9f2360: f940e400     	ldr	x0, [x0, #0x1c8]
  9f2364: f9400000     	ldr	x0, [x0]
  9f2368: eb00003f     	cmp	x1, x0
  9f236c: 54000e61     	b.ne	0x9f2538 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x44c>
  9f2370: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f2374: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2378: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f237c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f2380: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f2384: a8ca7bfd     	ldp	x29, x30, [sp], #0xa0
  9f2388: d65f03c0     	ret
  9f238c: 91232335     	add	x21, x25, #0x8c8
  9f2390: 97e6a678     	bl	0x39bd70 <memcmp@plt>
  9f2394: 6b1f001f     	cmp	w0, wzr
  9f2398: 1a9f17fa     	cset	w26, eq
  9f239c: f94006a0     	ldr	x0, [x21, #0x8]
  9f23a0: f9400aa1     	ldr	x1, [x21, #0x10]
  9f23a4: eb01001f     	cmp	x0, x1
  9f23a8: 54fff9c1     	b.ne	0x9f22e0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x1f4>
  9f23ac: aa1503e0     	mov	x0, x21
  9f23b0: aa1303e1     	mov	x1, x19
  9f23b4: 97e6d38d     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f23b8: f9400261     	ldr	x1, [x19]
  9f23bc: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f23c0: d1006020     	sub	x0, x1, #0x18
  9f23c4: eb02001f     	cmp	x0, x2
  9f23c8: 54fffa20     	b.eq	0x9f230c <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x220>
  9f23cc: d0002a82     	adrp	x2, 0xf44000
  9f23d0: f9445042     	ldr	x2, [x2, #0x8a0]
  9f23d4: b4000522     	cbz	x2, 0x9f2478 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x38c>
  9f23d8: d1002021     	sub	x1, x1, #0x8
  9f23dc: 885ffc22     	ldaxr	w2, [x1]
  9f23e0: 51000443     	sub	w3, w2, #0x1
  9f23e4: 8804fc23     	stlxr	w4, w3, [x1]
  9f23e8: 35ffffa4     	cbnz	w4, 0x9f23dc <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x2f0>
  9f23ec: 6b1f005f     	cmp	w2, wzr
  9f23f0: 54fff8ec     	b.gt	0x9f230c <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x220>
  9f23f4: aa1703e1     	mov	x1, x23
  9f23f8: 940760f1     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f23fc: f9400301     	ldr	x1, [x24]
  9f2400: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f2404: d1006020     	sub	x0, x1, #0x18
  9f2408: eb02001f     	cmp	x0, x2
  9f240c: 54fff8a0     	b.eq	0x9f2320 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x234>
  9f2410: d0002a82     	adrp	x2, 0xf44000
  9f2414: f9445042     	ldr	x2, [x2, #0x8a0]
  9f2418: b4000402     	cbz	x2, 0x9f2498 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x3ac>
  9f241c: d1002021     	sub	x1, x1, #0x8
  9f2420: 885ffc22     	ldaxr	w2, [x1]
  9f2424: 51000443     	sub	w3, w2, #0x1
  9f2428: 8804fc23     	stlxr	w4, w3, [x1]
  9f242c: 35ffffa4     	cbnz	w4, 0x9f2420 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x334>
  9f2430: 6b1f005f     	cmp	w2, wzr
  9f2434: 54fff76c     	b.gt	0x9f2320 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x234>
  9f2438: aa1703e1     	mov	x1, x23
  9f243c: 940760e0     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f2440: 17ffffb8     	b	0x9f2320 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x234>
  9f2444: d0002a82     	adrp	x2, 0xf44000
  9f2448: f9445042     	ldr	x2, [x2, #0x8a0]
  9f244c: b40001e2     	cbz	x2, 0x9f2488 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x39c>
  9f2450: d1002021     	sub	x1, x1, #0x8
  9f2454: 885ffc22     	ldaxr	w2, [x1]
  9f2458: 51000443     	sub	w3, w2, #0x1
  9f245c: 8804fc23     	stlxr	w4, w3, [x1]
  9f2460: 35ffffa4     	cbnz	w4, 0x9f2454 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x368>
  9f2464: 6b1f005f     	cmp	w2, wzr
  9f2468: 54fff04c     	b.gt	0x9f2270 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x184>
  9f246c: f94033a1     	ldr	x1, [x29, #0x60]
  9f2470: 940760d3     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f2474: 17ffff7f     	b	0x9f2270 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x184>
  9f2478: b85f8022     	ldur	w2, [x1, #-0x8]
  9f247c: 51000443     	sub	w3, w2, #0x1
  9f2480: b81f8023     	stur	w3, [x1, #-0x8]
  9f2484: 17ffffda     	b	0x9f23ec <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x300>
  9f2488: b85f8022     	ldur	w2, [x1, #-0x8]
  9f248c: 51000443     	sub	w3, w2, #0x1
  9f2490: b81f8023     	stur	w3, [x1, #-0x8]
  9f2494: 17fffff4     	b	0x9f2464 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x378>
  9f2498: b85f8022     	ldur	w2, [x1, #-0x8]
  9f249c: 51000443     	sub	w3, w2, #0x1
  9f24a0: b81f8023     	stur	w3, [x1, #-0x8]
  9f24a4: 17ffffe3     	b	0x9f2430 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x344>
  9f24a8: b85f8022     	ldur	w2, [x1, #-0x8]
  9f24ac: 51000443     	sub	w3, w2, #0x1
  9f24b0: b81f8023     	stur	w3, [x1, #-0x8]
  9f24b4: 17ffff3c     	b	0x9f21a4 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0xb8>
  9f24b8: aa1503e0     	mov	x0, x21
  9f24bc: 97e6d34b     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f24c0: 17ffffa6     	b	0x9f2358 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x26c>
  9f24c4: 91232335     	add	x21, x25, #0x8c8
  9f24c8: aa1703e0     	mov	x0, x23
  9f24cc: 17ffff9a     	b	0x9f2334 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x248>
  9f24d0: aa0003f4     	mov	x20, x0
  9f24d4: f9404ba0     	ldr	x0, [x29, #0x90]
  9f24d8: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f24dc: d1006000     	sub	x0, x0, #0x18
  9f24e0: eb01001f     	cmp	x0, x1
  9f24e4: 54000060     	b.eq	0x9f24f0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x404>
  9f24e8: 9101e3a1     	add	x1, x29, #0x78
  9f24ec: 97e6b3e5     	bl	0x39f480 <.text+0x3170>
  9f24f0: f94047a0     	ldr	x0, [x29, #0x88]
  9f24f4: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f24f8: d1006000     	sub	x0, x0, #0x18
  9f24fc: eb01001f     	cmp	x0, x1
  9f2500: 54000060     	b.eq	0x9f250c <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x420>
  9f2504: 9101e3a1     	add	x1, x29, #0x78
  9f2508: 97e6b3de     	bl	0x39f480 <.text+0x3170>
  9f250c: f94043a0     	ldr	x0, [x29, #0x80]
  9f2510: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f2514: d1006000     	sub	x0, x0, #0x18
  9f2518: eb16001f     	cmp	x0, x22
  9f251c: 54000060     	b.eq	0x9f2528 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x43c>
  9f2520: aa1303e1     	mov	x1, x19
  9f2524: 97e6b3d7     	bl	0x39f480 <.text+0x3170>
  9f2528: aa1403e0     	mov	x0, x20
  9f252c: 9407c26d     	bl	0xbe2ee0 <_Unwind_Resume>
  9f2530: aa0003f4     	mov	x20, x0
  9f2534: 17ffffef     	b	0x9f24f0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x404>
  9f2538: 97e6a39a     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f253c: 17ffffe5     	b	0x9f24d0 <_ZN7cocos2d9FileUtils14setSearchPathsERKSt6vectorISsSaISsEE+0x3e4>

00000000009f2540 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb>:
  9f2540: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f2544: 910003fd     	mov	x29, sp
  9f2548: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f254c: d0002a75     	adrp	x21, 0xf40000
  9f2550: f9001bf7     	str	x23, [sp, #0x30]
  9f2554: 53001c57     	uxtb	w23, w2
  9f2558: 910143b6     	add	x22, x29, #0x50
  9f255c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2560: f940e6a2     	ldr	x2, [x21, #0x1c8]
  9f2564: aa0003f4     	mov	x20, x0
  9f2568: aa1603e0     	mov	x0, x22
  9f256c: f9400042     	ldr	x2, [x2]
  9f2570: f9002fa2     	str	x2, [x29, #0x58]
  9f2574: 940760f3     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f2578: f9402ba1     	ldr	x1, [x29, #0x50]
  9f257c: f85e8020     	ldur	x0, [x1, #-0x18]
  9f2580: b40001e0     	cbz	x0, 0x9f25bc <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x7c>
  9f2584: b85f8022     	ldur	w2, [x1, #-0x8]
  9f2588: d1000413     	sub	x19, x0, #0x1
  9f258c: 37f80082     	tbnz	w2, #0x1f, 0x9f259c <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x5c>
  9f2590: aa1603e0     	mov	x0, x22
  9f2594: 94075b4b     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9f2598: f9402ba1     	ldr	x1, [x29, #0x50]
  9f259c: 38f36820     	ldrsb	w0, [x1, x19]
  9f25a0: 7100bc1f     	cmp	w0, #0x2f
  9f25a4: 540000c0     	b.eq	0x9f25bc <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x7c>
  9f25a8: f0001381     	adrp	x1, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9f25ac: aa1603e0     	mov	x0, x22
  9f25b0: 913d4021     	add	x1, x1, #0xf50
  9f25b4: d2800022     	mov	x2, #0x1                // =1
  9f25b8: 9407558d     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9f25bc: 35000397     	cbnz	w23, 0x9f262c <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xec>
  9f25c0: 9122c294     	add	x20, x20, #0x8b0
  9f25c4: f9400680     	ldr	x0, [x20, #0x8]
  9f25c8: f9400a81     	ldr	x1, [x20, #0x10]
  9f25cc: eb01001f     	cmp	x0, x1
  9f25d0: 540005c0     	b.eq	0x9f2688 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x148>
  9f25d4: b4000080     	cbz	x0, 0x9f25e4 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xa4>
  9f25d8: aa1603e1     	mov	x1, x22
  9f25dc: 940760d9     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f25e0: f9400680     	ldr	x0, [x20, #0x8]
  9f25e4: 91002000     	add	x0, x0, #0x8
  9f25e8: f9000680     	str	x0, [x20, #0x8]
  9f25ec: f0002aa1     	adrp	x1, 0xf49000
  9f25f0: f9402ba2     	ldr	x2, [x29, #0x50]
  9f25f4: d1006040     	sub	x0, x2, #0x18
  9f25f8: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f25fc: eb01001f     	cmp	x0, x1
  9f2600: 540002a1     	b.ne	0x9f2654 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x114>
  9f2604: f940e6a0     	ldr	x0, [x21, #0x1c8]
  9f2608: f9402fa1     	ldr	x1, [x29, #0x58]
  9f260c: f9400000     	ldr	x0, [x0]
  9f2610: eb00003f     	cmp	x1, x0
  9f2614: 540004a1     	b.ne	0x9f26a8 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x168>
  9f2618: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f261c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2620: f9401bf7     	ldr	x23, [sp, #0x30]
  9f2624: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f2628: d65f03c0     	ret
  9f262c: f9445a81     	ldr	x1, [x20, #0x8b0]
  9f2630: 9122c280     	add	x0, x20, #0x8b0
  9f2634: aa1603e2     	mov	x2, x22
  9f2638: 97f5f060     	bl	0x76e7b8 <_ZNSt6vectorISsSaISsEE6insertEN9__gnu_cxx17__normal_iteratorIPKSsS1_EERS4_>
  9f263c: f0002aa1     	adrp	x1, 0xf49000
  9f2640: f9402ba2     	ldr	x2, [x29, #0x50]
  9f2644: d1006040     	sub	x0, x2, #0x18
  9f2648: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f264c: eb01001f     	cmp	x0, x1
  9f2650: 54fffda0     	b.eq	0x9f2604 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xc4>
  9f2654: d0002a81     	adrp	x1, 0xf44000
  9f2658: f9445021     	ldr	x1, [x1, #0x8a0]
  9f265c: b40001e1     	cbz	x1, 0x9f2698 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x158>
  9f2660: d1002042     	sub	x2, x2, #0x8
  9f2664: 885ffc41     	ldaxr	w1, [x2]
  9f2668: 51000423     	sub	w3, w1, #0x1
  9f266c: 8804fc43     	stlxr	w4, w3, [x2]
  9f2670: 35ffffa4     	cbnz	w4, 0x9f2664 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x124>
  9f2674: 6b1f003f     	cmp	w1, wzr
  9f2678: 54fffc6c     	b.gt	0x9f2604 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xc4>
  9f267c: 910123a1     	add	x1, x29, #0x48
  9f2680: 9407604f     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f2684: 17ffffe0     	b	0x9f2604 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xc4>
  9f2688: aa1403e0     	mov	x0, x20
  9f268c: aa1603e1     	mov	x1, x22
  9f2690: 97e6d2d6     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f2694: 17ffffd6     	b	0x9f25ec <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0xac>
  9f2698: b85f8041     	ldur	w1, [x2, #-0x8]
  9f269c: 51000423     	sub	w3, w1, #0x1
  9f26a0: b81f8043     	stur	w3, [x2, #-0x8]
  9f26a4: 17fffff4     	b	0x9f2674 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x134>
  9f26a8: 97e6a33e     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f26ac: f0002aa1     	adrp	x1, 0xf49000
  9f26b0: aa0003f3     	mov	x19, x0
  9f26b4: f9402ba0     	ldr	x0, [x29, #0x50]
  9f26b8: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f26bc: d1006000     	sub	x0, x0, #0x18
  9f26c0: eb01001f     	cmp	x0, x1
  9f26c4: 54000060     	b.eq	0x9f26d0 <_ZN7cocos2d9FileUtils25addSearchResolutionsOrderERKSsb+0x190>
  9f26c8: 910123a1     	add	x1, x29, #0x48
  9f26cc: 97e6b36d     	bl	0x39f480 <.text+0x3170>
  9f26d0: aa1303e0     	mov	x0, x19
  9f26d4: 9407c203     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f26d8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb>:
  9f26d8: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  9f26dc: 910003fd     	mov	x29, sp
  9f26e0: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f26e4: d0002a76     	adrp	x22, 0xf40000
  9f26e8: f0002ab5     	adrp	x21, 0xf49000
  9f26ec: f9400003     	ldr	x3, [x0]
  9f26f0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f26f4: f940e6c4     	ldr	x4, [x22, #0x1c8]
  9f26f8: 53001c58     	uxtb	w24, w2
  9f26fc: f947eea2     	ldr	x2, [x21, #0xfd8]
  9f2700: f9408063     	ldr	x3, [x3, #0x100]
  9f2704: f9400084     	ldr	x4, [x4]
  9f2708: 91006042     	add	x2, x2, #0x18
  9f270c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2710: f90023f9     	str	x25, [sp, #0x40]
  9f2714: aa0003f3     	mov	x19, x0
  9f2718: f90037a4     	str	x4, [x29, #0x68]
  9f271c: aa0103f9     	mov	x25, x1
  9f2720: f9002fa2     	str	x2, [x29, #0x58]
  9f2724: d63f0060     	blr	x3
  9f2728: 53001c00     	uxtb	w0, w0
  9f272c: 910163b4     	add	x20, x29, #0x58
  9f2730: 35000080     	cbnz	w0, 0x9f2740 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x68>
  9f2734: 91238261     	add	x1, x19, #0x8e0
  9f2738: aa1403e0     	mov	x0, x20
  9f273c: 940760e1     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9f2740: 910183b7     	add	x23, x29, #0x60
  9f2744: aa1403e1     	mov	x1, x20
  9f2748: aa1703e0     	mov	x0, x23
  9f274c: 9407607d     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f2750: aa1703e0     	mov	x0, x23
  9f2754: aa1903e1     	mov	x1, x25
  9f2758: 940754b5     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9f275c: f94033a1     	ldr	x1, [x29, #0x60]
  9f2760: f85e8020     	ldur	x0, [x1, #-0x18]
  9f2764: b40001e0     	cbz	x0, 0x9f27a0 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0xc8>
  9f2768: b85f8022     	ldur	w2, [x1, #-0x8]
  9f276c: d1000414     	sub	x20, x0, #0x1
  9f2770: 37f80082     	tbnz	w2, #0x1f, 0x9f2780 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0xa8>
  9f2774: aa1703e0     	mov	x0, x23
  9f2778: 94075ad2     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9f277c: f94033a1     	ldr	x1, [x29, #0x60]
  9f2780: 38f46820     	ldrsb	w0, [x1, x20]
  9f2784: 7100bc1f     	cmp	w0, #0x2f
  9f2788: 540000c0     	b.eq	0x9f27a0 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0xc8>
  9f278c: f0001381     	adrp	x1, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9f2790: aa1703e0     	mov	x0, x23
  9f2794: 913d4021     	add	x1, x1, #0xf50
  9f2798: d2800022     	mov	x2, #0x1                // =1
  9f279c: 94075514     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9f27a0: 35000438     	cbnz	w24, 0x9f2824 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x14c>
  9f27a4: 91232273     	add	x19, x19, #0x8c8
  9f27a8: f9400660     	ldr	x0, [x19, #0x8]
  9f27ac: f9400a61     	ldr	x1, [x19, #0x10]
  9f27b0: eb01001f     	cmp	x0, x1
  9f27b4: 54000800     	b.eq	0x9f28b4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1dc>
  9f27b8: b4000080     	cbz	x0, 0x9f27c8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0xf0>
  9f27bc: aa1703e1     	mov	x1, x23
  9f27c0: 94076060     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f27c4: f9400660     	ldr	x0, [x19, #0x8]
  9f27c8: 91002000     	add	x0, x0, #0x8
  9f27cc: f9000660     	str	x0, [x19, #0x8]
  9f27d0: f94033a1     	ldr	x1, [x29, #0x60]
  9f27d4: f947eea2     	ldr	x2, [x21, #0xfd8]
  9f27d8: d1006020     	sub	x0, x1, #0x18
  9f27dc: eb02001f     	cmp	x0, x2
  9f27e0: 54000341     	b.ne	0x9f2848 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x170>
  9f27e4: f9402fa0     	ldr	x0, [x29, #0x58]
  9f27e8: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9f27ec: d1006002     	sub	x2, x0, #0x18
  9f27f0: eb15005f     	cmp	x2, x21
  9f27f4: 54000441     	b.ne	0x9f287c <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1a4>
  9f27f8: f940e6c0     	ldr	x0, [x22, #0x1c8]
  9f27fc: f94037a1     	ldr	x1, [x29, #0x68]
  9f2800: f9400000     	ldr	x0, [x0]
  9f2804: eb00003f     	cmp	x1, x0
  9f2808: 540006e1     	b.ne	0x9f28e4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x20c>
  9f280c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f2810: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2814: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f2818: f94023f9     	ldr	x25, [sp, #0x40]
  9f281c: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  9f2820: d65f03c0     	ret
  9f2824: f9446661     	ldr	x1, [x19, #0x8c8]
  9f2828: 91232260     	add	x0, x19, #0x8c8
  9f282c: aa1703e2     	mov	x2, x23
  9f2830: 97f5efe2     	bl	0x76e7b8 <_ZNSt6vectorISsSaISsEE6insertEN9__gnu_cxx17__normal_iteratorIPKSsS1_EERS4_>
  9f2834: f94033a1     	ldr	x1, [x29, #0x60]
  9f2838: f947eea2     	ldr	x2, [x21, #0xfd8]
  9f283c: d1006020     	sub	x0, x1, #0x18
  9f2840: eb02001f     	cmp	x0, x2
  9f2844: 54fffd00     	b.eq	0x9f27e4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x10c>
  9f2848: d0002a82     	adrp	x2, 0xf44000
  9f284c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f2850: b4000422     	cbz	x2, 0x9f28d4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1fc>
  9f2854: d1002021     	sub	x1, x1, #0x8
  9f2858: 885ffc22     	ldaxr	w2, [x1]
  9f285c: 51000443     	sub	w3, w2, #0x1
  9f2860: 8804fc23     	stlxr	w4, w3, [x1]
  9f2864: 35ffffa4     	cbnz	w4, 0x9f2858 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x180>
  9f2868: 6b1f005f     	cmp	w2, wzr
  9f286c: 54fffbcc     	b.gt	0x9f27e4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x10c>
  9f2870: 910143a1     	add	x1, x29, #0x50
  9f2874: 94075fd2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f2878: 17ffffdb     	b	0x9f27e4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x10c>
  9f287c: d0002a81     	adrp	x1, 0xf44000
  9f2880: f9445021     	ldr	x1, [x1, #0x8a0]
  9f2884: b4000201     	cbz	x1, 0x9f28c4 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1ec>
  9f2888: d1002000     	sub	x0, x0, #0x8
  9f288c: 885ffc01     	ldaxr	w1, [x0]
  9f2890: 51000423     	sub	w3, w1, #0x1
  9f2894: 8804fc03     	stlxr	w4, w3, [x0]
  9f2898: 35ffffa4     	cbnz	w4, 0x9f288c <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1b4>
  9f289c: 6b1f003f     	cmp	w1, wzr
  9f28a0: 54fffacc     	b.gt	0x9f27f8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x120>
  9f28a4: aa0203e0     	mov	x0, x2
  9f28a8: aa1703e1     	mov	x1, x23
  9f28ac: 94075fc4     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f28b0: 17ffffd2     	b	0x9f27f8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x120>
  9f28b4: aa1303e0     	mov	x0, x19
  9f28b8: aa1703e1     	mov	x1, x23
  9f28bc: 97e6d24b     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f28c0: 17ffffc4     	b	0x9f27d0 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0xf8>
  9f28c4: b85f8001     	ldur	w1, [x0, #-0x8]
  9f28c8: 51000423     	sub	w3, w1, #0x1
  9f28cc: b81f8003     	stur	w3, [x0, #-0x8]
  9f28d0: 17fffff3     	b	0x9f289c <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x1c4>
  9f28d4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f28d8: 51000443     	sub	w3, w2, #0x1
  9f28dc: b81f8023     	stur	w3, [x1, #-0x8]
  9f28e0: 17ffffe2     	b	0x9f2868 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x190>
  9f28e4: 97e6a2af     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f28e8: aa0003f3     	mov	x19, x0
  9f28ec: f9402fa2     	ldr	x2, [x29, #0x58]
  9f28f0: f947eeb5     	ldr	x21, [x21, #0xfd8]
  9f28f4: d1006040     	sub	x0, x2, #0x18
  9f28f8: eb15001f     	cmp	x0, x21
  9f28fc: 54000060     	b.eq	0x9f2908 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x230>
  9f2900: 910143a1     	add	x1, x29, #0x50
  9f2904: 97e6b2df     	bl	0x39f480 <.text+0x3170>
  9f2908: aa1303e0     	mov	x0, x19
  9f290c: 9407c175     	bl	0xbe2ee0 <_Unwind_Resume>
  9f2910: aa0003f3     	mov	x19, x0
  9f2914: f94033a0     	ldr	x0, [x29, #0x60]
  9f2918: f947eea1     	ldr	x1, [x21, #0xfd8]
  9f291c: d1006000     	sub	x0, x0, #0x18
  9f2920: eb01001f     	cmp	x0, x1
  9f2924: 54fffe40     	b.eq	0x9f28ec <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x214>
  9f2928: 910143a1     	add	x1, x29, #0x50
  9f292c: 97e6b2d5     	bl	0x39f480 <.text+0x3170>
  9f2930: 17ffffef     	b	0x9f28ec <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x214>
  9f2934: 17fffff7     	b	0x9f2910 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb+0x238>

00000000009f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>:
  9f2938: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f293c: 910003fd     	mov	x29, sp
  9f2940: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2944: d346fc34     	lsr	x20, x1, #6
  9f2948: f90023f9     	str	x25, [sp, #0x40]
  9f294c: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f2950: aa0003f6     	mov	x22, x0
  9f2954: 91000e80     	add	x0, x20, #0x3
  9f2958: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f295c: f100201f     	cmp	x0, #0x8
  9f2960: aa0103f7     	mov	x23, x1
  9f2964: d2800101     	mov	x1, #0x8                // =8
  9f2968: 91000694     	add	x20, x20, #0x1
  9f296c: 9a812000     	csel	x0, x0, x1, hs
  9f2970: f90006c0     	str	x0, [x22, #0x8]
  9f2974: d37df000     	lsl	x0, x0, #3
  9f2978: 94062c24     	bl	0xb7da08 <_Znwm>
  9f297c: f94006d5     	ldr	x21, [x22, #0x8]
  9f2980: f90002c0     	str	x0, [x22]
  9f2984: aa0003f9     	mov	x25, x0
  9f2988: cb1402b5     	sub	x21, x21, x20
  9f298c: d341feb5     	lsr	x21, x21, #1
  9f2990: 8b150c18     	add	x24, x0, x21, lsl #3
  9f2994: 8b140f14     	add	x20, x24, x20, lsl #3
  9f2998: eb14031f     	cmp	x24, x20
  9f299c: 540000e2     	b.hs	0x9f29b8 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm+0x80>
  9f29a0: aa1803f3     	mov	x19, x24
  9f29a4: d2804000     	mov	x0, #0x200              // =512
  9f29a8: 94062c18     	bl	0xb7da08 <_Znwm>
  9f29ac: f8008660     	str	x0, [x19], #0x8
  9f29b0: eb13029f     	cmp	x20, x19
  9f29b4: 54ffff88     	b.hi	0x9f29a4 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm+0x6c>
  9f29b8: f90016d8     	str	x24, [x22, #0x28]
  9f29bc: d1002284     	sub	x4, x20, #0x8
  9f29c0: d37d16e0     	ubfiz	x0, x23, #3, #6
  9f29c4: f8757b21     	ldr	x1, [x25, x21, lsl #3]
  9f29c8: f9000ec1     	str	x1, [x22, #0x18]
  9f29cc: f90026c4     	str	x4, [x22, #0x48]
  9f29d0: 91080025     	add	x5, x1, #0x200
  9f29d4: f90012c5     	str	x5, [x22, #0x20]
  9f29d8: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f29dc: f85f8282     	ldur	x2, [x20, #-0x8]
  9f29e0: f9001ec2     	str	x2, [x22, #0x38]
  9f29e4: f9000ac1     	str	x1, [x22, #0x10]
  9f29e8: 91080044     	add	x4, x2, #0x200
  9f29ec: 8b000040     	add	x0, x2, x0
  9f29f0: f90022c4     	str	x4, [x22, #0x40]
  9f29f4: f9001ac0     	str	x0, [x22, #0x30]
  9f29f8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f29fc: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2a00: f94023f9     	ldr	x25, [sp, #0x40]
  9f2a04: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f2a08: d65f03c0     	ret
  9f2a0c: 940626e6     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2a10: eb18027f     	cmp	x19, x24
  9f2a14: 540000a9     	b.ls	0x9f2a28 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm+0xf0>
  9f2a18: f8408700     	ldr	x0, [x24], #0x8
  9f2a1c: 9406253b     	bl	0xb7bf08 <_ZdlPv>
  9f2a20: eb18027f     	cmp	x19, x24
  9f2a24: 54ffffa8     	b.hi	0x9f2a18 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm+0xe0>
  9f2a28: 94062ab3     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2a2c: f9002fa0     	str	x0, [x29, #0x58]
  9f2a30: 94062705     	bl	0xb7c644 <__cxa_end_catch>
  9f2a34: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2a38: 940626db     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2a3c: f94002c0     	ldr	x0, [x22]
  9f2a40: 94062532     	bl	0xb7bf08 <_ZdlPv>
  9f2a44: f90002df     	str	xzr, [x22]
  9f2a48: f90006df     	str	xzr, [x22, #0x8]
  9f2a4c: 94062aaa     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2a50: f9002fa0     	str	x0, [x29, #0x58]
  9f2a54: 940626fc     	bl	0xb7c644 <__cxa_end_catch>
  9f2a58: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2a5c: 9407c121     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>:
  9f2a60: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f2a64: 910003fd     	mov	x29, sp
  9f2a68: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2a6c: d346fc34     	lsr	x20, x1, #6
  9f2a70: f90023f9     	str	x25, [sp, #0x40]
  9f2a74: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f2a78: aa0003f6     	mov	x22, x0
  9f2a7c: 91000e80     	add	x0, x20, #0x3
  9f2a80: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f2a84: f100201f     	cmp	x0, #0x8
  9f2a88: aa0103f7     	mov	x23, x1
  9f2a8c: d2800101     	mov	x1, #0x8                // =8
  9f2a90: 91000694     	add	x20, x20, #0x1
  9f2a94: 9a812000     	csel	x0, x0, x1, hs
  9f2a98: f90006c0     	str	x0, [x22, #0x8]
  9f2a9c: d37df000     	lsl	x0, x0, #3
  9f2aa0: 94062bda     	bl	0xb7da08 <_Znwm>
  9f2aa4: f94006d5     	ldr	x21, [x22, #0x8]
  9f2aa8: f90002c0     	str	x0, [x22]
  9f2aac: aa0003f9     	mov	x25, x0
  9f2ab0: cb1402b5     	sub	x21, x21, x20
  9f2ab4: d341feb5     	lsr	x21, x21, #1
  9f2ab8: 8b150c18     	add	x24, x0, x21, lsl #3
  9f2abc: 8b140f14     	add	x20, x24, x20, lsl #3
  9f2ac0: eb14031f     	cmp	x24, x20
  9f2ac4: 540000e2     	b.hs	0x9f2ae0 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm+0x80>
  9f2ac8: aa1803f3     	mov	x19, x24
  9f2acc: d2804000     	mov	x0, #0x200              // =512
  9f2ad0: 94062bce     	bl	0xb7da08 <_Znwm>
  9f2ad4: f8008660     	str	x0, [x19], #0x8
  9f2ad8: eb13029f     	cmp	x20, x19
  9f2adc: 54ffff88     	b.hi	0x9f2acc <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm+0x6c>
  9f2ae0: f90016d8     	str	x24, [x22, #0x28]
  9f2ae4: d1002284     	sub	x4, x20, #0x8
  9f2ae8: d37d16e0     	ubfiz	x0, x23, #3, #6
  9f2aec: f8757b21     	ldr	x1, [x25, x21, lsl #3]
  9f2af0: f9000ec1     	str	x1, [x22, #0x18]
  9f2af4: f90026c4     	str	x4, [x22, #0x48]
  9f2af8: 91080025     	add	x5, x1, #0x200
  9f2afc: f90012c5     	str	x5, [x22, #0x20]
  9f2b00: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f2b04: f85f8282     	ldur	x2, [x20, #-0x8]
  9f2b08: f9001ec2     	str	x2, [x22, #0x38]
  9f2b0c: f9000ac1     	str	x1, [x22, #0x10]
  9f2b10: 91080044     	add	x4, x2, #0x200
  9f2b14: 8b000040     	add	x0, x2, x0
  9f2b18: f90022c4     	str	x4, [x22, #0x40]
  9f2b1c: f9001ac0     	str	x0, [x22, #0x30]
  9f2b20: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f2b24: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2b28: f94023f9     	ldr	x25, [sp, #0x40]
  9f2b2c: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f2b30: d65f03c0     	ret
  9f2b34: 9406269c     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2b38: eb18027f     	cmp	x19, x24
  9f2b3c: 540000a9     	b.ls	0x9f2b50 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm+0xf0>
  9f2b40: f8408700     	ldr	x0, [x24], #0x8
  9f2b44: 940624f1     	bl	0xb7bf08 <_ZdlPv>
  9f2b48: eb18027f     	cmp	x19, x24
  9f2b4c: 54ffffa8     	b.hi	0x9f2b40 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm+0xe0>
  9f2b50: 94062a69     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2b54: f9002fa0     	str	x0, [x29, #0x58]
  9f2b58: 940626bb     	bl	0xb7c644 <__cxa_end_catch>
  9f2b5c: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2b60: 94062691     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2b64: f94002c0     	ldr	x0, [x22]
  9f2b68: 940624e8     	bl	0xb7bf08 <_ZdlPv>
  9f2b6c: f90002df     	str	xzr, [x22]
  9f2b70: f90006df     	str	xzr, [x22, #0x8]
  9f2b74: 94062a60     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2b78: f9002fa0     	str	x0, [x29, #0x58]
  9f2b7c: 940626b2     	bl	0xb7c644 <__cxa_end_catch>
  9f2b80: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2b84: 9407c0d7     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>:
  9f2b88: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f2b8c: 910003fd     	mov	x29, sp
  9f2b90: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2b94: d347fc34     	lsr	x20, x1, #7
  9f2b98: f90023f9     	str	x25, [sp, #0x40]
  9f2b9c: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f2ba0: aa0003f6     	mov	x22, x0
  9f2ba4: 91000e80     	add	x0, x20, #0x3
  9f2ba8: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f2bac: f100201f     	cmp	x0, #0x8
  9f2bb0: aa0103f7     	mov	x23, x1
  9f2bb4: d2800101     	mov	x1, #0x8                // =8
  9f2bb8: 91000694     	add	x20, x20, #0x1
  9f2bbc: 9a812000     	csel	x0, x0, x1, hs
  9f2bc0: f90006c0     	str	x0, [x22, #0x8]
  9f2bc4: d37df000     	lsl	x0, x0, #3
  9f2bc8: 94062b90     	bl	0xb7da08 <_Znwm>
  9f2bcc: f94006d5     	ldr	x21, [x22, #0x8]
  9f2bd0: f90002c0     	str	x0, [x22]
  9f2bd4: aa0003f9     	mov	x25, x0
  9f2bd8: cb1402b5     	sub	x21, x21, x20
  9f2bdc: d341feb5     	lsr	x21, x21, #1
  9f2be0: 8b150c18     	add	x24, x0, x21, lsl #3
  9f2be4: 8b140f14     	add	x20, x24, x20, lsl #3
  9f2be8: eb14031f     	cmp	x24, x20
  9f2bec: 540000e2     	b.hs	0x9f2c08 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm+0x80>
  9f2bf0: aa1803f3     	mov	x19, x24
  9f2bf4: d2804000     	mov	x0, #0x200              // =512
  9f2bf8: 94062b84     	bl	0xb7da08 <_Znwm>
  9f2bfc: f8008660     	str	x0, [x19], #0x8
  9f2c00: eb13029f     	cmp	x20, x19
  9f2c04: 54ffff88     	b.hi	0x9f2bf4 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm+0x6c>
  9f2c08: f90016d8     	str	x24, [x22, #0x28]
  9f2c0c: d1002284     	sub	x4, x20, #0x8
  9f2c10: d37e1ae0     	ubfiz	x0, x23, #2, #7
  9f2c14: f8757b21     	ldr	x1, [x25, x21, lsl #3]
  9f2c18: f9000ec1     	str	x1, [x22, #0x18]
  9f2c1c: f90026c4     	str	x4, [x22, #0x48]
  9f2c20: 91080025     	add	x5, x1, #0x200
  9f2c24: f90012c5     	str	x5, [x22, #0x20]
  9f2c28: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f2c2c: f85f8282     	ldur	x2, [x20, #-0x8]
  9f2c30: f9001ec2     	str	x2, [x22, #0x38]
  9f2c34: f9000ac1     	str	x1, [x22, #0x10]
  9f2c38: 91080044     	add	x4, x2, #0x200
  9f2c3c: 8b000040     	add	x0, x2, x0
  9f2c40: f90022c4     	str	x4, [x22, #0x40]
  9f2c44: f9001ac0     	str	x0, [x22, #0x30]
  9f2c48: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f2c4c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f2c50: f94023f9     	ldr	x25, [sp, #0x40]
  9f2c54: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f2c58: d65f03c0     	ret
  9f2c5c: 94062652     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2c60: eb18027f     	cmp	x19, x24
  9f2c64: 540000a9     	b.ls	0x9f2c78 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm+0xf0>
  9f2c68: f8408700     	ldr	x0, [x24], #0x8
  9f2c6c: 940624a7     	bl	0xb7bf08 <_ZdlPv>
  9f2c70: eb18027f     	cmp	x19, x24
  9f2c74: 54ffffa8     	b.hi	0x9f2c68 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm+0xe0>
  9f2c78: 94062a1f     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2c7c: f9002fa0     	str	x0, [x29, #0x58]
  9f2c80: 94062671     	bl	0xb7c644 <__cxa_end_catch>
  9f2c84: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2c88: 94062647     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f2c8c: f94002c0     	ldr	x0, [x22]
  9f2c90: 9406249e     	bl	0xb7bf08 <_ZdlPv>
  9f2c94: f90002df     	str	xzr, [x22]
  9f2c98: f90006df     	str	xzr, [x22, #0x8]
  9f2c9c: 94062a16     	bl	0xb7d4f4 <__cxa_rethrow>
  9f2ca0: f9002fa0     	str	x0, [x29, #0x58]
  9f2ca4: 94062668     	bl	0xb7c644 <__cxa_end_catch>
  9f2ca8: f9402fa0     	ldr	x0, [x29, #0x58]
  9f2cac: 9407c08d     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f2cb0 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci>:
  9f2cb0: d10a43ff     	sub	sp, sp, #0x290
  9f2cb4: 1e2e1000     	fmov	s0, #1.00000000
  9f2cb8: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f2cbc: 910003fd     	mov	x29, sp
  9f2cc0: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f2cc4: d0002a7b     	adrp	x27, 0xf40000
  9f2cc8: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f2ccc: b0002a99     	adrp	x25, 0xf43000
  9f2cd0: b90067a2     	str	w2, [x29, #0x64]
  9f2cd4: f940e764     	ldr	x4, [x27, #0x1c8]
  9f2cd8: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f2cdc: f9448b23     	ldr	x3, [x25, #0x910]
  9f2ce0: 9105c3b3     	add	x19, x29, #0x170
  9f2ce4: f9400082     	ldr	x2, [x4]
  9f2ce8: 9100c260     	add	x0, x19, #0x30
  9f2cec: f90037a1     	str	x1, [x29, #0x68]
  9f2cf0: 91004063     	add	x3, x3, #0x10
  9f2cf4: d2800141     	mov	x1, #0xa                // =10
  9f2cf8: b9000a7f     	str	wzr, [x19, #0x8]
  9f2cfc: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f2d00: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f2d04: aa0803f8     	mov	x24, x8
  9f2d08: f90177a2     	str	x2, [x29, #0x2e8]
  9f2d0c: f9000263     	str	x3, [x19]
  9f2d10: f900127f     	str	xzr, [x19, #0x20]
  9f2d14: f900167f     	str	xzr, [x19, #0x28]
  9f2d18: bd003260     	str	s0, [x19, #0x30]
  9f2d1c: f9001e7f     	str	xzr, [x19, #0x38]
  9f2d20: 94074c7e     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f2d24: f100041f     	cmp	x0, #0x1
  9f2d28: f9000e60     	str	x0, [x19, #0x18]
  9f2d2c: 540029e0     	b.eq	0x9f3268 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x5b8>
  9f2d30: 97ffea77     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f2d34: aa0003e2     	mov	x2, x0
  9f2d38: f0002aba     	adrp	x26, 0xf49000
  9f2d3c: 910483b5     	add	x21, x29, #0x120
  9f2d40: f9000a62     	str	x2, [x19, #0x10]
  9f2d44: aa1503e0     	mov	x0, x21
  9f2d48: d2800001     	mov	x1, #0x0                // =0
  9f2d4c: f900267f     	str	xzr, [x19, #0x48]
  9f2d50: f947ef42     	ldr	x2, [x26, #0xfd8]
  9f2d54: f90002bf     	str	xzr, [x21]
  9f2d58: 91006042     	add	x2, x2, #0x18
  9f2d5c: f90006bf     	str	xzr, [x21, #0x8]
  9f2d60: f9000abf     	str	xzr, [x21, #0x10]
  9f2d64: f9000ebf     	str	xzr, [x21, #0x18]
  9f2d68: f90012bf     	str	xzr, [x21, #0x20]
  9f2d6c: f90016bf     	str	xzr, [x21, #0x28]
  9f2d70: f9001abf     	str	xzr, [x21, #0x30]
  9f2d74: f9001ebf     	str	xzr, [x21, #0x38]
  9f2d78: f90022bf     	str	xzr, [x21, #0x40]
  9f2d7c: f90026bf     	str	xzr, [x21, #0x48]
  9f2d80: f9002a7f     	str	xzr, [x19, #0x50]
  9f2d84: f9002e7f     	str	xzr, [x19, #0x58]
  9f2d88: f9003262     	str	x2, [x19, #0x60]
  9f2d8c: f9003662     	str	x2, [x19, #0x68]
  9f2d90: 97fffeea     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f2d94: 91022260     	add	x0, x19, #0x88
  9f2d98: d2800001     	mov	x1, #0x0                // =0
  9f2d9c: f900ffbf     	str	xzr, [x29, #0x1f8]
  9f2da0: f90103bf     	str	xzr, [x29, #0x200]
  9f2da4: f90107bf     	str	xzr, [x29, #0x208]
  9f2da8: f9010bbf     	str	xzr, [x29, #0x210]
  9f2dac: f9010fbf     	str	xzr, [x29, #0x218]
  9f2db0: f90113bf     	str	xzr, [x29, #0x220]
  9f2db4: f90117bf     	str	xzr, [x29, #0x228]
  9f2db8: f9011bbf     	str	xzr, [x29, #0x230]
  9f2dbc: f9011fbf     	str	xzr, [x29, #0x238]
  9f2dc0: f90123bf     	str	xzr, [x29, #0x240]
  9f2dc4: 97fffedd     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f2dc8: f94002a3     	ldr	x3, [x21]
  9f2dcc: b4000583     	cbz	x3, 0x9f2e7c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x1cc>
  9f2dd0: f94107ae     	ldr	x14, [x29, #0x208]
  9f2dd4: 91026262     	add	x2, x19, #0x98
  9f2dd8: a9412eaa     	ldp	x10, x11, [x21, #0x10]
  9f2ddc: f9000aae     	str	x14, [x21, #0x10]
  9f2de0: 9102e261     	add	x1, x19, #0xb8
  9f2de4: f9410bae     	ldr	x14, [x29, #0x210]
  9f2de8: f9000eae     	str	x14, [x21, #0x18]
  9f2dec: f9410fae     	ldr	x14, [x29, #0x218]
  9f2df0: a94226a8     	ldp	x8, x9, [x21, #0x20]
  9f2df4: f90012ae     	str	x14, [x21, #0x20]
  9f2df8: f94117ae     	ldr	x14, [x29, #0x228]
  9f2dfc: a9431ea6     	ldp	x6, x7, [x21, #0x30]
  9f2e00: f9001aae     	str	x14, [x21, #0x30]
  9f2e04: f9411bae     	ldr	x14, [x29, #0x230]
  9f2e08: a94416a4     	ldp	x4, x5, [x21, #0x40]
  9f2e0c: f94113b4     	ldr	x20, [x29, #0x220]
  9f2e10: f94123b6     	ldr	x22, [x29, #0x240]
  9f2e14: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f2e18: f94103ac     	ldr	x12, [x29, #0x200]
  9f2e1c: f94006ad     	ldr	x13, [x21, #0x8]
  9f2e20: f9001eae     	str	x14, [x21, #0x38]
  9f2e24: a9012448     	stp	x8, x9, [x2, #0x10]
  9f2e28: f9411fae     	ldr	x14, [x29, #0x238]
  9f2e2c: f90016b4     	str	x20, [x21, #0x28]
  9f2e30: f90022ae     	str	x14, [x21, #0x40]
  9f2e34: f90026b6     	str	x22, [x21, #0x48]
  9f2e38: f900ffa3     	str	x3, [x29, #0x1f8]
  9f2e3c: f90002a0     	str	x0, [x21]
  9f2e40: f90103ad     	str	x13, [x29, #0x200]
  9f2e44: f90006ac     	str	x12, [x21, #0x8]
  9f2e48: a9002c4a     	stp	x10, x11, [x2]
  9f2e4c: a9001c26     	stp	x6, x7, [x1]
  9f2e50: a9011424     	stp	x4, x5, [x1, #0x10]
  9f2e54: b4000140     	cbz	x0, 0x9f2e7c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x1cc>
  9f2e58: 910022d6     	add	x22, x22, #0x8
  9f2e5c: eb1402df     	cmp	x22, x20
  9f2e60: 540000c9     	b.ls	0x9f2e78 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x1c8>
  9f2e64: f8408680     	ldr	x0, [x20], #0x8
  9f2e68: 94062428     	bl	0xb7bf08 <_ZdlPv>
  9f2e6c: eb1402df     	cmp	x22, x20
  9f2e70: 54ffffa8     	b.hi	0x9f2e64 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x1b4>
  9f2e74: f94002a0     	ldr	x0, [x21]
  9f2e78: 94062424     	bl	0xb7bf08 <_ZdlPv>
  9f2e7c: 910343b4     	add	x20, x29, #0xd0
  9f2e80: d2800001     	mov	x1, #0x0                // =0
  9f2e84: aa1403e0     	mov	x0, x20
  9f2e88: f900029f     	str	xzr, [x20]
  9f2e8c: f900069f     	str	xzr, [x20, #0x8]
  9f2e90: f9000a9f     	str	xzr, [x20, #0x10]
  9f2e94: f9000e9f     	str	xzr, [x20, #0x18]
  9f2e98: f900129f     	str	xzr, [x20, #0x20]
  9f2e9c: f900169f     	str	xzr, [x20, #0x28]
  9f2ea0: f9001a9f     	str	xzr, [x20, #0x30]
  9f2ea4: f9001e9f     	str	xzr, [x20, #0x38]
  9f2ea8: f900229f     	str	xzr, [x20, #0x40]
  9f2eac: f900269f     	str	xzr, [x20, #0x48]
  9f2eb0: 97fffeec     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f2eb4: 91036260     	add	x0, x19, #0xd8
  9f2eb8: d2800001     	mov	x1, #0x0                // =0
  9f2ebc: f90127bf     	str	xzr, [x29, #0x248]
  9f2ec0: f9012bbf     	str	xzr, [x29, #0x250]
  9f2ec4: f9012fbf     	str	xzr, [x29, #0x258]
  9f2ec8: f90133bf     	str	xzr, [x29, #0x260]
  9f2ecc: f90137bf     	str	xzr, [x29, #0x268]
  9f2ed0: f9013bbf     	str	xzr, [x29, #0x270]
  9f2ed4: f9013fbf     	str	xzr, [x29, #0x278]
  9f2ed8: f90143bf     	str	xzr, [x29, #0x280]
  9f2edc: f90147bf     	str	xzr, [x29, #0x288]
  9f2ee0: f9014bbf     	str	xzr, [x29, #0x290]
  9f2ee4: 97fffedf     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f2ee8: f9400283     	ldr	x3, [x20]
  9f2eec: b4000583     	cbz	x3, 0x9f2f9c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x2ec>
  9f2ef0: f9412fae     	ldr	x14, [x29, #0x258]
  9f2ef4: 9103a262     	add	x2, x19, #0xe8
  9f2ef8: a9412e8a     	ldp	x10, x11, [x20, #0x10]
  9f2efc: f9000a8e     	str	x14, [x20, #0x10]
  9f2f00: 91042261     	add	x1, x19, #0x108
  9f2f04: f94133ae     	ldr	x14, [x29, #0x260]
  9f2f08: f9000e8e     	str	x14, [x20, #0x18]
  9f2f0c: f94137ae     	ldr	x14, [x29, #0x268]
  9f2f10: a9422688     	ldp	x8, x9, [x20, #0x20]
  9f2f14: f900128e     	str	x14, [x20, #0x20]
  9f2f18: f9413fae     	ldr	x14, [x29, #0x278]
  9f2f1c: a9431e86     	ldp	x6, x7, [x20, #0x30]
  9f2f20: f9001a8e     	str	x14, [x20, #0x30]
  9f2f24: f94143ae     	ldr	x14, [x29, #0x280]
  9f2f28: a9441684     	ldp	x4, x5, [x20, #0x40]
  9f2f2c: f9413bb7     	ldr	x23, [x29, #0x270]
  9f2f30: f9414bb6     	ldr	x22, [x29, #0x290]
  9f2f34: f94127a0     	ldr	x0, [x29, #0x248]
  9f2f38: f9412bac     	ldr	x12, [x29, #0x250]
  9f2f3c: f940068d     	ldr	x13, [x20, #0x8]
  9f2f40: f9001e8e     	str	x14, [x20, #0x38]
  9f2f44: a9012448     	stp	x8, x9, [x2, #0x10]
  9f2f48: f94147ae     	ldr	x14, [x29, #0x288]
  9f2f4c: f9001697     	str	x23, [x20, #0x28]
  9f2f50: f900228e     	str	x14, [x20, #0x40]
  9f2f54: f9002696     	str	x22, [x20, #0x48]
  9f2f58: f90127a3     	str	x3, [x29, #0x248]
  9f2f5c: f9000280     	str	x0, [x20]
  9f2f60: f9012bad     	str	x13, [x29, #0x250]
  9f2f64: f900068c     	str	x12, [x20, #0x8]
  9f2f68: a9002c4a     	stp	x10, x11, [x2]
  9f2f6c: a9001c26     	stp	x6, x7, [x1]
  9f2f70: a9011424     	stp	x4, x5, [x1, #0x10]
  9f2f74: b4000140     	cbz	x0, 0x9f2f9c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x2ec>
  9f2f78: 910022d6     	add	x22, x22, #0x8
  9f2f7c: eb1702df     	cmp	x22, x23
  9f2f80: 540000c9     	b.ls	0x9f2f98 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x2e8>
  9f2f84: f84086e0     	ldr	x0, [x23], #0x8
  9f2f88: 940623e0     	bl	0xb7bf08 <_ZdlPv>
  9f2f8c: eb1702df     	cmp	x22, x23
  9f2f90: 54ffffa8     	b.hi	0x9f2f84 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x2d4>
  9f2f94: f9400280     	ldr	x0, [x20]
  9f2f98: 940623dc     	bl	0xb7bf08 <_ZdlPv>
  9f2f9c: 910203b6     	add	x22, x29, #0x80
  9f2fa0: d2800001     	mov	x1, #0x0                // =0
  9f2fa4: aa1603e0     	mov	x0, x22
  9f2fa8: f90002df     	str	xzr, [x22]
  9f2fac: f90006df     	str	xzr, [x22, #0x8]
  9f2fb0: f9000adf     	str	xzr, [x22, #0x10]
  9f2fb4: f9000edf     	str	xzr, [x22, #0x18]
  9f2fb8: f90012df     	str	xzr, [x22, #0x20]
  9f2fbc: f90016df     	str	xzr, [x22, #0x28]
  9f2fc0: f9001adf     	str	xzr, [x22, #0x30]
  9f2fc4: f9001edf     	str	xzr, [x22, #0x38]
  9f2fc8: f90022df     	str	xzr, [x22, #0x40]
  9f2fcc: f90026df     	str	xzr, [x22, #0x48]
  9f2fd0: 97fffeee     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f2fd4: 9104a260     	add	x0, x19, #0x128
  9f2fd8: d2800001     	mov	x1, #0x0                // =0
  9f2fdc: f9014fbf     	str	xzr, [x29, #0x298]
  9f2fe0: f90153bf     	str	xzr, [x29, #0x2a0]
  9f2fe4: f90157bf     	str	xzr, [x29, #0x2a8]
  9f2fe8: f9015bbf     	str	xzr, [x29, #0x2b0]
  9f2fec: f9015fbf     	str	xzr, [x29, #0x2b8]
  9f2ff0: f90163bf     	str	xzr, [x29, #0x2c0]
  9f2ff4: f90167bf     	str	xzr, [x29, #0x2c8]
  9f2ff8: f9016bbf     	str	xzr, [x29, #0x2d0]
  9f2ffc: f9016fbf     	str	xzr, [x29, #0x2d8]
  9f3000: f90173bf     	str	xzr, [x29, #0x2e0]
  9f3004: 97fffee1     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f3008: f94002cc     	ldr	x12, [x22]
  9f300c: b400058c     	cbz	x12, 0x9f30bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x40c>
  9f3010: f94157af     	ldr	x15, [x29, #0x2a8]
  9f3014: 9104e263     	add	x3, x19, #0x138
  9f3018: a9412eca     	ldp	x10, x11, [x22, #0x10]
  9f301c: f9000acf     	str	x15, [x22, #0x10]
  9f3020: 91056262     	add	x2, x19, #0x158
  9f3024: f9415baf     	ldr	x15, [x29, #0x2b0]
  9f3028: f9000ecf     	str	x15, [x22, #0x18]
  9f302c: f9415faf     	ldr	x15, [x29, #0x2b8]
  9f3030: a94226c8     	ldp	x8, x9, [x22, #0x20]
  9f3034: f90012cf     	str	x15, [x22, #0x20]
  9f3038: f94167af     	ldr	x15, [x29, #0x2c8]
  9f303c: a9431ec6     	ldp	x6, x7, [x22, #0x30]
  9f3040: f9001acf     	str	x15, [x22, #0x30]
  9f3044: f9416baf     	ldr	x15, [x29, #0x2d0]
  9f3048: a94416c4     	ldp	x4, x5, [x22, #0x40]
  9f304c: f94163bc     	ldr	x28, [x29, #0x2c0]
  9f3050: f94173b7     	ldr	x23, [x29, #0x2e0]
  9f3054: f9414fa0     	ldr	x0, [x29, #0x298]
  9f3058: f94153ad     	ldr	x13, [x29, #0x2a0]
  9f305c: f94006ce     	ldr	x14, [x22, #0x8]
  9f3060: f9001ecf     	str	x15, [x22, #0x38]
  9f3064: a9012468     	stp	x8, x9, [x3, #0x10]
  9f3068: f9416faf     	ldr	x15, [x29, #0x2d8]
  9f306c: f90016dc     	str	x28, [x22, #0x28]
  9f3070: f90022cf     	str	x15, [x22, #0x40]
  9f3074: f90026d7     	str	x23, [x22, #0x48]
  9f3078: f9014fac     	str	x12, [x29, #0x298]
  9f307c: f90002c0     	str	x0, [x22]
  9f3080: f90153ae     	str	x14, [x29, #0x2a0]
  9f3084: f90006cd     	str	x13, [x22, #0x8]
  9f3088: a9002c6a     	stp	x10, x11, [x3]
  9f308c: a9001c46     	stp	x6, x7, [x2]
  9f3090: a9011444     	stp	x4, x5, [x2, #0x10]
  9f3094: b4000140     	cbz	x0, 0x9f30bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x40c>
  9f3098: 910022f7     	add	x23, x23, #0x8
  9f309c: eb1c02ff     	cmp	x23, x28
  9f30a0: 540000c9     	b.ls	0x9f30b8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x408>
  9f30a4: f8408780     	ldr	x0, [x28], #0x8
  9f30a8: 94062398     	bl	0xb7bf08 <_ZdlPv>
  9f30ac: eb1c02ff     	cmp	x23, x28
  9f30b0: 54ffffa8     	b.hi	0x9f30a4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x3f4>
  9f30b4: f94002c0     	ldr	x0, [x22]
  9f30b8: 94062394     	bl	0xb7bf08 <_ZdlPv>
  9f30bc: 52800021     	mov	w1, #0x1                // =1
  9f30c0: aa1403e0     	mov	x0, x20
  9f30c4: b9000a61     	str	w1, [x19, #0x8]
  9f30c8: 940025fe     	bl	0x9fc8c0 <_ZN7cocos2d9SAXParserC2Ev>
  9f30cc: aa1403e0     	mov	x0, x20
  9f30d0: aa1303e1     	mov	x1, x19
  9f30d4: 94002645     	bl	0x9fc9e8 <_ZN7cocos2d9SAXParser12setDelegatorEPNS_12SAXDelegatorE>
  9f30d8: f94037a1     	ldr	x1, [x29, #0x68]
  9f30dc: aa1403e0     	mov	x0, x20
  9f30e0: b98067a2     	ldrsw	x2, [x29, #0x64]
  9f30e4: 940026e2     	bl	0x9fcc6c <_ZN7cocos2d9SAXParser5parseEPKcm>
  9f30e8: f9400e62     	ldr	x2, [x19, #0x18]
  9f30ec: aa1803e0     	mov	x0, x24
  9f30f0: a9431664     	ldp	x4, x5, [x19, #0x30]
  9f30f4: f9401663     	ldr	x3, [x19, #0x28]
  9f30f8: 91004261     	add	x1, x19, #0x10
  9f30fc: f9000702     	str	x2, [x24, #0x8]
  9f3100: aa1503e2     	mov	x2, x21
  9f3104: f900031f     	str	xzr, [x24]
  9f3108: f9000b1f     	str	xzr, [x24, #0x10]
  9f310c: f9000f03     	str	x3, [x24, #0x18]
  9f3110: a9021704     	stp	x4, x5, [x24, #0x20]
  9f3114: f90002b8     	str	x24, [x21]
  9f3118: 97eeddd3     	bl	0x5aa864 <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEE9_M_assignIZNSH_C4ERKSH_EUlPKNS6_10_Hash_nodeIS4_Lb1EEEE_EEvSK_RKT_>
  9f311c: aa1403e0     	mov	x0, x20
  9f3120: 940025ea     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f3124: f9448b39     	ldr	x25, [x25, #0x910]
  9f3128: f9414fa0     	ldr	x0, [x29, #0x298]
  9f312c: 91004339     	add	x25, x25, #0x10
  9f3130: f9000279     	str	x25, [x19]
  9f3134: f94163b4     	ldr	x20, [x29, #0x2c0]
  9f3138: f94173b6     	ldr	x22, [x29, #0x2e0]
  9f313c: b4000140     	cbz	x0, 0x9f3164 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x4b4>
  9f3140: 910022d6     	add	x22, x22, #0x8
  9f3144: eb16029f     	cmp	x20, x22
  9f3148: 540000c2     	b.hs	0x9f3160 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x4b0>
  9f314c: f8408680     	ldr	x0, [x20], #0x8
  9f3150: 9406236e     	bl	0xb7bf08 <_ZdlPv>
  9f3154: eb1402df     	cmp	x22, x20
  9f3158: 54ffffa8     	b.hi	0x9f314c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x49c>
  9f315c: f9414fa0     	ldr	x0, [x29, #0x298]
  9f3160: 9406236a     	bl	0xb7bf08 <_ZdlPv>
  9f3164: f94127a0     	ldr	x0, [x29, #0x248]
  9f3168: f9413bb4     	ldr	x20, [x29, #0x270]
  9f316c: f9414bb6     	ldr	x22, [x29, #0x290]
  9f3170: b4000140     	cbz	x0, 0x9f3198 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x4e8>
  9f3174: 910022d6     	add	x22, x22, #0x8
  9f3178: eb16029f     	cmp	x20, x22
  9f317c: 540000c2     	b.hs	0x9f3194 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x4e4>
  9f3180: f8408680     	ldr	x0, [x20], #0x8
  9f3184: 94062361     	bl	0xb7bf08 <_ZdlPv>
  9f3188: eb1402df     	cmp	x22, x20
  9f318c: 54ffffa8     	b.hi	0x9f3180 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x4d0>
  9f3190: f94127a0     	ldr	x0, [x29, #0x248]
  9f3194: 9406235d     	bl	0xb7bf08 <_ZdlPv>
  9f3198: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f319c: f94113b4     	ldr	x20, [x29, #0x220]
  9f31a0: f94123b6     	ldr	x22, [x29, #0x240]
  9f31a4: b4000140     	cbz	x0, 0x9f31cc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x51c>
  9f31a8: 910022d6     	add	x22, x22, #0x8
  9f31ac: eb16029f     	cmp	x20, x22
  9f31b0: 540000c2     	b.hs	0x9f31c8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x518>
  9f31b4: f8408680     	ldr	x0, [x20], #0x8
  9f31b8: 94062354     	bl	0xb7bf08 <_ZdlPv>
  9f31bc: eb1402df     	cmp	x22, x20
  9f31c0: 54ffffa8     	b.hi	0x9f31b4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x504>
  9f31c4: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f31c8: 94062350     	bl	0xb7bf08 <_ZdlPv>
  9f31cc: f9403661     	ldr	x1, [x19, #0x68]
  9f31d0: f947ef42     	ldr	x2, [x26, #0xfd8]
  9f31d4: d1006020     	sub	x0, x1, #0x18
  9f31d8: eb02001f     	cmp	x0, x2
  9f31dc: 540004c1     	b.ne	0x9f3274 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x5c4>
  9f31e0: f9403261     	ldr	x1, [x19, #0x60]
  9f31e4: f947ef5a     	ldr	x26, [x26, #0xfd8]
  9f31e8: d1006020     	sub	x0, x1, #0x18
  9f31ec: eb1a001f     	cmp	x0, x26
  9f31f0: 540005c1     	b.ne	0x9f32a8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x5f8>
  9f31f4: f9402674     	ldr	x20, [x19, #0x48]
  9f31f8: f9402a75     	ldr	x21, [x19, #0x50]
  9f31fc: eb15029f     	cmp	x20, x21
  9f3200: 540000e0     	b.eq	0x9f321c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x56c>
  9f3204: aa1403e0     	mov	x0, x20
  9f3208: 91004294     	add	x20, x20, #0x10
  9f320c: 94011948     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f3210: eb1402bf     	cmp	x21, x20
  9f3214: 54ffff81     	b.ne	0x9f3204 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x554>
  9f3218: f9402675     	ldr	x21, [x19, #0x48]
  9f321c: b4000075     	cbz	x21, 0x9f3228 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x578>
  9f3220: aa1503e0     	mov	x0, x21
  9f3224: 94062339     	bl	0xb7bf08 <_ZdlPv>
  9f3228: 91004260     	add	x0, x19, #0x10
  9f322c: 97e733cc     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f3230: f940e761     	ldr	x1, [x27, #0x1c8]
  9f3234: aa1803e0     	mov	x0, x24
  9f3238: f94177a2     	ldr	x2, [x29, #0x2e8]
  9f323c: f9400021     	ldr	x1, [x1]
  9f3240: eb01005f     	cmp	x2, x1
  9f3244: 540011a1     	b.ne	0x9f3478 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x7c8>
  9f3248: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f324c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f3250: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f3254: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f3258: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f325c: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f3260: 910a43ff     	add	sp, sp, #0x290
  9f3264: d65f03c0     	ret
  9f3268: aa1303e2     	mov	x2, x19
  9f326c: f8040c5f     	str	xzr, [x2, #0x40]!
  9f3270: 17fffeb2     	b	0x9f2d38 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x88>
  9f3274: b0002a82     	adrp	x2, 0xf44000
  9f3278: f9445042     	ldr	x2, [x2, #0x8a0]
  9f327c: b4000382     	cbz	x2, 0x9f32ec <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x63c>
  9f3280: d1002021     	sub	x1, x1, #0x8
  9f3284: 885ffc22     	ldaxr	w2, [x1]
  9f3288: 51000443     	sub	w3, w2, #0x1
  9f328c: 8804fc23     	stlxr	w4, w3, [x1]
  9f3290: 35ffffa4     	cbnz	w4, 0x9f3284 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x5d4>
  9f3294: 6b1f005f     	cmp	w2, wzr
  9f3298: 54fffa4c     	b.gt	0x9f31e0 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x530>
  9f329c: aa1503e1     	mov	x1, x21
  9f32a0: 94075d47     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f32a4: 17ffffcf     	b	0x9f31e0 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x530>
  9f32a8: b0002a82     	adrp	x2, 0xf44000
  9f32ac: f9445042     	ldr	x2, [x2, #0x8a0]
  9f32b0: b4000162     	cbz	x2, 0x9f32dc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x62c>
  9f32b4: d1002021     	sub	x1, x1, #0x8
  9f32b8: 885ffc22     	ldaxr	w2, [x1]
  9f32bc: 51000443     	sub	w3, w2, #0x1
  9f32c0: 8804fc23     	stlxr	w4, w3, [x1]
  9f32c4: 35ffffa4     	cbnz	w4, 0x9f32b8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x608>
  9f32c8: 6b1f005f     	cmp	w2, wzr
  9f32cc: 54fff94c     	b.gt	0x9f31f4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x544>
  9f32d0: aa1503e1     	mov	x1, x21
  9f32d4: 94075d3a     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f32d8: 17ffffc7     	b	0x9f31f4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x544>
  9f32dc: b85f8022     	ldur	w2, [x1, #-0x8]
  9f32e0: 51000443     	sub	w3, w2, #0x1
  9f32e4: b81f8023     	stur	w3, [x1, #-0x8]
  9f32e8: 17fffff8     	b	0x9f32c8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x618>
  9f32ec: b85f8022     	ldur	w2, [x1, #-0x8]
  9f32f0: 51000443     	sub	w3, w2, #0x1
  9f32f4: b81f8023     	stur	w3, [x1, #-0x8]
  9f32f8: 17ffffe7     	b	0x9f3294 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x5e4>
  9f32fc: aa0003f5     	mov	x21, x0
  9f3300: aa1303e0     	mov	x0, x19
  9f3304: 97fff88e     	bl	0x9f153c <_ZN7cocos2d9DictMakerD2Ev>
  9f3308: aa1503e0     	mov	x0, x21
  9f330c: 9407bef5     	bl	0xbe2ee0 <_Unwind_Resume>
  9f3310: f94002c1     	ldr	x1, [x22]
  9f3314: aa0003f8     	mov	x24, x0
  9f3318: f94016d5     	ldr	x21, [x22, #0x28]
  9f331c: f94026d4     	ldr	x20, [x22, #0x48]
  9f3320: b40001a1     	cbz	x1, 0x9f3354 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6a4>
  9f3324: 91002294     	add	x20, x20, #0x8
  9f3328: eb1402bf     	cmp	x21, x20
  9f332c: 540000c2     	b.hs	0x9f3344 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x694>
  9f3330: f84086a0     	ldr	x0, [x21], #0x8
  9f3334: 940622f5     	bl	0xb7bf08 <_ZdlPv>
  9f3338: eb15029f     	cmp	x20, x21
  9f333c: 54ffffa8     	b.hi	0x9f3330 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x680>
  9f3340: f94002c1     	ldr	x1, [x22]
  9f3344: aa0103e0     	mov	x0, x1
  9f3348: 940622f0     	bl	0xb7bf08 <_ZdlPv>
  9f334c: 14000002     	b	0x9f3354 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6a4>
  9f3350: aa0003f8     	mov	x24, x0
  9f3354: f94127a0     	ldr	x0, [x29, #0x248]
  9f3358: f9413bb5     	ldr	x21, [x29, #0x270]
  9f335c: f9414bb4     	ldr	x20, [x29, #0x290]
  9f3360: b4000140     	cbz	x0, 0x9f3388 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6d8>
  9f3364: 91002294     	add	x20, x20, #0x8
  9f3368: eb1402bf     	cmp	x21, x20
  9f336c: 540000c2     	b.hs	0x9f3384 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6d4>
  9f3370: f84086a0     	ldr	x0, [x21], #0x8
  9f3374: 940622e5     	bl	0xb7bf08 <_ZdlPv>
  9f3378: eb15029f     	cmp	x20, x21
  9f337c: 54ffffa8     	b.hi	0x9f3370 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6c0>
  9f3380: f94127a0     	ldr	x0, [x29, #0x248]
  9f3384: 940622e1     	bl	0xb7bf08 <_ZdlPv>
  9f3388: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f338c: f94113b5     	ldr	x21, [x29, #0x220]
  9f3390: f94123b4     	ldr	x20, [x29, #0x240]
  9f3394: b4000140     	cbz	x0, 0x9f33bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x70c>
  9f3398: 91002294     	add	x20, x20, #0x8
  9f339c: eb1402bf     	cmp	x21, x20
  9f33a0: 540000c2     	b.hs	0x9f33b8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x708>
  9f33a4: f84086a0     	ldr	x0, [x21], #0x8
  9f33a8: 940622d8     	bl	0xb7bf08 <_ZdlPv>
  9f33ac: eb15029f     	cmp	x20, x21
  9f33b0: 54ffffa8     	b.hi	0x9f33a4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6f4>
  9f33b4: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f33b8: 940622d4     	bl	0xb7bf08 <_ZdlPv>
  9f33bc: f9403660     	ldr	x0, [x19, #0x68]
  9f33c0: f947ef41     	ldr	x1, [x26, #0xfd8]
  9f33c4: d1006000     	sub	x0, x0, #0x18
  9f33c8: eb01001f     	cmp	x0, x1
  9f33cc: 54000060     	b.eq	0x9f33d8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x728>
  9f33d0: 9101e3a1     	add	x1, x29, #0x78
  9f33d4: 97e6b02b     	bl	0x39f480 <.text+0x3170>
  9f33d8: f9403275     	ldr	x21, [x19, #0x60]
  9f33dc: f947ef5a     	ldr	x26, [x26, #0xfd8]
  9f33e0: d10062a0     	sub	x0, x21, #0x18
  9f33e4: eb1a001f     	cmp	x0, x26
  9f33e8: 54000060     	b.eq	0x9f33f4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x744>
  9f33ec: 9101e3a1     	add	x1, x29, #0x78
  9f33f0: 97e6b024     	bl	0x39f480 <.text+0x3170>
  9f33f4: f9402675     	ldr	x21, [x19, #0x48]
  9f33f8: f9402a74     	ldr	x20, [x19, #0x50]
  9f33fc: eb1402bf     	cmp	x21, x20
  9f3400: 540000e0     	b.eq	0x9f341c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x76c>
  9f3404: aa1503e0     	mov	x0, x21
  9f3408: 910042b5     	add	x21, x21, #0x10
  9f340c: 940118c8     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f3410: eb15029f     	cmp	x20, x21
  9f3414: 54ffff81     	b.ne	0x9f3404 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x754>
  9f3418: f9402674     	ldr	x20, [x19, #0x48]
  9f341c: b4000074     	cbz	x20, 0x9f3428 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x778>
  9f3420: aa1403e0     	mov	x0, x20
  9f3424: 940622b9     	bl	0xb7bf08 <_ZdlPv>
  9f3428: 91004260     	add	x0, x19, #0x10
  9f342c: 97e7334c     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f3430: aa1803e0     	mov	x0, x24
  9f3434: 9407beab     	bl	0xbe2ee0 <_Unwind_Resume>
  9f3438: f9400281     	ldr	x1, [x20]
  9f343c: aa0003f8     	mov	x24, x0
  9f3440: f9401696     	ldr	x22, [x20, #0x28]
  9f3444: f9402695     	ldr	x21, [x20, #0x48]
  9f3448: b4fffa01     	cbz	x1, 0x9f3388 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6d8>
  9f344c: 910022b5     	add	x21, x21, #0x8
  9f3450: eb1502df     	cmp	x22, x21
  9f3454: 540000c2     	b.hs	0x9f346c <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x7bc>
  9f3458: f84086c0     	ldr	x0, [x22], #0x8
  9f345c: 940622ab     	bl	0xb7bf08 <_ZdlPv>
  9f3460: eb1602bf     	cmp	x21, x22
  9f3464: 54ffffa8     	b.hi	0x9f3458 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x7a8>
  9f3468: f9400281     	ldr	x1, [x20]
  9f346c: aa0103e0     	mov	x0, x1
  9f3470: 940622a6     	bl	0xb7bf08 <_ZdlPv>
  9f3474: 17ffffc5     	b	0x9f3388 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6d8>
  9f3478: 97e69fca     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f347c: aa0003f5     	mov	x21, x0
  9f3480: aa1403e0     	mov	x0, x20
  9f3484: 94002511     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f3488: 17ffff9e     	b	0x9f3300 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x650>
  9f348c: aa0003f8     	mov	x24, x0
  9f3490: 17ffffbe     	b	0x9f3388 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x6d8>
  9f3494: f94002a1     	ldr	x1, [x21]
  9f3498: aa0003f8     	mov	x24, x0
  9f349c: f94016b6     	ldr	x22, [x21, #0x28]
  9f34a0: f94026b4     	ldr	x20, [x21, #0x48]
  9f34a4: b4fff8c1     	cbz	x1, 0x9f33bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x70c>
  9f34a8: 91002294     	add	x20, x20, #0x8
  9f34ac: eb1402df     	cmp	x22, x20
  9f34b0: 540000c2     	b.hs	0x9f34c8 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x818>
  9f34b4: f84086c0     	ldr	x0, [x22], #0x8
  9f34b8: 94062294     	bl	0xb7bf08 <_ZdlPv>
  9f34bc: eb16029f     	cmp	x20, x22
  9f34c0: 54ffffa8     	b.hi	0x9f34b4 <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x804>
  9f34c4: f94002a1     	ldr	x1, [x21]
  9f34c8: aa0103e0     	mov	x0, x1
  9f34cc: 9406228f     	bl	0xb7bf08 <_ZdlPv>
  9f34d0: 17ffffbb     	b	0x9f33bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x70c>
  9f34d4: aa0003f8     	mov	x24, x0
  9f34d8: 17ffffb9     	b	0x9f33bc <_ZN7cocos2d9FileUtils19getValueMapFromDataEPKci+0x70c>

00000000009f34dc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs>:
  9f34dc: d10a43ff     	sub	sp, sp, #0x290
  9f34e0: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f34e4: 910003fd     	mov	x29, sp
  9f34e8: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f34ec: b0002a77     	adrp	x23, 0xf40000
  9f34f0: f9400002     	ldr	x2, [x0]
  9f34f4: 9101a3b8     	add	x24, x29, #0x68
  9f34f8: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f34fc: f940e6e3     	ldr	x3, [x23, #0x1c8]
  9f3500: 9105c3b4     	add	x20, x29, #0x170
  9f3504: f9402042     	ldr	x2, [x2, #0x40]
  9f3508: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f350c: f9400063     	ldr	x3, [x3]
  9f3510: aa0803f5     	mov	x21, x8
  9f3514: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f3518: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f351c: 90002a9a     	adrp	x26, 0xf43000
  9f3520: aa1803e8     	mov	x8, x24
  9f3524: f90177a3     	str	x3, [x29, #0x2e8]
  9f3528: d63f0040     	blr	x2
  9f352c: b9000a9f     	str	wzr, [x20, #0x8]
  9f3530: f9448b42     	ldr	x2, [x26, #0x910]
  9f3534: 9100c280     	add	x0, x20, #0x30
  9f3538: 1e2e1000     	fmov	s0, #1.00000000
  9f353c: d2800141     	mov	x1, #0xa                // =10
  9f3540: 91004042     	add	x2, x2, #0x10
  9f3544: f900129f     	str	xzr, [x20, #0x20]
  9f3548: f9000282     	str	x2, [x20]
  9f354c: f900169f     	str	xzr, [x20, #0x28]
  9f3550: bd003280     	str	s0, [x20, #0x30]
  9f3554: f9001e9f     	str	xzr, [x20, #0x38]
  9f3558: 94074a70     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f355c: f9000e80     	str	x0, [x20, #0x18]
  9f3560: f100041f     	cmp	x0, #0x1
  9f3564: 54002aa0     	b.eq	0x9f3ab8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x5dc>
  9f3568: 97ffe869     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f356c: aa0003e2     	mov	x2, x0
  9f3570: d0002ab6     	adrp	x22, 0xf49000
  9f3574: 910483b9     	add	x25, x29, #0x120
  9f3578: f9000a82     	str	x2, [x20, #0x10]
  9f357c: aa1903e0     	mov	x0, x25
  9f3580: d2800001     	mov	x1, #0x0                // =0
  9f3584: f900269f     	str	xzr, [x20, #0x48]
  9f3588: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f358c: f900033f     	str	xzr, [x25]
  9f3590: 91006042     	add	x2, x2, #0x18
  9f3594: f900073f     	str	xzr, [x25, #0x8]
  9f3598: f9000b3f     	str	xzr, [x25, #0x10]
  9f359c: f9000f3f     	str	xzr, [x25, #0x18]
  9f35a0: f900133f     	str	xzr, [x25, #0x20]
  9f35a4: f900173f     	str	xzr, [x25, #0x28]
  9f35a8: f9001b3f     	str	xzr, [x25, #0x30]
  9f35ac: f9001f3f     	str	xzr, [x25, #0x38]
  9f35b0: f900233f     	str	xzr, [x25, #0x40]
  9f35b4: f900273f     	str	xzr, [x25, #0x48]
  9f35b8: f9002a9f     	str	xzr, [x20, #0x50]
  9f35bc: f9002e9f     	str	xzr, [x20, #0x58]
  9f35c0: f9003282     	str	x2, [x20, #0x60]
  9f35c4: f9003682     	str	x2, [x20, #0x68]
  9f35c8: 97fffcdc     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f35cc: 91022280     	add	x0, x20, #0x88
  9f35d0: d2800001     	mov	x1, #0x0                // =0
  9f35d4: f900ffbf     	str	xzr, [x29, #0x1f8]
  9f35d8: f90103bf     	str	xzr, [x29, #0x200]
  9f35dc: f90107bf     	str	xzr, [x29, #0x208]
  9f35e0: f9010bbf     	str	xzr, [x29, #0x210]
  9f35e4: f9010fbf     	str	xzr, [x29, #0x218]
  9f35e8: f90113bf     	str	xzr, [x29, #0x220]
  9f35ec: f90117bf     	str	xzr, [x29, #0x228]
  9f35f0: f9011bbf     	str	xzr, [x29, #0x230]
  9f35f4: f9011fbf     	str	xzr, [x29, #0x238]
  9f35f8: f90123bf     	str	xzr, [x29, #0x240]
  9f35fc: 97fffccf     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f3600: f9400323     	ldr	x3, [x25]
  9f3604: b4000583     	cbz	x3, 0x9f36b4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x1d8>
  9f3608: f94107ae     	ldr	x14, [x29, #0x208]
  9f360c: 91026282     	add	x2, x20, #0x98
  9f3610: a9412f2a     	ldp	x10, x11, [x25, #0x10]
  9f3614: f9000b2e     	str	x14, [x25, #0x10]
  9f3618: 9102e281     	add	x1, x20, #0xb8
  9f361c: f9410bae     	ldr	x14, [x29, #0x210]
  9f3620: f9000f2e     	str	x14, [x25, #0x18]
  9f3624: f9410fae     	ldr	x14, [x29, #0x218]
  9f3628: a9422728     	ldp	x8, x9, [x25, #0x20]
  9f362c: f940072d     	ldr	x13, [x25, #0x8]
  9f3630: f900132e     	str	x14, [x25, #0x20]
  9f3634: f94117ae     	ldr	x14, [x29, #0x228]
  9f3638: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f363c: f94103ac     	ldr	x12, [x29, #0x200]
  9f3640: f900ffa3     	str	x3, [x29, #0x1f8]
  9f3644: f90103ad     	str	x13, [x29, #0x200]
  9f3648: a9431f26     	ldp	x6, x7, [x25, #0x30]
  9f364c: f9001b2e     	str	x14, [x25, #0x30]
  9f3650: f9411bae     	ldr	x14, [x29, #0x230]
  9f3654: f94113b3     	ldr	x19, [x29, #0x220]
  9f3658: f94123bb     	ldr	x27, [x29, #0x240]
  9f365c: a9441724     	ldp	x4, x5, [x25, #0x40]
  9f3660: f9001f2e     	str	x14, [x25, #0x38]
  9f3664: f9411fae     	ldr	x14, [x29, #0x238]
  9f3668: a9002c4a     	stp	x10, x11, [x2]
  9f366c: a9012448     	stp	x8, x9, [x2, #0x10]
  9f3670: f9001733     	str	x19, [x25, #0x28]
  9f3674: f900232e     	str	x14, [x25, #0x40]
  9f3678: f900273b     	str	x27, [x25, #0x48]
  9f367c: f9000320     	str	x0, [x25]
  9f3680: f900072c     	str	x12, [x25, #0x8]
  9f3684: a9001c26     	stp	x6, x7, [x1]
  9f3688: a9011424     	stp	x4, x5, [x1, #0x10]
  9f368c: b4000140     	cbz	x0, 0x9f36b4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x1d8>
  9f3690: 9100237b     	add	x27, x27, #0x8
  9f3694: eb13037f     	cmp	x27, x19
  9f3698: 540000c9     	b.ls	0x9f36b0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x1d4>
  9f369c: f8408660     	ldr	x0, [x19], #0x8
  9f36a0: 9406221a     	bl	0xb7bf08 <_ZdlPv>
  9f36a4: eb13037f     	cmp	x27, x19
  9f36a8: 54ffffa8     	b.hi	0x9f369c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x1c0>
  9f36ac: f9400320     	ldr	x0, [x25]
  9f36b0: 94062216     	bl	0xb7bf08 <_ZdlPv>
  9f36b4: 910343bb     	add	x27, x29, #0xd0
  9f36b8: d2800001     	mov	x1, #0x0                // =0
  9f36bc: aa1b03e0     	mov	x0, x27
  9f36c0: f900037f     	str	xzr, [x27]
  9f36c4: f900077f     	str	xzr, [x27, #0x8]
  9f36c8: f9000b7f     	str	xzr, [x27, #0x10]
  9f36cc: f9000f7f     	str	xzr, [x27, #0x18]
  9f36d0: f900137f     	str	xzr, [x27, #0x20]
  9f36d4: f900177f     	str	xzr, [x27, #0x28]
  9f36d8: f9001b7f     	str	xzr, [x27, #0x30]
  9f36dc: f9001f7f     	str	xzr, [x27, #0x38]
  9f36e0: f900237f     	str	xzr, [x27, #0x40]
  9f36e4: f900277f     	str	xzr, [x27, #0x48]
  9f36e8: 97fffcde     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f36ec: 91036280     	add	x0, x20, #0xd8
  9f36f0: d2800001     	mov	x1, #0x0                // =0
  9f36f4: f90127bf     	str	xzr, [x29, #0x248]
  9f36f8: f9012bbf     	str	xzr, [x29, #0x250]
  9f36fc: f9012fbf     	str	xzr, [x29, #0x258]
  9f3700: f90133bf     	str	xzr, [x29, #0x260]
  9f3704: f90137bf     	str	xzr, [x29, #0x268]
  9f3708: f9013bbf     	str	xzr, [x29, #0x270]
  9f370c: f9013fbf     	str	xzr, [x29, #0x278]
  9f3710: f90143bf     	str	xzr, [x29, #0x280]
  9f3714: f90147bf     	str	xzr, [x29, #0x288]
  9f3718: f9014bbf     	str	xzr, [x29, #0x290]
  9f371c: 97fffcd1     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f3720: f9400363     	ldr	x3, [x27]
  9f3724: b4000583     	cbz	x3, 0x9f37d4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x2f8>
  9f3728: f9412fae     	ldr	x14, [x29, #0x258]
  9f372c: 9103a282     	add	x2, x20, #0xe8
  9f3730: a9412f6a     	ldp	x10, x11, [x27, #0x10]
  9f3734: f9000b6e     	str	x14, [x27, #0x10]
  9f3738: 91042281     	add	x1, x20, #0x108
  9f373c: f94133ae     	ldr	x14, [x29, #0x260]
  9f3740: f9000f6e     	str	x14, [x27, #0x18]
  9f3744: f94137ae     	ldr	x14, [x29, #0x268]
  9f3748: a9422768     	ldp	x8, x9, [x27, #0x20]
  9f374c: f940076d     	ldr	x13, [x27, #0x8]
  9f3750: f900136e     	str	x14, [x27, #0x20]
  9f3754: f9413fae     	ldr	x14, [x29, #0x278]
  9f3758: f94127a0     	ldr	x0, [x29, #0x248]
  9f375c: f9412bac     	ldr	x12, [x29, #0x250]
  9f3760: f90127a3     	str	x3, [x29, #0x248]
  9f3764: f9012bad     	str	x13, [x29, #0x250]
  9f3768: a9431f66     	ldp	x6, x7, [x27, #0x30]
  9f376c: f9001b6e     	str	x14, [x27, #0x30]
  9f3770: f94143ae     	ldr	x14, [x29, #0x280]
  9f3774: f9413bb3     	ldr	x19, [x29, #0x270]
  9f3778: f9414bbc     	ldr	x28, [x29, #0x290]
  9f377c: a9441764     	ldp	x4, x5, [x27, #0x40]
  9f3780: f9001f6e     	str	x14, [x27, #0x38]
  9f3784: f94147ae     	ldr	x14, [x29, #0x288]
  9f3788: a9002c4a     	stp	x10, x11, [x2]
  9f378c: a9012448     	stp	x8, x9, [x2, #0x10]
  9f3790: f9001773     	str	x19, [x27, #0x28]
  9f3794: f900236e     	str	x14, [x27, #0x40]
  9f3798: f900277c     	str	x28, [x27, #0x48]
  9f379c: f9000360     	str	x0, [x27]
  9f37a0: f900076c     	str	x12, [x27, #0x8]
  9f37a4: a9001c26     	stp	x6, x7, [x1]
  9f37a8: a9011424     	stp	x4, x5, [x1, #0x10]
  9f37ac: b4000140     	cbz	x0, 0x9f37d4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x2f8>
  9f37b0: 9100239c     	add	x28, x28, #0x8
  9f37b4: eb13039f     	cmp	x28, x19
  9f37b8: 540000c9     	b.ls	0x9f37d0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x2f4>
  9f37bc: f8408660     	ldr	x0, [x19], #0x8
  9f37c0: 940621d2     	bl	0xb7bf08 <_ZdlPv>
  9f37c4: eb13039f     	cmp	x28, x19
  9f37c8: 54ffffa8     	b.hi	0x9f37bc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x2e0>
  9f37cc: f9400360     	ldr	x0, [x27]
  9f37d0: 940621ce     	bl	0xb7bf08 <_ZdlPv>
  9f37d4: 910203bb     	add	x27, x29, #0x80
  9f37d8: d2800001     	mov	x1, #0x0                // =0
  9f37dc: aa1b03e0     	mov	x0, x27
  9f37e0: f900037f     	str	xzr, [x27]
  9f37e4: f900077f     	str	xzr, [x27, #0x8]
  9f37e8: f9000b7f     	str	xzr, [x27, #0x10]
  9f37ec: f9000f7f     	str	xzr, [x27, #0x18]
  9f37f0: f900137f     	str	xzr, [x27, #0x20]
  9f37f4: f900177f     	str	xzr, [x27, #0x28]
  9f37f8: f9001b7f     	str	xzr, [x27, #0x30]
  9f37fc: f9001f7f     	str	xzr, [x27, #0x38]
  9f3800: f900237f     	str	xzr, [x27, #0x40]
  9f3804: f900277f     	str	xzr, [x27, #0x48]
  9f3808: 97fffce0     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f380c: 9104a280     	add	x0, x20, #0x128
  9f3810: d2800001     	mov	x1, #0x0                // =0
  9f3814: f9014fbf     	str	xzr, [x29, #0x298]
  9f3818: f90153bf     	str	xzr, [x29, #0x2a0]
  9f381c: f90157bf     	str	xzr, [x29, #0x2a8]
  9f3820: f9015bbf     	str	xzr, [x29, #0x2b0]
  9f3824: f9015fbf     	str	xzr, [x29, #0x2b8]
  9f3828: f90163bf     	str	xzr, [x29, #0x2c0]
  9f382c: f90167bf     	str	xzr, [x29, #0x2c8]
  9f3830: f9016bbf     	str	xzr, [x29, #0x2d0]
  9f3834: f9016fbf     	str	xzr, [x29, #0x2d8]
  9f3838: f90173bf     	str	xzr, [x29, #0x2e0]
  9f383c: 97fffcd3     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f3840: f9400363     	ldr	x3, [x27]
  9f3844: b4000583     	cbz	x3, 0x9f38f4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x418>
  9f3848: f94157ae     	ldr	x14, [x29, #0x2a8]
  9f384c: 9104e282     	add	x2, x20, #0x138
  9f3850: a9412f6a     	ldp	x10, x11, [x27, #0x10]
  9f3854: f9000b6e     	str	x14, [x27, #0x10]
  9f3858: 91056281     	add	x1, x20, #0x158
  9f385c: f9415bae     	ldr	x14, [x29, #0x2b0]
  9f3860: f9000f6e     	str	x14, [x27, #0x18]
  9f3864: f9415fae     	ldr	x14, [x29, #0x2b8]
  9f3868: a9422768     	ldp	x8, x9, [x27, #0x20]
  9f386c: f940076d     	ldr	x13, [x27, #0x8]
  9f3870: f900136e     	str	x14, [x27, #0x20]
  9f3874: f94167ae     	ldr	x14, [x29, #0x2c8]
  9f3878: f9414fa0     	ldr	x0, [x29, #0x298]
  9f387c: f94153ac     	ldr	x12, [x29, #0x2a0]
  9f3880: f9014fa3     	str	x3, [x29, #0x298]
  9f3884: f90153ad     	str	x13, [x29, #0x2a0]
  9f3888: a9431f66     	ldp	x6, x7, [x27, #0x30]
  9f388c: f9001b6e     	str	x14, [x27, #0x30]
  9f3890: f9416bae     	ldr	x14, [x29, #0x2d0]
  9f3894: f94163b3     	ldr	x19, [x29, #0x2c0]
  9f3898: f94173bc     	ldr	x28, [x29, #0x2e0]
  9f389c: a9441764     	ldp	x4, x5, [x27, #0x40]
  9f38a0: f9001f6e     	str	x14, [x27, #0x38]
  9f38a4: f9416fae     	ldr	x14, [x29, #0x2d8]
  9f38a8: a9002c4a     	stp	x10, x11, [x2]
  9f38ac: a9012448     	stp	x8, x9, [x2, #0x10]
  9f38b0: f9001773     	str	x19, [x27, #0x28]
  9f38b4: f900236e     	str	x14, [x27, #0x40]
  9f38b8: f900277c     	str	x28, [x27, #0x48]
  9f38bc: f9000360     	str	x0, [x27]
  9f38c0: f900076c     	str	x12, [x27, #0x8]
  9f38c4: a9001c26     	stp	x6, x7, [x1]
  9f38c8: a9011424     	stp	x4, x5, [x1, #0x10]
  9f38cc: b4000140     	cbz	x0, 0x9f38f4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x418>
  9f38d0: 9100239c     	add	x28, x28, #0x8
  9f38d4: eb13039f     	cmp	x28, x19
  9f38d8: 540000c9     	b.ls	0x9f38f0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x414>
  9f38dc: f8408660     	ldr	x0, [x19], #0x8
  9f38e0: 9406218a     	bl	0xb7bf08 <_ZdlPv>
  9f38e4: eb13039f     	cmp	x28, x19
  9f38e8: 54ffffa8     	b.hi	0x9f38dc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x400>
  9f38ec: f9400360     	ldr	x0, [x27]
  9f38f0: 94062186     	bl	0xb7bf08 <_ZdlPv>
  9f38f4: 9101c3b3     	add	x19, x29, #0x70
  9f38f8: 52800021     	mov	w1, #0x1                // =1
  9f38fc: aa1303e0     	mov	x0, x19
  9f3900: b9000a81     	str	w1, [x20, #0x8]
  9f3904: 940023ef     	bl	0x9fc8c0 <_ZN7cocos2d9SAXParserC2Ev>
  9f3908: aa1303e0     	mov	x0, x19
  9f390c: aa1403e1     	mov	x1, x20
  9f3910: 94002436     	bl	0x9fc9e8 <_ZN7cocos2d9SAXParser12setDelegatorEPNS_12SAXDelegatorE>
  9f3914: aa1303e0     	mov	x0, x19
  9f3918: aa1803e1     	mov	x1, x24
  9f391c: 94002508     	bl	0x9fcd3c <_ZN7cocos2d9SAXParser5parseERKSs>
  9f3920: a9431684     	ldp	x4, x5, [x20, #0x30]
  9f3924: 9101e3a3     	add	x3, x29, #0x78
  9f3928: f9400e87     	ldr	x7, [x20, #0x18]
  9f392c: f9401686     	ldr	x6, [x20, #0x28]
  9f3930: aa1503e0     	mov	x0, x21
  9f3934: 91004281     	add	x1, x20, #0x10
  9f3938: f90002bf     	str	xzr, [x21]
  9f393c: aa0303e2     	mov	x2, x3
  9f3940: f90006a7     	str	x7, [x21, #0x8]
  9f3944: f9000abf     	str	xzr, [x21, #0x10]
  9f3948: f9000ea6     	str	x6, [x21, #0x18]
  9f394c: a90216a4     	stp	x4, x5, [x21, #0x20]
  9f3950: f9003fb5     	str	x21, [x29, #0x78]
  9f3954: 97eedbc4     	bl	0x5aa864 <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEE9_M_assignIZNSH_C4ERKSH_EUlPKNS6_10_Hash_nodeIS4_Lb1EEEE_EEvSK_RKT_>
  9f3958: aa1303e0     	mov	x0, x19
  9f395c: 940023db     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f3960: f9448b5a     	ldr	x26, [x26, #0x910]
  9f3964: f9414fa0     	ldr	x0, [x29, #0x298]
  9f3968: 9100435a     	add	x26, x26, #0x10
  9f396c: f900029a     	str	x26, [x20]
  9f3970: f94163b3     	ldr	x19, [x29, #0x2c0]
  9f3974: f94173ba     	ldr	x26, [x29, #0x2e0]
  9f3978: b4000140     	cbz	x0, 0x9f39a0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4c4>
  9f397c: 9100235a     	add	x26, x26, #0x8
  9f3980: eb1a027f     	cmp	x19, x26
  9f3984: 540000c2     	b.hs	0x9f399c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4c0>
  9f3988: f8408660     	ldr	x0, [x19], #0x8
  9f398c: 9406215f     	bl	0xb7bf08 <_ZdlPv>
  9f3990: eb13035f     	cmp	x26, x19
  9f3994: 54ffffa8     	b.hi	0x9f3988 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4ac>
  9f3998: f9414fa0     	ldr	x0, [x29, #0x298]
  9f399c: 9406215b     	bl	0xb7bf08 <_ZdlPv>
  9f39a0: f94127a0     	ldr	x0, [x29, #0x248]
  9f39a4: f9413bb3     	ldr	x19, [x29, #0x270]
  9f39a8: f9414bba     	ldr	x26, [x29, #0x290]
  9f39ac: b4000140     	cbz	x0, 0x9f39d4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4f8>
  9f39b0: 9100235a     	add	x26, x26, #0x8
  9f39b4: eb1a027f     	cmp	x19, x26
  9f39b8: 540000c2     	b.hs	0x9f39d0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4f4>
  9f39bc: f8408660     	ldr	x0, [x19], #0x8
  9f39c0: 94062152     	bl	0xb7bf08 <_ZdlPv>
  9f39c4: eb13035f     	cmp	x26, x19
  9f39c8: 54ffffa8     	b.hi	0x9f39bc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x4e0>
  9f39cc: f94127a0     	ldr	x0, [x29, #0x248]
  9f39d0: 9406214e     	bl	0xb7bf08 <_ZdlPv>
  9f39d4: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f39d8: f94113b3     	ldr	x19, [x29, #0x220]
  9f39dc: f94123ba     	ldr	x26, [x29, #0x240]
  9f39e0: b4000140     	cbz	x0, 0x9f3a08 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x52c>
  9f39e4: 9100235a     	add	x26, x26, #0x8
  9f39e8: eb1a027f     	cmp	x19, x26
  9f39ec: 540000c2     	b.hs	0x9f3a04 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x528>
  9f39f0: f8408660     	ldr	x0, [x19], #0x8
  9f39f4: 94062145     	bl	0xb7bf08 <_ZdlPv>
  9f39f8: eb13035f     	cmp	x26, x19
  9f39fc: 54ffffa8     	b.hi	0x9f39f0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x514>
  9f3a00: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f3a04: 94062141     	bl	0xb7bf08 <_ZdlPv>
  9f3a08: f9403681     	ldr	x1, [x20, #0x68]
  9f3a0c: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f3a10: d1006020     	sub	x0, x1, #0x18
  9f3a14: eb02001f     	cmp	x0, x2
  9f3a18: 54000561     	b.ne	0x9f3ac4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x5e8>
  9f3a1c: f9403281     	ldr	x1, [x20, #0x60]
  9f3a20: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f3a24: d1006020     	sub	x0, x1, #0x18
  9f3a28: eb02001f     	cmp	x0, x2
  9f3a2c: 54000661     	b.ne	0x9f3af8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x61c>
  9f3a30: f9402693     	ldr	x19, [x20, #0x48]
  9f3a34: f9402a99     	ldr	x25, [x20, #0x50]
  9f3a38: eb19027f     	cmp	x19, x25
  9f3a3c: 540000e0     	b.eq	0x9f3a58 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x57c>
  9f3a40: aa1303e0     	mov	x0, x19
  9f3a44: 91004273     	add	x19, x19, #0x10
  9f3a48: 94011739     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f3a4c: eb13033f     	cmp	x25, x19
  9f3a50: 54ffff81     	b.ne	0x9f3a40 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x564>
  9f3a54: f9402699     	ldr	x25, [x20, #0x48]
  9f3a58: b4000079     	cbz	x25, 0x9f3a64 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x588>
  9f3a5c: aa1903e0     	mov	x0, x25
  9f3a60: 9406212a     	bl	0xb7bf08 <_ZdlPv>
  9f3a64: 91004280     	add	x0, x20, #0x10
  9f3a68: 97e731bd     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f3a6c: f9400313     	ldr	x19, [x24]
  9f3a70: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f3a74: d1006260     	sub	x0, x19, #0x18
  9f3a78: eb16001f     	cmp	x0, x22
  9f3a7c: 54000581     	b.ne	0x9f3b2c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x650>
  9f3a80: f940e6f7     	ldr	x23, [x23, #0x1c8]
  9f3a84: aa1503e0     	mov	x0, x21
  9f3a88: f94177a2     	ldr	x2, [x29, #0x2e8]
  9f3a8c: f94002e1     	ldr	x1, [x23]
  9f3a90: eb01005f     	cmp	x2, x1
  9f3a94: 540007e1     	b.ne	0x9f3b90 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6b4>
  9f3a98: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f3a9c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f3aa0: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f3aa4: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f3aa8: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f3aac: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f3ab0: 910a43ff     	add	sp, sp, #0x290
  9f3ab4: d65f03c0     	ret
  9f3ab8: aa1403e2     	mov	x2, x20
  9f3abc: f8040c5f     	str	xzr, [x2, #0x40]!
  9f3ac0: 17fffeac     	b	0x9f3570 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x94>
  9f3ac4: b0002a82     	adrp	x2, 0xf44000
  9f3ac8: f9445042     	ldr	x2, [x2, #0x8a0]
  9f3acc: b40004a2     	cbz	x2, 0x9f3b60 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x684>
  9f3ad0: d1002021     	sub	x1, x1, #0x8
  9f3ad4: 885ffc22     	ldaxr	w2, [x1]
  9f3ad8: 51000443     	sub	w3, w2, #0x1
  9f3adc: 8804fc23     	stlxr	w4, w3, [x1]
  9f3ae0: 35ffffa4     	cbnz	w4, 0x9f3ad4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x5f8>
  9f3ae4: 6b1f005f     	cmp	w2, wzr
  9f3ae8: 54fff9ac     	b.gt	0x9f3a1c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x540>
  9f3aec: aa1903e1     	mov	x1, x25
  9f3af0: 94075b33     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f3af4: 17ffffca     	b	0x9f3a1c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x540>
  9f3af8: b0002a82     	adrp	x2, 0xf44000
  9f3afc: f9445042     	ldr	x2, [x2, #0x8a0]
  9f3b00: b4000402     	cbz	x2, 0x9f3b80 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6a4>
  9f3b04: d1002021     	sub	x1, x1, #0x8
  9f3b08: 885ffc22     	ldaxr	w2, [x1]
  9f3b0c: 51000443     	sub	w3, w2, #0x1
  9f3b10: 8804fc23     	stlxr	w4, w3, [x1]
  9f3b14: 35ffffa4     	cbnz	w4, 0x9f3b08 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x62c>
  9f3b18: 6b1f005f     	cmp	w2, wzr
  9f3b1c: 54fff8ac     	b.gt	0x9f3a30 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x554>
  9f3b20: aa1903e1     	mov	x1, x25
  9f3b24: 94075b26     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f3b28: 17ffffc2     	b	0x9f3a30 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x554>
  9f3b2c: b0002a81     	adrp	x1, 0xf44000
  9f3b30: f9445021     	ldr	x1, [x1, #0x8a0]
  9f3b34: b40001e1     	cbz	x1, 0x9f3b70 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x694>
  9f3b38: d1002273     	sub	x19, x19, #0x8
  9f3b3c: 885ffe61     	ldaxr	w1, [x19]
  9f3b40: 51000422     	sub	w2, w1, #0x1
  9f3b44: 8803fe62     	stlxr	w3, w2, [x19]
  9f3b48: 35ffffa3     	cbnz	w3, 0x9f3b3c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x660>
  9f3b4c: 6b1f003f     	cmp	w1, wzr
  9f3b50: 54fff98c     	b.gt	0x9f3a80 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x5a4>
  9f3b54: aa1403e1     	mov	x1, x20
  9f3b58: 94075b19     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f3b5c: 17ffffc9     	b	0x9f3a80 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x5a4>
  9f3b60: b85f8022     	ldur	w2, [x1, #-0x8]
  9f3b64: 51000443     	sub	w3, w2, #0x1
  9f3b68: b81f8023     	stur	w3, [x1, #-0x8]
  9f3b6c: 17ffffde     	b	0x9f3ae4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x608>
  9f3b70: b85f8261     	ldur	w1, [x19, #-0x8]
  9f3b74: 51000422     	sub	w2, w1, #0x1
  9f3b78: b81f8262     	stur	w2, [x19, #-0x8]
  9f3b7c: 17fffff4     	b	0x9f3b4c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x670>
  9f3b80: b85f8022     	ldur	w2, [x1, #-0x8]
  9f3b84: 51000443     	sub	w3, w2, #0x1
  9f3b88: b81f8023     	stur	w3, [x1, #-0x8]
  9f3b8c: 17ffffe3     	b	0x9f3b18 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x63c>
  9f3b90: 97e69e04     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f3b94: aa0003f5     	mov	x21, x0
  9f3b98: aa1303e0     	mov	x0, x19
  9f3b9c: 9400234b     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f3ba0: aa1403e0     	mov	x0, x20
  9f3ba4: 97fff666     	bl	0x9f153c <_ZN7cocos2d9DictMakerD2Ev>
  9f3ba8: f9400300     	ldr	x0, [x24]
  9f3bac: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f3bb0: d1006000     	sub	x0, x0, #0x18
  9f3bb4: eb16001f     	cmp	x0, x22
  9f3bb8: 54000060     	b.eq	0x9f3bc4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6e8>
  9f3bbc: 910183a1     	add	x1, x29, #0x60
  9f3bc0: 97e6ae30     	bl	0x39f480 <.text+0x3170>
  9f3bc4: aa1503e0     	mov	x0, x21
  9f3bc8: 9407bcc6     	bl	0xbe2ee0 <_Unwind_Resume>
  9f3bcc: aa0003f5     	mov	x21, x0
  9f3bd0: 17fffff4     	b	0x9f3ba0 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6c4>
  9f3bd4: f9400361     	ldr	x1, [x27]
  9f3bd8: aa0003f5     	mov	x21, x0
  9f3bdc: f9401777     	ldr	x23, [x27, #0x28]
  9f3be0: f9402773     	ldr	x19, [x27, #0x48]
  9f3be4: b40001a1     	cbz	x1, 0x9f3c18 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x73c>
  9f3be8: 91002273     	add	x19, x19, #0x8
  9f3bec: eb1302ff     	cmp	x23, x19
  9f3bf0: 540000c2     	b.hs	0x9f3c08 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x72c>
  9f3bf4: f84086e0     	ldr	x0, [x23], #0x8
  9f3bf8: 940620c4     	bl	0xb7bf08 <_ZdlPv>
  9f3bfc: eb17027f     	cmp	x19, x23
  9f3c00: 54ffffa8     	b.hi	0x9f3bf4 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x718>
  9f3c04: f9400361     	ldr	x1, [x27]
  9f3c08: aa0103e0     	mov	x0, x1
  9f3c0c: 940620bf     	bl	0xb7bf08 <_ZdlPv>
  9f3c10: 14000002     	b	0x9f3c18 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x73c>
  9f3c14: aa0003f5     	mov	x21, x0
  9f3c18: f94127a0     	ldr	x0, [x29, #0x248]
  9f3c1c: f9413bb7     	ldr	x23, [x29, #0x270]
  9f3c20: f9414bb3     	ldr	x19, [x29, #0x290]
  9f3c24: b4000340     	cbz	x0, 0x9f3c8c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7b0>
  9f3c28: 91002273     	add	x19, x19, #0x8
  9f3c2c: eb1302ff     	cmp	x23, x19
  9f3c30: 540000c2     	b.hs	0x9f3c48 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x76c>
  9f3c34: f84086e0     	ldr	x0, [x23], #0x8
  9f3c38: 940620b4     	bl	0xb7bf08 <_ZdlPv>
  9f3c3c: eb17027f     	cmp	x19, x23
  9f3c40: 54ffffa8     	b.hi	0x9f3c34 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x758>
  9f3c44: f94127a0     	ldr	x0, [x29, #0x248]
  9f3c48: 940620b0     	bl	0xb7bf08 <_ZdlPv>
  9f3c4c: 14000010     	b	0x9f3c8c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7b0>
  9f3c50: f9400361     	ldr	x1, [x27]
  9f3c54: aa0003f5     	mov	x21, x0
  9f3c58: f9401777     	ldr	x23, [x27, #0x28]
  9f3c5c: f9402773     	ldr	x19, [x27, #0x48]
  9f3c60: b4000161     	cbz	x1, 0x9f3c8c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7b0>
  9f3c64: 91002273     	add	x19, x19, #0x8
  9f3c68: eb1302ff     	cmp	x23, x19
  9f3c6c: 540000c2     	b.hs	0x9f3c84 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7a8>
  9f3c70: f84086e0     	ldr	x0, [x23], #0x8
  9f3c74: 940620a5     	bl	0xb7bf08 <_ZdlPv>
  9f3c78: eb17027f     	cmp	x19, x23
  9f3c7c: 54ffffa8     	b.hi	0x9f3c70 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x794>
  9f3c80: f9400361     	ldr	x1, [x27]
  9f3c84: aa0103e0     	mov	x0, x1
  9f3c88: 940620a0     	bl	0xb7bf08 <_ZdlPv>
  9f3c8c: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f3c90: f94113b7     	ldr	x23, [x29, #0x220]
  9f3c94: f94123b3     	ldr	x19, [x29, #0x240]
  9f3c98: b4000220     	cbz	x0, 0x9f3cdc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x800>
  9f3c9c: 91002273     	add	x19, x19, #0x8
  9f3ca0: eb1302ff     	cmp	x23, x19
  9f3ca4: 540000c2     	b.hs	0x9f3cbc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7e0>
  9f3ca8: f84086e0     	ldr	x0, [x23], #0x8
  9f3cac: 94062097     	bl	0xb7bf08 <_ZdlPv>
  9f3cb0: eb17027f     	cmp	x19, x23
  9f3cb4: 54ffffa8     	b.hi	0x9f3ca8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7cc>
  9f3cb8: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f3cbc: 94062093     	bl	0xb7bf08 <_ZdlPv>
  9f3cc0: 14000007     	b	0x9f3cdc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x800>
  9f3cc4: aa0003f5     	mov	x21, x0
  9f3cc8: 17fffff1     	b	0x9f3c8c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x7b0>
  9f3ccc: aa0003f5     	mov	x21, x0
  9f3cd0: d0002ab6     	adrp	x22, 0xf49000
  9f3cd4: 17ffffb5     	b	0x9f3ba8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6cc>
  9f3cd8: aa0003f5     	mov	x21, x0
  9f3cdc: f9403680     	ldr	x0, [x20, #0x68]
  9f3ce0: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f3ce4: d1006000     	sub	x0, x0, #0x18
  9f3ce8: eb01001f     	cmp	x0, x1
  9f3cec: 54000060     	b.eq	0x9f3cf8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x81c>
  9f3cf0: 9101e3a1     	add	x1, x29, #0x78
  9f3cf4: 97e6ade3     	bl	0x39f480 <.text+0x3170>
  9f3cf8: f9403280     	ldr	x0, [x20, #0x60]
  9f3cfc: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f3d00: d1006000     	sub	x0, x0, #0x18
  9f3d04: eb01001f     	cmp	x0, x1
  9f3d08: 54000060     	b.eq	0x9f3d14 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x838>
  9f3d0c: 9101e3a1     	add	x1, x29, #0x78
  9f3d10: 97e6addc     	bl	0x39f480 <.text+0x3170>
  9f3d14: f9402697     	ldr	x23, [x20, #0x48]
  9f3d18: f9402a93     	ldr	x19, [x20, #0x50]
  9f3d1c: eb1302ff     	cmp	x23, x19
  9f3d20: 540000e0     	b.eq	0x9f3d3c <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x860>
  9f3d24: aa1703e0     	mov	x0, x23
  9f3d28: 910042f7     	add	x23, x23, #0x10
  9f3d2c: 94011680     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f3d30: eb17027f     	cmp	x19, x23
  9f3d34: 54ffff81     	b.ne	0x9f3d24 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x848>
  9f3d38: f9402693     	ldr	x19, [x20, #0x48]
  9f3d3c: b4000073     	cbz	x19, 0x9f3d48 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x86c>
  9f3d40: aa1303e0     	mov	x0, x19
  9f3d44: 94062071     	bl	0xb7bf08 <_ZdlPv>
  9f3d48: 91004280     	add	x0, x20, #0x10
  9f3d4c: 97e73104     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f3d50: 17ffff96     	b	0x9f3ba8 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x6cc>
  9f3d54: f9400321     	ldr	x1, [x25]
  9f3d58: aa0003f5     	mov	x21, x0
  9f3d5c: f9401737     	ldr	x23, [x25, #0x28]
  9f3d60: f9402733     	ldr	x19, [x25, #0x48]
  9f3d64: b4fffbc1     	cbz	x1, 0x9f3cdc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x800>
  9f3d68: 91002273     	add	x19, x19, #0x8
  9f3d6c: eb1302ff     	cmp	x23, x19
  9f3d70: 540000c2     	b.hs	0x9f3d88 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x8ac>
  9f3d74: f84086e0     	ldr	x0, [x23], #0x8
  9f3d78: 94062064     	bl	0xb7bf08 <_ZdlPv>
  9f3d7c: eb17027f     	cmp	x19, x23
  9f3d80: 54ffffa8     	b.hi	0x9f3d74 <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x898>
  9f3d84: f9400321     	ldr	x1, [x25]
  9f3d88: aa0103e0     	mov	x0, x1
  9f3d8c: 9406205f     	bl	0xb7bf08 <_ZdlPv>
  9f3d90: 17ffffd3     	b	0x9f3cdc <_ZN7cocos2d9FileUtils19getValueMapFromFileERKSs+0x800>

00000000009f3d94 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs>:
  9f3d94: d10a43ff     	sub	sp, sp, #0x290
  9f3d98: b0002a63     	adrp	x3, 0xf40000
  9f3d9c: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f3da0: 910003fd     	mov	x29, sp
  9f3da4: f9400002     	ldr	x2, [x0]
  9f3da8: f940e463     	ldr	x3, [x3, #0x1c8]
  9f3dac: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f3db0: f9402042     	ldr	x2, [x2, #0x40]
  9f3db4: 9101c3bc     	add	x28, x29, #0x70
  9f3db8: f9400063     	ldr	x3, [x3]
  9f3dbc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f3dc0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f3dc4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f3dc8: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f3dcc: aa0803f8     	mov	x24, x8
  9f3dd0: f90177a3     	str	x3, [x29, #0x2e8]
  9f3dd4: aa1c03e8     	mov	x8, x28
  9f3dd8: 9105c3b5     	add	x21, x29, #0x170
  9f3ddc: d63f0040     	blr	x2
  9f3de0: 90002a80     	adrp	x0, 0xf43000
  9f3de4: d2800141     	mov	x1, #0xa                // =10
  9f3de8: 1e2e1000     	fmov	s0, #1.00000000
  9f3dec: b9000abf     	str	wzr, [x21, #0x8]
  9f3df0: f90012bf     	str	xzr, [x21, #0x20]
  9f3df4: f9448802     	ldr	x2, [x0, #0x910]
  9f3df8: 9100c2a0     	add	x0, x21, #0x30
  9f3dfc: f90016bf     	str	xzr, [x21, #0x28]
  9f3e00: 91004042     	add	x2, x2, #0x10
  9f3e04: f9001ebf     	str	xzr, [x21, #0x38]
  9f3e08: f90002a2     	str	x2, [x21]
  9f3e0c: bd0032a0     	str	s0, [x21, #0x30]
  9f3e10: 94074842     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f3e14: f9000ea0     	str	x0, [x21, #0x18]
  9f3e18: f100041f     	cmp	x0, #0x1
  9f3e1c: 54002d60     	b.eq	0x9f43c8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x634>
  9f3e20: 97ffe63b     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f3e24: aa0003e2     	mov	x2, x0
  9f3e28: d0002ab9     	adrp	x25, 0xf49000
  9f3e2c: 910483b6     	add	x22, x29, #0x120
  9f3e30: f9000aa2     	str	x2, [x21, #0x10]
  9f3e34: aa1603e0     	mov	x0, x22
  9f3e38: d2800001     	mov	x1, #0x0                // =0
  9f3e3c: f90026bf     	str	xzr, [x21, #0x48]
  9f3e40: f947ef22     	ldr	x2, [x25, #0xfd8]
  9f3e44: f90002df     	str	xzr, [x22]
  9f3e48: 91006042     	add	x2, x2, #0x18
  9f3e4c: f90006df     	str	xzr, [x22, #0x8]
  9f3e50: f9000adf     	str	xzr, [x22, #0x10]
  9f3e54: f9000edf     	str	xzr, [x22, #0x18]
  9f3e58: f90012df     	str	xzr, [x22, #0x20]
  9f3e5c: f90016df     	str	xzr, [x22, #0x28]
  9f3e60: f9001adf     	str	xzr, [x22, #0x30]
  9f3e64: f9001edf     	str	xzr, [x22, #0x38]
  9f3e68: f90022df     	str	xzr, [x22, #0x40]
  9f3e6c: f90026df     	str	xzr, [x22, #0x48]
  9f3e70: f9002abf     	str	xzr, [x21, #0x50]
  9f3e74: f9002ebf     	str	xzr, [x21, #0x58]
  9f3e78: f90032a2     	str	x2, [x21, #0x60]
  9f3e7c: f90036a2     	str	x2, [x21, #0x68]
  9f3e80: 97fffaae     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f3e84: 910222a0     	add	x0, x21, #0x88
  9f3e88: d2800001     	mov	x1, #0x0                // =0
  9f3e8c: f900ffbf     	str	xzr, [x29, #0x1f8]
  9f3e90: f90103bf     	str	xzr, [x29, #0x200]
  9f3e94: f90107bf     	str	xzr, [x29, #0x208]
  9f3e98: f9010bbf     	str	xzr, [x29, #0x210]
  9f3e9c: f9010fbf     	str	xzr, [x29, #0x218]
  9f3ea0: f90113bf     	str	xzr, [x29, #0x220]
  9f3ea4: f90117bf     	str	xzr, [x29, #0x228]
  9f3ea8: f9011bbf     	str	xzr, [x29, #0x230]
  9f3eac: f9011fbf     	str	xzr, [x29, #0x238]
  9f3eb0: f90123bf     	str	xzr, [x29, #0x240]
  9f3eb4: 97fffaa1     	bl	0x9f2938 <_ZNSt11_Deque_baseIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE17_M_initialize_mapEm>
  9f3eb8: f94002c3     	ldr	x3, [x22]
  9f3ebc: b4000583     	cbz	x3, 0x9f3f6c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x1d8>
  9f3ec0: f94107ae     	ldr	x14, [x29, #0x208]
  9f3ec4: 910262a2     	add	x2, x21, #0x98
  9f3ec8: a9412eca     	ldp	x10, x11, [x22, #0x10]
  9f3ecc: f9000ace     	str	x14, [x22, #0x10]
  9f3ed0: 9102e2a1     	add	x1, x21, #0xb8
  9f3ed4: f9410bae     	ldr	x14, [x29, #0x210]
  9f3ed8: f9000ece     	str	x14, [x22, #0x18]
  9f3edc: f9410fae     	ldr	x14, [x29, #0x218]
  9f3ee0: a94226c8     	ldp	x8, x9, [x22, #0x20]
  9f3ee4: f94006cd     	ldr	x13, [x22, #0x8]
  9f3ee8: f90012ce     	str	x14, [x22, #0x20]
  9f3eec: f94117ae     	ldr	x14, [x29, #0x228]
  9f3ef0: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f3ef4: f94103ac     	ldr	x12, [x29, #0x200]
  9f3ef8: f900ffa3     	str	x3, [x29, #0x1f8]
  9f3efc: f90103ad     	str	x13, [x29, #0x200]
  9f3f00: a9431ec6     	ldp	x6, x7, [x22, #0x30]
  9f3f04: f9001ace     	str	x14, [x22, #0x30]
  9f3f08: f9411bae     	ldr	x14, [x29, #0x230]
  9f3f0c: f94113b3     	ldr	x19, [x29, #0x220]
  9f3f10: f94123b4     	ldr	x20, [x29, #0x240]
  9f3f14: a94416c4     	ldp	x4, x5, [x22, #0x40]
  9f3f18: f9001ece     	str	x14, [x22, #0x38]
  9f3f1c: f9411fae     	ldr	x14, [x29, #0x238]
  9f3f20: a9002c4a     	stp	x10, x11, [x2]
  9f3f24: a9012448     	stp	x8, x9, [x2, #0x10]
  9f3f28: f90016d3     	str	x19, [x22, #0x28]
  9f3f2c: f90022ce     	str	x14, [x22, #0x40]
  9f3f30: f90026d4     	str	x20, [x22, #0x48]
  9f3f34: f90002c0     	str	x0, [x22]
  9f3f38: f90006cc     	str	x12, [x22, #0x8]
  9f3f3c: a9001c26     	stp	x6, x7, [x1]
  9f3f40: a9011424     	stp	x4, x5, [x1, #0x10]
  9f3f44: b4000140     	cbz	x0, 0x9f3f6c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x1d8>
  9f3f48: 91002294     	add	x20, x20, #0x8
  9f3f4c: eb13029f     	cmp	x20, x19
  9f3f50: 540000c9     	b.ls	0x9f3f68 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x1d4>
  9f3f54: f8408660     	ldr	x0, [x19], #0x8
  9f3f58: 94061fec     	bl	0xb7bf08 <_ZdlPv>
  9f3f5c: eb13029f     	cmp	x20, x19
  9f3f60: 54ffffa8     	b.hi	0x9f3f54 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x1c0>
  9f3f64: f94002c0     	ldr	x0, [x22]
  9f3f68: 94061fe8     	bl	0xb7bf08 <_ZdlPv>
  9f3f6c: 910343b4     	add	x20, x29, #0xd0
  9f3f70: d2800001     	mov	x1, #0x0                // =0
  9f3f74: aa1403e0     	mov	x0, x20
  9f3f78: f900029f     	str	xzr, [x20]
  9f3f7c: f900069f     	str	xzr, [x20, #0x8]
  9f3f80: f9000a9f     	str	xzr, [x20, #0x10]
  9f3f84: f9000e9f     	str	xzr, [x20, #0x18]
  9f3f88: f900129f     	str	xzr, [x20, #0x20]
  9f3f8c: f900169f     	str	xzr, [x20, #0x28]
  9f3f90: f9001a9f     	str	xzr, [x20, #0x30]
  9f3f94: f9001e9f     	str	xzr, [x20, #0x38]
  9f3f98: f900229f     	str	xzr, [x20, #0x40]
  9f3f9c: f900269f     	str	xzr, [x20, #0x48]
  9f3fa0: 97fffab0     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f3fa4: 910362a0     	add	x0, x21, #0xd8
  9f3fa8: d2800001     	mov	x1, #0x0                // =0
  9f3fac: f90127bf     	str	xzr, [x29, #0x248]
  9f3fb0: f9012bbf     	str	xzr, [x29, #0x250]
  9f3fb4: f9012fbf     	str	xzr, [x29, #0x258]
  9f3fb8: f90133bf     	str	xzr, [x29, #0x260]
  9f3fbc: f90137bf     	str	xzr, [x29, #0x268]
  9f3fc0: f9013bbf     	str	xzr, [x29, #0x270]
  9f3fc4: f9013fbf     	str	xzr, [x29, #0x278]
  9f3fc8: f90143bf     	str	xzr, [x29, #0x280]
  9f3fcc: f90147bf     	str	xzr, [x29, #0x288]
  9f3fd0: f9014bbf     	str	xzr, [x29, #0x290]
  9f3fd4: 97fffaa3     	bl	0x9f2a60 <_ZNSt11_Deque_baseIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE17_M_initialize_mapEm>
  9f3fd8: f9400283     	ldr	x3, [x20]
  9f3fdc: b4000583     	cbz	x3, 0x9f408c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x2f8>
  9f3fe0: f9412fae     	ldr	x14, [x29, #0x258]
  9f3fe4: 9103a2a2     	add	x2, x21, #0xe8
  9f3fe8: a9412e8a     	ldp	x10, x11, [x20, #0x10]
  9f3fec: f9000a8e     	str	x14, [x20, #0x10]
  9f3ff0: 910422a1     	add	x1, x21, #0x108
  9f3ff4: f94133ae     	ldr	x14, [x29, #0x260]
  9f3ff8: f9000e8e     	str	x14, [x20, #0x18]
  9f3ffc: f94137ae     	ldr	x14, [x29, #0x268]
  9f4000: a9422688     	ldp	x8, x9, [x20, #0x20]
  9f4004: f940068d     	ldr	x13, [x20, #0x8]
  9f4008: f900128e     	str	x14, [x20, #0x20]
  9f400c: f9413fae     	ldr	x14, [x29, #0x278]
  9f4010: f94127a0     	ldr	x0, [x29, #0x248]
  9f4014: f9412bac     	ldr	x12, [x29, #0x250]
  9f4018: f90127a3     	str	x3, [x29, #0x248]
  9f401c: f9012bad     	str	x13, [x29, #0x250]
  9f4020: a9431e86     	ldp	x6, x7, [x20, #0x30]
  9f4024: f9001a8e     	str	x14, [x20, #0x30]
  9f4028: f94143ae     	ldr	x14, [x29, #0x280]
  9f402c: f9413bb3     	ldr	x19, [x29, #0x270]
  9f4030: f9414bb7     	ldr	x23, [x29, #0x290]
  9f4034: a9441684     	ldp	x4, x5, [x20, #0x40]
  9f4038: f9001e8e     	str	x14, [x20, #0x38]
  9f403c: f94147ae     	ldr	x14, [x29, #0x288]
  9f4040: a9002c4a     	stp	x10, x11, [x2]
  9f4044: a9012448     	stp	x8, x9, [x2, #0x10]
  9f4048: f9001693     	str	x19, [x20, #0x28]
  9f404c: f900228e     	str	x14, [x20, #0x40]
  9f4050: f9002697     	str	x23, [x20, #0x48]
  9f4054: f9000280     	str	x0, [x20]
  9f4058: f900068c     	str	x12, [x20, #0x8]
  9f405c: a9001c26     	stp	x6, x7, [x1]
  9f4060: a9011424     	stp	x4, x5, [x1, #0x10]
  9f4064: b4000140     	cbz	x0, 0x9f408c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x2f8>
  9f4068: 910022f7     	add	x23, x23, #0x8
  9f406c: eb1302ff     	cmp	x23, x19
  9f4070: 540000c9     	b.ls	0x9f4088 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x2f4>
  9f4074: f8408660     	ldr	x0, [x19], #0x8
  9f4078: 94061fa4     	bl	0xb7bf08 <_ZdlPv>
  9f407c: eb1302ff     	cmp	x23, x19
  9f4080: 54ffffa8     	b.hi	0x9f4074 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x2e0>
  9f4084: f9400280     	ldr	x0, [x20]
  9f4088: 94061fa0     	bl	0xb7bf08 <_ZdlPv>
  9f408c: 910203b4     	add	x20, x29, #0x80
  9f4090: d2800001     	mov	x1, #0x0                // =0
  9f4094: aa1403e0     	mov	x0, x20
  9f4098: f900029f     	str	xzr, [x20]
  9f409c: f900069f     	str	xzr, [x20, #0x8]
  9f40a0: f9000a9f     	str	xzr, [x20, #0x10]
  9f40a4: f9000e9f     	str	xzr, [x20, #0x18]
  9f40a8: f900129f     	str	xzr, [x20, #0x20]
  9f40ac: f900169f     	str	xzr, [x20, #0x28]
  9f40b0: f9001a9f     	str	xzr, [x20, #0x30]
  9f40b4: f9001e9f     	str	xzr, [x20, #0x38]
  9f40b8: f900229f     	str	xzr, [x20, #0x40]
  9f40bc: f900269f     	str	xzr, [x20, #0x48]
  9f40c0: 97fffab2     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f40c4: 9104a2a0     	add	x0, x21, #0x128
  9f40c8: d2800001     	mov	x1, #0x0                // =0
  9f40cc: f9014fbf     	str	xzr, [x29, #0x298]
  9f40d0: f90153bf     	str	xzr, [x29, #0x2a0]
  9f40d4: f90157bf     	str	xzr, [x29, #0x2a8]
  9f40d8: f9015bbf     	str	xzr, [x29, #0x2b0]
  9f40dc: f9015fbf     	str	xzr, [x29, #0x2b8]
  9f40e0: f90163bf     	str	xzr, [x29, #0x2c0]
  9f40e4: f90167bf     	str	xzr, [x29, #0x2c8]
  9f40e8: f9016bbf     	str	xzr, [x29, #0x2d0]
  9f40ec: f9016fbf     	str	xzr, [x29, #0x2d8]
  9f40f0: f90173bf     	str	xzr, [x29, #0x2e0]
  9f40f4: 97fffaa5     	bl	0x9f2b88 <_ZNSt11_Deque_baseIN7cocos2d8SAXStateESaIS1_EE17_M_initialize_mapEm>
  9f40f8: f9400283     	ldr	x3, [x20]
  9f40fc: b4000583     	cbz	x3, 0x9f41ac <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x418>
  9f4100: f94157ae     	ldr	x14, [x29, #0x2a8]
  9f4104: 9104e2a2     	add	x2, x21, #0x138
  9f4108: a9412e8a     	ldp	x10, x11, [x20, #0x10]
  9f410c: f9000a8e     	str	x14, [x20, #0x10]
  9f4110: 910562a1     	add	x1, x21, #0x158
  9f4114: f9415bae     	ldr	x14, [x29, #0x2b0]
  9f4118: f9000e8e     	str	x14, [x20, #0x18]
  9f411c: f9415fae     	ldr	x14, [x29, #0x2b8]
  9f4120: a9422688     	ldp	x8, x9, [x20, #0x20]
  9f4124: f940068d     	ldr	x13, [x20, #0x8]
  9f4128: f900128e     	str	x14, [x20, #0x20]
  9f412c: f94167ae     	ldr	x14, [x29, #0x2c8]
  9f4130: f9414fa0     	ldr	x0, [x29, #0x298]
  9f4134: f94153ac     	ldr	x12, [x29, #0x2a0]
  9f4138: f9014fa3     	str	x3, [x29, #0x298]
  9f413c: f90153ad     	str	x13, [x29, #0x2a0]
  9f4140: a9431e86     	ldp	x6, x7, [x20, #0x30]
  9f4144: f9001a8e     	str	x14, [x20, #0x30]
  9f4148: f9416bae     	ldr	x14, [x29, #0x2d0]
  9f414c: f94163b3     	ldr	x19, [x29, #0x2c0]
  9f4150: f94173b7     	ldr	x23, [x29, #0x2e0]
  9f4154: a9441684     	ldp	x4, x5, [x20, #0x40]
  9f4158: f9001e8e     	str	x14, [x20, #0x38]
  9f415c: f9416fae     	ldr	x14, [x29, #0x2d8]
  9f4160: a9002c4a     	stp	x10, x11, [x2]
  9f4164: a9012448     	stp	x8, x9, [x2, #0x10]
  9f4168: f9001693     	str	x19, [x20, #0x28]
  9f416c: f900228e     	str	x14, [x20, #0x40]
  9f4170: f9002697     	str	x23, [x20, #0x48]
  9f4174: f9000280     	str	x0, [x20]
  9f4178: f900068c     	str	x12, [x20, #0x8]
  9f417c: a9001c26     	stp	x6, x7, [x1]
  9f4180: a9011424     	stp	x4, x5, [x1, #0x10]
  9f4184: b4000140     	cbz	x0, 0x9f41ac <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x418>
  9f4188: 910022f7     	add	x23, x23, #0x8
  9f418c: eb1302ff     	cmp	x23, x19
  9f4190: 540000c9     	b.ls	0x9f41a8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x414>
  9f4194: f8408660     	ldr	x0, [x19], #0x8
  9f4198: 94061f5c     	bl	0xb7bf08 <_ZdlPv>
  9f419c: eb1302ff     	cmp	x23, x19
  9f41a0: 54ffffa8     	b.hi	0x9f4194 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x400>
  9f41a4: f9400280     	ldr	x0, [x20]
  9f41a8: 94061f58     	bl	0xb7bf08 <_ZdlPv>
  9f41ac: 9101e3bb     	add	x27, x29, #0x78
  9f41b0: 52800041     	mov	w1, #0x2                // =2
  9f41b4: aa1b03e0     	mov	x0, x27
  9f41b8: b9000aa1     	str	w1, [x21, #0x8]
  9f41bc: 940021c1     	bl	0x9fc8c0 <_ZN7cocos2d9SAXParserC2Ev>
  9f41c0: aa1b03e0     	mov	x0, x27
  9f41c4: aa1503e1     	mov	x1, x21
  9f41c8: 94002208     	bl	0x9fc9e8 <_ZN7cocos2d9SAXParser12setDelegatorEPNS_12SAXDelegatorE>
  9f41cc: aa1b03e0     	mov	x0, x27
  9f41d0: aa1c03e1     	mov	x1, x28
  9f41d4: 940022da     	bl	0x9fcd3c <_ZN7cocos2d9SAXParser5parseERKSs>
  9f41d8: f94026b3     	ldr	x19, [x21, #0x48]
  9f41dc: f9402ab7     	ldr	x23, [x21, #0x50]
  9f41e0: f900031f     	str	xzr, [x24]
  9f41e4: cb1302f4     	sub	x20, x23, x19
  9f41e8: f900071f     	str	xzr, [x24, #0x8]
  9f41ec: 9344fe80     	asr	x0, x20, #4
  9f41f0: f9000b1f     	str	xzr, [x24, #0x10]
  9f41f4: b5000d80     	cbnz	x0, 0x9f43a4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x610>
  9f41f8: d280001a     	mov	x26, #0x0               // =0
  9f41fc: 8b140354     	add	x20, x26, x20
  9f4200: f900031a     	str	x26, [x24]
  9f4204: f9000b14     	str	x20, [x24, #0x10]
  9f4208: eb17027f     	cmp	x19, x23
  9f420c: f900071a     	str	x26, [x24, #0x8]
  9f4210: aa1a03f4     	mov	x20, x26
  9f4214: 54000120     	b.eq	0x9f4238 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x4a4>
  9f4218: b4000094     	cbz	x20, 0x9f4228 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x494>
  9f421c: aa1403e0     	mov	x0, x20
  9f4220: aa1303e1     	mov	x1, x19
  9f4224: 940117ac     	bl	0xa3a0d4 <_ZN7cocos2d5ValueC2ERKS0_>
  9f4228: 91004273     	add	x19, x19, #0x10
  9f422c: 91004294     	add	x20, x20, #0x10
  9f4230: eb1302ff     	cmp	x23, x19
  9f4234: 54ffff21     	b.ne	0x9f4218 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x484>
  9f4238: f9000714     	str	x20, [x24, #0x8]
  9f423c: aa1b03e0     	mov	x0, x27
  9f4240: 940021a2     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f4244: f0002a60     	adrp	x0, 0xf43000
  9f4248: f9448801     	ldr	x1, [x0, #0x910]
  9f424c: f9414fa0     	ldr	x0, [x29, #0x298]
  9f4250: 91004021     	add	x1, x1, #0x10
  9f4254: f90002a1     	str	x1, [x21]
  9f4258: f94163b3     	ldr	x19, [x29, #0x2c0]
  9f425c: f94173b4     	ldr	x20, [x29, #0x2e0]
  9f4260: b4000140     	cbz	x0, 0x9f4288 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x4f4>
  9f4264: 91002294     	add	x20, x20, #0x8
  9f4268: eb14027f     	cmp	x19, x20
  9f426c: 540000c2     	b.hs	0x9f4284 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x4f0>
  9f4270: f8408660     	ldr	x0, [x19], #0x8
  9f4274: 94061f25     	bl	0xb7bf08 <_ZdlPv>
  9f4278: eb13029f     	cmp	x20, x19
  9f427c: 54ffffa8     	b.hi	0x9f4270 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x4dc>
  9f4280: f9414fa0     	ldr	x0, [x29, #0x298]
  9f4284: 94061f21     	bl	0xb7bf08 <_ZdlPv>
  9f4288: f94127a0     	ldr	x0, [x29, #0x248]
  9f428c: f9413bb3     	ldr	x19, [x29, #0x270]
  9f4290: f9414bb4     	ldr	x20, [x29, #0x290]
  9f4294: b4000140     	cbz	x0, 0x9f42bc <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x528>
  9f4298: 91002294     	add	x20, x20, #0x8
  9f429c: eb14027f     	cmp	x19, x20
  9f42a0: 540000c2     	b.hs	0x9f42b8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x524>
  9f42a4: f8408660     	ldr	x0, [x19], #0x8
  9f42a8: 94061f18     	bl	0xb7bf08 <_ZdlPv>
  9f42ac: eb13029f     	cmp	x20, x19
  9f42b0: 54ffffa8     	b.hi	0x9f42a4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x510>
  9f42b4: f94127a0     	ldr	x0, [x29, #0x248]
  9f42b8: 94061f14     	bl	0xb7bf08 <_ZdlPv>
  9f42bc: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f42c0: f94113b3     	ldr	x19, [x29, #0x220]
  9f42c4: f94123b4     	ldr	x20, [x29, #0x240]
  9f42c8: b4000140     	cbz	x0, 0x9f42f0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x55c>
  9f42cc: 91002294     	add	x20, x20, #0x8
  9f42d0: eb14027f     	cmp	x19, x20
  9f42d4: 540000c2     	b.hs	0x9f42ec <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x558>
  9f42d8: f8408660     	ldr	x0, [x19], #0x8
  9f42dc: 94061f0b     	bl	0xb7bf08 <_ZdlPv>
  9f42e0: eb13029f     	cmp	x20, x19
  9f42e4: 54ffffa8     	b.hi	0x9f42d8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x544>
  9f42e8: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f42ec: 94061f07     	bl	0xb7bf08 <_ZdlPv>
  9f42f0: f94036a1     	ldr	x1, [x21, #0x68]
  9f42f4: f947ef22     	ldr	x2, [x25, #0xfd8]
  9f42f8: d1006020     	sub	x0, x1, #0x18
  9f42fc: eb02001f     	cmp	x0, x2
  9f4300: 540006a1     	b.ne	0x9f43d4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x640>
  9f4304: f94032a1     	ldr	x1, [x21, #0x60]
  9f4308: f947ef22     	ldr	x2, [x25, #0xfd8]
  9f430c: d1006020     	sub	x0, x1, #0x18
  9f4310: eb02001f     	cmp	x0, x2
  9f4314: 540007a1     	b.ne	0x9f4408 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x674>
  9f4318: f94026b3     	ldr	x19, [x21, #0x48]
  9f431c: f9402ab4     	ldr	x20, [x21, #0x50]
  9f4320: eb14027f     	cmp	x19, x20
  9f4324: 540000e0     	b.eq	0x9f4340 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x5ac>
  9f4328: aa1303e0     	mov	x0, x19
  9f432c: 91004273     	add	x19, x19, #0x10
  9f4330: 940114ff     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f4334: eb13029f     	cmp	x20, x19
  9f4338: 54ffff81     	b.ne	0x9f4328 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x594>
  9f433c: f94026b4     	ldr	x20, [x21, #0x48]
  9f4340: b4000074     	cbz	x20, 0x9f434c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x5b8>
  9f4344: aa1403e0     	mov	x0, x20
  9f4348: 94061ef0     	bl	0xb7bf08 <_ZdlPv>
  9f434c: 910042a0     	add	x0, x21, #0x10
  9f4350: 97e72f83     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f4354: f9400393     	ldr	x19, [x28]
  9f4358: f947ef39     	ldr	x25, [x25, #0xfd8]
  9f435c: d1006274     	sub	x20, x19, #0x18
  9f4360: eb19029f     	cmp	x20, x25
  9f4364: 540006c1     	b.ne	0x9f443c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x6a8>
  9f4368: 90002a60     	adrp	x0, 0xf40000
  9f436c: f94177a2     	ldr	x2, [x29, #0x2e8]
  9f4370: f940e401     	ldr	x1, [x0, #0x1c8]
  9f4374: aa1803e0     	mov	x0, x24
  9f4378: f9400021     	ldr	x1, [x1]
  9f437c: eb01005f     	cmp	x2, x1
  9f4380: 540017a1     	b.ne	0x9f4674 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8e0>
  9f4384: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f4388: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f438c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f4390: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f4394: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f4398: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f439c: 910a43ff     	add	sp, sp, #0x290
  9f43a0: d65f03c0     	ret
  9f43a4: 92fe0001     	mov	x1, #0xfffffffffffffff  // =1152921504606846975
  9f43a8: eb01001f     	cmp	x0, x1
  9f43ac: 54001588     	b.hi	0x9f465c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8c8>
  9f43b0: aa1403e0     	mov	x0, x20
  9f43b4: 94062595     	bl	0xb7da08 <_Znwm>
  9f43b8: aa0003fa     	mov	x26, x0
  9f43bc: f94026b3     	ldr	x19, [x21, #0x48]
  9f43c0: f9402ab7     	ldr	x23, [x21, #0x50]
  9f43c4: 17ffff8e     	b	0x9f41fc <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x468>
  9f43c8: aa1503e2     	mov	x2, x21
  9f43cc: f8040c5f     	str	xzr, [x2, #0x40]!
  9f43d0: 17fffe96     	b	0x9f3e28 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x94>
  9f43d4: 90002a82     	adrp	x2, 0xf44000
  9f43d8: f9445042     	ldr	x2, [x2, #0x8a0]
  9f43dc: b40004c2     	cbz	x2, 0x9f4474 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x6e0>
  9f43e0: d1002021     	sub	x1, x1, #0x8
  9f43e4: 885ffc22     	ldaxr	w2, [x1]
  9f43e8: 51000443     	sub	w3, w2, #0x1
  9f43ec: 8804fc23     	stlxr	w4, w3, [x1]
  9f43f0: 35ffffa4     	cbnz	w4, 0x9f43e4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x650>
  9f43f4: 6b1f005f     	cmp	w2, wzr
  9f43f8: 54fff86c     	b.gt	0x9f4304 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x570>
  9f43fc: aa1603e1     	mov	x1, x22
  9f4400: 940758ef     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4404: 17ffffc0     	b	0x9f4304 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x570>
  9f4408: 90002a82     	adrp	x2, 0xf44000
  9f440c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f4410: b4000422     	cbz	x2, 0x9f4494 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x700>
  9f4414: d1002021     	sub	x1, x1, #0x8
  9f4418: 885ffc22     	ldaxr	w2, [x1]
  9f441c: 51000443     	sub	w3, w2, #0x1
  9f4420: 8804fc23     	stlxr	w4, w3, [x1]
  9f4424: 35ffffa4     	cbnz	w4, 0x9f4418 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x684>
  9f4428: 6b1f005f     	cmp	w2, wzr
  9f442c: 54fff76c     	b.gt	0x9f4318 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x584>
  9f4430: aa1603e1     	mov	x1, x22
  9f4434: 940758e2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4438: 17ffffb8     	b	0x9f4318 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x584>
  9f443c: 90002a80     	adrp	x0, 0xf44000
  9f4440: f9445000     	ldr	x0, [x0, #0x8a0]
  9f4444: b4000200     	cbz	x0, 0x9f4484 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x6f0>
  9f4448: d1002273     	sub	x19, x19, #0x8
  9f444c: 885ffe60     	ldaxr	w0, [x19]
  9f4450: 51000401     	sub	w1, w0, #0x1
  9f4454: 8802fe61     	stlxr	w2, w1, [x19]
  9f4458: 35ffffa2     	cbnz	w2, 0x9f444c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x6b8>
  9f445c: 6b1f001f     	cmp	w0, wzr
  9f4460: 54fff84c     	b.gt	0x9f4368 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x5d4>
  9f4464: aa1403e0     	mov	x0, x20
  9f4468: aa1503e1     	mov	x1, x21
  9f446c: 940758d4     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4470: 17ffffbe     	b	0x9f4368 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x5d4>
  9f4474: b85f8022     	ldur	w2, [x1, #-0x8]
  9f4478: 51000443     	sub	w3, w2, #0x1
  9f447c: b81f8023     	stur	w3, [x1, #-0x8]
  9f4480: 17ffffdd     	b	0x9f43f4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x660>
  9f4484: b85f8260     	ldur	w0, [x19, #-0x8]
  9f4488: 51000401     	sub	w1, w0, #0x1
  9f448c: b81f8261     	stur	w1, [x19, #-0x8]
  9f4490: 17fffff3     	b	0x9f445c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x6c8>
  9f4494: b85f8022     	ldur	w2, [x1, #-0x8]
  9f4498: 51000443     	sub	w3, w2, #0x1
  9f449c: b81f8023     	stur	w3, [x1, #-0x8]
  9f44a0: 17ffffe2     	b	0x9f4428 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x694>
  9f44a4: aa0003f3     	mov	x19, x0
  9f44a8: aa1503e0     	mov	x0, x21
  9f44ac: 97fff424     	bl	0x9f153c <_ZN7cocos2d9DictMakerD2Ev>
  9f44b0: f9400380     	ldr	x0, [x28]
  9f44b4: f947ef39     	ldr	x25, [x25, #0xfd8]
  9f44b8: d1006000     	sub	x0, x0, #0x18
  9f44bc: eb19001f     	cmp	x0, x25
  9f44c0: 54000060     	b.eq	0x9f44cc <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x738>
  9f44c4: 9101a3a1     	add	x1, x29, #0x68
  9f44c8: 97e6abee     	bl	0x39f480 <.text+0x3170>
  9f44cc: aa1303e0     	mov	x0, x19
  9f44d0: 9407ba84     	bl	0xbe2ee0 <_Unwind_Resume>
  9f44d4: f9400281     	ldr	x1, [x20]
  9f44d8: aa0003f3     	mov	x19, x0
  9f44dc: f9401697     	ldr	x23, [x20, #0x28]
  9f44e0: f9402696     	ldr	x22, [x20, #0x48]
  9f44e4: b40001a1     	cbz	x1, 0x9f4518 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x784>
  9f44e8: 910022d6     	add	x22, x22, #0x8
  9f44ec: eb1602ff     	cmp	x23, x22
  9f44f0: 540000c2     	b.hs	0x9f4508 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x774>
  9f44f4: f84086e0     	ldr	x0, [x23], #0x8
  9f44f8: 94061e84     	bl	0xb7bf08 <_ZdlPv>
  9f44fc: eb1702df     	cmp	x22, x23
  9f4500: 54ffffa8     	b.hi	0x9f44f4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x760>
  9f4504: f9400281     	ldr	x1, [x20]
  9f4508: aa0103e0     	mov	x0, x1
  9f450c: 94061e7f     	bl	0xb7bf08 <_ZdlPv>
  9f4510: 14000002     	b	0x9f4518 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x784>
  9f4514: aa0003f3     	mov	x19, x0
  9f4518: f94127a0     	ldr	x0, [x29, #0x248]
  9f451c: f9413bb6     	ldr	x22, [x29, #0x270]
  9f4520: f9414bb4     	ldr	x20, [x29, #0x290]
  9f4524: b4000340     	cbz	x0, 0x9f458c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7f8>
  9f4528: 91002294     	add	x20, x20, #0x8
  9f452c: eb1402df     	cmp	x22, x20
  9f4530: 540000c2     	b.hs	0x9f4548 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7b4>
  9f4534: f84086c0     	ldr	x0, [x22], #0x8
  9f4538: 94061e74     	bl	0xb7bf08 <_ZdlPv>
  9f453c: eb16029f     	cmp	x20, x22
  9f4540: 54ffffa8     	b.hi	0x9f4534 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7a0>
  9f4544: f94127a0     	ldr	x0, [x29, #0x248]
  9f4548: 94061e70     	bl	0xb7bf08 <_ZdlPv>
  9f454c: 14000010     	b	0x9f458c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7f8>
  9f4550: f9400281     	ldr	x1, [x20]
  9f4554: aa0003f3     	mov	x19, x0
  9f4558: f9401697     	ldr	x23, [x20, #0x28]
  9f455c: f9402696     	ldr	x22, [x20, #0x48]
  9f4560: b4000161     	cbz	x1, 0x9f458c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7f8>
  9f4564: 910022d6     	add	x22, x22, #0x8
  9f4568: eb1602ff     	cmp	x23, x22
  9f456c: 540000c2     	b.hs	0x9f4584 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7f0>
  9f4570: f84086e0     	ldr	x0, [x23], #0x8
  9f4574: 94061e65     	bl	0xb7bf08 <_ZdlPv>
  9f4578: eb1702df     	cmp	x22, x23
  9f457c: 54ffffa8     	b.hi	0x9f4570 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7dc>
  9f4580: f9400281     	ldr	x1, [x20]
  9f4584: aa0103e0     	mov	x0, x1
  9f4588: 94061e60     	bl	0xb7bf08 <_ZdlPv>
  9f458c: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f4590: f94113b6     	ldr	x22, [x29, #0x220]
  9f4594: f94123b4     	ldr	x20, [x29, #0x240]
  9f4598: b4000140     	cbz	x0, 0x9f45c0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x82c>
  9f459c: 91002294     	add	x20, x20, #0x8
  9f45a0: eb1402df     	cmp	x22, x20
  9f45a4: 540000c2     	b.hs	0x9f45bc <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x828>
  9f45a8: f84086c0     	ldr	x0, [x22], #0x8
  9f45ac: 94061e57     	bl	0xb7bf08 <_ZdlPv>
  9f45b0: eb16029f     	cmp	x20, x22
  9f45b4: 54ffffa8     	b.hi	0x9f45a8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x814>
  9f45b8: f940ffa0     	ldr	x0, [x29, #0x1f8]
  9f45bc: 94061e53     	bl	0xb7bf08 <_ZdlPv>
  9f45c0: f94036a0     	ldr	x0, [x21, #0x68]
  9f45c4: f947ef21     	ldr	x1, [x25, #0xfd8]
  9f45c8: d1006000     	sub	x0, x0, #0x18
  9f45cc: eb01001f     	cmp	x0, x1
  9f45d0: 54000060     	b.eq	0x9f45dc <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x848>
  9f45d4: 9101e3a1     	add	x1, x29, #0x78
  9f45d8: 97e6abaa     	bl	0x39f480 <.text+0x3170>
  9f45dc: f94032a0     	ldr	x0, [x21, #0x60]
  9f45e0: f947ef21     	ldr	x1, [x25, #0xfd8]
  9f45e4: d1006000     	sub	x0, x0, #0x18
  9f45e8: eb01001f     	cmp	x0, x1
  9f45ec: 54000060     	b.eq	0x9f45f8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x864>
  9f45f0: 9101e3a1     	add	x1, x29, #0x78
  9f45f4: 97e6aba3     	bl	0x39f480 <.text+0x3170>
  9f45f8: f94026b6     	ldr	x22, [x21, #0x48]
  9f45fc: f9402ab4     	ldr	x20, [x21, #0x50]
  9f4600: eb1402df     	cmp	x22, x20
  9f4604: 540000e0     	b.eq	0x9f4620 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x88c>
  9f4608: aa1603e0     	mov	x0, x22
  9f460c: 910042d6     	add	x22, x22, #0x10
  9f4610: 94011447     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f4614: eb16029f     	cmp	x20, x22
  9f4618: 54ffff81     	b.ne	0x9f4608 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x874>
  9f461c: f94026b4     	ldr	x20, [x21, #0x48]
  9f4620: b4000074     	cbz	x20, 0x9f462c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x898>
  9f4624: aa1403e0     	mov	x0, x20
  9f4628: 94061e38     	bl	0xb7bf08 <_ZdlPv>
  9f462c: 910042a0     	add	x0, x21, #0x10
  9f4630: 97e72ecb     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f4634: 17ffff9f     	b	0x9f44b0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x71c>
  9f4638: 94061fdb     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f463c: eb14035f     	cmp	x26, x20
  9f4640: 540000c0     	b.eq	0x9f4658 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8c4>
  9f4644: aa1a03e0     	mov	x0, x26
  9f4648: 9100435a     	add	x26, x26, #0x10
  9f464c: 94011438     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f4650: eb14035f     	cmp	x26, x20
  9f4654: 54ffff81     	b.ne	0x9f4644 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8b0>
  9f4658: 940623a7     	bl	0xb7d4f4 <__cxa_rethrow>
  9f465c: 94074287     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>
  9f4660: aa0003f3     	mov	x19, x0
  9f4664: 17ffffca     	b	0x9f458c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x7f8>
  9f4668: aa0003f3     	mov	x19, x0
  9f466c: b0002ab9     	adrp	x25, 0xf49000
  9f4670: 17ffff90     	b	0x9f44b0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x71c>
  9f4674: 97e69b4b     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f4678: aa0003f3     	mov	x19, x0
  9f467c: aa1b03e0     	mov	x0, x27
  9f4680: 94002092     	bl	0x9fc8c8 <_ZN7cocos2d9SAXParserD2Ev>
  9f4684: 17ffff89     	b	0x9f44a8 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x714>
  9f4688: aa0003f3     	mov	x19, x0
  9f468c: 17ffffcd     	b	0x9f45c0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x82c>
  9f4690: f94002c1     	ldr	x1, [x22]
  9f4694: aa0003f3     	mov	x19, x0
  9f4698: f94016d7     	ldr	x23, [x22, #0x28]
  9f469c: f94026d4     	ldr	x20, [x22, #0x48]
  9f46a0: b4fff901     	cbz	x1, 0x9f45c0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x82c>
  9f46a4: 91002294     	add	x20, x20, #0x8
  9f46a8: eb1402ff     	cmp	x23, x20
  9f46ac: 540000c2     	b.hs	0x9f46c4 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x930>
  9f46b0: f84086e0     	ldr	x0, [x23], #0x8
  9f46b4: 94061e15     	bl	0xb7bf08 <_ZdlPv>
  9f46b8: eb17029f     	cmp	x20, x23
  9f46bc: 54ffffa8     	b.hi	0x9f46b0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x91c>
  9f46c0: f94002c1     	ldr	x1, [x22]
  9f46c4: aa0103e0     	mov	x0, x1
  9f46c8: 94061e10     	bl	0xb7bf08 <_ZdlPv>
  9f46cc: 17ffffbd     	b	0x9f45c0 <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x82c>
  9f46d0: aa0003f3     	mov	x19, x0
  9f46d4: 94061fdc     	bl	0xb7c644 <__cxa_end_catch>
  9f46d8: f9400300     	ldr	x0, [x24]
  9f46dc: b4fffd00     	cbz	x0, 0x9f467c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8e8>
  9f46e0: 94061e0a     	bl	0xb7bf08 <_ZdlPv>
  9f46e4: 17ffffe6     	b	0x9f467c <_ZN7cocos2d9FileUtils22getValueVectorFromFileERKSs+0x8e8>

00000000009f46e8 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_>:
  9f46e8: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f46ec: 910003fd     	mov	x29, sp
  9f46f0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f46f4: aa0003f4     	mov	x20, x0
  9f46f8: f9400402     	ldr	x2, [x0, #0x8]
  9f46fc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f4700: f9402415     	ldr	x21, [x0, #0x48]
  9f4704: aa0003f3     	mov	x19, x0
  9f4708: f8430683     	ldr	x3, [x20], #0x30
  9f470c: aa0103f6     	mov	x22, x1
  9f4710: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f4714: cb0302a0     	sub	x0, x21, x3
  9f4718: cb800c40     	sub	x0, x2, x0, asr #3
  9f471c: f100041f     	cmp	x0, #0x1
  9f4720: 540002a9     	b.ls	0x9f4774 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x8c>
  9f4724: d2804000     	mov	x0, #0x200              // =512
  9f4728: 940624b8     	bl	0xb7da08 <_Znwm>
  9f472c: f90006a0     	str	x0, [x21, #0x8]
  9f4730: b94002c1     	ldr	w1, [x22]
  9f4734: f9401a60     	ldr	x0, [x19, #0x30]
  9f4738: b4000040     	cbz	x0, 0x9f4740 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x58>
  9f473c: b9000001     	str	w1, [x0]
  9f4740: f9402660     	ldr	x0, [x19, #0x48]
  9f4744: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f4748: 91002001     	add	x1, x0, #0x8
  9f474c: f9000e81     	str	x1, [x20, #0x18]
  9f4750: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f4754: f9400400     	ldr	x0, [x0, #0x8]
  9f4758: f9000680     	str	x0, [x20, #0x8]
  9f475c: 91080001     	add	x1, x0, #0x200
  9f4760: f9000a81     	str	x1, [x20, #0x10]
  9f4764: f9001a60     	str	x0, [x19, #0x30]
  9f4768: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f476c: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f4770: d65f03c0     	ret
  9f4774: f9401661     	ldr	x1, [x19, #0x28]
  9f4778: cb0102b7     	sub	x23, x21, x1
  9f477c: 9343fef7     	asr	x23, x23, #3
  9f4780: 910006f7     	add	x23, x23, #0x1
  9f4784: 910006f8     	add	x24, x23, #0x1
  9f4788: eb18045f     	cmp	x2, x24, lsl #1
  9f478c: 54000189     	b.ls	0x9f47bc <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0xd4>
  9f4790: cb180042     	sub	x2, x2, x24
  9f4794: 910022b5     	add	x21, x21, #0x8
  9f4798: d341fc42     	lsr	x2, x2, #1
  9f479c: 8b020c78     	add	x24, x3, x2, lsl #3
  9f47a0: eb18003f     	cmp	x1, x24
  9f47a4: 540005a9     	b.ls	0x9f4858 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x170>
  9f47a8: cb0102a2     	sub	x2, x21, x1
  9f47ac: 9343fc40     	asr	x0, x2, #3
  9f47b0: b50006a0     	cbnz	x0, 0x9f4884 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x19c>
  9f47b4: d37df2f7     	lsl	x23, x23, #3
  9f47b8: 14000018     	b	0x9f4818 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x130>
  9f47bc: b40004a2     	cbz	x2, 0x9f4850 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x168>
  9f47c0: d37ff842     	lsl	x2, x2, #1
  9f47c4: 92fc0000     	mov	x0, #0x1fffffffffffffff // =2305843009213693951
  9f47c8: 91000855     	add	x21, x2, #0x2
  9f47cc: eb0002bf     	cmp	x21, x0
  9f47d0: 54000628     	b.hi	0x9f4894 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x1ac>
  9f47d4: d37df2a0     	lsl	x0, x21, #3
  9f47d8: cb1802b8     	sub	x24, x21, x24
  9f47dc: d341ff18     	lsr	x24, x24, #1
  9f47e0: 9406248a     	bl	0xb7da08 <_Znwm>
  9f47e4: aa0003f4     	mov	x20, x0
  9f47e8: f9402662     	ldr	x2, [x19, #0x48]
  9f47ec: 8b180c18     	add	x24, x0, x24, lsl #3
  9f47f0: f9401661     	ldr	x1, [x19, #0x28]
  9f47f4: 91002042     	add	x2, x2, #0x8
  9f47f8: cb010042     	sub	x2, x2, x1
  9f47fc: 9343fc40     	asr	x0, x2, #3
  9f4800: b50003c0     	cbnz	x0, 0x9f4878 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x190>
  9f4804: f9400260     	ldr	x0, [x19]
  9f4808: d37df2f7     	lsl	x23, x23, #3
  9f480c: 94061dbf     	bl	0xb7bf08 <_ZdlPv>
  9f4810: f9000274     	str	x20, [x19]
  9f4814: f9000675     	str	x21, [x19, #0x8]
  9f4818: f9001678     	str	x24, [x19, #0x28]
  9f481c: 9100c274     	add	x20, x19, #0x30
  9f4820: d10022e0     	sub	x0, x23, #0x8
  9f4824: f9400301     	ldr	x1, [x24]
  9f4828: 8b000315     	add	x21, x24, x0
  9f482c: f9000e61     	str	x1, [x19, #0x18]
  9f4830: 91080021     	add	x1, x1, #0x200
  9f4834: f9001261     	str	x1, [x19, #0x20]
  9f4838: f9000e95     	str	x21, [x20, #0x18]
  9f483c: f8606b00     	ldr	x0, [x24, x0]
  9f4840: f9000680     	str	x0, [x20, #0x8]
  9f4844: 91080000     	add	x0, x0, #0x200
  9f4848: f9000a80     	str	x0, [x20, #0x10]
  9f484c: 17ffffb6     	b	0x9f4724 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x3c>
  9f4850: d2800075     	mov	x21, #0x3               // =3
  9f4854: 17ffffe0     	b	0x9f47d4 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0xec>
  9f4858: cb0102a2     	sub	x2, x21, x1
  9f485c: d37df2f7     	lsl	x23, x23, #3
  9f4860: 9343fc40     	asr	x0, x2, #3
  9f4864: b4fffda0     	cbz	x0, 0x9f4818 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x130>
  9f4868: cb0202e0     	sub	x0, x23, x2
  9f486c: 8b000300     	add	x0, x24, x0
  9f4870: 97e69c44     	bl	0x39b980 <memmove@plt>
  9f4874: 17ffffe9     	b	0x9f4818 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x130>
  9f4878: aa1803e0     	mov	x0, x24
  9f487c: 97e69c41     	bl	0x39b980 <memmove@plt>
  9f4880: 17ffffe1     	b	0x9f4804 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x11c>
  9f4884: aa1803e0     	mov	x0, x24
  9f4888: d37df2f7     	lsl	x23, x23, #3
  9f488c: 97e69c3d     	bl	0x39b980 <memmove@plt>
  9f4890: 17ffffe2     	b	0x9f4818 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_+0x130>
  9f4894: 940741f9     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>

00000000009f4898 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_>:
  9f4898: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f489c: 910003fd     	mov	x29, sp
  9f48a0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f48a4: aa0003f4     	mov	x20, x0
  9f48a8: f9400402     	ldr	x2, [x0, #0x8]
  9f48ac: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f48b0: f9402415     	ldr	x21, [x0, #0x48]
  9f48b4: aa0003f3     	mov	x19, x0
  9f48b8: f8430683     	ldr	x3, [x20], #0x30
  9f48bc: aa0103f6     	mov	x22, x1
  9f48c0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f48c4: cb0302a0     	sub	x0, x21, x3
  9f48c8: cb800c40     	sub	x0, x2, x0, asr #3
  9f48cc: f100041f     	cmp	x0, #0x1
  9f48d0: 540002a9     	b.ls	0x9f4924 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x8c>
  9f48d4: d2804000     	mov	x0, #0x200              // =512
  9f48d8: 9406244c     	bl	0xb7da08 <_Znwm>
  9f48dc: f90006a0     	str	x0, [x21, #0x8]
  9f48e0: f9401a60     	ldr	x0, [x19, #0x30]
  9f48e4: f94002c1     	ldr	x1, [x22]
  9f48e8: b4000040     	cbz	x0, 0x9f48f0 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x58>
  9f48ec: f9000001     	str	x1, [x0]
  9f48f0: f9402660     	ldr	x0, [x19, #0x48]
  9f48f4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f48f8: 91002001     	add	x1, x0, #0x8
  9f48fc: f9000e81     	str	x1, [x20, #0x18]
  9f4900: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f4904: f9400400     	ldr	x0, [x0, #0x8]
  9f4908: f9000680     	str	x0, [x20, #0x8]
  9f490c: 91080001     	add	x1, x0, #0x200
  9f4910: f9000a81     	str	x1, [x20, #0x10]
  9f4914: f9001a60     	str	x0, [x19, #0x30]
  9f4918: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f491c: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f4920: d65f03c0     	ret
  9f4924: f9401661     	ldr	x1, [x19, #0x28]
  9f4928: cb0102b7     	sub	x23, x21, x1
  9f492c: 9343fef7     	asr	x23, x23, #3
  9f4930: 910006f7     	add	x23, x23, #0x1
  9f4934: 910006f8     	add	x24, x23, #0x1
  9f4938: eb18045f     	cmp	x2, x24, lsl #1
  9f493c: 54000189     	b.ls	0x9f496c <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0xd4>
  9f4940: cb180042     	sub	x2, x2, x24
  9f4944: 910022b5     	add	x21, x21, #0x8
  9f4948: d341fc42     	lsr	x2, x2, #1
  9f494c: 8b020c78     	add	x24, x3, x2, lsl #3
  9f4950: eb18003f     	cmp	x1, x24
  9f4954: 540005a9     	b.ls	0x9f4a08 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x170>
  9f4958: cb0102a2     	sub	x2, x21, x1
  9f495c: 9343fc40     	asr	x0, x2, #3
  9f4960: b50006a0     	cbnz	x0, 0x9f4a34 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x19c>
  9f4964: d37df2f7     	lsl	x23, x23, #3
  9f4968: 14000018     	b	0x9f49c8 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x130>
  9f496c: b40004a2     	cbz	x2, 0x9f4a00 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x168>
  9f4970: d37ff842     	lsl	x2, x2, #1
  9f4974: 92fc0000     	mov	x0, #0x1fffffffffffffff // =2305843009213693951
  9f4978: 91000855     	add	x21, x2, #0x2
  9f497c: eb0002bf     	cmp	x21, x0
  9f4980: 54000628     	b.hi	0x9f4a44 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x1ac>
  9f4984: d37df2a0     	lsl	x0, x21, #3
  9f4988: cb1802b8     	sub	x24, x21, x24
  9f498c: d341ff18     	lsr	x24, x24, #1
  9f4990: 9406241e     	bl	0xb7da08 <_Znwm>
  9f4994: aa0003f4     	mov	x20, x0
  9f4998: f9402662     	ldr	x2, [x19, #0x48]
  9f499c: 8b180c18     	add	x24, x0, x24, lsl #3
  9f49a0: f9401661     	ldr	x1, [x19, #0x28]
  9f49a4: 91002042     	add	x2, x2, #0x8
  9f49a8: cb010042     	sub	x2, x2, x1
  9f49ac: 9343fc40     	asr	x0, x2, #3
  9f49b0: b50003c0     	cbnz	x0, 0x9f4a28 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x190>
  9f49b4: f9400260     	ldr	x0, [x19]
  9f49b8: d37df2f7     	lsl	x23, x23, #3
  9f49bc: 94061d53     	bl	0xb7bf08 <_ZdlPv>
  9f49c0: f9000274     	str	x20, [x19]
  9f49c4: f9000675     	str	x21, [x19, #0x8]
  9f49c8: f9001678     	str	x24, [x19, #0x28]
  9f49cc: 9100c274     	add	x20, x19, #0x30
  9f49d0: d10022e0     	sub	x0, x23, #0x8
  9f49d4: f9400301     	ldr	x1, [x24]
  9f49d8: 8b000315     	add	x21, x24, x0
  9f49dc: f9000e61     	str	x1, [x19, #0x18]
  9f49e0: 91080021     	add	x1, x1, #0x200
  9f49e4: f9001261     	str	x1, [x19, #0x20]
  9f49e8: f9000e95     	str	x21, [x20, #0x18]
  9f49ec: f8606b00     	ldr	x0, [x24, x0]
  9f49f0: f9000680     	str	x0, [x20, #0x8]
  9f49f4: 91080000     	add	x0, x0, #0x200
  9f49f8: f9000a80     	str	x0, [x20, #0x10]
  9f49fc: 17ffffb6     	b	0x9f48d4 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x3c>
  9f4a00: d2800075     	mov	x21, #0x3               // =3
  9f4a04: 17ffffe0     	b	0x9f4984 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0xec>
  9f4a08: cb0102a2     	sub	x2, x21, x1
  9f4a0c: d37df2f7     	lsl	x23, x23, #3
  9f4a10: 9343fc40     	asr	x0, x2, #3
  9f4a14: b4fffda0     	cbz	x0, 0x9f49c8 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x130>
  9f4a18: cb0202e0     	sub	x0, x23, x2
  9f4a1c: 8b000300     	add	x0, x24, x0
  9f4a20: 97e69bd8     	bl	0x39b980 <memmove@plt>
  9f4a24: 17ffffe9     	b	0x9f49c8 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x130>
  9f4a28: aa1803e0     	mov	x0, x24
  9f4a2c: 97e69bd5     	bl	0x39b980 <memmove@plt>
  9f4a30: 17ffffe1     	b	0x9f49b4 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x11c>
  9f4a34: aa1803e0     	mov	x0, x24
  9f4a38: d37df2f7     	lsl	x23, x23, #3
  9f4a3c: 97e69bd1     	bl	0x39b980 <memmove@plt>
  9f4a40: 17ffffe2     	b	0x9f49c8 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_+0x130>
  9f4a44: 9407418d     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>

00000000009f4a48 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_>:
  9f4a48: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f4a4c: 910003fd     	mov	x29, sp
  9f4a50: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f4a54: aa0003f4     	mov	x20, x0
  9f4a58: f9400402     	ldr	x2, [x0, #0x8]
  9f4a5c: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f4a60: f9402415     	ldr	x21, [x0, #0x48]
  9f4a64: aa0003f3     	mov	x19, x0
  9f4a68: f8430683     	ldr	x3, [x20], #0x30
  9f4a6c: aa0103f6     	mov	x22, x1
  9f4a70: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f4a74: cb0302a0     	sub	x0, x21, x3
  9f4a78: cb800c40     	sub	x0, x2, x0, asr #3
  9f4a7c: f100041f     	cmp	x0, #0x1
  9f4a80: 540002a9     	b.ls	0x9f4ad4 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x8c>
  9f4a84: d2804000     	mov	x0, #0x200              // =512
  9f4a88: 940623e0     	bl	0xb7da08 <_Znwm>
  9f4a8c: f90006a0     	str	x0, [x21, #0x8]
  9f4a90: f9401a60     	ldr	x0, [x19, #0x30]
  9f4a94: f94002c1     	ldr	x1, [x22]
  9f4a98: b4000040     	cbz	x0, 0x9f4aa0 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x58>
  9f4a9c: f9000001     	str	x1, [x0]
  9f4aa0: f9402660     	ldr	x0, [x19, #0x48]
  9f4aa4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f4aa8: 91002001     	add	x1, x0, #0x8
  9f4aac: f9000e81     	str	x1, [x20, #0x18]
  9f4ab0: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f4ab4: f9400400     	ldr	x0, [x0, #0x8]
  9f4ab8: f9000680     	str	x0, [x20, #0x8]
  9f4abc: 91080001     	add	x1, x0, #0x200
  9f4ac0: f9000a81     	str	x1, [x20, #0x10]
  9f4ac4: f9001a60     	str	x0, [x19, #0x30]
  9f4ac8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f4acc: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f4ad0: d65f03c0     	ret
  9f4ad4: f9401661     	ldr	x1, [x19, #0x28]
  9f4ad8: cb0102b7     	sub	x23, x21, x1
  9f4adc: 9343fef7     	asr	x23, x23, #3
  9f4ae0: 910006f7     	add	x23, x23, #0x1
  9f4ae4: 910006f8     	add	x24, x23, #0x1
  9f4ae8: eb18045f     	cmp	x2, x24, lsl #1
  9f4aec: 54000189     	b.ls	0x9f4b1c <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0xd4>
  9f4af0: cb180042     	sub	x2, x2, x24
  9f4af4: 910022b5     	add	x21, x21, #0x8
  9f4af8: d341fc42     	lsr	x2, x2, #1
  9f4afc: 8b020c78     	add	x24, x3, x2, lsl #3
  9f4b00: eb18003f     	cmp	x1, x24
  9f4b04: 540005a9     	b.ls	0x9f4bb8 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x170>
  9f4b08: cb0102a2     	sub	x2, x21, x1
  9f4b0c: 9343fc40     	asr	x0, x2, #3
  9f4b10: b50006a0     	cbnz	x0, 0x9f4be4 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x19c>
  9f4b14: d37df2f7     	lsl	x23, x23, #3
  9f4b18: 14000018     	b	0x9f4b78 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x130>
  9f4b1c: b40004a2     	cbz	x2, 0x9f4bb0 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x168>
  9f4b20: d37ff842     	lsl	x2, x2, #1
  9f4b24: 92fc0000     	mov	x0, #0x1fffffffffffffff // =2305843009213693951
  9f4b28: 91000855     	add	x21, x2, #0x2
  9f4b2c: eb0002bf     	cmp	x21, x0
  9f4b30: 54000628     	b.hi	0x9f4bf4 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x1ac>
  9f4b34: d37df2a0     	lsl	x0, x21, #3
  9f4b38: cb1802b8     	sub	x24, x21, x24
  9f4b3c: d341ff18     	lsr	x24, x24, #1
  9f4b40: 940623b2     	bl	0xb7da08 <_Znwm>
  9f4b44: aa0003f4     	mov	x20, x0
  9f4b48: f9402662     	ldr	x2, [x19, #0x48]
  9f4b4c: 8b180c18     	add	x24, x0, x24, lsl #3
  9f4b50: f9401661     	ldr	x1, [x19, #0x28]
  9f4b54: 91002042     	add	x2, x2, #0x8
  9f4b58: cb010042     	sub	x2, x2, x1
  9f4b5c: 9343fc40     	asr	x0, x2, #3
  9f4b60: b50003c0     	cbnz	x0, 0x9f4bd8 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x190>
  9f4b64: f9400260     	ldr	x0, [x19]
  9f4b68: d37df2f7     	lsl	x23, x23, #3
  9f4b6c: 94061ce7     	bl	0xb7bf08 <_ZdlPv>
  9f4b70: f9000274     	str	x20, [x19]
  9f4b74: f9000675     	str	x21, [x19, #0x8]
  9f4b78: f9001678     	str	x24, [x19, #0x28]
  9f4b7c: 9100c274     	add	x20, x19, #0x30
  9f4b80: d10022e0     	sub	x0, x23, #0x8
  9f4b84: f9400301     	ldr	x1, [x24]
  9f4b88: 8b000315     	add	x21, x24, x0
  9f4b8c: f9000e61     	str	x1, [x19, #0x18]
  9f4b90: 91080021     	add	x1, x1, #0x200
  9f4b94: f9001261     	str	x1, [x19, #0x20]
  9f4b98: f9000e95     	str	x21, [x20, #0x18]
  9f4b9c: f8606b00     	ldr	x0, [x24, x0]
  9f4ba0: f9000680     	str	x0, [x20, #0x8]
  9f4ba4: 91080000     	add	x0, x0, #0x200
  9f4ba8: f9000a80     	str	x0, [x20, #0x10]
  9f4bac: 17ffffb6     	b	0x9f4a84 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x3c>
  9f4bb0: d2800075     	mov	x21, #0x3               // =3
  9f4bb4: 17ffffe0     	b	0x9f4b34 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0xec>
  9f4bb8: cb0102a2     	sub	x2, x21, x1
  9f4bbc: d37df2f7     	lsl	x23, x23, #3
  9f4bc0: 9343fc40     	asr	x0, x2, #3
  9f4bc4: b4fffda0     	cbz	x0, 0x9f4b78 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x130>
  9f4bc8: cb0202e0     	sub	x0, x23, x2
  9f4bcc: 8b000300     	add	x0, x24, x0
  9f4bd0: 97e69b6c     	bl	0x39b980 <memmove@plt>
  9f4bd4: 17ffffe9     	b	0x9f4b78 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x130>
  9f4bd8: aa1803e0     	mov	x0, x24
  9f4bdc: 97e69b69     	bl	0x39b980 <memmove@plt>
  9f4be0: 17ffffe1     	b	0x9f4b64 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x11c>
  9f4be4: aa1803e0     	mov	x0, x24
  9f4be8: d37df2f7     	lsl	x23, x23, #3
  9f4bec: 97e69b65     	bl	0x39b980 <memmove@plt>
  9f4bf0: 17ffffe2     	b	0x9f4b78 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_+0x130>
  9f4bf4: 94074121     	bl	0xbc5078 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46a50>

00000000009f4bf8 <_ZN7cocos2d9FileUtils4initEv>:
  9f4bf8: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9f4bfc: 91238001     	add	x1, x0, #0x8e0
  9f4c00: 910003fd     	mov	x29, sp
  9f4c04: f90013f5     	str	x21, [sp, #0x20]
  9f4c08: 90002a75     	adrp	x21, 0xf40000
  9f4c0c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f4c10: 91232013     	add	x19, x0, #0x8c8
  9f4c14: aa0003f4     	mov	x20, x0
  9f4c18: f940e6a3     	ldr	x3, [x21, #0x1c8]
  9f4c1c: f9400a62     	ldr	x2, [x19, #0x10]
  9f4c20: f9400660     	ldr	x0, [x19, #0x8]
  9f4c24: f9400063     	ldr	x3, [x3]
  9f4c28: f90027a3     	str	x3, [x29, #0x48]
  9f4c2c: eb02001f     	cmp	x0, x2
  9f4c30: 54000a20     	b.eq	0x9f4d74 <_ZN7cocos2d9FileUtils4initEv+0x17c>
  9f4c34: b4000060     	cbz	x0, 0x9f4c40 <_ZN7cocos2d9FileUtils4initEv+0x48>
  9f4c38: 94075742     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f4c3c: f9400660     	ldr	x0, [x19, #0x8]
  9f4c40: 91002000     	add	x0, x0, #0x8
  9f4c44: f9000660     	str	x0, [x19, #0x8]
  9f4c48: 910103b3     	add	x19, x29, #0x40
  9f4c4c: f00013a1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f4c50: aa1303e0     	mov	x0, x19
  9f4c54: 91330021     	add	x1, x1, #0xcc0
  9f4c58: 9100c3a2     	add	x2, x29, #0x30
  9f4c5c: 940748dd     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f4c60: f9445e81     	ldr	x1, [x20, #0x8b8]
  9f4c64: 9122c280     	add	x0, x20, #0x8b0
  9f4c68: f9400802     	ldr	x2, [x0, #0x10]
  9f4c6c: eb02003f     	cmp	x1, x2
  9f4c70: 54000880     	b.eq	0x9f4d80 <_ZN7cocos2d9FileUtils4initEv+0x188>
  9f4c74: f9400262     	ldr	x2, [x19]
  9f4c78: b0002aa3     	adrp	x3, 0xf49000
  9f4c7c: b40000a1     	cbz	x1, 0x9f4c90 <_ZN7cocos2d9FileUtils4initEv+0x98>
  9f4c80: f9000022     	str	x2, [x1]
  9f4c84: f947ec62     	ldr	x2, [x3, #0xfd8]
  9f4c88: 91006042     	add	x2, x2, #0x18
  9f4c8c: f9000262     	str	x2, [x19]
  9f4c90: 91002021     	add	x1, x1, #0x8
  9f4c94: f9000401     	str	x1, [x0, #0x8]
  9f4c98: f947ec63     	ldr	x3, [x3, #0xfd8]
  9f4c9c: d1006040     	sub	x0, x2, #0x18
  9f4ca0: eb03001f     	cmp	x0, x3
  9f4ca4: 540004e1     	b.ne	0x9f4d40 <_ZN7cocos2d9FileUtils4initEv+0x148>
  9f4ca8: f9443280     	ldr	x0, [x20, #0x860]
  9f4cac: 52800013     	mov	w19, #0x0               // =0
  9f4cb0: f9443681     	ldr	x1, [x20, #0x868]
  9f4cb4: 39400000     	ldrb	w0, [x0]
  9f4cb8: 8b002000     	add	x0, x0, x0, lsl #8
  9f4cbc: 8b004000     	add	x0, x0, x0, lsl #16
  9f4cc0: 8b008000     	add	x0, x0, x0, lsl #32
  9f4cc4: f9000020     	str	x0, [x1]
  9f4cc8: f9442a81     	ldr	x1, [x20, #0x850]
  9f4ccc: f9443680     	ldr	x0, [x20, #0x868]
  9f4cd0: 97e696d8     	bl	0x39a830 <strcat@plt>
  9f4cd4: f9442e81     	ldr	x1, [x20, #0x858]
  9f4cd8: f9443680     	ldr	x0, [x20, #0x868]
  9f4cdc: 97e696d5     	bl	0x39a830 <strcat@plt>
  9f4ce0: 52801e21     	mov	w1, #0xf1               // =241
  9f4ce4: 5298e560     	mov	w0, #0xc72b             // =50987
  9f4ce8: 72a00041     	movk	w1, #0x2, lsl #16
  9f4cec: 72a00080     	movk	w0, #0x4, lsl #16
  9f4cf0: b9084681     	str	w1, [x20, #0x844]
  9f4cf4: b9084a80     	str	w0, [x20, #0x848]
  9f4cf8: f9400282     	ldr	x2, [x20]
  9f4cfc: 2a1303e1     	mov	w1, w19
  9f4d00: aa1403e0     	mov	x0, x20
  9f4d04: 11000673     	add	w19, w19, #0x1
  9f4d08: f940b042     	ldr	x2, [x2, #0x160]
  9f4d0c: d63f0040     	blr	x2
  9f4d10: 7104027f     	cmp	w19, #0x100
  9f4d14: 54ffff21     	b.ne	0x9f4cf8 <_ZN7cocos2d9FileUtils4initEv+0x100>
  9f4d18: f940e6b5     	ldr	x21, [x21, #0x1c8]
  9f4d1c: 52800020     	mov	w0, #0x1                // =1
  9f4d20: f94027a2     	ldr	x2, [x29, #0x48]
  9f4d24: f94002a1     	ldr	x1, [x21]
  9f4d28: eb01005f     	cmp	x2, x1
  9f4d2c: 540003c1     	b.ne	0x9f4da4 <_ZN7cocos2d9FileUtils4initEv+0x1ac>
  9f4d30: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f4d34: f94013f5     	ldr	x21, [sp, #0x20]
  9f4d38: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9f4d3c: d65f03c0     	ret
  9f4d40: 90002a81     	adrp	x1, 0xf44000
  9f4d44: f9445021     	ldr	x1, [x1, #0x8a0]
  9f4d48: b4000261     	cbz	x1, 0x9f4d94 <_ZN7cocos2d9FileUtils4initEv+0x19c>
  9f4d4c: d1002042     	sub	x2, x2, #0x8
  9f4d50: 885ffc41     	ldaxr	w1, [x2]
  9f4d54: 51000423     	sub	w3, w1, #0x1
  9f4d58: 8804fc43     	stlxr	w4, w3, [x2]
  9f4d5c: 35ffffa4     	cbnz	w4, 0x9f4d50 <_ZN7cocos2d9FileUtils4initEv+0x158>
  9f4d60: 6b1f003f     	cmp	w1, wzr
  9f4d64: 54fffa2c     	b.gt	0x9f4ca8 <_ZN7cocos2d9FileUtils4initEv+0xb0>
  9f4d68: 9100e3a1     	add	x1, x29, #0x38
  9f4d6c: 94075694     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4d70: 17ffffce     	b	0x9f4ca8 <_ZN7cocos2d9FileUtils4initEv+0xb0>
  9f4d74: aa1303e0     	mov	x0, x19
  9f4d78: 97e6c91c     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f4d7c: 17ffffb3     	b	0x9f4c48 <_ZN7cocos2d9FileUtils4initEv+0x50>
  9f4d80: aa1303e1     	mov	x1, x19
  9f4d84: 97e6cad1     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  9f4d88: f94023a2     	ldr	x2, [x29, #0x40]
  9f4d8c: b0002aa3     	adrp	x3, 0xf49000
  9f4d90: 17ffffc2     	b	0x9f4c98 <_ZN7cocos2d9FileUtils4initEv+0xa0>
  9f4d94: b85f8041     	ldur	w1, [x2, #-0x8]
  9f4d98: 51000423     	sub	w3, w1, #0x1
  9f4d9c: b81f8043     	stur	w3, [x2, #-0x8]
  9f4da0: 17fffff0     	b	0x9f4d60 <_ZN7cocos2d9FileUtils4initEv+0x168>
  9f4da4: 97e6997f     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f4da8: b0002aa1     	adrp	x1, 0xf49000
  9f4dac: aa0003f3     	mov	x19, x0
  9f4db0: f94023a0     	ldr	x0, [x29, #0x40]
  9f4db4: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f4db8: d1006000     	sub	x0, x0, #0x18
  9f4dbc: eb01001f     	cmp	x0, x1
  9f4dc0: 54000060     	b.eq	0x9f4dcc <_ZN7cocos2d9FileUtils4initEv+0x1d4>
  9f4dc4: 9100e3a1     	add	x1, x29, #0x38
  9f4dc8: 97e6a9ae     	bl	0x39f480 <.text+0x3170>
  9f4dcc: aa1303e0     	mov	x0, x19
  9f4dd0: 9407b844     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f4dd4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE>:
  9f4dd4: a9b77bfd     	stp	x29, x30, [sp, #-0x90]!
  9f4dd8: 910003fd     	mov	x29, sp
  9f4ddc: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f4de0: 90002a7c     	adrp	x28, 0xf40000
  9f4de4: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f4de8: aa0103f9     	mov	x25, x1
  9f4dec: f940e781     	ldr	x1, [x28, #0x1c8]
  9f4df0: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f4df4: aa0003f8     	mov	x24, x0
  9f4df8: f9447c00     	ldr	x0, [x0, #0x8f8]
  9f4dfc: f9400021     	ldr	x1, [x1]
  9f4e00: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f4e04: f90047a1     	str	x1, [x29, #0x88]
  9f4e08: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f4e0c: 97ffe2ed     	bl	0x9ed9c0 <_ZNSt6thread5_ImplISt12_Bind_simpleIFSt7_Mem_fnIMN7cocos2d9FileUtilsEFbvEEPS4_EEED0Ev+0xd4>
  9f4e10: f9447b02     	ldr	x2, [x24, #0x8f0]
  9f4e14: 52800001     	mov	w1, #0x0                // =0
  9f4e18: f9447700     	ldr	x0, [x24, #0x8e8]
  9f4e1c: d37df042     	lsl	x2, x2, #3
  9f4e20: 97e69844     	bl	0x39af30 <memset@plt>
  9f4e24: f9445b16     	ldr	x22, [x24, #0x8b0]
  9f4e28: f9445f15     	ldr	x21, [x24, #0x8b8]
  9f4e2c: f9047f1f     	str	xzr, [x24, #0x8f8]
  9f4e30: f904831f     	str	xzr, [x24, #0x900]
  9f4e34: eb1502df     	cmp	x22, x21
  9f4e38: 54001420     	b.eq	0x9f50bc <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2e8>
  9f4e3c: aa1603f4     	mov	x20, x22
  9f4e40: b0002ab7     	adrp	x23, 0xf49000
  9f4e44: 910203b3     	add	x19, x29, #0x80
  9f4e48: 90002a9a     	adrp	x26, 0xf44000
  9f4e4c: 14000004     	b	0x9f4e5c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x88>
  9f4e50: 91002294     	add	x20, x20, #0x8
  9f4e54: eb1402bf     	cmp	x21, x20
  9f4e58: 54000280     	b.eq	0x9f4ea8 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0xd4>
  9f4e5c: f9400281     	ldr	x1, [x20]
  9f4e60: f947eee2     	ldr	x2, [x23, #0xfd8]
  9f4e64: d1006020     	sub	x0, x1, #0x18
  9f4e68: eb02001f     	cmp	x0, x2
  9f4e6c: 54ffff20     	b.eq	0x9f4e50 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x7c>
  9f4e70: f9445342     	ldr	x2, [x26, #0x8a0]
  9f4e74: b40011c2     	cbz	x2, 0x9f50ac <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2d8>
  9f4e78: d1002021     	sub	x1, x1, #0x8
  9f4e7c: 885ffc22     	ldaxr	w2, [x1]
  9f4e80: 51000443     	sub	w3, w2, #0x1
  9f4e84: 8804fc23     	stlxr	w4, w3, [x1]
  9f4e88: 35ffffa4     	cbnz	w4, 0x9f4e7c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0xa8>
  9f4e8c: 6b1f005f     	cmp	w2, wzr
  9f4e90: 54fffe0c     	b.gt	0x9f4e50 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x7c>
  9f4e94: aa1303e1     	mov	x1, x19
  9f4e98: 91002294     	add	x20, x20, #0x8
  9f4e9c: 94075648     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4ea0: eb1402bf     	cmp	x21, x20
  9f4ea4: 54fffdc1     	b.ne	0x9f4e5c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x88>
  9f4ea8: f9045f16     	str	x22, [x24, #0x8b8]
  9f4eac: 9122c314     	add	x20, x24, #0x8b0
  9f4eb0: 52800016     	mov	w22, #0x0               // =0
  9f4eb4: f9400335     	ldr	x21, [x25]
  9f4eb8: f9400739     	ldr	x25, [x25, #0x8]
  9f4ebc: eb1902bf     	cmp	x21, x25
  9f4ec0: 54000b20     	b.eq	0x9f5024 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x250>
  9f4ec4: f00013bb     	adrp	x27, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f4ec8: b000139a     	adrp	x26, 0xc65000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x1c10>
  9f4ecc: 9101e3a0     	add	x0, x29, #0x78
  9f4ed0: 9133037b     	add	x27, x27, #0xcc0
  9f4ed4: 913d435a     	add	x26, x26, #0xf50
  9f4ed8: f90037a0     	str	x0, [x29, #0x68]
  9f4edc: 14000024     	b	0x9f4f6c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x198>
  9f4ee0: f9400260     	ldr	x0, [x19]
  9f4ee4: f85e8014     	ldur	x20, [x0, #-0x18]
  9f4ee8: b40001d4     	cbz	x20, 0x9f4f20 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x14c>
  9f4eec: b85f8001     	ldur	w1, [x0, #-0x8]
  9f4ef0: d1000694     	sub	x20, x20, #0x1
  9f4ef4: 37f80081     	tbnz	w1, #0x1f, 0x9f4f04 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x130>
  9f4ef8: aa1303e0     	mov	x0, x19
  9f4efc: 940750f1     	bl	0xbc92c0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4ac98>
  9f4f00: f9400260     	ldr	x0, [x19]
  9f4f04: 38f46800     	ldrsb	w0, [x0, x20]
  9f4f08: 7100bc1f     	cmp	w0, #0x2f
  9f4f0c: 540000a0     	b.eq	0x9f4f20 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x14c>
  9f4f10: aa1303e0     	mov	x0, x19
  9f4f14: aa1a03e1     	mov	x1, x26
  9f4f18: d2800022     	mov	x2, #0x1                // =1
  9f4f1c: 94074b34     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  9f4f20: 9122c314     	add	x20, x24, #0x8b0
  9f4f24: f9400680     	ldr	x0, [x20, #0x8]
  9f4f28: f9400a81     	ldr	x1, [x20, #0x10]
  9f4f2c: eb01001f     	cmp	x0, x1
  9f4f30: 540006a0     	b.eq	0x9f5004 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x230>
  9f4f34: b4000080     	cbz	x0, 0x9f4f44 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x170>
  9f4f38: aa1303e1     	mov	x1, x19
  9f4f3c: 94075681     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f4f40: f9400680     	ldr	x0, [x20, #0x8]
  9f4f44: 91002000     	add	x0, x0, #0x8
  9f4f48: f9000680     	str	x0, [x20, #0x8]
  9f4f4c: f9400261     	ldr	x1, [x19]
  9f4f50: f947eee2     	ldr	x2, [x23, #0xfd8]
  9f4f54: d1006020     	sub	x0, x1, #0x18
  9f4f58: eb02001f     	cmp	x0, x2
  9f4f5c: 540001c1     	b.ne	0x9f4f94 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x1c0>
  9f4f60: 910022b5     	add	x21, x21, #0x8
  9f4f64: eb15033f     	cmp	x25, x21
  9f4f68: 54000340     	b.eq	0x9f4fd0 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x1fc>
  9f4f6c: aa1303e0     	mov	x0, x19
  9f4f70: aa1503e1     	mov	x1, x21
  9f4f74: 94075673     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f4f78: 35fffb56     	cbnz	w22, 0x9f4ee0 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x10c>
  9f4f7c: aa1303e0     	mov	x0, x19
  9f4f80: aa1b03e1     	mov	x1, x27
  9f4f84: 94074f9d     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f4f88: 6b1f001f     	cmp	w0, wzr
  9f4f8c: 1a9f17f6     	cset	w22, eq
  9f4f90: 17ffffd4     	b	0x9f4ee0 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x10c>
  9f4f94: 90002a82     	adrp	x2, 0xf44000
  9f4f98: f9445042     	ldr	x2, [x2, #0x8a0]
  9f4f9c: b40003c2     	cbz	x2, 0x9f5014 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x240>
  9f4fa0: d1002021     	sub	x1, x1, #0x8
  9f4fa4: 885ffc22     	ldaxr	w2, [x1]
  9f4fa8: 51000443     	sub	w3, w2, #0x1
  9f4fac: 8804fc23     	stlxr	w4, w3, [x1]
  9f4fb0: 35ffffa4     	cbnz	w4, 0x9f4fa4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x1d0>
  9f4fb4: 6b1f005f     	cmp	w2, wzr
  9f4fb8: 54fffd4c     	b.gt	0x9f4f60 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x18c>
  9f4fbc: f94037a1     	ldr	x1, [x29, #0x68]
  9f4fc0: 910022b5     	add	x21, x21, #0x8
  9f4fc4: 940755fe     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f4fc8: eb15033f     	cmp	x25, x21
  9f4fcc: 54fffd01     	b.ne	0x9f4f6c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x198>
  9f4fd0: 340002b6     	cbz	w22, 0x9f5024 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x250>
  9f4fd4: f940e79c     	ldr	x28, [x28, #0x1c8]
  9f4fd8: f94047a1     	ldr	x1, [x29, #0x88]
  9f4fdc: f9400380     	ldr	x0, [x28]
  9f4fe0: eb00003f     	cmp	x1, x0
  9f4fe4: 540009c1     	b.ne	0x9f511c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x348>
  9f4fe8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f4fec: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f4ff0: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f4ff4: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f4ff8: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f4ffc: a8c97bfd     	ldp	x29, x30, [sp], #0x90
  9f5000: d65f03c0     	ret
  9f5004: aa1403e0     	mov	x0, x20
  9f5008: aa1303e1     	mov	x1, x19
  9f500c: 97e6c877     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f5010: 17ffffcf     	b	0x9f4f4c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x178>
  9f5014: b85f8022     	ldur	w2, [x1, #-0x8]
  9f5018: 51000443     	sub	w3, w2, #0x1
  9f501c: b81f8023     	stur	w3, [x1, #-0x8]
  9f5020: 17ffffe5     	b	0x9f4fb4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x1e0>
  9f5024: d00013a1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f5028: aa1303e0     	mov	x0, x19
  9f502c: 91330021     	add	x1, x1, #0xcc0
  9f5030: 9101c3a2     	add	x2, x29, #0x70
  9f5034: 940747e7     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f5038: f9400680     	ldr	x0, [x20, #0x8]
  9f503c: f9400a81     	ldr	x1, [x20, #0x10]
  9f5040: eb01001f     	cmp	x0, x1
  9f5044: 54000460     	b.eq	0x9f50d0 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2fc>
  9f5048: b4000400     	cbz	x0, 0x9f50c8 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2f4>
  9f504c: f9400261     	ldr	x1, [x19]
  9f5050: f9000001     	str	x1, [x0]
  9f5054: f947eef5     	ldr	x21, [x23, #0xfd8]
  9f5058: 910062b5     	add	x21, x21, #0x18
  9f505c: f9000275     	str	x21, [x19]
  9f5060: 91002000     	add	x0, x0, #0x8
  9f5064: f9000680     	str	x0, [x20, #0x8]
  9f5068: f947eef7     	ldr	x23, [x23, #0xfd8]
  9f506c: d10062a0     	sub	x0, x21, #0x18
  9f5070: eb17001f     	cmp	x0, x23
  9f5074: 54fffb00     	b.eq	0x9f4fd4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x200>
  9f5078: f0002a61     	adrp	x1, 0xf44000
  9f507c: f9445021     	ldr	x1, [x1, #0x8a0]
  9f5080: b4000321     	cbz	x1, 0x9f50e4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x310>
  9f5084: d10022b5     	sub	x21, x21, #0x8
  9f5088: 885ffea1     	ldaxr	w1, [x21]
  9f508c: 51000422     	sub	w2, w1, #0x1
  9f5090: 8803fea2     	stlxr	w3, w2, [x21]
  9f5094: 35ffffa3     	cbnz	w3, 0x9f5088 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2b4>
  9f5098: 6b1f003f     	cmp	w1, wzr
  9f509c: 54fff9cc     	b.gt	0x9f4fd4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x200>
  9f50a0: 9101e3a1     	add	x1, x29, #0x78
  9f50a4: 940755c6     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f50a8: 17ffffcb     	b	0x9f4fd4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x200>
  9f50ac: b85f8022     	ldur	w2, [x1, #-0x8]
  9f50b0: 51000443     	sub	w3, w2, #0x1
  9f50b4: b81f8023     	stur	w3, [x1, #-0x8]
  9f50b8: 17ffff75     	b	0x9f4e8c <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0xb8>
  9f50bc: 90002ab7     	adrp	x23, 0xf49000
  9f50c0: 910203b3     	add	x19, x29, #0x80
  9f50c4: 17ffff79     	b	0x9f4ea8 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0xd4>
  9f50c8: f9400275     	ldr	x21, [x19]
  9f50cc: 17ffffe5     	b	0x9f5060 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x28c>
  9f50d0: aa1403e0     	mov	x0, x20
  9f50d4: aa1303e1     	mov	x1, x19
  9f50d8: 97e6c9fc     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  9f50dc: f94043b5     	ldr	x21, [x29, #0x80]
  9f50e0: 17ffffe2     	b	0x9f5068 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x294>
  9f50e4: b85f82a1     	ldur	w1, [x21, #-0x8]
  9f50e8: 51000422     	sub	w2, w1, #0x1
  9f50ec: b81f82a2     	stur	w2, [x21, #-0x8]
  9f50f0: 17ffffea     	b	0x9f5098 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x2c4>
  9f50f4: aa0003f3     	mov	x19, x0
  9f50f8: f94043a0     	ldr	x0, [x29, #0x80]
  9f50fc: f947eef7     	ldr	x23, [x23, #0xfd8]
  9f5100: d1006000     	sub	x0, x0, #0x18
  9f5104: eb17001f     	cmp	x0, x23
  9f5108: 54000060     	b.eq	0x9f5114 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x340>
  9f510c: 9101e3a1     	add	x1, x29, #0x78
  9f5110: 97e6a8dc     	bl	0x39f480 <.text+0x3170>
  9f5114: aa1303e0     	mov	x0, x19
  9f5118: 9407b772     	bl	0xbe2ee0 <_Unwind_Resume>
  9f511c: 97e698a1     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f5120: 17fffff5     	b	0x9f50f4 <_ZN7cocos2d9FileUtils25setSearchResolutionsOrderERKSt6vectorISsSaISsEE+0x320>

00000000009f5124 <_ZN7cocos2d9FileUtils15createDirectoryERKSs>:
  9f5124: f0002a43     	adrp	x3, 0xf40000
  9f5128: a9b57bfd     	stp	x29, x30, [sp, #-0xb0]!
  9f512c: 910003fd     	mov	x29, sp
  9f5130: f9400002     	ldr	x2, [x0]
  9f5134: f940e463     	ldr	x3, [x3, #0x1c8]
  9f5138: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f513c: f9408442     	ldr	x2, [x2, #0x108]
  9f5140: aa0103f6     	mov	x22, x1
  9f5144: f9400063     	ldr	x3, [x3]
  9f5148: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f514c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f5150: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f5154: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f5158: f90057a3     	str	x3, [x29, #0xa8]
  9f515c: d63f0040     	blr	x2
  9f5160: 53001c1c     	uxtb	w28, w0
  9f5164: 340001fc     	cbz	w28, 0x9f51a0 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x7c>
  9f5168: f0002a40     	adrp	x0, 0xf40000
  9f516c: f94057b3     	ldr	x19, [x29, #0xa8]
  9f5170: f940e401     	ldr	x1, [x0, #0x1c8]
  9f5174: 2a1c03e0     	mov	w0, w28
  9f5178: f9400021     	ldr	x1, [x1]
  9f517c: eb01027f     	cmp	x19, x1
  9f5180: 54002301     	b.ne	0x9f55e0 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x4bc>
  9f5184: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f5188: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f518c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f5190: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f5194: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f5198: a8cb7bfd     	ldp	x29, x30, [sp], #0xb0
  9f519c: d65f03c0     	ret
  9f51a0: d000135b     	adrp	x27, 0xc5f000 <_ZTSN7GameNet20TcpMessageDisconnectE+0x10>
  9f51a4: 90002aba     	adrp	x26, 0xf49000
  9f51a8: 9124837b     	add	x27, x27, #0x920
  9f51ac: aa1603e0     	mov	x0, x22
  9f51b0: aa1b03e1     	mov	x1, x27
  9f51b4: d2800002     	mov	x2, #0x0                // =0
  9f51b8: d2800043     	mov	x3, #0x2                // =2
  9f51bc: 9101e3b5     	add	x21, x29, #0x78
  9f51c0: 94074cce     	bl	0xbc84f8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49ed0>
  9f51c4: aa0003f7     	mov	x23, x0
  9f51c8: f947ef40     	ldr	x0, [x26, #0xfd8]
  9f51cc: b10006ff     	cmn	x23, #0x1
  9f51d0: f9004bbf     	str	xzr, [x29, #0x90]
  9f51d4: 91006000     	add	x0, x0, #0x18
  9f51d8: f9004fbf     	str	xzr, [x29, #0x98]
  9f51dc: f9003fa0     	str	x0, [x29, #0x78]
  9f51e0: f90053bf     	str	xzr, [x29, #0xa0]
  9f51e4: 54000d80     	b.eq	0x9f5394 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x270>
  9f51e8: 910223a0     	add	x0, x29, #0x88
  9f51ec: 910006e3     	add	x3, x23, #0x1
  9f51f0: d2800013     	mov	x19, #0x0               // =0
  9f51f4: 910203b8     	add	x24, x29, #0x80
  9f51f8: 9101e3b4     	add	x20, x29, #0x78
  9f51fc: f90037a0     	str	x0, [x29, #0x68]
  9f5200: 910243b9     	add	x25, x29, #0x90
  9f5204: 1400001d     	b	0x9f5278 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x154>
  9f5208: f9400280     	ldr	x0, [x20]
  9f520c: f85e8000     	ldur	x0, [x0, #-0x18]
  9f5210: b4000160     	cbz	x0, 0x9f523c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x118>
  9f5214: f9400720     	ldr	x0, [x25, #0x8]
  9f5218: f9400b21     	ldr	x1, [x25, #0x10]
  9f521c: eb01001f     	cmp	x0, x1
  9f5220: 54000600     	b.eq	0x9f52e0 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x1bc>
  9f5224: b4000080     	cbz	x0, 0x9f5234 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x110>
  9f5228: aa1403e1     	mov	x1, x20
  9f522c: 940755c5     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f5230: f9400720     	ldr	x0, [x25, #0x8]
  9f5234: 91002000     	add	x0, x0, #0x8
  9f5238: f9000720     	str	x0, [x25, #0x8]
  9f523c: 910006f3     	add	x19, x23, #0x1
  9f5240: aa1603e0     	mov	x0, x22
  9f5244: aa1b03e1     	mov	x1, x27
  9f5248: aa1303e2     	mov	x2, x19
  9f524c: d2800043     	mov	x3, #0x2                // =2
  9f5250: 94074caa     	bl	0xbc84f8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49ed0>
  9f5254: aa0003e4     	mov	x4, x0
  9f5258: f94002c0     	ldr	x0, [x22]
  9f525c: b100049f     	cmn	x4, #0x1
  9f5260: 54000500     	b.eq	0x9f5300 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x1dc>
  9f5264: f85e8005     	ldur	x5, [x0, #-0x18]
  9f5268: cb170083     	sub	x3, x4, x23
  9f526c: eb1300bf     	cmp	x5, x19
  9f5270: 540015e3     	b.lo	0x9f552c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x408>
  9f5274: aa0403f7     	mov	x23, x4
  9f5278: aa1803e0     	mov	x0, x24
  9f527c: aa1603e1     	mov	x1, x22
  9f5280: aa1303e2     	mov	x2, x19
  9f5284: 94074646     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9f5288: aa1403e0     	mov	x0, x20
  9f528c: aa1803e1     	mov	x1, x24
  9f5290: aa1403f5     	mov	x21, x20
  9f5294: 94074b56     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9f5298: f9400301     	ldr	x1, [x24]
  9f529c: f947ef42     	ldr	x2, [x26, #0xfd8]
  9f52a0: d1006020     	sub	x0, x1, #0x18
  9f52a4: eb02001f     	cmp	x0, x2
  9f52a8: 54fffb00     	b.eq	0x9f5208 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0xe4>
  9f52ac: f0002a62     	adrp	x2, 0xf44000
  9f52b0: f9445042     	ldr	x2, [x2, #0x8a0]
  9f52b4: b40001e2     	cbz	x2, 0x9f52f0 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x1cc>
  9f52b8: d1002021     	sub	x1, x1, #0x8
  9f52bc: 885ffc22     	ldaxr	w2, [x1]
  9f52c0: 51000443     	sub	w3, w2, #0x1
  9f52c4: 8804fc23     	stlxr	w4, w3, [x1]
  9f52c8: 35ffffa4     	cbnz	w4, 0x9f52bc <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x198>
  9f52cc: 6b1f005f     	cmp	w2, wzr
  9f52d0: 54fff9cc     	b.gt	0x9f5208 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0xe4>
  9f52d4: f94037a1     	ldr	x1, [x29, #0x68]
  9f52d8: 94075539     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f52dc: 17ffffcb     	b	0x9f5208 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0xe4>
  9f52e0: aa1903e0     	mov	x0, x25
  9f52e4: aa1403e1     	mov	x1, x20
  9f52e8: 97e6c7c0     	bl	0x3a71e8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJRKSsEEEvDpOT_>
  9f52ec: 17ffffd4     	b	0x9f523c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x118>
  9f52f0: b85f8022     	ldur	w2, [x1, #-0x8]
  9f52f4: 51000443     	sub	w3, w2, #0x1
  9f52f8: b81f8023     	stur	w3, [x1, #-0x8]
  9f52fc: 17fffff4     	b	0x9f52cc <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x1a8>
  9f5300: f85e8000     	ldur	x0, [x0, #-0x18]
  9f5304: eb13001f     	cmp	x0, x19
  9f5308: 54000469     	b.ls	0x9f5394 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x270>
  9f530c: 910223b4     	add	x20, x29, #0x88
  9f5310: aa1603e1     	mov	x1, x22
  9f5314: aa1403e0     	mov	x0, x20
  9f5318: aa1303e2     	mov	x2, x19
  9f531c: aa0403e3     	mov	x3, x4
  9f5320: 9407461f     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  9f5324: f9404fa0     	ldr	x0, [x29, #0x98]
  9f5328: f94053a1     	ldr	x1, [x29, #0xa0]
  9f532c: eb01001f     	cmp	x0, x1
  9f5330: 54000ee0     	b.eq	0x9f550c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3e8>
  9f5334: f94047a1     	ldr	x1, [x29, #0x88]
  9f5338: b40000a0     	cbz	x0, 0x9f534c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x228>
  9f533c: f9000001     	str	x1, [x0]
  9f5340: f947ef41     	ldr	x1, [x26, #0xfd8]
  9f5344: 91006021     	add	x1, x1, #0x18
  9f5348: f90047a1     	str	x1, [x29, #0x88]
  9f534c: 91002000     	add	x0, x0, #0x8
  9f5350: f9004fa0     	str	x0, [x29, #0x98]
  9f5354: f947ef42     	ldr	x2, [x26, #0xfd8]
  9f5358: d1006020     	sub	x0, x1, #0x18
  9f535c: eb02001f     	cmp	x0, x2
  9f5360: 540001a0     	b.eq	0x9f5394 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x270>
  9f5364: f0002a62     	adrp	x2, 0xf44000
  9f5368: f9445042     	ldr	x2, [x2, #0x8a0]
  9f536c: b40010e2     	cbz	x2, 0x9f5588 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x464>
  9f5370: d1002021     	sub	x1, x1, #0x8
  9f5374: 885ffc22     	ldaxr	w2, [x1]
  9f5378: 51000443     	sub	w3, w2, #0x1
  9f537c: 8804fc23     	stlxr	w4, w3, [x1]
  9f5380: 35ffffa4     	cbnz	w4, 0x9f5374 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x250>
  9f5384: 6b1f005f     	cmp	w2, wzr
  9f5388: 5400006c     	b.gt	0x9f5394 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x270>
  9f538c: aa1803e1     	mov	x1, x24
  9f5390: 9407550b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f5394: d00013a1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f5398: aa1503e0     	mov	x0, x21
  9f539c: 91330021     	add	x1, x1, #0xcc0
  9f53a0: d2800002     	mov	x2, #0x0                // =0
  9f53a4: 94075080     	bl	0xbc95a4 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4af7c>
  9f53a8: f9404ba1     	ldr	x1, [x29, #0x90]
  9f53ac: f9404fb4     	ldr	x20, [x29, #0x98]
  9f53b0: cb010280     	sub	x0, x20, x1
  9f53b4: 9343fc00     	asr	x0, x0, #3
  9f53b8: b4000b40     	cbz	x0, 0x9f5520 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3fc>
  9f53bc: d2800013     	mov	x19, #0x0               // =0
  9f53c0: 14000008     	b	0x9f53e0 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x2bc>
  9f53c4: 97e6969f     	bl	0x39ae40 <closedir@plt>
  9f53c8: f9404ba1     	ldr	x1, [x29, #0x90]
  9f53cc: 91000673     	add	x19, x19, #0x1
  9f53d0: f9404fa0     	ldr	x0, [x29, #0x98]
  9f53d4: cb010002     	sub	x2, x0, x1
  9f53d8: eb820e7f     	cmp	x19, x2, asr #3
  9f53dc: 54000242     	b.hs	0x9f5424 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x300>
  9f53e0: aa1503e0     	mov	x0, x21
  9f53e4: 8b130c21     	add	x1, x1, x19, lsl #3
  9f53e8: 94074991     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9f53ec: f94002a0     	ldr	x0, [x21]
  9f53f0: 97e69b10     	bl	0x39c030 <opendir@plt>
  9f53f4: b5fffe80     	cbnz	x0, 0x9f53c4 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x2a0>
  9f53f8: f94002a0     	ldr	x0, [x21]
  9f53fc: 52803fe1     	mov	w1, #0x1ff              // =511
  9f5400: 97e695fc     	bl	0x39abf0 <mkdir@plt>
  9f5404: 34fffe20     	cbz	w0, 0x9f53c8 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x2a4>
  9f5408: 97e69a7e     	bl	0x39be00 <__errno@plt>
  9f540c: b9400000     	ldr	w0, [x0]
  9f5410: 7100441f     	cmp	w0, #0x11
  9f5414: 54fffda0     	b.eq	0x9f53c8 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x2a4>
  9f5418: f9404fb4     	ldr	x20, [x29, #0x98]
  9f541c: f9404bb5     	ldr	x21, [x29, #0x90]
  9f5420: 14000004     	b	0x9f5430 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x30c>
  9f5424: aa0003f4     	mov	x20, x0
  9f5428: aa0103f5     	mov	x21, x1
  9f542c: 5280003c     	mov	w28, #0x1               // =1
  9f5430: eb1402bf     	cmp	x21, x20
  9f5434: 54000320     	b.eq	0x9f5498 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x374>
  9f5438: f0002a73     	adrp	x19, 0xf44000
  9f543c: 910223b6     	add	x22, x29, #0x88
  9f5440: 14000004     	b	0x9f5450 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x32c>
  9f5444: 910022b5     	add	x21, x21, #0x8
  9f5448: eb15029f     	cmp	x20, x21
  9f544c: 54000240     	b.eq	0x9f5494 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x370>
  9f5450: f94002a1     	ldr	x1, [x21]
  9f5454: f947ef42     	ldr	x2, [x26, #0xfd8]
  9f5458: d1006020     	sub	x0, x1, #0x18
  9f545c: eb02001f     	cmp	x0, x2
  9f5460: 54ffff20     	b.eq	0x9f5444 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x320>
  9f5464: f9445262     	ldr	x2, [x19, #0x8a0]
  9f5468: b4000422     	cbz	x2, 0x9f54ec <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3c8>
  9f546c: d1002021     	sub	x1, x1, #0x8
  9f5470: 885ffc22     	ldaxr	w2, [x1]
  9f5474: 51000443     	sub	w3, w2, #0x1
  9f5478: 8804fc23     	stlxr	w4, w3, [x1]
  9f547c: 35ffffa4     	cbnz	w4, 0x9f5470 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x34c>
  9f5480: 6b1f005f     	cmp	w2, wzr
  9f5484: 54fffe0c     	b.gt	0x9f5444 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x320>
  9f5488: aa1603e1     	mov	x1, x22
  9f548c: 940754cc     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f5490: 17ffffed     	b	0x9f5444 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x320>
  9f5494: f9404bb4     	ldr	x20, [x29, #0x90]
  9f5498: b4000074     	cbz	x20, 0x9f54a4 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x380>
  9f549c: aa1403e0     	mov	x0, x20
  9f54a0: 94061a9a     	bl	0xb7bf08 <_ZdlPv>
  9f54a4: f9403fb3     	ldr	x19, [x29, #0x78]
  9f54a8: f947ef5a     	ldr	x26, [x26, #0xfd8]
  9f54ac: d1006260     	sub	x0, x19, #0x18
  9f54b0: eb1a001f     	cmp	x0, x26
  9f54b4: 54ffe5a0     	b.eq	0x9f5168 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x44>
  9f54b8: f0002a61     	adrp	x1, 0xf44000
  9f54bc: f9445021     	ldr	x1, [x1, #0x8a0]
  9f54c0: b40001e1     	cbz	x1, 0x9f54fc <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3d8>
  9f54c4: d1002273     	sub	x19, x19, #0x8
  9f54c8: 885ffe61     	ldaxr	w1, [x19]
  9f54cc: 51000422     	sub	w2, w1, #0x1
  9f54d0: 8803fe62     	stlxr	w3, w2, [x19]
  9f54d4: 35ffffa3     	cbnz	w3, 0x9f54c8 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3a4>
  9f54d8: 6b1f003f     	cmp	w1, wzr
  9f54dc: 54ffe46c     	b.gt	0x9f5168 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x44>
  9f54e0: 910243a1     	add	x1, x29, #0x90
  9f54e4: 940754b6     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f54e8: 17ffff20     	b	0x9f5168 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x44>
  9f54ec: b85f8022     	ldur	w2, [x1, #-0x8]
  9f54f0: 51000443     	sub	w3, w2, #0x1
  9f54f4: b81f8023     	stur	w3, [x1, #-0x8]
  9f54f8: 17ffffe2     	b	0x9f5480 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x35c>
  9f54fc: b85f8261     	ldur	w1, [x19, #-0x8]
  9f5500: 51000422     	sub	w2, w1, #0x1
  9f5504: b81f8262     	stur	w2, [x19, #-0x8]
  9f5508: 17fffff4     	b	0x9f54d8 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x3b4>
  9f550c: 910243a0     	add	x0, x29, #0x90
  9f5510: aa1403e1     	mov	x1, x20
  9f5514: 97e6c8ed     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  9f5518: f94047a1     	ldr	x1, [x29, #0x88]
  9f551c: 17ffff8e     	b	0x9f5354 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x230>
  9f5520: aa0103f5     	mov	x21, x1
  9f5524: 5280003c     	mov	w28, #0x1               // =1
  9f5528: 17ffffc2     	b	0x9f5430 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x30c>
  9f552c: f0000f60     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9f5530: f0000f61     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  9f5534: 912f0000     	add	x0, x0, #0xbc0
  9f5538: 912fe021     	add	x1, x1, #0xbf8
  9f553c: aa1303e2     	mov	x2, x19
  9f5540: aa0503e3     	mov	x3, x5
  9f5544: 94073fd5     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>
  9f5548: aa0003f3     	mov	x19, x0
  9f554c: f9404ba0     	ldr	x0, [x29, #0x90]
  9f5550: f9404fa1     	ldr	x1, [x29, #0x98]
  9f5554: 97e6a7db     	bl	0x39f4c0 <.text+0x31b0>
  9f5558: f9404ba0     	ldr	x0, [x29, #0x90]
  9f555c: b4000040     	cbz	x0, 0x9f5564 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x440>
  9f5560: 94061a6a     	bl	0xb7bf08 <_ZdlPv>
  9f5564: f9403fa0     	ldr	x0, [x29, #0x78]
  9f5568: f947ef5a     	ldr	x26, [x26, #0xfd8]
  9f556c: d1006000     	sub	x0, x0, #0x18
  9f5570: eb1a001f     	cmp	x0, x26
  9f5574: 54000060     	b.eq	0x9f5580 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x45c>
  9f5578: 910243a1     	add	x1, x29, #0x90
  9f557c: 97e6a7c1     	bl	0x39f480 <.text+0x3170>
  9f5580: aa1303e0     	mov	x0, x19
  9f5584: 9407b657     	bl	0xbe2ee0 <_Unwind_Resume>
  9f5588: b85f8022     	ldur	w2, [x1, #-0x8]
  9f558c: 51000443     	sub	w3, w2, #0x1
  9f5590: b81f8023     	stur	w3, [x1, #-0x8]
  9f5594: 17ffff7c     	b	0x9f5384 <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x260>
  9f5598: aa0003f3     	mov	x19, x0
  9f559c: f94047a0     	ldr	x0, [x29, #0x88]
  9f55a0: f947ef41     	ldr	x1, [x26, #0xfd8]
  9f55a4: d1006000     	sub	x0, x0, #0x18
  9f55a8: eb01001f     	cmp	x0, x1
  9f55ac: 54fffd00     	b.eq	0x9f554c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x428>
  9f55b0: aa1803e1     	mov	x1, x24
  9f55b4: 97e6a7b3     	bl	0x39f480 <.text+0x3170>
  9f55b8: 17ffffe5     	b	0x9f554c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x428>
  9f55bc: aa0003f3     	mov	x19, x0
  9f55c0: f94043a0     	ldr	x0, [x29, #0x80]
  9f55c4: f947ef41     	ldr	x1, [x26, #0xfd8]
  9f55c8: d1006000     	sub	x0, x0, #0x18
  9f55cc: eb01001f     	cmp	x0, x1
  9f55d0: 54fffbe0     	b.eq	0x9f554c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x428>
  9f55d4: 910223a1     	add	x1, x29, #0x88
  9f55d8: 97e6a7aa     	bl	0x39f480 <.text+0x3170>
  9f55dc: 17ffffdc     	b	0x9f554c <_ZN7cocos2d9FileUtils15createDirectoryERKSs+0x428>
  9f55e0: 97e69770     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f55e4 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs>:
  9f55e4: a9ba7bfd     	stp	x29, x30, [sp, #-0x60]!
  9f55e8: d28d20e2     	mov	x2, #0x6907             // =26887
  9f55ec: 910003fd     	mov	x29, sp
  9f55f0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f55f4: f0002a53     	adrp	x19, 0xf40000
  9f55f8: 90002ab4     	adrp	x20, 0xf49000
  9f55fc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f5600: aa0103f6     	mov	x22, x1
  9f5604: f9001bf7     	str	x23, [sp, #0x30]
  9f5608: f940e661     	ldr	x1, [x19, #0x1c8]
  9f560c: aa0003f7     	mov	x23, x0
  9f5610: f947ee80     	ldr	x0, [x20, #0xfd8]
  9f5614: f2b8e1e2     	movk	x2, #0xc70f, lsl #16
  9f5618: aa0803f5     	mov	x21, x8
  9f561c: f9400021     	ldr	x1, [x1]
  9f5620: 91006000     	add	x0, x0, #0x18
  9f5624: f9000100     	str	x0, [x8]
  9f5628: f9002fa1     	str	x1, [x29, #0x58]
  9f562c: f94002c0     	ldr	x0, [x22]
  9f5630: f85e8001     	ldur	x1, [x0, #-0x18]
  9f5634: 94062093     	bl	0xb7d880 <_ZN9__gnu_cxx20recursive_init_errorD0Ev+0x24>
  9f5638: aa0003e4     	mov	x4, x0
  9f563c: f94442e1     	ldr	x1, [x23, #0x880]
  9f5640: 9121e2e0     	add	x0, x23, #0x878
  9f5644: aa1603e2     	mov	x2, x22
  9f5648: aa0403e3     	mov	x3, x4
  9f564c: 9ac10885     	udiv	x5, x4, x1
  9f5650: 9b0190a1     	msub	x1, x5, x1, x4
  9f5654: 97ee53db     	bl	0x58a5c0 <_ZNKSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEE19_M_find_before_nodeEmRS1_m>
  9f5658: b4000340     	cbz	x0, 0x9f56c0 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xdc>
  9f565c: f9400000     	ldr	x0, [x0]
  9f5660: b4000300     	cbz	x0, 0x9f56c0 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xdc>
  9f5664: 910143b6     	add	x22, x29, #0x50
  9f5668: 91004000     	add	x0, x0, #0x10
  9f566c: aa1603e8     	mov	x8, x22
  9f5670: 940105f3     	bl	0xa36e3c <_ZNK7cocos2d5Value8asStringEv>
  9f5674: aa1503e0     	mov	x0, x21
  9f5678: aa1603e1     	mov	x1, x22
  9f567c: 94074a5c     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9f5680: f9402ba1     	ldr	x1, [x29, #0x50]
  9f5684: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f5688: d1006020     	sub	x0, x1, #0x18
  9f568c: eb14001f     	cmp	x0, x20
  9f5690: 54000201     	b.ne	0x9f56d0 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xec>
  9f5694: f940e673     	ldr	x19, [x19, #0x1c8]
  9f5698: aa1503e0     	mov	x0, x21
  9f569c: f9402fa2     	ldr	x2, [x29, #0x58]
  9f56a0: f9400261     	ldr	x1, [x19]
  9f56a4: eb01005f     	cmp	x2, x1
  9f56a8: 54000361     	b.ne	0x9f5714 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x130>
  9f56ac: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f56b0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f56b4: f9401bf7     	ldr	x23, [sp, #0x30]
  9f56b8: a8c67bfd     	ldp	x29, x30, [sp], #0x60
  9f56bc: d65f03c0     	ret
  9f56c0: aa1503e0     	mov	x0, x21
  9f56c4: aa1603e1     	mov	x1, x22
  9f56c8: 940754fe     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  9f56cc: 17fffff2     	b	0x9f5694 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xb0>
  9f56d0: f0002a62     	adrp	x2, 0xf44000
  9f56d4: f9445042     	ldr	x2, [x2, #0x8a0]
  9f56d8: b4000162     	cbz	x2, 0x9f5704 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x120>
  9f56dc: d1002021     	sub	x1, x1, #0x8
  9f56e0: 885ffc22     	ldaxr	w2, [x1]
  9f56e4: 51000443     	sub	w3, w2, #0x1
  9f56e8: 8804fc23     	stlxr	w4, w3, [x1]
  9f56ec: 35ffffa4     	cbnz	w4, 0x9f56e0 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xfc>
  9f56f0: 6b1f005f     	cmp	w2, wzr
  9f56f4: 54fffd0c     	b.gt	0x9f5694 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xb0>
  9f56f8: 910123a1     	add	x1, x29, #0x48
  9f56fc: 94075430     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f5700: 17ffffe5     	b	0x9f5694 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0xb0>
  9f5704: b85f8022     	ldur	w2, [x1, #-0x8]
  9f5708: 51000443     	sub	w3, w2, #0x1
  9f570c: b81f8023     	stur	w3, [x1, #-0x8]
  9f5710: 17fffff8     	b	0x9f56f0 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x10c>
  9f5714: 97e69723     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f5718: aa0003f3     	mov	x19, x0
  9f571c: f9402ba0     	ldr	x0, [x29, #0x50]
  9f5720: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f5724: d1006000     	sub	x0, x0, #0x18
  9f5728: eb01001f     	cmp	x0, x1
  9f572c: 54000060     	b.eq	0x9f5738 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x154>
  9f5730: 910123a1     	add	x1, x29, #0x48
  9f5734: 97e6a753     	bl	0x39f480 <.text+0x3170>
  9f5738: f94002a0     	ldr	x0, [x21]
  9f573c: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f5740: d1006000     	sub	x0, x0, #0x18
  9f5744: eb14001f     	cmp	x0, x20
  9f5748: 54000060     	b.eq	0x9f5754 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x170>
  9f574c: 910123a1     	add	x1, x29, #0x48
  9f5750: 97e6a74c     	bl	0x39f480 <.text+0x3170>
  9f5754: aa1303e0     	mov	x0, x19
  9f5758: 9407b5e2     	bl	0xbe2ee0 <_Unwind_Resume>
  9f575c: aa0003f3     	mov	x19, x0
  9f5760: 17fffff6     	b	0x9f5738 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs+0x154>

00000000009f5764 <_ZN7cocos2d9DictMaker10endElementEPvPKc>:
  9f5764: a9b07bfd     	stp	x29, x30, [sp, #-0x100]!
  9f5768: aa0203e1     	mov	x1, x2
  9f576c: 910003fd     	mov	x29, sp
  9f5770: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f5774: f0002a54     	adrp	x20, 0xf40000
  9f5778: aa0003f3     	mov	x19, x0
  9f577c: f940ac00     	ldr	x0, [x0, #0x158]
  9f5780: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f5784: f940e683     	ldr	x3, [x20, #0x1c8]
  9f5788: f9409e62     	ldr	x2, [x19, #0x138]
  9f578c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f5790: f9400063     	ldr	x3, [x3]
  9f5794: eb02001f     	cmp	x0, x2
  9f5798: f9007fa3     	str	x3, [x29, #0xf8]
  9f579c: 54000d60     	b.eq	0x9f5948 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1e4>
  9f57a0: f940b262     	ldr	x2, [x19, #0x160]
  9f57a4: f940ba63     	ldr	x3, [x19, #0x170]
  9f57a8: eb02001f     	cmp	x0, x2
  9f57ac: 54000c80     	b.eq	0x9f593c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1d8>
  9f57b0: b85fc017     	ldur	w23, [x0, #-0x4]
  9f57b4: 910143b6     	add	x22, x29, #0x50
  9f57b8: 9103a3b5     	add	x21, x29, #0xe8
  9f57bc: aa1603e0     	mov	x0, x22
  9f57c0: aa1503e2     	mov	x2, x21
  9f57c4: 94074603     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f57c8: d0001381     	adrp	x1, 0xc67000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x3c10>
  9f57cc: aa1603e0     	mov	x0, x22
  9f57d0: 91354021     	add	x1, x1, #0xd50
  9f57d4: 94074d89     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f57d8: 35000520     	cbnz	w0, 0x9f587c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x118>
  9f57dc: 9104a276     	add	x22, x19, #0x128
  9f57e0: f9401ac0     	ldr	x0, [x22, #0x30]
  9f57e4: f9401ec1     	ldr	x1, [x22, #0x38]
  9f57e8: eb01001f     	cmp	x0, x1
  9f57ec: 54000fc0     	b.eq	0x9f59e4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x280>
  9f57f0: d1001000     	sub	x0, x0, #0x4
  9f57f4: f9001ac0     	str	x0, [x22, #0x30]
  9f57f8: 91022276     	add	x22, x19, #0x88
  9f57fc: f9401ac0     	ldr	x0, [x22, #0x30]
  9f5800: f9401ec1     	ldr	x1, [x22, #0x38]
  9f5804: eb01001f     	cmp	x0, x1
  9f5808: 54001040     	b.eq	0x9f5a10 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x2ac>
  9f580c: d1002000     	sub	x0, x0, #0x8
  9f5810: f9001ac0     	str	x0, [x22, #0x30]
  9f5814: f9404e61     	ldr	x1, [x19, #0x98]
  9f5818: eb00003f     	cmp	x1, x0
  9f581c: 540000e0     	b.eq	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5820: f9406262     	ldr	x2, [x19, #0xc0]
  9f5824: f9406a61     	ldr	x1, [x19, #0xd0]
  9f5828: eb00005f     	cmp	x2, x0
  9f582c: 54000920     	b.eq	0x9f5950 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1ec>
  9f5830: f85f8000     	ldur	x0, [x0, #-0x8]
  9f5834: f9003e60     	str	x0, [x19, #0x78]
  9f5838: 90002aa1     	adrp	x1, 0xf49000
  9f583c: b900727f     	str	wzr, [x19, #0x70]
  9f5840: f9402ba2     	ldr	x2, [x29, #0x50]
  9f5844: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f5848: d1006040     	sub	x0, x2, #0x18
  9f584c: eb01001f     	cmp	x0, x1
  9f5850: 540005c1     	b.ne	0x9f5908 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1a4>
  9f5854: f940e694     	ldr	x20, [x20, #0x1c8]
  9f5858: f9407fa1     	ldr	x1, [x29, #0xf8]
  9f585c: f9400280     	ldr	x0, [x20]
  9f5860: eb00003f     	cmp	x1, x0
  9f5864: 540020a1     	b.ne	0x9f5c78 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x514>
  9f5868: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f586c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f5870: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f5874: a8d07bfd     	ldp	x29, x30, [sp], #0x100
  9f5878: d65f03c0     	ret
  9f587c: b0001341     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9f5880: aa1603e0     	mov	x0, x22
  9f5884: 91280021     	add	x1, x1, #0xa00
  9f5888: 94074d5c     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f588c: 35000680     	cbnz	w0, 0x9f595c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1f8>
  9f5890: 9104a276     	add	x22, x19, #0x128
  9f5894: f9401ac0     	ldr	x0, [x22, #0x30]
  9f5898: f9401ec1     	ldr	x1, [x22, #0x38]
  9f589c: eb01001f     	cmp	x0, x1
  9f58a0: 540008c0     	b.eq	0x9f59b8 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x254>
  9f58a4: d1001000     	sub	x0, x0, #0x4
  9f58a8: f9001ac0     	str	x0, [x22, #0x30]
  9f58ac: 91036276     	add	x22, x19, #0xd8
  9f58b0: f9401ac0     	ldr	x0, [x22, #0x30]
  9f58b4: f9401ec1     	ldr	x1, [x22, #0x38]
  9f58b8: eb01001f     	cmp	x0, x1
  9f58bc: 54000fa0     	b.eq	0x9f5ab0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x34c>
  9f58c0: d1002000     	sub	x0, x0, #0x8
  9f58c4: f9001ac0     	str	x0, [x22, #0x30]
  9f58c8: f9407661     	ldr	x1, [x19, #0xe8]
  9f58cc: eb00003f     	cmp	x1, x0
  9f58d0: 54fffb40     	b.eq	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f58d4: f9408a62     	ldr	x2, [x19, #0x110]
  9f58d8: f9409261     	ldr	x1, [x19, #0x120]
  9f58dc: eb00005f     	cmp	x2, x0
  9f58e0: 54000b80     	b.eq	0x9f5a50 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x2ec>
  9f58e4: f85f8000     	ldur	x0, [x0, #-0x8]
  9f58e8: 90002aa1     	adrp	x1, 0xf49000
  9f58ec: f9004260     	str	x0, [x19, #0x80]
  9f58f0: b900727f     	str	wzr, [x19, #0x70]
  9f58f4: f9402ba2     	ldr	x2, [x29, #0x50]
  9f58f8: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f58fc: d1006040     	sub	x0, x2, #0x18
  9f5900: eb01001f     	cmp	x0, x1
  9f5904: 54fffa80     	b.eq	0x9f5854 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xf0>
  9f5908: f0002a61     	adrp	x1, 0xf44000
  9f590c: f9445021     	ldr	x1, [x1, #0x8a0]
  9f5910: b4000981     	cbz	x1, 0x9f5a40 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x2dc>
  9f5914: d1002042     	sub	x2, x2, #0x8
  9f5918: 885ffc41     	ldaxr	w1, [x2]
  9f591c: 51000423     	sub	w3, w1, #0x1
  9f5920: 8804fc43     	stlxr	w4, w3, [x2]
  9f5924: 35ffffa4     	cbnz	w4, 0x9f5918 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1b4>
  9f5928: 6b1f003f     	cmp	w1, wzr
  9f592c: 54fff94c     	b.gt	0x9f5854 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xf0>
  9f5930: aa1503e1     	mov	x1, x21
  9f5934: 940753a2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f5938: 17ffffc7     	b	0x9f5854 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xf0>
  9f593c: f85f8060     	ldur	x0, [x3, #-0x8]
  9f5940: 91080000     	add	x0, x0, #0x200
  9f5944: 17ffff9b     	b	0x9f57b0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x4c>
  9f5948: 52800057     	mov	w23, #0x2               // =2
  9f594c: 17ffff9a     	b	0x9f57b4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x50>
  9f5950: f85f8020     	ldur	x0, [x1, #-0x8]
  9f5954: 91080000     	add	x0, x0, #0x200
  9f5958: 17ffffb6     	b	0x9f5830 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xcc>
  9f595c: f00010e1     	adrp	x1, 0xc14000 <_ZTSSt5_BindIFSt7_Mem_fnIM6GLNodeFvRKN7cocos2d4Mat4EjEEPS1_S3_jEE+0x2120>
  9f5960: aa1603e0     	mov	x0, x22
  9f5964: 91176021     	add	x1, x1, #0x5d8
  9f5968: 94074d24     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f596c: 35000780     	cbnz	w0, 0x9f5a5c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x2f8>
  9f5970: 71001aff     	cmp	w23, #0x6
  9f5974: 54000b60     	b.eq	0x9f5ae0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x37c>
  9f5978: 71000aff     	cmp	w23, #0x2
  9f597c: 54fff5e1     	b.ne	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5980: f9403e60     	ldr	x0, [x19, #0x78]
  9f5984: 91018261     	add	x1, x19, #0x60
  9f5988: 97e72fee     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f598c: 9101a3b6     	add	x22, x29, #0x68
  9f5990: aa0003f7     	mov	x23, x0
  9f5994: 52800021     	mov	w1, #0x1                // =1
  9f5998: aa1603e0     	mov	x0, x22
  9f599c: 94010321     	bl	0xa36620 <_ZN7cocos2d5ValueC2Eb>
  9f59a0: aa1703e0     	mov	x0, x23
  9f59a4: aa1603e1     	mov	x1, x22
  9f59a8: 940110b2     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f59ac: aa1603e0     	mov	x0, x22
  9f59b0: 94010f5f     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f59b4: 17ffffa1     	b	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f59b8: 94061954     	bl	0xb7bf08 <_ZdlPv>
  9f59bc: f94026c0     	ldr	x0, [x22, #0x48]
  9f59c0: d1002002     	sub	x2, x0, #0x8
  9f59c4: f900ba62     	str	x2, [x19, #0x170]
  9f59c8: f85f8000     	ldur	x0, [x0, #-0x8]
  9f59cc: f900b260     	str	x0, [x19, #0x160]
  9f59d0: 91080002     	add	x2, x0, #0x200
  9f59d4: f900b662     	str	x2, [x19, #0x168]
  9f59d8: 9107f000     	add	x0, x0, #0x1fc
  9f59dc: f9001ac0     	str	x0, [x22, #0x30]
  9f59e0: 17ffffb3     	b	0x9f58ac <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x148>
  9f59e4: 94061949     	bl	0xb7bf08 <_ZdlPv>
  9f59e8: f94026c0     	ldr	x0, [x22, #0x48]
  9f59ec: d1002002     	sub	x2, x0, #0x8
  9f59f0: f900ba62     	str	x2, [x19, #0x170]
  9f59f4: f85f8000     	ldur	x0, [x0, #-0x8]
  9f59f8: f900b260     	str	x0, [x19, #0x160]
  9f59fc: 91080002     	add	x2, x0, #0x200
  9f5a00: f900b662     	str	x2, [x19, #0x168]
  9f5a04: 9107f000     	add	x0, x0, #0x1fc
  9f5a08: f9001ac0     	str	x0, [x22, #0x30]
  9f5a0c: 17ffff7b     	b	0x9f57f8 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x94>
  9f5a10: 9406193e     	bl	0xb7bf08 <_ZdlPv>
  9f5a14: f94026c0     	ldr	x0, [x22, #0x48]
  9f5a18: d1002002     	sub	x2, x0, #0x8
  9f5a1c: f9006a62     	str	x2, [x19, #0xd0]
  9f5a20: f85f8000     	ldur	x0, [x0, #-0x8]
  9f5a24: f9006260     	str	x0, [x19, #0xc0]
  9f5a28: 9107e002     	add	x2, x0, #0x1f8
  9f5a2c: 91080000     	add	x0, x0, #0x200
  9f5a30: f9006660     	str	x0, [x19, #0xc8]
  9f5a34: aa0203e0     	mov	x0, x2
  9f5a38: f9001ac2     	str	x2, [x22, #0x30]
  9f5a3c: 17ffff76     	b	0x9f5814 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xb0>
  9f5a40: b85f8041     	ldur	w1, [x2, #-0x8]
  9f5a44: 51000423     	sub	w3, w1, #0x1
  9f5a48: b81f8043     	stur	w3, [x2, #-0x8]
  9f5a4c: 17ffffb7     	b	0x9f5928 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x1c4>
  9f5a50: f85f8020     	ldur	x0, [x1, #-0x8]
  9f5a54: 91080000     	add	x0, x0, #0x200
  9f5a58: 17ffffa3     	b	0x9f58e4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x180>
  9f5a5c: f00010e1     	adrp	x1, 0xc14000 <_ZTSSt5_BindIFSt7_Mem_fnIM6GLNodeFvRKN7cocos2d4Mat4EjEEPS1_S3_jEE+0x2120>
  9f5a60: aa1603e0     	mov	x0, x22
  9f5a64: 91178021     	add	x1, x1, #0x5e0
  9f5a68: 94074ce4     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5a6c: 350005e0     	cbnz	w0, 0x9f5b28 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3c4>
  9f5a70: 71001aff     	cmp	w23, #0x6
  9f5a74: 540007c0     	b.eq	0x9f5b6c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x408>
  9f5a78: 71000aff     	cmp	w23, #0x2
  9f5a7c: 54ffede1     	b.ne	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5a80: f9403e60     	ldr	x0, [x19, #0x78]
  9f5a84: 91018261     	add	x1, x19, #0x60
  9f5a88: 97e72fae     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f5a8c: 910223b6     	add	x22, x29, #0x88
  9f5a90: aa0003f7     	mov	x23, x0
  9f5a94: 52800001     	mov	w1, #0x0                // =0
  9f5a98: aa1603e0     	mov	x0, x22
  9f5a9c: 940102e1     	bl	0xa36620 <_ZN7cocos2d5ValueC2Eb>
  9f5aa0: aa1703e0     	mov	x0, x23
  9f5aa4: aa1603e1     	mov	x1, x22
  9f5aa8: 94011072     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f5aac: 17ffffc0     	b	0x9f59ac <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x248>
  9f5ab0: 94061916     	bl	0xb7bf08 <_ZdlPv>
  9f5ab4: f94026c0     	ldr	x0, [x22, #0x48]
  9f5ab8: d1002002     	sub	x2, x0, #0x8
  9f5abc: f9009262     	str	x2, [x19, #0x120]
  9f5ac0: f85f8000     	ldur	x0, [x0, #-0x8]
  9f5ac4: f9008a60     	str	x0, [x19, #0x110]
  9f5ac8: 9107e002     	add	x2, x0, #0x1f8
  9f5acc: 91080000     	add	x0, x0, #0x200
  9f5ad0: f9008e60     	str	x0, [x19, #0x118]
  9f5ad4: aa0203e0     	mov	x0, x2
  9f5ad8: f9001ac2     	str	x2, [x22, #0x30]
  9f5adc: 17ffff7b     	b	0x9f58c8 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x164>
  9f5ae0: 910163b7     	add	x23, x29, #0x58
  9f5ae4: 52800021     	mov	w1, #0x1                // =1
  9f5ae8: aa1703e0     	mov	x0, x23
  9f5aec: f9404276     	ldr	x22, [x19, #0x80]
  9f5af0: 940102cc     	bl	0xa36620 <_ZN7cocos2d5ValueC2Eb>
  9f5af4: f94006c0     	ldr	x0, [x22, #0x8]
  9f5af8: f9400ac1     	ldr	x1, [x22, #0x10]
  9f5afc: eb01001f     	cmp	x0, x1
  9f5b00: 54000660     	b.eq	0x9f5bcc <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x468>
  9f5b04: b4000080     	cbz	x0, 0x9f5b14 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3b0>
  9f5b08: aa1703e1     	mov	x1, x23
  9f5b0c: 94011082     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f5b10: f94006c0     	ldr	x0, [x22, #0x8]
  9f5b14: 91004000     	add	x0, x0, #0x10
  9f5b18: f90006c0     	str	x0, [x22, #0x8]
  9f5b1c: aa1703e0     	mov	x0, x23
  9f5b20: 94010f03     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5b24: 17ffff45     	b	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5b28: f0001538     	adrp	x24, 0xc9c000 <ECDH_version+0x100>
  9f5b2c: aa1603e0     	mov	x0, x22
  9f5b30: 911cc301     	add	x1, x24, #0x730
  9f5b34: 94074cb1     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5b38: 35000340     	cbnz	w0, 0x9f5ba0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x43c>
  9f5b3c: 71001aff     	cmp	w23, #0x6
  9f5b40: 540004e0     	b.eq	0x9f5bdc <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x478>
  9f5b44: 71000aff     	cmp	w23, #0x2
  9f5b48: 9101a277     	add	x23, x19, #0x68
  9f5b4c: 54000760     	b.eq	0x9f5c38 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x4d4>
  9f5b50: f9403662     	ldr	x2, [x19, #0x68]
  9f5b54: aa1703e0     	mov	x0, x23
  9f5b58: d2800001     	mov	x1, #0x0                // =0
  9f5b5c: d2800003     	mov	x3, #0x0                // =0
  9f5b60: f85e8042     	ldur	x2, [x2, #-0x18]
  9f5b64: 94074d5b     	bl	0xbc90d0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4aaa8>
  9f5b68: 17ffff34     	b	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5b6c: 9101e3b7     	add	x23, x29, #0x78
  9f5b70: 52800001     	mov	w1, #0x0                // =0
  9f5b74: aa1703e0     	mov	x0, x23
  9f5b78: f9404276     	ldr	x22, [x19, #0x80]
  9f5b7c: 940102a9     	bl	0xa36620 <_ZN7cocos2d5ValueC2Eb>
  9f5b80: f94006c0     	ldr	x0, [x22, #0x8]
  9f5b84: f9400ac1     	ldr	x1, [x22, #0x10]
  9f5b88: eb01001f     	cmp	x0, x1
  9f5b8c: 54000ac0     	b.eq	0x9f5ce4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x580>
  9f5b90: b4fffc20     	cbz	x0, 0x9f5b14 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3b0>
  9f5b94: aa1703e1     	mov	x1, x23
  9f5b98: 9401105f     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f5b9c: 17ffffdd     	b	0x9f5b10 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3ac>
  9f5ba0: b00014a1     	adrp	x1, 0xc8a000 <EVP_version+0x1d20>
  9f5ba4: aa1603e0     	mov	x0, x22
  9f5ba8: 9117c021     	add	x1, x1, #0x5f0
  9f5bac: 94074c93     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5bb0: 34fffc60     	cbz	w0, 0x9f5b3c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3d8>
  9f5bb4: 900015e1     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f5bb8: aa1603e0     	mov	x0, x22
  9f5bbc: 91088021     	add	x1, x1, #0x220
  9f5bc0: 94074c8e     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5bc4: 34fffbc0     	cbz	w0, 0x9f5b3c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3d8>
  9f5bc8: 17ffff1c     	b	0x9f5838 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0xd4>
  9f5bcc: aa1603e0     	mov	x0, x22
  9f5bd0: aa1703e1     	mov	x1, x23
  9f5bd4: 97e72e55     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f5bd8: 17ffffd1     	b	0x9f5b1c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3b8>
  9f5bdc: aa1603e0     	mov	x0, x22
  9f5be0: 911cc301     	add	x1, x24, #0x730
  9f5be4: 94074c85     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5be8: 350004a0     	cbnz	w0, 0x9f5c7c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x518>
  9f5bec: 910263b6     	add	x22, x29, #0x98
  9f5bf0: 9101a277     	add	x23, x19, #0x68
  9f5bf4: aa1603e0     	mov	x0, x22
  9f5bf8: aa1703e1     	mov	x1, x23
  9f5bfc: f9404278     	ldr	x24, [x19, #0x80]
  9f5c00: 940102ad     	bl	0xa366b4 <_ZN7cocos2d5ValueC2ERKSs>
  9f5c04: f9400700     	ldr	x0, [x24, #0x8]
  9f5c08: f9400b01     	ldr	x1, [x24, #0x10]
  9f5c0c: eb01001f     	cmp	x0, x1
  9f5c10: 54000f40     	b.eq	0x9f5df8 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x694>
  9f5c14: b4000080     	cbz	x0, 0x9f5c24 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x4c0>
  9f5c18: aa1603e1     	mov	x1, x22
  9f5c1c: 9401103e     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f5c20: f9400700     	ldr	x0, [x24, #0x8]
  9f5c24: 91004000     	add	x0, x0, #0x10
  9f5c28: f9000700     	str	x0, [x24, #0x8]
  9f5c2c: aa1603e0     	mov	x0, x22
  9f5c30: 94010ebf     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5c34: 17ffffc7     	b	0x9f5b50 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3ec>
  9f5c38: aa1603e0     	mov	x0, x22
  9f5c3c: 911cc301     	add	x1, x24, #0x730
  9f5c40: 94074c6e     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5c44: 35000580     	cbnz	w0, 0x9f5cf4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x590>
  9f5c48: f9403e60     	ldr	x0, [x19, #0x78]
  9f5c4c: 91018261     	add	x1, x19, #0x60
  9f5c50: 97e72f3c     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f5c54: 910323b6     	add	x22, x29, #0xc8
  9f5c58: aa0003f8     	mov	x24, x0
  9f5c5c: aa1703e1     	mov	x1, x23
  9f5c60: aa1603e0     	mov	x0, x22
  9f5c64: 94010294     	bl	0xa366b4 <_ZN7cocos2d5ValueC2ERKSs>
  9f5c68: aa1803e0     	mov	x0, x24
  9f5c6c: aa1603e1     	mov	x1, x22
  9f5c70: 94011000     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f5c74: 17ffffee     	b	0x9f5c2c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x4c8>
  9f5c78: 97e695ca     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f5c7c: b00014a1     	adrp	x1, 0xc8a000 <EVP_version+0x1d20>
  9f5c80: aa1603e0     	mov	x0, x22
  9f5c84: 9117c021     	add	x1, x1, #0x5f0
  9f5c88: 94074c5c     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5c8c: 350005a0     	cbnz	w0, 0x9f5d40 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x5dc>
  9f5c90: f9403660     	ldr	x0, [x19, #0x68]
  9f5c94: 9102a3b6     	add	x22, x29, #0xa8
  9f5c98: f9404277     	ldr	x23, [x19, #0x80]
  9f5c9c: 97e697bd     	bl	0x39bb90 <atoi@plt>
  9f5ca0: 2a0003e1     	mov	w1, w0
  9f5ca4: aa1603e0     	mov	x0, x22
  9f5ca8: 9401024e     	bl	0xa365e0 <_ZN7cocos2d5ValueC2Ei>
  9f5cac: f94006e0     	ldr	x0, [x23, #0x8]
  9f5cb0: f9400ae1     	ldr	x1, [x23, #0x10]
  9f5cb4: eb01001f     	cmp	x0, x1
  9f5cb8: 54000b20     	b.eq	0x9f5e1c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x6b8>
  9f5cbc: b4000080     	cbz	x0, 0x9f5ccc <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x568>
  9f5cc0: aa1603e1     	mov	x1, x22
  9f5cc4: 94011014     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f5cc8: f94006e0     	ldr	x0, [x23, #0x8]
  9f5ccc: 91004000     	add	x0, x0, #0x10
  9f5cd0: f90006e0     	str	x0, [x23, #0x8]
  9f5cd4: aa1603e0     	mov	x0, x22
  9f5cd8: 9101a277     	add	x23, x19, #0x68
  9f5cdc: 94010e94     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5ce0: 17ffff9c     	b	0x9f5b50 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3ec>
  9f5ce4: aa1603e0     	mov	x0, x22
  9f5ce8: aa1703e1     	mov	x1, x23
  9f5cec: 97e72e0f     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f5cf0: 17ffff8b     	b	0x9f5b1c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3b8>
  9f5cf4: b00014a1     	adrp	x1, 0xc8a000 <EVP_version+0x1d20>
  9f5cf8: aa1603e0     	mov	x0, x22
  9f5cfc: 9117c021     	add	x1, x1, #0x5f0
  9f5d00: 94074c3e     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5d04: 350003a0     	cbnz	w0, 0x9f5d78 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x614>
  9f5d08: f9403e60     	ldr	x0, [x19, #0x78]
  9f5d0c: 91018261     	add	x1, x19, #0x60
  9f5d10: 97e72f0c     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f5d14: aa0003f7     	mov	x23, x0
  9f5d18: f9403660     	ldr	x0, [x19, #0x68]
  9f5d1c: 910363b6     	add	x22, x29, #0xd8
  9f5d20: 97e6979c     	bl	0x39bb90 <atoi@plt>
  9f5d24: 2a0003e1     	mov	w1, w0
  9f5d28: aa1603e0     	mov	x0, x22
  9f5d2c: 9401022d     	bl	0xa365e0 <_ZN7cocos2d5ValueC2Ei>
  9f5d30: aa1703e0     	mov	x0, x23
  9f5d34: aa1603e1     	mov	x1, x22
  9f5d38: 94010fce     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f5d3c: 17ffffe6     	b	0x9f5cd4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x570>
  9f5d40: f9403660     	ldr	x0, [x19, #0x68]
  9f5d44: 9102e3b6     	add	x22, x29, #0xb8
  9f5d48: f9404277     	ldr	x23, [x19, #0x80]
  9f5d4c: 97e695d1     	bl	0x39b490 <atof@plt>
  9f5d50: aa1603e0     	mov	x0, x22
  9f5d54: 9401022f     	bl	0xa36610 <_ZN7cocos2d5ValueC2Ed>
  9f5d58: f94006e0     	ldr	x0, [x23, #0x8]
  9f5d5c: f9400ae1     	ldr	x1, [x23, #0x10]
  9f5d60: eb01001f     	cmp	x0, x1
  9f5d64: 54000740     	b.eq	0x9f5e4c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x6e8>
  9f5d68: b4fffb20     	cbz	x0, 0x9f5ccc <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x568>
  9f5d6c: aa1603e1     	mov	x1, x22
  9f5d70: 94010fe9     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f5d74: 17ffffd5     	b	0x9f5cc8 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x564>
  9f5d78: f9403e60     	ldr	x0, [x19, #0x78]
  9f5d7c: 91018261     	add	x1, x19, #0x60
  9f5d80: 97e72ef0     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f5d84: aa0003f6     	mov	x22, x0
  9f5d88: f9403660     	ldr	x0, [x19, #0x68]
  9f5d8c: 97e695c1     	bl	0x39b490 <atof@plt>
  9f5d90: aa1503e0     	mov	x0, x21
  9f5d94: 9401021f     	bl	0xa36610 <_ZN7cocos2d5ValueC2Ed>
  9f5d98: aa1603e0     	mov	x0, x22
  9f5d9c: aa1503e1     	mov	x1, x21
  9f5da0: 94010fb4     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f5da4: aa1503e0     	mov	x0, x21
  9f5da8: 9101a277     	add	x23, x19, #0x68
  9f5dac: 94010e60     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5db0: 17ffff68     	b	0x9f5b50 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x3ec>
  9f5db4: aa0003f3     	mov	x19, x0
  9f5db8: aa1603e0     	mov	x0, x22
  9f5dbc: 94010e5c     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5dc0: 90002aa1     	adrp	x1, 0xf49000
  9f5dc4: f9402ba0     	ldr	x0, [x29, #0x50]
  9f5dc8: d1006000     	sub	x0, x0, #0x18
  9f5dcc: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f5dd0: eb01001f     	cmp	x0, x1
  9f5dd4: 54000060     	b.eq	0x9f5de0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x67c>
  9f5dd8: 910123a1     	add	x1, x29, #0x48
  9f5ddc: 97e6a5a9     	bl	0x39f480 <.text+0x3170>
  9f5de0: aa1303e0     	mov	x0, x19
  9f5de4: 9407b43f     	bl	0xbe2ee0 <_Unwind_Resume>
  9f5de8: aa0003f3     	mov	x19, x0
  9f5dec: aa1503e0     	mov	x0, x21
  9f5df0: 94010e4f     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5df4: 17fffff3     	b	0x9f5dc0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x65c>
  9f5df8: aa1803e0     	mov	x0, x24
  9f5dfc: aa1603e1     	mov	x1, x22
  9f5e00: 97e72dca     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f5e04: 17ffff8a     	b	0x9f5c2c <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x4c8>
  9f5e08: aa0003f3     	mov	x19, x0
  9f5e0c: aa1703e0     	mov	x0, x23
  9f5e10: 94010e47     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f5e14: 17ffffeb     	b	0x9f5dc0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x65c>
  9f5e18: 17ffffe7     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e1c: aa1703e0     	mov	x0, x23
  9f5e20: aa1603e1     	mov	x1, x22
  9f5e24: 97e72dc1     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f5e28: 17ffffab     	b	0x9f5cd4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x570>
  9f5e2c: 17ffffe2     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e30: 17fffff6     	b	0x9f5e08 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x6a4>
  9f5e34: aa0003f3     	mov	x19, x0
  9f5e38: 17ffffe2     	b	0x9f5dc0 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x65c>
  9f5e3c: 17ffffde     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e40: 17ffffdd     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e44: 17ffffdc     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e48: 17ffffdb     	b	0x9f5db4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x650>
  9f5e4c: aa1703e0     	mov	x0, x23
  9f5e50: aa1603e1     	mov	x1, x22
  9f5e54: 97e72db5     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f5e58: 17ffff9f     	b	0x9f5cd4 <_ZN7cocos2d9DictMaker10endElementEPvPKc+0x570>

00000000009f5e5c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_>:
  9f5e5c: a9ae7bfd     	stp	x29, x30, [sp, #-0x120]!
  9f5e60: aa0203e1     	mov	x1, x2
  9f5e64: 910003fd     	mov	x29, sp
  9f5e68: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f5e6c: f0002a54     	adrp	x20, 0xf40000
  9f5e70: aa0003f3     	mov	x19, x0
  9f5e74: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f5e78: 910183b6     	add	x22, x29, #0x60
  9f5e7c: 910383b5     	add	x21, x29, #0xe0
  9f5e80: f940e683     	ldr	x3, [x20, #0x1c8]
  9f5e84: aa1603e0     	mov	x0, x22
  9f5e88: aa1503e2     	mov	x2, x21
  9f5e8c: f90023f9     	str	x25, [sp, #0x40]
  9f5e90: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f5e94: f9400063     	ldr	x3, [x3]
  9f5e98: f9008fa3     	str	x3, [x29, #0x118]
  9f5e9c: 9407444d     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f5ea0: d0001381     	adrp	x1, 0xc67000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x3c10>
  9f5ea4: aa1603e0     	mov	x0, x22
  9f5ea8: 91354021     	add	x1, x1, #0xd50
  9f5eac: 94074bd3     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5eb0: 35000760     	cbnz	w0, 0x9f5f9c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x140>
  9f5eb4: b9400a60     	ldr	w0, [x19, #0x8]
  9f5eb8: 7100041f     	cmp	w0, #0x1
  9f5ebc: 54000fc0     	b.eq	0x9f60b4 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x258>
  9f5ec0: f940ae60     	ldr	x0, [x19, #0x158]
  9f5ec4: 52800042     	mov	w2, #0x2                // =2
  9f5ec8: f9409e61     	ldr	x1, [x19, #0x138]
  9f5ecc: b9007262     	str	w2, [x19, #0x70]
  9f5ed0: eb01001f     	cmp	x0, x1
  9f5ed4: 54000160     	b.eq	0x9f5f00 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xa4>
  9f5ed8: f940b262     	ldr	x2, [x19, #0x160]
  9f5edc: aa0003e1     	mov	x1, x0
  9f5ee0: f940ba63     	ldr	x3, [x19, #0x170]
  9f5ee4: eb02001f     	cmp	x0, x2
  9f5ee8: 540013e0     	b.eq	0x9f6164 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x308>
  9f5eec: b85fc021     	ldur	w1, [x1, #-0x4]
  9f5ef0: 7100183f     	cmp	w1, #0x6
  9f5ef4: 54000ea0     	b.eq	0x9f60c8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x26c>
  9f5ef8: 7100083f     	cmp	w1, #0x2
  9f5efc: 54000840     	b.eq	0x9f6004 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x1a8>
  9f5f00: 9104a262     	add	x2, x19, #0x128
  9f5f04: f9402041     	ldr	x1, [x2, #0x40]
  9f5f08: d1001021     	sub	x1, x1, #0x4
  9f5f0c: eb01001f     	cmp	x0, x1
  9f5f10: 54001400     	b.eq	0x9f6190 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x334>
  9f5f14: b9407261     	ldr	w1, [x19, #0x70]
  9f5f18: b4000040     	cbz	x0, 0x9f5f20 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xc4>
  9f5f1c: b9000001     	str	w1, [x0]
  9f5f20: 91001000     	add	x0, x0, #0x4
  9f5f24: f9001840     	str	x0, [x2, #0x30]
  9f5f28: 91022260     	add	x0, x19, #0x88
  9f5f2c: f9402002     	ldr	x2, [x0, #0x40]
  9f5f30: f9401801     	ldr	x1, [x0, #0x30]
  9f5f34: d1002042     	sub	x2, x2, #0x8
  9f5f38: eb02003f     	cmp	x1, x2
  9f5f3c: 54001320     	b.eq	0x9f61a0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x344>
  9f5f40: f9403e62     	ldr	x2, [x19, #0x78]
  9f5f44: b4000061     	cbz	x1, 0x9f5f50 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xf4>
  9f5f48: f9000022     	str	x2, [x1]
  9f5f4c: f9401801     	ldr	x1, [x0, #0x30]
  9f5f50: 91002021     	add	x1, x1, #0x8
  9f5f54: f9001801     	str	x1, [x0, #0x30]
  9f5f58: 90002aa1     	adrp	x1, 0xf49000
  9f5f5c: f94033a2     	ldr	x2, [x29, #0x60]
  9f5f60: d1006040     	sub	x0, x2, #0x18
  9f5f64: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f5f68: eb01001f     	cmp	x0, x1
  9f5f6c: 54000321     	b.ne	0x9f5fd0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x174>
  9f5f70: f940e694     	ldr	x20, [x20, #0x1c8]
  9f5f74: f9408fa1     	ldr	x1, [x29, #0x118]
  9f5f78: f9400280     	ldr	x0, [x20]
  9f5f7c: eb00003f     	cmp	x1, x0
  9f5f80: 54001b41     	b.ne	0x9f62e8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x48c>
  9f5f84: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f5f88: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f5f8c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f5f90: f94023f9     	ldr	x25, [sp, #0x40]
  9f5f94: a8d27bfd     	ldp	x29, x30, [sp], #0x120
  9f5f98: d65f03c0     	ret
  9f5f9c: f0001481     	adrp	x1, 0xc88000 <lh_version+0x310>
  9f5fa0: aa1603e0     	mov	x0, x22
  9f5fa4: 911d4021     	add	x1, x1, #0x750
  9f5fa8: 94074b94     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f5fac: 35000e20     	cbnz	w0, 0x9f6170 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x314>
  9f5fb0: 90002aa1     	adrp	x1, 0xf49000
  9f5fb4: 52800020     	mov	w0, #0x1                // =1
  9f5fb8: b9007260     	str	w0, [x19, #0x70]
  9f5fbc: f94033a2     	ldr	x2, [x29, #0x60]
  9f5fc0: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f5fc4: d1006040     	sub	x0, x2, #0x18
  9f5fc8: eb01001f     	cmp	x0, x1
  9f5fcc: 54fffd20     	b.eq	0x9f5f70 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x114>
  9f5fd0: f0002a61     	adrp	x1, 0xf44000
  9f5fd4: f9445021     	ldr	x1, [x1, #0x8a0]
  9f5fd8: b4000ea1     	cbz	x1, 0x9f61ac <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x350>
  9f5fdc: d1002042     	sub	x2, x2, #0x8
  9f5fe0: 885ffc41     	ldaxr	w1, [x2]
  9f5fe4: 51000423     	sub	w3, w1, #0x1
  9f5fe8: 8804fc43     	stlxr	w4, w3, [x2]
  9f5fec: 35ffffa4     	cbnz	w4, 0x9f5fe0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x184>
  9f5ff0: 6b1f003f     	cmp	w1, wzr
  9f5ff4: 54fffbec     	b.gt	0x9f5f70 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x114>
  9f5ff8: aa1503e1     	mov	x1, x21
  9f5ffc: 940751f0     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6000: 17ffffdc     	b	0x9f5f70 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x114>
  9f6004: f9405e61     	ldr	x1, [x19, #0xb8]
  9f6008: f9406262     	ldr	x2, [x19, #0xc0]
  9f600c: f9406a60     	ldr	x0, [x19, #0xd0]
  9f6010: eb02003f     	cmp	x1, x2
  9f6014: 54000d40     	b.eq	0x9f61bc <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x360>
  9f6018: f85f8038     	ldur	x24, [x1, #-0x8]
  9f601c: 91018277     	add	x23, x19, #0x60
  9f6020: aa1703e1     	mov	x1, x23
  9f6024: aa1803e0     	mov	x0, x24
  9f6028: 97e72e46     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f602c: aa0003f9     	mov	x25, x0
  9f6030: d2800141     	mov	x1, #0xa                // =10
  9f6034: 1e2e1000     	fmov	s0, #1.00000000
  9f6038: 910082a0     	add	x0, x21, #0x20
  9f603c: f9007bbf     	str	xzr, [x29, #0xf0]
  9f6040: f9007fbf     	str	xzr, [x29, #0xf8]
  9f6044: bd0103a0     	str	s0, [x29, #0x100]
  9f6048: f90087bf     	str	xzr, [x29, #0x108]
  9f604c: 94073fb3     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f6050: f90077a0     	str	x0, [x29, #0xe8]
  9f6054: f100041f     	cmp	x0, #0x1
  9f6058: 54000c80     	b.eq	0x9f61e8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x38c>
  9f605c: 97ffddac     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f6060: aa0003e2     	mov	x2, x0
  9f6064: 9101e3b6     	add	x22, x29, #0x78
  9f6068: aa1503e1     	mov	x1, x21
  9f606c: aa1603e0     	mov	x0, x22
  9f6070: f90073a2     	str	x2, [x29, #0xe0]
  9f6074: 94010e35     	bl	0xa39948 <_ZN7cocos2d5ValueC2EOSt13unordered_mapISsS0_St4hashISsESt8equal_toISsESaISt4pairIKSsS0_EEE>
  9f6078: aa1903e0     	mov	x0, x25
  9f607c: aa1603e1     	mov	x1, x22
  9f6080: 94010efc     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f6084: aa1603e0     	mov	x0, x22
  9f6088: 94010da9     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f608c: aa1503e0     	mov	x0, x21
  9f6090: 97e72833     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f6094: aa1803e0     	mov	x0, x24
  9f6098: aa1703e1     	mov	x1, x23
  9f609c: 97e72e29     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f60a0: 94010516     	bl	0xa374f8 <_ZN7cocos2d5Value10asValueMapEv>
  9f60a4: 9104a262     	add	x2, x19, #0x128
  9f60a8: f9003e60     	str	x0, [x19, #0x78]
  9f60ac: f9401840     	ldr	x0, [x2, #0x30]
  9f60b0: 17ffff95     	b	0x9f5f04 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xa8>
  9f60b4: f9401660     	ldr	x0, [x19, #0x28]
  9f60b8: b5fff040     	cbnz	x0, 0x9f5ec0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x64>
  9f60bc: 91004260     	add	x0, x19, #0x10
  9f60c0: f9003e60     	str	x0, [x19, #0x78]
  9f60c4: 17ffff7f     	b	0x9f5ec0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x64>
  9f60c8: 9102a3b7     	add	x23, x29, #0xa8
  9f60cc: d2800141     	mov	x1, #0xa                // =10
  9f60d0: 1e2e1000     	fmov	s0, #1.00000000
  9f60d4: 910082e0     	add	x0, x23, #0x20
  9f60d8: f9404276     	ldr	x22, [x19, #0x80]
  9f60dc: f9005fbf     	str	xzr, [x29, #0xb8]
  9f60e0: f90063bf     	str	xzr, [x29, #0xc0]
  9f60e4: bd00cba0     	str	s0, [x29, #0xc8]
  9f60e8: f9006bbf     	str	xzr, [x29, #0xd0]
  9f60ec: 94073f8b     	bl	0xbc5f18 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x478f0>
  9f60f0: f9005ba0     	str	x0, [x29, #0xb0]
  9f60f4: f100041f     	cmp	x0, #0x1
  9f60f8: 540007e0     	b.eq	0x9f61f4 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x398>
  9f60fc: 97ffdd84     	bl	0x9ed70c <_ZN7cocos2d9FileUtils17getStringFromFileERKSs+0xac>
  9f6100: aa0003e2     	mov	x2, x0
  9f6104: 9101a3b8     	add	x24, x29, #0x68
  9f6108: aa1703e1     	mov	x1, x23
  9f610c: aa1803e0     	mov	x0, x24
  9f6110: f90057a2     	str	x2, [x29, #0xa8]
  9f6114: 94010e0d     	bl	0xa39948 <_ZN7cocos2d5ValueC2EOSt13unordered_mapISsS0_St4hashISsESt8equal_toISsESaISt4pairIKSsS0_EEE>
  9f6118: f94006c0     	ldr	x0, [x22, #0x8]
  9f611c: f9400ac1     	ldr	x1, [x22, #0x10]
  9f6120: eb01001f     	cmp	x0, x1
  9f6124: 540007e0     	b.eq	0x9f6220 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x3c4>
  9f6128: b4000080     	cbz	x0, 0x9f6138 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x2dc>
  9f612c: aa1803e1     	mov	x1, x24
  9f6130: 94010ef9     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f6134: f94006c0     	ldr	x0, [x22, #0x8]
  9f6138: 91004000     	add	x0, x0, #0x10
  9f613c: f90006c0     	str	x0, [x22, #0x8]
  9f6140: aa1803e0     	mov	x0, x24
  9f6144: 94010d7a     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f6148: aa1703e0     	mov	x0, x23
  9f614c: 97e72804     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f6150: f9404260     	ldr	x0, [x19, #0x80]
  9f6154: f9400400     	ldr	x0, [x0, #0x8]
  9f6158: d1004000     	sub	x0, x0, #0x10
  9f615c: 940104e7     	bl	0xa374f8 <_ZN7cocos2d5Value10asValueMapEv>
  9f6160: 17ffffd1     	b	0x9f60a4 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x248>
  9f6164: f85f8061     	ldur	x1, [x3, #-0x8]
  9f6168: 91080021     	add	x1, x1, #0x200
  9f616c: 17ffff60     	b	0x9f5eec <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x90>
  9f6170: 900014a1     	adrp	x1, 0xc8a000 <EVP_version+0x1d20>
  9f6174: aa1603e0     	mov	x0, x22
  9f6178: 9117c021     	add	x1, x1, #0x5f0
  9f617c: 94074b1f     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f6180: 35000240     	cbnz	w0, 0x9f61c8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x36c>
  9f6184: 52800060     	mov	w0, #0x3                // =3
  9f6188: b9007260     	str	w0, [x19, #0x70]
  9f618c: 17ffff73     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f6190: aa0203e0     	mov	x0, x2
  9f6194: 9101c261     	add	x1, x19, #0x70
  9f6198: 97fff954     	bl	0x9f46e8 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_>
  9f619c: 17ffff63     	b	0x9f5f28 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xcc>
  9f61a0: 9101e261     	add	x1, x19, #0x78
  9f61a4: 97fff9bd     	bl	0x9f4898 <_ZNSt5dequeIPSt13unordered_mapISsN7cocos2d5ValueESt4hashISsESt8equal_toISsESaISt4pairIKSsS2_EEESaISC_EE16_M_push_back_auxIJRKSC_EEEvDpOT_>
  9f61a8: 17ffff6c     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f61ac: b85f8041     	ldur	w1, [x2, #-0x8]
  9f61b0: 51000423     	sub	w3, w1, #0x1
  9f61b4: b81f8043     	stur	w3, [x2, #-0x8]
  9f61b8: 17ffff8e     	b	0x9f5ff0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x194>
  9f61bc: f85f8001     	ldur	x1, [x0, #-0x8]
  9f61c0: 91080021     	add	x1, x1, #0x200
  9f61c4: 17ffff95     	b	0x9f6018 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x1bc>
  9f61c8: f00015c1     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f61cc: aa1603e0     	mov	x0, x22
  9f61d0: 91088021     	add	x1, x1, #0x220
  9f61d4: 94074b09     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f61d8: 35000140     	cbnz	w0, 0x9f6200 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x3a4>
  9f61dc: 52800080     	mov	w0, #0x4                // =4
  9f61e0: b9007260     	str	w0, [x19, #0x70]
  9f61e4: 17ffff5d     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f61e8: f9008bbf     	str	xzr, [x29, #0x110]
  9f61ec: 9100c2a2     	add	x2, x21, #0x30
  9f61f0: 17ffff9d     	b	0x9f6064 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x208>
  9f61f4: f9006fbf     	str	xzr, [x29, #0xd8]
  9f61f8: 9100c2e2     	add	x2, x23, #0x30
  9f61fc: 17ffffc2     	b	0x9f6104 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x2a8>
  9f6200: d0001521     	adrp	x1, 0xc9c000 <ECDH_version+0x100>
  9f6204: aa1603e0     	mov	x0, x22
  9f6208: 911cc021     	add	x1, x1, #0x730
  9f620c: 94074afb     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f6210: 35000100     	cbnz	w0, 0x9f6230 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x3d4>
  9f6214: 528000a0     	mov	w0, #0x5                // =5
  9f6218: b9007260     	str	w0, [x19, #0x70]
  9f621c: 17ffff4f     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f6220: aa1603e0     	mov	x0, x22
  9f6224: aa1803e1     	mov	x1, x24
  9f6228: 97e72cc0     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f622c: 17ffffc5     	b	0x9f6140 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x2e4>
  9f6230: 90001341     	adrp	x1, 0xc5e000 <_ZTSN7cocos2d10GameDeviceE+0xd30>
  9f6234: aa1603e0     	mov	x0, x22
  9f6238: 91280021     	add	x1, x1, #0xa00
  9f623c: 94074aef     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  9f6240: 35000500     	cbnz	w0, 0x9f62e0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x484>
  9f6244: b9400a60     	ldr	w0, [x19, #0x8]
  9f6248: 528000c1     	mov	w1, #0x6                // =6
  9f624c: b9007261     	str	w1, [x19, #0x70]
  9f6250: 7100081f     	cmp	w0, #0x2
  9f6254: 540004c0     	b.eq	0x9f62ec <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x490>
  9f6258: f940ae60     	ldr	x0, [x19, #0x158]
  9f625c: f9409e61     	ldr	x1, [x19, #0x138]
  9f6260: eb01001f     	cmp	x0, x1
  9f6264: 54000140     	b.eq	0x9f628c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x430>
  9f6268: f940b262     	ldr	x2, [x19, #0x160]
  9f626c: f940ba61     	ldr	x1, [x19, #0x170]
  9f6270: eb02001f     	cmp	x0, x2
  9f6274: 54000f00     	b.eq	0x9f6454 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x5f8>
  9f6278: b85fc000     	ldur	w0, [x0, #-0x4]
  9f627c: 7100081f     	cmp	w0, #0x2
  9f6280: 54000a80     	b.eq	0x9f63d0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x574>
  9f6284: 7100181f     	cmp	w0, #0x6
  9f6288: 54000400     	b.eq	0x9f6308 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x4ac>
  9f628c: 9104a262     	add	x2, x19, #0x128
  9f6290: f9402041     	ldr	x1, [x2, #0x40]
  9f6294: f9401840     	ldr	x0, [x2, #0x30]
  9f6298: d1001021     	sub	x1, x1, #0x4
  9f629c: eb01001f     	cmp	x0, x1
  9f62a0: 54000900     	b.eq	0x9f63c0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x564>
  9f62a4: b9407261     	ldr	w1, [x19, #0x70]
  9f62a8: b4000040     	cbz	x0, 0x9f62b0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x454>
  9f62ac: b9000001     	str	w1, [x0]
  9f62b0: 91001000     	add	x0, x0, #0x4
  9f62b4: f9001840     	str	x0, [x2, #0x30]
  9f62b8: 91036260     	add	x0, x19, #0xd8
  9f62bc: f9402002     	ldr	x2, [x0, #0x40]
  9f62c0: f9401801     	ldr	x1, [x0, #0x30]
  9f62c4: d1002042     	sub	x2, x2, #0x8
  9f62c8: eb02003f     	cmp	x1, x2
  9f62cc: 54000740     	b.eq	0x9f63b4 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x558>
  9f62d0: f9404262     	ldr	x2, [x19, #0x80]
  9f62d4: b4ffe3c1     	cbz	x1, 0x9f5f4c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xf0>
  9f62d8: f9000022     	str	x2, [x1]
  9f62dc: 17ffff1c     	b	0x9f5f4c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xf0>
  9f62e0: b900727f     	str	wzr, [x19, #0x70]
  9f62e4: 17ffff1d     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f62e8: 97e6942e     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f62ec: f9402661     	ldr	x1, [x19, #0x48]
  9f62f0: f9402a60     	ldr	x0, [x19, #0x50]
  9f62f4: eb00003f     	cmp	x1, x0
  9f62f8: 54fffb01     	b.ne	0x9f6258 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x3fc>
  9f62fc: 91012260     	add	x0, x19, #0x48
  9f6300: f9004260     	str	x0, [x19, #0x80]
  9f6304: 17ffffd5     	b	0x9f6258 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x3fc>
  9f6308: f9408662     	ldr	x2, [x19, #0x108]
  9f630c: f9408a61     	ldr	x1, [x19, #0x110]
  9f6310: f9409260     	ldr	x0, [x19, #0x120]
  9f6314: eb01005f     	cmp	x2, x1
  9f6318: 540011e0     	b.eq	0x9f6554 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x6f8>
  9f631c: 910263b6     	add	x22, x29, #0x98
  9f6320: aa1503e1     	mov	x1, x21
  9f6324: aa1603e0     	mov	x0, x22
  9f6328: f85f8057     	ldur	x23, [x2, #-0x8]
  9f632c: f90073bf     	str	xzr, [x29, #0xe0]
  9f6330: f90077bf     	str	xzr, [x29, #0xe8]
  9f6334: f9007bbf     	str	xzr, [x29, #0xf0]
  9f6338: 94010d17     	bl	0xa39794 <_ZN7cocos2d5ValueC2EOSt6vectorIS0_SaIS0_EE>
  9f633c: f94006e0     	ldr	x0, [x23, #0x8]
  9f6340: f9400ae1     	ldr	x1, [x23, #0x10]
  9f6344: eb01001f     	cmp	x0, x1
  9f6348: 54000e40     	b.eq	0x9f6510 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x6b4>
  9f634c: b4000080     	cbz	x0, 0x9f635c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x500>
  9f6350: aa1603e1     	mov	x1, x22
  9f6354: 94010e70     	bl	0xa39d14 <_ZN7cocos2d5ValueC2EOS0_>
  9f6358: f94006e0     	ldr	x0, [x23, #0x8]
  9f635c: 91004000     	add	x0, x0, #0x10
  9f6360: f90006e0     	str	x0, [x23, #0x8]
  9f6364: aa1603e0     	mov	x0, x22
  9f6368: 94010cf1     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f636c: f94073b6     	ldr	x22, [x29, #0xe0]
  9f6370: f94077b7     	ldr	x23, [x29, #0xe8]
  9f6374: eb1702df     	cmp	x22, x23
  9f6378: 540000c0     	b.eq	0x9f6390 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x534>
  9f637c: aa1603e0     	mov	x0, x22
  9f6380: 910042d6     	add	x22, x22, #0x10
  9f6384: 94010cea     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f6388: eb1602ff     	cmp	x23, x22
  9f638c: 54ffff81     	b.ne	0x9f637c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x520>
  9f6390: f94073a0     	ldr	x0, [x29, #0xe0]
  9f6394: b4000040     	cbz	x0, 0x9f639c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x540>
  9f6398: 940616dc     	bl	0xb7bf08 <_ZdlPv>
  9f639c: f9404260     	ldr	x0, [x19, #0x80]
  9f63a0: f9400400     	ldr	x0, [x0, #0x8]
  9f63a4: d1004000     	sub	x0, x0, #0x10
  9f63a8: 94010450     	bl	0xa374e8 <_ZN7cocos2d5Value13asValueVectorEv>
  9f63ac: f9004260     	str	x0, [x19, #0x80]
  9f63b0: 17ffffb7     	b	0x9f628c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x430>
  9f63b4: 91020261     	add	x1, x19, #0x80
  9f63b8: 97fff9a4     	bl	0x9f4a48 <_ZNSt5dequeIPSt6vectorIN7cocos2d5ValueESaIS2_EESaIS5_EE16_M_push_back_auxIJRKS5_EEEvDpOT_>
  9f63bc: 17fffee7     	b	0x9f5f58 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0xfc>
  9f63c0: aa0203e0     	mov	x0, x2
  9f63c4: 9101c261     	add	x1, x19, #0x70
  9f63c8: 97fff8c8     	bl	0x9f46e8 <_ZNSt5dequeIN7cocos2d8SAXStateESaIS1_EE16_M_push_back_auxIJRKS1_EEEvDpOT_>
  9f63cc: 17ffffbb     	b	0x9f62b8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x45c>
  9f63d0: 91018277     	add	x23, x19, #0x60
  9f63d4: f9403e60     	ldr	x0, [x19, #0x78]
  9f63d8: aa1703e1     	mov	x1, x23
  9f63dc: 97e72d59     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f63e0: 910223b6     	add	x22, x29, #0x88
  9f63e4: aa0003f8     	mov	x24, x0
  9f63e8: aa1503e1     	mov	x1, x21
  9f63ec: aa1603e0     	mov	x0, x22
  9f63f0: f90073bf     	str	xzr, [x29, #0xe0]
  9f63f4: f90077bf     	str	xzr, [x29, #0xe8]
  9f63f8: f9007bbf     	str	xzr, [x29, #0xf0]
  9f63fc: 94010ce6     	bl	0xa39794 <_ZN7cocos2d5ValueC2EOSt6vectorIS0_SaIS0_EE>
  9f6400: aa1803e0     	mov	x0, x24
  9f6404: aa1603e1     	mov	x1, x22
  9f6408: 94010e1a     	bl	0xa39c70 <_ZN7cocos2d5ValueaSEOS0_>
  9f640c: aa1603e0     	mov	x0, x22
  9f6410: 94010cc7     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f6414: f94073b6     	ldr	x22, [x29, #0xe0]
  9f6418: f94077b8     	ldr	x24, [x29, #0xe8]
  9f641c: eb16031f     	cmp	x24, x22
  9f6420: 540000c0     	b.eq	0x9f6438 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x5dc>
  9f6424: aa1603e0     	mov	x0, x22
  9f6428: 910042d6     	add	x22, x22, #0x10
  9f642c: 94010cc0     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f6430: eb16031f     	cmp	x24, x22
  9f6434: 54ffff81     	b.ne	0x9f6424 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x5c8>
  9f6438: f94073a0     	ldr	x0, [x29, #0xe0]
  9f643c: b4000040     	cbz	x0, 0x9f6444 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x5e8>
  9f6440: 940616b2     	bl	0xb7bf08 <_ZdlPv>
  9f6444: f9403e60     	ldr	x0, [x19, #0x78]
  9f6448: aa1703e1     	mov	x1, x23
  9f644c: 97e72d3d     	bl	0x3c1940 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixERS2_>
  9f6450: 17ffffd6     	b	0x9f63a8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x54c>
  9f6454: f85f8020     	ldur	x0, [x1, #-0x8]
  9f6458: 91080000     	add	x0, x0, #0x200
  9f645c: 17ffff87     	b	0x9f6278 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x41c>
  9f6460: aa0003f3     	mov	x19, x0
  9f6464: aa1703e0     	mov	x0, x23
  9f6468: 97e7273d     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f646c: f0002a81     	adrp	x1, 0xf49000
  9f6470: f94033a0     	ldr	x0, [x29, #0x60]
  9f6474: d1006000     	sub	x0, x0, #0x18
  9f6478: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f647c: eb01001f     	cmp	x0, x1
  9f6480: 54000060     	b.eq	0x9f648c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x630>
  9f6484: 910163a1     	add	x1, x29, #0x58
  9f6488: 97e6a3fe     	bl	0x39f480 <.text+0x3170>
  9f648c: aa1303e0     	mov	x0, x19
  9f6490: 9407b294     	bl	0xbe2ee0 <_Unwind_Resume>
  9f6494: aa0003f3     	mov	x19, x0
  9f6498: aa1603e0     	mov	x0, x22
  9f649c: 94010ca4     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f64a0: aa1503e0     	mov	x0, x21
  9f64a4: 97e7272e     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f64a8: 17fffff1     	b	0x9f646c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x610>
  9f64ac: aa0003f3     	mov	x19, x0
  9f64b0: 17ffffef     	b	0x9f646c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x610>
  9f64b4: aa0003f3     	mov	x19, x0
  9f64b8: aa1603e0     	mov	x0, x22
  9f64bc: 94010c9c     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f64c0: f94073b4     	ldr	x20, [x29, #0xe0]
  9f64c4: f94077b5     	ldr	x21, [x29, #0xe8]
  9f64c8: eb15029f     	cmp	x20, x21
  9f64cc: 540000e0     	b.eq	0x9f64e8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x68c>
  9f64d0: aa1403e0     	mov	x0, x20
  9f64d4: 91004294     	add	x20, x20, #0x10
  9f64d8: 94010c95     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f64dc: 17fffffb     	b	0x9f64c8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x66c>
  9f64e0: aa0003f3     	mov	x19, x0
  9f64e4: 17fffff7     	b	0x9f64c0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x664>
  9f64e8: f94073a0     	ldr	x0, [x29, #0xe0]
  9f64ec: b4fffc00     	cbz	x0, 0x9f646c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x610>
  9f64f0: 94061686     	bl	0xb7bf08 <_ZdlPv>
  9f64f4: 17ffffde     	b	0x9f646c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x610>
  9f64f8: aa0003f3     	mov	x19, x0
  9f64fc: 17ffffe9     	b	0x9f64a0 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x644>
  9f6500: aa0003f3     	mov	x19, x0
  9f6504: aa1803e0     	mov	x0, x24
  9f6508: 94010c89     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f650c: 17ffffd6     	b	0x9f6464 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x608>
  9f6510: aa1703e0     	mov	x0, x23
  9f6514: aa1603e1     	mov	x1, x22
  9f6518: 97e72c04     	bl	0x3c1528 <_ZNSt6vectorIN7cocos2d5ValueESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_>
  9f651c: 17ffff92     	b	0x9f6364 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x508>
  9f6520: aa0003f3     	mov	x19, x0
  9f6524: aa1603e0     	mov	x0, x22
  9f6528: 94010c81     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f652c: f94073b4     	ldr	x20, [x29, #0xe0]
  9f6530: f94077b5     	ldr	x21, [x29, #0xe8]
  9f6534: eb1402bf     	cmp	x21, x20
  9f6538: 54fffd80     	b.eq	0x9f64e8 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x68c>
  9f653c: aa1403e0     	mov	x0, x20
  9f6540: 91004294     	add	x20, x20, #0x10
  9f6544: 94010c7a     	bl	0xa3972c <_ZN7cocos2d5ValueD2Ev>
  9f6548: 17fffffb     	b	0x9f6534 <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x6d8>
  9f654c: aa0003f3     	mov	x19, x0
  9f6550: 17fffff7     	b	0x9f652c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x6d0>
  9f6554: f85f8002     	ldur	x2, [x0, #-0x8]
  9f6558: 91080042     	add	x2, x2, #0x200
  9f655c: 17ffff70     	b	0x9f631c <_ZN7cocos2d9DictMaker12startElementEPvPKcPS3_+0x4c0>

00000000009f6560 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs>:
  9f6560: a9b57bfd     	stp	x29, x30, [sp, #-0xb0]!
  9f6564: 910003fd     	mov	x29, sp
  9f6568: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f656c: d0002a53     	adrp	x19, 0xf40000
  9f6570: f9400002     	ldr	x2, [x0]
  9f6574: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f6578: 910143b5     	add	x21, x29, #0x50
  9f657c: f90023f9     	str	x25, [sp, #0x40]
  9f6580: f940e663     	ldr	x3, [x19, #0x1c8]
  9f6584: aa1503e8     	mov	x8, x21
  9f6588: f9402042     	ldr	x2, [x2, #0x40]
  9f658c: aa0003f6     	mov	x22, x0
  9f6590: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f6594: f9400063     	ldr	x3, [x3]
  9f6598: f0002a94     	adrp	x20, 0xf49000
  9f659c: f90057a3     	str	x3, [x29, #0xa8]
  9f65a0: d63f0040     	blr	x2
  9f65a4: f9402ba1     	ldr	x1, [x29, #0x50]
  9f65a8: f85e8020     	ldur	x0, [x1, #-0x18]
  9f65ac: b5000200     	cbnz	x0, 0x9f65ec <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x8c>
  9f65b0: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f65b4: d1006020     	sub	x0, x1, #0x18
  9f65b8: eb14001f     	cmp	x0, x20
  9f65bc: 54000e01     	b.ne	0x9f677c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x21c>
  9f65c0: f940e673     	ldr	x19, [x19, #0x1c8]
  9f65c4: f94057a1     	ldr	x1, [x29, #0xa8]
  9f65c8: f9400260     	ldr	x0, [x19]
  9f65cc: eb00003f     	cmp	x1, x0
  9f65d0: 540014c1     	b.ne	0x9f6868 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x308>
  9f65d4: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f65d8: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f65dc: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f65e0: f94023f9     	ldr	x25, [sp, #0x40]
  9f65e4: a8cb7bfd     	ldp	x29, x30, [sp], #0xb0
  9f65e8: d65f03c0     	ret
  9f65ec: 97e6dfbc     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  9f65f0: f9400002     	ldr	x2, [x0]
  9f65f4: 9101c3b7     	add	x23, x29, #0x70
  9f65f8: aa1703e8     	mov	x8, x23
  9f65fc: aa1503e1     	mov	x1, x21
  9f6600: f9405442     	ldr	x2, [x2, #0xa8]
  9f6604: d63f0040     	blr	x2
  9f6608: f94047a0     	ldr	x0, [x29, #0x88]
  9f660c: b4000b00     	cbz	x0, 0x9f676c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x20c>
  9f6610: 910163b5     	add	x21, x29, #0x58
  9f6614: 910183b8     	add	x24, x29, #0x60
  9f6618: b00012c1     	adrp	x1, 0xc4f000 <_ZTSN10cocostudio12ButtonReaderE+0x170>
  9f661c: aa1503e0     	mov	x0, x21
  9f6620: 9100c021     	add	x1, x1, #0x30
  9f6624: aa1803e2     	mov	x2, x24
  9f6628: f0002a94     	adrp	x20, 0xf49000
  9f662c: 94074269     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6630: aa1703e0     	mov	x0, x23
  9f6634: aa1503e1     	mov	x1, x21
  9f6638: 97ea8dc7     	bl	0x499d54 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixEOSs>
  9f663c: 940103af     	bl	0xa374f8 <_ZN7cocos2d5Value10asValueMapEv>
  9f6640: f9402fa1     	ldr	x1, [x29, #0x58]
  9f6644: aa0003f9     	mov	x25, x0
  9f6648: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f664c: d1006020     	sub	x0, x1, #0x18
  9f6650: eb02001f     	cmp	x0, x2
  9f6654: 54000b61     	b.ne	0x9f67c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x260>
  9f6658: b00013e1     	adrp	x1, 0xc73000 <dtls1_version_str+0x2150>
  9f665c: aa1803e0     	mov	x0, x24
  9f6660: 91380021     	add	x1, x1, #0xe00
  9f6664: aa1503e2     	mov	x2, x21
  9f6668: 9407425a     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f666c: aa1903e0     	mov	x0, x25
  9f6670: aa1803e1     	mov	x1, x24
  9f6674: 97ea8db8     	bl	0x499d54 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixEOSs>
  9f6678: 94010118     	bl	0xa36ad8 <_ZNK7cocos2d5Value5asIntEv>
  9f667c: f94033a1     	ldr	x1, [x29, #0x60]
  9f6680: 2a0003f9     	mov	w25, w0
  9f6684: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f6688: d1006020     	sub	x0, x1, #0x18
  9f668c: eb02001f     	cmp	x0, x2
  9f6690: 54000b21     	b.ne	0x9f67f4 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x294>
  9f6694: 7100073f     	cmp	w25, #0x1
  9f6698: 540002a0     	b.eq	0x9f66ec <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x18c>
  9f669c: aa1703e0     	mov	x0, x23
  9f66a0: 97e726af     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f66a4: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f66a8: f9402ba1     	ldr	x1, [x29, #0x50]
  9f66ac: d1006020     	sub	x0, x1, #0x18
  9f66b0: eb14001f     	cmp	x0, x20
  9f66b4: 54fff860     	b.eq	0x9f65c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x60>
  9f66b8: d0002a62     	adrp	x2, 0xf44000
  9f66bc: f9445042     	ldr	x2, [x2, #0x8a0]
  9f66c0: b4000c42     	cbz	x2, 0x9f6848 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2e8>
  9f66c4: d1002021     	sub	x1, x1, #0x8
  9f66c8: 885ffc22     	ldaxr	w2, [x1]
  9f66cc: 51000443     	sub	w3, w2, #0x1
  9f66d0: 8804fc23     	stlxr	w4, w3, [x1]
  9f66d4: 35ffffa4     	cbnz	w4, 0x9f66c8 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x168>
  9f66d8: 6b1f005f     	cmp	w2, wzr
  9f66dc: 54fff72c     	b.gt	0x9f65c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x60>
  9f66e0: aa1703e1     	mov	x1, x23
  9f66e4: 94075036     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f66e8: 17ffffb6     	b	0x9f65c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x60>
  9f66ec: f94002c3     	ldr	x3, [x22]
  9f66f0: 9101a3b9     	add	x25, x29, #0x68
  9f66f4: f00015c1     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f66f8: aa1503e2     	mov	x2, x21
  9f66fc: aa1903e0     	mov	x0, x25
  9f6700: 910b2021     	add	x1, x1, #0x2c8
  9f6704: f9402875     	ldr	x21, [x3, #0x50]
  9f6708: 94074232     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f670c: aa1703e0     	mov	x0, x23
  9f6710: aa1903e1     	mov	x1, x25
  9f6714: 97ea8d90     	bl	0x499d54 <_ZNSt8__detail9_Map_baseISsSt4pairIKSsN7cocos2d5ValueEESaIS5_ENS_10_Select1stESt8equal_toISsESt4hashISsENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb1ELb0ELb1EEELb1EEixEOSs>
  9f6718: 94010378     	bl	0xa374f8 <_ZN7cocos2d5Value10asValueMapEv>
  9f671c: aa0003e1     	mov	x1, x0
  9f6720: aa1603e0     	mov	x0, x22
  9f6724: d63f02a0     	blr	x21
  9f6728: f94037a1     	ldr	x1, [x29, #0x68]
  9f672c: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f6730: d1006020     	sub	x0, x1, #0x18
  9f6734: eb02001f     	cmp	x0, x2
  9f6738: 540001a0     	b.eq	0x9f676c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x20c>
  9f673c: d0002a62     	adrp	x2, 0xf44000
  9f6740: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6744: b40008a2     	cbz	x2, 0x9f6858 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2f8>
  9f6748: d1002021     	sub	x1, x1, #0x8
  9f674c: 885ffc22     	ldaxr	w2, [x1]
  9f6750: 51000443     	sub	w3, w2, #0x1
  9f6754: 8804fc23     	stlxr	w4, w3, [x1]
  9f6758: 35ffffa4     	cbnz	w4, 0x9f674c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x1ec>
  9f675c: 6b1f005f     	cmp	w2, wzr
  9f6760: 5400006c     	b.gt	0x9f676c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x20c>
  9f6764: aa1803e1     	mov	x1, x24
  9f6768: 94075015     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f676c: aa1703e0     	mov	x0, x23
  9f6770: 97e7267b     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f6774: f9402ba1     	ldr	x1, [x29, #0x50]
  9f6778: 17ffff8e     	b	0x9f65b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x50>
  9f677c: d0002a62     	adrp	x2, 0xf44000
  9f6780: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6784: b4000162     	cbz	x2, 0x9f67b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x250>
  9f6788: d1002021     	sub	x1, x1, #0x8
  9f678c: 885ffc22     	ldaxr	w2, [x1]
  9f6790: 51000443     	sub	w3, w2, #0x1
  9f6794: 8804fc23     	stlxr	w4, w3, [x1]
  9f6798: 35ffffa4     	cbnz	w4, 0x9f678c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x22c>
  9f679c: 6b1f005f     	cmp	w2, wzr
  9f67a0: 54fff10c     	b.gt	0x9f65c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x60>
  9f67a4: 9101c3a1     	add	x1, x29, #0x70
  9f67a8: 94075005     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f67ac: 17ffff85     	b	0x9f65c0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x60>
  9f67b0: b85f8022     	ldur	w2, [x1, #-0x8]
  9f67b4: 51000443     	sub	w3, w2, #0x1
  9f67b8: b81f8023     	stur	w3, [x1, #-0x8]
  9f67bc: 17fffff8     	b	0x9f679c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x23c>
  9f67c0: d0002a62     	adrp	x2, 0xf44000
  9f67c4: f9445042     	ldr	x2, [x2, #0x8a0]
  9f67c8: b4000302     	cbz	x2, 0x9f6828 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2c8>
  9f67cc: d1002021     	sub	x1, x1, #0x8
  9f67d0: 885ffc22     	ldaxr	w2, [x1]
  9f67d4: 51000443     	sub	w3, w2, #0x1
  9f67d8: 8804fc23     	stlxr	w4, w3, [x1]
  9f67dc: 35ffffa4     	cbnz	w4, 0x9f67d0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x270>
  9f67e0: 6b1f005f     	cmp	w2, wzr
  9f67e4: 54fff3ac     	b.gt	0x9f6658 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0xf8>
  9f67e8: 9101a3a1     	add	x1, x29, #0x68
  9f67ec: 94074ff4     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f67f0: 17ffff9a     	b	0x9f6658 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0xf8>
  9f67f4: d0002a62     	adrp	x2, 0xf44000
  9f67f8: f9445042     	ldr	x2, [x2, #0x8a0]
  9f67fc: b40001e2     	cbz	x2, 0x9f6838 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2d8>
  9f6800: d1002021     	sub	x1, x1, #0x8
  9f6804: 885ffc22     	ldaxr	w2, [x1]
  9f6808: 51000443     	sub	w3, w2, #0x1
  9f680c: 8804fc23     	stlxr	w4, w3, [x1]
  9f6810: 35ffffa4     	cbnz	w4, 0x9f6804 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2a4>
  9f6814: 6b1f005f     	cmp	w2, wzr
  9f6818: 54fff3ec     	b.gt	0x9f6694 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x134>
  9f681c: 9101a3a1     	add	x1, x29, #0x68
  9f6820: 94074fe7     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6824: 17ffff9c     	b	0x9f6694 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x134>
  9f6828: b85f8022     	ldur	w2, [x1, #-0x8]
  9f682c: 51000443     	sub	w3, w2, #0x1
  9f6830: b81f8023     	stur	w3, [x1, #-0x8]
  9f6834: 17ffffeb     	b	0x9f67e0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x280>
  9f6838: b85f8022     	ldur	w2, [x1, #-0x8]
  9f683c: 51000443     	sub	w3, w2, #0x1
  9f6840: b81f8023     	stur	w3, [x1, #-0x8]
  9f6844: 17fffff4     	b	0x9f6814 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x2b4>
  9f6848: b85f8022     	ldur	w2, [x1, #-0x8]
  9f684c: 51000443     	sub	w3, w2, #0x1
  9f6850: b81f8023     	stur	w3, [x1, #-0x8]
  9f6854: 17ffffa1     	b	0x9f66d8 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x178>
  9f6858: b85f8022     	ldur	w2, [x1, #-0x8]
  9f685c: 51000443     	sub	w3, w2, #0x1
  9f6860: b81f8023     	stur	w3, [x1, #-0x8]
  9f6864: 17ffffbe     	b	0x9f675c <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x1fc>
  9f6868: 97e692ce     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f686c: aa0003f3     	mov	x19, x0
  9f6870: f0002a94     	adrp	x20, 0xf49000
  9f6874: f9402ba0     	ldr	x0, [x29, #0x50]
  9f6878: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f687c: d1006000     	sub	x0, x0, #0x18
  9f6880: eb14001f     	cmp	x0, x20
  9f6884: 54000060     	b.eq	0x9f6890 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x330>
  9f6888: 9101c3a1     	add	x1, x29, #0x70
  9f688c: 97e6a2fd     	bl	0x39f480 <.text+0x3170>
  9f6890: aa1303e0     	mov	x0, x19
  9f6894: 9407b193     	bl	0xbe2ee0 <_Unwind_Resume>
  9f6898: aa0003f3     	mov	x19, x0
  9f689c: f94033a0     	ldr	x0, [x29, #0x60]
  9f68a0: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f68a4: d1006000     	sub	x0, x0, #0x18
  9f68a8: eb01001f     	cmp	x0, x1
  9f68ac: 540002c1     	b.ne	0x9f6904 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x3a4>
  9f68b0: aa1303e1     	mov	x1, x19
  9f68b4: aa1703e0     	mov	x0, x23
  9f68b8: aa0103f3     	mov	x19, x1
  9f68bc: 97e72628     	bl	0x3c015c <_ZNSt10_HashtableISsSt4pairIKSsN7cocos2d5ValueEESaIS4_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS6_18_Mod_range_hashingENS6_20_Default_ranged_hashENS6_20_Prime_rehash_policyENS6_17_Hashtable_traitsILb1ELb0ELb1EEEED2Ev>
  9f68c0: 17ffffed     	b	0x9f6874 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x314>
  9f68c4: aa0003f3     	mov	x19, x0
  9f68c8: f94037a0     	ldr	x0, [x29, #0x68]
  9f68cc: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f68d0: d1006000     	sub	x0, x0, #0x18
  9f68d4: eb01001f     	cmp	x0, x1
  9f68d8: 54fffec0     	b.eq	0x9f68b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x350>
  9f68dc: aa1803e1     	mov	x1, x24
  9f68e0: 97e6a2e8     	bl	0x39f480 <.text+0x3170>
  9f68e4: 17fffff3     	b	0x9f68b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x350>
  9f68e8: f0002a94     	adrp	x20, 0xf49000
  9f68ec: aa0003f3     	mov	x19, x0
  9f68f0: f9402fa0     	ldr	x0, [x29, #0x58]
  9f68f4: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f68f8: d1006000     	sub	x0, x0, #0x18
  9f68fc: eb01001f     	cmp	x0, x1
  9f6900: 54fffd80     	b.eq	0x9f68b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x350>
  9f6904: 9101a3a1     	add	x1, x29, #0x68
  9f6908: 97e6a2de     	bl	0x39f480 <.text+0x3170>
  9f690c: 17ffffe9     	b	0x9f68b0 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x350>
  9f6910: aa0003e1     	mov	x1, x0
  9f6914: 17ffffe8     	b	0x9f68b4 <_ZN7cocos2d9FileUtils36loadFilenameLookupDictionaryFromFileERKSs+0x354>

00000000009f6918 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_>:
  9f6918: a9b87bfd     	stp	x29, x30, [sp, #-0x80]!
  9f691c: 910003fd     	mov	x29, sp
  9f6920: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f6924: d0002a54     	adrp	x20, 0xf40000
  9f6928: f9002bfb     	str	x27, [sp, #0x50]
  9f692c: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f6930: aa0003fa     	mov	x26, x0
  9f6934: d2800400     	mov	x0, #0x20               // =32
  9f6938: f940e681     	ldr	x1, [x20, #0x1c8]
  9f693c: 9101c3b9     	add	x25, x29, #0x70
  9f6940: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f6944: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f6948: f9400021     	ldr	x1, [x1]
  9f694c: aa0203f7     	mov	x23, x2
  9f6950: f9003fa1     	str	x1, [x29, #0x78]
  9f6954: 94061c2d     	bl	0xb7da08 <_Znwm>
  9f6958: aa0003f5     	mov	x21, x0
  9f695c: aa0003f3     	mov	x19, x0
  9f6960: aa1903e2     	mov	x2, x25
  9f6964: f80086bf     	str	xzr, [x21], #0x8
  9f6968: f94002e1     	ldr	x1, [x23]
  9f696c: aa1503e0     	mov	x0, x21
  9f6970: 94074198     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6974: f94006e0     	ldr	x0, [x23, #0x8]
  9f6978: f0002a96     	adrp	x22, 0xf49000
  9f697c: f9000a60     	str	x0, [x19, #0x10]
  9f6980: d28d20e2     	mov	x2, #0x6907             // =26887
  9f6984: f2b8e1e2     	movk	x2, #0xc70f, lsl #16
  9f6988: f947eedb     	ldr	x27, [x22, #0xfd8]
  9f698c: 91006360     	add	x0, x27, #0x18
  9f6990: f90006e0     	str	x0, [x23, #0x8]
  9f6994: f9400660     	ldr	x0, [x19, #0x8]
  9f6998: f85e8001     	ldur	x1, [x0, #-0x18]
  9f699c: 94061bb9     	bl	0xb7d880 <_ZN9__gnu_cxx20recursive_init_errorD0Ev+0x24>
  9f69a0: f9400758     	ldr	x24, [x26, #0x8]
  9f69a4: aa0003f7     	mov	x23, x0
  9f69a8: aa1503e2     	mov	x2, x21
  9f69ac: aa1a03e0     	mov	x0, x26
  9f69b0: aa1703e3     	mov	x3, x23
  9f69b4: 9ad80ae1     	udiv	x1, x23, x24
  9f69b8: 9b18dc38     	msub	x24, x1, x24, x23
  9f69bc: aa1803e1     	mov	x1, x24
  9f69c0: 97e934c1     	bl	0x443cc4 <_ZNKSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE19_M_find_before_nodeEmRS1_m>
  9f69c4: b4000380     	cbz	x0, 0x9f6a34 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x11c>
  9f69c8: f9400015     	ldr	x21, [x0]
  9f69cc: b4000355     	cbz	x21, 0x9f6a34 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x11c>
  9f69d0: f9400a61     	ldr	x1, [x19, #0x10]
  9f69d4: d1006020     	sub	x0, x1, #0x18
  9f69d8: eb1b001f     	cmp	x0, x27
  9f69dc: 54000581     	b.ne	0x9f6a8c <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x174>
  9f69e0: f9400661     	ldr	x1, [x19, #0x8]
  9f69e4: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f69e8: d1006020     	sub	x0, x1, #0x18
  9f69ec: eb16001f     	cmp	x0, x22
  9f69f0: 54000341     	b.ne	0x9f6a58 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x140>
  9f69f4: aa1303e0     	mov	x0, x19
  9f69f8: 94061544     	bl	0xb7bf08 <_ZdlPv>
  9f69fc: aa1503e0     	mov	x0, x21
  9f6a00: d2800001     	mov	x1, #0x0                // =0
  9f6a04: f940e693     	ldr	x19, [x20, #0x1c8]
  9f6a08: f9403fa3     	ldr	x3, [x29, #0x78]
  9f6a0c: f9400262     	ldr	x2, [x19]
  9f6a10: eb02007f     	cmp	x3, x2
  9f6a14: 54000661     	b.ne	0x9f6ae0 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x1c8>
  9f6a18: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f6a1c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f6a20: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f6a24: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f6a28: f9402bfb     	ldr	x27, [sp, #0x50]
  9f6a2c: a8c87bfd     	ldp	x29, x30, [sp], #0x80
  9f6a30: d65f03c0     	ret
  9f6a34: aa1803e1     	mov	x1, x24
  9f6a38: aa1703e2     	mov	x2, x23
  9f6a3c: aa1a03e0     	mov	x0, x26
  9f6a40: aa1303e3     	mov	x3, x19
  9f6a44: 97e93409     	bl	0x443a68 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE21_M_insert_unique_nodeEmmPNS4_10_Hash_nodeIS2_Lb1EEE>
  9f6a48: d2800001     	mov	x1, #0x0                // =0
  9f6a4c: d2800022     	mov	x2, #0x1                // =1
  9f6a50: b3401c41     	bfxil	x1, x2, #0, #8
  9f6a54: 17ffffec     	b	0x9f6a04 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0xec>
  9f6a58: d0002a62     	adrp	x2, 0xf44000
  9f6a5c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6a60: b4000382     	cbz	x2, 0x9f6ad0 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x1b8>
  9f6a64: d1002021     	sub	x1, x1, #0x8
  9f6a68: 885ffc22     	ldaxr	w2, [x1]
  9f6a6c: 51000443     	sub	w3, w2, #0x1
  9f6a70: 8804fc23     	stlxr	w4, w3, [x1]
  9f6a74: 35ffffa4     	cbnz	w4, 0x9f6a68 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x150>
  9f6a78: 6b1f005f     	cmp	w2, wzr
  9f6a7c: 54fffbcc     	b.gt	0x9f69f4 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0xdc>
  9f6a80: aa1903e1     	mov	x1, x25
  9f6a84: 94074f4e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6a88: 17ffffdb     	b	0x9f69f4 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0xdc>
  9f6a8c: d0002a62     	adrp	x2, 0xf44000
  9f6a90: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6a94: b4000162     	cbz	x2, 0x9f6ac0 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x1a8>
  9f6a98: d1002021     	sub	x1, x1, #0x8
  9f6a9c: 885ffc22     	ldaxr	w2, [x1]
  9f6aa0: 51000443     	sub	w3, w2, #0x1
  9f6aa4: 8804fc23     	stlxr	w4, w3, [x1]
  9f6aa8: 35ffffa4     	cbnz	w4, 0x9f6a9c <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x184>
  9f6aac: 6b1f005f     	cmp	w2, wzr
  9f6ab0: 54fff98c     	b.gt	0x9f69e0 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0xc8>
  9f6ab4: aa1903e1     	mov	x1, x25
  9f6ab8: 94074f41     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6abc: 17ffffc9     	b	0x9f69e0 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0xc8>
  9f6ac0: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6ac4: 51000443     	sub	w3, w2, #0x1
  9f6ac8: b81f8023     	stur	w3, [x1, #-0x8]
  9f6acc: 17fffff8     	b	0x9f6aac <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x194>
  9f6ad0: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6ad4: 51000443     	sub	w3, w2, #0x1
  9f6ad8: b81f8023     	stur	w3, [x1, #-0x8]
  9f6adc: 17ffffe7     	b	0x9f6a78 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_+0x160>
  9f6ae0: 97e69230     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f6ae4: 940616b0     	bl	0xb7c5a4 <__cxa_begin_catch>
  9f6ae8: aa1303e0     	mov	x0, x19
  9f6aec: 94061507     	bl	0xb7bf08 <_ZdlPv>
  9f6af0: 94061a81     	bl	0xb7d4f4 <__cxa_rethrow>
  9f6af4: f90037a0     	str	x0, [x29, #0x68]
  9f6af8: 940616d3     	bl	0xb7c644 <__cxa_end_catch>
  9f6afc: f94037a0     	ldr	x0, [x29, #0x68]
  9f6b00: 9407b0f8     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f6b04 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs>:
  9f6b04: a9b37bfd     	stp	x29, x30, [sp, #-0xd0]!
  9f6b08: 910003fd     	mov	x29, sp
  9f6b0c: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f6b10: d0002a57     	adrp	x23, 0xf40000
  9f6b14: f9400022     	ldr	x2, [x1]
  9f6b18: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f6b1c: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f6b20: f940e6e3     	ldr	x3, [x23, #0x1c8]
  9f6b24: aa0103f3     	mov	x19, x1
  9f6b28: f85e8042     	ldur	x2, [x2, #-0x18]
  9f6b2c: aa0003f5     	mov	x21, x0
  9f6b30: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f6b34: f9400063     	ldr	x3, [x3]
  9f6b38: aa0803f9     	mov	x25, x8
  9f6b3c: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f6b40: f90067a3     	str	x3, [x29, #0xc8]
  9f6b44: b4000862     	cbz	x2, 0x9f6c50 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x14c>
  9f6b48: f9400002     	ldr	x2, [x0]
  9f6b4c: f9408042     	ldr	x2, [x2, #0x100]
  9f6b50: d63f0040     	blr	x2
  9f6b54: 53001c00     	uxtb	w0, w0
  9f6b58: 35000740     	cbnz	w0, 0x9f6c40 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x13c>
  9f6b5c: 910243b4     	add	x20, x29, #0x90
  9f6b60: aa1303e1     	mov	x1, x19
  9f6b64: aa1403e0     	mov	x0, x20
  9f6b68: f0002a96     	adrp	x22, 0xf49000
  9f6b6c: 94074f75     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f6b70: 97e6de5b     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  9f6b74: f9400002     	ldr	x2, [x0]
  9f6b78: f9404ba1     	ldr	x1, [x29, #0x90]
  9f6b7c: f940b842     	ldr	x2, [x2, #0x170]
  9f6b80: d63f0040     	blr	x2
  9f6b84: f9443aa1     	ldr	x1, [x21, #0x870]
  9f6b88: f9003fa1     	str	x1, [x29, #0x78]
  9f6b8c: aa0103e0     	mov	x0, x1
  9f6b90: 97e691c0     	bl	0x39b290 <strlen@plt>
  9f6b94: aa0003e2     	mov	x2, x0
  9f6b98: f9403fa1     	ldr	x1, [x29, #0x78]
  9f6b9c: aa1403e0     	mov	x0, x20
  9f6ba0: 94074a81     	bl	0xbc95a4 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4af7c>
  9f6ba4: 9102c3b4     	add	x20, x29, #0xb0
  9f6ba8: f9404ba1     	ldr	x1, [x29, #0x90]
  9f6bac: 910263a0     	add	x0, x29, #0x98
  9f6bb0: aa1403e2     	mov	x2, x20
  9f6bb4: aa0003f3     	mov	x19, x0
  9f6bb8: f9003ba0     	str	x0, [x29, #0x70]
  9f6bbc: 94074105     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6bc0: aa1303e1     	mov	x1, x19
  9f6bc4: 9123a2a0     	add	x0, x21, #0x8e8
  9f6bc8: f9003fa0     	str	x0, [x29, #0x78]
  9f6bcc: 97e7280a     	bl	0x3c0bf4 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE4findERS1_>
  9f6bd0: aa0003f3     	mov	x19, x0
  9f6bd4: f9404fa1     	ldr	x1, [x29, #0x98]
  9f6bd8: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6bdc: d1006020     	sub	x0, x1, #0x18
  9f6be0: eb02001f     	cmp	x0, x2
  9f6be4: 54001441     	b.ne	0x9f6e6c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x368>
  9f6be8: b4000413     	cbz	x19, 0x9f6c68 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x164>
  9f6bec: aa1903e0     	mov	x0, x25
  9f6bf0: 91004261     	add	x1, x19, #0x10
  9f6bf4: 94074f53     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f6bf8: f9404bb3     	ldr	x19, [x29, #0x90]
  9f6bfc: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f6c00: d1006274     	sub	x20, x19, #0x18
  9f6c04: eb16029f     	cmp	x20, x22
  9f6c08: 54001661     	b.ne	0x9f6ed4 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x3d0>
  9f6c0c: f940e6f7     	ldr	x23, [x23, #0x1c8]
  9f6c10: aa1903e0     	mov	x0, x25
  9f6c14: f94067a2     	ldr	x2, [x29, #0xc8]
  9f6c18: f94002e1     	ldr	x1, [x23]
  9f6c1c: eb01005f     	cmp	x2, x1
  9f6c20: 54001dc1     	b.ne	0x9f6fd8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4d4>
  9f6c24: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f6c28: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f6c2c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f6c30: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f6c34: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f6c38: a8cd7bfd     	ldp	x29, x30, [sp], #0xd0
  9f6c3c: d65f03c0     	ret
  9f6c40: aa1903e0     	mov	x0, x25
  9f6c44: aa1303e1     	mov	x1, x19
  9f6c48: 94074f3e     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f6c4c: 17fffff0     	b	0x9f6c0c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x108>
  9f6c50: b00013a1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f6c54: aa0803e0     	mov	x0, x8
  9f6c58: 91330021     	add	x1, x1, #0xcc0
  9f6c5c: 9102e3a2     	add	x2, x29, #0xb8
  9f6c60: 940740dc     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6c64: 17ffffea     	b	0x9f6c0c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x108>
  9f6c68: f94002a3     	ldr	x3, [x21]
  9f6c6c: 9102a3b8     	add	x24, x29, #0xa8
  9f6c70: f9404ba1     	ldr	x1, [x29, #0x90]
  9f6c74: aa1803e0     	mov	x0, x24
  9f6c78: aa1403e2     	mov	x2, x20
  9f6c7c: f940c873     	ldr	x19, [x3, #0x190]
  9f6c80: 940740d4     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6c84: 910283bc     	add	x28, x29, #0xa0
  9f6c88: aa1503e0     	mov	x0, x21
  9f6c8c: aa1c03e8     	mov	x8, x28
  9f6c90: aa1803e1     	mov	x1, x24
  9f6c94: d63f0260     	blr	x19
  9f6c98: f94057a1     	ldr	x1, [x29, #0xa8]
  9f6c9c: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6ca0: d1006020     	sub	x0, x1, #0x18
  9f6ca4: eb02001f     	cmp	x0, x2
  9f6ca8: 540015e1     	b.ne	0x9f6f64 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x460>
  9f6cac: f9446aa1     	ldr	x1, [x21, #0x8d0]
  9f6cb0: f947eec0     	ldr	x0, [x22, #0xfd8]
  9f6cb4: f94466ba     	ldr	x26, [x21, #0x8c8]
  9f6cb8: 91006000     	add	x0, x0, #0x18
  9f6cbc: f90037a1     	str	x1, [x29, #0x68]
  9f6cc0: f90057a0     	str	x0, [x29, #0xa8]
  9f6cc4: eb01035f     	cmp	x26, x1
  9f6cc8: 54000660     	b.eq	0x9f6d94 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x290>
  9f6ccc: 9102e3a0     	add	x0, x29, #0xb8
  9f6cd0: f90033a0     	str	x0, [x29, #0x60]
  9f6cd4: f9445ebb     	ldr	x27, [x21, #0x8b8]
  9f6cd8: f9445ab3     	ldr	x19, [x21, #0x8b0]
  9f6cdc: eb1b027f     	cmp	x19, x27
  9f6ce0: 54000101     	b.ne	0x9f6d00 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1fc>
  9f6ce4: 14000028     	b	0x9f6d84 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x280>
  9f6ce8: f9400300     	ldr	x0, [x24]
  9f6cec: f85e8000     	ldur	x0, [x0, #-0x18]
  9f6cf0: b50006a0     	cbnz	x0, 0x9f6dc4 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x2c0>
  9f6cf4: 91002273     	add	x19, x19, #0x8
  9f6cf8: eb13037f     	cmp	x27, x19
  9f6cfc: 54000440     	b.eq	0x9f6d84 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x280>
  9f6d00: f94002a4     	ldr	x4, [x21]
  9f6d04: aa1403e8     	mov	x8, x20
  9f6d08: aa1503e0     	mov	x0, x21
  9f6d0c: aa1c03e1     	mov	x1, x28
  9f6d10: aa1303e2     	mov	x2, x19
  9f6d14: aa1a03e3     	mov	x3, x26
  9f6d18: f940d484     	ldr	x4, [x4, #0x1a8]
  9f6d1c: d63f0080     	blr	x4
  9f6d20: aa1803e0     	mov	x0, x24
  9f6d24: aa1403e1     	mov	x1, x20
  9f6d28: 940744b1     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9f6d2c: f9400281     	ldr	x1, [x20]
  9f6d30: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6d34: d1006020     	sub	x0, x1, #0x18
  9f6d38: eb02001f     	cmp	x0, x2
  9f6d3c: 54fffd60     	b.eq	0x9f6ce8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1e4>
  9f6d40: d0002a62     	adrp	x2, 0xf44000
  9f6d44: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6d48: b4000162     	cbz	x2, 0x9f6d74 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x270>
  9f6d4c: d1002021     	sub	x1, x1, #0x8
  9f6d50: 885ffc22     	ldaxr	w2, [x1]
  9f6d54: 51000443     	sub	w3, w2, #0x1
  9f6d58: 8804fc23     	stlxr	w4, w3, [x1]
  9f6d5c: 35ffffa4     	cbnz	w4, 0x9f6d50 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x24c>
  9f6d60: 6b1f005f     	cmp	w2, wzr
  9f6d64: 54fffc2c     	b.gt	0x9f6ce8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1e4>
  9f6d68: f94033a1     	ldr	x1, [x29, #0x60]
  9f6d6c: 94074e94     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6d70: 17ffffde     	b	0x9f6ce8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1e4>
  9f6d74: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6d78: 51000443     	sub	w3, w2, #0x1
  9f6d7c: b81f8023     	stur	w3, [x1, #-0x8]
  9f6d80: 17fffff8     	b	0x9f6d60 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x25c>
  9f6d84: f94037a0     	ldr	x0, [x29, #0x68]
  9f6d88: 9100235a     	add	x26, x26, #0x8
  9f6d8c: eb1a001f     	cmp	x0, x26
  9f6d90: 54fffa21     	b.ne	0x9f6cd4 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1d0>
  9f6d94: f94002a1     	ldr	x1, [x21]
  9f6d98: aa1503e0     	mov	x0, x21
  9f6d9c: f9405021     	ldr	x1, [x1, #0xa0]
  9f6da0: d63f0020     	blr	x1
  9f6da4: 9102e3b3     	add	x19, x29, #0xb8
  9f6da8: b00013a1     	adrp	x1, 0xc6b000 <_ZTSN7cocos2d12experimental17PcmBufferProviderE+0x7c10>
  9f6dac: aa1903e0     	mov	x0, x25
  9f6db0: 91330021     	add	x1, x1, #0xcc0
  9f6db4: aa1303e2     	mov	x2, x19
  9f6db8: 94074086     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  9f6dbc: f94057a0     	ldr	x0, [x29, #0xa8]
  9f6dc0: 14000015     	b	0x9f6e14 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x310>
  9f6dc4: 9102e3b3     	add	x19, x29, #0xb8
  9f6dc8: f9404ba2     	ldr	x2, [x29, #0x90]
  9f6dcc: aa1803e1     	mov	x1, x24
  9f6dd0: 91002260     	add	x0, x19, #0x8
  9f6dd4: f9005fa2     	str	x2, [x29, #0xb8]
  9f6dd8: 94074eda     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f6ddc: f9403fa0     	ldr	x0, [x29, #0x78]
  9f6de0: 52800001     	mov	w1, #0x0                // =0
  9f6de4: aa1303e2     	mov	x2, x19
  9f6de8: 97fffecc     	bl	0x9f6918 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE10_M_emplaceIJS0_IPKcSsEEEES0_INS4_14_Node_iteratorIS2_Lb0ELb1EEEbESt17integral_constantIbLb1EEDpOT_>
  9f6dec: f94063a1     	ldr	x1, [x29, #0xc0]
  9f6df0: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6df4: d1006020     	sub	x0, x1, #0x18
  9f6df8: eb02001f     	cmp	x0, x2
  9f6dfc: 54000521     	b.ne	0x9f6ea0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x39c>
  9f6e00: f94057a0     	ldr	x0, [x29, #0xa8]
  9f6e04: f9000320     	str	x0, [x25]
  9f6e08: f947eec0     	ldr	x0, [x22, #0xfd8]
  9f6e0c: 91006000     	add	x0, x0, #0x18
  9f6e10: f90057a0     	str	x0, [x29, #0xa8]
  9f6e14: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6e18: d1006001     	sub	x1, x0, #0x18
  9f6e1c: eb02003f     	cmp	x1, x2
  9f6e20: 54000861     	b.ne	0x9f6f2c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x428>
  9f6e24: f94053a1     	ldr	x1, [x29, #0xa0]
  9f6e28: f947eec2     	ldr	x2, [x22, #0xfd8]
  9f6e2c: d1006020     	sub	x0, x1, #0x18
  9f6e30: eb02001f     	cmp	x0, x2
  9f6e34: 54ffee20     	b.eq	0x9f6bf8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0xf4>
  9f6e38: d0002a62     	adrp	x2, 0xf44000
  9f6e3c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6e40: b4000ac2     	cbz	x2, 0x9f6f98 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x494>
  9f6e44: d1002021     	sub	x1, x1, #0x8
  9f6e48: 885ffc22     	ldaxr	w2, [x1]
  9f6e4c: 51000443     	sub	w3, w2, #0x1
  9f6e50: 8804fc23     	stlxr	w4, w3, [x1]
  9f6e54: 35ffffa4     	cbnz	w4, 0x9f6e48 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x344>
  9f6e58: 6b1f005f     	cmp	w2, wzr
  9f6e5c: 54ffecec     	b.gt	0x9f6bf8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0xf4>
  9f6e60: aa1303e1     	mov	x1, x19
  9f6e64: 94074e56     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6e68: 17ffff64     	b	0x9f6bf8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0xf4>
  9f6e6c: d0002a62     	adrp	x2, 0xf44000
  9f6e70: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6e74: b40004c2     	cbz	x2, 0x9f6f0c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x408>
  9f6e78: d1002021     	sub	x1, x1, #0x8
  9f6e7c: 885ffc22     	ldaxr	w2, [x1]
  9f6e80: 51000443     	sub	w3, w2, #0x1
  9f6e84: 8804fc23     	stlxr	w4, w3, [x1]
  9f6e88: 35ffffa4     	cbnz	w4, 0x9f6e7c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x378>
  9f6e8c: 6b1f005f     	cmp	w2, wzr
  9f6e90: 54ffeacc     	b.gt	0x9f6be8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0xe4>
  9f6e94: 9102e3a1     	add	x1, x29, #0xb8
  9f6e98: 94074e49     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6e9c: 17ffff53     	b	0x9f6be8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0xe4>
  9f6ea0: d0002a62     	adrp	x2, 0xf44000
  9f6ea4: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6ea8: b4000802     	cbz	x2, 0x9f6fa8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4a4>
  9f6eac: d1002021     	sub	x1, x1, #0x8
  9f6eb0: 885ffc22     	ldaxr	w2, [x1]
  9f6eb4: 51000443     	sub	w3, w2, #0x1
  9f6eb8: 8804fc23     	stlxr	w4, w3, [x1]
  9f6ebc: 35ffffa4     	cbnz	w4, 0x9f6eb0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x3ac>
  9f6ec0: 6b1f005f     	cmp	w2, wzr
  9f6ec4: 54fff9ec     	b.gt	0x9f6e00 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x2fc>
  9f6ec8: aa1403e1     	mov	x1, x20
  9f6ecc: 94074e3c     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6ed0: 17ffffcc     	b	0x9f6e00 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x2fc>
  9f6ed4: d0002a60     	adrp	x0, 0xf44000
  9f6ed8: f9445000     	ldr	x0, [x0, #0x8a0]
  9f6edc: b4000200     	cbz	x0, 0x9f6f1c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x418>
  9f6ee0: d1002273     	sub	x19, x19, #0x8
  9f6ee4: 885ffe60     	ldaxr	w0, [x19]
  9f6ee8: 51000401     	sub	w1, w0, #0x1
  9f6eec: 8802fe61     	stlxr	w2, w1, [x19]
  9f6ef0: 35ffffa2     	cbnz	w2, 0x9f6ee4 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x3e0>
  9f6ef4: 6b1f001f     	cmp	w0, wzr
  9f6ef8: 54ffe8ac     	b.gt	0x9f6c0c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x108>
  9f6efc: aa1403e0     	mov	x0, x20
  9f6f00: 9102e3a1     	add	x1, x29, #0xb8
  9f6f04: 94074e2e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6f08: 17ffff41     	b	0x9f6c0c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x108>
  9f6f0c: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6f10: 51000443     	sub	w3, w2, #0x1
  9f6f14: b81f8023     	stur	w3, [x1, #-0x8]
  9f6f18: 17ffffdd     	b	0x9f6e8c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x388>
  9f6f1c: b85f8260     	ldur	w0, [x19, #-0x8]
  9f6f20: 51000401     	sub	w1, w0, #0x1
  9f6f24: b81f8261     	stur	w1, [x19, #-0x8]
  9f6f28: 17fffff3     	b	0x9f6ef4 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x3f0>
  9f6f2c: d0002a62     	adrp	x2, 0xf44000
  9f6f30: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6f34: b4000422     	cbz	x2, 0x9f6fb8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4b4>
  9f6f38: d1002000     	sub	x0, x0, #0x8
  9f6f3c: 885ffc02     	ldaxr	w2, [x0]
  9f6f40: 51000443     	sub	w3, w2, #0x1
  9f6f44: 8804fc03     	stlxr	w4, w3, [x0]
  9f6f48: 35ffffa4     	cbnz	w4, 0x9f6f3c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x438>
  9f6f4c: 6b1f005f     	cmp	w2, wzr
  9f6f50: 54fff6ac     	b.gt	0x9f6e24 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x320>
  9f6f54: aa0103e0     	mov	x0, x1
  9f6f58: aa1303e1     	mov	x1, x19
  9f6f5c: 94074e18     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6f60: 17ffffb1     	b	0x9f6e24 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x320>
  9f6f64: d0002a62     	adrp	x2, 0xf44000
  9f6f68: f9445042     	ldr	x2, [x2, #0x8a0]
  9f6f6c: b40002e2     	cbz	x2, 0x9f6fc8 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4c4>
  9f6f70: d1002021     	sub	x1, x1, #0x8
  9f6f74: 885ffc22     	ldaxr	w2, [x1]
  9f6f78: 51000443     	sub	w3, w2, #0x1
  9f6f7c: 8804fc23     	stlxr	w4, w3, [x1]
  9f6f80: 35ffffa4     	cbnz	w4, 0x9f6f74 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x470>
  9f6f84: 6b1f005f     	cmp	w2, wzr
  9f6f88: 54ffe92c     	b.gt	0x9f6cac <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1a8>
  9f6f8c: 9102e3a1     	add	x1, x29, #0xb8
  9f6f90: 94074e0b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f6f94: 17ffff46     	b	0x9f6cac <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x1a8>
  9f6f98: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6f9c: 51000443     	sub	w3, w2, #0x1
  9f6fa0: b81f8023     	stur	w3, [x1, #-0x8]
  9f6fa4: 17ffffad     	b	0x9f6e58 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x354>
  9f6fa8: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6fac: 51000443     	sub	w3, w2, #0x1
  9f6fb0: b81f8023     	stur	w3, [x1, #-0x8]
  9f6fb4: 17ffffc3     	b	0x9f6ec0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x3bc>
  9f6fb8: b85f8002     	ldur	w2, [x0, #-0x8]
  9f6fbc: 51000443     	sub	w3, w2, #0x1
  9f6fc0: b81f8003     	stur	w3, [x0, #-0x8]
  9f6fc4: 17ffffe2     	b	0x9f6f4c <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x448>
  9f6fc8: b85f8022     	ldur	w2, [x1, #-0x8]
  9f6fcc: 51000443     	sub	w3, w2, #0x1
  9f6fd0: b81f8023     	stur	w3, [x1, #-0x8]
  9f6fd4: 17ffffec     	b	0x9f6f84 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x480>
  9f6fd8: 97e690f2     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f6fdc: aa0003f3     	mov	x19, x0
  9f6fe0: f94057a0     	ldr	x0, [x29, #0xa8]
  9f6fe4: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f6fe8: d1006000     	sub	x0, x0, #0x18
  9f6fec: eb01001f     	cmp	x0, x1
  9f6ff0: 54000060     	b.eq	0x9f6ffc <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4f8>
  9f6ff4: f9403ba1     	ldr	x1, [x29, #0x70]
  9f6ff8: 97e6a122     	bl	0x39f480 <.text+0x3170>
  9f6ffc: f94053a0     	ldr	x0, [x29, #0xa0]
  9f7000: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f7004: d1006000     	sub	x0, x0, #0x18
  9f7008: eb01001f     	cmp	x0, x1
  9f700c: 54000060     	b.eq	0x9f7018 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x514>
  9f7010: aa1803e1     	mov	x1, x24
  9f7014: 97e6a11b     	bl	0x39f480 <.text+0x3170>
  9f7018: f9404ba0     	ldr	x0, [x29, #0x90]
  9f701c: f947eed6     	ldr	x22, [x22, #0xfd8]
  9f7020: d1006000     	sub	x0, x0, #0x18
  9f7024: eb16001f     	cmp	x0, x22
  9f7028: 54000060     	b.eq	0x9f7034 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x530>
  9f702c: 910223a1     	add	x1, x29, #0x88
  9f7030: 97e6a114     	bl	0x39f480 <.text+0x3170>
  9f7034: aa1303e0     	mov	x0, x19
  9f7038: 9407afaa     	bl	0xbe2ee0 <_Unwind_Resume>
  9f703c: aa0003f3     	mov	x19, x0
  9f7040: f94057a0     	ldr	x0, [x29, #0xa8]
  9f7044: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f7048: d1006000     	sub	x0, x0, #0x18
  9f704c: eb01001f     	cmp	x0, x1
  9f7050: 54fffe40     	b.eq	0x9f7018 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x514>
  9f7054: 9102e3a1     	add	x1, x29, #0xb8
  9f7058: 97e6a10a     	bl	0x39f480 <.text+0x3170>
  9f705c: 17ffffef     	b	0x9f7018 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x514>
  9f7060: aa0003f3     	mov	x19, x0
  9f7064: f94063a0     	ldr	x0, [x29, #0xc0]
  9f7068: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f706c: d1006000     	sub	x0, x0, #0x18
  9f7070: eb01001f     	cmp	x0, x1
  9f7074: 54fffb60     	b.eq	0x9f6fe0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4dc>
  9f7078: aa1403e1     	mov	x1, x20
  9f707c: 97e6a101     	bl	0x39f480 <.text+0x3170>
  9f7080: 17ffffd8     	b	0x9f6fe0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4dc>
  9f7084: aa0003f3     	mov	x19, x0
  9f7088: f9405ba0     	ldr	x0, [x29, #0xb0]
  9f708c: f947eec1     	ldr	x1, [x22, #0xfd8]
  9f7090: d1006000     	sub	x0, x0, #0x18
  9f7094: eb01001f     	cmp	x0, x1
  9f7098: 54fffa40     	b.eq	0x9f6fe0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4dc>
  9f709c: 9102e3a1     	add	x1, x29, #0xb8
  9f70a0: 97e6a0f8     	bl	0x39f480 <.text+0x3170>
  9f70a4: 17ffffcf     	b	0x9f6fe0 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x4dc>
  9f70a8: aa0003f3     	mov	x19, x0
  9f70ac: 17ffffdb     	b	0x9f7018 <_ZNK7cocos2d9FileUtils19fullPathForFilenameERKSs+0x514>

00000000009f70b0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs>:
  9f70b0: b0002a42     	adrp	x2, 0xf40000
  9f70b4: a9b47bfd     	stp	x29, x30, [sp, #-0xc0]!
  9f70b8: 910003fd     	mov	x29, sp
  9f70bc: f940e443     	ldr	x3, [x2, #0x1c8]
  9f70c0: f9400002     	ldr	x2, [x0]
  9f70c4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f70c8: f9400063     	ldr	x3, [x3]
  9f70cc: aa0003f3     	mov	x19, x0
  9f70d0: f9408042     	ldr	x2, [x2, #0x100]
  9f70d4: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f70d8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f70dc: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f70e0: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f70e4: f9005fa3     	str	x3, [x29, #0xb8]
  9f70e8: aa0103fb     	mov	x27, x1
  9f70ec: d63f0040     	blr	x2
  9f70f0: 53001c00     	uxtb	w0, w0
  9f70f4: 35001220     	cbnz	w0, 0x9f7338 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x288>
  9f70f8: 9123a260     	add	x0, x19, #0x8e8
  9f70fc: aa1b03e1     	mov	x1, x27
  9f7100: f9003ba0     	str	x0, [x29, #0x70]
  9f7104: 97e726bc     	bl	0x3c0bf4 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE4findERS1_>
  9f7108: aa0003e1     	mov	x1, x0
  9f710c: b40002a0     	cbz	x0, 0x9f7160 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0xb0>
  9f7110: f9400262     	ldr	x2, [x19]
  9f7114: aa1303e0     	mov	x0, x19
  9f7118: 91004021     	add	x1, x1, #0x10
  9f711c: f940d042     	ldr	x2, [x2, #0x1a0]
  9f7120: d63f0040     	blr	x2
  9f7124: 53001c19     	uxtb	w25, w0
  9f7128: b0002a40     	adrp	x0, 0xf40000
  9f712c: f9405fa2     	ldr	x2, [x29, #0xb8]
  9f7130: f940e401     	ldr	x1, [x0, #0x1c8]
  9f7134: 2a1903e0     	mov	w0, w25
  9f7138: f9400021     	ldr	x1, [x1]
  9f713c: eb01005f     	cmp	x2, x1
  9f7140: 54002681     	b.ne	0x9f7610 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x560>
  9f7144: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7148: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f714c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f7150: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f7154: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f7158: a8cc7bfd     	ldp	x29, x30, [sp], #0xc0
  9f715c: d65f03c0     	ret
  9f7160: d0002a94     	adrp	x20, 0xf49000
  9f7164: f9446a60     	ldr	x0, [x19, #0x8d0]
  9f7168: f944667c     	ldr	x28, [x19, #0x8c8]
  9f716c: f90037a0     	str	x0, [x29, #0x68]
  9f7170: f947ee96     	ldr	x22, [x20, #0xfd8]
  9f7174: eb00039f     	cmp	x28, x0
  9f7178: 910062d5     	add	x21, x22, #0x18
  9f717c: f9004bb5     	str	x21, [x29, #0x90]
  9f7180: 54002420     	b.eq	0x9f7604 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x554>
  9f7184: 910223a0     	add	x0, x29, #0x88
  9f7188: 910263b6     	add	x22, x29, #0x98
  9f718c: 9102a3b7     	add	x23, x29, #0xa8
  9f7190: 910283b8     	add	x24, x29, #0xa0
  9f7194: 910243ba     	add	x26, x29, #0x90
  9f7198: f90033a0     	str	x0, [x29, #0x60]
  9f719c: f9445e60     	ldr	x0, [x19, #0x8b8]
  9f71a0: f9445a75     	ldr	x21, [x19, #0x8b0]
  9f71a4: f9003fa0     	str	x0, [x29, #0x78]
  9f71a8: eb0002bf     	cmp	x21, x0
  9f71ac: 540002e1     	b.ne	0x9f7208 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x158>
  9f71b0: 14000075     	b	0x9f7384 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2d4>
  9f71b4: f94002e1     	ldr	x1, [x23]
  9f71b8: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f71bc: d1006020     	sub	x0, x1, #0x18
  9f71c0: eb02001f     	cmp	x0, x2
  9f71c4: 540007e1     	b.ne	0x9f72c0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x210>
  9f71c8: f94002c1     	ldr	x1, [x22]
  9f71cc: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f71d0: d1006020     	sub	x0, x1, #0x18
  9f71d4: eb02001f     	cmp	x0, x2
  9f71d8: 54000961     	b.ne	0x9f7304 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x254>
  9f71dc: f9400262     	ldr	x2, [x19]
  9f71e0: aa1303e0     	mov	x0, x19
  9f71e4: aa1a03e1     	mov	x1, x26
  9f71e8: f940d042     	ldr	x2, [x2, #0x1a0]
  9f71ec: d63f0040     	blr	x2
  9f71f0: 53001c19     	uxtb	w25, w0
  9f71f4: 35000d79     	cbnz	w25, 0x9f73a0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2f0>
  9f71f8: f9403fa0     	ldr	x0, [x29, #0x78]
  9f71fc: 910022b5     	add	x21, x21, #0x8
  9f7200: eb15001f     	cmp	x0, x21
  9f7204: 54000c00     	b.eq	0x9f7384 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2d4>
  9f7208: f9400262     	ldr	x2, [x19]
  9f720c: aa1603e0     	mov	x0, x22
  9f7210: aa1c03e1     	mov	x1, x28
  9f7214: f9402059     	ldr	x25, [x2, #0x40]
  9f7218: 94074dca     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f721c: aa1603e0     	mov	x0, x22
  9f7220: aa1b03e1     	mov	x1, x27
  9f7224: 94074202     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9f7228: aa1603e0     	mov	x0, x22
  9f722c: aa1503e1     	mov	x1, x21
  9f7230: 940741ff     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  9f7234: aa0003e3     	mov	x3, x0
  9f7238: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f723c: aa1303e0     	mov	x0, x19
  9f7240: aa1803e8     	mov	x8, x24
  9f7244: 91006042     	add	x2, x2, #0x18
  9f7248: aa1703e1     	mov	x1, x23
  9f724c: f9400064     	ldr	x4, [x3]
  9f7250: f90002e4     	str	x4, [x23]
  9f7254: f9000062     	str	x2, [x3]
  9f7258: d63f0320     	blr	x25
  9f725c: aa1a03e0     	mov	x0, x26
  9f7260: aa1803e1     	mov	x1, x24
  9f7264: 94074362     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  9f7268: f9400301     	ldr	x1, [x24]
  9f726c: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f7270: d1006020     	sub	x0, x1, #0x18
  9f7274: eb02001f     	cmp	x0, x2
  9f7278: 54fff9e0     	b.eq	0x9f71b4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x104>
  9f727c: b0002a62     	adrp	x2, 0xf44000
  9f7280: f9445042     	ldr	x2, [x2, #0x8a0]
  9f7284: b4000782     	cbz	x2, 0x9f7374 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2c4>
  9f7288: d1002021     	sub	x1, x1, #0x8
  9f728c: 885ffc22     	ldaxr	w2, [x1]
  9f7290: 51000443     	sub	w3, w2, #0x1
  9f7294: 8804fc23     	stlxr	w4, w3, [x1]
  9f7298: 35ffffa4     	cbnz	w4, 0x9f728c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x1dc>
  9f729c: 6b1f005f     	cmp	w2, wzr
  9f72a0: 54fff8ac     	b.gt	0x9f71b4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x104>
  9f72a4: f94033a1     	ldr	x1, [x29, #0x60]
  9f72a8: 94074d45     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f72ac: f94002e1     	ldr	x1, [x23]
  9f72b0: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f72b4: d1006020     	sub	x0, x1, #0x18
  9f72b8: eb02001f     	cmp	x0, x2
  9f72bc: 54fff860     	b.eq	0x9f71c8 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x118>
  9f72c0: b0002a62     	adrp	x2, 0xf44000
  9f72c4: f9445042     	ldr	x2, [x2, #0x8a0]
  9f72c8: b4000462     	cbz	x2, 0x9f7354 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2a4>
  9f72cc: d1002021     	sub	x1, x1, #0x8
  9f72d0: 885ffc22     	ldaxr	w2, [x1]
  9f72d4: 51000443     	sub	w3, w2, #0x1
  9f72d8: 8804fc23     	stlxr	w4, w3, [x1]
  9f72dc: 35ffffa4     	cbnz	w4, 0x9f72d0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x220>
  9f72e0: 6b1f005f     	cmp	w2, wzr
  9f72e4: 54fff72c     	b.gt	0x9f71c8 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x118>
  9f72e8: aa1803e1     	mov	x1, x24
  9f72ec: 94074d34     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f72f0: f94002c1     	ldr	x1, [x22]
  9f72f4: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f72f8: d1006020     	sub	x0, x1, #0x18
  9f72fc: eb02001f     	cmp	x0, x2
  9f7300: 54fff6e0     	b.eq	0x9f71dc <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x12c>
  9f7304: b0002a62     	adrp	x2, 0xf44000
  9f7308: f9445042     	ldr	x2, [x2, #0x8a0]
  9f730c: b40002c2     	cbz	x2, 0x9f7364 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x2b4>
  9f7310: d1002021     	sub	x1, x1, #0x8
  9f7314: 885ffc22     	ldaxr	w2, [x1]
  9f7318: 51000443     	sub	w3, w2, #0x1
  9f731c: 8804fc23     	stlxr	w4, w3, [x1]
  9f7320: 35ffffa4     	cbnz	w4, 0x9f7314 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x264>
  9f7324: 6b1f005f     	cmp	w2, wzr
  9f7328: 54fff5ac     	b.gt	0x9f71dc <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x12c>
  9f732c: aa1703e1     	mov	x1, x23
  9f7330: 94074d23     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f7334: 17ffffaa     	b	0x9f71dc <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x12c>
  9f7338: f9400262     	ldr	x2, [x19]
  9f733c: aa1303e0     	mov	x0, x19
  9f7340: aa1b03e1     	mov	x1, x27
  9f7344: f940d042     	ldr	x2, [x2, #0x1a0]
  9f7348: d63f0040     	blr	x2
  9f734c: 53001c19     	uxtb	w25, w0
  9f7350: 17ffff76     	b	0x9f7128 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x78>
  9f7354: b85f8022     	ldur	w2, [x1, #-0x8]
  9f7358: 51000443     	sub	w3, w2, #0x1
  9f735c: b81f8023     	stur	w3, [x1, #-0x8]
  9f7360: 17ffffe0     	b	0x9f72e0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x230>
  9f7364: b85f8022     	ldur	w2, [x1, #-0x8]
  9f7368: 51000443     	sub	w3, w2, #0x1
  9f736c: b81f8023     	stur	w3, [x1, #-0x8]
  9f7370: 17ffffed     	b	0x9f7324 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x274>
  9f7374: b85f8022     	ldur	w2, [x1, #-0x8]
  9f7378: 51000443     	sub	w3, w2, #0x1
  9f737c: b81f8023     	stur	w3, [x1, #-0x8]
  9f7380: 17ffffc7     	b	0x9f729c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x1ec>
  9f7384: f94037a0     	ldr	x0, [x29, #0x68]
  9f7388: 9100239c     	add	x28, x28, #0x8
  9f738c: eb1c001f     	cmp	x0, x28
  9f7390: 54fff061     	b.ne	0x9f719c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0xec>
  9f7394: f9404bb3     	ldr	x19, [x29, #0x90]
  9f7398: 52800019     	mov	w25, #0x0               // =0
  9f739c: 1400003b     	b	0x9f7488 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3d8>
  9f73a0: aa1703e0     	mov	x0, x23
  9f73a4: aa1b03e1     	mov	x1, x27
  9f73a8: 94074d66     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f73ac: 910022e0     	add	x0, x23, #0x8
  9f73b0: aa1a03e1     	mov	x1, x26
  9f73b4: 94074d63     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  9f73b8: d2800400     	mov	x0, #0x20               // =32
  9f73bc: 94061993     	bl	0xb7da08 <_Znwm>
  9f73c0: aa0003f7     	mov	x23, x0
  9f73c4: aa0003f5     	mov	x21, x0
  9f73c8: d28d20e2     	mov	x2, #0x6907             // =26887
  9f73cc: f2b8e1e2     	movk	x2, #0xc70f, lsl #16
  9f73d0: f80086ff     	str	xzr, [x23], #0x8
  9f73d4: f94057a0     	ldr	x0, [x29, #0xa8]
  9f73d8: f90006a0     	str	x0, [x21, #0x8]
  9f73dc: f947ee9a     	ldr	x26, [x20, #0xfd8]
  9f73e0: f9405ba1     	ldr	x1, [x29, #0xb0]
  9f73e4: 91006340     	add	x0, x26, #0x18
  9f73e8: f90057a0     	str	x0, [x29, #0xa8]
  9f73ec: f9000aa1     	str	x1, [x21, #0x10]
  9f73f0: f9005ba0     	str	x0, [x29, #0xb0]
  9f73f4: f94006a0     	ldr	x0, [x21, #0x8]
  9f73f8: f85e8001     	ldur	x1, [x0, #-0x18]
  9f73fc: 94061921     	bl	0xb7d880 <_ZN9__gnu_cxx20recursive_init_errorD0Ev+0x24>
  9f7400: f9447a73     	ldr	x19, [x19, #0x8f0]
  9f7404: aa0003f6     	mov	x22, x0
  9f7408: f9403ba0     	ldr	x0, [x29, #0x70]
  9f740c: aa1703e2     	mov	x2, x23
  9f7410: aa1603e3     	mov	x3, x22
  9f7414: 9ad30ac1     	udiv	x1, x22, x19
  9f7418: 9b13d833     	msub	x19, x1, x19, x22
  9f741c: aa1303e1     	mov	x1, x19
  9f7420: 97e93229     	bl	0x443cc4 <_ZNKSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE19_M_find_before_nodeEmRS1_m>
  9f7424: b4000540     	cbz	x0, 0x9f74cc <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x41c>
  9f7428: f9400000     	ldr	x0, [x0]
  9f742c: b4000500     	cbz	x0, 0x9f74cc <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x41c>
  9f7430: f9400aa1     	ldr	x1, [x21, #0x10]
  9f7434: d1006020     	sub	x0, x1, #0x18
  9f7438: eb1a001f     	cmp	x0, x26
  9f743c: 54000a21     	b.ne	0x9f7580 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x4d0>
  9f7440: f94006a1     	ldr	x1, [x21, #0x8]
  9f7444: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f7448: d1006020     	sub	x0, x1, #0x18
  9f744c: eb02001f     	cmp	x0, x2
  9f7450: 540007e1     	b.ne	0x9f754c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x49c>
  9f7454: aa1503e0     	mov	x0, x21
  9f7458: 940612ac     	bl	0xb7bf08 <_ZdlPv>
  9f745c: f9405ba1     	ldr	x1, [x29, #0xb0]
  9f7460: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f7464: d1006020     	sub	x0, x1, #0x18
  9f7468: eb02001f     	cmp	x0, x2
  9f746c: 54000561     	b.ne	0x9f7518 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x468>
  9f7470: f94057a1     	ldr	x1, [x29, #0xa8]
  9f7474: f947ee82     	ldr	x2, [x20, #0xfd8]
  9f7478: d1006020     	sub	x0, x1, #0x18
  9f747c: eb02001f     	cmp	x0, x2
  9f7480: 54000321     	b.ne	0x9f74e4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x434>
  9f7484: f9404bb3     	ldr	x19, [x29, #0x90]
  9f7488: f947ee94     	ldr	x20, [x20, #0xfd8]
  9f748c: d1006260     	sub	x0, x19, #0x18
  9f7490: eb14001f     	cmp	x0, x20
  9f7494: 54ffe4a0     	b.eq	0x9f7128 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x78>
  9f7498: b0002a61     	adrp	x1, 0xf44000
  9f749c: f9445021     	ldr	x1, [x1, #0x8a0]
  9f74a0: b40008a1     	cbz	x1, 0x9f75b4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x504>
  9f74a4: d1002273     	sub	x19, x19, #0x8
  9f74a8: 885ffe61     	ldaxr	w1, [x19]
  9f74ac: 51000422     	sub	w2, w1, #0x1
  9f74b0: 8803fe62     	stlxr	w3, w2, [x19]
  9f74b4: 35ffffa3     	cbnz	w3, 0x9f74a8 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3f8>
  9f74b8: 6b1f003f     	cmp	w1, wzr
  9f74bc: 54ffe36c     	b.gt	0x9f7128 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x78>
  9f74c0: 9102a3a1     	add	x1, x29, #0xa8
  9f74c4: 94074cbe     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f74c8: 17ffff18     	b	0x9f7128 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x78>
  9f74cc: f9403ba0     	ldr	x0, [x29, #0x70]
  9f74d0: aa1303e1     	mov	x1, x19
  9f74d4: aa1603e2     	mov	x2, x22
  9f74d8: aa1503e3     	mov	x3, x21
  9f74dc: 97e93163     	bl	0x443a68 <_ZNSt10_HashtableISsSt4pairIKSsSsESaIS2_ENSt8__detail10_Select1stESt8equal_toISsESt4hashISsENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb1ELb0ELb1EEEE21_M_insert_unique_nodeEmmPNS4_10_Hash_nodeIS2_Lb1EEE>
  9f74e0: 17ffffdf     	b	0x9f745c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3ac>
  9f74e4: b0002a62     	adrp	x2, 0xf44000
  9f74e8: f9445042     	ldr	x2, [x2, #0x8a0]
  9f74ec: b4000742     	cbz	x2, 0x9f75d4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x524>
  9f74f0: d1002021     	sub	x1, x1, #0x8
  9f74f4: 885ffc22     	ldaxr	w2, [x1]
  9f74f8: 51000443     	sub	w3, w2, #0x1
  9f74fc: 8804fc23     	stlxr	w4, w3, [x1]
  9f7500: 35ffffa4     	cbnz	w4, 0x9f74f4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x444>
  9f7504: 6b1f005f     	cmp	w2, wzr
  9f7508: 54fffbec     	b.gt	0x9f7484 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3d4>
  9f750c: aa1803e1     	mov	x1, x24
  9f7510: 94074cab     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f7514: 17ffffdc     	b	0x9f7484 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3d4>
  9f7518: b0002a62     	adrp	x2, 0xf44000
  9f751c: f9445042     	ldr	x2, [x2, #0x8a0]
  9f7520: b4000522     	cbz	x2, 0x9f75c4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x514>
  9f7524: d1002021     	sub	x1, x1, #0x8
  9f7528: 885ffc22     	ldaxr	w2, [x1]
  9f752c: 51000443     	sub	w3, w2, #0x1
  9f7530: 8804fc23     	stlxr	w4, w3, [x1]
  9f7534: 35ffffa4     	cbnz	w4, 0x9f7528 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x478>
  9f7538: 6b1f005f     	cmp	w2, wzr
  9f753c: 54fff9ac     	b.gt	0x9f7470 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3c0>
  9f7540: aa1803e1     	mov	x1, x24
  9f7544: 94074c9e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f7548: 17ffffca     	b	0x9f7470 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3c0>
  9f754c: b0002a62     	adrp	x2, 0xf44000
  9f7550: f9445042     	ldr	x2, [x2, #0x8a0]
  9f7554: b4000502     	cbz	x2, 0x9f75f4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x544>
  9f7558: d1002021     	sub	x1, x1, #0x8
  9f755c: 885ffc22     	ldaxr	w2, [x1]
  9f7560: 51000443     	sub	w3, w2, #0x1
  9f7564: 8804fc23     	stlxr	w4, w3, [x1]
  9f7568: 35ffffa4     	cbnz	w4, 0x9f755c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x4ac>
  9f756c: 6b1f005f     	cmp	w2, wzr
  9f7570: 54fff72c     	b.gt	0x9f7454 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3a4>
  9f7574: aa1803e1     	mov	x1, x24
  9f7578: 94074c91     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f757c: 17ffffb6     	b	0x9f7454 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3a4>
  9f7580: b0002a62     	adrp	x2, 0xf44000
  9f7584: f9445042     	ldr	x2, [x2, #0x8a0]
  9f7588: b40002e2     	cbz	x2, 0x9f75e4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x534>
  9f758c: d1002021     	sub	x1, x1, #0x8
  9f7590: 885ffc22     	ldaxr	w2, [x1]
  9f7594: 51000443     	sub	w3, w2, #0x1
  9f7598: 8804fc23     	stlxr	w4, w3, [x1]
  9f759c: 35ffffa4     	cbnz	w4, 0x9f7590 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x4e0>
  9f75a0: 6b1f005f     	cmp	w2, wzr
  9f75a4: 54fff4ec     	b.gt	0x9f7440 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x390>
  9f75a8: aa1803e1     	mov	x1, x24
  9f75ac: 94074c84     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f75b0: 17ffffa4     	b	0x9f7440 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x390>
  9f75b4: b85f8261     	ldur	w1, [x19, #-0x8]
  9f75b8: 51000422     	sub	w2, w1, #0x1
  9f75bc: b81f8262     	stur	w2, [x19, #-0x8]
  9f75c0: 17ffffbe     	b	0x9f74b8 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x408>
  9f75c4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f75c8: 51000443     	sub	w3, w2, #0x1
  9f75cc: b81f8023     	stur	w3, [x1, #-0x8]
  9f75d0: 17ffffda     	b	0x9f7538 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x488>
  9f75d4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f75d8: 51000443     	sub	w3, w2, #0x1
  9f75dc: b81f8023     	stur	w3, [x1, #-0x8]
  9f75e0: 17ffffc9     	b	0x9f7504 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x454>
  9f75e4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f75e8: 51000443     	sub	w3, w2, #0x1
  9f75ec: b81f8023     	stur	w3, [x1, #-0x8]
  9f75f0: 17ffffec     	b	0x9f75a0 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x4f0>
  9f75f4: b85f8022     	ldur	w2, [x1, #-0x8]
  9f75f8: 51000443     	sub	w3, w2, #0x1
  9f75fc: b81f8023     	stur	w3, [x1, #-0x8]
  9f7600: 17ffffdb     	b	0x9f756c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x4bc>
  9f7604: 52800019     	mov	w25, #0x0               // =0
  9f7608: aa1503f3     	mov	x19, x21
  9f760c: 17ffff9f     	b	0x9f7488 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x3d8>
  9f7610: 97e68f64     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f7614: aa0003f3     	mov	x19, x0
  9f7618: f94053a0     	ldr	x0, [x29, #0xa0]
  9f761c: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f7620: d1006000     	sub	x0, x0, #0x18
  9f7624: eb01001f     	cmp	x0, x1
  9f7628: 54000060     	b.eq	0x9f7634 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x584>
  9f762c: 910223a1     	add	x1, x29, #0x88
  9f7630: 97e69f94     	bl	0x39f480 <.text+0x3170>
  9f7634: f94057a0     	ldr	x0, [x29, #0xa8]
  9f7638: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f763c: d1006000     	sub	x0, x0, #0x18
  9f7640: eb01001f     	cmp	x0, x1
  9f7644: 54000060     	b.eq	0x9f7650 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5a0>
  9f7648: 910223a1     	add	x1, x29, #0x88
  9f764c: 97e69f8d     	bl	0x39f480 <.text+0x3170>
  9f7650: f9404fa0     	ldr	x0, [x29, #0x98]
  9f7654: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f7658: d1006000     	sub	x0, x0, #0x18
  9f765c: eb01001f     	cmp	x0, x1
  9f7660: 54000060     	b.eq	0x9f766c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5bc>
  9f7664: 9102a3a1     	add	x1, x29, #0xa8
  9f7668: 97e69f86     	bl	0x39f480 <.text+0x3170>
  9f766c: f9404ba0     	ldr	x0, [x29, #0x90]
  9f7670: f947ee98     	ldr	x24, [x20, #0xfd8]
  9f7674: d1006000     	sub	x0, x0, #0x18
  9f7678: eb18001f     	cmp	x0, x24
  9f767c: 54000060     	b.eq	0x9f7688 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5d8>
  9f7680: 910223a1     	add	x1, x29, #0x88
  9f7684: 97e69f7f     	bl	0x39f480 <.text+0x3170>
  9f7688: aa1303e0     	mov	x0, x19
  9f768c: 9407ae15     	bl	0xbe2ee0 <_Unwind_Resume>
  9f7690: aa0003f3     	mov	x19, x0
  9f7694: 17ffffef     	b	0x9f7650 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5a0>
  9f7698: aa0003f3     	mov	x19, x0
  9f769c: 17ffffe6     	b	0x9f7634 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x584>
  9f76a0: aa0003f3     	mov	x19, x0
  9f76a4: f94057a0     	ldr	x0, [x29, #0xa8]
  9f76a8: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f76ac: d1006000     	sub	x0, x0, #0x18
  9f76b0: eb01001f     	cmp	x0, x1
  9f76b4: 54fffdc0     	b.eq	0x9f766c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5bc>
  9f76b8: aa1803e1     	mov	x1, x24
  9f76bc: 97e69f71     	bl	0x39f480 <.text+0x3170>
  9f76c0: 17ffffeb     	b	0x9f766c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5bc>
  9f76c4: aa0003f3     	mov	x19, x0
  9f76c8: f9405ba0     	ldr	x0, [x29, #0xb0]
  9f76cc: f947ee81     	ldr	x1, [x20, #0xfd8]
  9f76d0: d1006000     	sub	x0, x0, #0x18
  9f76d4: eb01001f     	cmp	x0, x1
  9f76d8: 54fffe60     	b.eq	0x9f76a4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5f4>
  9f76dc: aa1803e1     	mov	x1, x24
  9f76e0: 97e69f68     	bl	0x39f480 <.text+0x3170>
  9f76e4: 17fffff0     	b	0x9f76a4 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5f4>
  9f76e8: aa0003f3     	mov	x19, x0
  9f76ec: 17ffffe0     	b	0x9f766c <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5bc>
  9f76f0: 17ffffe8     	b	0x9f7690 <_ZNK7cocos2d9FileUtils16isDirectoryExistERKSs+0x5e0>

00000000009f76f4 <_ZN7cocos2d6GLView15pollInputEventsEv>:
  9f76f4: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9f76f8: 910003fd     	mov	x29, sp
  9f76fc: f9400001     	ldr	x1, [x0]
  9f7700: f9402021     	ldr	x1, [x1, #0x40]
  9f7704: d63f0020     	blr	x1
  9f7708: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9f770c: d65f03c0     	ret

00000000009f7710 <_ZN7cocos2d6GLView10pollEventsEv>:
  9f7710: d65f03c0     	ret

00000000009f7714 <_ZNK7cocos2d6GLView23getDesignResolutionSizeEv>:
  9f7714: 9100b000     	add	x0, x0, #0x2c
  9f7718: d65f03c0     	ret

00000000009f771c <_ZNK7cocos2d6GLView12getFrameSizeEv>:
  9f771c: 91009000     	add	x0, x0, #0x24
  9f7720: d65f03c0     	ret

00000000009f7724 <_ZNK7cocos2d6GLView15getSafeAreaRectEv>:
  9f7724: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7728: 910003fd     	mov	x29, sp
  9f772c: f9400001     	ldr	x1, [x0]
  9f7730: f9000bf3     	str	x19, [sp, #0x10]
  9f7734: aa0803f3     	mov	x19, x8
  9f7738: f9405021     	ldr	x1, [x1, #0xa0]
  9f773c: d63f0020     	blr	x1
  9f7740: aa1303e0     	mov	x0, x19
  9f7744: f9400bf3     	ldr	x19, [sp, #0x10]
  9f7748: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f774c: d65f03c0     	ret

00000000009f7750 <_ZNK7cocos2d6GLView16getVisibleOriginEv>:
  9f7750: b9405801     	ldr	w1, [x0, #0x58]
  9f7754: 7100043f     	cmp	w1, #0x1
  9f7758: 54000120     	b.eq	0x9f777c <_ZNK7cocos2d6GLView16getVisibleOriginEv+0x2c>
  9f775c: b0002a40     	adrp	x0, 0xf40000
  9f7760: f9459800     	ldr	x0, [x0, #0xb30]
  9f7764: bd400000     	ldr	s0, [x0]
  9f7768: bd400401     	ldr	s1, [x0, #0x4]
  9f776c: aa0803e0     	mov	x0, x8
  9f7770: bd000100     	str	s0, [x8]
  9f7774: bd000501     	str	s1, [x8, #0x4]
  9f7778: d65f03c0     	ret
  9f777c: bd402400     	ldr	s0, [x0, #0x24]
  9f7780: bd405003     	ldr	s3, [x0, #0x50]
  9f7784: bd402801     	ldr	s1, [x0, #0x28]
  9f7788: bd405405     	ldr	s5, [x0, #0x54]
  9f778c: 1e231803     	fdiv	s3, s0, s3
  9f7790: bd403002     	ldr	s2, [x0, #0x30]
  9f7794: bd402c00     	ldr	s0, [x0, #0x2c]
  9f7798: aa0803e0     	mov	x0, x8
  9f779c: 1e2c1004     	fmov	s4, #0.50000000
  9f77a0: 1e251821     	fdiv	s1, s1, s5
  9f77a4: 1e233800     	fsub	s0, s0, s3
  9f77a8: 1e240800     	fmul	s0, s0, s4
  9f77ac: 1e213841     	fsub	s1, s2, s1
  9f77b0: bd000100     	str	s0, [x8]
  9f77b4: 1e240821     	fmul	s1, s1, s4
  9f77b8: bd000501     	str	s1, [x8, #0x4]
  9f77bc: d65f03c0     	ret

00000000009f77c0 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_>:
  9f77c0: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9f77c4: d2800005     	mov	x5, #0x0                // =0
  9f77c8: d2800006     	mov	x6, #0x0                // =0
  9f77cc: 910003fd     	mov	x29, sp
  9f77d0: f9400007     	ldr	x7, [x0]
  9f77d4: f9407ce7     	ldr	x7, [x7, #0xf8]
  9f77d8: d63f00e0     	blr	x7
  9f77dc: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9f77e0: d65f03c0     	ret

00000000009f77e4 <_ZNK7cocos2d6GLView14getVisibleRectEv>:
  9f77e4: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f77e8: 910003fd     	mov	x29, sp
  9f77ec: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f77f0: b0002a55     	adrp	x21, 0xf40000
  9f77f4: aa0003f6     	mov	x22, x0
  9f77f8: aa0803e0     	mov	x0, x8
  9f77fc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7800: f940e6b5     	ldr	x21, [x21, #0x1c8]
  9f7804: aa0803f4     	mov	x20, x8
  9f7808: 9100c3b3     	add	x19, x29, #0x30
  9f780c: f94002a1     	ldr	x1, [x21]
  9f7810: f9001fa1     	str	x1, [x29, #0x38]
  9f7814: 94001875     	bl	0x9fd9e8 <_ZN7cocos2d4RectC2Ev>
  9f7818: f94002c1     	ldr	x1, [x22]
  9f781c: aa1303e8     	mov	x8, x19
  9f7820: aa1603e0     	mov	x0, x22
  9f7824: f9404821     	ldr	x1, [x1, #0x90]
  9f7828: d63f0020     	blr	x1
  9f782c: aa1303e1     	mov	x1, x19
  9f7830: 91002280     	add	x0, x20, #0x8
  9f7834: 94001843     	bl	0x9fd940 <_ZN7cocos2d4SizeaSERKS0_>
  9f7838: f94002c1     	ldr	x1, [x22]
  9f783c: aa1603e0     	mov	x0, x22
  9f7840: aa1303e8     	mov	x8, x19
  9f7844: f9404c21     	ldr	x1, [x1, #0x98]
  9f7848: d63f0020     	blr	x1
  9f784c: f9401fa2     	ldr	x2, [x29, #0x38]
  9f7850: aa1403e0     	mov	x0, x20
  9f7854: f94002a1     	ldr	x1, [x21]
  9f7858: f9401ba3     	ldr	x3, [x29, #0x30]
  9f785c: f9000283     	str	x3, [x20]
  9f7860: eb01005f     	cmp	x2, x1
  9f7864: 540000a1     	b.ne	0x9f7878 <_ZNK7cocos2d6GLView14getVisibleRectEv+0x94>
  9f7868: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f786c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f7870: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f7874: d65f03c0     	ret
  9f7878: 97e68eca     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f787c <_ZN7cocos2d6GLView12setFrameSizeEff>:
  9f787c: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9f7880: aa0003e2     	mov	x2, x0
  9f7884: 910003fd     	mov	x29, sp
  9f7888: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f788c: b0002a54     	adrp	x20, 0xf40000
  9f7890: 9100b053     	add	x19, x2, #0x2c
  9f7894: 910103a1     	add	x1, x29, #0x40
  9f7898: f90013f5     	str	x21, [sp, #0x20]
  9f789c: 91009015     	add	x21, x0, #0x24
  9f78a0: aa0103e0     	mov	x0, x1
  9f78a4: f940e682     	ldr	x2, [x20, #0x1c8]
  9f78a8: f9001fa1     	str	x1, [x29, #0x38]
  9f78ac: f9400042     	ldr	x2, [x2]
  9f78b0: f90027a2     	str	x2, [x29, #0x48]
  9f78b4: 940017d5     	bl	0x9fd808 <_ZN7cocos2d4SizeC2Eff>
  9f78b8: f9401fa1     	ldr	x1, [x29, #0x38]
  9f78bc: aa1503e0     	mov	x0, x21
  9f78c0: 94001820     	bl	0x9fd940 <_ZN7cocos2d4SizeaSERKS0_>
  9f78c4: f0002a41     	adrp	x1, 0xf42000
  9f78c8: aa1303e0     	mov	x0, x19
  9f78cc: f943f821     	ldr	x1, [x1, #0x7f0]
  9f78d0: 94001832     	bl	0x9fd998 <_ZNK7cocos2d4Size6equalsERKS0_>
  9f78d4: 53001c00     	uxtb	w0, w0
  9f78d8: 34000080     	cbz	w0, 0x9f78e8 <_ZN7cocos2d6GLView12setFrameSizeEff+0x6c>
  9f78dc: aa1303e0     	mov	x0, x19
  9f78e0: aa1503e1     	mov	x1, x21
  9f78e4: 94001817     	bl	0x9fd940 <_ZN7cocos2d4SizeaSERKS0_>
  9f78e8: f940e694     	ldr	x20, [x20, #0x1c8]
  9f78ec: f94027a1     	ldr	x1, [x29, #0x48]
  9f78f0: f9400280     	ldr	x0, [x20]
  9f78f4: eb00003f     	cmp	x1, x0
  9f78f8: 540000a1     	b.ne	0x9f790c <_ZN7cocos2d6GLView12setFrameSizeEff+0x90>
  9f78fc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7900: f94013f5     	ldr	x21, [sp, #0x20]
  9f7904: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9f7908: d65f03c0     	ret
  9f790c: 97e68ea5     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f7910 <_ZNK7cocos2d6GLView14getVisibleSizeEv>:
  9f7910: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7914: aa0003e1     	mov	x1, x0
  9f7918: 910003fd     	mov	x29, sp
  9f791c: b9405800     	ldr	w0, [x0, #0x58]
  9f7920: 7100041f     	cmp	w0, #0x1
  9f7924: 54000120     	b.eq	0x9f7948 <_ZNK7cocos2d6GLView14getVisibleSizeEv+0x38>
  9f7928: aa0803e0     	mov	x0, x8
  9f792c: 9100b021     	add	x1, x1, #0x2c
  9f7930: f9000fa8     	str	x8, [x29, #0x18]
  9f7934: 940017b8     	bl	0x9fd814 <_ZN7cocos2d4SizeC2ERKS0_>
  9f7938: f9400fa8     	ldr	x8, [x29, #0x18]
  9f793c: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7940: aa0803e0     	mov	x0, x8
  9f7944: d65f03c0     	ret
  9f7948: bd402423     	ldr	s3, [x1, #0x24]
  9f794c: aa0803e0     	mov	x0, x8
  9f7950: bd405020     	ldr	s0, [x1, #0x50]
  9f7954: f9000fa8     	str	x8, [x29, #0x18]
  9f7958: bd402822     	ldr	s2, [x1, #0x28]
  9f795c: bd405421     	ldr	s1, [x1, #0x54]
  9f7960: 1e201860     	fdiv	s0, s3, s0
  9f7964: 1e211841     	fdiv	s1, s2, s1
  9f7968: 940017a8     	bl	0x9fd808 <_ZN7cocos2d4SizeC2Eff>
  9f796c: f9400fa8     	ldr	x8, [x29, #0x18]
  9f7970: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7974: aa0803e0     	mov	x0, x8
  9f7978: d65f03c0     	ret

00000000009f797c <_ZN7cocos2d6GLView19setViewPortInPointsEffff>:
  9f797c: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f7980: aa0003e1     	mov	x1, x0
  9f7984: 910003fd     	mov	x29, sp
  9f7988: bd405005     	ldr	s5, [x0, #0x50]
  9f798c: bd405424     	ldr	s4, [x1, #0x54]
  9f7990: bd403427     	ldr	s7, [x1, #0x34]
  9f7994: bd403826     	ldr	s6, [x1, #0x38]
  9f7998: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f799c: b0002a53     	adrp	x19, 0xf40000
  9f79a0: 9100a3b4     	add	x20, x29, #0x28
  9f79a4: 1f001ca0     	fmadd	s0, s5, s0, s7
  9f79a8: aa1403e0     	mov	x0, x20
  9f79ac: 1f011881     	fmadd	s1, s4, s1, s6
  9f79b0: f940e673     	ldr	x19, [x19, #0x1c8]
  9f79b4: 1e2208a2     	fmul	s2, s5, s2
  9f79b8: f9400261     	ldr	x1, [x19]
  9f79bc: 1e230883     	fmul	s3, s4, s3
  9f79c0: f9001fa1     	str	x1, [x29, #0x38]
  9f79c4: 9401d773     	bl	0xa6d790 <_ZN7cocos2d12experimental8ViewportC2Effff>
  9f79c8: aa1403e0     	mov	x0, x20
  9f79cc: 97fdba4e     	bl	0x966304 <_ZN7cocos2d6Camera18setDefaultViewportERKNS_12experimental8ViewportE>
  9f79d0: f9401fa1     	ldr	x1, [x29, #0x38]
  9f79d4: f9400260     	ldr	x0, [x19]
  9f79d8: eb00003f     	cmp	x1, x0
  9f79dc: 54000081     	b.ne	0x9f79ec <_ZN7cocos2d6GLView19setViewPortInPointsEffff+0x70>
  9f79e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f79e4: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f79e8: d65f03c0     	ret
  9f79ec: 97e68e6d     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f79f0 <_ZN7cocos2d6GLView18setScissorInPointsEffff>:
  9f79f0: bd405005     	ldr	s5, [x0, #0x50]
  9f79f4: bd405404     	ldr	s4, [x0, #0x54]
  9f79f8: bd403407     	ldr	s7, [x0, #0x34]
  9f79fc: bd403806     	ldr	s6, [x0, #0x38]
  9f7a00: 1f001ca0     	fmadd	s0, s5, s0, s7
  9f7a04: 1f011881     	fmadd	s1, s4, s1, s6
  9f7a08: 1e2208a2     	fmul	s2, s5, s2
  9f7a0c: 1e230883     	fmul	s3, s4, s3
  9f7a10: 1e380042     	fcvtzs	w2, s2
  9f7a14: 1e380063     	fcvtzs	w3, s3
  9f7a18: 1e380000     	fcvtzs	w0, s0
  9f7a1c: 1e380021     	fcvtzs	w1, s1
  9f7a20: 17e68e5c     	b	0x39b390 <glScissor@plt>

00000000009f7a24 <_ZN7cocos2d6GLView16isScissorEnabledEv>:
  9f7a24: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9f7a28: 52818220     	mov	w0, #0xc11              // =3089
  9f7a2c: 910003fd     	mov	x29, sp
  9f7a30: 97e69024     	bl	0x39bac0 <glIsEnabled@plt>
  9f7a34: 53001c00     	uxtb	w0, w0
  9f7a38: 6b1f001f     	cmp	w0, wzr
  9f7a3c: 1a9f07e0     	cset	w0, ne
  9f7a40: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9f7a44: d65f03c0     	ret

00000000009f7a48 <_ZNK7cocos2d6GLView14getScissorRectEv>:
  9f7a48: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  9f7a4c: 910003fd     	mov	x29, sp
  9f7a50: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7a54: b0002a53     	adrp	x19, 0xf40000
  9f7a58: aa0003f4     	mov	x20, x0
  9f7a5c: 9100e3a1     	add	x1, x29, #0x38
  9f7a60: 52818200     	mov	w0, #0xc10              // =3088
  9f7a64: f90013f5     	str	x21, [sp, #0x20]
  9f7a68: aa0803f5     	mov	x21, x8
  9f7a6c: f940e673     	ldr	x19, [x19, #0x1c8]
  9f7a70: f9400262     	ldr	x2, [x19]
  9f7a74: f90027a2     	str	x2, [x29, #0x48]
  9f7a78: 97e6911e     	bl	0x39bef0 <glGetFloatv@plt>
  9f7a7c: bd403683     	ldr	s3, [x20, #0x34]
  9f7a80: aa1503e0     	mov	x0, x21
  9f7a84: bd403ba0     	ldr	s0, [x29, #0x38]
  9f7a88: bd403a82     	ldr	s2, [x20, #0x38]
  9f7a8c: 1e233800     	fsub	s0, s0, s3
  9f7a90: bd403fa1     	ldr	s1, [x29, #0x3c]
  9f7a94: bd4043a4     	ldr	s4, [x29, #0x40]
  9f7a98: 1e223821     	fsub	s1, s1, s2
  9f7a9c: bd405282     	ldr	s2, [x20, #0x50]
  9f7aa0: bd405683     	ldr	s3, [x20, #0x54]
  9f7aa4: 1e221800     	fdiv	s0, s0, s2
  9f7aa8: 1e221882     	fdiv	s2, s4, s2
  9f7aac: bd4047a4     	ldr	s4, [x29, #0x44]
  9f7ab0: 1e231821     	fdiv	s1, s1, s3
  9f7ab4: 1e231883     	fdiv	s3, s4, s3
  9f7ab8: 940017de     	bl	0x9fda30 <_ZN7cocos2d4RectC2Effff>
  9f7abc: f94027a2     	ldr	x2, [x29, #0x48]
  9f7ac0: aa1503e0     	mov	x0, x21
  9f7ac4: f9400261     	ldr	x1, [x19]
  9f7ac8: eb01005f     	cmp	x2, x1
  9f7acc: 540000a1     	b.ne	0x9f7ae0 <_ZNK7cocos2d6GLView14getScissorRectEv+0x98>
  9f7ad0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7ad4: f94013f5     	ldr	x21, [sp, #0x20]
  9f7ad8: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  9f7adc: d65f03c0     	ret
  9f7ae0: 97e68e30     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f7ae4 <_ZN7cocos2d6GLView11setViewNameERKSs>:
  9f7ae4: 91012000     	add	x0, x0, #0x48
  9f7ae8: 14074bf6     	b	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>

00000000009f7aec <_ZN7cocos2d10EventTouchD2Ev>:
  9f7aec: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7af0: b0002a81     	adrp	x1, 0xf48000
  9f7af4: 910003fd     	mov	x29, sp
  9f7af8: f9000bf3     	str	x19, [sp, #0x10]
  9f7afc: aa0003f3     	mov	x19, x0
  9f7b00: f9402421     	ldr	x1, [x1, #0x48]
  9f7b04: f9402000     	ldr	x0, [x0, #0x40]
  9f7b08: 91004021     	add	x1, x1, #0x10
  9f7b0c: f9000261     	str	x1, [x19]
  9f7b10: b4000040     	cbz	x0, 0x9f7b18 <_ZN7cocos2d10EventTouchD2Ev+0x2c>
  9f7b14: 940610fd     	bl	0xb7bf08 <_ZdlPv>
  9f7b18: aa1303e0     	mov	x0, x19
  9f7b1c: f9400bf3     	ldr	x19, [sp, #0x10]
  9f7b20: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7b24: 14008606     	b	0xa1933c <_ZN7cocos2d5EventD2Ev>

00000000009f7b28 <_ZN7cocos2d10EventTouchD0Ev>:
  9f7b28: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7b2c: b0002a81     	adrp	x1, 0xf48000
  9f7b30: 910003fd     	mov	x29, sp
  9f7b34: f9000bf3     	str	x19, [sp, #0x10]
  9f7b38: aa0003f3     	mov	x19, x0
  9f7b3c: f9402421     	ldr	x1, [x1, #0x48]
  9f7b40: f9402000     	ldr	x0, [x0, #0x40]
  9f7b44: 91004021     	add	x1, x1, #0x10
  9f7b48: f9000261     	str	x1, [x19]
  9f7b4c: b4000040     	cbz	x0, 0x9f7b54 <_ZN7cocos2d10EventTouchD0Ev+0x2c>
  9f7b50: 940610ee     	bl	0xb7bf08 <_ZdlPv>
  9f7b54: aa1303e0     	mov	x0, x19
  9f7b58: 940085f9     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f7b5c: aa1303e0     	mov	x0, x19
  9f7b60: f9400bf3     	ldr	x19, [sp, #0x10]
  9f7b64: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7b68: 140610e8     	b	0xb7bf08 <_ZdlPv>

00000000009f7b6c <_ZN7cocos2d6GLView17setGLContextAttrsER14GLContextAttrs>:
  9f7b6c: 90002a81     	adrp	x1, 0xf47000
  9f7b70: a9400c02     	ldp	x2, x3, [x0]
  9f7b74: f947f821     	ldr	x1, [x1, #0xff0]
  9f7b78: a9000c22     	stp	x2, x3, [x1]
  9f7b7c: f9400800     	ldr	x0, [x0, #0x10]
  9f7b80: f9000820     	str	x0, [x1, #0x10]
  9f7b84: d65f03c0     	ret

00000000009f7b88 <_ZN7cocos2d6GLView17getGLContextAttrsEv>:
  9f7b88: 90002a81     	adrp	x1, 0xf47000
  9f7b8c: aa0803e0     	mov	x0, x8
  9f7b90: f947f821     	ldr	x1, [x1, #0xff0]
  9f7b94: a9400c22     	ldp	x2, x3, [x1]
  9f7b98: f9400821     	ldr	x1, [x1, #0x10]
  9f7b9c: f9000901     	str	x1, [x8, #0x10]
  9f7ba0: a9000d02     	stp	x2, x3, [x8]
  9f7ba4: d65f03c0     	ret

00000000009f7ba8 <_ZN7cocos2d6GLViewC2Ev>:
  9f7ba8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7bac: 910003fd     	mov	x29, sp
  9f7bb0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7bb4: aa0003f3     	mov	x19, x0
  9f7bb8: 9400cf80     	bl	0xa2b9b8 <_ZN7cocos2d3RefC2Ev>
  9f7bbc: 1e2703e0     	fmov	s0, wzr
  9f7bc0: b0002a41     	adrp	x1, 0xf40000
  9f7bc4: aa1303e0     	mov	x0, x19
  9f7bc8: f945e821     	ldr	x1, [x1, #0xbd0]
  9f7bcc: 1e204001     	fmov	s1, s0
  9f7bd0: 91004021     	add	x1, x1, #0x10
  9f7bd4: f8024401     	str	x1, [x0], #0x24
  9f7bd8: 9400170c     	bl	0x9fd808 <_ZN7cocos2d4SizeC2Eff>
  9f7bdc: 1e2703e0     	fmov	s0, wzr
  9f7be0: 9100b260     	add	x0, x19, #0x2c
  9f7be4: 1e204001     	fmov	s1, s0
  9f7be8: 94001708     	bl	0x9fd808 <_ZN7cocos2d4SizeC2Eff>
  9f7bec: 9100d260     	add	x0, x19, #0x34
  9f7bf0: 9400177e     	bl	0x9fd9e8 <_ZN7cocos2d4RectC2Ev>
  9f7bf4: d0002a80     	adrp	x0, 0xf49000
  9f7bf8: 528000a1     	mov	w1, #0x5                // =5
  9f7bfc: 1e2e1000     	fmov	s0, #1.00000000
  9f7c00: f947ec00     	ldr	x0, [x0, #0xfd8]
  9f7c04: b9005a61     	str	w1, [x19, #0x58]
  9f7c08: f900327f     	str	xzr, [x19, #0x60]
  9f7c0c: 91006000     	add	x0, x0, #0x18
  9f7c10: f9002660     	str	x0, [x19, #0x48]
  9f7c14: bd005260     	str	s0, [x19, #0x50]
  9f7c18: bd005660     	str	s0, [x19, #0x54]
  9f7c1c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7c20: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7c24: d65f03c0     	ret
  9f7c28: aa0003f4     	mov	x20, x0
  9f7c2c: aa1303e0     	mov	x0, x19
  9f7c30: 9400cf31     	bl	0xa2b8f4 <_ZN7cocos2d3RefD2Ev>
  9f7c34: aa1403e0     	mov	x0, x20
  9f7c38: 9407acaa     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f7c3c <_ZN7cocos2d6GLViewD2Ev>:
  9f7c3c: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9f7c40: 910003fd     	mov	x29, sp
  9f7c44: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7c48: b0002a53     	adrp	x19, 0xf40000
  9f7c4c: aa0003f4     	mov	x20, x0
  9f7c50: b0002a40     	adrp	x0, 0xf40000
  9f7c54: f940e661     	ldr	x1, [x19, #0x1c8]
  9f7c58: f945e800     	ldr	x0, [x0, #0xbd0]
  9f7c5c: f9402682     	ldr	x2, [x20, #0x48]
  9f7c60: f9400021     	ldr	x1, [x1]
  9f7c64: 91004000     	add	x0, x0, #0x10
  9f7c68: f90017a1     	str	x1, [x29, #0x28]
  9f7c6c: d0002a81     	adrp	x1, 0xf49000
  9f7c70: f9000280     	str	x0, [x20]
  9f7c74: d1006040     	sub	x0, x2, #0x18
  9f7c78: f947ec21     	ldr	x1, [x1, #0xfd8]
  9f7c7c: eb01001f     	cmp	x0, x1
  9f7c80: 54000161     	b.ne	0x9f7cac <_ZN7cocos2d6GLViewD2Ev+0x70>
  9f7c84: aa1403e0     	mov	x0, x20
  9f7c88: 9400cf1b     	bl	0xa2b8f4 <_ZN7cocos2d3RefD2Ev>
  9f7c8c: f940e673     	ldr	x19, [x19, #0x1c8]
  9f7c90: f94017a1     	ldr	x1, [x29, #0x28]
  9f7c94: f9400260     	ldr	x0, [x19]
  9f7c98: eb00003f     	cmp	x1, x0
  9f7c9c: 540002a1     	b.ne	0x9f7cf0 <_ZN7cocos2d6GLViewD2Ev+0xb4>
  9f7ca0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7ca4: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9f7ca8: d65f03c0     	ret
  9f7cac: b0002a61     	adrp	x1, 0xf44000
  9f7cb0: f9445021     	ldr	x1, [x1, #0x8a0]
  9f7cb4: b4000161     	cbz	x1, 0x9f7ce0 <_ZN7cocos2d6GLViewD2Ev+0xa4>
  9f7cb8: d1002042     	sub	x2, x2, #0x8
  9f7cbc: 885ffc41     	ldaxr	w1, [x2]
  9f7cc0: 51000423     	sub	w3, w1, #0x1
  9f7cc4: 8804fc43     	stlxr	w4, w3, [x2]
  9f7cc8: 35ffffa4     	cbnz	w4, 0x9f7cbc <_ZN7cocos2d6GLViewD2Ev+0x80>
  9f7ccc: 6b1f003f     	cmp	w1, wzr
  9f7cd0: 54fffdac     	b.gt	0x9f7c84 <_ZN7cocos2d6GLViewD2Ev+0x48>
  9f7cd4: 910083a1     	add	x1, x29, #0x20
  9f7cd8: 94074ab9     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f7cdc: 17ffffea     	b	0x9f7c84 <_ZN7cocos2d6GLViewD2Ev+0x48>
  9f7ce0: b85f8041     	ldur	w1, [x2, #-0x8]
  9f7ce4: 51000423     	sub	w3, w1, #0x1
  9f7ce8: b81f8043     	stur	w3, [x2, #-0x8]
  9f7cec: 17fffff8     	b	0x9f7ccc <_ZN7cocos2d6GLViewD2Ev+0x90>
  9f7cf0: 97e68dac     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000009f7cf4 <_ZN7cocos2d6GLViewD0Ev>:
  9f7cf4: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7cf8: 910003fd     	mov	x29, sp
  9f7cfc: f9000bf3     	str	x19, [sp, #0x10]
  9f7d00: aa0003f3     	mov	x19, x0
  9f7d04: 97ffffce     	bl	0x9f7c3c <_ZN7cocos2d6GLViewD2Ev>
  9f7d08: aa1303e0     	mov	x0, x19
  9f7d0c: f9400bf3     	ldr	x19, [sp, #0x10]
  9f7d10: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7d14: 1406107d     	b	0xb7bf08 <_ZdlPv>

00000000009f7d18 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv>:
  9f7d18: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7d1c: 910003fd     	mov	x29, sp
  9f7d20: bd402400     	ldr	s0, [x0, #0x24]
  9f7d24: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7d28: 1e202018     	fcmpe	s0, #0.0
  9f7d2c: 5400070d     	b.le	0x9f7e0c <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0xf4>
  9f7d30: bd402804     	ldr	s4, [x0, #0x28]
  9f7d34: 1e202098     	fcmpe	s4, #0.0
  9f7d38: 540006ad     	b.le	0x9f7e0c <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0xf4>
  9f7d3c: bd402c02     	ldr	s2, [x0, #0x2c]
  9f7d40: 1e202058     	fcmpe	s2, #0.0
  9f7d44: 5400064d     	b.le	0x9f7e0c <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0xf4>
  9f7d48: bd403003     	ldr	s3, [x0, #0x30]
  9f7d4c: 1e202078     	fcmpe	s3, #0.0
  9f7d50: 540005ed     	b.le	0x9f7e0c <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0xf4>
  9f7d54: 1e221805     	fdiv	s5, s0, s2
  9f7d58: b9405801     	ldr	w1, [x0, #0x58]
  9f7d5c: 7100043f     	cmp	w1, #0x1
  9f7d60: 1e231881     	fdiv	s1, s4, s3
  9f7d64: bd005005     	str	s5, [x0, #0x50]
  9f7d68: bd005401     	str	s1, [x0, #0x54]
  9f7d6c: 54000620     	b.eq	0x9f7e30 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x118>
  9f7d70: 7100083f     	cmp	w1, #0x2
  9f7d74: 540006a0     	b.eq	0x9f7e48 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x130>
  9f7d78: 71000c3f     	cmp	w1, #0x3
  9f7d7c: 540004e0     	b.eq	0x9f7e18 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x100>
  9f7d80: 7100103f     	cmp	w1, #0x4
  9f7d84: 54000700     	b.eq	0x9f7e64 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x14c>
  9f7d88: 1e210863     	fmul	s3, s3, s1
  9f7d8c: aa0003f3     	mov	x19, x0
  9f7d90: 1e250842     	fmul	s2, s2, s5
  9f7d94: 9100d000     	add	x0, x0, #0x34
  9f7d98: 1e2c1001     	fmov	s1, #0.50000000
  9f7d9c: 1e233884     	fsub	s4, s4, s3
  9f7da0: 1e223800     	fsub	s0, s0, s2
  9f7da4: 1e210800     	fmul	s0, s0, s1
  9f7da8: 1e210881     	fmul	s1, s4, s1
  9f7dac: 9400170a     	bl	0x9fd9d4 <_ZN7cocos2d4Rect7setRectEffff>
  9f7db0: 94007dfb     	bl	0xa1759c <_ZN7cocos2d8Director11getInstanceEv>
  9f7db4: aa0003f4     	mov	x20, x0
  9f7db8: f9400261     	ldr	x1, [x19]
  9f7dbc: aa1303e0     	mov	x0, x19
  9f7dc0: f9405c21     	ldr	x1, [x1, #0xb8]
  9f7dc4: d63f0020     	blr	x1
  9f7dc8: aa0003e1     	mov	x1, x0
  9f7dcc: 9107e280     	add	x0, x20, #0x1f8
  9f7dd0: 940016dc     	bl	0x9fd940 <_ZN7cocos2d4SizeaSERKS0_>
  9f7dd4: b941f681     	ldr	w1, [x20, #0x1f4]
  9f7dd8: aa1403e0     	mov	x0, x20
  9f7ddc: 52800022     	mov	w2, #0x1                // =1
  9f7de0: 3908a282     	strb	w2, [x20, #0x228]
  9f7de4: 9400767f     	bl	0xa157e0 <_ZN7cocos2d8Director13setProjectionENS0_10ProjectionE>
  9f7de8: bd402661     	ldr	s1, [x19, #0x24]
  9f7dec: 52800000     	mov	w0, #0x0                // =0
  9f7df0: bd402a60     	ldr	s0, [x19, #0x28]
  9f7df4: 52800001     	mov	w1, #0x0                // =0
  9f7df8: 1e380022     	fcvtzs	w2, s1
  9f7dfc: 1e380003     	fcvtzs	w3, s0
  9f7e00: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7e04: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7e08: 17e68b02     	b	0x39aa10 <glViewport@plt>
  9f7e0c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7e10: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7e14: d65f03c0     	ret
  9f7e18: 1e211802     	fdiv	s2, s0, s1
  9f7e1c: bd005001     	str	s1, [x0, #0x50]
  9f7e20: 1e204025     	fmov	s5, s1
  9f7e24: 1e24c042     	frintp	s2, s2
  9f7e28: bd002c02     	str	s2, [x0, #0x2c]
  9f7e2c: 17ffffd7     	b	0x9f7d88 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x70>
  9f7e30: 1e2120b0     	fcmpe	s5, s1
  9f7e34: 540000e5     	b.pl	0x9f7e50 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x138>
  9f7e38: bd005401     	str	s1, [x0, #0x54]
  9f7e3c: bd005001     	str	s1, [x0, #0x50]
  9f7e40: 1e204025     	fmov	s5, s1
  9f7e44: 17ffffd1     	b	0x9f7d88 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x70>
  9f7e48: 1e2120b0     	fcmpe	s5, s1
  9f7e4c: 54ffff6c     	b.gt	0x9f7e38 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x120>
  9f7e50: 1e2040a1     	fmov	s1, s5
  9f7e54: bd005401     	str	s1, [x0, #0x54]
  9f7e58: bd005001     	str	s1, [x0, #0x50]
  9f7e5c: 1e204025     	fmov	s5, s1
  9f7e60: 17ffffca     	b	0x9f7d88 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x70>
  9f7e64: 1e251883     	fdiv	s3, s4, s5
  9f7e68: 1e2040a1     	fmov	s1, s5
  9f7e6c: bd005405     	str	s5, [x0, #0x54]
  9f7e70: 1e24c063     	frintp	s3, s3
  9f7e74: bd003003     	str	s3, [x0, #0x30]
  9f7e78: 17ffffc4     	b	0x9f7d88 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv+0x70>

00000000009f7e7c <_ZN7cocos2d6GLView23setDesignResolutionSizeEff16ResolutionPolicy>:
  9f7e7c: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7e80: 1e202008     	fcmp	s0, #0.0
  9f7e84: 910003fd     	mov	x29, sp
  9f7e88: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7e8c: 54000180     	b.eq	0x9f7ebc <_ZN7cocos2d6GLView23setDesignResolutionSizeEff16ResolutionPolicy+0x40>
  9f7e90: 1e202028     	fcmp	s1, #0.0
  9f7e94: 54000140     	b.eq	0x9f7ebc <_ZN7cocos2d6GLView23setDesignResolutionSizeEff16ResolutionPolicy+0x40>
  9f7e98: aa0003f3     	mov	x19, x0
  9f7e9c: 9100b000     	add	x0, x0, #0x2c
  9f7ea0: 2a0103f4     	mov	w20, w1
  9f7ea4: 940016a4     	bl	0x9fd934 <_ZN7cocos2d4Size7setSizeEff>
  9f7ea8: b9005a74     	str	w20, [x19, #0x58]
  9f7eac: aa1303e0     	mov	x0, x19
  9f7eb0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7eb4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7eb8: 17ffff98     	b	0x9f7d18 <_ZN7cocos2d6GLView26updateDesignResolutionSizeEv>
  9f7ebc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7ec0: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7ec4: d65f03c0     	ret

00000000009f7ec8 <_ZNK7cocos2d6GLView11getViewNameEv>:
  9f7ec8: 91012000     	add	x0, x0, #0x48
  9f7ecc: d65f03c0     	ret

00000000009f7ed0 <_ZNK7cocos2d6GLView15getViewPortRectEv>:
  9f7ed0: 9100d000     	add	x0, x0, #0x34
  9f7ed4: d65f03c0     	ret

00000000009f7ed8 <_ZNK7cocos2d6GLView9getScaleXEv>:
  9f7ed8: bd405000     	ldr	s0, [x0, #0x50]
  9f7edc: d65f03c0     	ret

00000000009f7ee0 <_ZNK7cocos2d6GLView9getScaleYEv>:
  9f7ee0: bd405400     	ldr	s0, [x0, #0x54]
  9f7ee4: d65f03c0     	ret

00000000009f7ee8 <_ZN7cocos2d6GLView11renderSceneEPNS_5SceneEPNS_8RendererE>:
  9f7ee8: a9bf7bfd     	stp	x29, x30, [sp, #-0x10]!
  9f7eec: aa0203e4     	mov	x4, x2
  9f7ef0: 910003fd     	mov	x29, sp
  9f7ef4: f9403000     	ldr	x0, [x0, #0x60]
  9f7ef8: b40000c0     	cbz	x0, 0x9f7f10 <_ZN7cocos2d6GLView11renderSceneEPNS_5SceneEPNS_8RendererE+0x28>
  9f7efc: f9400003     	ldr	x3, [x0]
  9f7f00: f9401063     	ldr	x3, [x3, #0x20]
  9f7f04: d63f0060     	blr	x3
  9f7f08: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9f7f0c: d65f03c0     	ret
  9f7f10: f9400022     	ldr	x2, [x1]
  9f7f14: aa0103e0     	mov	x0, x1
  9f7f18: aa0403e1     	mov	x1, x4
  9f7f1c: d2800003     	mov	x3, #0x0                // =0
  9f7f20: f9429c44     	ldr	x4, [x2, #0x538]
  9f7f24: 90002a62     	adrp	x2, 0xf43000
  9f7f28: f943f842     	ldr	x2, [x2, #0x7f0]
  9f7f2c: d63f0080     	blr	x4
  9f7f30: a8c17bfd     	ldp	x29, x30, [sp], #0x10
  9f7f34: d65f03c0     	ret

00000000009f7f38 <_ZNK7cocos2d6GLView5getVREv>:
  9f7f38: f9403000     	ldr	x0, [x0, #0x60]
  9f7f3c: d65f03c0     	ret

00000000009f7f40 <_ZN7cocos2d6GLView5setVREPNS_11VRIRendererE>:
  9f7f40: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f7f44: 910003fd     	mov	x29, sp
  9f7f48: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7f4c: aa0003f4     	mov	x20, x0
  9f7f50: f9403000     	ldr	x0, [x0, #0x60]
  9f7f54: eb01001f     	cmp	x0, x1
  9f7f58: 54000240     	b.eq	0x9f7fa0 <_ZN7cocos2d6GLView5setVREPNS_11VRIRendererE+0x60>
  9f7f5c: aa0103f3     	mov	x19, x1
  9f7f60: b4000120     	cbz	x0, 0x9f7f84 <_ZN7cocos2d6GLView5setVREPNS_11VRIRendererE+0x44>
  9f7f64: f9400001     	ldr	x1, [x0]
  9f7f68: f9400c21     	ldr	x1, [x1, #0x18]
  9f7f6c: d63f0020     	blr	x1
  9f7f70: f9403280     	ldr	x0, [x20, #0x60]
  9f7f74: b4000080     	cbz	x0, 0x9f7f84 <_ZN7cocos2d6GLView5setVREPNS_11VRIRendererE+0x44>
  9f7f78: f9400001     	ldr	x1, [x0]
  9f7f7c: f9400421     	ldr	x1, [x1, #0x8]
  9f7f80: d63f0020     	blr	x1
  9f7f84: b40000d3     	cbz	x19, 0x9f7f9c <_ZN7cocos2d6GLView5setVREPNS_11VRIRendererE+0x5c>
  9f7f88: f9400262     	ldr	x2, [x19]
  9f7f8c: aa1303e0     	mov	x0, x19
  9f7f90: aa1403e1     	mov	x1, x20
  9f7f94: f9400842     	ldr	x2, [x2, #0x10]
  9f7f98: d63f0040     	blr	x2
  9f7f9c: f9003293     	str	x19, [x20, #0x60]
  9f7fa0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f7fa4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f7fa8: d65f03c0     	ret

00000000009f7fac <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_>:
  9f7fac: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f7fb0: 910003fd     	mov	x29, sp
  9f7fb4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f7fb8: aa0003f4     	mov	x20, x0
  9f7fbc: f9400000     	ldr	x0, [x0]
  9f7fc0: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f7fc4: f9400693     	ldr	x19, [x20, #0x8]
  9f7fc8: cb000273     	sub	x19, x19, x0
  9f7fcc: 9343fe62     	asr	x2, x19, #3
  9f7fd0: b4000402     	cbz	x2, 0x9f8050 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0xa4>
  9f7fd4: d37ff843     	lsl	x3, x2, #1
  9f7fd8: 928000f6     	mov	x22, #-0x8              // =-8
  9f7fdc: eb03005f     	cmp	x2, x3
  9f7fe0: 540003a8     	b.hi	0x9f8054 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0xa8>
  9f7fe4: 92fc0004     	mov	x4, #0x1fffffffffffffff // =2305843009213693951
  9f7fe8: eb04007f     	cmp	x3, x4
  9f7fec: 54000348     	b.hi	0x9f8054 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0xa8>
  9f7ff0: d37cec56     	lsl	x22, x2, #4
  9f7ff4: d2800015     	mov	x21, #0x0               // =0
  9f7ff8: b50002e3     	cbnz	x3, 0x9f8054 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0xa8>
  9f7ffc: ab1302bf     	cmn	x21, x19
  9f8000: f9400021     	ldr	x1, [x1]
  9f8004: 540000a0     	b.eq	0x9f8018 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0x6c>
  9f8008: f8336aa1     	str	x1, [x21, x19]
  9f800c: f9400280     	ldr	x0, [x20]
  9f8010: f9400693     	ldr	x19, [x20, #0x8]
  9f8014: cb000273     	sub	x19, x19, x0
  9f8018: 9343fe61     	asr	x1, x19, #3
  9f801c: b50002e1     	cbnz	x1, 0x9f8078 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0xcc>
  9f8020: 91002273     	add	x19, x19, #0x8
  9f8024: 8b1302b3     	add	x19, x21, x19
  9f8028: b4000040     	cbz	x0, 0x9f8030 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0x84>
  9f802c: 94060fb7     	bl	0xb7bf08 <_ZdlPv>
  9f8030: f9000295     	str	x21, [x20]
  9f8034: 8b1602b6     	add	x22, x21, x22
  9f8038: f9000693     	str	x19, [x20, #0x8]
  9f803c: f9000a96     	str	x22, [x20, #0x10]
  9f8040: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8044: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f8048: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f804c: d65f03c0     	ret
  9f8050: d2800116     	mov	x22, #0x8               // =8
  9f8054: aa1603e0     	mov	x0, x22
  9f8058: f9001fa1     	str	x1, [x29, #0x38]
  9f805c: 9406166b     	bl	0xb7da08 <_Znwm>
  9f8060: f9400693     	ldr	x19, [x20, #0x8]
  9f8064: aa0003f5     	mov	x21, x0
  9f8068: f9400280     	ldr	x0, [x20]
  9f806c: f9401fa1     	ldr	x1, [x29, #0x38]
  9f8070: cb000273     	sub	x19, x19, x0
  9f8074: 17ffffe2     	b	0x9f7ffc <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0x50>
  9f8078: aa0003e1     	mov	x1, x0
  9f807c: aa1303e2     	mov	x2, x19
  9f8080: aa1503e0     	mov	x0, x21
  9f8084: 97e68e3f     	bl	0x39b980 <memmove@plt>
  9f8088: f9400280     	ldr	x0, [x20]
  9f808c: 17ffffe5     	b	0x9f8020 <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_+0x74>

00000000009f8090 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_>:
  9f8090: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
  9f8094: 910003fd     	mov	x29, sp
  9f8098: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f809c: aa0203fa     	mov	x26, x2
  9f80a0: f90037a1     	str	x1, [x29, #0x68]
  9f80a4: 90002a41     	adrp	x1, 0xf40000
  9f80a8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f80ac: 910203b6     	add	x22, x29, #0x80
  9f80b0: aa0003f5     	mov	x21, x0
  9f80b4: f940e422     	ldr	x2, [x1, #0x1c8]
  9f80b8: aa1603e0     	mov	x0, x22
  9f80bc: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f80c0: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f80c4: f9400042     	ldr	x2, [x2]
  9f80c8: aa0303fb     	mov	x27, x3
  9f80cc: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f80d0: aa0403fc     	mov	x28, x4
  9f80d4: aa0503f7     	mov	x23, x5
  9f80d8: aa0603f8     	mov	x24, x6
  9f80dc: f9006fa2     	str	x2, [x29, #0xd8]
  9f80e0: 9400b20f     	bl	0xa2491c <_ZN7cocos2d10EventTouchC2Ev>
  9f80e4: f94037a1     	ldr	x1, [x29, #0x68]
  9f80e8: 6b1f003f     	cmp	w1, wzr
  9f80ec: 5400084d     	b.le	0x9f81f4 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x164>
  9f80f0: 910102c0     	add	x0, x22, #0x40
  9f80f4: 51000421     	sub	w1, w1, #0x1
  9f80f8: d0002b94     	adrp	x20, 0xf6a000 <app_pkey_methods+0x13a8>
  9f80fc: f90037a0     	str	x0, [x29, #0x68]
  9f8100: 91000439     	add	x25, x1, #0x1
  9f8104: 9101e3a0     	add	x0, x29, #0x78
  9f8108: d2800013     	mov	x19, #0x0               // =0
  9f810c: 9130c294     	add	x20, x20, #0xc30
  9f8110: f90033a0     	str	x0, [x29, #0x60]
  9f8114: f8737b42     	ldr	x2, [x26, x19, lsl #3]
  9f8118: bc737b61     	ldr	s1, [x27, x19, lsl #2]
  9f811c: bc737b80     	ldr	s0, [x28, x19, lsl #2]
  9f8120: b4000c37     	cbz	x23, 0x9f82a4 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x214>
  9f8124: bc737ae3     	ldr	s3, [x23, x19, lsl #2]
  9f8128: b4000c38     	cbz	x24, 0x9f82ac <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x21c>
  9f812c: bc737b02     	ldr	s2, [x24, x19, lsl #2]
  9f8130: f9400a80     	ldr	x0, [x20, #0x10]
  9f8134: b40005a0     	cbz	x0, 0x9f81e8 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x158>
  9f8138: 91002283     	add	x3, x20, #0x8
  9f813c: f9401001     	ldr	x1, [x0, #0x20]
  9f8140: eb01005f     	cmp	x2, x1
  9f8144: 540008ec     	b.gt	0x9f8260 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x1d0>
  9f8148: aa0003e3     	mov	x3, x0
  9f814c: f9400800     	ldr	x0, [x0, #0x10]
  9f8150: b5ffff60     	cbnz	x0, 0x9f813c <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0xac>
  9f8154: 91002280     	add	x0, x20, #0x8
  9f8158: eb00007f     	cmp	x3, x0
  9f815c: 54000460     	b.eq	0x9f81e8 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x158>
  9f8160: f9401060     	ldr	x0, [x3, #0x20]
  9f8164: eb00005f     	cmp	x2, x0
  9f8168: 5400040b     	b.lt	0x9f81e8 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x158>
  9f816c: b9402861     	ldr	w1, [x3, #0x28]
  9f8170: 9100c280     	add	x0, x20, #0x30
  9f8174: f861d800     	ldr	x0, [x0, w1, sxtw #3]
  9f8178: f9003fa0     	str	x0, [x29, #0x78]
  9f817c: b4000a80     	cbz	x0, 0x9f82cc <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x23c>
  9f8180: bd4036a5     	ldr	s5, [x21, #0x34]
  9f8184: f8434003     	ldur	x3, [x0, #0x34]
  9f8188: bd403aa4     	ldr	s4, [x21, #0x38]
  9f818c: 3940a002     	ldrb	w2, [x0, #0x28]
  9f8190: 1e253821     	fsub	s1, s1, s5
  9f8194: 1e243800     	fsub	s0, s0, s4
  9f8198: bd4052a5     	ldr	s5, [x21, #0x50]
  9f819c: bd4056a4     	ldr	s4, [x21, #0x54]
  9f81a0: b9002401     	str	w1, [x0, #0x24]
  9f81a4: 1e251821     	fdiv	s1, s1, s5
  9f81a8: f803c003     	stur	x3, [x0, #0x3c]
  9f81ac: bd004403     	str	s3, [x0, #0x44]
  9f81b0: bd004802     	str	s2, [x0, #0x48]
  9f81b4: 1e241800     	fdiv	s0, s0, s4
  9f81b8: bd003401     	str	s1, [x0, #0x34]
  9f81bc: bd003800     	str	s0, [x0, #0x38]
  9f81c0: 34000562     	cbz	w2, 0x9f826c <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x1dc>
  9f81c4: f94026c1     	ldr	x1, [x22, #0x48]
  9f81c8: f9402ac2     	ldr	x2, [x22, #0x50]
  9f81cc: eb02003f     	cmp	x1, x2
  9f81d0: 54000620     	b.eq	0x9f8294 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x204>
  9f81d4: b4000061     	cbz	x1, 0x9f81e0 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x150>
  9f81d8: f9000020     	str	x0, [x1]
  9f81dc: f94026c1     	ldr	x1, [x22, #0x48]
  9f81e0: 91002021     	add	x1, x1, #0x8
  9f81e4: f90026c1     	str	x1, [x22, #0x48]
  9f81e8: 91000673     	add	x19, x19, #0x1
  9f81ec: eb19027f     	cmp	x19, x25
  9f81f0: 54fff921     	b.ne	0x9f8114 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x84>
  9f81f4: f94063a2     	ldr	x2, [x29, #0xc0]
  9f81f8: f94067a1     	ldr	x1, [x29, #0xc8]
  9f81fc: aa0203e0     	mov	x0, x2
  9f8200: cb020021     	sub	x1, x1, x2
  9f8204: 9343fc21     	asr	x1, x1, #3
  9f8208: b5000561     	cbnz	x1, 0x9f82b4 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x224>
  9f820c: 90002a81     	adrp	x1, 0xf48000
  9f8210: f9402421     	ldr	x1, [x1, #0x48]
  9f8214: 91004021     	add	x1, x1, #0x10
  9f8218: f90043a1     	str	x1, [x29, #0x80]
  9f821c: b4000040     	cbz	x0, 0x9f8224 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x194>
  9f8220: 94060f3a     	bl	0xb7bf08 <_ZdlPv>
  9f8224: aa1603e0     	mov	x0, x22
  9f8228: 94008445     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f822c: 90002a40     	adrp	x0, 0xf40000
  9f8230: f9406fa1     	ldr	x1, [x29, #0xd8]
  9f8234: f940e400     	ldr	x0, [x0, #0x1c8]
  9f8238: f9400000     	ldr	x0, [x0]
  9f823c: eb00003f     	cmp	x1, x0
  9f8240: 540004a1     	b.ne	0x9f82d4 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x244>
  9f8244: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8248: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f824c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f8250: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f8254: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f8258: a8ce7bfd     	ldp	x29, x30, [sp], #0xe0
  9f825c: d65f03c0     	ret
  9f8260: f9400c00     	ldr	x0, [x0, #0x18]
  9f8264: b5fff6c0     	cbnz	x0, 0x9f813c <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0xac>
  9f8268: 17ffffbb     	b	0x9f8154 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0xc4>
  9f826c: f8434002     	ldur	x2, [x0, #0x34]
  9f8270: f802c002     	stur	x2, [x0, #0x2c]
  9f8274: aa0203e1     	mov	x1, x2
  9f8278: 52800022     	mov	w2, #0x1                // =1
  9f827c: f803c001     	stur	x1, [x0, #0x3c]
  9f8280: 3900a002     	strb	w2, [x0, #0x28]
  9f8284: f94026c1     	ldr	x1, [x22, #0x48]
  9f8288: f9402ac2     	ldr	x2, [x22, #0x50]
  9f828c: eb02003f     	cmp	x1, x2
  9f8290: 54fffa21     	b.ne	0x9f81d4 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x144>
  9f8294: f94037a0     	ldr	x0, [x29, #0x68]
  9f8298: f94033a1     	ldr	x1, [x29, #0x60]
  9f829c: 97ffff44     	bl	0x9f7fac <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_>
  9f82a0: 17ffffd2     	b	0x9f81e8 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x158>
  9f82a4: 1e2703e3     	fmov	s3, wzr
  9f82a8: b5fff438     	cbnz	x24, 0x9f812c <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x9c>
  9f82ac: 1e2703e2     	fmov	s2, wzr
  9f82b0: 17ffffa0     	b	0x9f8130 <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0xa0>
  9f82b4: 52800020     	mov	w0, #0x1                // =1
  9f82b8: b900bba0     	str	w0, [x29, #0xb8]
  9f82bc: 94007cb8     	bl	0xa1759c <_ZN7cocos2d8Director11getInstanceEv>
  9f82c0: f9409400     	ldr	x0, [x0, #0x128]
  9f82c4: aa1603e1     	mov	x1, x22
  9f82c8: 9400a3c1     	bl	0xa211cc <_ZN7cocos2d15EventDispatcher13dispatchEventEPNS_5EventE>
  9f82cc: f94063a0     	ldr	x0, [x29, #0xc0]
  9f82d0: 17ffffcf     	b	0x9f820c <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x17c>
  9f82d4: 97e68c33     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f82d8: aa0003f3     	mov	x19, x0
  9f82dc: 90002a80     	adrp	x0, 0xf48000
  9f82e0: f94063a1     	ldr	x1, [x29, #0xc0]
  9f82e4: f9402400     	ldr	x0, [x0, #0x48]
  9f82e8: 91004000     	add	x0, x0, #0x10
  9f82ec: f90043a0     	str	x0, [x29, #0x80]
  9f82f0: b4000061     	cbz	x1, 0x9f82fc <_ZN7cocos2d6GLView17handleTouchesMoveEiPlPfS2_S2_S2_+0x26c>
  9f82f4: aa0103e0     	mov	x0, x1
  9f82f8: 94060f04     	bl	0xb7bf08 <_ZdlPv>
  9f82fc: aa1603e0     	mov	x0, x22
  9f8300: 9400840f     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f8304: aa1303e0     	mov	x0, x19
  9f8308: 9407aaf6     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f830c <_ZNK7cocos2d6GLView13getAllTouchesEv>:
  9f830c: d0002b80     	adrp	x0, 0xf6a000 <app_pkey_methods+0x13a8>
  9f8310: a9bd7bfd     	stp	x29, x30, [sp, #-0x30]!
  9f8314: 9130c000     	add	x0, x0, #0xc30
  9f8318: 910003fd     	mov	x29, sp
  9f831c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8320: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f8324: b940a814     	ldr	w20, [x0, #0xa8]
  9f8328: aa0803f5     	mov	x21, x8
  9f832c: 9100c013     	add	x19, x0, #0x30
  9f8330: 9102a016     	add	x22, x0, #0xa8
  9f8334: f900011f     	str	xzr, [x8]
  9f8338: f900051f     	str	xzr, [x8, #0x8]
  9f833c: f900091f     	str	xzr, [x8, #0x10]
  9f8340: 36000174     	tbz	w20, #0x0, 0x9f836c <_ZNK7cocos2d6GLView13getAllTouchesEv+0x60>
  9f8344: f94006a0     	ldr	x0, [x21, #0x8]
  9f8348: f9400aa1     	ldr	x1, [x21, #0x10]
  9f834c: eb01001f     	cmp	x0, x1
  9f8350: 54000200     	b.eq	0x9f8390 <_ZNK7cocos2d6GLView13getAllTouchesEv+0x84>
  9f8354: f9400261     	ldr	x1, [x19]
  9f8358: b4000060     	cbz	x0, 0x9f8364 <_ZNK7cocos2d6GLView13getAllTouchesEv+0x58>
  9f835c: f9000001     	str	x1, [x0]
  9f8360: f94006a0     	ldr	x0, [x21, #0x8]
  9f8364: 91002000     	add	x0, x0, #0x8
  9f8368: f90006a0     	str	x0, [x21, #0x8]
  9f836c: 91002273     	add	x19, x19, #0x8
  9f8370: 13017e94     	asr	w20, w20, #1
  9f8374: eb16027f     	cmp	x19, x22
  9f8378: 54fffe41     	b.ne	0x9f8340 <_ZNK7cocos2d6GLView13getAllTouchesEv+0x34>
  9f837c: aa1503e0     	mov	x0, x21
  9f8380: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8384: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f8388: a8c37bfd     	ldp	x29, x30, [sp], #0x30
  9f838c: d65f03c0     	ret
  9f8390: aa1503e0     	mov	x0, x21
  9f8394: aa1303e1     	mov	x1, x19
  9f8398: 97ffff05     	bl	0x9f7fac <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_>
  9f839c: 17fffff4     	b	0x9f836c <_ZNK7cocos2d6GLView13getAllTouchesEv+0x60>
  9f83a0: f94002a1     	ldr	x1, [x21]
  9f83a4: aa0003f3     	mov	x19, x0
  9f83a8: b4000061     	cbz	x1, 0x9f83b4 <_ZNK7cocos2d6GLView13getAllTouchesEv+0xa8>
  9f83ac: aa0103e0     	mov	x0, x1
  9f83b0: 94060ed6     	bl	0xb7bf08 <_ZdlPv>
  9f83b4: aa1303e0     	mov	x0, x19
  9f83b8: 9407aaca     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f83bc <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_>:
  9f83bc: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f83c0: 910003fd     	mov	x29, sp
  9f83c4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f83c8: f9400813     	ldr	x19, [x0, #0x10]
  9f83cc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f83d0: aa0003f5     	mov	x21, x0
  9f83d4: 91002016     	add	x22, x0, #0x8
  9f83d8: b4000333     	cbz	x19, 0x9f843c <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x80>
  9f83dc: f9400025     	ldr	x5, [x1]
  9f83e0: 52800004     	mov	w4, #0x0                // =0
  9f83e4: f9401262     	ldr	x2, [x19, #0x20]
  9f83e8: eb0200bf     	cmp	x5, x2
  9f83ec: 5400012a     	b.ge	0x9f8410 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x54>
  9f83f0: f9400a60     	ldr	x0, [x19, #0x10]
  9f83f4: 52800024     	mov	w4, #0x1                // =1
  9f83f8: b4000100     	cbz	x0, 0x9f8418 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x5c>
  9f83fc: aa0003f3     	mov	x19, x0
  9f8400: 52800004     	mov	w4, #0x0                // =0
  9f8404: f9401262     	ldr	x2, [x19, #0x20]
  9f8408: eb0200bf     	cmp	x5, x2
  9f840c: 54ffff2b     	b.lt	0x9f83f0 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x34>
  9f8410: f9400e60     	ldr	x0, [x19, #0x18]
  9f8414: b5ffff40     	cbnz	x0, 0x9f83fc <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x40>
  9f8418: aa1303e0     	mov	x0, x19
  9f841c: 35000124     	cbnz	w4, 0x9f8440 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x84>
  9f8420: eb05005f     	cmp	x2, x5
  9f8424: 5400024b     	b.lt	0x9f846c <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0xb0>
  9f8428: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f842c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f8430: d2800001     	mov	x1, #0x0                // =0
  9f8434: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f8438: d65f03c0     	ret
  9f843c: aa1603f3     	mov	x19, x22
  9f8440: f9400ea2     	ldr	x2, [x21, #0x18]
  9f8444: eb02027f     	cmp	x19, x2
  9f8448: 54000140     	b.eq	0x9f8470 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0xb4>
  9f844c: aa1303e0     	mov	x0, x19
  9f8450: f9001fa1     	str	x1, [x29, #0x38]
  9f8454: 9406cfef     	bl	0xbac410 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x2dde8>
  9f8458: f9401002     	ldr	x2, [x0, #0x20]
  9f845c: f9401fa1     	ldr	x1, [x29, #0x38]
  9f8460: f9400025     	ldr	x5, [x1]
  9f8464: eb05005f     	cmp	x2, x5
  9f8468: 54fffe0a     	b.ge	0x9f8428 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x6c>
  9f846c: aa1303e2     	mov	x2, x19
  9f8470: eb0202df     	cmp	x22, x2
  9f8474: 540003e0     	b.eq	0x9f84f0 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0x134>
  9f8478: f9400023     	ldr	x3, [x1]
  9f847c: f9401040     	ldr	x0, [x2, #0x20]
  9f8480: eb00007f     	cmp	x3, x0
  9f8484: 1a9fa7f3     	cset	w19, lt
  9f8488: d2800600     	mov	x0, #0x30               // =48
  9f848c: f9001ba1     	str	x1, [x29, #0x30]
  9f8490: f9001fa2     	str	x2, [x29, #0x38]
  9f8494: 9406155d     	bl	0xb7da08 <_Znwm>
  9f8498: aa0003f4     	mov	x20, x0
  9f849c: f9401ba1     	ldr	x1, [x29, #0x30]
  9f84a0: 2a1303e0     	mov	w0, w19
  9f84a4: f9401fa2     	ldr	x2, [x29, #0x38]
  9f84a8: f9400024     	ldr	x4, [x1]
  9f84ac: b9400823     	ldr	w3, [x1, #0x8]
  9f84b0: aa1403e1     	mov	x1, x20
  9f84b4: f9001284     	str	x4, [x20, #0x20]
  9f84b8: b9002a83     	str	w3, [x20, #0x28]
  9f84bc: aa1603e3     	mov	x3, x22
  9f84c0: 9406d03c     	bl	0xbac5b0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x2df88>
  9f84c4: f94016a2     	ldr	x2, [x21, #0x28]
  9f84c8: d2800001     	mov	x1, #0x0                // =0
  9f84cc: aa1403e0     	mov	x0, x20
  9f84d0: 91000442     	add	x2, x2, #0x1
  9f84d4: f90016a2     	str	x2, [x21, #0x28]
  9f84d8: d2800022     	mov	x2, #0x1                // =1
  9f84dc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f84e0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f84e4: b3401c41     	bfxil	x1, x2, #0, #8
  9f84e8: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f84ec: d65f03c0     	ret
  9f84f0: 52800033     	mov	w19, #0x1               // =1
  9f84f4: 17ffffe5     	b	0x9f8488 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_+0xcc>

00000000009f84f8 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_>:
  9f84f8: a9af7bfd     	stp	x29, x30, [sp, #-0x110]!
  9f84fc: 910003fd     	mov	x29, sp
  9f8500: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f8504: 6d0627e8     	stp	d8, d9, [sp, #0x60]
  9f8508: aa0203f8     	mov	x24, x2
  9f850c: 9102c3a5     	add	x5, x29, #0xb0
  9f8510: f90043a1     	str	x1, [x29, #0x80]
  9f8514: 90002a41     	adrp	x1, 0xf40000
  9f8518: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f851c: aa0003fc     	mov	x28, x0
  9f8520: aa0503e0     	mov	x0, x5
  9f8524: f940e422     	ldr	x2, [x1, #0x1c8]
  9f8528: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f852c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8530: f9400042     	ldr	x2, [x2]
  9f8534: aa0303f9     	mov	x25, x3
  9f8538: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f853c: f90047a5     	str	x5, [x29, #0x88]
  9f8540: aa0403fa     	mov	x26, x4
  9f8544: f90087a2     	str	x2, [x29, #0x108]
  9f8548: 9400b0f5     	bl	0xa2491c <_ZN7cocos2d10EventTouchC2Ev>
  9f854c: f94043a1     	ldr	x1, [x29, #0x80]
  9f8550: 6b1f003f     	cmp	w1, wzr
  9f8554: 540003ed     	b.le	0x9f85d0 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xd8>
  9f8558: 910283a0     	add	x0, x29, #0xa0
  9f855c: 51000421     	sub	w1, w1, #0x1
  9f8560: d0002b95     	adrp	x21, 0xf6a000 <app_pkey_methods+0x13a8>
  9f8564: f90043a0     	str	x0, [x29, #0x80]
  9f8568: 91000436     	add	x22, x1, #0x1
  9f856c: 910263a0     	add	x0, x29, #0x98
  9f8570: d2800014     	mov	x20, #0x0               // =0
  9f8574: 9130c2b5     	add	x21, x21, #0xc30
  9f8578: f9003fa0     	str	x0, [x29, #0x78]
  9f857c: f9400aa0     	ldr	x0, [x21, #0x10]
  9f8580: f8747b13     	ldr	x19, [x24, x20, lsl #3]
  9f8584: bc747b29     	ldr	s9, [x25, x20, lsl #2]
  9f8588: bc747b48     	ldr	s8, [x26, x20, lsl #2]
  9f858c: b40005e0     	cbz	x0, 0x9f8648 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x150>
  9f8590: 910022a2     	add	x2, x21, #0x8
  9f8594: f9401001     	ldr	x1, [x0, #0x20]
  9f8598: eb01027f     	cmp	x19, x1
  9f859c: 5400050c     	b.gt	0x9f863c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x144>
  9f85a0: aa0003e2     	mov	x2, x0
  9f85a4: f9400800     	ldr	x0, [x0, #0x10]
  9f85a8: b5ffff60     	cbnz	x0, 0x9f8594 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x9c>
  9f85ac: 910022a0     	add	x0, x21, #0x8
  9f85b0: eb00005f     	cmp	x2, x0
  9f85b4: 540004a0     	b.eq	0x9f8648 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x150>
  9f85b8: f9401040     	ldr	x0, [x2, #0x20]
  9f85bc: eb00027f     	cmp	x19, x0
  9f85c0: 5400044b     	b.lt	0x9f8648 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x150>
  9f85c4: 91000694     	add	x20, x20, #0x1
  9f85c8: eb16029f     	cmp	x20, x22
  9f85cc: 54fffd81     	b.ne	0x9f857c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x84>
  9f85d0: f9407ba0     	ldr	x0, [x29, #0xf0]
  9f85d4: f9407fa1     	ldr	x1, [x29, #0xf8]
  9f85d8: cb000021     	sub	x1, x1, x0
  9f85dc: 9343fc21     	asr	x1, x1, #3
  9f85e0: b5000ee1     	cbnz	x1, 0x9f87bc <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2c4>
  9f85e4: 90002a81     	adrp	x1, 0xf48000
  9f85e8: f9402421     	ldr	x1, [x1, #0x48]
  9f85ec: 91004021     	add	x1, x1, #0x10
  9f85f0: f9005ba1     	str	x1, [x29, #0xb0]
  9f85f4: b4000040     	cbz	x0, 0x9f85fc <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x104>
  9f85f8: 94060e44     	bl	0xb7bf08 <_ZdlPv>
  9f85fc: f94047a0     	ldr	x0, [x29, #0x88]
  9f8600: 9400834f     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f8604: 90002a40     	adrp	x0, 0xf40000
  9f8608: f94087a1     	ldr	x1, [x29, #0x108]
  9f860c: f940e400     	ldr	x0, [x0, #0x1c8]
  9f8610: f9400000     	ldr	x0, [x0]
  9f8614: eb00003f     	cmp	x1, x0
  9f8618: 54001421     	b.ne	0x9f889c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x3a4>
  9f861c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8620: 6d4627e8     	ldp	d8, d9, [sp, #0x60]
  9f8624: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f8628: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f862c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f8630: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f8634: a8d17bfd     	ldp	x29, x30, [sp], #0x110
  9f8638: d65f03c0     	ret
  9f863c: f9400c00     	ldr	x0, [x0, #0x18]
  9f8640: b5fffaa0     	cbnz	x0, 0x9f8594 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x9c>
  9f8644: 17ffffda     	b	0x9f85ac <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xb4>
  9f8648: b940aaa2     	ldr	w2, [x21, #0xa8]
  9f864c: 36000ce2     	tbz	w2, #0x0, 0x9f87e8 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2f0>
  9f8650: 36080c82     	tbz	w2, #0x1, 0x9f87e0 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2e8>
  9f8654: 36100c22     	tbz	w2, #0x2, 0x9f87d8 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2e0>
  9f8658: 36180e22     	tbz	w2, #0x3, 0x9f881c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x324>
  9f865c: 36200dc2     	tbz	w2, #0x4, 0x9f8814 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x31c>
  9f8660: 36280d62     	tbz	w2, #0x5, 0x9f880c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x314>
  9f8664: 36300d02     	tbz	w2, #0x6, 0x9f8804 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x30c>
  9f8668: 36380ee2     	tbz	w2, #0x7, 0x9f8844 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x34c>
  9f866c: 36400e82     	tbz	w2, #0x8, 0x9f883c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x344>
  9f8670: 13097c40     	asr	w0, w2, #9
  9f8674: 36000e00     	tbz	w0, #0x0, 0x9f8834 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x33c>
  9f8678: 36080da0     	tbz	w0, #0x1, 0x9f882c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x334>
  9f867c: 36100d40     	tbz	w0, #0x2, 0x9f8824 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x32c>
  9f8680: 36180e60     	tbz	w0, #0x3, 0x9f884c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x354>
  9f8684: 36200e80     	tbz	w0, #0x4, 0x9f8854 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x35c>
  9f8688: 528001db     	mov	w27, #0xe               // =14
  9f868c: 372ff9c0     	tbnz	w0, #0x5, 0x9f85c4 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xcc>
  9f8690: b0002a80     	adrp	x0, 0xf49000
  9f8694: 52800023     	mov	w3, #0x1                // =1
  9f8698: 1adb2063     	lsl	w3, w3, w27
  9f869c: 2a020062     	orr	w2, w3, w2
  9f86a0: b900aaa2     	str	w2, [x21, #0xa8]
  9f86a4: f9404c01     	ldr	x1, [x0, #0x98]
  9f86a8: d2800a00     	mov	x0, #0x50               // =80
  9f86ac: 940614f3     	bl	0xb7da78 <_ZnwmRKSt9nothrow_t>
  9f86b0: aa0003f7     	mov	x23, x0
  9f86b4: b40006e0     	cbz	x0, 0x9f8790 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x298>
  9f86b8: 9400ccc0     	bl	0xa2b9b8 <_ZN7cocos2d3RefC2Ev>
  9f86bc: d0002a60     	adrp	x0, 0xf46000
  9f86c0: 9100f2e2     	add	x2, x23, #0x3c
  9f86c4: 1e2703e0     	fmov	s0, wzr
  9f86c8: 9100d2e1     	add	x1, x23, #0x34
  9f86cc: 52800003     	mov	w3, #0x0                // =0
  9f86d0: f9468400     	ldr	x0, [x0, #0xd08]
  9f86d4: 3900a2ff     	strb	wzr, [x23, #0x28]
  9f86d8: 91004000     	add	x0, x0, #0x10
  9f86dc: f90002e0     	str	x0, [x23]
  9f86e0: bd002ee0     	str	s0, [x23, #0x2c]
  9f86e4: bd0032e0     	str	s0, [x23, #0x30]
  9f86e8: bd0036e0     	str	s0, [x23, #0x34]
  9f86ec: bd003ae0     	str	s0, [x23, #0x38]
  9f86f0: bd003ee0     	str	s0, [x23, #0x3c]
  9f86f4: bd000440     	str	s0, [x2, #0x4]
  9f86f8: bd403781     	ldr	s1, [x28, #0x34]
  9f86fc: 9100c2a0     	add	x0, x21, #0x30
  9f8700: bd403b80     	ldr	s0, [x28, #0x38]
  9f8704: f9400024     	ldr	x4, [x1]
  9f8708: 1e213929     	fsub	s9, s9, s1
  9f870c: f9004fb7     	str	x23, [x29, #0x98]
  9f8710: 1e203908     	fsub	s8, s8, s0
  9f8714: f83bd817     	str	x23, [x0, w27, sxtw #3]
  9f8718: bd405380     	ldr	s0, [x28, #0x50]
  9f871c: bd405781     	ldr	s1, [x28, #0x54]
  9f8720: b90026fb     	str	w27, [x23, #0x24]
  9f8724: 1e201929     	fdiv	s9, s9, s0
  9f8728: f9000044     	str	x4, [x2]
  9f872c: 1e2703e0     	fmov	s0, wzr
  9f8730: 1e211908     	fdiv	s8, s8, s1
  9f8734: bd0046e0     	str	s0, [x23, #0x44]
  9f8738: bd004ae0     	str	s0, [x23, #0x48]
  9f873c: bd0036e9     	str	s9, [x23, #0x34]
  9f8740: bd003ae8     	str	s8, [x23, #0x38]
  9f8744: 340002e3     	cbz	w3, 0x9f87a0 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2a8>
  9f8748: f94043a1     	ldr	x1, [x29, #0x80]
  9f874c: aa1503e0     	mov	x0, x21
  9f8750: f90053b3     	str	x19, [x29, #0xa0]
  9f8754: b900abbb     	str	w27, [x29, #0xa8]
  9f8758: 97ffff19     	bl	0x9f83bc <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE16_M_insert_uniqueIS0_IliEEES0_ISt17_Rb_tree_iteratorIS2_EbEOT_>
  9f875c: f94047a2     	ldr	x2, [x29, #0x88]
  9f8760: f9402440     	ldr	x0, [x2, #0x48]
  9f8764: f9402841     	ldr	x1, [x2, #0x50]
  9f8768: eb01001f     	cmp	x0, x1
  9f876c: 54000420     	b.eq	0x9f87f0 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x2f8>
  9f8770: f9404fa1     	ldr	x1, [x29, #0x98]
  9f8774: b4000060     	cbz	x0, 0x9f8780 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x288>
  9f8778: f9000001     	str	x1, [x0]
  9f877c: f9402440     	ldr	x0, [x2, #0x48]
  9f8780: f94047a1     	ldr	x1, [x29, #0x88]
  9f8784: 91002000     	add	x0, x0, #0x8
  9f8788: f9002420     	str	x0, [x1, #0x48]
  9f878c: 17ffff8e     	b	0x9f85c4 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xcc>
  9f8790: 3940a003     	ldrb	w3, [x0, #0x28]
  9f8794: d2800681     	mov	x1, #0x34               // =52
  9f8798: d2800782     	mov	x2, #0x3c               // =60
  9f879c: 17ffffd7     	b	0x9f86f8 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x200>
  9f87a0: f9400020     	ldr	x0, [x1]
  9f87a4: f802c2e0     	stur	x0, [x23, #0x2c]
  9f87a8: 52800020     	mov	w0, #0x1                // =1
  9f87ac: 3900a2e0     	strb	w0, [x23, #0x28]
  9f87b0: f9400020     	ldr	x0, [x1]
  9f87b4: f9000040     	str	x0, [x2]
  9f87b8: 17ffffe4     	b	0x9f8748 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x250>
  9f87bc: b900ebbf     	str	wzr, [x29, #0xe8]
  9f87c0: 94007b77     	bl	0xa1759c <_ZN7cocos2d8Director11getInstanceEv>
  9f87c4: f9409400     	ldr	x0, [x0, #0x128]
  9f87c8: f94047a1     	ldr	x1, [x29, #0x88]
  9f87cc: 9400a280     	bl	0xa211cc <_ZN7cocos2d15EventDispatcher13dispatchEventEPNS_5EventE>
  9f87d0: f9407ba0     	ldr	x0, [x29, #0xf0]
  9f87d4: 17ffff84     	b	0x9f85e4 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xec>
  9f87d8: 5280005b     	mov	w27, #0x2               // =2
  9f87dc: 17ffffad     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f87e0: 5280003b     	mov	w27, #0x1               // =1
  9f87e4: 17ffffab     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f87e8: 5280001b     	mov	w27, #0x0               // =0
  9f87ec: 17ffffa9     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f87f0: f94047a0     	ldr	x0, [x29, #0x88]
  9f87f4: f9403fa1     	ldr	x1, [x29, #0x78]
  9f87f8: 91010000     	add	x0, x0, #0x40
  9f87fc: 97fffdec     	bl	0x9f7fac <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_>
  9f8800: 17ffff71     	b	0x9f85c4 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0xcc>
  9f8804: 528000db     	mov	w27, #0x6               // =6
  9f8808: 17ffffa2     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f880c: 528000bb     	mov	w27, #0x5               // =5
  9f8810: 17ffffa0     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f8814: 5280009b     	mov	w27, #0x4               // =4
  9f8818: 17ffff9e     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f881c: 5280007b     	mov	w27, #0x3               // =3
  9f8820: 17ffff9c     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f8824: 5280017b     	mov	w27, #0xb               // =11
  9f8828: 17ffff9a     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f882c: 5280015b     	mov	w27, #0xa               // =10
  9f8830: 17ffff98     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f8834: 5280013b     	mov	w27, #0x9               // =9
  9f8838: 17ffff96     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f883c: 5280011b     	mov	w27, #0x8               // =8
  9f8840: 17ffff94     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f8844: 528000fb     	mov	w27, #0x7               // =7
  9f8848: 17ffff92     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f884c: 5280019b     	mov	w27, #0xc               // =12
  9f8850: 17ffff90     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f8854: 528001bb     	mov	w27, #0xd               // =13
  9f8858: 17ffff8e     	b	0x9f8690 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x198>
  9f885c: b0002a81     	adrp	x1, 0xf49000
  9f8860: aa0003f3     	mov	x19, x0
  9f8864: aa1703e0     	mov	x0, x23
  9f8868: f9404c21     	ldr	x1, [x1, #0x98]
  9f886c: 94060da8     	bl	0xb7bf0c <_ZdlPvRKSt9nothrow_t>
  9f8870: 90002a97     	adrp	x23, 0xf48000
  9f8874: f9407ba0     	ldr	x0, [x29, #0xf0]
  9f8878: f94026f7     	ldr	x23, [x23, #0x48]
  9f887c: 910042f7     	add	x23, x23, #0x10
  9f8880: f9005bb7     	str	x23, [x29, #0xb0]
  9f8884: b4000040     	cbz	x0, 0x9f888c <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x394>
  9f8888: 94060da0     	bl	0xb7bf08 <_ZdlPv>
  9f888c: f94047a0     	ldr	x0, [x29, #0x88]
  9f8890: 940082ab     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f8894: aa1303e0     	mov	x0, x19
  9f8898: 9407a992     	bl	0xbe2ee0 <_Unwind_Resume>
  9f889c: 97e68ac1     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f88a0: aa0003f3     	mov	x19, x0
  9f88a4: 17fffff3     	b	0x9f8870 <_ZN7cocos2d6GLView18handleTouchesBeginEiPlPfS2_+0x378>

00000000009f88a8 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E>:
  9f88a8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f88ac: 910003fd     	mov	x29, sp
  9f88b0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f88b4: aa0103f3     	mov	x19, x1
  9f88b8: aa0003f4     	mov	x20, x0
  9f88bc: b4000121     	cbz	x1, 0x9f88e0 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E+0x38>
  9f88c0: f9400e61     	ldr	x1, [x19, #0x18]
  9f88c4: aa1403e0     	mov	x0, x20
  9f88c8: 97fffff8     	bl	0x9f88a8 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E>
  9f88cc: f9400a61     	ldr	x1, [x19, #0x10]
  9f88d0: aa1303e0     	mov	x0, x19
  9f88d4: aa0103f3     	mov	x19, x1
  9f88d8: 94060d8c     	bl	0xb7bf08 <_ZdlPv>
  9f88dc: b5ffff33     	cbnz	x19, 0x9f88c0 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E+0x18>
  9f88e0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f88e4: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f88e8: d65f03c0     	ret

00000000009f88ec <_ZNSt3mapIliSt4lessIlESaISt4pairIKliEEED2Ev>:
  9f88ec: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f88f0: 910003fd     	mov	x29, sp
  9f88f4: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f88f8: f9400813     	ldr	x19, [x0, #0x10]
  9f88fc: aa0003f4     	mov	x20, x0
  9f8900: b4000133     	cbz	x19, 0x9f8924 <_ZNSt3mapIliSt4lessIlESaISt4pairIKliEEED2Ev+0x38>
  9f8904: f9400e61     	ldr	x1, [x19, #0x18]
  9f8908: aa1403e0     	mov	x0, x20
  9f890c: 97ffffe7     	bl	0x9f88a8 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E>
  9f8910: f9400a61     	ldr	x1, [x19, #0x10]
  9f8914: aa1303e0     	mov	x0, x19
  9f8918: aa0103f3     	mov	x19, x1
  9f891c: 94060d7b     	bl	0xb7bf08 <_ZdlPv>
  9f8920: b5ffff33     	cbnz	x19, 0x9f8904 <_ZNSt3mapIliSt4lessIlESaISt4pairIKliEEED2Ev+0x18>
  9f8924: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8928: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f892c: d65f03c0     	ret

00000000009f8930 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_>:
  9f8930: a9af7bfd     	stp	x29, x30, [sp, #-0x110]!
  9f8934: 910003fd     	mov	x29, sp
  9f8938: a90363f7     	stp	x23, x24, [sp, #0x30]
  9f893c: 9102c3b8     	add	x24, x29, #0xb0
  9f8940: aa0003f7     	mov	x23, x0
  9f8944: b9007fa1     	str	w1, [x29, #0x7c]
  9f8948: 90002a41     	adrp	x1, 0xf40000
  9f894c: aa1803e0     	mov	x0, x24
  9f8950: f9004ba2     	str	x2, [x29, #0x90]
  9f8954: a90573fb     	stp	x27, x28, [sp, #0x50]
  9f8958: f940e421     	ldr	x1, [x1, #0x1c8]
  9f895c: aa0403fb     	mov	x27, x4
  9f8960: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8964: a9025bf5     	stp	x21, x22, [sp, #0x20]
  9f8968: f9400021     	ldr	x1, [x1]
  9f896c: aa0503fc     	mov	x28, x5
  9f8970: a9046bf9     	stp	x25, x26, [sp, #0x40]
  9f8974: fd0033e8     	str	d8, [sp, #0x60]
  9f8978: f9004fa3     	str	x3, [x29, #0x98]
  9f897c: f90087a1     	str	x1, [x29, #0x108]
  9f8980: 9400afe7     	bl	0xa2491c <_ZN7cocos2d10EventTouchC2Ev>
  9f8984: f9404ba2     	ldr	x2, [x29, #0x90]
  9f8988: 6b1f005f     	cmp	w2, wzr
  9f898c: 54000bad     	b.le	0x9f8b00 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1d0>
  9f8990: 51000442     	sub	w2, w2, #0x1
  9f8994: d0002b94     	adrp	x20, 0xf6a000 <app_pkey_methods+0x13a8>
  9f8998: 91000440     	add	x0, x2, #0x1
  9f899c: f9004ba0     	str	x0, [x29, #0x90]
  9f89a0: 1e2703e8     	fmov	s8, wzr
  9f89a4: 91010300     	add	x0, x24, #0x40
  9f89a8: d2800016     	mov	x22, #0x0               // =0
  9f89ac: f90047a0     	str	x0, [x29, #0x88]
  9f89b0: 9130c294     	add	x20, x20, #0xc30
  9f89b4: 9102a3a0     	add	x0, x29, #0xa8
  9f89b8: f90043a0     	str	x0, [x29, #0x80]
  9f89bc: f9404fa0     	ldr	x0, [x29, #0x98]
  9f89c0: f9400a82     	ldr	x2, [x20, #0x10]
  9f89c4: bc767b61     	ldr	s1, [x27, x22, lsl #2]
  9f89c8: f8767813     	ldr	x19, [x0, x22, lsl #3]
  9f89cc: bc767b80     	ldr	s0, [x28, x22, lsl #2]
  9f89d0: b4000902     	cbz	x2, 0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f89d4: aa0203e0     	mov	x0, x2
  9f89d8: 91002295     	add	x21, x20, #0x8
  9f89dc: f9401001     	ldr	x1, [x0, #0x20]
  9f89e0: eb01027f     	cmp	x19, x1
  9f89e4: 54000ecc     	b.gt	0x9f8bbc <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x28c>
  9f89e8: aa0003f5     	mov	x21, x0
  9f89ec: f9400800     	ldr	x0, [x0, #0x10]
  9f89f0: b5ffff60     	cbnz	x0, 0x9f89dc <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0xac>
  9f89f4: 91002280     	add	x0, x20, #0x8
  9f89f8: eb0002bf     	cmp	x21, x0
  9f89fc: 540007a0     	b.eq	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8a00: f94012a0     	ldr	x0, [x21, #0x20]
  9f8a04: eb00027f     	cmp	x19, x0
  9f8a08: 5400074b     	b.lt	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8a0c: b9402aa1     	ldr	w1, [x21, #0x28]
  9f8a10: 9100c280     	add	x0, x20, #0x30
  9f8a14: f861d800     	ldr	x0, [x0, w1, sxtw #3]
  9f8a18: 93407c24     	sxtw	x4, w1
  9f8a1c: f90057a0     	str	x0, [x29, #0xa8]
  9f8a20: b4001600     	cbz	x0, 0x9f8ce0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x3b0>
  9f8a24: bd4036e3     	ldr	s3, [x23, #0x34]
  9f8a28: f8434005     	ldur	x5, [x0, #0x34]
  9f8a2c: bd403ae2     	ldr	s2, [x23, #0x38]
  9f8a30: 3940a003     	ldrb	w3, [x0, #0x28]
  9f8a34: 1e233821     	fsub	s1, s1, s3
  9f8a38: 1e223800     	fsub	s0, s0, s2
  9f8a3c: bd4052e3     	ldr	s3, [x23, #0x50]
  9f8a40: bd4056e2     	ldr	s2, [x23, #0x54]
  9f8a44: b9002401     	str	w1, [x0, #0x24]
  9f8a48: 1e231821     	fdiv	s1, s1, s3
  9f8a4c: f803c005     	stur	x5, [x0, #0x3c]
  9f8a50: bd004408     	str	s8, [x0, #0x44]
  9f8a54: bd004808     	str	s8, [x0, #0x48]
  9f8a58: 1e221800     	fdiv	s0, s0, s2
  9f8a5c: bd003401     	str	s1, [x0, #0x34]
  9f8a60: bd003800     	str	s0, [x0, #0x38]
  9f8a64: 34001083     	cbz	w3, 0x9f8c74 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x344>
  9f8a68: f9402703     	ldr	x3, [x24, #0x48]
  9f8a6c: f9402b05     	ldr	x5, [x24, #0x50]
  9f8a70: eb05007f     	cmp	x3, x5
  9f8a74: 54001140     	b.eq	0x9f8c9c <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x36c>
  9f8a78: b4000083     	cbz	x3, 0x9f8a88 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x158>
  9f8a7c: f9000060     	str	x0, [x3]
  9f8a80: f9402703     	ldr	x3, [x24, #0x48]
  9f8a84: f9400a82     	ldr	x2, [x20, #0x10]
  9f8a88: 91002075     	add	x21, x3, #0x8
  9f8a8c: aa0203fa     	mov	x26, x2
  9f8a90: f9002715     	str	x21, [x24, #0x48]
  9f8a94: 9100c280     	add	x0, x20, #0x30
  9f8a98: 7100383f     	cmp	w1, #0xe
  9f8a9c: f824781f     	str	xzr, [x0, x4, lsl #3]
  9f8aa0: 540000c8     	b.hi	0x9f8ab8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x188>
  9f8aa4: b940aa80     	ldr	w0, [x20, #0xa8]
  9f8aa8: 52800022     	mov	w2, #0x1                // =1
  9f8aac: 1ac12041     	lsl	w1, w2, w1
  9f8ab0: 0a210000     	bic	w0, w0, w1
  9f8ab4: b900aa80     	str	w0, [x20, #0xa8]
  9f8ab8: b400101a     	cbz	x26, 0x9f8cb8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x388>
  9f8abc: aa1a03f5     	mov	x21, x26
  9f8ac0: 91002299     	add	x25, x20, #0x8
  9f8ac4: f94012a0     	ldr	x0, [x21, #0x20]
  9f8ac8: eb00027f     	cmp	x19, x0
  9f8acc: 540006ed     	b.le	0x9f8ba8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x278>
  9f8ad0: f9400eb5     	ldr	x21, [x21, #0x18]
  9f8ad4: b5ffff95     	cbnz	x21, 0x9f8ac4 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x194>
  9f8ad8: 91002280     	add	x0, x20, #0x8
  9f8adc: eb00033f     	cmp	x25, x0
  9f8ae0: 54000081     	b.ne	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8ae4: f9400e80     	ldr	x0, [x20, #0x18]
  9f8ae8: eb00033f     	cmp	x25, x0
  9f8aec: 54000420     	b.eq	0x9f8b70 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x240>
  9f8af0: f9404ba0     	ldr	x0, [x29, #0x90]
  9f8af4: 910006d6     	add	x22, x22, #0x1
  9f8af8: eb0002df     	cmp	x22, x0
  9f8afc: 54fff601     	b.ne	0x9f89bc <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x8c>
  9f8b00: f9407ba2     	ldr	x2, [x29, #0xf0]
  9f8b04: f9407fa1     	ldr	x1, [x29, #0xf8]
  9f8b08: aa0203e0     	mov	x0, x2
  9f8b0c: cb020021     	sub	x1, x1, x2
  9f8b10: 9343fc21     	asr	x1, x1, #3
  9f8b14: b5000ea1     	cbnz	x1, 0x9f8ce8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x3b8>
  9f8b18: 90002a81     	adrp	x1, 0xf48000
  9f8b1c: f9402421     	ldr	x1, [x1, #0x48]
  9f8b20: 91004021     	add	x1, x1, #0x10
  9f8b24: f9005ba1     	str	x1, [x29, #0xb0]
  9f8b28: b4000040     	cbz	x0, 0x9f8b30 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x200>
  9f8b2c: 94060cf7     	bl	0xb7bf08 <_ZdlPv>
  9f8b30: aa1803e0     	mov	x0, x24
  9f8b34: 94008202     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f8b38: 90002a40     	adrp	x0, 0xf40000
  9f8b3c: f94087a1     	ldr	x1, [x29, #0x108]
  9f8b40: f940e400     	ldr	x0, [x0, #0x1c8]
  9f8b44: f9400000     	ldr	x0, [x0]
  9f8b48: eb00003f     	cmp	x1, x0
  9f8b4c: 54000fe1     	b.ne	0x9f8d48 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x418>
  9f8b50: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8b54: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  9f8b58: a94363f7     	ldp	x23, x24, [sp, #0x30]
  9f8b5c: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  9f8b60: a94573fb     	ldp	x27, x28, [sp, #0x50]
  9f8b64: fd4033e8     	ldr	d8, [sp, #0x60]
  9f8b68: a8d17bfd     	ldp	x29, x30, [sp], #0x110
  9f8b6c: d65f03c0     	ret
  9f8b70: f9400f41     	ldr	x1, [x26, #0x18]
  9f8b74: aa1403e0     	mov	x0, x20
  9f8b78: 97ffff4c     	bl	0x9f88a8 <_ZNSt8_Rb_treeIlSt4pairIKliESt10_Select1stIS2_ESt4lessIlESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E>
  9f8b7c: f9400b41     	ldr	x1, [x26, #0x10]
  9f8b80: aa1a03e0     	mov	x0, x26
  9f8b84: aa0103fa     	mov	x26, x1
  9f8b88: 94060ce0     	bl	0xb7bf08 <_ZdlPv>
  9f8b8c: b5ffff3a     	cbnz	x26, 0x9f8b70 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x240>
  9f8b90: 91002280     	add	x0, x20, #0x8
  9f8b94: f9000a9f     	str	xzr, [x20, #0x10]
  9f8b98: f9000e80     	str	x0, [x20, #0x18]
  9f8b9c: f9001280     	str	x0, [x20, #0x20]
  9f8ba0: f900169f     	str	xzr, [x20, #0x28]
  9f8ba4: 17ffffd3     	b	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8ba8: 5400010a     	b.ge	0x9f8bc8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x298>
  9f8bac: aa1503f9     	mov	x25, x21
  9f8bb0: f9400ab5     	ldr	x21, [x21, #0x10]
  9f8bb4: b5fff895     	cbnz	x21, 0x9f8ac4 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x194>
  9f8bb8: 17ffffc8     	b	0x9f8ad8 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1a8>
  9f8bbc: f9400c00     	ldr	x0, [x0, #0x18]
  9f8bc0: b5fff0e0     	cbnz	x0, 0x9f89dc <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0xac>
  9f8bc4: 17ffff8c     	b	0x9f89f4 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0xc4>
  9f8bc8: f9400aa1     	ldr	x1, [x21, #0x10]
  9f8bcc: f9400ea0     	ldr	x0, [x21, #0x18]
  9f8bd0: b40000e1     	cbz	x1, 0x9f8bec <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2bc>
  9f8bd4: f9401024     	ldr	x4, [x1, #0x20]
  9f8bd8: eb04027f     	cmp	x19, x4
  9f8bdc: 5400044c     	b.gt	0x9f8c64 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x334>
  9f8be0: aa0103f5     	mov	x21, x1
  9f8be4: f9400821     	ldr	x1, [x1, #0x10]
  9f8be8: b5ffff61     	cbnz	x1, 0x9f8bd4 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2a4>
  9f8bec: b40000e0     	cbz	x0, 0x9f8c08 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2d8>
  9f8bf0: f9401001     	ldr	x1, [x0, #0x20]
  9f8bf4: eb01027f     	cmp	x19, x1
  9f8bf8: 540003aa     	b.ge	0x9f8c6c <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x33c>
  9f8bfc: aa0003f9     	mov	x25, x0
  9f8c00: f9400800     	ldr	x0, [x0, #0x10]
  9f8c04: b5ffff60     	cbnz	x0, 0x9f8bf0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2c0>
  9f8c08: 91002280     	add	x0, x20, #0x8
  9f8c0c: eb00033f     	cmp	x25, x0
  9f8c10: 54000081     	b.ne	0x9f8c20 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2f0>
  9f8c14: f9400e80     	ldr	x0, [x20, #0x18]
  9f8c18: eb0002bf     	cmp	x21, x0
  9f8c1c: 54fffaa0     	b.eq	0x9f8b70 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x240>
  9f8c20: eb1902bf     	cmp	x21, x25
  9f8c24: 91002293     	add	x19, x20, #0x8
  9f8c28: 54fff640     	b.eq	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8c2c: aa1503e0     	mov	x0, x21
  9f8c30: 9406cde0     	bl	0xbac3b0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x2dd88>
  9f8c34: aa0003e2     	mov	x2, x0
  9f8c38: aa1303e1     	mov	x1, x19
  9f8c3c: aa1503e0     	mov	x0, x21
  9f8c40: aa0203f5     	mov	x21, x2
  9f8c44: 9406cecb     	bl	0xbac770 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x2e148>
  9f8c48: 94060cb0     	bl	0xb7bf08 <_ZdlPv>
  9f8c4c: f9401680     	ldr	x0, [x20, #0x28]
  9f8c50: eb1902bf     	cmp	x21, x25
  9f8c54: d1000400     	sub	x0, x0, #0x1
  9f8c58: f9001680     	str	x0, [x20, #0x28]
  9f8c5c: 54fffe81     	b.ne	0x9f8c2c <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2fc>
  9f8c60: 17ffffa4     	b	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8c64: f9400c21     	ldr	x1, [x1, #0x18]
  9f8c68: 17ffffda     	b	0x9f8bd0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2a0>
  9f8c6c: f9400c00     	ldr	x0, [x0, #0x18]
  9f8c70: 17ffffdf     	b	0x9f8bec <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x2bc>
  9f8c74: f8434005     	ldur	x5, [x0, #0x34]
  9f8c78: f802c005     	stur	x5, [x0, #0x2c]
  9f8c7c: aa0503e3     	mov	x3, x5
  9f8c80: 52800025     	mov	w5, #0x1                // =1
  9f8c84: f803c003     	stur	x3, [x0, #0x3c]
  9f8c88: 3900a005     	strb	w5, [x0, #0x28]
  9f8c8c: f9402703     	ldr	x3, [x24, #0x48]
  9f8c90: f9402b05     	ldr	x5, [x24, #0x50]
  9f8c94: eb05007f     	cmp	x3, x5
  9f8c98: 54ffef01     	b.ne	0x9f8a78 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x148>
  9f8c9c: f94047a0     	ldr	x0, [x29, #0x88]
  9f8ca0: f94043a1     	ldr	x1, [x29, #0x80]
  9f8ca4: 97fffcc2     	bl	0x9f7fac <_ZNSt6vectorIPN7cocos2d5TouchESaIS2_EE19_M_emplace_back_auxIJRKS2_EEEvDpOT_>
  9f8ca8: b9402aa1     	ldr	w1, [x21, #0x28]
  9f8cac: f9400a9a     	ldr	x26, [x20, #0x10]
  9f8cb0: 93407c24     	sxtw	x4, w1
  9f8cb4: 17ffff78     	b	0x9f8a94 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x164>
  9f8cb8: f9400e81     	ldr	x1, [x20, #0x18]
  9f8cbc: 91002280     	add	x0, x20, #0x8
  9f8cc0: eb00003f     	cmp	x1, x0
  9f8cc4: 54fff161     	b.ne	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8cc8: 91002280     	add	x0, x20, #0x8
  9f8ccc: f9000a9f     	str	xzr, [x20, #0x10]
  9f8cd0: f9000e80     	str	x0, [x20, #0x18]
  9f8cd4: f9001280     	str	x0, [x20, #0x20]
  9f8cd8: f900169f     	str	xzr, [x20, #0x28]
  9f8cdc: 17ffff85     	b	0x9f8af0 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1c0>
  9f8ce0: f9407ba0     	ldr	x0, [x29, #0xf0]
  9f8ce4: 17ffff8d     	b	0x9f8b18 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x1e8>
  9f8ce8: b9407fa0     	ldr	w0, [x29, #0x7c]
  9f8cec: b900eba0     	str	w0, [x29, #0xe8]
  9f8cf0: 94007a2b     	bl	0xa1759c <_ZN7cocos2d8Director11getInstanceEv>
  9f8cf4: f9409400     	ldr	x0, [x0, #0x128]
  9f8cf8: aa1803e1     	mov	x1, x24
  9f8cfc: 9400a134     	bl	0xa211cc <_ZN7cocos2d15EventDispatcher13dispatchEventEPNS_5EventE>
  9f8d00: f9407bb3     	ldr	x19, [x29, #0xf0]
  9f8d04: f9407fb4     	ldr	x20, [x29, #0xf8]
  9f8d08: eb13029f     	cmp	x20, x19
  9f8d0c: 540000e0     	b.eq	0x9f8d28 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x3f8>
  9f8d10: f9400260     	ldr	x0, [x19]
  9f8d14: 9400cb3c     	bl	0xa2ba04 <_ZN7cocos2d3Ref7releaseEv>
  9f8d18: 91002273     	add	x19, x19, #0x8
  9f8d1c: eb13029f     	cmp	x20, x19
  9f8d20: 54ffff81     	b.ne	0x9f8d10 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x3e0>
  9f8d24: f9407bb4     	ldr	x20, [x29, #0xf0]
  9f8d28: 90002a80     	adrp	x0, 0xf48000
  9f8d2c: f9402400     	ldr	x0, [x0, #0x48]
  9f8d30: 91004000     	add	x0, x0, #0x10
  9f8d34: f9005ba0     	str	x0, [x29, #0xb0]
  9f8d38: b4ffefd4     	cbz	x20, 0x9f8b30 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x200>
  9f8d3c: aa1403e0     	mov	x0, x20
  9f8d40: 94060c72     	bl	0xb7bf08 <_ZdlPv>
  9f8d44: 17ffff7b     	b	0x9f8b30 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x200>
  9f8d48: 97e68996     	bl	0x39b3a0 <__stack_chk_fail@plt>
  9f8d4c: aa0003f3     	mov	x19, x0
  9f8d50: 90002a80     	adrp	x0, 0xf48000
  9f8d54: f9407ba1     	ldr	x1, [x29, #0xf0]
  9f8d58: f9402400     	ldr	x0, [x0, #0x48]
  9f8d5c: 91004000     	add	x0, x0, #0x10
  9f8d60: f9005ba0     	str	x0, [x29, #0xb0]
  9f8d64: b4000061     	cbz	x1, 0x9f8d70 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_+0x440>
  9f8d68: aa0103e0     	mov	x0, x1
  9f8d6c: 94060c67     	bl	0xb7bf08 <_ZdlPv>
  9f8d70: aa1803e0     	mov	x0, x24
  9f8d74: 94008172     	bl	0xa1933c <_ZN7cocos2d5EventD2Ev>
  9f8d78: aa1303e0     	mov	x0, x19
  9f8d7c: 9407a859     	bl	0xbe2ee0 <_Unwind_Resume>

00000000009f8d80 <_ZN7cocos2d6GLView16handleTouchesEndEiPlPfS2_>:
  9f8d80: 2a0103e8     	mov	w8, w1
  9f8d84: aa0203e7     	mov	x7, x2
  9f8d88: aa0303e6     	mov	x6, x3
  9f8d8c: aa0403e5     	mov	x5, x4
  9f8d90: 52800041     	mov	w1, #0x2                // =2
  9f8d94: 2a0803e2     	mov	w2, w8
  9f8d98: aa0703e3     	mov	x3, x7
  9f8d9c: aa0603e4     	mov	x4, x6
  9f8da0: 17fffee4     	b	0x9f8930 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_>

00000000009f8da4 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_>:
  9f8da4: 2a0103e8     	mov	w8, w1
  9f8da8: aa0203e7     	mov	x7, x2
  9f8dac: aa0303e6     	mov	x6, x3
  9f8db0: aa0403e5     	mov	x5, x4
  9f8db4: 52800061     	mov	w1, #0x3                // =3
  9f8db8: 2a0803e2     	mov	w2, w8
  9f8dbc: aa0703e3     	mov	x3, x7
  9f8dc0: aa0603e4     	mov	x4, x6
  9f8dc4: 17fffedb     	b	0x9f8930 <_ZN7cocos2d6GLView26handleTouchesOfEndOrCancelENS_10EventTouch9EventCodeEiPlPfS4_>
  9f8dc8: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f8dcc: 910003fd     	mov	x29, sp
  9f8dd0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8dd4: aa0103f3     	mov	x19, x1
  9f8dd8: aa0003f4     	mov	x20, x0
  9f8ddc: b4000121     	cbz	x1, 0x9f8e00 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x5c>
  9f8de0: f9400e61     	ldr	x1, [x19, #0x18]
  9f8de4: aa1403e0     	mov	x0, x20
  9f8de8: 97fffff8     	bl	0x9f8dc8 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x24>
  9f8dec: f9400a61     	ldr	x1, [x19, #0x10]
  9f8df0: aa1303e0     	mov	x0, x19
  9f8df4: aa0103f3     	mov	x19, x1
  9f8df8: 94060c44     	bl	0xb7bf08 <_ZdlPv>
  9f8dfc: b5ffff33     	cbnz	x19, 0x9f8de0 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x3c>
  9f8e00: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8e04: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f8e08: d65f03c0     	ret
  9f8e0c: f9400801     	ldr	x1, [x0, #0x10]
  9f8e10: 17ffffee     	b	0x9f8dc8 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x24>
  9f8e14: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f8e18: 910003fd     	mov	x29, sp
  9f8e1c: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8e20: aa0103f3     	mov	x19, x1
  9f8e24: aa0003f4     	mov	x20, x0
  9f8e28: b4000121     	cbz	x1, 0x9f8e4c <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0xa8>
  9f8e2c: f9400e61     	ldr	x1, [x19, #0x18]
  9f8e30: aa1403e0     	mov	x0, x20
  9f8e34: 97fffff8     	bl	0x9f8e14 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x70>
  9f8e38: f9400a61     	ldr	x1, [x19, #0x10]
  9f8e3c: aa1303e0     	mov	x0, x19
  9f8e40: aa0103f3     	mov	x19, x1
  9f8e44: 94060c31     	bl	0xb7bf08 <_ZdlPv>
  9f8e48: b5ffff33     	cbnz	x19, 0x9f8e2c <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x88>
  9f8e4c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8e50: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f8e54: d65f03c0     	ret
  9f8e58: f9400801     	ldr	x1, [x0, #0x10]
  9f8e5c: 17ffffee     	b	0x9f8e14 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x70>
  9f8e60: a9b17bfd     	stp	x29, x30, [sp, #-0xf0]!
  9f8e64: 90002a42     	adrp	x2, 0xf40000
  9f8e68: 910003fd     	mov	x29, sp
  9f8e6c: f9000bf3     	str	x19, [sp, #0x10]
  9f8e70: 910083a1     	add	x1, x29, #0x20
  9f8e74: f9400013     	ldr	x19, [x0]
  9f8e78: f940e442     	ldr	x2, [x2, #0x1c8]
  9f8e7c: f9400e63     	ldr	x3, [x19, #0x18]
  9f8e80: f9400042     	ldr	x2, [x2]
  9f8e84: f90077a2     	str	x2, [x29, #0xe8]
  9f8e88: d63f0060     	blr	x3
  9f8e8c: 9102a260     	add	x0, x19, #0xa8
  9f8e90: 52800021     	mov	w1, #0x1                // =1
  9f8e94: 97e68743     	bl	0x39aba0 <longjmp@plt>
  9f8e98: a9bc7bfd     	stp	x29, x30, [sp, #-0x40]!
  9f8e9c: 910003fd     	mov	x29, sp
  9f8ea0: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8ea4: f90013f5     	str	x21, [sp, #0x20]
  9f8ea8: aa0203f4     	mov	x20, x2
  9f8eac: aa0003f5     	mov	x21, x0
  9f8eb0: f9001fa1     	str	x1, [x29, #0x38]
  9f8eb4: 940405f7     	bl	0xafa690 <png_get_io_ptr>
  9f8eb8: b9401003     	ldr	w3, [x0, #0x10]
  9f8ebc: aa0003f3     	mov	x19, x0
  9f8ec0: f9400400     	ldr	x0, [x0, #0x8]
  9f8ec4: 0b140062     	add	w2, w3, w20
  9f8ec8: eb22c01f     	cmp	x0, w2, sxtw
  9f8ecc: 540001cb     	b.lt	0x9f8f04 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x160>
  9f8ed0: f9401fa1     	ldr	x1, [x29, #0x38]
  9f8ed4: aa1403e2     	mov	x2, x20
  9f8ed8: aa0103e0     	mov	x0, x1
  9f8edc: f9400261     	ldr	x1, [x19]
  9f8ee0: 8b23c021     	add	x1, x1, w3, sxtw
  9f8ee4: 97e686df     	bl	0x39aa60 <memcpy@plt>
  9f8ee8: f94013f5     	ldr	x21, [sp, #0x20]
  9f8eec: b9401260     	ldr	w0, [x19, #0x10]
  9f8ef0: 0b140014     	add	w20, w0, w20
  9f8ef4: b9001274     	str	w20, [x19, #0x10]
  9f8ef8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8efc: a8c47bfd     	ldp	x29, x30, [sp], #0x40
  9f8f00: d65f03c0     	ret
  9f8f04: b00015c1     	adrp	x1, 0xcb1000 <_ZTSSt5_BindIFSt7_Mem_fnIMN7cocos2d15TransitionSceneEFvvEEPNS1_18TransitionProgressEEE+0x1a0>
  9f8f08: aa1503e0     	mov	x0, x21
  9f8f0c: 910f0021     	add	x1, x1, #0x3c0
  9f8f10: 9404195d     	bl	0xaff484 <png_error>
  9f8f14: 90002a62     	adrp	x2, 0xf44000
  9f8f18: f9445042     	ldr	x2, [x2, #0x8a0]
  9f8f1c: b4000122     	cbz	x2, 0x9f8f40 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x19c>
  9f8f20: 91004003     	add	x3, x0, #0x10
  9f8f24: 885ffc62     	ldaxr	w2, [x3]
  9f8f28: 51000444     	sub	w4, w2, #0x1
  9f8f2c: 8805fc64     	stlxr	w5, w4, [x3]
  9f8f30: 35ffffa5     	cbnz	w5, 0x9f8f24 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x180>
  9f8f34: 6b1f005f     	cmp	w2, wzr
  9f8f38: 540000ed     	b.le	0x9f8f54 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x1b0>
  9f8f3c: d65f03c0     	ret
  9f8f40: b9401002     	ldr	w2, [x0, #0x10]
  9f8f44: 51000443     	sub	w3, w2, #0x1
  9f8f48: 6b1f005f     	cmp	w2, wzr
  9f8f4c: b9001003     	str	w3, [x0, #0x10]
  9f8f50: 54ffff6c     	b.gt	0x9f8f3c <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x198>
  9f8f54: 1407461a     	b	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  9f8f58: d0002b85     	adrp	x5, 0xf6a000 <app_pkey_methods+0x13a8>
  9f8f5c: a9be7bfd     	stp	x29, x30, [sp, #-0x20]!
  9f8f60: 913380a1     	add	x1, x5, #0xce0
  9f8f64: 910003fd     	mov	x29, sp
  9f8f68: a90153f3     	stp	x19, x20, [sp, #0x10]
  9f8f6c: f9400833     	ldr	x19, [x1, #0x10]
  9f8f70: b4000333     	cbz	x19, 0x9f8fd4 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x230>
  9f8f74: f9400004     	ldr	x4, [x0]
  9f8f78: 52800003     	mov	w3, #0x0                // =0
  9f8f7c: f9401262     	ldr	x2, [x19, #0x20]
  9f8f80: eb04005f     	cmp	x2, x4
  9f8f84: 54000129     	b.ls	0x9f8fa8 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x204>
  9f8f88: f9400a61     	ldr	x1, [x19, #0x10]
  9f8f8c: 52800023     	mov	w3, #0x1                // =1
  9f8f90: b4000101     	cbz	x1, 0x9f8fb0 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x20c>
  9f8f94: aa0103f3     	mov	x19, x1
  9f8f98: 52800003     	mov	w3, #0x0                // =0
  9f8f9c: f9401262     	ldr	x2, [x19, #0x20]
  9f8fa0: eb04005f     	cmp	x2, x4
  9f8fa4: 54ffff28     	b.hi	0x9f8f88 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x1e4>
  9f8fa8: f9400e61     	ldr	x1, [x19, #0x18]
  9f8fac: b5ffff41     	cbnz	x1, 0x9f8f94 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x1f0>
  9f8fb0: aa1303e1     	mov	x1, x19
  9f8fb4: 35000123     	cbnz	w3, 0x9f8fd8 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x234>
  9f8fb8: eb04005f     	cmp	x2, x4
  9f8fbc: 9a9f2260     	csel	x0, x19, xzr, hs
  9f8fc0: eb04005f     	cmp	x2, x4
  9f8fc4: 9a9f3021     	csel	x1, x1, xzr, lo
  9f8fc8: a94153f3     	ldp	x19, x20, [sp, #0x10]
  9f8fcc: a8c27bfd     	ldp	x29, x30, [sp], #0x20
  9f8fd0: d65f03c0     	ret
  9f8fd4: 91002033     	add	x19, x1, #0x8
  9f8fd8: 913380a5     	add	x5, x5, #0xce0
  9f8fdc: f9400ca1     	ldr	x1, [x5, #0x18]
  9f8fe0: eb13003f     	cmp	x1, x19
  9f8fe4: 54000120     	b.eq	0x9f9008 <_ZN7cocos2d6GLView19handleTouchesCancelEiPlPfS2_+0x264>
  9f8fe8: aa0003f4     	mov	x20, x0
  9f8fec: aa1303e0     	mov	x0, x19
  9f8ff0: 9406cd08     	bl	0xbac410 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x2dde8>
  9f8ff4: f9401002     	ldr	x2, [x0, #0x20]
  9f8ff8: aa1303e1     	mov	x1, x19
  9f8ffc: f9400284     	ldr	x4, [x20]
