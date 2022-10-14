	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"func3.cpp"
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.section	.rodata
	.align	2
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	.fnstart
.LFB1719:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #52
	sub	sp, sp, #52
	.setfp r7, sp, #0
	add	r7, sp, #0
	ldr	r6, .L4
.LPIC1:
	add	r6, pc
	ldr	r2, .L4+4
.LPIC2:
	add	r2, pc
	ldr	r3, .L4+8
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #44]
	mov	r3, #0
	ldr	r3, .L4+12
.LPIC0:
	add	r3, pc
	adds	r4, r7, #4
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	stm	r4, {r0, r1}
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L4+16
	ldr	r3, [r6, r3]
	mov	r0, r3
	bl	_ZNSirsERi(PLT)
	ldr	r3, [r7]
	lsls	r3, r3, #2
	adds	r3, r3, #48
	add	r3, r3, r7
	ldr	r3, [r3, #-44]
	mov	r1, r3
	ldr	r3, .L4+20
	ldr	r3, [r6, r3]
	mov	r0, r3
	bl	_ZNSolsEi(PLT)
	movs	r3, #0
	ldr	r1, .L4+24
.LPIC3:
	add	r1, pc
	ldr	r2, .L4+8
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #44]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L3
	bl	__stack_chk_fail(PLT)
.L3:
	mov	r0, r3
	adds	r7, r7, #52
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	_ZSt3cin(GOT)
	.word	_ZSt4cout(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+4)
	.fnend
	.size	main, .-main
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB2217:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r4, .L9
.LPIC6:
	add	r4, pc
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L8
	ldr	r3, [r7]
	movw	r2, #65535
	cmp	r3, r2
	bne	.L8
	ldr	r3, .L9+4
.LPIC4:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt8ios_base4InitC1Ev(PLT)
	ldr	r3, .L9+8
.LPIC5:
	add	r3, pc
	mov	r2, r3
	ldr	r3, .L9+12
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L9+16
.LPIC7:
	add	r3, pc
	mov	r0, r3
	bl	__aeabi_atexit(PLT)
.L8:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC6+4)
	.word	_ZStL8__ioinit-(.LPIC4+4)
	.word	__dso_handle-(.LPIC5+4)
	.word	_ZNSt8ios_base4InitD1Ev(GOT)
	.word	_ZStL8__ioinit-(.LPIC7+4)
	.cantunwind
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
	.fnstart
.LFB2218:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movw	r1, #65535
	movs	r0, #1
	bl	_Z41__static_initialization_and_destruction_0ii(PLT)
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_main(target1)
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.2.0-17ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",%progbits
