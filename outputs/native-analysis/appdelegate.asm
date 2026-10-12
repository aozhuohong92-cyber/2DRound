
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000003a7aac <_ZN11AppDelegate29applicationDidFinishLaunchingEv>:
  3a7aac: a9b47bfd     	stp	x29, x30, [sp, #-0xc0]!
  3a7ab0: 910003fd     	mov	x29, sp
  3a7ab4: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3a7ab8: b0005cd6     	adrp	x22, 0xf40000
  3a7abc: f9002bfb     	str	x27, [sp, #0x50]
  3a7ac0: a90153f3     	stp	x19, x20, [sp, #0x10]
  3a7ac4: a90363f7     	stp	x23, x24, [sp, #0x30]
  3a7ac8: f940e6c0     	ldr	x0, [x22, #0x1c8]
  3a7acc: 9101a3b4     	add	x20, x29, #0x68
  3a7ad0: a9046bf9     	stp	x25, x26, [sp, #0x40]
  3a7ad4: 910243b5     	add	x21, x29, #0x90
  3a7ad8: f9400000     	ldr	x0, [x0]
  3a7adc: f9005fa0     	str	x0, [x29, #0xb8]
  3a7ae0: 9419beaf     	bl	0xa1759c <_ZN7cocos2d8Director11getInstanceEv>
  3a7ae4: f9400001     	ldr	x1, [x0]
  3a7ae8: 1c0036a0     	ldr	s0, 0x3a81bc <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x710>
  3a7aec: f9400c21     	ldr	x1, [x1, #0x18]
  3a7af0: d63f0020     	blr	x1
  3a7af4: f90053bf     	str	xzr, [x29, #0xa0]
  3a7af8: b00041e1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7afc: aa1403e0     	mov	x0, x20
  3a7b00: 912b8021     	add	x1, x1, #0xae0
  3a7b04: aa1503e2     	mov	x2, x21
  3a7b08: f90057bf     	str	xzr, [x29, #0xa8]
  3a7b0c: f9005bbf     	str	xzr, [x29, #0xb0]
  3a7b10: 94207d30     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3a7b14: f94057a0     	ldr	x0, [x29, #0xa8]
  3a7b18: 910283b3     	add	x19, x29, #0xa0
  3a7b1c: f9405ba1     	ldr	x1, [x29, #0xb0]
  3a7b20: eb01001f     	cmp	x0, x1
  3a7b24: 54002600     	b.eq	0x3a7fe4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x538>
  3a7b28: b4001940     	cbz	x0, 0x3a7e50 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3a4>
  3a7b2c: f94037a1     	ldr	x1, [x29, #0x68]
  3a7b30: d0005d14     	adrp	x20, 0xf49000
  3a7b34: f9000001     	str	x1, [x0]
  3a7b38: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a7b3c: 91006021     	add	x1, x1, #0x18
  3a7b40: f90037a1     	str	x1, [x29, #0x68]
  3a7b44: 91002000     	add	x0, x0, #0x8
  3a7b48: f90057a0     	str	x0, [x29, #0xa8]
  3a7b4c: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7b50: d1006020     	sub	x0, x1, #0x18
  3a7b54: eb02001f     	cmp	x0, x2
  3a7b58: 54002221     	b.ne	0x3a7f9c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x4f0>
  3a7b5c: 9101c3b7     	add	x23, x29, #0x70
  3a7b60: b00041e1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7b64: aa1703e0     	mov	x0, x23
  3a7b68: 912bc021     	add	x1, x1, #0xaf0
  3a7b6c: aa1503e2     	mov	x2, x21
  3a7b70: 94207d18     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3a7b74: f94057a0     	ldr	x0, [x29, #0xa8]
  3a7b78: f9405ba1     	ldr	x1, [x29, #0xb0]
  3a7b7c: eb00003f     	cmp	x1, x0
  3a7b80: 540023e0     	b.eq	0x3a7ffc <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x550>
  3a7b84: f9403ba1     	ldr	x1, [x29, #0x70]
  3a7b88: b40000a0     	cbz	x0, 0x3a7b9c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0xf0>
  3a7b8c: f9000001     	str	x1, [x0]
  3a7b90: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a7b94: 91006021     	add	x1, x1, #0x18
  3a7b98: f9003ba1     	str	x1, [x29, #0x70]
  3a7b9c: 91002000     	add	x0, x0, #0x8
  3a7ba0: f90057a0     	str	x0, [x29, #0xa8]
  3a7ba4: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7ba8: d1006020     	sub	x0, x1, #0x18
  3a7bac: eb02001f     	cmp	x0, x2
  3a7bb0: 54001701     	b.ne	0x3a7e90 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3e4>
  3a7bb4: 9101e3b8     	add	x24, x29, #0x78
  3a7bb8: b00041e1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7bbc: aa1803e0     	mov	x0, x24
  3a7bc0: 912c2021     	add	x1, x1, #0xb08
  3a7bc4: aa1503e2     	mov	x2, x21
  3a7bc8: 94207d02     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3a7bcc: f94057a1     	ldr	x1, [x29, #0xa8]
  3a7bd0: f9405ba0     	ldr	x0, [x29, #0xb0]
  3a7bd4: eb01001f     	cmp	x0, x1
  3a7bd8: 54001fc0     	b.eq	0x3a7fd0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x524>
  3a7bdc: f9403fa0     	ldr	x0, [x29, #0x78]
  3a7be0: b40000a1     	cbz	x1, 0x3a7bf4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x148>
  3a7be4: f9000020     	str	x0, [x1]
  3a7be8: f947ee80     	ldr	x0, [x20, #0xfd8]
  3a7bec: 91006000     	add	x0, x0, #0x18
  3a7bf0: f9003fa0     	str	x0, [x29, #0x78]
  3a7bf4: 91002021     	add	x1, x1, #0x8
  3a7bf8: f90057a1     	str	x1, [x29, #0xa8]
  3a7bfc: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7c00: d1006001     	sub	x1, x0, #0x18
  3a7c04: eb02003f     	cmp	x1, x2
  3a7c08: 54001781     	b.ne	0x3a7ef8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x44c>
  3a7c0c: aa1303e0     	mov	x0, x19
  3a7c10: 9419b391     	bl	0xa14a54 <_ZN7cocos2d4Data12setWhiteListERKSt6vectorISsSaISsEE>
  3a7c14: 94002fee     	bl	0x3b3bcc <_ZN7cocos2d9LuaEngine11getInstanceEv>
  3a7c18: aa0003f9     	mov	x25, x0
  3a7c1c: 941a232d     	bl	0xa308d0 <_ZN7cocos2d19ScriptEngineManager11getInstanceEv>
  3a7c20: aa1903e1     	mov	x1, x25
  3a7c24: 941a231e     	bl	0xa3089c <_ZN7cocos2d19ScriptEngineManager15setScriptEngineEPNS_20ScriptEngineProtocolE>
  3a7c28: f9400720     	ldr	x0, [x25, #0x8]
  3a7c2c: f9401417     	ldr	x23, [x0, #0x28]
  3a7c30: aa1703e0     	mov	x0, x23
  3a7c34: 9400712a     	bl	0x3c40dc <_Z19lua_module_registerP9lua_State>
  3a7c38: f9400733     	ldr	x19, [x25, #0x8]
  3a7c3c: b00041e1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7c40: b00041e3     	adrp	x3, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7c44: 912c6021     	add	x1, x1, #0xb18
  3a7c48: aa1303e0     	mov	x0, x19
  3a7c4c: 528000e2     	mov	w2, #0x7                // =7
  3a7c50: f9400265     	ldr	x5, [x19]
  3a7c54: 912c8063     	add	x3, x3, #0xb20
  3a7c58: 52800084     	mov	w4, #0x4                // =4
  3a7c5c: f94074a5     	ldr	x5, [x5, #0xe8]
  3a7c60: d63f00a0     	blr	x5
  3a7c64: 940e6cbf     	bl	0x742f60 <_ZN7cocos2d10CCGameMain11getInstanceEv>
  3a7c68: aa1703e1     	mov	x1, x23
  3a7c6c: 940e6ccd     	bl	0x742fa0 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State>
  3a7c70: 94001a1b     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  3a7c74: f9400001     	ldr	x1, [x0]
  3a7c78: 910203ba     	add	x26, x29, #0x80
  3a7c7c: aa1a03e8     	mov	x8, x26
  3a7c80: aa0003fb     	mov	x27, x0
  3a7c84: f9404421     	ldr	x1, [x1, #0x88]
  3a7c88: d63f0020     	blr	x1
  3a7c8c: 910223b7     	add	x23, x29, #0x88
  3a7c90: aa1a03e1     	mov	x1, x26
  3a7c94: aa1703e0     	mov	x0, x23
  3a7c98: 94208b2a     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  3a7c9c: b00041fa     	adrp	x26, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7ca0: aa1703e0     	mov	x0, x23
  3a7ca4: 912ca341     	add	x1, x26, #0xb28
  3a7ca8: d28000a2     	mov	x2, #0x5                // =5
  3a7cac: 94207fd0     	bl	0xbc7bec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x495c4>
  3a7cb0: aa1503e0     	mov	x0, x21
  3a7cb4: 912ca341     	add	x1, x26, #0xb28
  3a7cb8: aa1803e2     	mov	x2, x24
  3a7cbc: 94207cc5     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3a7cc0: aa1b03e0     	mov	x0, x27
  3a7cc4: aa1503e1     	mov	x1, x21
  3a7cc8: 52800022     	mov	w2, #0x1                // =1
  3a7ccc: 94192a83     	bl	0x9f26d8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb>
  3a7cd0: f9404ba1     	ldr	x1, [x29, #0x90]
  3a7cd4: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7cd8: d1006020     	sub	x0, x1, #0x18
  3a7cdc: eb02001f     	cmp	x0, x2
  3a7ce0: 54001281     	b.ne	0x3a7f30 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x484>
  3a7ce4: 910263b7     	add	x23, x29, #0x98
  3a7ce8: f94047a1     	ldr	x1, [x29, #0x88]
  3a7cec: aa1703e0     	mov	x0, x23
  3a7cf0: aa1803e2     	mov	x2, x24
  3a7cf4: 94207cb7     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3a7cf8: aa1b03e0     	mov	x0, x27
  3a7cfc: aa1703e1     	mov	x1, x23
  3a7d00: 52800022     	mov	w2, #0x1                // =1
  3a7d04: 94192a75     	bl	0x9f26d8 <_ZN7cocos2d9FileUtils13addSearchPathERKSsb>
  3a7d08: f9404fa1     	ldr	x1, [x29, #0x98]
  3a7d0c: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7d10: d1006020     	sub	x0, x1, #0x18
  3a7d14: eb02001f     	cmp	x0, x2
  3a7d18: 54001281     	b.ne	0x3a7f68 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x4bc>
  3a7d1c: f9400262     	ldr	x2, [x19]
  3a7d20: aa1303e0     	mov	x0, x19
  3a7d24: f94047a1     	ldr	x1, [x29, #0x88]
  3a7d28: f9400842     	ldr	x2, [x2, #0x10]
  3a7d2c: d63f0040     	blr	x2
  3a7d30: f9400262     	ldr	x2, [x19]
  3a7d34: aa1303e0     	mov	x0, x19
  3a7d38: 912ca341     	add	x1, x26, #0xb28
  3a7d3c: f9400842     	ldr	x2, [x2, #0x10]
  3a7d40: d63f0040     	blr	x2
  3a7d44: f9400322     	ldr	x2, [x25]
  3a7d48: b00041e1     	adrp	x1, 0xbe4000 <_Unwind_Backtrace+0xf08>
  3a7d4c: aa1903e0     	mov	x0, x25
  3a7d50: 912cc021     	add	x1, x1, #0xb30
  3a7d54: f9403442     	ldr	x2, [x2, #0x68]
  3a7d58: d63f0040     	blr	x2
  3a7d5c: f94047a1     	ldr	x1, [x29, #0x88]
  3a7d60: 6b1f001f     	cmp	w0, wzr
  3a7d64: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7d68: 1a9f17f8     	cset	w24, eq
  3a7d6c: d1006020     	sub	x0, x1, #0x18
  3a7d70: eb02001f     	cmp	x0, x2
  3a7d74: 54000a81     	b.ne	0x3a7ec4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x418>
  3a7d78: f94043a1     	ldr	x1, [x29, #0x80]
  3a7d7c: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7d80: d1006020     	sub	x0, x1, #0x18
  3a7d84: eb02001f     	cmp	x0, x2
  3a7d88: 540006a1     	b.ne	0x3a7e5c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3b0>
  3a7d8c: f94053b3     	ldr	x19, [x29, #0xa0]
  3a7d90: f94057b5     	ldr	x21, [x29, #0xa8]
  3a7d94: eb15027f     	cmp	x19, x21
  3a7d98: 54000340     	b.eq	0x3a7e00 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x354>
  3a7d9c: b0005cf9     	adrp	x25, 0xf44000
  3a7da0: 14000004     	b	0x3a7db0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x304>
  3a7da4: 91002273     	add	x19, x19, #0x8
  3a7da8: eb1302bf     	cmp	x21, x19
  3a7dac: 54000280     	b.eq	0x3a7dfc <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x350>
  3a7db0: f9400261     	ldr	x1, [x19]
  3a7db4: f947ee82     	ldr	x2, [x20, #0xfd8]
  3a7db8: d1006020     	sub	x0, x1, #0x18
  3a7dbc: eb02001f     	cmp	x0, x2
  3a7dc0: 54ffff20     	b.eq	0x3a7da4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2f8>
  3a7dc4: f9445322     	ldr	x2, [x25, #0x8a0]
  3a7dc8: b40003c2     	cbz	x2, 0x3a7e40 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x394>
  3a7dcc: d1002021     	sub	x1, x1, #0x8
  3a7dd0: 885ffc22     	ldaxr	w2, [x1]
  3a7dd4: 51000443     	sub	w3, w2, #0x1
  3a7dd8: 8804fc23     	stlxr	w4, w3, [x1]
  3a7ddc: 35ffffa4     	cbnz	w4, 0x3a7dd0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x324>
  3a7de0: 6b1f005f     	cmp	w2, wzr
  3a7de4: 54fffe0c     	b.gt	0x3a7da4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2f8>
  3a7de8: aa1703e1     	mov	x1, x23
  3a7dec: 91002273     	add	x19, x19, #0x8
  3a7df0: 94208a73     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7df4: eb1302bf     	cmp	x21, x19
  3a7df8: 54fffdc1     	b.ne	0x3a7db0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x304>
  3a7dfc: f94053b5     	ldr	x21, [x29, #0xa0]
  3a7e00: b4000075     	cbz	x21, 0x3a7e0c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x360>
  3a7e04: aa1503e0     	mov	x0, x21
  3a7e08: 941f5040     	bl	0xb7bf08 <_ZdlPv>
  3a7e0c: f940e6d6     	ldr	x22, [x22, #0x1c8]
  3a7e10: 2a1803e0     	mov	w0, w24
  3a7e14: f9405fa2     	ldr	x2, [x29, #0xb8]
  3a7e18: f94002c1     	ldr	x1, [x22]
  3a7e1c: eb01005f     	cmp	x2, x1
  3a7e20: 54001421     	b.ne	0x3a80a4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5f8>
  3a7e24: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3a7e28: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3a7e2c: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3a7e30: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  3a7e34: f9402bfb     	ldr	x27, [sp, #0x50]
  3a7e38: a8cc7bfd     	ldp	x29, x30, [sp], #0xc0
  3a7e3c: d65f03c0     	ret
  3a7e40: b85f8022     	ldur	w2, [x1, #-0x8]
  3a7e44: 51000443     	sub	w3, w2, #0x1
  3a7e48: b81f8023     	stur	w3, [x1, #-0x8]
  3a7e4c: 17ffffe5     	b	0x3a7de0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x334>
  3a7e50: f94037a1     	ldr	x1, [x29, #0x68]
  3a7e54: d0005d14     	adrp	x20, 0xf49000
  3a7e58: 17ffff3b     	b	0x3a7b44 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x98>
  3a7e5c: b0005ce2     	adrp	x2, 0xf44000
  3a7e60: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7e64: b4000d62     	cbz	x2, 0x3a8010 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x564>
  3a7e68: d1002021     	sub	x1, x1, #0x8
  3a7e6c: 885ffc22     	ldaxr	w2, [x1]
  3a7e70: 51000443     	sub	w3, w2, #0x1
  3a7e74: 8804fc23     	stlxr	w4, w3, [x1]
  3a7e78: 35ffffa4     	cbnz	w4, 0x3a7e6c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3c0>
  3a7e7c: 6b1f005f     	cmp	w2, wzr
  3a7e80: 54fff86c     	b.gt	0x3a7d8c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2e0>
  3a7e84: aa1703e1     	mov	x1, x23
  3a7e88: 94208a4d     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7e8c: 17ffffc0     	b	0x3a7d8c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2e0>
  3a7e90: b0005ce2     	adrp	x2, 0xf44000
  3a7e94: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7e98: b4000cc2     	cbz	x2, 0x3a8030 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x584>
  3a7e9c: d1002021     	sub	x1, x1, #0x8
  3a7ea0: 885ffc22     	ldaxr	w2, [x1]
  3a7ea4: 51000443     	sub	w3, w2, #0x1
  3a7ea8: 8804fc23     	stlxr	w4, w3, [x1]
  3a7eac: 35ffffa4     	cbnz	w4, 0x3a7ea0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3f4>
  3a7eb0: 6b1f005f     	cmp	w2, wzr
  3a7eb4: 54ffe80c     	b.gt	0x3a7bb4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x108>
  3a7eb8: 910263a1     	add	x1, x29, #0x98
  3a7ebc: 94208a40     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7ec0: 17ffff3d     	b	0x3a7bb4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x108>
  3a7ec4: b0005ce2     	adrp	x2, 0xf44000
  3a7ec8: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7ecc: b4000aa2     	cbz	x2, 0x3a8020 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x574>
  3a7ed0: d1002021     	sub	x1, x1, #0x8
  3a7ed4: 885ffc22     	ldaxr	w2, [x1]
  3a7ed8: 51000443     	sub	w3, w2, #0x1
  3a7edc: 8804fc23     	stlxr	w4, w3, [x1]
  3a7ee0: 35ffffa4     	cbnz	w4, 0x3a7ed4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x428>
  3a7ee4: 6b1f005f     	cmp	w2, wzr
  3a7ee8: 54fff48c     	b.gt	0x3a7d78 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2cc>
  3a7eec: aa1703e1     	mov	x1, x23
  3a7ef0: 94208a33     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7ef4: 17ffffa1     	b	0x3a7d78 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x2cc>
  3a7ef8: b0005ce2     	adrp	x2, 0xf44000
  3a7efc: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7f00: b4000a82     	cbz	x2, 0x3a8050 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5a4>
  3a7f04: d1002000     	sub	x0, x0, #0x8
  3a7f08: 885ffc02     	ldaxr	w2, [x0]
  3a7f0c: 51000443     	sub	w3, w2, #0x1
  3a7f10: 8804fc03     	stlxr	w4, w3, [x0]
  3a7f14: 35ffffa4     	cbnz	w4, 0x3a7f08 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x45c>
  3a7f18: 6b1f005f     	cmp	w2, wzr
  3a7f1c: 54ffe78c     	b.gt	0x3a7c0c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x160>
  3a7f20: aa0103e0     	mov	x0, x1
  3a7f24: 910263a1     	add	x1, x29, #0x98
  3a7f28: 94208a25     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7f2c: 17ffff38     	b	0x3a7c0c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x160>
  3a7f30: b0005ce2     	adrp	x2, 0xf44000
  3a7f34: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7f38: b4000842     	cbz	x2, 0x3a8040 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x594>
  3a7f3c: d1002021     	sub	x1, x1, #0x8
  3a7f40: 885ffc22     	ldaxr	w2, [x1]
  3a7f44: 51000443     	sub	w3, w2, #0x1
  3a7f48: 8804fc23     	stlxr	w4, w3, [x1]
  3a7f4c: 35ffffa4     	cbnz	w4, 0x3a7f40 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x494>
  3a7f50: 6b1f005f     	cmp	w2, wzr
  3a7f54: 910263b7     	add	x23, x29, #0x98
  3a7f58: 54ffec8c     	b.gt	0x3a7ce8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x23c>
  3a7f5c: aa1703e1     	mov	x1, x23
  3a7f60: 94208a17     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7f64: 17ffff61     	b	0x3a7ce8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x23c>
  3a7f68: b0005ce2     	adrp	x2, 0xf44000
  3a7f6c: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7f70: b4000802     	cbz	x2, 0x3a8070 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5c4>
  3a7f74: d1002021     	sub	x1, x1, #0x8
  3a7f78: 885ffc22     	ldaxr	w2, [x1]
  3a7f7c: 51000443     	sub	w3, w2, #0x1
  3a7f80: 8804fc23     	stlxr	w4, w3, [x1]
  3a7f84: 35ffffa4     	cbnz	w4, 0x3a7f78 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x4cc>
  3a7f88: 6b1f005f     	cmp	w2, wzr
  3a7f8c: 54ffec8c     	b.gt	0x3a7d1c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x270>
  3a7f90: aa1503e1     	mov	x1, x21
  3a7f94: 94208a0a     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7f98: 17ffff61     	b	0x3a7d1c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x270>
  3a7f9c: b0005ce2     	adrp	x2, 0xf44000
  3a7fa0: f9445042     	ldr	x2, [x2, #0x8a0]
  3a7fa4: b40005e2     	cbz	x2, 0x3a8060 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5b4>
  3a7fa8: d1002021     	sub	x1, x1, #0x8
  3a7fac: 885ffc22     	ldaxr	w2, [x1]
  3a7fb0: 51000443     	sub	w3, w2, #0x1
  3a7fb4: 8804fc23     	stlxr	w4, w3, [x1]
  3a7fb8: 35ffffa4     	cbnz	w4, 0x3a7fac <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x500>
  3a7fbc: 6b1f005f     	cmp	w2, wzr
  3a7fc0: 54ffdcec     	b.gt	0x3a7b5c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0xb0>
  3a7fc4: 910263a1     	add	x1, x29, #0x98
  3a7fc8: 942089fd     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3a7fcc: 17fffee4     	b	0x3a7b5c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0xb0>
  3a7fd0: aa1303e0     	mov	x0, x19
  3a7fd4: aa1803e1     	mov	x1, x24
  3a7fd8: 97fffe3c     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  3a7fdc: f9403fa0     	ldr	x0, [x29, #0x78]
  3a7fe0: 17ffff07     	b	0x3a7bfc <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x150>
  3a7fe4: aa1303e0     	mov	x0, x19
  3a7fe8: aa1403e1     	mov	x1, x20
  3a7fec: 97fffe37     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  3a7ff0: f94037a1     	ldr	x1, [x29, #0x68]
  3a7ff4: d0005d14     	adrp	x20, 0xf49000
  3a7ff8: 17fffed5     	b	0x3a7b4c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0xa0>
  3a7ffc: aa1303e0     	mov	x0, x19
  3a8000: aa1703e1     	mov	x1, x23
  3a8004: 97fffe31     	bl	0x3a78c8 <_ZNSt6vectorISsSaISsEE19_M_emplace_back_auxIJSsEEEvDpOT_>
  3a8008: f9403ba1     	ldr	x1, [x29, #0x70]
  3a800c: 17fffee6     	b	0x3a7ba4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0xf8>
  3a8010: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8014: 51000443     	sub	w3, w2, #0x1
  3a8018: b81f8023     	stur	w3, [x1, #-0x8]
  3a801c: 17ffff98     	b	0x3a7e7c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x3d0>
  3a8020: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8024: 51000443     	sub	w3, w2, #0x1
  3a8028: b81f8023     	stur	w3, [x1, #-0x8]
  3a802c: 17ffffae     	b	0x3a7ee4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x438>
  3a8030: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8034: 51000443     	sub	w3, w2, #0x1
  3a8038: b81f8023     	stur	w3, [x1, #-0x8]
  3a803c: 17ffff9d     	b	0x3a7eb0 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x404>
  3a8040: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8044: 51000443     	sub	w3, w2, #0x1
  3a8048: b81f8023     	stur	w3, [x1, #-0x8]
  3a804c: 17ffffc1     	b	0x3a7f50 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x4a4>
  3a8050: b85f8002     	ldur	w2, [x0, #-0x8]
  3a8054: 51000443     	sub	w3, w2, #0x1
  3a8058: b81f8003     	stur	w3, [x0, #-0x8]
  3a805c: 17ffffaf     	b	0x3a7f18 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x46c>
  3a8060: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8064: 51000443     	sub	w3, w2, #0x1
  3a8068: b81f8023     	stur	w3, [x1, #-0x8]
  3a806c: 17ffffd4     	b	0x3a7fbc <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x510>
  3a8070: b85f8022     	ldur	w2, [x1, #-0x8]
  3a8074: 51000443     	sub	w3, w2, #0x1
  3a8078: b81f8023     	stur	w3, [x1, #-0x8]
  3a807c: 17ffffc3     	b	0x3a7f88 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x4dc>
  3a8080: aa0003f3     	mov	x19, x0
  3a8084: f94053a0     	ldr	x0, [x29, #0xa0]
  3a8088: f94057a1     	ldr	x1, [x29, #0xa8]
  3a808c: 97ffd0b1     	bl	0x39c350 <.text+0x40>
  3a8090: f94053a0     	ldr	x0, [x29, #0xa0]
  3a8094: b4000040     	cbz	x0, 0x3a809c <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5f0>
  3a8098: 941f4f9c     	bl	0xb7bf08 <_ZdlPv>
  3a809c: aa1303e0     	mov	x0, x19
  3a80a0: 9420eb90     	bl	0xbe2ee0 <_Unwind_Resume>
  3a80a4: 97ffccbf     	bl	0x39b3a0 <__stack_chk_fail@plt>
  3a80a8: aa0003f3     	mov	x19, x0
  3a80ac: f9404ba0     	ldr	x0, [x29, #0x90]
  3a80b0: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a80b4: d1006000     	sub	x0, x0, #0x18
  3a80b8: eb01001f     	cmp	x0, x1
  3a80bc: 54000060     	b.eq	0x3a80c8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x61c>
  3a80c0: 910263a1     	add	x1, x29, #0x98
  3a80c4: 97ffd093     	bl	0x39c310 <.text>
  3a80c8: f94047a0     	ldr	x0, [x29, #0x88]
  3a80cc: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a80d0: d1006000     	sub	x0, x0, #0x18
  3a80d4: eb01001f     	cmp	x0, x1
  3a80d8: 54000060     	b.eq	0x3a80e4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x638>
  3a80dc: aa1803e1     	mov	x1, x24
  3a80e0: 97ffd08c     	bl	0x39c310 <.text>
  3a80e4: f94043a0     	ldr	x0, [x29, #0x80]
  3a80e8: f947ee94     	ldr	x20, [x20, #0xfd8]
  3a80ec: d1006000     	sub	x0, x0, #0x18
  3a80f0: eb14001f     	cmp	x0, x20
  3a80f4: 54fffc80     	b.eq	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a80f8: aa1803e1     	mov	x1, x24
  3a80fc: 97ffd085     	bl	0x39c310 <.text>
  3a8100: 17ffffe1     	b	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a8104: aa0003f3     	mov	x19, x0
  3a8108: 17fffff7     	b	0x3a80e4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x638>
  3a810c: aa0003f3     	mov	x19, x0
  3a8110: 17ffffee     	b	0x3a80c8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x61c>
  3a8114: aa0003f3     	mov	x19, x0
  3a8118: f94047a0     	ldr	x0, [x29, #0x88]
  3a811c: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a8120: d1006000     	sub	x0, x0, #0x18
  3a8124: eb01001f     	cmp	x0, x1
  3a8128: 54fffde0     	b.eq	0x3a80e4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x638>
  3a812c: 910263a1     	add	x1, x29, #0x98
  3a8130: 97ffd078     	bl	0x39c310 <.text>
  3a8134: 17ffffec     	b	0x3a80e4 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x638>
  3a8138: aa0003f3     	mov	x19, x0
  3a813c: f9404fa0     	ldr	x0, [x29, #0x98]
  3a8140: f947ee81     	ldr	x1, [x20, #0xfd8]
  3a8144: d1006000     	sub	x0, x0, #0x18
  3a8148: eb01001f     	cmp	x0, x1
  3a814c: 54fffbe0     	b.eq	0x3a80c8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x61c>
  3a8150: aa1503e1     	mov	x1, x21
  3a8154: 97ffd06f     	bl	0x39c310 <.text>
  3a8158: 17ffffdc     	b	0x3a80c8 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x61c>
  3a815c: f9403ba1     	ldr	x1, [x29, #0x70]
  3a8160: aa0003f3     	mov	x19, x0
  3a8164: f947ee94     	ldr	x20, [x20, #0xfd8]
  3a8168: d1006020     	sub	x0, x1, #0x18
  3a816c: eb14001f     	cmp	x0, x20
  3a8170: 54fff8a0     	b.eq	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a8174: 910263a1     	add	x1, x29, #0x98
  3a8178: 97ffd066     	bl	0x39c310 <.text>
  3a817c: 17ffffc2     	b	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a8180: b0005d01     	adrp	x1, 0xf49000
  3a8184: aa0003f3     	mov	x19, x0
  3a8188: f94037a0     	ldr	x0, [x29, #0x68]
  3a818c: f947ec21     	ldr	x1, [x1, #0xfd8]
  3a8190: d1006000     	sub	x0, x0, #0x18
  3a8194: eb01001f     	cmp	x0, x1
  3a8198: 54fff760     	b.eq	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a819c: 17fffff6     	b	0x3a8174 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x6c8>
  3a81a0: f9403fa1     	ldr	x1, [x29, #0x78]
  3a81a4: aa0003f3     	mov	x19, x0
  3a81a8: f947ee94     	ldr	x20, [x20, #0xfd8]
  3a81ac: d1006020     	sub	x0, x1, #0x18
  3a81b0: eb14001f     	cmp	x0, x20
  3a81b4: 54fff680     	b.eq	0x3a8084 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x5d8>
  3a81b8: 17ffffef     	b	0x3a8174 <_ZN11AppDelegate29applicationDidFinishLaunchingEv+0x6c8>
