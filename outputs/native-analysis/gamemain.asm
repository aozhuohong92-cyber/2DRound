
outputs/apk-extracted/lib/arm64-v8a/libcocos2dlua.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000742fa0 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State>:
  742fa0: a9b67bfd     	stp	x29, x30, [sp, #-0xa0]!
  742fa4: aa0103e0     	mov	x0, x1
  742fa8: 910003fd     	mov	x29, sp
  742fac: a90153f3     	stp	x19, x20, [sp, #0x10]
  742fb0: d0003ff4     	adrp	x20, 0xf40000
  742fb4: aa0103f3     	mov	x19, x1
  742fb8: a9025bf5     	stp	x21, x22, [sp, #0x20]
  742fbc: f9001bf7     	str	x23, [sp, #0x30]
  742fc0: f940e681     	ldr	x1, [x20, #0x1c8]
  742fc4: f9400021     	ldr	x1, [x1]
  742fc8: f9004fa1     	str	x1, [x29, #0x98]
  742fcc: 940029ae     	bl	0x74d684 <_Z30register_all_cocos2dx_gamecoreP9lua_State>
  742fd0: d0003fc1     	adrp	x1, 0xf3c000
  742fd4: aa1303e0     	mov	x0, x19
  742fd8: 52800002     	mov	w2, #0x0                // =0
  742fdc: f9476821     	ldr	x1, [x1, #0xed0]
  742fe0: 97fd4149     	bl	0x693504 <lua_pushcclosure>
  742fe4: d00028c2     	adrp	x2, 0xc5c000 <_ZTSSt5_BindIFSt7_Mem_fnIM17ListenerComponentFvRKSt6vectorIPN7cocos2d5TouchESaIS5_EEPNS3_5EventEEEPS1_St12_PlaceholderILi1EESG_ILi2EEEE>
  742fe8: aa1303e0     	mov	x0, x19
  742fec: 1284e221     	mov	w1, #-0x2712            // =-10002
  742ff0: 913e8042     	add	x2, x2, #0xfa0
  742ff4: 97fd464b     	bl	0x694920 <lua_setfield>
  742ff8: f90037bf     	str	xzr, [x29, #0x68]
  742ffc: d2800020     	mov	x0, #0x1                // =1
  743000: 9410ea82     	bl	0xb7da08 <_Znwm>
  743004: f9002fa0     	str	x0, [x29, #0x58]
  743008: f0ffffe0     	adrp	x0, 0x742000 <_ZN13CocosDenshion7android17AndroidJavaEngine19stopBackgroundMusicEb+0x260>
  74300c: 91302000     	add	x0, x0, #0xc08
  743010: f9003ba0     	str	x0, [x29, #0x70]
  743014: f0ffffe0     	adrp	x0, 0x742000 <_ZN13CocosDenshion7android17AndroidJavaEngine19stopBackgroundMusicEb+0x260>
  743018: 910163b5     	add	x21, x29, #0x58
  74301c: 912dc000     	add	x0, x0, #0xb70
  743020: f90037a0     	str	x0, [x29, #0x68]
  743024: 940007bb     	bl	0x744f10 <_ZN7cocos2d9LuaHelper11getInstanceEv>
  743028: f94037a3     	ldr	x3, [x29, #0x68]
  74302c: aa0003f6     	mov	x22, x0
  743030: f90047bf     	str	xzr, [x29, #0x88]
  743034: 9101e3b3     	add	x19, x29, #0x78
  743038: 910163b5     	add	x21, x29, #0x58
  74303c: b4000123     	cbz	x3, 0x743060 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0xc0>
  743040: aa1303e0     	mov	x0, x19
  743044: aa1503e1     	mov	x1, x21
  743048: 52800042     	mov	w2, #0x2                // =2
  74304c: d63f0060     	blr	x3
  743050: f9403ba0     	ldr	x0, [x29, #0x70]
  743054: f9004ba0     	str	x0, [x29, #0x90]
  743058: f94037a0     	ldr	x0, [x29, #0x68]
  74305c: f90047a0     	str	x0, [x29, #0x88]
  743060: aa1603e0     	mov	x0, x22
  743064: aa1303e1     	mov	x1, x19
  743068: 94000596     	bl	0x7446c0 <_ZN7cocos2d9LuaHelper4initESt8functionIFvSsiSsEE>
  74306c: f94047a3     	ldr	x3, [x29, #0x88]
  743070: b40000a3     	cbz	x3, 0x743084 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0xe4>
  743074: aa1303e0     	mov	x0, x19
  743078: aa1303e1     	mov	x1, x19
  74307c: 52800062     	mov	w2, #0x3                // =3
  743080: d63f0060     	blr	x3
  743084: 97f1c2d2     	bl	0x3b3bcc <_ZN7cocos2d9LuaEngine11getInstanceEv>
  743088: aa0003f3     	mov	x19, x0
  74308c: b00028c0     	adrp	x0, 0xc5c000 <_ZTSSt5_BindIFSt7_Mem_fnIM17ListenerComponentFvRKSt6vectorIPN7cocos2d5TouchESaIS5_EEPNS3_5EventEEEPS1_St12_PlaceholderILi1EESG_ILi2EEEE>
  743090: 52800001     	mov	w1, #0x0                // =0
  743094: 913ec000     	add	x0, x0, #0xfb0
  743098: 94037329     	bl	0x81fd3c <_ZN11CrashReport15initCrashReportEPKcb>
  74309c: aa1303e0     	mov	x0, x19
  7430a0: 940376f0     	bl	0x820c60 <_ZN13BuglyLuaAgent27registerLuaExceptionHandlerEPN7cocos2d9LuaEngineE>
  7430a4: b00028d3     	adrp	x19, 0xc5c000 <_ZTSSt5_BindIFSt7_Mem_fnIM17ListenerComponentFvRKSt6vectorIPN7cocos2d5TouchESaIS5_EEPNS3_5EventEEEPS1_St12_PlaceholderILi1EESG_ILi2EEEE>
  7430a8: 910143b6     	add	x22, x29, #0x50
  7430ac: 910123a0     	add	x0, x29, #0x48
  7430b0: 913f0261     	add	x1, x19, #0xfc0
  7430b4: aa1603e2     	mov	x2, x22
  7430b8: 94120fc6     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  7430bc: 910103b7     	add	x23, x29, #0x40
  7430c0: aa1603e0     	mov	x0, x22
  7430c4: 913f0261     	add	x1, x19, #0xfc0
  7430c8: aa1703e2     	mov	x2, x23
  7430cc: 94120fc1     	bl	0xbc6fd0 <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x489a8>
  7430d0: 94000934     	bl	0x7455a0 <_ZN15ResourcesDecode12sharedDecodeEv>
  7430d4: f94027a1     	ldr	x1, [x29, #0x48]
  7430d8: f9402ba3     	ldr	x3, [x29, #0x50]
  7430dc: b85e8022     	ldur	w2, [x1, #-0x18]
  7430e0: b85e8064     	ldur	w4, [x3, #-0x18]
  7430e4: 94000948     	bl	0x745604 <_ZN15ResourcesDecode11setXXTeaKeyEPKciS1_i>
  7430e8: d0004033     	adrp	x19, 0xf49000
  7430ec: f9402ba1     	ldr	x1, [x29, #0x50]
  7430f0: d1006020     	sub	x0, x1, #0x18
  7430f4: f947ee62     	ldr	x2, [x19, #0xfd8]
  7430f8: eb02001f     	cmp	x0, x2
  7430fc: 540002e1     	b.ne	0x743158 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x1b8>
  743100: f94027a1     	ldr	x1, [x29, #0x48]
  743104: f947ee73     	ldr	x19, [x19, #0xfd8]
  743108: d1006020     	sub	x0, x1, #0x18
  74310c: eb13001f     	cmp	x0, x19
  743110: 540003e1     	b.ne	0x74318c <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x1ec>
  743114: f94037a3     	ldr	x3, [x29, #0x68]
  743118: b40000a3     	cbz	x3, 0x74312c <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x18c>
  74311c: aa1503e0     	mov	x0, x21
  743120: aa1503e1     	mov	x1, x21
  743124: 52800062     	mov	w2, #0x3                // =3
  743128: d63f0060     	blr	x3
  74312c: f940e694     	ldr	x20, [x20, #0x1c8]
  743130: 52800020     	mov	w0, #0x1                // =1
  743134: f9404fa2     	ldr	x2, [x29, #0x98]
  743138: f9400281     	ldr	x1, [x20]
  74313c: eb01005f     	cmp	x2, x1
  743140: 54000501     	b.ne	0x7431e0 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x240>
  743144: a94153f3     	ldp	x19, x20, [sp, #0x10]
  743148: a9425bf5     	ldp	x21, x22, [sp, #0x20]
  74314c: f9401bf7     	ldr	x23, [sp, #0x30]
  743150: a8ca7bfd     	ldp	x29, x30, [sp], #0xa0
  743154: d65f03c0     	ret
  743158: b0004002     	adrp	x2, 0xf44000
  74315c: f9445042     	ldr	x2, [x2, #0x8a0]
  743160: b4000382     	cbz	x2, 0x7431d0 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x230>
  743164: d1002021     	sub	x1, x1, #0x8
  743168: 885ffc22     	ldaxr	w2, [x1]
  74316c: 51000443     	sub	w3, w2, #0x1
  743170: 8804fc23     	stlxr	w4, w3, [x1]
  743174: 35ffffa4     	cbnz	w4, 0x743168 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x1c8>
  743178: 6b1f005f     	cmp	w2, wzr
  74317c: 54fffc2c     	b.gt	0x743100 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x160>
  743180: aa1703e1     	mov	x1, x23
  743184: 94121d8e     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  743188: 17ffffde     	b	0x743100 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x160>
  74318c: b0004002     	adrp	x2, 0xf44000
  743190: f9445042     	ldr	x2, [x2, #0x8a0]
  743194: b4000162     	cbz	x2, 0x7431c0 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x220>
  743198: d1002021     	sub	x1, x1, #0x8
  74319c: 885ffc22     	ldaxr	w2, [x1]
  7431a0: 51000443     	sub	w3, w2, #0x1
  7431a4: 8804fc23     	stlxr	w4, w3, [x1]
  7431a8: 35ffffa4     	cbnz	w4, 0x74319c <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x1fc>
  7431ac: 6b1f005f     	cmp	w2, wzr
  7431b0: 54fffb2c     	b.gt	0x743114 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x174>
  7431b4: aa1603e1     	mov	x1, x22
  7431b8: 94121d81     	bl	0xbca7bc <_ZNK10__cxxabiv121__vmi_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x4c194>
  7431bc: 17ffffd6     	b	0x743114 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x174>
  7431c0: b85f8022     	ldur	w2, [x1, #-0x8]
  7431c4: 51000443     	sub	w3, w2, #0x1
  7431c8: b81f8023     	stur	w3, [x1, #-0x8]
  7431cc: 17fffff8     	b	0x7431ac <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x20c>
  7431d0: b85f8022     	ldur	w2, [x1, #-0x8]
  7431d4: 51000443     	sub	w3, w2, #0x1
  7431d8: b81f8023     	stur	w3, [x1, #-0x8]
  7431dc: 17ffffe7     	b	0x743178 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x1d8>
  7431e0: 97f16070     	bl	0x39b3a0 <__stack_chk_fail@plt>
  7431e4: aa0003f4     	mov	x20, x0
  7431e8: d0004033     	adrp	x19, 0xf49000
  7431ec: f94027a0     	ldr	x0, [x29, #0x48]
  7431f0: f947ee73     	ldr	x19, [x19, #0xfd8]
  7431f4: d1006000     	sub	x0, x0, #0x18
  7431f8: eb13001f     	cmp	x0, x19
  7431fc: 54000060     	b.eq	0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
  743200: aa1703e1     	mov	x1, x23
  743204: 97f16939     	bl	0x39d6e8 <.text+0x13d8>
  743208: f94037a3     	ldr	x3, [x29, #0x68]
  74320c: b40000a3     	cbz	x3, 0x743220 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x280>
  743210: aa1503e0     	mov	x0, x21
  743214: aa1503e1     	mov	x1, x21
  743218: 52800062     	mov	w2, #0x3                // =3
  74321c: d63f0060     	blr	x3
  743220: aa1403e0     	mov	x0, x20
  743224: 94127f2f     	bl	0xbe2ee0 <_Unwind_Resume>
  743228: f94047a3     	ldr	x3, [x29, #0x88]
  74322c: aa0003f4     	mov	x20, x0
  743230: b4fffec3     	cbz	x3, 0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
  743234: aa1303e0     	mov	x0, x19
  743238: aa1303e1     	mov	x1, x19
  74323c: 52800062     	mov	w2, #0x3                // =3
  743240: d63f0060     	blr	x3
  743244: 17fffff1     	b	0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
  743248: d0004033     	adrp	x19, 0xf49000
  74324c: aa0003f4     	mov	x20, x0
  743250: f9402ba0     	ldr	x0, [x29, #0x50]
  743254: f947ee61     	ldr	x1, [x19, #0xfd8]
  743258: d1006000     	sub	x0, x0, #0x18
  74325c: eb01001f     	cmp	x0, x1
  743260: 54fffc60     	b.eq	0x7431ec <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x24c>
  743264: aa1703e1     	mov	x1, x23
  743268: 97f16920     	bl	0x39d6e8 <.text+0x13d8>
  74326c: 17ffffe0     	b	0x7431ec <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x24c>
  743270: f94037a3     	ldr	x3, [x29, #0x68]
  743274: aa0003f3     	mov	x19, x0
  743278: b40000a3     	cbz	x3, 0x74328c <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x2ec>
  74327c: 910163a0     	add	x0, x29, #0x58
  743280: 52800062     	mov	w2, #0x3                // =3
  743284: aa0003e1     	mov	x1, x0
  743288: d63f0060     	blr	x3
  74328c: aa1303e0     	mov	x0, x19
  743290: 94127f14     	bl	0xbe2ee0 <_Unwind_Resume>
  743294: f94047a3     	ldr	x3, [x29, #0x88]
  743298: aa0003f4     	mov	x20, x0
  74329c: b4fffb63     	cbz	x3, 0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
  7432a0: aa1303e0     	mov	x0, x19
  7432a4: aa1303e1     	mov	x1, x19
  7432a8: 52800062     	mov	w2, #0x3                // =3
  7432ac: d63f0060     	blr	x3
  7432b0: 17ffffd6     	b	0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
  7432b4: aa0003f4     	mov	x20, x0
  7432b8: 17ffffd4     	b	0x743208 <_ZN7cocos2d10CCGameMain29applicationDidFinishLaunchingEP9lua_State+0x268>
