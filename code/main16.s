	.text
	.file	"main16.c"
	.globl	get_shadow                      // -- Begin function get_shadow
	.p2align	2
	.type	get_shadow,@function
get_shadow:                             // @get_shadow
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	and	x9, x8, #0xffffffffffff
	mov	x8, #263878495698944
	add	x0, x8, x9, lsr #4
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #160
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_
	add	x8, x8, :lo12:.L___asan_gen_
	str	x8, [x19, #104]                 // 8-byte Folded Spill
	adrp	x8, test1
	add	x8, x8, :lo12:test1
	str	x8, [x19, #112]                 // 8-byte Folded Spill
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #120]                 // 8-byte Folded Spill
	tbnz	w8, #0, .LBB1_2
	b	.LBB1_1
.LBB1_1:
	mov	x0, #96
	bl	__asan_stack_malloc_1
	str	x0, [x19, #120]                 // 8-byte Folded Spill
	b	.LBB1_2
.LBB1_2:
	ldr	x9, [x19, #120]                 // 8-byte Folded Reload
	str	x9, [x19, #88]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #96]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB1_4
	b	.LBB1_3
.LBB1_3:
	mov	x8, sp
	subs	x8, x8, #96
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #96]                  // 8-byte Folded Spill
	b	.LBB1_4
.LBB1_4:
	ldr	x8, [x19, #112]                 // 8-byte Folded Reload
	ldr	x10, [x19, #104]                // 8-byte Folded Reload
	ldr	x9, [x19, #96]                  // 8-byte Folded Reload
	str	x9, [x19, #152]
	add	x0, x9, #32
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	add	x11, x9, #64
	str	x11, [x19, #32]                 // 8-byte Folded Spill
	mov	x12, x9
	str	x12, [x19, #40]                 // 8-byte Folded Spill
	mov	x11, #35507
	movk	x11, #16821, lsl #16
	str	x11, [x12]
	add	x11, x9, #8
	str	x10, [x11]
	mov	x2, #16
	add	x10, x9, #16
	str	x8, [x10]
	mov	x8, #68719476736
	str	x8, [x19, #64]                  // 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	add	x10, x8, #0
	mov	x9, #-1012762419733073423
	movk	x9, #63736, lsl #32
	movk	x9, #62194, lsl #48
	str	x9, [x10]
	add	x10, x8, #8
	mov	w9, #63736
	movk	w9, #62451, lsl #16
	str	w9, [x10]
	add	x9, x8, #4
	strh	wzr, [x9]
	add	x8, x8, #8
	strh	wzr, [x8]
	mov	w1, #97
	bl	__asan_memset
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	ldr	x8, [x19, #64]                  // 8-byte Folded Reload
	add	x9, x9, #15
	str	x9, [x19, #72]                  // 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [x19, #84]                  // 4-byte Folded Spill
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB1_7
	b	.LBB1_5
.LBB1_5:
	ldr	w8, [x19, #84]                  // 4-byte Folded Reload
	ldr	x9, [x19, #72]                  // 8-byte Folded Reload
	and	x9, x9, #0x7
                                        // kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	cset	w8, gt
	tbnz	w8, #0, .LBB1_7
	b	.LBB1_6
.LBB1_6:
	ldr	x0, [x19, #72]                  // 8-byte Folded Reload
	bl	__asan_report_store1
.LBB1_7:
	ldr	x0, [x19, #32]                  // 8-byte Folded Reload
	ldr	x8, [x19, #56]                  // 8-byte Folded Reload
	strb	wzr, [x8, #15]
	mov	w1, #98
	mov	x2, #16
	bl	__asan_memset
	ldr	x8, [x19, #32]                  // 8-byte Folded Reload
	add	x9, x8, #15
	str	x9, [x19, #16]                  // 8-byte Folded Spill
	mov	x8, #68719476736
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [x19, #28]                  // 4-byte Folded Spill
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB1_10
	b	.LBB1_8
.LBB1_8:
	ldr	w8, [x19, #28]                  // 4-byte Folded Reload
	ldr	x9, [x19, #16]                  // 8-byte Folded Reload
	and	x9, x9, #0x7
                                        // kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	cset	w8, gt
	tbnz	w8, #0, .LBB1_10
	b	.LBB1_9
.LBB1_9:
	ldr	x0, [x19, #16]                  // 8-byte Folded Reload
	bl	__asan_report_store1
.LBB1_10:
	ldr	x8, [x19, #32]                  // 8-byte Folded Reload
	ldr	x0, [x19, #56]                  // 8-byte Folded Reload
	strb	wzr, [x8, #15]
	bl	get_shadow
	ldr	x1, [x19, #56]                  // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, .str
	add	x0, x0, :lo12:.str
	bl	printf
	ldr	x0, [x19, #32]                  // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [x19, #32]                  // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, .str.1
	add	x0, x0, :lo12:.str.1
	bl	printf
	ldr	x8, [x19, #32]                  // 8-byte Folded Reload
	add	x9, x8, #16
	str	x9, [x19]                       // 8-byte Folded Spill
	mov	x8, #68719476736
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [x19, #12]                  // 4-byte Folded Spill
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB1_13
	b	.LBB1_11
.LBB1_11:
	ldr	w8, [x19, #12]                  // 4-byte Folded Reload
	ldr	x9, [x19]                       // 8-byte Folded Reload
	and	x9, x9, #0x7
                                        // kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	cset	w8, gt
	tbnz	w8, #0, .LBB1_13
	b	.LBB1_12
.LBB1_12:
	ldr	x0, [x19]                       // 8-byte Folded Reload
	bl	__asan_report_store1
.LBB1_13:
	ldr	x9, [x19, #32]                  // 8-byte Folded Reload
	ldr	x1, [x19, #56]                  // 8-byte Folded Reload
	mov	w8, #100
	strb	w8, [x9, #16]
	adrp	x0, .str.2
	add	x0, x0, :lo12:.str.2
	bl	printf
	ldr	x1, [x19, #32]                  // 8-byte Folded Reload
	adrp	x0, .str.3
	add	x0, x0, :lo12:.str.3
	bl	printf
	ldr	x11, [x19, #48]                 // 8-byte Folded Reload
	ldr	x10, [x19, #40]                 // 8-byte Folded Reload
	ldr	x8, [x19, #88]                  // 8-byte Folded Reload
	add	x12, x11, #8
	mov	w9, #63736
	strh	w9, [x12]
	add	x11, x11, #4
	strh	w9, [x11]
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB1_15
	b	.LBB1_14
.LBB1_14:
	ldr	x8, [x19, #88]                  // 8-byte Folded Reload
	ldr	x10, [x19, #48]                 // 8-byte Folded Reload
	add	x11, x10, #0
	mov	x9, #62965
	movk	x9, #62965, lsl #16
	movk	x9, #62965, lsl #32
	movk	x9, #62965, lsl #48
	str	x9, [x11]
	add	x10, x10, #8
	str	x9, [x10]
	add	x8, x8, #120
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB1_16
.LBB1_15:
	ldr	x8, [x19, #48]                  // 8-byte Folded Reload
	add	x9, x8, #0
	str	xzr, [x9]
	add	x8, x8, #8
	str	wzr, [x8]
	b	.LBB1_16
.LBB1_16:
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #96
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_.7
	add	x8, x8, :lo12:.L___asan_gen_.7
	str	x8, [x19, #40]                  // 8-byte Folded Spill
	adrp	x8, test2
	add	x8, x8, :lo12:test2
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	str	w0, [x19, #92]
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #56]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB2_2
	b	.LBB2_1
.LBB2_1:
	mov	x0, #64
	bl	__asan_stack_malloc_0
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	b	.LBB2_2
.LBB2_2:
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB2_4
	b	.LBB2_3
.LBB2_3:
	mov	x8, sp
	subs	x8, x8, #64
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #32]                  // 8-byte Folded Spill
	b	.LBB2_4
.LBB2_4:
	ldr	x8, [x19, #48]                  // 8-byte Folded Reload
	ldr	x10, [x19, #40]                 // 8-byte Folded Reload
	ldr	x9, [x19, #32]                  // 8-byte Folded Reload
	str	x9, [x19, #80]
	add	x11, x9, #32
	str	x11, [x19]                      // 8-byte Folded Spill
	mov	x12, x9
	str	x12, [x19, #8]                  // 8-byte Folded Spill
	mov	x11, #35507
	movk	x11, #16821, lsl #16
	str	x11, [x12]
	add	x11, x9, #8
	str	x10, [x11]
	add	x10, x9, #16
	str	x8, [x10]
	mov	x8, #68719476736
	add	x8, x8, x9, lsr #3
	str	x8, [x19, #16]                  // 8-byte Folded Spill
	add	x9, x8, #0
	mov	x8, #-1012762419733073423
	movk	x8, #63736, lsl #32
	movk	x8, #62451, lsl #48
	str	x8, [x9]
	ldr	w8, [x19, #92]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, .LBB2_6
	b	.LBB2_5
.LBB2_5:                                // %if.then
	b	.LBB2_7
.LBB2_6:                                // %if.end
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	ldr	x0, [x19]                       // 8-byte Folded Reload
	add	x8, x8, #4
	strh	wzr, [x8]
	mov	w1, #97
	mov	x2, #16
	bl	__asan_memset
	ldr	x0, [x19]                       // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [x19]                       // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, .str
	add	x0, x0, :lo12:.str
	bl	printf
	ldr	w8, [x19, #92]
	add	w0, w8, #1
	bl	test2
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x9, x8, #4
	mov	w8, #63736
	strh	w8, [x9]
	b	.LBB2_7
.LBB2_7:                                // %return
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x10, [x19, #8]                  // 8-byte Folded Reload
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB2_9
	b	.LBB2_8
.LBB2_8:
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x9, [x19, #16]                  // 8-byte Folded Reload
	add	x10, x9, #0
	mov	x9, #62965
	movk	x9, #62965, lsl #16
	movk	x9, #62965, lsl #32
	movk	x9, #62965, lsl #48
	str	x9, [x10]
	add	x8, x8, #56
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB2_10
.LBB2_9:
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x8, x8, #0
	str	xzr, [x8]
	b	.LBB2_10
.LBB2_10:
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #160
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_.8
	add	x8, x8, :lo12:.L___asan_gen_.8
	str	x8, [x19, #40]                  // 8-byte Folded Spill
	adrp	x8, test3
	add	x8, x8, :lo12:test3
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #56]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB3_2
	b	.LBB3_1
.LBB3_1:
	mov	x0, #352
	bl	__asan_stack_malloc_3
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	b	.LBB3_2
.LBB3_2:
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB3_4
	b	.LBB3_3
.LBB3_3:
	mov	x8, sp
	subs	x8, x8, #352
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #32]                  // 8-byte Folded Spill
	b	.LBB3_4
.LBB3_4:
	ldr	x18, [x19, #48]                 // 8-byte Folded Reload
	ldr	x1, [x19, #40]                  // 8-byte Folded Reload
	ldr	x0, [x19, #32]                  // 8-byte Folded Reload
	str	x0, [x19]                       // 8-byte Folded Spill
	str	x0, [x19, #72]
	add	x17, x0, #32
	add	x16, x0, #64
	add	x15, x0, #96
	add	x14, x0, #128
	add	x13, x0, #160
	add	x12, x0, #192
	add	x11, x0, #224
	add	x10, x0, #256
	add	x9, x0, #288
	add	x8, x0, #320
	mov	x3, x0
	str	x3, [x19, #16]                  // 8-byte Folded Spill
	mov	x2, #35507
	movk	x2, #16821, lsl #16
	str	x2, [x3]
	add	x2, x0, #8
	str	x1, [x2]
	add	x1, x0, #16
	str	x18, [x1]
	mov	x18, #68719476736
	add	x18, x18, x0, lsr #3
	str	x18, [x19, #8]                  // 8-byte Folded Spill
	add	x1, x18, #0
	mov	x0, #61937
	movk	x0, #61937, lsl #16
	movk	x0, #62194, lsl #48
	str	x0, [x1]
	add	x1, x18, #10
	mov	x0, #62194
	movk	x0, #62194, lsl #32
	str	x0, [x1]
	add	x1, x18, #18
	str	x0, [x1]
	add	x1, x18, #26
	str	x0, [x1]
	add	x1, x18, #34
	str	x0, [x1]
	add	x0, x18, #42
	mov	w18, #62451
	strh	w18, [x0]
	str	x17, [x19, #152]
	str	x16, [x19, #144]
	str	x15, [x19, #136]
	str	x14, [x19, #128]
	str	x13, [x19, #120]
	str	x12, [x19, #112]
	str	x11, [x19, #104]
	str	x10, [x19, #96]
	str	x9, [x19, #88]
	str	x8, [x19, #80]
	ldr	x1, [x19, #152]
	ldr	x2, [x19, #144]
	adrp	x0, .str.4
	add	x0, x0, :lo12:.str.4
	bl	printf
	ldr	x10, [x19, #16]                 // 8-byte Folded Reload
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB3_6
	b	.LBB3_5
.LBB3_5:
	ldr	x8, [x19, #8]                   // 8-byte Folded Reload
	add	x0, x8, #0
	mov	x1, #64
	bl	__asan_set_shadow_f5
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	add	x8, x8, #504
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB3_7
.LBB3_6:
	ldr	x8, [x19, #8]                   // 8-byte Folded Reload
	add	x9, x8, #0
	str	xzr, [x9]
	add	x9, x8, #10
	str	xzr, [x9]
	add	x9, x8, #18
	str	xzr, [x9]
	add	x9, x8, #26
	str	xzr, [x9]
	add	x9, x8, #34
	str	xzr, [x9]
	add	x8, x8, #42
	strh	wzr, [x8]
	b	.LBB3_7
.LBB3_7:
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #160
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_.9
	add	x8, x8, :lo12:.L___asan_gen_.9
	str	x8, [x19, #40]                  // 8-byte Folded Spill
	adrp	x8, test4
	add	x8, x8, :lo12:test4
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #56]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB4_2
	b	.LBB4_1
.LBB4_1:
	mov	x0, #352
	bl	__asan_stack_malloc_3
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	b	.LBB4_2
.LBB4_2:
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB4_4
	b	.LBB4_3
.LBB4_3:
	mov	x8, sp
	subs	x8, x8, #352
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #32]                  // 8-byte Folded Spill
	b	.LBB4_4
.LBB4_4:
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x1, [x19, #48]                  // 8-byte Folded Reload
	ldr	x3, [x19, #40]                  // 8-byte Folded Reload
	ldr	x2, [x19, #32]                  // 8-byte Folded Reload
	str	x2, [x19, #8]                   // 8-byte Folded Spill
	str	x2, [x19, #72]
	add	x0, x2, #32
	add	x18, x2, #64
	add	x17, x2, #96
	add	x16, x2, #128
	add	x15, x2, #160
	add	x14, x2, #192
	add	x13, x2, #224
	add	x12, x2, #256
	add	x11, x2, #288
	add	x9, x2, #320
	mov	x10, x2
	mov	x4, #35507
	movk	x4, #16821, lsl #16
	str	x4, [x10]
	add	x4, x2, #8
	str	x3, [x4]
	add	x3, x2, #16
	str	x1, [x3]
	mov	x1, #68719476736
	add	x1, x1, x2, lsr #3
	str	x1, [x19, #16]                  // 8-byte Folded Spill
	add	x3, x1, #0
	mov	x2, #61937
	movk	x2, #61937, lsl #16
	movk	x2, #62194, lsl #48
	str	x2, [x3]
	add	x3, x1, #10
	mov	x2, #62194
	movk	x2, #62194, lsl #32
	str	x2, [x3]
	add	x3, x1, #18
	str	x2, [x3]
	add	x3, x1, #26
	str	x2, [x3]
	add	x3, x1, #34
	str	x2, [x3]
	add	x2, x1, #42
	mov	w1, #62451
	strh	w1, [x2]
	str	x0, [x19, #152]
	str	x18, [x19, #144]
	str	x17, [x19, #136]
	str	x16, [x19, #128]
	str	x15, [x19, #120]
	str	x14, [x19, #112]
	str	x13, [x19, #104]
	str	x12, [x19, #96]
	str	x11, [x19, #88]
	str	x9, [x19, #80]
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB4_6
	b	.LBB4_5
.LBB4_5:
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x0, x8, #0
	mov	x1, #64
	bl	__asan_set_shadow_f5
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	add	x8, x8, #504
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB4_7
.LBB4_6:
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x9, x8, #0
	str	xzr, [x9]
	add	x9, x8, #10
	str	xzr, [x9]
	add	x9, x8, #18
	str	xzr, [x9]
	add	x9, x8, #26
	str	xzr, [x9]
	add	x9, x8, #34
	str	xzr, [x9]
	add	x8, x8, #42
	strh	wzr, [x8]
	b	.LBB4_7
.LBB4_7:
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #96
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_.10
	add	x8, x8, :lo12:.L___asan_gen_.10
	str	x8, [x19, #40]                  // 8-byte Folded Spill
	adrp	x8, test5
	add	x8, x8, :lo12:test5
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #56]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB5_2
	b	.LBB5_1
.LBB5_1:
	mov	x0, #64
	bl	__asan_stack_malloc_0
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	b	.LBB5_2
.LBB5_2:
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB5_4
	b	.LBB5_3
.LBB5_3:
	mov	x8, sp
	subs	x8, x8, #64
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #32]                  // 8-byte Folded Spill
	b	.LBB5_4
.LBB5_4:
	ldr	x8, [x19, #48]                  // 8-byte Folded Reload
	ldr	x10, [x19, #40]                 // 8-byte Folded Reload
	ldr	x9, [x19, #32]                  // 8-byte Folded Reload
	str	x9, [x19, #80]
	add	x11, x9, #32
	str	x11, [x19]                      // 8-byte Folded Spill
	mov	x12, x9
	str	x12, [x19, #8]                  // 8-byte Folded Spill
	mov	x11, #35507
	movk	x11, #16821, lsl #16
	str	x11, [x12]
	add	x11, x9, #8
	str	x10, [x11]
	add	x10, x9, #16
	str	x8, [x10]
	mov	x8, #68719476736
	add	x8, x8, x9, lsr #3
	str	x8, [x19, #16]                  // 8-byte Folded Spill
	add	x9, x8, #0
	mov	x8, #-1012762419733073423
	movk	x8, #63736, lsl #32
	movk	x8, #62451, lsl #48
	str	x8, [x9]
	str	wzr, [x19, #92]
	b	.LBB5_5
.LBB5_5:                                // %for.cond
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x19, #92]
	subs	w8, w8, #1000
	cset	w8, lt
	tbnz	w8, #0, .LBB5_7
	b	.LBB5_6
.LBB5_6:                                // %for.cond.cleanup
	b	.LBB5_9
.LBB5_7:                                // %for.body
                                        //   in Loop: Header=BB5_5 Depth=1
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	ldr	x0, [x19]                       // 8-byte Folded Reload
	add	x8, x8, #4
	strh	wzr, [x8]
	mov	w1, #97
	mov	x2, #16
	bl	__asan_memset
	ldr	x0, [x19]                       // 8-byte Folded Reload
	bl	get_shadow
	ldr	x1, [x19]                       // 8-byte Folded Reload
	mov	x2, x0
	adrp	x0, .str
	add	x0, x0, :lo12:.str
	bl	printf
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x9, x8, #4
	mov	w8, #63736
	strh	w8, [x9]
	b	.LBB5_8
.LBB5_8:                                // %for.inc
                                        //   in Loop: Header=BB5_5 Depth=1
	ldr	w8, [x19, #92]
	add	w8, w8, #1
	str	w8, [x19, #92]
	b	.LBB5_5
.LBB5_9:                                // %for.end
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x10, [x19, #8]                  // 8-byte Folded Reload
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB5_11
	b	.LBB5_10
.LBB5_10:
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x9, [x19, #16]                  // 8-byte Folded Reload
	add	x10, x9, #0
	mov	x9, #62965
	movk	x9, #62965, lsl #16
	movk	x9, #62965, lsl #32
	movk	x9, #62965, lsl #48
	str	x9, [x10]
	add	x8, x8, #56
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB5_12
.LBB5_11:
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x8, x8, #0
	str	xzr, [x8]
	b	.LBB5_12
.LBB5_12:
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #128
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	mov	x9, xzr
	adrp	x8, .L___asan_gen_.11
	add	x8, x8, :lo12:.L___asan_gen_.11
	str	x8, [x19, #40]                  // 8-byte Folded Spill
	adrp	x8, test65
	add	x8, x8, :lo12:test65
	str	x8, [x19, #48]                  // 8-byte Folded Spill
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #56]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB6_2
	b	.LBB6_1
.LBB6_1:
	mov	x0, #96
	bl	__asan_stack_malloc_1
	str	x0, [x19, #56]                  // 8-byte Folded Spill
	b	.LBB6_2
.LBB6_2:
	ldr	x9, [x19, #56]                  // 8-byte Folded Reload
	str	x9, [x19, #24]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB6_4
	b	.LBB6_3
.LBB6_3:
	mov	x8, sp
	subs	x8, x8, #96
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #32]                  // 8-byte Folded Spill
	b	.LBB6_4
.LBB6_4:
	ldr	x10, [x19, #48]                 // 8-byte Folded Reload
	ldr	x12, [x19, #40]                 // 8-byte Folded Reload
	ldr	x11, [x19, #32]                 // 8-byte Folded Reload
	str	x11, [x19, #88]
	add	x9, x11, #32
	add	x8, x11, #64
	mov	x14, x11
	str	x14, [x19, #8]                  // 8-byte Folded Spill
	mov	x13, #35507
	movk	x13, #16821, lsl #16
	str	x13, [x14]
	add	x13, x11, #8
	str	x12, [x13]
	add	x12, x11, #16
	str	x10, [x12]
	mov	x10, #68719476736
	add	x10, x10, x11, lsr #3
	str	x10, [x19, #16]                 // 8-byte Folded Spill
	add	x12, x10, #0
	mov	x11, #61937
	movk	x11, #61937, lsl #16
	movk	x11, #62194, lsl #48
	str	x11, [x12]
	add	x11, x10, #10
	mov	w10, #62451
	strh	w10, [x11]
	str	x9, [x19, #112]
	str	x8, [x19, #104]
	ldr	x8, [x19, #112]
	lsr	x8, x8, #56
	and	x8, x8, #0xff
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [x19, #103]
	ldr	x8, [x19, #104]
	lsr	x8, x8, #56
	and	x8, x8, #0xff
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [x19, #102]
	ldrb	w8, [x19, #103]
	ldrb	w9, [x19, #102]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, .LBB6_6
	b	.LBB6_5
.LBB6_5:                                // %if.then
	mov	w8, #1
	str	w8, [x19, #124]
	str	w8, [x19, #96]
	b	.LBB6_7
.LBB6_6:                                // %if.else
	str	wzr, [x19, #124]
	mov	w8, #1
	str	w8, [x19, #96]
	b	.LBB6_7
.LBB6_7:                                // %cleanup
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x10, [x19, #8]                  // 8-byte Folded Reload
	ldr	w9, [x19, #124]
	str	w9, [x19, #4]                   // 4-byte Folded Spill
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB6_9
	b	.LBB6_8
.LBB6_8:
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x10, [x19, #16]                 // 8-byte Folded Reload
	add	x11, x10, #0
	mov	x9, #62965
	movk	x9, #62965, lsl #16
	movk	x9, #62965, lsl #32
	movk	x9, #62965, lsl #48
	str	x9, [x11]
	add	x10, x10, #8
	str	x9, [x10]
	add	x8, x8, #120
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB6_10
.LBB6_9:
	ldr	x8, [x19, #16]                  // 8-byte Folded Reload
	add	x9, x8, #0
	str	xzr, [x9]
	add	x8, x8, #10
	strh	wzr, [x8]
	b	.LBB6_10
.LBB6_10:
	ldr	w0, [x19, #4]                   // 4-byte Folded Reload
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
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
// %bb.0:                               // %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             // 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	w8, #16960
	movk	w8, #15, lsl #16
	stur	w8, [x29, #-8]
	str	xzr, [sp, #16]
	b	.LBB7_1
.LBB7_1:                                // %for.cond
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldur	w9, [x29, #-8]
                                        // kill: def $x9 killed $w9
	subs	x8, x8, x9
	cset	w8, lo
	tbnz	w8, #0, .LBB7_3
	b	.LBB7_2
.LBB7_2:                                // %for.cond.cleanup
	b	.LBB7_7
.LBB7_3:                                // %for.body
                                        //   in Loop: Header=BB7_1 Depth=1
	bl	test65
	str	w0, [sp, #12]
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	cset	w8, ne
	tbnz	w8, #0, .LBB7_5
	b	.LBB7_4
.LBB7_4:                                // %if.then
                                        //   in Loop: Header=BB7_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	stur	w8, [x29, #-4]
	b	.LBB7_5
.LBB7_5:                                // %if.end
                                        //   in Loop: Header=BB7_1 Depth=1
	b	.LBB7_6
.LBB7_6:                                // %for.inc
                                        //   in Loop: Header=BB7_1 Depth=1
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	b	.LBB7_1
.LBB7_7:                                // %for.end
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	ldur	s1, [x29, #-4]
                                        // implicit-def: $d0
	fmov	s0, s1
	ucvtf	d0, d0
	ldur	s2, [x29, #-8]
                                        // implicit-def: $d1
	fmov	s1, s2
	ucvtf	d1, d1
	fdiv	d0, d0, d1
	adrp	x0, .str.5
	add	x0, x0, :lo12:.str.5
	bl	printf
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]             // 16-byte Folded Reload
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
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
// %bb.0:                               // %entry
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	w8, #16960
	movk	w8, #15, lsl #16
	stur	w8, [x29, #-8]
	stur	xzr, [x29, #-16]
	b	.LBB8_1
.LBB8_1:                                // %for.cond
                                        // =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-16]
	ldur	w9, [x29, #-8]
                                        // kill: def $x9 killed $w9
	subs	x8, x8, x9
	cset	w8, lo
	tbnz	w8, #0, .LBB8_3
	b	.LBB8_2
.LBB8_2:                                // %for.cond.cleanup
	b	.LBB8_7
.LBB8_3:                                // %for.body
                                        //   in Loop: Header=BB8_1 Depth=1
	mov	x0, #16
	str	x0, [sp]                        // 8-byte Folded Spill
	bl	malloc
	mov	x8, x0
	ldr	x0, [sp]                        // 8-byte Folded Reload
	str	x8, [sp, #24]
	bl	malloc
	str	x0, [sp, #16]
	ldr	x8, [sp, #24]
	lsr	x8, x8, #56
	and	x8, x8, #0xff
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [sp, #15]
	ldr	x8, [sp, #16]
	lsr	x8, x8, #56
	and	x8, x8, #0xff
                                        // kill: def $w8 killed $w8 killed $x8
	strb	w8, [sp, #14]
	ldrb	w8, [sp, #15]
	ldrb	w9, [sp, #14]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, .LBB8_5
	b	.LBB8_4
.LBB8_4:                                // %if.then
                                        //   in Loop: Header=BB8_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	stur	w8, [x29, #-4]
	b	.LBB8_5
.LBB8_5:                                // %if.end
                                        //   in Loop: Header=BB8_1 Depth=1
	b	.LBB8_6
.LBB8_6:                                // %for.inc
                                        //   in Loop: Header=BB8_1 Depth=1
	ldur	x8, [x29, #-16]
	add	x8, x8, #1
	stur	x8, [x29, #-16]
	b	.LBB8_1
.LBB8_7:                                // %for.end
	ldur	w1, [x29, #-4]
	ldur	w2, [x29, #-8]
	ldur	s1, [x29, #-4]
                                        // implicit-def: $d0
	fmov	s0, s1
	ucvtf	d0, d0
	ldur	s2, [x29, #-8]
                                        // implicit-def: $d1
	fmov	s1, s2
	ucvtf	d1, d1
	fdiv	d0, d0, d1
	adrp	x0, .str.5
	add	x0, x0, :lo12:.str.5
	bl	printf
	.cfi_def_cfa wsp, 64
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end8:
	.size	test7, .Lfunc_end8-test7
	.cfi_endproc
                                        // -- End function
	.globl	test85                          // -- Begin function test85
	.p2align	2
	.type	test85,@function
test85:                                 // @test85
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	sub	x9, sp, #192
	and	sp, x9, #0xffffffffffffffe0
	mov	x19, sp
	adrp	x8, .L___asan_gen_.12
	add	x8, x8, :lo12:.L___asan_gen_.12
	str	x8, [x19, #104]                 // 8-byte Folded Spill
	adrp	x8, test85
	add	x8, x8, :lo12:test85
	str	x8, [x19, #112]                 // 8-byte Folded Spill
	mov	x9, xzr
	str	xzr, [x19, #160]
	adrp	x8, :got:__asan_option_detect_stack_use_after_return
	ldr	x8, [x8, :got_lo12:__asan_option_detect_stack_use_after_return]
	ldr	w8, [x8]
	subs	w8, w8, #0
	cset	w8, eq
	str	x9, [x19, #120]                 // 8-byte Folded Spill
	tbnz	w8, #0, .LBB9_2
	b	.LBB9_1
.LBB9_1:
	mov	x0, #64
	bl	__asan_stack_malloc_0
	str	x0, [x19, #120]                 // 8-byte Folded Spill
	b	.LBB9_2
.LBB9_2:
	ldr	x9, [x19, #120]                 // 8-byte Folded Reload
	str	x9, [x19, #88]                  // 8-byte Folded Spill
	subs	x8, x9, #0
	cset	w8, ne
	str	x9, [x19, #96]                  // 8-byte Folded Spill
	tbnz	w8, #0, .LBB9_4
	b	.LBB9_3
.LBB9_3:
	mov	x8, sp
	subs	x8, x8, #64
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #96]                  // 8-byte Folded Spill
	b	.LBB9_4
.LBB9_4:
	ldr	x8, [x19, #112]                 // 8-byte Folded Reload
	ldr	x11, [x19, #104]                // 8-byte Folded Reload
	ldr	x10, [x19, #96]                 // 8-byte Folded Reload
	str	x10, [x19, #144]
	add	x9, x10, #32
	str	x9, [x19, #48]                  // 8-byte Folded Spill
	mov	x13, x10
	str	x13, [x19, #56]                 // 8-byte Folded Spill
	mov	x12, #35507
	movk	x12, #16821, lsl #16
	str	x12, [x13]
	add	x12, x10, #8
	str	x11, [x12]
	add	x11, x10, #16
	str	x8, [x11]
	mov	x8, #68719476736
	add	x10, x8, x10, lsr #3
	str	x10, [x19, #64]                 // 8-byte Folded Spill
	add	x12, x10, #0
	mov	x11, #-1012762419733073423
	movk	x11, #62456, lsl #32
	movk	x11, #62451, lsl #48
	str	x11, [x12]
	add	x11, x10, #4
	mov	w10, #4
	strb	w10, [x11]
	str	x9, [x19, #72]                  // 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [x19, #84]                  // 4-byte Folded Spill
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB9_7
	b	.LBB9_5
.LBB9_5:
	ldr	w8, [x19, #84]                  // 4-byte Folded Reload
	ldr	x9, [x19, #72]                  // 8-byte Folded Reload
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        // kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	cset	w8, gt
	tbnz	w8, #0, .LBB9_7
	b	.LBB9_6
.LBB9_6:
	ldr	x0, [x19, #72]                  // 8-byte Folded Reload
	bl	__asan_report_store4
.LBB9_7:
	ldr	x9, [x19, #48]                  // 8-byte Folded Reload
	mov	w8, #16
	str	w8, [x9]
	mov	x8, sp
	subs	x8, x8, #96
	and	x8, x8, #0xffffffffffffffe0
	mov	sp, x8
	str	x8, [x19, #16]                  // 8-byte Folded Spill
	add	x0, x8, #32
	str	x0, [x19, #24]                  // 8-byte Folded Spill
	mov	x1, #16
	bl	__asan_alloca_poison
	ldr	x10, [x19, #16]                 // 8-byte Folded Reload
	ldr	x8, [x19, #24]                  // 8-byte Folded Reload
	ldr	x9, [x19, #48]                  // 8-byte Folded Reload
	str	x10, [x19, #160]
	str	x8, [x19, #152]
	str	x9, [x19, #32]                  // 8-byte Folded Spill
	mov	x8, #68719476736
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [x19, #44]                  // 4-byte Folded Spill
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB9_10
	b	.LBB9_8
.LBB9_8:
	ldr	w8, [x19, #44]                  // 4-byte Folded Reload
	ldr	x9, [x19, #32]                  // 8-byte Folded Reload
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        // kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	cset	w8, gt
	tbnz	w8, #0, .LBB9_10
	b	.LBB9_9
.LBB9_9:
	ldr	x0, [x19, #32]                  // 8-byte Folded Reload
	bl	__asan_report_load4
.LBB9_10:
	ldr	x8, [x19, #48]                  // 8-byte Folded Reload
	ldr	w1, [x8]
	ldr	x2, [x19, #152]
	adrp	x0, .str.6
	add	x0, x0, :lo12:.str.6
	bl	printf
	ldr	x8, [x19, #64]                  // 8-byte Folded Reload
	add	x9, x8, #4
	mov	w8, #248
	strb	w8, [x9]
	add	x1, x19, #160
	ldr	x0, [x19, #160]
	bl	__asan_allocas_unpoison
	ldr	x10, [x19, #56]                 // 8-byte Folded Reload
	ldr	x8, [x19, #88]                  // 8-byte Folded Reload
	mov	x9, #13838
	movk	x9, #17888, lsl #16
	str	x9, [x10]
	subs	x8, x8, #0
	cset	w8, eq
	tbnz	w8, #0, .LBB9_12
	b	.LBB9_11
.LBB9_11:
	ldr	x8, [x19, #88]                  // 8-byte Folded Reload
	ldr	x9, [x19, #64]                  // 8-byte Folded Reload
	add	x10, x9, #0
	mov	x9, #62965
	movk	x9, #62965, lsl #16
	movk	x9, #62965, lsl #32
	movk	x9, #62965, lsl #48
	str	x9, [x10]
	add	x8, x8, #56
	ldr	x8, [x8]
	strb	wzr, [x8]
	b	.LBB9_13
.LBB9_12:
	ldr	x8, [x19, #64]                  // 8-byte Folded Reload
	add	x8, x8, #0
	str	xzr, [x8]
	b	.LBB9_13
.LBB9_13:
	ldr	x0, [x19, #48]                  // 8-byte Folded Reload
	mov	sp, x29
	.cfi_def_cfa wsp, 32
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end9:
	.size	test85, .Lfunc_end9-test85
	.cfi_endproc
                                        // -- End function
	.globl	test8                           // -- Begin function test8
	.p2align	2
	.type	test8,@function
test8:                                  // @test8
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	test85
	str	x0, [sp, #8]
	.cfi_def_cfa wsp, 32
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end10:
	.size	test8, .Lfunc_end10-test8
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	str	w8, [sp, #8]                    // 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	mov	w0, #1
	bl	test2
	ldr	w0, [sp, #8]                    // 4-byte Folded Reload
	.cfi_def_cfa wsp, 32
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
	.cfi_endproc
                                        // -- End function
	.p2align	2                               // -- Begin function asan.module_ctor
	.type	asan.module_ctor,@function
asan.module_ctor:                       // @asan.module_ctor
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __unnamed_1
	add	x8, x8, :lo12:__unnamed_1
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	bl	__asan_init
	bl	__asan_version_mismatch_check_v8
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	mov	w8, #7
	mov	w1, w8
	bl	__asan_register_globals
	.cfi_def_cfa wsp, 32
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end12:
	.size	asan.module_ctor, .Lfunc_end12-asan.module_ctor
	.cfi_endproc
                                        // -- End function
	.p2align	2                               // -- Begin function asan.module_dtor
	.type	asan.module_dtor,@function
asan.module_dtor:                       // @asan.module_dtor
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, __unnamed_1
	add	x0, x0, :lo12:__unnamed_1
	mov	w8, #7
	mov	w1, w8
	bl	__asan_unregister_globals
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end13:
	.size	asan.module_dtor, .Lfunc_end13-asan.module_dtor
	.cfi_endproc
                                        // -- End function
	.type	.str,@object                    // @.str
	.section	.rodata,"a",@progbits
	.p2align	5
.str:
	.asciz	"a=%p 0x%lx\n"
	.zero	20
	.size	.str, 32

	.type	.str.1,@object                  // @.str.1
	.p2align	5
.str.1:
	.asciz	"b=%p 0x%lx\n"
	.zero	20
	.size	.str.1, 32

	.type	.str.2,@object                  // @.str.2
	.p2align	5
.str.2:
	.asciz	"a=%s\n"
	.zero	26
	.size	.str.2, 32

	.type	.str.3,@object                  // @.str.3
	.p2align	5
.str.3:
	.asciz	"b=%s\n"
	.zero	26
	.size	.str.3, 32

	.type	.str.4,@object                  // @.str.4
	.p2align	5
.str.4:
	.asciz	"%p %p\n"
	.zero	25
	.size	.str.4, 32

	.type	.str.5,@object                  // @.str.5
	.p2align	5
.str.5:
	.asciz	"%u/%u %f\n"
	.zero	22
	.size	.str.5, 32

	.type	.str.6,@object                  // @.str.6
	.p2align	5
.str.6:
	.asciz	"%d %s\n"
	.zero	25
	.size	.str.6, 32

	.type	.L___asan_gen_,@object          // @___asan_gen_
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_:
	.asciz	"2 32 16 1 a 64 16 1 b"
	.size	.L___asan_gen_, 22

	.type	.L___asan_gen_.7,@object        // @___asan_gen_.7
.L___asan_gen_.7:
	.asciz	"1 32 16 1 a"
	.size	.L___asan_gen_.7, 12

	.type	.L___asan_gen_.8,@object        // @___asan_gen_.8
.L___asan_gen_.8:
	.asciz	"10 32 16 0  64 16 0  96 16 0  128 16 0  160 16 0  192 16 0  224 16 0  256 16 0  288 16 0  320 16 0 "
	.size	.L___asan_gen_.8, 100

	.type	.L___asan_gen_.9,@object        // @___asan_gen_.9
.L___asan_gen_.9:
	.asciz	"10 32 16 0  64 16 0  96 16 0  128 16 0  160 16 0  192 16 0  224 16 0  256 16 0  288 16 0  320 16 0 "
	.size	.L___asan_gen_.9, 100

	.type	.L___asan_gen_.10,@object       // @___asan_gen_.10
.L___asan_gen_.10:
	.asciz	"1 32 16 1 a"
	.size	.L___asan_gen_.10, 12

	.type	.L___asan_gen_.11,@object       // @___asan_gen_.11
.L___asan_gen_.11:
	.asciz	"2 32 16 0  64 16 0 "
	.size	.L___asan_gen_.11, 20

	.type	.L___asan_gen_.12,@object       // @___asan_gen_.12
.L___asan_gen_.12:
	.asciz	"1 32 4 11 retu_intvar"
	.size	.L___asan_gen_.12, 22

	.type	.L___asan_gen_.13,@object       // @___asan_gen_.13
	.section	.rodata,"a",@progbits
.L___asan_gen_.13:
	.asciz	"main16.c"
	.size	.L___asan_gen_.13, 9

	.type	.L___asan_gen_.14,@object       // @___asan_gen_.14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L___asan_gen_.14:
	.asciz	".str"
	.size	.L___asan_gen_.14, 5

	.type	.L___asan_gen_.15,@object       // @___asan_gen_.15
.L___asan_gen_.15:
	.asciz	".str.1"
	.size	.L___asan_gen_.15, 7

	.type	.L___asan_gen_.16,@object       // @___asan_gen_.16
.L___asan_gen_.16:
	.asciz	".str.2"
	.size	.L___asan_gen_.16, 7

	.type	.L___asan_gen_.17,@object       // @___asan_gen_.17
.L___asan_gen_.17:
	.asciz	".str.3"
	.size	.L___asan_gen_.17, 7

	.type	.L___asan_gen_.18,@object       // @___asan_gen_.18
.L___asan_gen_.18:
	.asciz	".str.4"
	.size	.L___asan_gen_.18, 7

	.type	.L___asan_gen_.19,@object       // @___asan_gen_.19
.L___asan_gen_.19:
	.asciz	".str.5"
	.size	.L___asan_gen_.19, 7

	.type	.L___asan_gen_.20,@object       // @___asan_gen_.20
.L___asan_gen_.20:
	.asciz	".str.6"
	.size	.L___asan_gen_.20, 7

	.type	__unnamed_1,@object             // @0
	.data
	.p2align	4
__unnamed_1:
	.xword	.str
	.xword	12                              // 0xc
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.14
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.1
	.xword	12                              // 0xc
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.15
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.2
	.xword	6                               // 0x6
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.16
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.3
	.xword	6                               // 0x6
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.17
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.4
	.xword	7                               // 0x7
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.18
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.5
	.xword	10                              // 0xa
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.19
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.xword	.str.6
	.xword	7                               // 0x7
	.xword	32                              // 0x20
	.xword	.L___asan_gen_.20
	.xword	.L___asan_gen_.13
	.xword	0                               // 0x0
	.xword	0                               // 0x0
	.xword	-1                              // 0xffffffffffffffff
	.size	__unnamed_1, 448

	.section	.init_array.1,"aw",@init_array
	.p2align	3
	.xword	asan.module_ctor
	.section	.fini_array.1,"aw",@fini_array
	.p2align	3
	.xword	asan.module_dtor
	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
