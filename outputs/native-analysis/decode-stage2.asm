
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

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
