
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000003b7370 <_ZN6MYHASHC2ERKSs>:
  3b7370: f9400021     	ldr	x1, [x1]
  3b7374: 5285ef0b     	mov	w11, #0x2f78            // =12152
  3b7378: 528966aa     	mov	w10, #0x4b35            // =19253
  3b737c: 5289a629     	mov	w9, #0x4d31             // =19761
  3b7380: 528d6e68     	mov	w8, #0x6b73             // =27507
  3b7384: 2a0b03e7     	mov	w7, w11
  3b7388: f85e8022     	ldur	x2, [x1, #-0x18]
  3b738c: 2a0a03e6     	mov	w6, w10
  3b7390: 2a0903e5     	mov	w5, w9
  3b7394: 2a0803e4     	mov	w4, w8
  3b7398: 72a34fab     	movk	w11, #0x1a7d, lsl #16
  3b739c: 72aaf38a     	movk	w10, #0x579c, lsl #16
  3b73a0: 72b34769     	movk	w9, #0x9a3b, lsl #16
  3b73a4: 72b87a88     	movk	w8, #0xc3d4, lsl #16
  3b73a8: 72a34fa7     	movk	w7, #0x1a7d, lsl #16
  3b73ac: 72aaf386     	movk	w6, #0x579c, lsl #16
  3b73b0: 72b34765     	movk	w5, #0x9a3b, lsl #16
  3b73b4: 72b87a84     	movk	w4, #0xc3d4, lsl #16
  3b73b8: 3900001f     	strb	wzr, [x0]
  3b73bc: b900281f     	str	wzr, [x0, #0x28]
  3b73c0: b900241f     	str	wzr, [x0, #0x24]
  3b73c4: b900040b     	str	w11, [x0, #0x4]
  3b73c8: b900080a     	str	w10, [x0, #0x8]
  3b73cc: b9000c09     	str	w9, [x0, #0xc]
  3b73d0: b9001008     	str	w8, [x0, #0x10]
  3b73d4: b9001407     	str	w7, [x0, #0x14]
  3b73d8: b9001806     	str	w6, [x0, #0x18]
  3b73dc: b9001c05     	str	w5, [x0, #0x1c]
  3b73e0: b9002004     	str	w4, [x0, #0x20]
  3b73e4: 17ffff99     	b	0x3b7248 <_ZN6MYHASH4initEPKhm>

00000000003b73e8 <_ZN6MYHASH9getDigestEv>:
  3b73e8: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  3b73ec: 910003fd     	mov	x29, sp
  3b73f0: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b73f4: b0005c54     	adrp	x20, 0xf40000
  3b73f8: 39400001     	ldrb	w1, [x0]
  3b73fc: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b7400: f9001bf7     	str	x23, [sp, #0x30]
  3b7404: aa0003f3     	mov	x19, x0
  3b7408: f940e682     	ldr	x2, [x20, #0x1c8]
  3b740c: 9101b015     	add	x21, x0, #0x6c
  3b7410: f9400042     	ldr	x2, [x2]
  3b7414: f90037a2     	str	x2, [x29, #0x68]
  3b7418: 34000181     	cbz	w1, 0x3b7448 <_ZN6MYHASH9getDigestEv+0x60>
  3b741c: f940e694     	ldr	x20, [x20, #0x1c8]
  3b7420: aa1503e0     	mov	x0, x21
  3b7424: f94037a2     	ldr	x2, [x29, #0x68]
  3b7428: f9400281     	ldr	x1, [x20]
  3b742c: eb01005f     	cmp	x2, x1
  3b7430: 540005c1     	b.ne	0x3b74e8 <_ZN6MYHASH9getDigestEv+0x100>
  3b7434: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b7438: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b743c: f9401bf7     	ldr	x23, [sp, #0x30]
  3b7440: a8c77bfd     	ldp	x29, x30, [sp], #0x70
  3b7444: d65f03c0     	ret
  3b7448: aa0003f6     	mov	x22, x0
  3b744c: 52800024     	mov	w4, #0x1                // =1
  3b7450: 910183b7     	add	x23, x29, #0x60
  3b7454: 91009001     	add	x1, x0, #0x24
  3b7458: aa1703e2     	mov	x2, x23
  3b745c: d2800103     	mov	x3, #0x8                // =8
  3b7460: 380046c4     	strb	w4, [x22], #0x4
  3b7464: f8424006     	ldur	x6, [x0, #0x24]
  3b7468: a94016c4     	ldp	x4, x5, [x22]
  3b746c: f90027a6     	str	x6, [x29, #0x48]
  3b7470: a90517a4     	stp	x4, x5, [x29, #0x50]
  3b7474: 97fffe59     	bl	0x3b6dd8 <_ZN6MYHASH6encodeEPKjPhm>
  3b7478: b9402660     	ldr	w0, [x19, #0x24]
  3b747c: d3432000     	ubfx	x0, x0, #3, #6
  3b7480: 7100dc1f     	cmp	w0, #0x37
  3b7484: 540002c9     	b.ls	0x3b74dc <_ZN6MYHASH9getDigestEv+0xf4>
  3b7488: 52800f02     	mov	w2, #0x78               // =120
  3b748c: 4b000042     	sub	w2, w2, w0
  3b7490: d0005c81     	adrp	x1, 0xf49000
  3b7494: aa1303e0     	mov	x0, x19
  3b7498: 9101b275     	add	x21, x19, #0x6c
  3b749c: f947e821     	ldr	x1, [x1, #0xfd0]
  3b74a0: 97ffff6a     	bl	0x3b7248 <_ZN6MYHASH4initEPKhm>
  3b74a4: aa1303e0     	mov	x0, x19
  3b74a8: aa1703e1     	mov	x1, x23
  3b74ac: d2800102     	mov	x2, #0x8                // =8
  3b74b0: 97ffff66     	bl	0x3b7248 <_ZN6MYHASH4initEPKhm>
  3b74b4: aa1303e0     	mov	x0, x19
  3b74b8: aa1603e1     	mov	x1, x22
  3b74bc: aa1503e2     	mov	x2, x21
  3b74c0: d2800203     	mov	x3, #0x10               // =16
  3b74c4: 97fffe45     	bl	0x3b6dd8 <_ZN6MYHASH6encodeEPKjPhm>
  3b74c8: a94507a0     	ldp	x0, x1, [x29, #0x50]
  3b74cc: a90006c0     	stp	x0, x1, [x22]
  3b74d0: f94027a0     	ldr	x0, [x29, #0x48]
  3b74d4: f8024260     	stur	x0, [x19, #0x24]
  3b74d8: 17ffffd1     	b	0x3b741c <_ZN6MYHASH9getDigestEv+0x34>
  3b74dc: 52800702     	mov	w2, #0x38               // =56
  3b74e0: 4b000042     	sub	w2, w2, w0
  3b74e4: 17ffffeb     	b	0x3b7490 <_ZN6MYHASH9getDigestEv+0xa8>
  3b74e8: 97ff8fae     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000003b74ec <_ZN6MYHASH5toStrEv>:
  3b74ec: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  3b74f0: 910003fd     	mov	x29, sp
  3b74f4: a90363f7     	stp	x23, x24, [sp, #0x30]
  3b74f8: b0005c57     	adrp	x23, 0xf40000
  3b74fc: d0005c98     	adrp	x24, 0xf49000
  3b7500: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b7504: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b7508: f940e6e1     	ldr	x1, [x23, #0x1c8]
  3b750c: aa0803f4     	mov	x20, x8
  3b7510: f9400021     	ldr	x1, [x1]
  3b7514: f90027a1     	str	x1, [x29, #0x48]
  3b7518: 97ffffb4     	bl	0x3b73e8 <_ZN6MYHASH9getDigestEv>
  3b751c: aa0003f5     	mov	x21, x0
  3b7520: f947ef02     	ldr	x2, [x24, #0xfd8]
  3b7524: aa1403e0     	mov	x0, x20
  3b7528: d2800201     	mov	x1, #0x10               // =16
  3b752c: 91006042     	add	x2, x2, #0x18
  3b7530: f9000282     	str	x2, [x20]
  3b7534: 94203fdb     	bl	0xbc74a0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48e78>
  3b7538: d2800013     	mov	x19, #0x0               // =0
  3b753c: b0005c76     	adrp	x22, 0xf44000
  3b7540: 38736aa4     	ldrb	w4, [x21, x19]
  3b7544: 52901022     	mov	w2, #0x8081             // =32897
  3b7548: 72b01002     	movk	w2, #0x8080, lsl #16
  3b754c: 52849263     	mov	w3, #0x2493             // =9363
  3b7550: 72b24923     	movk	w3, #0x9249, lsl #16
  3b7554: f940b6c6     	ldr	x6, [x22, #0x168]
  3b7558: 9b227c82     	smull	x2, w4, w2
  3b755c: aa1403e0     	mov	x0, x20
  3b7560: d2800021     	mov	x1, #0x1                // =1
  3b7564: d360fc42     	lsr	x2, x2, #32
  3b7568: 0b020082     	add	w2, w4, w2
  3b756c: 13077c42     	asr	w2, w2, #7
  3b7570: 53185c45     	lsl	w5, w2, #8
  3b7574: 4b0200a2     	sub	w2, w5, w2
  3b7578: 4b020082     	sub	w2, w4, w2
  3b757c: 9b237c43     	smull	x3, w2, w3
  3b7580: d360fc63     	lsr	x3, x3, #32
  3b7584: 0b030043     	add	w3, w2, w3
  3b7588: 13027c63     	asr	w3, w3, #2
  3b758c: 4b827c62     	sub	w2, w3, w2, asr #31
  3b7590: 3862c8c2     	ldrb	w2, [x6, w2, sxtw]
  3b7594: 942041b0     	bl	0xbc7c54 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4962c>
  3b7598: 91000673     	add	x19, x19, #0x1
  3b759c: f100427f     	cmp	x19, #0x10
  3b75a0: 54fffd01     	b.ne	0x3b7540 <_ZN6MYHASH5toStrEv+0x54>
  3b75a4: f940e6f7     	ldr	x23, [x23, #0x1c8]
  3b75a8: aa1403e0     	mov	x0, x20
  3b75ac: f94027a2     	ldr	x2, [x29, #0x48]
  3b75b0: f94002e1     	ldr	x1, [x23]
  3b75b4: eb01005f     	cmp	x2, x1
  3b75b8: 54000201     	b.ne	0x3b75f8 <_ZN6MYHASH5toStrEv+0x10c>
  3b75bc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b75c0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b75c4: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3b75c8: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  3b75cc: d65f03c0     	ret
  3b75d0: f9400281     	ldr	x1, [x20]
  3b75d4: aa0003f3     	mov	x19, x0
  3b75d8: f947ef18     	ldr	x24, [x24, #0xfd8]
  3b75dc: d1006020     	sub	x0, x1, #0x18
  3b75e0: eb18001f     	cmp	x0, x24
  3b75e4: 54000060     	b.eq	0x3b75f0 <_ZN6MYHASH5toStrEv+0x104>
  3b75e8: 910103a1     	add	x1, x29, #0x40
  3b75ec: 97ff938b     	bl	0x39c418 <.text+0x108>
  3b75f0: aa1303e0     	mov	x0, x19
  3b75f4: 9420ae3b     	bl	0xbe2ee0 <_Unwind_Resume>
  3b75f8: 97ff8f6a     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000003b75fc <_ZN6MYHASH8toStringEv>:
  3b75fc: a9b97bfd     	stp	x29, x30, [sp, #-0x70]!
  3b7600: 910003fd     	mov	x29, sp
  3b7604: a9046bf9     	stp	x25, x26, [sp, #0x40]
  3b7608: b0005c59     	adrp	x25, 0xf40000
  3b760c: d0005c9a     	adrp	x26, 0xf49000
  3b7610: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b7614: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b7618: f940e721     	ldr	x1, [x25, #0x1c8]
  3b761c: aa0803f4     	mov	x20, x8
  3b7620: a90363f7     	stp	x23, x24, [sp, #0x30]
  3b7624: f9002bfb     	str	x27, [sp, #0x50]
  3b7628: f9400021     	ldr	x1, [x1]
  3b762c: f90037a1     	str	x1, [x29, #0x68]
  3b7630: 97ffff6e     	bl	0x3b73e8 <_ZN6MYHASH9getDigestEv>
  3b7634: aa0003f5     	mov	x21, x0
  3b7638: f947ef42     	ldr	x2, [x26, #0xfd8]
  3b763c: aa1403e0     	mov	x0, x20
  3b7640: d2800401     	mov	x1, #0x20               // =32
  3b7644: 91006042     	add	x2, x2, #0x18
  3b7648: f9000282     	str	x2, [x20]
  3b764c: 94203f95     	bl	0xbc74a0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48e78>
  3b7650: d2800013     	mov	x19, #0x0               // =0
  3b7654: f0005c56     	adrp	x22, 0xf42000
  3b7658: 52800357     	mov	w23, #0x1a              // =26
  3b765c: d0005c58     	adrp	x24, 0xf41000
  3b7660: 38736aa4     	ldrb	w4, [x21, x19]
  3b7664: 5290a3e2     	mov	w2, #0x851f             // =34079
  3b7668: 72aa3d62     	movk	w2, #0x51eb, lsl #16
  3b766c: 528ccce3     	mov	w3, #0x6667             // =26215
  3b7670: 72acccc3     	movk	w3, #0x6666, lsl #16
  3b7674: 529d89fb     	mov	w27, #0xec4f            // =60495
  3b7678: 9b227c82     	smull	x2, w4, w2
  3b767c: 72a9d89b     	movk	w27, #0x4ec4, lsl #16
  3b7680: f94372c5     	ldr	x5, [x22, #0x6e0]
  3b7684: d363fc42     	lsr	x2, x2, #35
  3b7688: aa1403e0     	mov	x0, x20
  3b768c: 9b3b7c9b     	smull	x27, w4, w27
  3b7690: 9b237c43     	smull	x3, w2, w3
  3b7694: d363ff7b     	lsr	x27, x27, #35
  3b7698: d2800021     	mov	x1, #0x1                // =1
  3b769c: d362fc63     	lsr	x3, x3, #34
