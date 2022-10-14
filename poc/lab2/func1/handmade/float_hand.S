	.arch armv7-a
	.arm
	
	.global main
	.type main, %function
	main:
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, #1069547520
	str	r3, [r7, #4]	@ float
	movs	r3, #0
	mov	r0, r3
	ldr 	r0,=_cout
	bl 	printf
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	
.data @数据段
_cout:
	.asciz "%d\n"
