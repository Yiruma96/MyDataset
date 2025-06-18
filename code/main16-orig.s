	.text
	.file	"main16.c"
	.globl	get_shadow                      // -- Begin function get_shadow
	.p2align	2
	.type	get_shadow,@function
get_shadow:                             // @get_shadow
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x30, x20, [sp, #16]             // 16-byte Folded Spill
	.cfi_offset w20, -8
	.cfi_offset w30, -16
	mov	x8, x0
	adrp	x10, :gottprel:__hwasan_tls
	ldr	x10, [x10, :gottprel_lo12:__hwasan_tls]
	mrs	x9, TPIDR_EL0
	ldr	x9, [x9, x10]
	orr	x9, x9, #0xffffffff
	add	x20, x9, #1
	str	x20, [sp]                       // 8-byte Folded Spill
	add	x0, sp, #8
	bl	__hwasan_check_x0_19_short_v2
	ldr	x20, [sp]                       // 8-byte Folded Reload
	str	x8, [sp, #8]
	bl	__hwasan_check_x0_3_short_v2
	ldr	x8, [sp, #8]
	and	x9, x8, #0xfffffffffff0
	mov	x8, #263878495698944
	add	x0, x8, x9, lsr #4
	ldp	x30, x20, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	ret
.Lfunc_end0:
	.size	get_shadow, .Lfunc_end0-get_shadow
	.cfi_endproc
                                        // -- End function
	.globl	test1                           // -- Begin function test1
	.p2align	2
	.type	test1,@function
test1:                                  // @test1
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #96]             // 16-byte Folded Spill
	str	x20, [sp, #112]                 // 8-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x12, :gottprel:__hwasan_tls
	ldr	x12, [x12, :gottprel_lo12:__hwasan_tls]
	mrs	x11, TPIDR_EL0
	ldr	x9, [x11, x12]
	asr	x8, x9, #3
	adr	x10, #0
	mov	x13, x29
	orr	x13, x10, x13, lsl #44
	mov	x10, x9
	str	x13, [x10], #8
	asr	x13, x9, #56
	bic	x10, x10, x13, lsl #12
	str	x10, [x11, x12]
	orr	x9, x9, #0xffffffff
	add	x20, x9, #1
	str	x20, [sp, #48]                  // 8-byte Folded Spill
	sub	x9, x29, #16
	orr	x0, x9, x8, lsl #56
	str	x0, [sp, #16]                   // 8-byte Folded Spill
	lsr	x10, x9, #4
	str	x10, [sp, #32]                  // 8-byte Folded Spill
	mov	w9, w8
	strb	w9, [x20, x10]
	eor	x8, x8, #0x80
	sub	x9, x29, #32
	orr	x10, x9, x8, lsl #56
	str	x10, [sp, #24]                  // 8-byte Folded Spill
	lsr	x9, x9, #4
	str	x9, [sp, #40]                   // 8-byte Folded Spill
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [x20, x9]
	mov	w8, #16
	mov	w2, w8
	str	x2, [sp, #8]                    // 8-byte Folded Spill
	mov	w1, #97
	bl	__hwasan_memset
	ldr	x2, [sp, #8]                    // 8-byte Folded Reload
	ldr	x9, [sp, #16]                   // 8-byte Folded Reload
                                        // kill: def $x1 killed $x0
	ldr	x0, [sp, #24]                   // 8-byte Folded Reload
	orr	x1, x9, #0xf
	bl	__hwasan_check_x1_16_short_v2
	ldr	x20, [sp, #48]                  // 8-byte Folded Reload
	mov	w8, wzr
	stur	w8, [x29, #-36]                 // 4-byte Folded Spill
	strb	w8, [x9, #15]
	mov	w1, #98
	bl	__hwasan_memset
	ldr	x9, [sp, #24]                   // 8-byte Folded Reload
	ldur	w8, [x29, #-36]                 // 4-byte Folded Reload
                                        // kill: def $x1 killed $x0
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	orr	x1, x9, #0xf
	bl	__hwasan_check_x1_16_short_v2
	ldr	x20, [sp, #48]                  // 8-byte Folded Reload
	strb	w8, [x9, #15]
	bl	get_shadow
	ldr	x1, [sp, #16]                   // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, :pg_hi21_nc:.L.str
	movk	x0, #:prel_g3:.L.str+4294967296
	add	x0, x0, :lo12:.L.str
	bl	printf
                                        // kill: def $w1 killed $w0
	ldr	x0, [sp, #24]                   // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [sp, #24]                   // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, :pg_hi21_nc:.L.str.1
	movk	x0, #:prel_g3:.L.str.1+4294967296
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	ldr	x1, [sp, #16]                   // 8-byte Folded Reload
	ldr	x9, [sp, #24]                   // 8-byte Folded Reload
	add	x0, x9, #16
	bl	__hwasan_check_x0_16_short_v2
	mov	w8, #100
	strb	w8, [x9, #16]
	adrp	x0, :pg_hi21_nc:.L.str.2
	movk	x0, #:prel_g3:.L.str.2+4294967296
	add	x0, x0, :lo12:.L.str.2
	bl	printf
	ldr	x1, [sp, #24]                   // 8-byte Folded Reload
	adrp	x0, :pg_hi21_nc:.L.str.3
	movk	x0, #:prel_g3:.L.str.3+4294967296
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	ldr	x11, [sp, #32]                  // 8-byte Folded Reload
	ldr	x10, [sp, #40]                  // 8-byte Folded Reload
	ldr	x9, [sp, #48]                   // 8-byte Folded Reload
	ldur	w8, [x29, #-36]                 // 4-byte Folded Reload
	strb	w8, [x9, x11]
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 128
	ldr	x20, [sp, #112]                 // 8-byte Folded Reload
	ldp	x29, x30, [sp, #96]             // 16-byte Folded Reload
	add	sp, sp, #128
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end1:
	.size	test1, .Lfunc_end1-test1
	.cfi_endproc
                                        // -- End function
	.globl	test2                           // -- Begin function test2
	.p2align	2
	.type	test2,@function
test2:                                  // @test2
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #144
	.cfi_def_cfa_offset 144
	stp	x29, x30, [sp, #112]            // 16-byte Folded Spill
	str	x20, [sp, #128]                 // 8-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	w8, w0
	adrp	x13, :gottprel:__hwasan_tls
	ldr	x13, [x13, :gottprel_lo12:__hwasan_tls]
	mrs	x12, TPIDR_EL0
	ldr	x10, [x12, x13]
	asr	x9, x10, #3
	adr	x11, #0
	mov	x14, x29
	orr	x14, x11, x14, lsl #44
	mov	x11, x10
	str	x14, [x11], #8
	asr	x14, x10, #56
	bic	x11, x11, x14, lsl #12
	str	x11, [x12, x13]
	orr	x10, x10, #0xffffffff
	add	x20, x10, #1
	str	x20, [sp, #40]                  // 8-byte Folded Spill
	mov	x10, x20
	str	x10, [sp, #8]                   // 8-byte Folded Spill
	sub	x10, x29, #32
	orr	x0, x10, x9, lsl #56
	str	x0, [sp, #16]                   // 8-byte Folded Spill
	lsr	x11, x10, #4
	mov	w10, w9
	strb	w10, [x20, x11]
	eor	x10, x9, #0x80
	sub	x11, x29, #48
	orr	x0, x11, x10, lsl #56
	str	x0, [sp, #24]                   // 8-byte Folded Spill
	lsr	x11, x11, #4
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	eor	x9, x9, #0x40
	add	x10, sp, #48
	orr	x0, x10, x9, lsl #56
	str	x0, [sp, #32]                   // 8-byte Folded Spill
	lsr	x10, x10, #4
                                        // kill: def $w9 killed $w9 killed $x9
	strb	w9, [x20, x10]
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #40]                  // 8-byte Folded Reload
	stur	w8, [x29, #-4]
	bl	__hwasan_check_x0_2_short_v2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #10
	b.ne	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	b	.LBB2_3
.LBB2_2:
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	mov	w8, #16
	mov	w2, w8
	mov	w1, #97
	bl	__hwasan_memset
                                        // kill: def $x1 killed $x0
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [sp, #16]                   // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, :pg_hi21_nc:.L.str
	movk	x0, #:prel_g3:.L.str+4294967296
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldr	x1, [sp, #24]                   // 8-byte Folded Reload
	adrp	x0, :pg_hi21_nc:.L.str.4
	movk	x0, #:prel_g3:.L.str.4+4294967296
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	ldr	x1, [sp, #32]                   // 8-byte Folded Reload
	adrp	x0, :pg_hi21_nc:.L.str.5
	movk	x0, #:prel_g3:.L.str.5+4294967296
	add	x0, x0, :lo12:.L.str.5
	bl	printf
	sub	x0, x29, #4
	bl	__hwasan_check_x0_2_short_v2
	ldur	w8, [x29, #-4]
	add	w0, w8, #1
	bl	test2
	b	.LBB2_3
.LBB2_3:
	ldr	x9, [sp, #8]                    // 8-byte Folded Reload
	sub	x8, x29, #32
	lsr	x10, x8, #4
	mov	w8, wzr
	strb	w8, [x9, x10]
	sub	x10, x29, #48
	lsr	x10, x10, #4
	strb	w8, [x9, x10]
	add	x10, sp, #48
	lsr	x10, x10, #4
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 144
	ldr	x20, [sp, #128]                 // 8-byte Folded Reload
	ldp	x29, x30, [sp, #112]            // 16-byte Folded Reload
	add	sp, sp, #144
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end2:
	.size	test2, .Lfunc_end2-test2
	.cfi_endproc
                                        // -- End function
	.globl	test3                           // -- Begin function test3
	.p2align	2
	.type	test3,@function
test3:                                  // @test3
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #368
	.cfi_def_cfa_offset 368
	stp	x29, x30, [sp, #336]            // 16-byte Folded Spill
	stp	x28, x20, [sp, #352]            // 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -8
	.cfi_offset w28, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x12, :gottprel:__hwasan_tls
	ldr	x12, [x12, :gottprel_lo12:__hwasan_tls]
	mrs	x11, TPIDR_EL0
	ldr	x9, [x11, x12]
	asr	x8, x9, #3
	adr	x10, #0
	mov	x13, x29
	orr	x13, x10, x13, lsl #44
	mov	x10, x9
	str	x13, [x10], #8
	asr	x13, x9, #56
	bic	x10, x10, x13, lsl #12
	str	x10, [x11, x12]
	orr	x9, x9, #0xffffffff
	add	x20, x9, #1
	str	x20, [sp, #80]                  // 8-byte Folded Spill
	sub	x10, x29, #96
	orr	x9, x10, x8, lsl #56
	lsr	x11, x10, #4
	str	x11, [sp, #88]                  // 8-byte Folded Spill
	mov	w10, w8
	strb	w10, [x20, x11]
	sub	x1, x29, #8
	bl	__hwasan_check_x1_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-8]
	eor	x10, x8, #0x80
	sub	x11, x29, #112
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #8]                   // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x0, x29, #16
	bl	__hwasan_check_x0_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-16]
	eor	x10, x8, #0x40
	sub	x11, x29, #128
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #16]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #24
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-24]
	eor	x10, x8, #0xc0
	sub	x11, x29, #144
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #24]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #32
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-32]
	eor	x10, x8, #0x20
	sub	x11, x29, #160
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #32]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #40
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-40]
	eor	x10, x8, #0x60
	add	x11, sp, #160
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #40]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #48
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-48]
	eor	x10, x8, #0xe0
	add	x11, sp, #144
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #48]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #56
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-56]
	eor	x10, x8, #0x70
	add	x11, sp, #128
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #56]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #64
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-64]
	eor	x10, x8, #0xf0
	add	x11, sp, #112
	orr	x9, x11, x10, lsl #56
	lsr	x11, x11, #4
	str	x11, [sp, #64]                  // 8-byte Folded Spill
                                        // kill: def $w10 killed $w10 killed $x10
	strb	w10, [x20, x11]
	sub	x2, x29, #72
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x9, [x29, #-72]
	eor	x9, x8, #0x30
	add	x10, sp, #96
	orr	x8, x10, x9, lsl #56
	lsr	x10, x10, #4
	str	x10, [sp, #72]                  // 8-byte Folded Spill
                                        // kill: def $w9 killed $w9 killed $x9
	strb	w9, [x20, x10]
	sub	x2, x29, #80
	bl	__hwasan_check_x2_19_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	stur	x8, [x29, #-80]
	bl	__hwasan_check_x1_3_short_v2
	ldr	x20, [sp, #80]                  // 8-byte Folded Reload
	ldur	x1, [x29, #-8]
	bl	__hwasan_check_x0_3_short_v2
	ldur	x2, [x29, #-16]
	adrp	x0, :pg_hi21_nc:.L.str.6
	movk	x0, #:prel_g3:.L.str.6+4294967296
	add	x0, x0, :lo12:.L.str.6
	bl	printf
	ldr	x18, [sp, #8]                   // 8-byte Folded Reload
	ldr	x17, [sp, #16]                  // 8-byte Folded Reload
	ldr	x16, [sp, #24]                  // 8-byte Folded Reload
	ldr	x15, [sp, #32]                  // 8-byte Folded Reload
	ldr	x14, [sp, #40]                  // 8-byte Folded Reload
	ldr	x13, [sp, #48]                  // 8-byte Folded Reload
	ldr	x12, [sp, #56]                  // 8-byte Folded Reload
	ldr	x11, [sp, #64]                  // 8-byte Folded Reload
	ldr	x10, [sp, #72]                  // 8-byte Folded Reload
	ldr	x9, [sp, #80]                   // 8-byte Folded Reload
                                        // kill: def $w1 killed $w0
	ldr	x0, [sp, #88]                   // 8-byte Folded Reload
	mov	w8, wzr
	strb	w8, [x9, x0]
	strb	w8, [x9, x18]
	strb	w8, [x9, x17]
	strb	w8, [x9, x16]
	strb	w8, [x9, x15]
	strb	w8, [x9, x14]
	strb	w8, [x9, x13]
	strb	w8, [x9, x12]
	strb	w8, [x9, x11]
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 368
	ldp	x28, x20, [sp, #352]            // 16-byte Folded Reload
	ldp	x29, x30, [sp, #336]            // 16-byte Folded Reload
	add	sp, sp, #368
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w28
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end3:
	.size	test3, .Lfunc_end3-test3
	.cfi_endproc
                                        // -- End function
	.globl	test4                           // -- Begin function test4
	.p2align	2
	.type	test4,@function
test4:                                  // @test4
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	stp	x29, x30, [sp, #256]            // 16-byte Folded Spill
	stp	x28, x20, [sp, #272]            // 16-byte Folded Spill
	add	x29, sp, #256
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -8
	.cfi_offset w28, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x12, :gottprel:__hwasan_tls
	ldr	x12, [x12, :gottprel_lo12:__hwasan_tls]
	mrs	x11, TPIDR_EL0
	ldr	x9, [x11, x12]
	asr	x8, x9, #3
	adr	x10, #0
	mov	x13, x29
	orr	x13, x10, x13, lsl #44
	mov	x10, x9
	str	x13, [x10], #8
	asr	x13, x9, #56
	bic	x10, x10, x13, lsl #12
	str	x10, [x11, x12]
	orr	x9, x9, #0xffffffff
	add	x9, x9, #1
	sub	x11, x29, #96
	orr	x10, x11, x8, lsl #56
	lsr	x0, x11, #4
	mov	w11, w8
	strb	w11, [x9, x0]
	sub	x1, x29, #8
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-8]
	eor	x11, x8, #0x80
	sub	x12, x29, #112
	orr	x10, x12, x11, lsl #56
	lsr	x18, x12, #4
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x18]
	sub	x1, x29, #16
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-16]
	eor	x11, x8, #0x40
	add	x12, sp, #128
	orr	x10, x12, x11, lsl #56
	lsr	x12, x12, #4
	str	x12, [sp]                       // 8-byte Folded Spill
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x12]
	sub	x1, x29, #24
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-24]
	eor	x11, x8, #0xc0
	add	x12, sp, #112
	orr	x10, x12, x11, lsl #56
	lsr	x12, x12, #4
	str	x12, [sp, #8]                   // 8-byte Folded Spill
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x12]
	sub	x1, x29, #32
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-32]
	eor	x11, x8, #0x20
	add	x12, sp, #96
	orr	x10, x12, x11, lsl #56
	lsr	x15, x12, #4
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x15]
	sub	x1, x29, #40
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-40]
	eor	x11, x8, #0x60
	add	x12, sp, #80
	orr	x10, x12, x11, lsl #56
	lsr	x14, x12, #4
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x14]
	sub	x1, x29, #48
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-48]
	eor	x11, x8, #0xe0
	add	x12, sp, #64
	orr	x10, x12, x11, lsl #56
	lsr	x13, x12, #4
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x13]
	sub	x1, x29, #56
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-56]
	eor	x11, x8, #0x70
	add	x12, sp, #48
	orr	x10, x12, x11, lsl #56
	lsr	x12, x12, #4
                                        // kill: def $w11 killed $w11 killed $x11
	strb	w11, [x9, x12]
	sub	x1, x29, #64
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-64]
	eor	x16, x8, #0xf0
	add	x11, sp, #32
	orr	x10, x11, x16, lsl #56
	lsr	x11, x11, #4
                                        // kill: def $w16 killed $w16 killed $x16
	strb	w16, [x9, x11]
	sub	x1, x29, #72
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	stur	x10, [x29, #-72]
	eor	x16, x8, #0x30
	add	x10, sp, #16
	orr	x8, x10, x16, lsl #56
	lsr	x10, x10, #4
                                        // kill: def $w16 killed $w16 killed $x16
	strb	w16, [x9, x10]
	sub	x1, x29, #80
	mov	x20, x9
	bl	__hwasan_check_x1_19_short_v2
	ldr	x17, [sp]                       // 8-byte Folded Reload
	ldr	x16, [sp, #8]                   // 8-byte Folded Reload
	stur	x8, [x29, #-80]
	mov	w8, wzr
	strb	w8, [x9, x0]
	strb	w8, [x9, x18]
	strb	w8, [x9, x17]
	strb	w8, [x9, x16]
	strb	w8, [x9, x15]
	strb	w8, [x9, x14]
	strb	w8, [x9, x13]
	strb	w8, [x9, x12]
	strb	w8, [x9, x11]
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 288
	ldp	x28, x20, [sp, #272]            // 16-byte Folded Reload
	ldp	x29, x30, [sp, #256]            // 16-byte Folded Reload
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w28
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end4:
	.size	test4, .Lfunc_end4-test4
	.cfi_endproc
                                        // -- End function
	.globl	test5                           // -- Begin function test5
	.p2align	2
	.type	test5,@function
test5:                                  // @test5
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	str	x20, [sp, #64]                  // 8-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x12, :gottprel:__hwasan_tls
	ldr	x12, [x12, :gottprel_lo12:__hwasan_tls]
	mrs	x11, TPIDR_EL0
	ldr	x9, [x11, x12]
	asr	x8, x9, #3
	adr	x10, #0
	mov	x13, x29
	orr	x13, x10, x13, lsl #44
	mov	x10, x9
	str	x13, [x10], #8
	asr	x13, x9, #56
	bic	x10, x10, x13, lsl #12
	str	x10, [x11, x12]
	orr	x9, x9, #0xffffffff
	add	x20, x9, #1
	mov	x9, x20
	str	x9, [sp]                        // 8-byte Folded Spill
	add	x9, sp, #16
	orr	x0, x9, x8, lsl #56
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	lsr	x9, x9, #4
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [x20, x9]
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	mov	w8, wzr
	stur	w8, [x29, #-4]
	b	.LBB5_1
.LBB5_1:                                // =>This Inner Loop Header: Depth=1
	ldr	x20, [sp]                       // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_2_short_v2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #1000
	b.lt	.LBB5_3
	b	.LBB5_2
.LBB5_2:
	b	.LBB5_5
.LBB5_3:                                //   in Loop: Header=BB5_1 Depth=1
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	mov	w8, #16
	mov	w2, w8
	mov	w1, #97
	bl	__hwasan_memset
                                        // kill: def $x1 killed $x0
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [sp, #8]                    // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, :pg_hi21_nc:.L.str
	movk	x0, #:prel_g3:.L.str+4294967296
	add	x0, x0, :lo12:.L.str
	bl	printf
	b	.LBB5_4
.LBB5_4:                                //   in Loop: Header=BB5_1 Depth=1
	ldr	x20, [sp]                       // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_2_short_v2
	ldr	x20, [sp]                       // 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	bl	__hwasan_check_x0_18_short_v2
	stur	w8, [x29, #-4]
	b	.LBB5_1
.LBB5_5:
	ldr	x9, [sp]                        // 8-byte Folded Reload
	add	x8, sp, #16
	lsr	x10, x8, #4
	mov	w8, wzr
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 80
	ldr	x20, [sp, #64]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end5:
	.size	test5, .Lfunc_end5-test5
	.cfi_endproc
                                        // -- End function
	.globl	test65                          // -- Begin function test65
	.p2align	2
	.type	test65,@function
test65:                                 // @test65
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #96]             // 16-byte Folded Spill
	str	x20, [sp, #112]                 // 8-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x12, :gottprel:__hwasan_tls
	ldr	x12, [x12, :gottprel_lo12:__hwasan_tls]
	mrs	x11, TPIDR_EL0
	ldr	x9, [x11, x12]
	asr	x8, x9, #3
	adr	x10, #0
	mov	x13, x29
	orr	x13, x10, x13, lsl #44
	mov	x10, x9
	str	x13, [x10], #8
	asr	x13, x9, #56
	bic	x10, x10, x13, lsl #12
	str	x10, [x11, x12]
	orr	x9, x9, #0xffffffff
	add	x20, x9, #1
	str	x20, [sp, #8]                   // 8-byte Folded Spill
	mov	x9, x20
	str	x9, [sp]                        // 8-byte Folded Spill
	add	x10, sp, #32
	orr	x9, x10, x8, lsl #56
	lsr	x11, x10, #4
	mov	w10, w8
	strb	w10, [x20, x11]
	sub	x1, x29, #16
	bl	__hwasan_check_x1_19_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	stur	x9, [x29, #-16]
	eor	x9, x8, #0x80
	add	x10, sp, #16
	orr	x8, x10, x9, lsl #56
	lsr	x10, x10, #4
                                        // kill: def $w9 killed $w9 killed $x9
	strb	w9, [x20, x10]
	sub	x0, x29, #24
	bl	__hwasan_check_x0_19_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	stur	x8, [x29, #-24]
	bl	__hwasan_check_x1_3_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldurb	w8, [x29, #-9]
	mov	w2, w8
	sub	x1, x29, #28
	bl	__hwasan_check_x1_16_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	mov	w8, w2
	sturb	w8, [x29, #-28]
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldurb	w8, [x29, #-17]
	mov	w2, w8
	sub	x0, x29, #32
	bl	__hwasan_check_x0_16_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	mov	w8, w2
	sturb	w8, [x29, #-32]
	bl	__hwasan_check_x1_0_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldurb	w8, [x29, #-28]
	bl	__hwasan_check_x0_0_short_v2
	ldurb	w9, [x29, #-32]
	subs	w8, w8, w9
	b.ne	.LBB6_2
	b	.LBB6_1
.LBB6_1:
	ldr	x20, [sp]                       // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp]                       // 8-byte Folded Reload
	mov	w8, #1
	stur	w8, [x29, #-4]
	sub	x0, x29, #36
	bl	__hwasan_check_x0_18_short_v2
	stur	w8, [x29, #-36]
	b	.LBB6_3
.LBB6_2:
	ldr	x20, [sp]                       // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp]                       // 8-byte Folded Reload
	mov	w8, wzr
	stur	w8, [x29, #-4]
	sub	x0, x29, #36
	bl	__hwasan_check_x0_18_short_v2
	mov	w8, #1
	stur	w8, [x29, #-36]
	b	.LBB6_3
.LBB6_3:
	ldr	x9, [sp]                        // 8-byte Folded Reload
	sub	x0, x29, #4
	mov	x20, x9
	bl	__hwasan_check_x0_2_short_v2
	ldur	w0, [x29, #-4]
	add	x8, sp, #32
	lsr	x10, x8, #4
	mov	w8, wzr
	strb	w8, [x9, x10]
	add	x10, sp, #16
	lsr	x10, x10, #4
	strb	w8, [x9, x10]
	.cfi_def_cfa wsp, 128
	ldr	x20, [sp, #112]                 // 8-byte Folded Reload
	ldp	x29, x30, [sp, #96]             // 16-byte Folded Reload
	add	sp, sp, #128
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end6:
	.size	test65, .Lfunc_end6-test65
	.cfi_endproc
                                        // -- End function
	.globl	test6                           // -- Begin function test6
	.p2align	2
	.type	test6,@function
test6:                                  // @test6
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	str	x20, [sp, #64]                  // 8-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x9, :gottprel:__hwasan_tls
	ldr	x9, [x9, :gottprel_lo12:__hwasan_tls]
	mrs	x8, TPIDR_EL0
	ldr	x8, [x8, x9]
	orr	x8, x8, #0xffffffff
	add	x20, x8, #1
	str	x20, [sp, #16]                  // 8-byte Folded Spill
	mov	x0, x20
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #16]                  // 8-byte Folded Reload
	mov	w8, wzr
	stur	w8, [x29, #-4]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #16]                  // 8-byte Folded Reload
	mov	w8, #16960
	movk	w8, #15, lsl #16
	stur	w8, [x29, #-8]
	sub	x0, x29, #16
	bl	__hwasan_check_x0_19_short_v2
	mov	x8, xzr
	stur	x8, [x29, #-16]
	b	.LBB7_1
.LBB7_1:                                // =>This Inner Loop Header: Depth=1
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	sub	x0, x29, #16
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_2_short_v2
	ldur	w9, [x29, #-8]
                                        // kill: def $x9 killed $w9
	subs	x8, x8, x9
	b.lo	.LBB7_3
	b	.LBB7_2
.LBB7_2:
	b	.LBB7_7
.LBB7_3:                                //   in Loop: Header=BB7_1 Depth=1
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	bl	test65
	mov	w8, w0
	sub	x0, x29, #20
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	stur	w8, [x29, #-20]
	bl	__hwasan_check_x0_2_short_v2
	ldur	w8, [x29, #-20]
	subs	w8, w8, #1
	b.ne	.LBB7_5
	b	.LBB7_4
.LBB7_4:                                //   in Loop: Header=BB7_1 Depth=1
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_2_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	bl	__hwasan_check_x0_18_short_v2
	stur	w8, [x29, #-4]
	b	.LBB7_5
.LBB7_5:                                //   in Loop: Header=BB7_1 Depth=1
	b	.LBB7_6
.LBB7_6:                                //   in Loop: Header=BB7_1 Depth=1
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	sub	x0, x29, #16
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	add	x8, x8, #1
	bl	__hwasan_check_x0_19_short_v2
	stur	x8, [x29, #-16]
	b	.LBB7_1
.LBB7_7:
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	sub	x3, x29, #4
	bl	__hwasan_check_x3_2_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	w1, [x29, #-4]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_2_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	w2, [x29, #-8]
	bl	__hwasan_check_x3_2_short_v2
	ldr	x20, [sp, #8]                   // 8-byte Folded Reload
	ldur	s1, [x29, #-4]
                                        // implicit-def: $d0
	fmov	s0, s1
	ucvtf	d0, d0
	bl	__hwasan_check_x0_2_short_v2
	ldur	s2, [x29, #-8]
                                        // implicit-def: $d1
	fmov	s1, s2
	ucvtf	d1, d1
	fdiv	d0, d0, d1
	adrp	x0, :pg_hi21_nc:.L.str.7
	movk	x0, #:prel_g3:.L.str.7+4294967296
	add	x0, x0, :lo12:.L.str.7
	bl	printf
	.cfi_def_cfa wsp, 80
	ldr	x20, [sp, #64]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end7:
	.size	test6, .Lfunc_end7-test6
	.cfi_endproc
                                        // -- End function
	.globl	test7                           // -- Begin function test7
	.p2align	2
	.type	test7,@function
test7:                                  // @test7
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #80]             // 16-byte Folded Spill
	str	x20, [sp, #96]                  // 8-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x9, :gottprel:__hwasan_tls
	ldr	x9, [x9, :gottprel_lo12:__hwasan_tls]
	mrs	x8, TPIDR_EL0
	ldr	x8, [x8, x9]
	orr	x8, x8, #0xffffffff
	add	x20, x8, #1
	str	x20, [sp, #32]                  // 8-byte Folded Spill
	mov	x0, x20
	str	x0, [sp, #24]                   // 8-byte Folded Spill
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #32]                  // 8-byte Folded Reload
	mov	w8, wzr
	stur	w8, [x29, #-4]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_18_short_v2
	ldr	x20, [sp, #32]                  // 8-byte Folded Reload
	mov	w8, #16960
	movk	w8, #15, lsl #16
	stur	w8, [x29, #-8]
	sub	x0, x29, #16
	bl	__hwasan_check_x0_19_short_v2
	mov	x8, xzr
	stur	x8, [x29, #-16]
	b	.LBB8_1
.LBB8_1:                                // =>This Inner Loop Header: Depth=1
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	sub	x0, x29, #16
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_2_short_v2
	ldur	w9, [x29, #-8]
                                        // kill: def $x9 killed $w9
	subs	x8, x8, x9
	b.lo	.LBB8_3
	b	.LBB8_2
.LBB8_2:
	b	.LBB8_7
.LBB8_3:                                //   in Loop: Header=BB8_1 Depth=1
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	mov	w8, #16
	mov	w0, w8
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	bl	malloc
	mov	x8, x0
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	sub	x1, x29, #24
	str	x1, [sp, #16]                   // 8-byte Folded Spill
	bl	__hwasan_check_x1_19_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	stur	x8, [x29, #-24]
	bl	malloc
	ldr	x1, [sp, #16]                   // 8-byte Folded Reload
	mov	x8, x0
	sub	x0, x29, #32
	bl	__hwasan_check_x0_19_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	stur	x8, [x29, #-32]
	bl	__hwasan_check_x1_3_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldurb	w8, [x29, #-17]
	mov	w2, w8
	sub	x1, x29, #36
	bl	__hwasan_check_x1_16_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	mov	w8, w2
	sturb	w8, [x29, #-36]
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldurb	w8, [x29, #-25]
	mov	w2, w8
	add	x0, sp, #40
	bl	__hwasan_check_x0_16_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	mov	w8, w2
	strb	w8, [sp, #40]
	bl	__hwasan_check_x1_0_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldurb	w8, [x29, #-36]
	bl	__hwasan_check_x0_0_short_v2
	ldrb	w9, [sp, #40]
	subs	w8, w8, w9
	b.ne	.LBB8_5
	b	.LBB8_4
.LBB8_4:                                //   in Loop: Header=BB8_1 Depth=1
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	sub	x0, x29, #4
	bl	__hwasan_check_x0_2_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	bl	__hwasan_check_x0_18_short_v2
	stur	w8, [x29, #-4]
	b	.LBB8_5
.LBB8_5:                                //   in Loop: Header=BB8_1 Depth=1
	b	.LBB8_6
.LBB8_6:                                //   in Loop: Header=BB8_1 Depth=1
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	sub	x0, x29, #16
	bl	__hwasan_check_x0_3_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	add	x8, x8, #1
	bl	__hwasan_check_x0_19_short_v2
	stur	x8, [x29, #-16]
	b	.LBB8_1
.LBB8_7:
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	sub	x3, x29, #4
	bl	__hwasan_check_x3_2_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	w1, [x29, #-4]
	sub	x0, x29, #8
	bl	__hwasan_check_x0_2_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	w2, [x29, #-8]
	bl	__hwasan_check_x3_2_short_v2
	ldr	x20, [sp, #24]                  // 8-byte Folded Reload
	ldur	s1, [x29, #-4]
                                        // implicit-def: $d0
	fmov	s0, s1
	ucvtf	d0, d0
	bl	__hwasan_check_x0_2_short_v2
	ldur	s2, [x29, #-8]
                                        // implicit-def: $d1
	fmov	s1, s2
	ucvtf	d1, d1
	fdiv	d0, d0, d1
	adrp	x0, :pg_hi21_nc:.L.str.7
	movk	x0, #:prel_g3:.L.str.7+4294967296
	add	x0, x0, :lo12:.L.str.7
	bl	printf
	.cfi_def_cfa wsp, 112
	ldr	x20, [sp, #96]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #80]             // 16-byte Folded Reload
	add	sp, sp, #112
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end8:
	.size	test7, .Lfunc_end8-test7
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	str	x20, [sp, #32]                  // 8-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 32
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	adrp	x9, :gottprel:__hwasan_tls
	ldr	x9, [x9, :gottprel_lo12:__hwasan_tls]
	mrs	x8, TPIDR_EL0
	ldr	x8, [x8, x9]
	orr	x8, x8, #0xffffffff
	add	x20, x8, #1
	sub	x0, x29, #4
	bl	__hwasan_check_x0_18_short_v2
	mov	w8, wzr
	str	w8, [sp, #8]                    // 4-byte Folded Spill
	stur	w8, [x29, #-4]
	mov	w0, #1
	bl	test2
	bl	test3
	ldr	w0, [sp, #8]                    // 4-byte Folded Reload
	.cfi_def_cfa wsp, 48
	ldr	x20, [sp, #32]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	.cfi_restore w20
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end9:
	.size	main, .Lfunc_end9-main
	.cfi_endproc
                                        // -- End function
	.section	.text.hwasan.module_ctor,"axGR",@progbits,hwasan.module_ctor,comdat
	.p2align	2                               // -- Begin function hwasan.module_ctor
	.type	hwasan.module_ctor,@function
hwasan.module_ctor:                     // @hwasan.module_ctor
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__hwasan_init
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end10:
	.size	hwasan.module_ctor, .Lfunc_end10-hwasan.module_ctor
	.cfi_endproc
                                        // -- End function
	.section	.init_array.0,"aGw",@init_array,hwasan.module_ctor,comdat
	.p2align	3
	.xword	hwasan.module_ctor
	.hidden	__start_hwasan_globals
	.hidden	__stop_hwasan_globals
	.type	.Lhwasan.note,@object           // @hwasan.note
	.section	.note.hwasan.globals,"aG",@note,hwasan.module_ctor,comdat
	.p2align	2
.Lhwasan.note:
	.word	8                               // 0x8
	.word	8                               // 0x8
	.word	3                               // 0x3
	.asciz	"LLVM\000\000\000"
	.word	__start_hwasan_globals-.Lhwasan.note
	.word	__stop_hwasan_globals-.Lhwasan.note
	.size	.Lhwasan.note, 28

	.type	.Lhwasan.dummy.global,@object   // @hwasan.dummy.global
	.section	hwasan_globals,"aGo",@progbits,hwasan.module_ctor,comdat,.Lhwasan.note,unique,1
	.p2align	2
.Lhwasan.dummy.global:
	.size	.Lhwasan.dummy.global, 0

	.type	.L.str.hwasan,@object           // @.str.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.hwasan:
	.asciz	"a=%p 0x%lx\n"
	.ascii	"\000\000\000\025"
	.size	.L.str.hwasan, 16

	.type	.L.str.hwasan.descriptor,@object // @.str.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.hwasan,unique,2
	.p2align	3
.L.str.hwasan.descriptor:
	.word	.L.str.hwasan-.L.str.hwasan.descriptor
	.word	352321548                       // 0x1500000c
	.size	.L.str.hwasan.descriptor, 8

	.type	.L.str.1.hwasan,@object         // @.str.1.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.1.hwasan:
	.asciz	"b=%p 0x%lx\n"
	.ascii	"\000\000\000\026"
	.size	.L.str.1.hwasan, 16

	.type	.L.str.1.hwasan.descriptor,@object // @.str.1.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.1.hwasan,unique,3
	.p2align	3
.L.str.1.hwasan.descriptor:
	.word	.L.str.1.hwasan-.L.str.1.hwasan.descriptor
	.word	369098764                       // 0x1600000c
	.size	.L.str.1.hwasan.descriptor, 8

	.type	.L.str.2.hwasan,@object         // @.str.2.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.2.hwasan:
	.asciz	"a=%s\n"
	.ascii	"\000\000\000\000\000\000\000\000\000\027"
	.size	.L.str.2.hwasan, 16

	.type	.L.str.2.hwasan.descriptor,@object // @.str.2.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.2.hwasan,unique,4
	.p2align	3
.L.str.2.hwasan.descriptor:
	.word	.L.str.2.hwasan-.L.str.2.hwasan.descriptor
	.word	385875974                       // 0x17000006
	.size	.L.str.2.hwasan.descriptor, 8

	.type	.L.str.3.hwasan,@object         // @.str.3.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.3.hwasan:
	.asciz	"b=%s\n"
	.ascii	"\000\000\000\000\000\000\000\000\000\030"
	.size	.L.str.3.hwasan, 16

	.type	.L.str.3.hwasan.descriptor,@object // @.str.3.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.3.hwasan,unique,5
	.p2align	3
.L.str.3.hwasan.descriptor:
	.word	.L.str.3.hwasan-.L.str.3.hwasan.descriptor
	.word	402653190                       // 0x18000006
	.size	.L.str.3.hwasan.descriptor, 8

	.type	.L.str.4.hwasan,@object         // @.str.4.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.4.hwasan:
	.asciz	"b=%p\n"
	.ascii	"\000\000\000\000\000\000\000\000\000\031"
	.size	.L.str.4.hwasan, 16

	.type	.L.str.4.hwasan.descriptor,@object // @.str.4.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.4.hwasan,unique,6
	.p2align	3
.L.str.4.hwasan.descriptor:
	.word	.L.str.4.hwasan-.L.str.4.hwasan.descriptor
	.word	419430406                       // 0x19000006
	.size	.L.str.4.hwasan.descriptor, 8

	.type	.L.str.5.hwasan,@object         // @.str.5.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.5.hwasan:
	.asciz	"c=%p\n"
	.ascii	"\000\000\000\000\000\000\000\000\000\032"
	.size	.L.str.5.hwasan, 16

	.type	.L.str.5.hwasan.descriptor,@object // @.str.5.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.5.hwasan,unique,7
	.p2align	3
.L.str.5.hwasan.descriptor:
	.word	.L.str.5.hwasan-.L.str.5.hwasan.descriptor
	.word	436207622                       // 0x1a000006
	.size	.L.str.5.hwasan.descriptor, 8

	.type	.L.str.6.hwasan,@object         // @.str.6.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.6.hwasan:
	.asciz	"%p %p\n"
	.ascii	"\000\000\000\000\000\000\000\000\033"
	.size	.L.str.6.hwasan, 16

	.type	.L.str.6.hwasan.descriptor,@object // @.str.6.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.6.hwasan,unique,8
	.p2align	3
.L.str.6.hwasan.descriptor:
	.word	.L.str.6.hwasan-.L.str.6.hwasan.descriptor
	.word	452984839                       // 0x1b000007
	.size	.L.str.6.hwasan.descriptor, 8

	.type	.L.str.7.hwasan,@object         // @.str.7.hwasan
	.section	.rodata,"a",@progbits
	.p2align	4
.L.str.7.hwasan:
	.asciz	"%u/%u %f\n"
	.ascii	"\000\000\000\000\000\034"
	.size	.L.str.7.hwasan, 16

	.type	.L.str.7.hwasan.descriptor,@object // @.str.7.hwasan.descriptor
	.section	hwasan_globals,"ao",@progbits,.L.str.7.hwasan,unique,9
	.p2align	3
.L.str.7.hwasan.descriptor:
	.word	.L.str.7.hwasan-.L.str.7.hwasan.descriptor
	.word	469762058                       // 0x1c00000a
	.size	.L.str.7.hwasan.descriptor, 8

.set .L.str, .L.str.hwasan+1513209474796486656
	.size	.L.str, 12
.set .L.str.1, .L.str.1.hwasan+1585267068834414592
	.size	.L.str.1, 12
.set .L.str.2, .L.str.2.hwasan+1657324662872342528
	.size	.L.str.2, 6
.set .L.str.3, .L.str.3.hwasan+1729382256910270464
	.size	.L.str.3, 6
.set .L.str.4, .L.str.4.hwasan+1801439850948198400
	.size	.L.str.4, 6
.set .L.str.5, .L.str.5.hwasan+1873497444986126336
	.size	.L.str.5, 6
.set .L.str.6, .L.str.6.hwasan+1945555039024054272
	.size	.L.str.6, 7
.set .L.str.7, .L.str.7.hwasan+2017612633061982208
	.size	.L.str.7, 10
	.ident	"clang version 15.0.0 (https://github.com/Yiruma96/ASan-LLVM.git aec6e44601e0c83a39d44d632b337b193cecdc52)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym get_shadow
	.addrsig_sym printf
	.addrsig_sym test2
	.addrsig_sym test3
	.addrsig_sym test65
	.addrsig_sym malloc
	.addrsig_sym __hwasan_init
	.addrsig_sym hwasan.module_ctor
	.addrsig_sym __hwasan_memset
	.addrsig_sym __start_hwasan_globals
	.addrsig_sym __stop_hwasan_globals
	.addrsig_sym .Lhwasan.note
	.addrsig_sym .Lhwasan.dummy.global
	.addrsig_sym .L.str.hwasan
	.addrsig_sym .L.str.hwasan.descriptor
	.addrsig_sym .L.str.1.hwasan
	.addrsig_sym .L.str.1.hwasan.descriptor
	.addrsig_sym .L.str.2.hwasan
	.addrsig_sym .L.str.2.hwasan.descriptor
	.addrsig_sym .L.str.3.hwasan
	.addrsig_sym .L.str.3.hwasan.descriptor
	.addrsig_sym .L.str.4.hwasan
	.addrsig_sym .L.str.4.hwasan.descriptor
	.addrsig_sym .L.str.5.hwasan
	.addrsig_sym .L.str.5.hwasan.descriptor
	.addrsig_sym .L.str.6.hwasan
	.addrsig_sym .L.str.6.hwasan.descriptor
	.addrsig_sym .L.str.7.hwasan
	.addrsig_sym .L.str.7.hwasan.descriptor
	.addrsig_sym .L.str
	.addrsig_sym .L.str.1
	.addrsig_sym .L.str.2
	.addrsig_sym .L.str.3
	.addrsig_sym .L.str.4
	.addrsig_sym .L.str.5
	.addrsig_sym .L.str.6
	.addrsig_sym .L.str.7
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_0_short_v2,comdat
	.type	__hwasan_check_x0_0_short_v2,@function
	.weak	__hwasan_check_x0_0_short_v2
	.hidden	__hwasan_check_x0_0_short_v2
__hwasan_check_x0_0_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp0
.Ltmp1:
	ret
.Ltmp0:
	cmp	w16, #15
	b.hi	.Ltmp2
	and	x17, x0, #0xf
	cmp	w16, w17
	b.ls	.Ltmp2
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp1
.Ltmp2:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #0
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_2_short_v2,comdat
	.type	__hwasan_check_x0_2_short_v2,@function
	.weak	__hwasan_check_x0_2_short_v2
	.hidden	__hwasan_check_x0_2_short_v2
__hwasan_check_x0_2_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp3
.Ltmp4:
	ret
.Ltmp3:
	cmp	w16, #15
	b.hi	.Ltmp5
	and	x17, x0, #0xf
	add	x17, x17, #3
	cmp	w16, w17
	b.ls	.Ltmp5
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp4
.Ltmp5:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #2
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_3_short_v2,comdat
	.type	__hwasan_check_x0_3_short_v2,@function
	.weak	__hwasan_check_x0_3_short_v2
	.hidden	__hwasan_check_x0_3_short_v2
__hwasan_check_x0_3_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp6
.Ltmp7:
	ret
.Ltmp6:
	cmp	w16, #15
	b.hi	.Ltmp8
	and	x17, x0, #0xf
	add	x17, x17, #7
	cmp	w16, w17
	b.ls	.Ltmp8
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp7
.Ltmp8:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #3
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_16_short_v2,comdat
	.type	__hwasan_check_x0_16_short_v2,@function
	.weak	__hwasan_check_x0_16_short_v2
	.hidden	__hwasan_check_x0_16_short_v2
__hwasan_check_x0_16_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp9
.Ltmp10:
	ret
.Ltmp9:
	cmp	w16, #15
	b.hi	.Ltmp11
	and	x17, x0, #0xf
	cmp	w16, w17
	b.ls	.Ltmp11
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp10
.Ltmp11:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #16
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_18_short_v2,comdat
	.type	__hwasan_check_x0_18_short_v2,@function
	.weak	__hwasan_check_x0_18_short_v2
	.hidden	__hwasan_check_x0_18_short_v2
__hwasan_check_x0_18_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp12
.Ltmp13:
	ret
.Ltmp12:
	cmp	w16, #15
	b.hi	.Ltmp14
	and	x17, x0, #0xf
	add	x17, x17, #3
	cmp	w16, w17
	b.ls	.Ltmp14
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp13
.Ltmp14:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #18
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x0_19_short_v2,comdat
	.type	__hwasan_check_x0_19_short_v2,@function
	.weak	__hwasan_check_x0_19_short_v2
	.hidden	__hwasan_check_x0_19_short_v2
__hwasan_check_x0_19_short_v2:
	sbfx	x16, x0, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x0, lsr #56
	b.ne	.Ltmp15
.Ltmp16:
	ret
.Ltmp15:
	cmp	w16, #15
	b.hi	.Ltmp17
	and	x17, x0, #0xf
	add	x17, x17, #7
	cmp	w16, w17
	b.ls	.Ltmp17
	orr	x16, x0, #0xf
	ldrb	w16, [x16]
	cmp	x16, x0, lsr #56
	b.eq	.Ltmp16
.Ltmp17:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x1, #19
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x1_0_short_v2,comdat
	.type	__hwasan_check_x1_0_short_v2,@function
	.weak	__hwasan_check_x1_0_short_v2
	.hidden	__hwasan_check_x1_0_short_v2
__hwasan_check_x1_0_short_v2:
	sbfx	x16, x1, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x1, lsr #56
	b.ne	.Ltmp18
.Ltmp19:
	ret
.Ltmp18:
	cmp	w16, #15
	b.hi	.Ltmp20
	and	x17, x1, #0xf
	cmp	w16, w17
	b.ls	.Ltmp20
	orr	x16, x1, #0xf
	ldrb	w16, [x16]
	cmp	x16, x1, lsr #56
	b.eq	.Ltmp19
.Ltmp20:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x1
	mov	x1, #0
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x1_3_short_v2,comdat
	.type	__hwasan_check_x1_3_short_v2,@function
	.weak	__hwasan_check_x1_3_short_v2
	.hidden	__hwasan_check_x1_3_short_v2
__hwasan_check_x1_3_short_v2:
	sbfx	x16, x1, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x1, lsr #56
	b.ne	.Ltmp21
.Ltmp22:
	ret
.Ltmp21:
	cmp	w16, #15
	b.hi	.Ltmp23
	and	x17, x1, #0xf
	add	x17, x17, #7
	cmp	w16, w17
	b.ls	.Ltmp23
	orr	x16, x1, #0xf
	ldrb	w16, [x16]
	cmp	x16, x1, lsr #56
	b.eq	.Ltmp22
.Ltmp23:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x1
	mov	x1, #3
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x1_16_short_v2,comdat
	.type	__hwasan_check_x1_16_short_v2,@function
	.weak	__hwasan_check_x1_16_short_v2
	.hidden	__hwasan_check_x1_16_short_v2
__hwasan_check_x1_16_short_v2:
	sbfx	x16, x1, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x1, lsr #56
	b.ne	.Ltmp24
.Ltmp25:
	ret
.Ltmp24:
	cmp	w16, #15
	b.hi	.Ltmp26
	and	x17, x1, #0xf
	cmp	w16, w17
	b.ls	.Ltmp26
	orr	x16, x1, #0xf
	ldrb	w16, [x16]
	cmp	x16, x1, lsr #56
	b.eq	.Ltmp25
.Ltmp26:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x1
	mov	x1, #16
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x1_19_short_v2,comdat
	.type	__hwasan_check_x1_19_short_v2,@function
	.weak	__hwasan_check_x1_19_short_v2
	.hidden	__hwasan_check_x1_19_short_v2
__hwasan_check_x1_19_short_v2:
	sbfx	x16, x1, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x1, lsr #56
	b.ne	.Ltmp27
.Ltmp28:
	ret
.Ltmp27:
	cmp	w16, #15
	b.hi	.Ltmp29
	and	x17, x1, #0xf
	add	x17, x17, #7
	cmp	w16, w17
	b.ls	.Ltmp29
	orr	x16, x1, #0xf
	ldrb	w16, [x16]
	cmp	x16, x1, lsr #56
	b.eq	.Ltmp28
.Ltmp29:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x1
	mov	x1, #19
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x2_19_short_v2,comdat
	.type	__hwasan_check_x2_19_short_v2,@function
	.weak	__hwasan_check_x2_19_short_v2
	.hidden	__hwasan_check_x2_19_short_v2
__hwasan_check_x2_19_short_v2:
	sbfx	x16, x2, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x2, lsr #56
	b.ne	.Ltmp30
.Ltmp31:
	ret
.Ltmp30:
	cmp	w16, #15
	b.hi	.Ltmp32
	and	x17, x2, #0xf
	add	x17, x17, #7
	cmp	w16, w17
	b.ls	.Ltmp32
	orr	x16, x2, #0xf
	ldrb	w16, [x16]
	cmp	x16, x2, lsr #56
	b.eq	.Ltmp31
.Ltmp32:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x2
	mov	x1, #19
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
	.section	.text.hot,"axG",@progbits,__hwasan_check_x3_2_short_v2,comdat
	.type	__hwasan_check_x3_2_short_v2,@function
	.weak	__hwasan_check_x3_2_short_v2
	.hidden	__hwasan_check_x3_2_short_v2
__hwasan_check_x3_2_short_v2:
	sbfx	x16, x3, #4, #52
	ldrb	w16, [x20, x16]
	cmp	x16, x3, lsr #56
	b.ne	.Ltmp33
.Ltmp34:
	ret
.Ltmp33:
	cmp	w16, #15
	b.hi	.Ltmp35
	and	x17, x3, #0xf
	add	x17, x17, #3
	cmp	w16, w17
	b.ls	.Ltmp35
	orr	x16, x3, #0xf
	ldrb	w16, [x16]
	cmp	x16, x3, lsr #56
	b.eq	.Ltmp34
.Ltmp35:
	stp	x0, x1, [sp, #-256]!
	stp	x29, x30, [sp, #232]
	mov	x0, x3
	mov	x1, #2
	adrp	x16, :got:__hwasan_tag_mismatch_v2
	ldr	x16, [x16, :got_lo12:__hwasan_tag_mismatch_v2]
	br	x16
