
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000003b7b98 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc>:
  3b7b98: a9b57bfd     	stp	x29, x30, [sp, #-0xb0]!
  3b7b9c: 910003fd     	mov	x29, sp
  3b7ba0: a90363f7     	stp	x23, x24, [sp, #0x30]
  3b7ba4: b0005c58     	adrp	x24, 0xf40000
  3b7ba8: f9002bfb     	str	x27, [sp, #0x50]
  3b7bac: a9025bf5     	stp	x21, x22, [sp, #0x20]
  3b7bb0: 9101a3b5     	add	x21, x29, #0x68
  3b7bb4: 910263b6     	add	x22, x29, #0x98
  3b7bb8: f940e703     	ldr	x3, [x24, #0x1c8]
  3b7bbc: aa1603e2     	mov	x2, x22
  3b7bc0: a9046bf9     	stp	x25, x26, [sp, #0x40]
  3b7bc4: b0005d79     	adrp	x25, 0xf64000 <VP8GetCPUInfo+0x30>
  3b7bc8: aa0003fa     	mov	x26, x0
  3b7bcc: f9400063     	ldr	x3, [x3]
  3b7bd0: aa1503e0     	mov	x0, x21
  3b7bd4: a90153f3     	stp	x19, x20, [sp, #0x10]
  3b7bd8: f90057a3     	str	x3, [x29, #0xa8]
  3b7bdc: 910e4334     	add	x20, x25, #0x390
  3b7be0: 94203cfc     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  3b7be4: f941cb21     	ldr	x1, [x25, #0x390]
  3b7be8: aa1503e0     	mov	x0, x21
  3b7bec: 92800002     	mov	x2, #-0x1               // =-1
  3b7bf0: f85e8023     	ldur	x3, [x1, #-0x18]
  3b7bf4: 942041e0     	bl	0xbc8374 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49d4c>
  3b7bf8: b100041f     	cmn	x0, #0x1
  3b7bfc: aa0003e3     	mov	x3, x0
  3b7c00: 54000ee0     	b.eq	0x3b7ddc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x244>
  3b7c04: 9101c3b4     	add	x20, x29, #0x70
  3b7c08: aa1503e1     	mov	x1, x21
  3b7c0c: aa1403e0     	mov	x0, x20
  3b7c10: d2800002     	mov	x2, #0x0                // =0
  3b7c14: d0005c93     	adrp	x19, 0xf49000
  3b7c18: 94203be1     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  3b7c1c: aa1503e0     	mov	x0, x21
  3b7c20: aa1403e1     	mov	x1, x20
  3b7c24: 942040f2     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  3b7c28: f9403ba1     	ldr	x1, [x29, #0x70]
  3b7c2c: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7c30: d1006020     	sub	x0, x1, #0x18
  3b7c34: eb02001f     	cmp	x0, x2
  3b7c38: 54001541     	b.ne	0x3b7ee0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x348>
  3b7c3c: 97ffda28     	bl	0x3ae4dc <_ZN7cocos2d9FileUtils11getInstanceEv>
  3b7c40: 910203b7     	add	x23, x29, #0x80
  3b7c44: aa0003f4     	mov	x20, x0
  3b7c48: aa1503e1     	mov	x1, x21
  3b7c4c: aa1703e0     	mov	x0, x23
  3b7c50: 94204b3c     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  3b7c54: 910e4321     	add	x1, x25, #0x390
  3b7c58: aa1703e0     	mov	x0, x23
  3b7c5c: 91002021     	add	x1, x1, #0x8
  3b7c60: 94203f73     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  3b7c64: f9400282     	ldr	x2, [x20]
  3b7c68: aa1403e0     	mov	x0, x20
  3b7c6c: aa1703e1     	mov	x1, x23
  3b7c70: f9407842     	ldr	x2, [x2, #0xf0]
  3b7c74: d63f0040     	blr	x2
  3b7c78: 53001c00     	uxtb	w0, w0
  3b7c7c: 35000a80     	cbnz	w0, 0x3b7dcc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x234>
  3b7c80: 910223bb     	add	x27, x29, #0x88
  3b7c84: aa1503e1     	mov	x1, x21
  3b7c88: aa1b03e0     	mov	x0, x27
  3b7c8c: 94204b2d     	bl	0xbca940 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c318>
  3b7c90: aa1b03e0     	mov	x0, x27
  3b7c94: 910e4321     	add	x1, x25, #0x390
  3b7c98: 94203f65     	bl	0xbc7a2c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49404>
  3b7c9c: aa1703e0     	mov	x0, x23
  3b7ca0: aa1b03e1     	mov	x1, x27
  3b7ca4: 942040d2     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  3b7ca8: f94047a1     	ldr	x1, [x29, #0x88]
  3b7cac: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7cb0: d1006020     	sub	x0, x1, #0x18
  3b7cb4: eb02001f     	cmp	x0, x2
  3b7cb8: 54001261     	b.ne	0x3b7f04 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x36c>
  3b7cbc: f9400282     	ldr	x2, [x20]
  3b7cc0: aa1403e0     	mov	x0, x20
  3b7cc4: aa1703e1     	mov	x1, x23
  3b7cc8: f9407842     	ldr	x2, [x2, #0xf0]
  3b7ccc: d63f0040     	blr	x2
  3b7cd0: 53001c00     	uxtb	w0, w0
  3b7cd4: 350007c0     	cbnz	w0, 0x3b7dcc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x234>
  3b7cd8: f9400282     	ldr	x2, [x20]
  3b7cdc: 910243b7     	add	x23, x29, #0x90
  3b7ce0: aa1703e8     	mov	x8, x23
  3b7ce4: aa1403e0     	mov	x0, x20
  3b7ce8: aa1503e1     	mov	x1, x21
  3b7cec: f9402042     	ldr	x2, [x2, #0x40]
  3b7cf0: d63f0040     	blr	x2
  3b7cf4: f9400282     	ldr	x2, [x20]
  3b7cf8: aa1603e8     	mov	x8, x22
  3b7cfc: aa1403e0     	mov	x0, x20
  3b7d00: aa1703e1     	mov	x1, x23
  3b7d04: f9401042     	ldr	x2, [x2, #0x20]
  3b7d08: d63f0040     	blr	x2
  3b7d0c: aa1603e0     	mov	x0, x22
  3b7d10: 9419728a     	bl	0xa14738 <_ZNK7cocos2d4Data6isNullEv>
  3b7d14: 53001c00     	uxtb	w0, w0
  3b7d18: 350001c0     	cbnz	w0, 0x3b7d50 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1b8>
  3b7d1c: aa1603e0     	mov	x0, x22
  3b7d20: f9401755     	ldr	x21, [x26, #0x28]
  3b7d24: 9419728d     	bl	0xa14758 <_ZNK7cocos2d4Data8getBytesEv>
  3b7d28: aa0003f4     	mov	x20, x0
  3b7d2c: aa1603e0     	mov	x0, x22
  3b7d30: 9419728c     	bl	0xa14760 <_ZNK7cocos2d4Data7getSizeEv>
  3b7d34: f9404ba4     	ldr	x4, [x29, #0x90]
  3b7d38: aa0003e3     	mov	x3, x0
  3b7d3c: aa1503e1     	mov	x1, x21
  3b7d40: aa1a03e0     	mov	x0, x26
  3b7d44: aa1403e2     	mov	x2, x20
  3b7d48: 97ffff63     	bl	0x3b7ad4 <_ZN7cocos2d8LuaStack13luaLoadBufferEP9lua_StatePKciS4_>
  3b7d4c: 34000960     	cbz	w0, 0x3b7e78 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x2e0>
  3b7d50: aa1603e0     	mov	x0, x22
  3b7d54: 52800014     	mov	w20, #0x0               // =0
  3b7d58: 94197292     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  3b7d5c: f9404ba1     	ldr	x1, [x29, #0x90]
  3b7d60: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7d64: d1006020     	sub	x0, x1, #0x18
  3b7d68: eb02001f     	cmp	x0, x2
  3b7d6c: 54000a01     	b.ne	0x3b7eac <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x314>
  3b7d70: f94043a1     	ldr	x1, [x29, #0x80]
  3b7d74: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7d78: d1006020     	sub	x0, x1, #0x18
  3b7d7c: eb02001f     	cmp	x0, x2
  3b7d80: 54000f61     	b.ne	0x3b7f6c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3d4>
  3b7d84: f94037a1     	ldr	x1, [x29, #0x68]
  3b7d88: f947ee73     	ldr	x19, [x19, #0xfd8]
  3b7d8c: d1006020     	sub	x0, x1, #0x18
  3b7d90: eb13001f     	cmp	x0, x19
  3b7d94: 54000d21     	b.ne	0x3b7f38 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3a0>
  3b7d98: f940e718     	ldr	x24, [x24, #0x1c8]
  3b7d9c: 2a1403e0     	mov	w0, w20
  3b7da0: f94057a2     	ldr	x2, [x29, #0xa8]
  3b7da4: f9400301     	ldr	x1, [x24]
  3b7da8: eb01005f     	cmp	x2, x1
  3b7dac: 54001221     	b.ne	0x3b7ff0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x458>
  3b7db0: a94153f3     	ldp	x19, x20, [sp, #0x10]
  3b7db4: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  3b7db8: a94363f7     	ldp	x23, x24, [sp, #0x30]
  3b7dbc: a9446bf9     	ldp	x25, x26, [sp, #0x40]
  3b7dc0: f9402bfb     	ldr	x27, [sp, #0x50]
  3b7dc4: a8cb7bfd     	ldp	x29, x30, [sp], #0xb0
  3b7dc8: d65f03c0     	ret
  3b7dcc: aa1503e0     	mov	x0, x21
  3b7dd0: aa1703e1     	mov	x1, x23
  3b7dd4: 94204b3b     	bl	0xbcaac0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c498>
  3b7dd8: 17ffffc0     	b	0x3b7cd8 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x140>
  3b7ddc: f9400681     	ldr	x1, [x20, #0x8]
  3b7de0: aa0303e2     	mov	x2, x3
  3b7de4: aa1503e0     	mov	x0, x21
  3b7de8: d0005c93     	adrp	x19, 0xf49000
  3b7dec: f85e8023     	ldur	x3, [x1, #-0x18]
  3b7df0: 94204161     	bl	0xbc8374 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x49d4c>
  3b7df4: f9400682     	ldr	x2, [x20, #0x8]
  3b7df8: f94037a1     	ldr	x1, [x29, #0x68]
  3b7dfc: f85e8043     	ldur	x3, [x2, #-0x18]
  3b7e00: f85e8021     	ldur	x1, [x1, #-0x18]
  3b7e04: cb030023     	sub	x3, x1, x3
  3b7e08: eb00007f     	cmp	x3, x0
  3b7e0c: 54fff181     	b.ne	0x3b7c3c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0xa4>
  3b7e10: 9101e3b4     	add	x20, x29, #0x78
  3b7e14: aa1503e1     	mov	x1, x21
  3b7e18: aa1403e0     	mov	x0, x20
  3b7e1c: d2800002     	mov	x2, #0x0                // =0
  3b7e20: 94203b5f     	bl	0xbc6b9c <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x48574>
  3b7e24: aa1503e0     	mov	x0, x21
  3b7e28: aa1403e1     	mov	x1, x20
  3b7e2c: 94204070     	bl	0xbc7fec <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x499c4>
  3b7e30: f9403fa1     	ldr	x1, [x29, #0x78]
  3b7e34: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7e38: d1006020     	sub	x0, x1, #0x18
  3b7e3c: eb02001f     	cmp	x0, x2
  3b7e40: 54ffefe0     	b.eq	0x3b7c3c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0xa4>
  3b7e44: b0005c62     	adrp	x2, 0xf44000
  3b7e48: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7e4c: b4000ca2     	cbz	x2, 0x3b7fe0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x448>
  3b7e50: d1002021     	sub	x1, x1, #0x8
  3b7e54: 885ffc22     	ldaxr	w2, [x1]
  3b7e58: 51000443     	sub	w3, w2, #0x1
  3b7e5c: 8804fc23     	stlxr	w4, w3, [x1]
  3b7e60: 35ffffa4     	cbnz	w4, 0x3b7e54 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x2bc>
  3b7e64: 6b1f005f     	cmp	w2, wzr
  3b7e68: 54ffeeac     	b.gt	0x3b7c3c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0xa4>
  3b7e6c: aa1603e1     	mov	x1, x22
  3b7e70: 94204a53     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3b7e74: 17ffff72     	b	0x3b7c3c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0xa4>
  3b7e78: f9400342     	ldr	x2, [x26]
  3b7e7c: aa1a03e0     	mov	x0, x26
  3b7e80: 52800001     	mov	w1, #0x0                // =0
  3b7e84: f9406042     	ldr	x2, [x2, #0xc0]
  3b7e88: d63f0040     	blr	x2
  3b7e8c: 2a0003f4     	mov	w20, w0
  3b7e90: aa1603e0     	mov	x0, x22
  3b7e94: 94197243     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  3b7e98: f9404ba1     	ldr	x1, [x29, #0x90]
  3b7e9c: f947ee62     	ldr	x2, [x19, #0xfd8]
  3b7ea0: d1006020     	sub	x0, x1, #0x18
  3b7ea4: eb02001f     	cmp	x0, x2
  3b7ea8: 54fff640     	b.eq	0x3b7d70 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1d8>
  3b7eac: b0005c62     	adrp	x2, 0xf44000
  3b7eb0: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7eb4: b4000862     	cbz	x2, 0x3b7fc0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x428>
  3b7eb8: d1002021     	sub	x1, x1, #0x8
  3b7ebc: 885ffc22     	ldaxr	w2, [x1]
  3b7ec0: 51000443     	sub	w3, w2, #0x1
  3b7ec4: 8804fc23     	stlxr	w4, w3, [x1]
  3b7ec8: 35ffffa4     	cbnz	w4, 0x3b7ebc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x324>
  3b7ecc: 6b1f005f     	cmp	w2, wzr
  3b7ed0: 54fff50c     	b.gt	0x3b7d70 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1d8>
  3b7ed4: 910223a1     	add	x1, x29, #0x88
  3b7ed8: 94204a39     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3b7edc: 17ffffa5     	b	0x3b7d70 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1d8>
  3b7ee0: b0005c62     	adrp	x2, 0xf44000
  3b7ee4: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7ee8: b40007c2     	cbz	x2, 0x3b7fe0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x448>
  3b7eec: d1002021     	sub	x1, x1, #0x8
  3b7ef0: 885ffc22     	ldaxr	w2, [x1]
  3b7ef4: 51000443     	sub	w3, w2, #0x1
  3b7ef8: 8804fc23     	stlxr	w4, w3, [x1]
  3b7efc: 34fffb44     	cbz	w4, 0x3b7e64 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x2cc>
  3b7f00: 17fffffc     	b	0x3b7ef0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x358>
  3b7f04: b0005c62     	adrp	x2, 0xf44000
  3b7f08: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7f0c: b40004a2     	cbz	x2, 0x3b7fa0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x408>
  3b7f10: d1002021     	sub	x1, x1, #0x8
  3b7f14: 885ffc22     	ldaxr	w2, [x1]
  3b7f18: 51000443     	sub	w3, w2, #0x1
  3b7f1c: 8804fc23     	stlxr	w4, w3, [x1]
  3b7f20: 35ffffa4     	cbnz	w4, 0x3b7f14 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x37c>
  3b7f24: 6b1f005f     	cmp	w2, wzr
  3b7f28: 54ffecac     	b.gt	0x3b7cbc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x124>
  3b7f2c: aa1603e1     	mov	x1, x22
  3b7f30: 94204a23     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3b7f34: 17ffff62     	b	0x3b7cbc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x124>
  3b7f38: b0005c62     	adrp	x2, 0xf44000
  3b7f3c: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7f40: b4000482     	cbz	x2, 0x3b7fd0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x438>
  3b7f44: d1002021     	sub	x1, x1, #0x8
  3b7f48: 885ffc22     	ldaxr	w2, [x1]
  3b7f4c: 51000443     	sub	w3, w2, #0x1
  3b7f50: 8804fc23     	stlxr	w4, w3, [x1]
  3b7f54: 35ffffa4     	cbnz	w4, 0x3b7f48 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3b0>
  3b7f58: 6b1f005f     	cmp	w2, wzr
  3b7f5c: 54fff1ec     	b.gt	0x3b7d98 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x200>
  3b7f60: aa1703e1     	mov	x1, x23
  3b7f64: 94204a16     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3b7f68: 17ffff8c     	b	0x3b7d98 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x200>
  3b7f6c: b0005c62     	adrp	x2, 0xf44000
  3b7f70: f9445042     	ldr	x2, [x2, #0x8a0]
  3b7f74: b40001e2     	cbz	x2, 0x3b7fb0 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x418>
  3b7f78: d1002021     	sub	x1, x1, #0x8
  3b7f7c: 885ffc22     	ldaxr	w2, [x1]
  3b7f80: 51000443     	sub	w3, w2, #0x1
  3b7f84: 8804fc23     	stlxr	w4, w3, [x1]
  3b7f88: 35ffffa4     	cbnz	w4, 0x3b7f7c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3e4>
  3b7f8c: 6b1f005f     	cmp	w2, wzr
  3b7f90: 54ffefac     	b.gt	0x3b7d84 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1ec>
  3b7f94: aa1703e1     	mov	x1, x23
  3b7f98: 94204a09     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  3b7f9c: 17ffff7a     	b	0x3b7d84 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x1ec>
  3b7fa0: b85f8022     	ldur	w2, [x1, #-0x8]
  3b7fa4: 51000443     	sub	w3, w2, #0x1
  3b7fa8: b81f8023     	stur	w3, [x1, #-0x8]
  3b7fac: 17ffffde     	b	0x3b7f24 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x38c>
  3b7fb0: b85f8022     	ldur	w2, [x1, #-0x8]
  3b7fb4: 51000443     	sub	w3, w2, #0x1
  3b7fb8: b81f8023     	stur	w3, [x1, #-0x8]
  3b7fbc: 17fffff4     	b	0x3b7f8c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3f4>
  3b7fc0: b85f8022     	ldur	w2, [x1, #-0x8]
  3b7fc4: 51000443     	sub	w3, w2, #0x1
  3b7fc8: b81f8023     	stur	w3, [x1, #-0x8]
  3b7fcc: 17ffffc0     	b	0x3b7ecc <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x334>
  3b7fd0: b85f8022     	ldur	w2, [x1, #-0x8]
  3b7fd4: 51000443     	sub	w3, w2, #0x1
  3b7fd8: b81f8023     	stur	w3, [x1, #-0x8]
  3b7fdc: 17ffffdf     	b	0x3b7f58 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x3c0>
  3b7fe0: b85f8022     	ldur	w2, [x1, #-0x8]
  3b7fe4: 51000443     	sub	w3, w2, #0x1
  3b7fe8: b81f8023     	stur	w3, [x1, #-0x8]
  3b7fec: 17ffff9e     	b	0x3b7e64 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x2cc>
  3b7ff0: 97ff8cec     	bl	0x39b3a0 <__stack_chk_fail@plt>
  3b7ff4: d0005c93     	adrp	x19, 0xf49000
  3b7ff8: aa0003f4     	mov	x20, x0
  3b7ffc: f9403ba0     	ldr	x0, [x29, #0x70]
  3b8000: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b8004: d1006000     	sub	x0, x0, #0x18
  3b8008: eb01001f     	cmp	x0, x1
  3b800c: 54000221     	b.ne	0x3b8050 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4b8>
  3b8010: f94037a0     	ldr	x0, [x29, #0x68]
  3b8014: f947ee73     	ldr	x19, [x19, #0xfd8]
  3b8018: d1006000     	sub	x0, x0, #0x18
  3b801c: eb13001f     	cmp	x0, x19
  3b8020: 54000060     	b.eq	0x3b802c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x494>
  3b8024: 910183a1     	add	x1, x29, #0x60
  3b8028: 97ff90fc     	bl	0x39c418 <.text+0x108>
  3b802c: aa1403e0     	mov	x0, x20
  3b8030: 9420abac     	bl	0xbe2ee0 <_Unwind_Resume>
  3b8034: b0005c93     	adrp	x19, 0xf49000
  3b8038: aa0003f4     	mov	x20, x0
  3b803c: f9403fa0     	ldr	x0, [x29, #0x78]
  3b8040: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b8044: d1006000     	sub	x0, x0, #0x18
  3b8048: eb01001f     	cmp	x0, x1
  3b804c: 54fffe20     	b.eq	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b8050: aa1603e1     	mov	x1, x22
  3b8054: 97ff90f1     	bl	0x39c418 <.text+0x108>
  3b8058: 17ffffee     	b	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b805c: aa0003f4     	mov	x20, x0
  3b8060: f94047a0     	ldr	x0, [x29, #0x88]
  3b8064: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b8068: d1006000     	sub	x0, x0, #0x18
  3b806c: eb01001f     	cmp	x0, x1
  3b8070: 54000060     	b.eq	0x3b807c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4e4>
  3b8074: aa1603e1     	mov	x1, x22
  3b8078: 97ff90e8     	bl	0x39c418 <.text+0x108>
  3b807c: f94043a0     	ldr	x0, [x29, #0x80]
  3b8080: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b8084: d1006000     	sub	x0, x0, #0x18
  3b8088: eb01001f     	cmp	x0, x1
  3b808c: 54fffc20     	b.eq	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b8090: 9101e3a1     	add	x1, x29, #0x78
  3b8094: 97ff90e1     	bl	0x39c418 <.text+0x108>
  3b8098: 17ffffde     	b	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b809c: aa0003f4     	mov	x20, x0
  3b80a0: 17fffff7     	b	0x3b807c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4e4>
  3b80a4: aa0003f4     	mov	x20, x0
  3b80a8: f94043a0     	ldr	x0, [x29, #0x80]
  3b80ac: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b80b0: d1006000     	sub	x0, x0, #0x18
  3b80b4: eb01001f     	cmp	x0, x1
  3b80b8: 54fffac0     	b.eq	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b80bc: 17ffffe5     	b	0x3b8050 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4b8>
  3b80c0: aa0003f4     	mov	x20, x0
  3b80c4: f9404ba0     	ldr	x0, [x29, #0x90]
  3b80c8: f947ee61     	ldr	x1, [x19, #0xfd8]
  3b80cc: d1006000     	sub	x0, x0, #0x18
  3b80d0: eb01001f     	cmp	x0, x1
  3b80d4: 54fffd40     	b.eq	0x3b807c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4e4>
  3b80d8: 910223a1     	add	x1, x29, #0x88
  3b80dc: 97ff90cf     	bl	0x39c418 <.text+0x108>
  3b80e0: 17ffffe7     	b	0x3b807c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4e4>
  3b80e4: aa0003f4     	mov	x20, x0
  3b80e8: 17ffffca     	b	0x3b8010 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x478>
  3b80ec: aa0003f4     	mov	x20, x0
  3b80f0: aa1603e0     	mov	x0, x22
  3b80f4: 941971ab     	bl	0xa147a0 <_ZN7cocos2d4DataD2Ev>
  3b80f8: 17fffff3     	b	0x3b80c4 <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x52c>
  3b80fc: 17ffffd8     	b	0x3b805c <_ZN7cocos2d8LuaStack17executeScriptFileEPKc+0x4c4>
