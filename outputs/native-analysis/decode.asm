
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

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
