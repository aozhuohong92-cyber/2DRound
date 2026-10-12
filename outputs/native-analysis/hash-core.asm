
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000003b6dd8 <_ZN6MYHASH6encodeEPKjPhm>:
  3b6dd8: d2800004     	mov	x4, #0x0                // =0
  3b6ddc: b4000323     	cbz	x3, 0x3b6e40 <_ZN6MYHASH6encodeEPKjPhm+0x68>
  3b6de0: b8646820     	ldr	w0, [x1, x4]
  3b6de4: 91001042     	add	x2, x2, #0x4
  3b6de8: 0b000400     	add	w0, w0, w0, lsl #1
  3b6dec: 381fc040     	sturb	w0, [x2, #-0x4]
  3b6df0: b8646820     	ldr	w0, [x1, x4]
  3b6df4: 531c6c05     	lsl	w5, w0, #4
  3b6df8: 4b0008a5     	sub	w5, w5, w0, lsl #2
  3b6dfc: 0b0000a0     	add	w0, w5, w0
  3b6e00: 53087c00     	lsr	w0, w0, #8
  3b6e04: 381fd040     	sturb	w0, [x2, #-0x3]
  3b6e08: b8646825     	ldr	w5, [x1, x4]
  3b6e0c: 531b68a0     	lsl	w0, w5, #5
  3b6e10: 4b050000     	sub	w0, w0, w5
  3b6e14: 53107c00     	lsr	w0, w0, #16
  3b6e18: 381fe040     	sturb	w0, [x2, #-0x2]
  3b6e1c: b8646825     	ldr	w5, [x1, x4]
  3b6e20: 91001084     	add	x4, x4, #0x4
  3b6e24: eb04007f     	cmp	x3, x4
  3b6e28: 531960a0     	lsl	w0, w5, #7
  3b6e2c: 0b050800     	add	w0, w0, w5, lsl #2
  3b6e30: 4b050000     	sub	w0, w0, w5
  3b6e34: 53187c00     	lsr	w0, w0, #24
  3b6e38: 381ff040     	sturb	w0, [x2, #-0x1]
  3b6e3c: 54fffd28     	b.hi	0x3b6de0 <_ZN6MYHASH6encodeEPKjPhm+0x8>
  3b6e40: d65f03c0     	ret

00000000003b6e44 <_ZN6MYHASH6decodeEPKhPjm>:
  3b6e44: d2800007     	mov	x7, #0x0                // =0
  3b6e48: b40002a3     	cbz	x3, 0x3b6e9c <_ZN6MYHASH6decodeEPKhPjm+0x58>
  3b6e4c: 39400c24     	ldrb	w4, [x1, #0x3]
  3b6e50: 91001021     	add	x1, x1, #0x4
  3b6e54: b9401808     	ldr	w8, [x0, #0x18]
  3b6e58: b9401406     	ldr	w6, [x0, #0x14]
  3b6e5c: 385fe025     	ldurb	w5, [x1, #-0x2]
  3b6e60: 4a042108     	eor	w8, w8, w4, lsl #8
  3b6e64: 385fc029     	ldurb	w9, [x1, #-0x4]
  3b6e68: 385fd024     	ldurb	w4, [x1, #-0x3]
  3b6e6c: 4a0540c6     	eor	w6, w6, w5, lsl #16
  3b6e70: b9402005     	ldr	w5, [x0, #0x20]
  3b6e74: 2a060106     	orr	w6, w8, w6
  3b6e78: b9401c08     	ldr	w8, [x0, #0x1c]
  3b6e7c: 4a050125     	eor	w5, w9, w5
  3b6e80: 2a0500c5     	orr	w5, w6, w5
  3b6e84: 4a046104     	eor	w4, w8, w4, lsl #24
  3b6e88: 2a0400a4     	orr	w4, w5, w4
  3b6e8c: b8276844     	str	w4, [x2, x7]
  3b6e90: 910010e7     	add	x7, x7, #0x4
  3b6e94: eb07007f     	cmp	x3, x7
  3b6e98: 54fffda8     	b.hi	0x3b6e4c <_ZN6MYHASH6decodeEPKhPjm+0x8>
  3b6e9c: d65f03c0     	ret

00000000003b6ea0 <_ZN6MYHASH7decode2EPKhPjm>:
  3b6ea0: d2800006     	mov	x6, #0x0                // =0
  3b6ea4: b4000263     	cbz	x3, 0x3b6ef0 <_ZN6MYHASH7decode2EPKhPjm+0x50>
  3b6ea8: 39400820     	ldrb	w0, [x1, #0x2]
  3b6eac: 39400425     	ldrb	w5, [x1, #0x1]
  3b6eb0: 531c6c08     	lsl	w8, w0, #4
  3b6eb4: 39400c27     	ldrb	w7, [x1, #0x3]
  3b6eb8: 4b000908     	sub	w8, w8, w0, lsl #2
  3b6ebc: 38404424     	ldrb	w4, [x1], #0x4
  3b6ec0: 0b000100     	add	w0, w8, w0
  3b6ec4: 531348a9     	lsl	w9, w5, #13
  3b6ec8: 4b052125     	sub	w5, w9, w5, lsl #8
  3b6ecc: 53061488     	lsl	w8, w4, #26
  3b6ed0: 2a0040a0     	orr	w0, w5, w0, lsl #16
  3b6ed4: 4b046104     	sub	w4, w8, w4, lsl #24
  3b6ed8: 2a070000     	orr	w0, w0, w7
  3b6edc: 2a040004     	orr	w4, w0, w4
  3b6ee0: b8266844     	str	w4, [x2, x6]
  3b6ee4: 910010c6     	add	x6, x6, #0x4
  3b6ee8: eb06007f     	cmp	x3, x6
  3b6eec: 54fffde8     	b.hi	0x3b6ea8 <_ZN6MYHASH7decode2EPKhPjm+0x8>
  3b6ef0: d65f03c0     	ret

00000000003b6ef4 <_ZN6MYHASH9transformEPKh>:
  3b6ef4: a9b27bfd     	stp	x29, x30, [sp, #-0xe0]!
  3b6ef8: d2800803     	mov	x3, #0x40               // =64
  3b6efc: 910003fd     	mov	x29, sp
  3b6f00: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b6f04: d0005c54     	adrp	x20, 0xf40000
  3b6f08: 910163a2     	add	x2, x29, #0x58
  3b6f0c: aa0003f3     	mov	x19, x0
  3b6f10: f90023f9     	str	x25, [sp, #0x40]
  3b6f14: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b6f18: f940e694     	ldr	x20, [x20, #0x1c8]
  3b6f1c: aa0103f9     	mov	x25, x1
  3b6f20: b9400815     	ldr	w21, [x0, #0x8]
  3b6f24: b9400c16     	ldr	w22, [x0, #0xc]
  3b6f28: f9400284     	ldr	x4, [x20]
  3b6f2c: a90363f7     	stp	x23, x24, [sp, #0x30]
  3b6f30: f9006fa4     	str	x4, [x29, #0xd8]
  3b6f34: b9401017     	ldr	w23, [x0, #0x10]
  3b6f38: b9400418     	ldr	w24, [x0, #0x4]
  3b6f3c: 97ffffc2     	bl	0x3b6e44 <_ZN6MYHASH6decodeEPKhPjm>
  3b6f40: aa1303e0     	mov	x0, x19
  3b6f44: aa1903e1     	mov	x1, x25
  3b6f48: 910263a2     	add	x2, x29, #0x98
  3b6f4c: d2800803     	mov	x3, #0x40               // =64
  3b6f50: 97ffffd4     	bl	0x3b6ea0 <_ZN6MYHASH7decode2EPKhPjm>
  3b6f54: b9408fa6     	ldr	w6, [x29, #0x8c]
  3b6f58: 0a3502e7     	bic	w7, w23, w21
  3b6f5c: b940aba5     	ldr	w5, [x29, #0xa8]
  3b6f60: 0a1502c4     	and	w4, w22, w21
  3b6f64: 0b060308     	add	w8, w24, w6
  3b6f68: 2a0400e4     	orr	w4, w7, w4
  3b6f6c: 0b050108     	add	w8, w8, w5
  3b6f70: b9405fa0     	ldr	w0, [x29, #0x5c]
  3b6f74: 0b040104     	add	w4, w8, w4
  3b6f78: b940b3a1     	ldr	w1, [x29, #0xb0]
  3b6f7c: 13843084     	ror	w4, w4, #0xc
  3b6f80: 0b0002e7     	add	w7, w23, w0
  3b6f84: 0b150083     	add	w3, w4, w21
  3b6f88: 0b0100e7     	add	w7, w7, w1
  3b6f8c: 0a2302c8     	bic	w8, w22, w3
  3b6f90: 0a150064     	and	w4, w3, w21
  3b6f94: 2a040104     	orr	w4, w8, w4
  3b6f98: b94093a5     	ldr	w5, [x29, #0x90]
  3b6f9c: 0b0400e4     	add	w4, w7, w4
  3b6fa0: b940c3a0     	ldr	w0, [x29, #0xc0]
  3b6fa4: 13844884     	ror	w4, w4, #0x12
  3b6fa8: 0b0502c5     	add	w5, w22, w5
  3b6fac: 0b030082     	add	w2, w4, w3
  3b6fb0: 0b0000a5     	add	w5, w5, w0
  3b6fb4: 2a2203e1     	mvn	w1, w2
  3b6fb8: 0a030044     	and	w4, w2, w3
  3b6fbc: 0a150027     	and	w7, w1, w21
  3b6fc0: 2a0400e4     	orr	w4, w7, w4
  3b6fc4: b94063a7     	ldr	w7, [x29, #0x60]
  3b6fc8: 0b0400a5     	add	w5, w5, w4
  3b6fcc: b940a7a4     	ldr	w4, [x29, #0xa4]
  3b6fd0: 138528a5     	ror	w5, w5, #0xa
  3b6fd4: 0b0702b5     	add	w21, w21, w7
  3b6fd8: 0b0200a5     	add	w5, w5, w2
  3b6fdc: 0b0402a6     	add	w6, w21, w4
  3b6fe0: 2a2503e0     	mvn	w0, w5
  3b6fe4: 0a0200a4     	and	w4, w5, w2
  3b6fe8: 0a030007     	and	w7, w0, w3
  3b6fec: 0a0100a1     	and	w1, w5, w1
  3b6ff0: 2a0400e4     	orr	w4, w7, w4
  3b6ff4: b940a3a7     	ldr	w7, [x29, #0xa0]
  3b6ff8: 0b0400c6     	add	w6, w6, w4
  3b6ffc: b94097a4     	ldr	w4, [x29, #0x94]
  3b7000: 138638c6     	ror	w6, w6, #0xe
  3b7004: 0b0500c6     	add	w6, w6, w5
  3b7008: 0b0400e4     	add	w4, w7, w4
  3b700c: 0b030083     	add	w3, w4, w3
  3b7010: 0a0200c4     	and	w4, w6, w2
  3b7014: 2a010081     	orr	w1, w4, w1
  3b7018: b940d3a7     	ldr	w7, [x29, #0xd0]
  3b701c: 0b010061     	add	w1, w3, w1
  3b7020: b9408ba3     	ldr	w3, [x29, #0x88]
  3b7024: 530b7c24     	lsr	w4, w1, #11
  3b7028: 0a0000c0     	and	w0, w6, w0
  3b702c: 2a013481     	orr	w1, w4, w1, lsl #13
  3b7030: 0b0300e3     	add	w3, w7, w3
  3b7034: 0b060021     	add	w1, w1, w6
  3b7038: 0b020062     	add	w2, w3, w2
  3b703c: 0a050023     	and	w3, w1, w5
  3b7040: b940cfa7     	ldr	w7, [x29, #0xcc]
  3b7044: 2a000060     	orr	w0, w3, w0
  3b7048: 0a260024     	bic	w4, w1, w6
  3b704c: 0b000040     	add	w0, w2, w0
  3b7050: b94083a2     	ldr	w2, [x29, #0x80]
  3b7054: 0b0200e7     	add	w7, w7, w2
  3b7058: 53107c02     	lsr	w2, w0, #16
  3b705c: 2a002040     	orr	w0, w2, w0, lsl #8
  3b7060: 0b0500e5     	add	w5, w7, w5
  3b7064: 0b010003     	add	w3, w0, w1
  3b7068: b9409ba7     	ldr	w7, [x29, #0x98]
  3b706c: 0a060060     	and	w0, w3, w6
  3b7070: 0a210062     	bic	w2, w3, w1
  3b7074: 2a040000     	orr	w0, w0, w4
  3b7078: b9407fa4     	ldr	w4, [x29, #0x7c]
  3b707c: 0b0000a0     	add	w0, w5, w0
  3b7080: 53097c05     	lsr	w5, w0, #9
  3b7084: 0b0400e4     	add	w4, w7, w4
  3b7088: 2a003ca5     	orr	w5, w5, w0, lsl #15
  3b708c: 0b060084     	add	w4, w4, w6
  3b7090: 0b0300a5     	add	w5, w5, w3
  3b7094: b94087a0     	ldr	w0, [x29, #0x84]
  3b7098: 0a0100a7     	and	w7, w5, w1
  3b709c: b9409fa6     	ldr	w6, [x29, #0x9c]
  3b70a0: 2a0200e2     	orr	w2, w7, w2
  3b70a4: b940bba7     	ldr	w7, [x29, #0xb8]
  3b70a8: 0b020082     	add	w2, w4, w2
  3b70ac: 0b0000c6     	add	w6, w6, w0
  3b70b0: 530e7c44     	lsr	w4, w2, #14
  3b70b4: 0b0100c1     	add	w1, w6, w1
  3b70b8: 2a022884     	orr	w4, w4, w2, lsl #10
  3b70bc: b940d7a6     	ldr	w6, [x29, #0xd4]
  3b70c0: b94077a2     	ldr	w2, [x29, #0x74]
  3b70c4: 0b050084     	add	w4, w4, w5
  3b70c8: 4a0300a0     	eor	w0, w5, w3
  3b70cc: 0b0200c6     	add	w6, w6, w2
  3b70d0: 4a040002     	eor	w2, w0, w4
  3b70d4: 0b020021     	add	w1, w1, w2
  3b70d8: 0b0300c3     	add	w3, w6, w3
  3b70dc: 530d7c22     	lsr	w2, w1, #13
  3b70e0: b940bfa6     	ldr	w6, [x29, #0xbc]
  3b70e4: 2a010c42     	orr	w2, w2, w1, lsl #3
  3b70e8: b9407ba1     	ldr	w1, [x29, #0x78]
  3b70ec: 0b040042     	add	w2, w2, w4
  3b70f0: 4a050080     	eor	w0, w4, w5
  3b70f4: 0b0100c6     	add	w6, w6, w1
  3b70f8: 4a020001     	eor	w1, w0, w2
  3b70fc: 0b010063     	add	w3, w3, w1
  3b7100: 4a040040     	eor	w0, w2, w4
  3b7104: 53097c61     	lsr	w1, w3, #9
  3b7108: 0b0500c5     	add	w5, w6, w5
  3b710c: 2a031c23     	orr	w3, w1, w3, lsl #7
  3b7110: b940afa6     	ldr	w6, [x29, #0xac]
  3b7114: 0b020061     	add	w1, w3, w2
  3b7118: b94067a3     	ldr	w3, [x29, #0x64]
  3b711c: 4a010000     	eor	w0, w0, w1
  3b7120: 0b0000a0     	add	w0, w5, w0
  3b7124: 0b0300c6     	add	w6, w6, w3
  3b7128: 53057c05     	lsr	w5, w0, #5
  3b712c: 4a020023     	eor	w3, w1, w2
  3b7130: 2a002ca0     	orr	w0, w5, w0, lsl #11
  3b7134: 0b0400c4     	add	w4, w6, w4
  3b7138: 0b010000     	add	w0, w0, w1
  3b713c: b940c7a6     	ldr	w6, [x29, #0xc4]
  3b7140: 4a000063     	eor	w3, w3, w0
  3b7144: b9406fa5     	ldr	w5, [x29, #0x6c]
  3b7148: 0b030083     	add	w3, w4, w3
  3b714c: 53047c64     	lsr	w4, w3, #4
  3b7150: 0b0500c5     	add	w5, w6, w5
  3b7154: 2a033083     	orr	w3, w4, w3, lsl #12
  3b7158: b9406ba4     	ldr	w4, [x29, #0x68]
  3b715c: 0b0200a2     	add	w2, w5, w2
  3b7160: b94073a6     	ldr	w6, [x29, #0x70]
  3b7164: 0b0400e7     	add	w7, w7, w4
  3b7168: 0b000064     	add	w4, w3, w0
  3b716c: 0b0100e7     	add	w7, w7, w1
  3b7170: 2a210081     	orn	w1, w4, w1
  3b7174: 4a000021     	eor	w1, w1, w0
  3b7178: b940b7a5     	ldr	w5, [x29, #0xb4]
  3b717c: 0b010042     	add	w2, w2, w1
  3b7180: b940cba1     	ldr	w1, [x29, #0xc8]
  3b7184: 53067c43     	lsr	w3, w2, #6
  3b7188: 2a020863     	orr	w3, w3, w2, lsl #2
  3b718c: 0b060026     	add	w6, w1, w6
  3b7190: 0b040063     	add	w3, w3, w4
  3b7194: 0b0000c6     	add	w6, w6, w0
  3b7198: 2a200060     	orn	w0, w3, w0
  3b719c: b9400662     	ldr	w2, [x19, #0x4]
  3b71a0: b9405ba1     	ldr	w1, [x29, #0x58]
  3b71a4: 4a040000     	eor	w0, w0, w4
  3b71a8: 0b0000e0     	add	w0, w7, w0
  3b71ac: 0b0100a5     	add	w5, w5, w1
  3b71b0: 0b030041     	add	w1, w2, w3
  3b71b4: 53037c02     	lsr	w2, w0, #3
  3b71b8: b9000661     	str	w1, [x19, #0x4]
  3b71bc: 2a001440     	orr	w0, w2, w0, lsl #5
  3b71c0: b9400a67     	ldr	w7, [x19, #0x8]
  3b71c4: 0b030000     	add	w0, w0, w3
  3b71c8: 0b0400a5     	add	w5, w5, w4
  3b71cc: 2a240002     	orn	w2, w0, w4
  3b71d0: b9401261     	ldr	w1, [x19, #0x10]
  3b71d4: 4a030042     	eor	w2, w2, w3
  3b71d8: b9400e64     	ldr	w4, [x19, #0xc]
  3b71dc: 0b0200c2     	add	w2, w6, w2
  3b71e0: 0b0000e7     	add	w7, w7, w0
  3b71e4: 53047c49     	lsr	w9, w2, #4
  3b71e8: f9406fa8     	ldr	x8, [x29, #0xd8]
  3b71ec: 2a021122     	orr	w2, w9, w2, lsl #4
  3b71f0: f9400286     	ldr	x6, [x20]
  3b71f4: 0b000042     	add	w2, w2, w0
  3b71f8: b9000a67     	str	w7, [x19, #0x8]
  3b71fc: 2a230043     	orn	w3, w2, w3
  3b7200: 0b010041     	add	w1, w2, w1
  3b7204: 4a000060     	eor	w0, w3, w0
  3b7208: 0b020082     	add	w2, w4, w2
  3b720c: 0b0000a0     	add	w0, w5, w0
  3b7210: b9000e62     	str	w2, [x19, #0xc]
  3b7214: 53077c02     	lsr	w2, w0, #7
  3b7218: eb06011f     	cmp	x8, x6
  3b721c: 2a000440     	orr	w0, w2, w0, lsl #1
  3b7220: 0b000021     	add	w1, w1, w0
  3b7224: b9001261     	str	w1, [x19, #0x10]
  3b7228: 540000e1     	b.ne	0x3b7244 <_ZN6MYHASH9transformEPKh+0x350>
  3b722c: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b7230: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b7234: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3b7238: f94023f9     	ldr	x25, [sp, #0x40]
  3b723c: a8ce7bfd     	ldp	x29, x30, [sp], #0xe0
  3b7240: d65f03c0     	ret
  3b7244: 97ff9057     	bl	0x39b3a0 <__stack_chk_fail@plt>

00000000003b7248 <_ZN6MYHASH4initEPKhm>:
  3b7248: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
  3b724c: 910003fd     	mov	x29, sp
  3b7250: a90363f7     	stp	x23, x24, [sp, #0x30]
  3b7254: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b7258: b9402417     	ldr	w23, [x0, #0x24]
  3b725c: aa0003f4     	mov	x20, x0
  3b7260: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b7264: f90023f9     	str	x25, [sp, #0x40]
  3b7268: aa0203f6     	mov	x22, x2
  3b726c: 531d7042     	lsl	w2, w2, #3
  3b7270: 3900001f     	strb	wzr, [x0]
  3b7274: 0b170040     	add	w0, w2, w23
  3b7278: b9002680     	str	w0, [x20, #0x24]
  3b727c: 6b00005f     	cmp	w2, w0
  3b7280: aa0103f8     	mov	x24, x1
  3b7284: d34322f7     	ubfx	x23, x23, #3, #6
  3b7288: b9402a80     	ldr	w0, [x20, #0x28]
  3b728c: 54000049     	b.ls	0x3b7294 <_ZN6MYHASH4initEPKhm+0x4c>
  3b7290: 11000400     	add	w0, w0, #0x1
  3b7294: 52800813     	mov	w19, #0x40              // =64
  3b7298: 0b567400     	add	w0, w0, w22, lsr #29
  3b729c: 4b170275     	sub	w21, w19, w23
  3b72a0: b9002a80     	str	w0, [x20, #0x28]
  3b72a4: eb1502df     	cmp	x22, x21
  3b72a8: aa1503f3     	mov	x19, x21
  3b72ac: 540001a2     	b.hs	0x3b72e0 <_ZN6MYHASH4initEPKhm+0x98>
  3b72b0: 2a1703f7     	mov	w23, w23
  3b72b4: d2800002     	mov	x2, #0x0                // =0
  3b72b8: 8b170294     	add	x20, x20, x23
  3b72bc: 9100b280     	add	x0, x20, #0x2c
  3b72c0: 8b020301     	add	x1, x24, x2
  3b72c4: f94023f9     	ldr	x25, [sp, #0x40]
  3b72c8: cb0202c2     	sub	x2, x22, x2
  3b72cc: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b72d0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b72d4: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3b72d8: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  3b72dc: 17ff8de1     	b	0x39aa60 <memcpy@plt>
  3b72e0: 2a1703e0     	mov	w0, w23
  3b72e4: aa1803e1     	mov	x1, x24
  3b72e8: 8b000280     	add	x0, x20, x0
  3b72ec: aa1503e2     	mov	x2, x21
  3b72f0: 9100b000     	add	x0, x0, #0x2c
  3b72f4: 9100b299     	add	x25, x20, #0x2c
  3b72f8: 97ff8dda     	bl	0x39aa60 <memcpy@plt>
  3b72fc: aa1403e0     	mov	x0, x20
  3b7300: aa1903e1     	mov	x1, x25
  3b7304: 97fffefc     	bl	0x3b6ef4 <_ZN6MYHASH9transformEPKh>
  3b7308: 52800fe0     	mov	w0, #0x7f               // =127
  3b730c: 4b170017     	sub	w23, w0, w23
  3b7310: eb1702df     	cmp	x22, x23
  3b7314: 54000068     	b.hi	0x3b7320 <_ZN6MYHASH4initEPKhm+0xd8>
  3b7318: 14000013     	b	0x3b7364 <_ZN6MYHASH4initEPKhm+0x11c>
  3b731c: 2a1303f5     	mov	w21, w19
  3b7320: 8b150301     	add	x1, x24, x21
  3b7324: aa1403e0     	mov	x0, x20
  3b7328: 1101fe75     	add	w21, w19, #0x7f
  3b732c: 11010273     	add	w19, w19, #0x40
  3b7330: 97fffef1     	bl	0x3b6ef4 <_ZN6MYHASH9transformEPKh>
  3b7334: eb1502df     	cmp	x22, x21
  3b7338: 54ffff28     	b.hi	0x3b731c <_ZN6MYHASH4initEPKhm+0xd4>
  3b733c: 2a1303e2     	mov	w2, w19
  3b7340: aa1903e0     	mov	x0, x25
  3b7344: 8b020301     	add	x1, x24, x2
  3b7348: f94023f9     	ldr	x25, [sp, #0x40]
  3b734c: cb0202c2     	sub	x2, x22, x2
  3b7350: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b7354: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b7358: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3b735c: a8c57bfd     	ldp	x29, x30, [sp], #0x50
  3b7360: 17ff8dc0     	b	0x39aa60 <memcpy@plt>
  3b7364: aa1503e2     	mov	x2, x21
  3b7368: aa1903e0     	mov	x0, x25
  3b736c: 17ffffd5     	b	0x3b72c0 <_ZN6MYHASH4initEPKhm+0x78>
