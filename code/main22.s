	.arch armv8-a
	.file	"main22.cpp"
	.text
	.section	.rodata
	.align	3
	.type	_ZStL19piecewise_construct, %object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,8
	.text
	.align	2
	.type	_ZL4fun3v, %function
_ZL4fun3v:
.LFB1572:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
.LFE1572:
	.size	_ZL4fun3v, .-_ZL4fun3v
	.align	2
	.type	_ZL4fun4v, %function
_ZL4fun4v:
.LFB1573:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
.LFE1573:
	.size	_ZL4fun4v, .-_ZL4fun4v
	.section	.data.rel.local,"aw"
	.align	3
	.type	_ZL9funcArray, %object
	.size	_ZL9funcArray, 16
_ZL9funcArray:
	.xword	_ZL4fun3v
	.xword	_ZL4fun4v
	.local	_ZL13globalFuncPtr
	.comm	_ZL13globalFuncPtr,8,8
	.section	.text._ZN4Base4fun1Ev,"axG",@progbits,_ZN4Base4fun1Ev,comdat
	.align	2
	.weak	_ZN4Base4fun1Ev
	.type	_ZN4Base4fun1Ev, %function
_ZN4Base4fun1Ev:
.LFB1574:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1574:
	.size	_ZN4Base4fun1Ev, .-_ZN4Base4fun1Ev
	.section	.text._ZN4Base4fun2Ev,"axG",@progbits,_ZN4Base4fun2Ev,comdat
	.align	2
	.weak	_ZN4Base4fun2Ev
	.type	_ZN4Base4fun2Ev, %function
_ZN4Base4fun2Ev:
.LFB1575:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1575:
	.size	_ZN4Base4fun2Ev, .-_ZN4Base4fun2Ev
	.section	.text._ZN7Derived4fun1Ev,"axG",@progbits,_ZN7Derived4fun1Ev,comdat
	.align	2
	.weak	_ZN7Derived4fun1Ev
	.type	_ZN7Derived4fun1Ev, %function
_ZN7Derived4fun1Ev:
.LFB1576:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1576:
	.size	_ZN7Derived4fun1Ev, .-_ZN7Derived4fun1Ev
	.section	.text._ZN7Derived4fun2Ev,"axG",@progbits,_ZN7Derived4fun2Ev,comdat
	.align	2
	.weak	_ZN7Derived4fun2Ev
	.type	_ZN7Derived4fun2Ev, %function
_ZN7Derived4fun2Ev:
.LFB1577:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1577:
	.size	_ZN7Derived4fun2Ev, .-_ZN7Derived4fun2Ev
	.section	.text._ZN4BaseC2Ev,"axG",@progbits,_ZN4BaseC5Ev,comdat
	.align	2
	.weak	_ZN4BaseC2Ev
	.type	_ZN4BaseC2Ev, %function
_ZN4BaseC2Ev:
.LFB1581:
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
.LFE1581:
	.size	_ZN4BaseC2Ev, .-_ZN4BaseC2Ev
	.weak	_ZN4BaseC1Ev
	.set	_ZN4BaseC1Ev,_ZN4BaseC2Ev
	.section	.text._ZN7DerivedC2Ev,"axG",@progbits,_ZN7DerivedC5Ev,comdat
	.align	2
	.weak	_ZN7DerivedC2Ev
	.type	_ZN7DerivedC2Ev, %function
_ZN7DerivedC2Ev:
.LFB1583:
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
.LFE1583:
	.size	_ZN7DerivedC2Ev, .-_ZN7DerivedC2Ev
	.weak	_ZN7DerivedC1Ev
	.set	_ZN7DerivedC1Ev,_ZN7DerivedC2Ev
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1578:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	str	w0, [sp, 44]
	mov	x0, 8
	bl	_Znwm
	mov	x19, x0
	str	xzr, [x19]
	mov	x0, x19
	bl	_ZN7DerivedC1Ev
	str	x19, [sp, 48]
	ldr	x0, [sp, 48]
	ldr	x0, [x0]
	ldr	x1, [x0]
	ldr	x0, [sp, 48]
	blr	x1
	ldr	w0, [sp, 44]
	cmp	w0, 1
	beq	.L10
	ldr	w0, [sp, 44]
	cmp	w0, 2
	beq	.L11
	b	.L12
.L10:
	adrp	x0, _ZL9funcArray
	add	x0, x0, :lo12:_ZL9funcArray
	ldr	x0, [x0]
	blr	x0
	b	.L12
.L11:
	adrp	x0, _ZL9funcArray
	add	x0, x0, :lo12:_ZL9funcArray
	ldr	x0, [x0]
	blr	x0
	nop
.L12:
	mov	x0, 8
	bl	malloc
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	adrp	x1, _ZL4fun3v
	add	x1, x1, :lo12:_ZL4fun3v
	str	x1, [x0]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1578:
	.size	main, .-main
	.weak	_ZTV7Derived
	.section	.data.rel.ro.local._ZTV7Derived,"awG",@progbits,_ZTV7Derived,comdat
	.align	3
	.type	_ZTV7Derived, %object
	.size	_ZTV7Derived, 32
_ZTV7Derived:
	.xword	0
	.xword	_ZTI7Derived
	.xword	_ZN7Derived4fun1Ev
	.xword	_ZN7Derived4fun2Ev
	.weak	_ZTV4Base
	.section	.data.rel.ro.local._ZTV4Base,"awG",@progbits,_ZTV4Base,comdat
	.align	3
	.type	_ZTV4Base, %object
	.size	_ZTV4Base, 32
_ZTV4Base:
	.xword	0
	.xword	_ZTI4Base
	.xword	_ZN4Base4fun1Ev
	.xword	_ZN4Base4fun2Ev
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
.LFB2077:
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
	bne	.L16
	ldr	w1, [sp, 24]
	mov	w0, 65535
	cmp	w1, w0
	bne	.L16
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
.L16:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2077:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
.LFB2078:
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
.LFE2078:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 10.5.0-1ubuntu1~22.04) 10.5.0"
	.section	.note.GNU-stack,"",@progbits
