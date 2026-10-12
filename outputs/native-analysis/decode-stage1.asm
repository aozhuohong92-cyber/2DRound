
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

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
