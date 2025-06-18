	.arch armv8-a
	.file	"main21.cpp"
	.text
	.section	.rodata
	.align	3
	.type	_ZStL19piecewise_construct, %object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,8
	.align	3
.LC0:
	.string	"Base::foo()"
	.section	.text._ZN4Base3fooEv,"axG",@progbits,_ZN4Base3fooEv,comdat
	.align	2
	.weak	_ZN4Base3fooEv
	.type	_ZN4Base3fooEv, %function
_ZN4Base3fooEv:
.LFB1572:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	add	w0, w0, 2
	str	w0, [sp, 44]
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1572:
	.size	_ZN4Base3fooEv, .-_ZN4Base3fooEv
	.section	.rodata
	.align	3
.LC1:
	.string	"Base::~Base()"
	.section	.text._ZN4BaseD2Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.align	2
	.weak	_ZN4BaseD2Ev
	.type	_ZN4BaseD2Ev, %function
_ZN4BaseD2Ev:
.LFB1574:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1574
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	adrp	x0, _ZTV4Base+16
	add	x1, x0, :lo12:_ZTV4Base+16
	ldr	x0, [sp, 24]
	str	x1, [x0]
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1574:
	.global	__gxx_personality_v0
	.section	.gcc_except_table._ZN4BaseD2Ev,"aG",@progbits,_ZN4BaseD5Ev,comdat
.LLSDA1574:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1574-.LLSDACSB1574
.LLSDACSB1574:
.LLSDACSE1574:
	.section	.text._ZN4BaseD2Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.size	_ZN4BaseD2Ev, .-_ZN4BaseD2Ev
	.weak	_ZN4BaseD1Ev
	.set	_ZN4BaseD1Ev,_ZN4BaseD2Ev
	.section	.text._ZN4BaseD0Ev,"axG",@progbits,_ZN4BaseD5Ev,comdat
	.align	2
	.weak	_ZN4BaseD0Ev
	.type	_ZN4BaseD0Ev, %function
_ZN4BaseD0Ev:
.LFB1576:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZN4BaseD1Ev
	mov	x1, 8
	ldr	x0, [sp, 24]
	bl	_ZdlPvm
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1576:
	.size	_ZN4BaseD0Ev, .-_ZN4BaseD0Ev
	.section	.rodata
	.align	3
.LC2:
	.string	"Derived::foo()"
	.section	.text._ZN7Derived3fooEv,"axG",@progbits,_ZN7Derived3fooEv,comdat
	.align	2
	.weak	_ZN7Derived3fooEv
	.type	_ZN7Derived3fooEv, %function
_ZN7Derived3fooEv:
.LFB1577:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 3
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	add	w0, w0, 4
	str	w0, [sp, 44]
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1577:
	.size	_ZN7Derived3fooEv, .-_ZN7Derived3fooEv
	.section	.rodata
	.align	3
.LC3:
	.string	"Derived::~Derived()"
	.section	.text._ZN7DerivedD2Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.align	2
	.weak	_ZN7DerivedD2Ev
	.type	_ZN7DerivedD2Ev, %function
_ZN7DerivedD2Ev:
.LFB1579:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1579
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	adrp	x0, _ZTV7Derived+16
	add	x1, x0, :lo12:_ZTV7Derived+16
	ldr	x0, [sp, 24]
	str	x1, [x0]
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	x0, [sp, 24]
	bl	_ZN4BaseD2Ev
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1579:
	.section	.gcc_except_table._ZN7DerivedD2Ev,"aG",@progbits,_ZN7DerivedD5Ev,comdat
.LLSDA1579:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1579-.LLSDACSB1579
.LLSDACSB1579:
.LLSDACSE1579:
	.section	.text._ZN7DerivedD2Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.size	_ZN7DerivedD2Ev, .-_ZN7DerivedD2Ev
	.weak	_ZN7DerivedD1Ev
	.set	_ZN7DerivedD1Ev,_ZN7DerivedD2Ev
	.section	.text._ZN7DerivedD0Ev,"axG",@progbits,_ZN7DerivedD5Ev,comdat
	.align	2
	.weak	_ZN7DerivedD0Ev
	.type	_ZN7DerivedD0Ev, %function
_ZN7DerivedD0Ev:
.LFB1581:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZN7DerivedD1Ev
	mov	x1, 8
	ldr	x0, [sp, 24]
	bl	_ZdlPvm
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1581:
	.size	_ZN7DerivedD0Ev, .-_ZN7DerivedD0Ev
	.section	.text._ZN4BaseC2Ev,"axG",@progbits,_ZN4BaseC5Ev,comdat
	.align	2
	.weak	_ZN4BaseC2Ev
	.type	_ZN4BaseC2Ev, %function
_ZN4BaseC2Ev:
.LFB1585:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	adrp	x0, _ZTV4Base+16
	add	x1, x0, :lo12:_ZTV4Base+16
	ldr	x0, [sp, 8]
	str	x1, [x0]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1585:
	.size	_ZN4BaseC2Ev, .-_ZN4BaseC2Ev
	.weak	_ZN4BaseC1Ev
	.set	_ZN4BaseC1Ev,_ZN4BaseC2Ev
	.section	.text._ZN7DerivedC2Ev,"axG",@progbits,_ZN7DerivedC5Ev,comdat
	.align	2
	.weak	_ZN7DerivedC2Ev
	.type	_ZN7DerivedC2Ev, %function
_ZN7DerivedC2Ev:
.LFB1587:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZN4BaseC2Ev
	adrp	x0, _ZTV7Derived+16
	add	x1, x0, :lo12:_ZTV7Derived+16
	ldr	x0, [sp, 24]
	str	x1, [x0]
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1587:
	.size	_ZN7DerivedC2Ev, .-_ZN7DerivedC2Ev
	.weak	_ZN7DerivedC1Ev
	.set	_ZN7DerivedC1Ev,_ZN7DerivedC2Ev
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1582:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -32
	mov	x0, 8
	bl	_Znwm
	mov	x19, x0
	str	xzr, [x19]
	mov	x0, x19
	bl	_ZN7DerivedC1Ev
	str	x19, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	ldr	x1, [x0]
	ldr	x0, [sp, 40]
	blr	x1
	ldr	x0, [sp, 40]
	cmp	x0, 0
	beq	.L10
	ldr	x1, [x0]
	add	x1, x1, 16
	ldr	x1, [x1]
	blr	x1
.L10:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1582:
	.size	main, .-main
	.weak	_ZTV7Derived
	.section	.data.rel.ro.local._ZTV7Derived,"awG",@progbits,_ZTV7Derived,comdat
	.align	3
	.type	_ZTV7Derived, %object
	.size	_ZTV7Derived, 40
_ZTV7Derived:
	.xword	0
	.xword	_ZTI7Derived
	.xword	_ZN7Derived3fooEv
	.xword	_ZN7DerivedD1Ev
	.xword	_ZN7DerivedD0Ev
	.weak	_ZTV4Base
	.section	.data.rel.ro.local._ZTV4Base,"awG",@progbits,_ZTV4Base,comdat
	.align	3
	.type	_ZTV4Base, %object
	.size	_ZTV4Base, 40
_ZTV4Base:
	.xword	0
	.xword	_ZTI4Base
	.xword	_ZN4Base3fooEv
	.xword	_ZN4BaseD1Ev
	.xword	_ZN4BaseD0Ev
	.weak	_ZTI7Derived
	.section	.data.rel.ro._ZTI7Derived,"awG",@progbits,_ZTI7Derived,comdat
	.align	3
	.type	_ZTI7Derived, %object
	.size	_ZTI7Derived, 24
_ZTI7Derived:
	.xword	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.xword	_ZTS7Derived
	.xword	_ZTI4Base
	.weak	_ZTS7Derived
	.section	.rodata._ZTS7Derived,"aG",@progbits,_ZTS7Derived,comdat
	.align	3
	.type	_ZTS7Derived, %object
	.size	_ZTS7Derived, 9
_ZTS7Derived:
	.string	"7Derived"
	.weak	_ZTI4Base
	.section	.data.rel.ro._ZTI4Base,"awG",@progbits,_ZTI4Base,comdat
	.align	3
	.type	_ZTI4Base, %object
	.size	_ZTI4Base, 16
_ZTI4Base:
	.xword	_ZTVN10__cxxabiv117__class_type_infoE+16
	.xword	_ZTS4Base
	.weak	_ZTS4Base
	.section	.rodata._ZTS4Base,"aG",@progbits,_ZTS4Base,comdat
	.align	3
	.type	_ZTS4Base, %object
	.size	_ZTS4Base, 6
_ZTS4Base:
	.string	"4Base"
	.text
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
.LFB2089:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L14
	ldr	w1, [sp, 24]
	mov	w0, 65535
	cmp	w1, w0
	bne	.L14
	adrp	x0, _ZStL8__ioinit
	add	x0, x0, :lo12:_ZStL8__ioinit
	bl	_ZNSt8ios_base4InitC1Ev
	adrp	x0, __dso_handle
	add	x2, x0, :lo12:__dso_handle
	adrp	x0, _ZStL8__ioinit
	add	x1, x0, :lo12:_ZStL8__ioinit
	adrp	x0, :got:_ZNSt8ios_base4InitD1Ev
	ldr	x0, [x0, #:got_lo12:_ZNSt8ios_base4InitD1Ev]
	bl	__cxa_atexit
.L14:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2089:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
.LFB2090:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	mov	w1, 65535
	mov	w0, 1
	bl	_Z41__static_initialization_and_destruction_0ii
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2090:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I_main
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10.5.0-1ubuntu1~22.04) 10.5.0"
	.section	.note.GNU-stack,"",@progbits
