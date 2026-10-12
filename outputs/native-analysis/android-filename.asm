
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000003ae948 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs>:
  3ae948: d0005c82     	adrp	x2, 0xf40000
  3ae94c: a9b47bfd     	stp	x29, x30, [sp, #-0xc0]!
  3ae950: 910003fd     	mov	x29, sp
  3ae954: f940e442     	ldr	x2, [x2, #0x1c8]
  3ae958: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3ae95c: a90153f3     	stp	x19, x20, [sp, #0x10]
  3ae960: f9400042     	ldr	x2, [x2]
  3ae964: aa0803f5     	mov	x21, x8
  3ae968: f9005fa2     	str	x2, [x29, #0xb8]
  3ae96c: a90363f7     	stp	x23, x24, [sp, #0x30]
  3ae970: a9046bf9     	stp	x25, x26, [sp, #0x40]
  3ae974: a90573fb     	stp	x27, x28, [sp, #0x50]
  3ae978: 94191b1b     	bl	0x9f55e4 <_ZNK7cocos2d9FileUtils14getNewFilenameERKSs>
  3ae97c: f00041a1     	adrp	x1, 0xbe5000 <_ZTSN7cocos2d11ApplicationE>
  3ae980: aa1503e0     	mov	x0, x21
  3ae984: 910f2021     	add	x1, x1, #0x3c8
  3ae988: d2800002     	mov	x2, #0x0                // =0
  3ae98c: d2800063     	mov	x3, #0x3                // =3
  3ae990: 942065a9     	bl	0xbc8034 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49a0c>
  3ae994: d1000400     	sub	x0, x0, #0x1
  3ae998: b1000c1f     	cmn	x0, #0x3
  3ae99c: 540001e9     	b.ls	0x3ae9d8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x90>
  3ae9a0: d0005c80     	adrp	x0, 0xf40000
  3ae9a4: f9405fa2     	ldr	x2, [x29, #0xb8]
  3ae9a8: f940e401     	ldr	x1, [x0, #0x1c8]
  3ae9ac: aa1503e0     	mov	x0, x21
  3ae9b0: f9400021     	ldr	x1, [x1]
  3ae9b4: eb01005f     	cmp	x2, x1
  3ae9b8: 54003301     	b.ne	0x3af018 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x6d0>
  3ae9bc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3ae9c0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3ae9c4: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3ae9c8: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  3ae9cc: a94573fb     	ldp	x27, x28, [sp, #0x50]
  3ae9d0: a8cc7bfd     	ldp	x29, x30, [sp], #0xc0
  3ae9d4: d65f03c0     	ret
  3ae9d8: d2800300     	mov	x0, #0x18               // =24
  3ae9dc: f0005cd3     	adrp	x19, 0xf49000
  3ae9e0: 941f3c0a     	bl	0xb7da08 <_Znwm>
  3ae9e4: aa0003f4     	mov	x20, x0
  3ae9e8: aa0003f8     	mov	x24, x0
  3ae9ec: f947ee60     	ldr	x0, [x19, #0xfd8]
  3ae9f0: 91006319     	add	x25, x24, #0x18
  3ae9f4: 91006000     	add	x0, x0, #0x18
  3ae9f8: f8008680     	str	x0, [x20], #0x8
  3ae9fc: b4002974     	cbz	x20, 0x3aef28 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5e0>
  3aea00: f9000700     	str	x0, [x24, #0x8]
  3aea04: b1002296     	adds	x22, x20, #0x8
  3aea08: 54000080     	b.eq	0x3aea18 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xd0>
  3aea0c: f947ee60     	ldr	x0, [x19, #0xfd8]
  3aea10: 91006000     	add	x0, x0, #0x18
  3aea14: f90002c0     	str	x0, [x22]
  3aea18: f9400301     	ldr	x1, [x24]
  3aea1c: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aea20: d1006020     	sub	x0, x1, #0x18
  3aea24: eb02001f     	cmp	x0, x2
  3aea28: 540029e1     	b.ne	0x3aef64 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x61c>
  3aea2c: f9400281     	ldr	x1, [x20]
  3aea30: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aea34: d1006020     	sub	x0, x1, #0x18
  3aea38: eb02001f     	cmp	x0, x2
  3aea3c: 54002ae1     	b.ne	0x3aef98 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x650>
  3aea40: f94002c1     	ldr	x1, [x22]
  3aea44: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aea48: d1006020     	sub	x0, x1, #0x18
  3aea4c: eb02001f     	cmp	x0, x2
  3aea50: 54002701     	b.ne	0x3aef30 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5e8>
  3aea54: f94002a0     	ldr	x0, [x21]
  3aea58: aa1803fc     	mov	x28, x24
  3aea5c: d280001a     	mov	x26, #0x0               // =0
  3aea60: b9008fbf     	str	wzr, [x29, #0x8c]
  3aea64: 9102a3b4     	add	x20, x29, #0xa8
  3aea68: 9102c3b6     	add	x22, x29, #0xb0
  3aea6c: f85e8000     	ldur	x0, [x0, #-0x18]
  3aea70: f90043a0     	str	x0, [x29, #0x80]
  3aea74: 910283a0     	add	x0, x29, #0xa0
  3aea78: f9003ba0     	str	x0, [x29, #0x70]
  3aea7c: f00041a0     	adrp	x0, 0xbe5000 <_ZTSN7cocos2d11ApplicationE>
  3aea80: 910f4000     	add	x0, x0, #0x3d0
  3aea84: f9003fa0     	str	x0, [x29, #0x78]
  3aea88: 528005e1     	mov	w1, #0x2f               // =47
  3aea8c: aa1503e0     	mov	x0, x21
  3aea90: aa1a03e2     	mov	x2, x26
  3aea94: 942065fe     	bl	0xbc828c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49c64>
  3aea98: f947ee7b     	ldr	x27, [x19, #0xfd8]
  3aea9c: b100041f     	cmn	x0, #0x1
  3aeaa0: 91006361     	add	x1, x27, #0x18
  3aeaa4: f9000281     	str	x1, [x20]
  3aeaa8: 540014c0     	b.eq	0x3aed40 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x3f8>
  3aeaac: f94002a1     	ldr	x1, [x21]
  3aeab0: 91000417     	add	x23, x0, #0x1
  3aeab4: cb1a02e3     	sub	x3, x23, x26
  3aeab8: f85e8027     	ldur	x7, [x1, #-0x18]
  3aeabc: eb1a00ff     	cmp	x7, x26
  3aeac0: 540029e3     	b.lo	0x3aeffc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x6b4>
  3aeac4: aa1a03e2     	mov	x2, x26
  3aeac8: aa1603e0     	mov	x0, x22
  3aeacc: aa1503e1     	mov	x1, x21
  3aead0: 94206033     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  3aead4: aa1403e0     	mov	x0, x20
  3aead8: aa1603e1     	mov	x1, x22
  3aeadc: 94206544     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  3aeae0: f94002c1     	ldr	x1, [x22]
  3aeae4: d1006020     	sub	x0, x1, #0x18
  3aeae8: eb1b001f     	cmp	x0, x27
  3aeaec: 540016e1     	b.ne	0x3aedc8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x480>
  3aeaf0: aa1703fa     	mov	x26, x23
  3aeaf4: 52800037     	mov	w23, #0x1               // =1
  3aeaf8: cb18039b     	sub	x27, x28, x24
  3aeafc: 9343ff62     	asr	x2, x27, #3
  3aeb00: b5000f42     	cbnz	x2, 0x3aece8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x3a0>
  3aeb04: eb1c033f     	cmp	x25, x28
  3aeb08: 540006a0     	b.eq	0x3aebdc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x294>
  3aeb0c: b400009c     	cbz	x28, 0x3aeb1c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1d4>
  3aeb10: aa1c03e0     	mov	x0, x28
  3aeb14: aa1403e1     	mov	x1, x20
  3aeb18: 94206f8a     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  3aeb1c: 9100239c     	add	x28, x28, #0x8
  3aeb20: f9400281     	ldr	x1, [x20]
  3aeb24: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aeb28: d1006020     	sub	x0, x1, #0x18
  3aeb2c: eb02001f     	cmp	x0, x2
  3aeb30: 540003a1     	b.ne	0x3aeba4 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x25c>
  3aeb34: 35fffab7     	cbnz	w23, 0x3aea88 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x140>
  3aeb38: b9408fa0     	ldr	w0, [x29, #0x8c]
  3aeb3c: 35001c60     	cbnz	w0, 0x3aeec8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x580>
  3aeb40: eb1c031f     	cmp	x24, x28
  3aeb44: 540015c0     	b.eq	0x3aedfc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4b4>
  3aeb48: aa1803f4     	mov	x20, x24
  3aeb4c: d0005cb7     	adrp	x23, 0xf44000
  3aeb50: 14000004     	b	0x3aeb60 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x218>
  3aeb54: 91002294     	add	x20, x20, #0x8
  3aeb58: eb14039f     	cmp	x28, x20
  3aeb5c: 54001500     	b.eq	0x3aedfc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4b4>
  3aeb60: f9400281     	ldr	x1, [x20]
  3aeb64: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aeb68: d1006020     	sub	x0, x1, #0x18
  3aeb6c: eb02001f     	cmp	x0, x2
  3aeb70: 54ffff20     	b.eq	0x3aeb54 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x20c>
  3aeb74: f94452e2     	ldr	x2, [x23, #0x8a0]
  3aeb78: b4001a02     	cbz	x2, 0x3aeeb8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x570>
  3aeb7c: d1002021     	sub	x1, x1, #0x8
  3aeb80: 885ffc22     	ldaxr	w2, [x1]
  3aeb84: 51000443     	sub	w3, w2, #0x1
  3aeb88: 8804fc23     	stlxr	w4, w3, [x1]
  3aeb8c: 35ffffa4     	cbnz	w4, 0x3aeb80 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x238>
  3aeb90: 6b1f005f     	cmp	w2, wzr
  3aeb94: 54fffe0c     	b.gt	0x3aeb54 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x20c>
  3aeb98: aa1603e1     	mov	x1, x22
  3aeb9c: 94206f08     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aeba0: 17ffffed     	b	0x3aeb54 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x20c>
  3aeba4: d0005ca2     	adrp	x2, 0xf44000
  3aeba8: f9445042     	ldr	x2, [x2, #0x8a0]
  3aebac: b40012e2     	cbz	x2, 0x3aee08 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4c0>
  3aebb0: d1002021     	sub	x1, x1, #0x8
  3aebb4: 885ffc22     	ldaxr	w2, [x1]
  3aebb8: 51000443     	sub	w3, w2, #0x1
  3aebbc: 8804fc23     	stlxr	w4, w3, [x1]
  3aebc0: 35ffffa4     	cbnz	w4, 0x3aebb4 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x26c>
  3aebc4: 6b1f005f     	cmp	w2, wzr
  3aebc8: 54fffb6c     	b.gt	0x3aeb34 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1ec>
  3aebcc: aa1603e1     	mov	x1, x22
  3aebd0: 94206efb     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aebd4: 35fff5b7     	cbnz	w23, 0x3aea88 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x140>
  3aebd8: 17ffffd8     	b	0x3aeb38 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1f0>
  3aebdc: d2800119     	mov	x25, #0x8               // =8
  3aebe0: aa1903e0     	mov	x0, x25
  3aebe4: 941f3b89     	bl	0xb7da08 <_Znwm>
  3aebe8: aa0003e7     	mov	x7, x0
  3aebec: ab1b0000     	adds	x0, x0, x27
  3aebf0: 910020fb     	add	x27, x7, #0x8
  3aebf4: 540000a0     	b.eq	0x3aec08 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x2c0>
  3aebf8: aa1403e1     	mov	x1, x20
  3aebfc: f9004fa7     	str	x7, [x29, #0x98]
  3aec00: 94206f50     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  3aec04: f9404fa7     	ldr	x7, [x29, #0x98]
  3aec08: eb1c031f     	cmp	x24, x28
  3aec0c: 54000620     	b.eq	0x3aecd0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x388>
  3aec10: aa0703e1     	mov	x1, x7
  3aec14: aa1803e0     	mov	x0, x24
  3aec18: b40000c1     	cbz	x1, 0x3aec30 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x2e8>
  3aec1c: f9400002     	ldr	x2, [x0]
  3aec20: f9000022     	str	x2, [x1]
  3aec24: f947ee62     	ldr	x2, [x19, #0xfd8]
  3aec28: 91006042     	add	x2, x2, #0x18
  3aec2c: f9000002     	str	x2, [x0]
  3aec30: 91002000     	add	x0, x0, #0x8
  3aec34: 91002021     	add	x1, x1, #0x8
  3aec38: eb1c001f     	cmp	x0, x28
  3aec3c: 54fffee1     	b.ne	0x3aec18 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x2d0>
  3aec40: 91002306     	add	x6, x24, #0x8
  3aec44: aa1803e2     	mov	x2, x24
  3aec48: cb060386     	sub	x6, x28, x6
  3aec4c: d0005ca8     	adrp	x8, 0xf44000
  3aec50: 927df0c6     	and	x6, x6, #0xfffffffffffffff8
  3aec54: 910040c6     	add	x6, x6, #0x10
  3aec58: 8b0600fb     	add	x27, x7, x6
  3aec5c: 14000004     	b	0x3aec6c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x324>
  3aec60: 91002042     	add	x2, x2, #0x8
  3aec64: eb02039f     	cmp	x28, x2
  3aec68: 54000340     	b.eq	0x3aecd0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x388>
  3aec6c: f9400041     	ldr	x1, [x2]
  3aec70: f947ee63     	ldr	x3, [x19, #0xfd8]
  3aec74: d1006020     	sub	x0, x1, #0x18
  3aec78: eb03001f     	cmp	x0, x3
  3aec7c: 54ffff20     	b.eq	0x3aec60 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x318>
  3aec80: f9445103     	ldr	x3, [x8, #0x8a0]
  3aec84: b4001123     	cbz	x3, 0x3aeea8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x560>
  3aec88: d1002021     	sub	x1, x1, #0x8
  3aec8c: 885ffc23     	ldaxr	w3, [x1]
  3aec90: 51000464     	sub	w4, w3, #0x1
  3aec94: 8805fc24     	stlxr	w5, w4, [x1]
  3aec98: 35ffffa5     	cbnz	w5, 0x3aec8c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x344>
  3aec9c: 6b1f007f     	cmp	w3, wzr
  3aeca0: 54fffe0c     	b.gt	0x3aec60 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x318>
  3aeca4: aa1603e1     	mov	x1, x22
  3aeca8: f90037a8     	str	x8, [x29, #0x68]
  3aecac: f9004ba7     	str	x7, [x29, #0x90]
  3aecb0: f9004fa2     	str	x2, [x29, #0x98]
  3aecb4: 94206ec2     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aecb8: f9404fa2     	ldr	x2, [x29, #0x98]
  3aecbc: f94037a8     	ldr	x8, [x29, #0x68]
  3aecc0: 91002042     	add	x2, x2, #0x8
  3aecc4: f9404ba7     	ldr	x7, [x29, #0x90]
  3aecc8: eb02039f     	cmp	x28, x2
  3aeccc: 54fffd01     	b.ne	0x3aec6c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x324>
  3aecd0: aa1803e0     	mov	x0, x24
  3aecd4: 8b1900f9     	add	x25, x7, x25
  3aecd8: aa1b03fc     	mov	x28, x27
  3aecdc: aa0703f8     	mov	x24, x7
  3aece0: 941f348a     	bl	0xb7bf08 <_ZdlPv>
  3aece4: 17ffff8f     	b	0x3aeb20 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1d8>
  3aece8: d1000440     	sub	x0, x2, #0x1
  3aecec: f00041a1     	adrp	x1, 0xbe5000 <_ZTSN7cocos2d11ApplicationE>
  3aecf0: 910f2026     	add	x6, x1, #0x3c8
  3aecf4: f9004ba2     	str	x2, [x29, #0x90]
  3aecf8: aa0603e1     	mov	x1, x6
  3aecfc: 8b000f00     	add	x0, x24, x0, lsl #3
  3aed00: f9004fa6     	str	x6, [x29, #0x98]
  3aed04: 9420683d     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  3aed08: f9404fa6     	ldr	x6, [x29, #0x98]
  3aed0c: f9404ba2     	ldr	x2, [x29, #0x90]
  3aed10: 35000400     	cbnz	w0, 0x3aed90 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x448>
  3aed14: eb1c033f     	cmp	x25, x28
  3aed18: 54ffefa1     	b.ne	0x3aeb0c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1c4>
  3aed1c: d37ff840     	lsl	x0, x2, #1
  3aed20: 928000f9     	mov	x25, #-0x8              // =-8
  3aed24: eb00005f     	cmp	x2, x0
  3aed28: 54fff5c8     	b.hi	0x3aebe0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x298>
  3aed2c: 92fc0001     	mov	x1, #0x1fffffffffffffff // =2305843009213693951
  3aed30: d37cec42     	lsl	x2, x2, #4
  3aed34: eb01001f     	cmp	x0, x1
  3aed38: 9a999059     	csel	x25, x2, x25, ls
  3aed3c: 17ffffa9     	b	0x3aebe0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x298>
  3aed40: f94002a0     	ldr	x0, [x21]
  3aed44: f94043a1     	ldr	x1, [x29, #0x80]
  3aed48: f85e8007     	ldur	x7, [x0, #-0x18]
  3aed4c: cb1a0023     	sub	x3, x1, x26
  3aed50: eb1a00ff     	cmp	x7, x26
  3aed54: 54001543     	b.lo	0x3aeffc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x6b4>
  3aed58: aa1a03e2     	mov	x2, x26
  3aed5c: aa1603e0     	mov	x0, x22
  3aed60: aa1503e1     	mov	x1, x21
  3aed64: 94205f8e     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  3aed68: aa1403e0     	mov	x0, x20
  3aed6c: aa1603e1     	mov	x1, x22
  3aed70: 9420649f     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  3aed74: f94002c1     	ldr	x1, [x22]
  3aed78: d1006020     	sub	x0, x1, #0x18
  3aed7c: eb1b001f     	cmp	x0, x27
  3aed80: 54000661     	b.ne	0x3aee4c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x504>
  3aed84: d280001a     	mov	x26, #0x0               // =0
  3aed88: 52800017     	mov	w23, #0x0               // =0
  3aed8c: 17ffff5b     	b	0x3aeaf8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1b0>
  3aed90: aa1403e0     	mov	x0, x20
  3aed94: aa0603e1     	mov	x1, x6
  3aed98: f9004fa2     	str	x2, [x29, #0x98]
  3aed9c: 94206817     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  3aeda0: 35000700     	cbnz	w0, 0x3aee80 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x538>
  3aeda4: f85f839b     	ldur	x27, [x28, #-0x8]
  3aeda8: d100239c     	sub	x28, x28, #0x8
  3aedac: f947ee61     	ldr	x1, [x19, #0xfd8]
  3aedb0: d1006360     	sub	x0, x27, #0x18
  3aedb4: eb01001f     	cmp	x0, x1
  3aedb8: 54000301     	b.ne	0x3aee18 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4d0>
  3aedbc: 52800020     	mov	w0, #0x1                // =1
  3aedc0: b9008fa0     	str	w0, [x29, #0x8c]
  3aedc4: 17ffff57     	b	0x3aeb20 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1d8>
  3aedc8: d0005ca2     	adrp	x2, 0xf44000
  3aedcc: f9445042     	ldr	x2, [x2, #0x8a0]
  3aedd0: b4000642     	cbz	x2, 0x3aee98 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x550>
  3aedd4: d1002021     	sub	x1, x1, #0x8
  3aedd8: 885ffc22     	ldaxr	w2, [x1]
  3aeddc: 51000443     	sub	w3, w2, #0x1
  3aede0: 8804fc23     	stlxr	w4, w3, [x1]
  3aede4: 35ffffa4     	cbnz	w4, 0x3aedd8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x490>
  3aede8: 6b1f005f     	cmp	w2, wzr
  3aedec: 54ffe82c     	b.gt	0x3aeaf0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1a8>
  3aedf0: f9403ba1     	ldr	x1, [x29, #0x70]
  3aedf4: 94206e72     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aedf8: 17ffff3e     	b	0x3aeaf0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x1a8>
  3aedfc: aa1803e0     	mov	x0, x24
  3aee00: 941f3442     	bl	0xb7bf08 <_ZdlPv>
  3aee04: 17fffee7     	b	0x3ae9a0 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x58>
  3aee08: b85f8022     	ldur	w2, [x1, #-0x8]
  3aee0c: 51000443     	sub	w3, w2, #0x1
  3aee10: b81f8023     	stur	w3, [x1, #-0x8]
  3aee14: 17ffff6c     	b	0x3aebc4 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x27c>
  3aee18: d0005ca1     	adrp	x1, 0xf44000
  3aee1c: f9445021     	ldr	x1, [x1, #0x8a0]
  3aee20: b4000741     	cbz	x1, 0x3aef08 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5c0>
  3aee24: d100237b     	sub	x27, x27, #0x8
  3aee28: 885fff61     	ldaxr	w1, [x27]
  3aee2c: 51000422     	sub	w2, w1, #0x1
  3aee30: 8803ff62     	stlxr	w3, w2, [x27]
  3aee34: 35ffffa3     	cbnz	w3, 0x3aee28 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4e0>
  3aee38: 6b1f003f     	cmp	w1, wzr
  3aee3c: 54fffc0c     	b.gt	0x3aedbc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x474>
  3aee40: aa1603e1     	mov	x1, x22
  3aee44: 94206e5e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aee48: 17ffffdd     	b	0x3aedbc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x474>
  3aee4c: d0005ca2     	adrp	x2, 0xf44000
  3aee50: f9445042     	ldr	x2, [x2, #0x8a0]
  3aee54: b4000622     	cbz	x2, 0x3aef18 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5d0>
  3aee58: d1002021     	sub	x1, x1, #0x8
  3aee5c: 885ffc22     	ldaxr	w2, [x1]
  3aee60: 51000443     	sub	w3, w2, #0x1
  3aee64: 8804fc23     	stlxr	w4, w3, [x1]
  3aee68: 35ffffa4     	cbnz	w4, 0x3aee5c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x514>
  3aee6c: 6b1f005f     	cmp	w2, wzr
  3aee70: 54fff8ac     	b.gt	0x3aed84 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x43c>
  3aee74: f9403ba1     	ldr	x1, [x29, #0x70]
  3aee78: 94206e51     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aee7c: 17ffffc2     	b	0x3aed84 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x43c>
  3aee80: f9403fa1     	ldr	x1, [x29, #0x78]
  3aee84: aa1403e0     	mov	x0, x20
  3aee88: 942067dc     	bl	0xbc8df8 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4a7d0>
  3aee8c: f9404fa2     	ldr	x2, [x29, #0x98]
  3aee90: 34fff8a0     	cbz	w0, 0x3aeda4 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x45c>
  3aee94: 17ffffa0     	b	0x3aed14 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x3cc>
  3aee98: b85f8022     	ldur	w2, [x1, #-0x8]
  3aee9c: 51000443     	sub	w3, w2, #0x1
  3aeea0: b81f8023     	stur	w3, [x1, #-0x8]
  3aeea4: 17ffffd1     	b	0x3aede8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4a0>
  3aeea8: b85f8023     	ldur	w3, [x1, #-0x8]
  3aeeac: 51000469     	sub	w9, w3, #0x1
  3aeeb0: b81f8029     	stur	w9, [x1, #-0x8]
  3aeeb4: 17ffff7a     	b	0x3aec9c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x354>
  3aeeb8: b85f8022     	ldur	w2, [x1, #-0x8]
  3aeebc: 51000443     	sub	w3, w2, #0x1
  3aeec0: b81f8023     	stur	w3, [x1, #-0x8]
  3aeec4: 17ffff33     	b	0x3aeb90 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x248>
  3aeec8: f94002a2     	ldr	x2, [x21]
  3aeecc: aa1503e0     	mov	x0, x21
  3aeed0: d2800001     	mov	x1, #0x0                // =0
  3aeed4: d2800003     	mov	x3, #0x0                // =0
  3aeed8: f85e8042     	ldur	x2, [x2, #-0x18]
  3aeedc: 9420687d     	bl	0xbc90d0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4aaa8>
  3aeee0: eb1c031f     	cmp	x24, x28
  3aeee4: 54fff8c0     	b.eq	0x3aedfc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4b4>
  3aeee8: aa1803f4     	mov	x20, x24
  3aeeec: aa1403e1     	mov	x1, x20
  3aeef0: aa1503e0     	mov	x0, x21
  3aeef4: 91002294     	add	x20, x20, #0x8
  3aeef8: 942062cd     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  3aeefc: eb14039f     	cmp	x28, x20
  3aef00: 54ffff61     	b.ne	0x3aeeec <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5a4>
  3aef04: 17ffff11     	b	0x3aeb48 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x200>
  3aef08: b85f8361     	ldur	w1, [x27, #-0x8]
  3aef0c: 51000422     	sub	w2, w1, #0x1
  3aef10: b81f8362     	stur	w2, [x27, #-0x8]
  3aef14: 17ffffc9     	b	0x3aee38 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x4f0>
  3aef18: b85f8022     	ldur	w2, [x1, #-0x8]
  3aef1c: 51000443     	sub	w3, w2, #0x1
  3aef20: b81f8023     	stur	w3, [x1, #-0x8]
  3aef24: 17ffffd2     	b	0x3aee6c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x524>
  3aef28: d2800116     	mov	x22, #0x8               // =8
  3aef2c: 17fffeb8     	b	0x3aea0c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xc4>
  3aef30: d0005ca2     	adrp	x2, 0xf44000
  3aef34: f9445042     	ldr	x2, [x2, #0x8a0]
  3aef38: b40004a2     	cbz	x2, 0x3aefcc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x684>
  3aef3c: d1002021     	sub	x1, x1, #0x8
  3aef40: 885ffc22     	ldaxr	w2, [x1]
  3aef44: 51000443     	sub	w3, w2, #0x1
  3aef48: 8804fc23     	stlxr	w4, w3, [x1]
  3aef4c: 35ffffa4     	cbnz	w4, 0x3aef40 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x5f8>
  3aef50: 6b1f005f     	cmp	w2, wzr
  3aef54: 54ffd80c     	b.gt	0x3aea54 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x10c>
  3aef58: 9102c3a1     	add	x1, x29, #0xb0
  3aef5c: 94206e18     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aef60: 17fffebd     	b	0x3aea54 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x10c>
  3aef64: d0005ca2     	adrp	x2, 0xf44000
  3aef68: f9445042     	ldr	x2, [x2, #0x8a0]
  3aef6c: b4000382     	cbz	x2, 0x3aefdc <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x694>
  3aef70: d1002021     	sub	x1, x1, #0x8
  3aef74: 885ffc22     	ldaxr	w2, [x1]
  3aef78: 51000443     	sub	w3, w2, #0x1
  3aef7c: 8804fc23     	stlxr	w4, w3, [x1]
  3aef80: 35ffffa4     	cbnz	w4, 0x3aef74 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x62c>
  3aef84: 6b1f005f     	cmp	w2, wzr
  3aef88: 54ffd52c     	b.gt	0x3aea2c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xe4>
  3aef8c: 9102c3a1     	add	x1, x29, #0xb0
  3aef90: 94206e0b     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aef94: 17fffea6     	b	0x3aea2c <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xe4>
  3aef98: d0005ca2     	adrp	x2, 0xf44000
  3aef9c: f9445042     	ldr	x2, [x2, #0x8a0]
  3aefa0: b4000262     	cbz	x2, 0x3aefec <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x6a4>
  3aefa4: d1002021     	sub	x1, x1, #0x8
  3aefa8: 885ffc22     	ldaxr	w2, [x1]
  3aefac: 51000443     	sub	w3, w2, #0x1
  3aefb0: 8804fc23     	stlxr	w4, w3, [x1]
  3aefb4: 35ffffa4     	cbnz	w4, 0x3aefa8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x660>
  3aefb8: 6b1f005f     	cmp	w2, wzr
  3aefbc: 54ffd42c     	b.gt	0x3aea40 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xf8>
  3aefc0: 9102c3a1     	add	x1, x29, #0xb0
  3aefc4: 94206dfe     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3aefc8: 17fffe9e     	b	0x3aea40 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0xf8>
  3aefcc: b85f8022     	ldur	w2, [x1, #-0x8]
  3aefd0: 51000443     	sub	w3, w2, #0x1
  3aefd4: b81f8023     	stur	w3, [x1, #-0x8]
  3aefd8: 17ffffde     	b	0x3aef50 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x608>
  3aefdc: b85f8022     	ldur	w2, [x1, #-0x8]
  3aefe0: 51000443     	sub	w3, w2, #0x1
  3aefe4: b81f8023     	stur	w3, [x1, #-0x8]
  3aefe8: 17ffffe7     	b	0x3aef84 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x63c>
  3aefec: b85f8022     	ldur	w2, [x1, #-0x8]
  3aeff0: 51000443     	sub	w3, w2, #0x1
  3aeff4: b81f8023     	stur	w3, [x1, #-0x8]
  3aeff8: 17fffff0     	b	0x3aefb8 <_ZNK7cocos2d16FileUtilsAndroid14getNewFilenameERKSs+0x670>
  3aeffc: d00041a0     	adrp	x0, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3af000: b00041a1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3af004: 912f0000     	add	x0, x0, #0xbc0
  3af008: 912fe021     	add	x1, x1, #0xbf8
  3af00c: aa1a03e2     	mov	x2, x26
  3af010: aa0703e3     	mov	x3, x7
  3af014: 94205921     	bl	0xbc5498 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x46e70>
  3af018: 97ffb0e2     	bl	0x39b3a0 <__stack_chk_fail@plt>
