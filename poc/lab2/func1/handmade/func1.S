	.arch armv7-a
	.arm
	
	.text
	.global adder
adder:
	str fp,[sp,#-4]!
	mov fp,sp
	sub sp,sp,#12 @为本地变量开辟空间
	str r0,[fp,#-12]
	str r1,[fp,#-8]
	add r2,r1,r0
	mov r0,r2
	add sp,fp,#0
	ldr fp,[sp],#4
	bx lr
	
	.text @代码段
	.global main
	.type main, %function
main:
	push {fp, lr} @fp is r11,lr is r14
	sub sp,sp,#8
	mov r0,#1
	mov r1,#2
	add sp,sp,#8
	bl adder
	mov r1,r0
	ldr r0,=_cout
	bl printf
	mov r0,#0
	pop {fp, lr}
	bx lr
	
.data @数据段
_cout:
	.asciz "%d\n"
	
.section .note.GNU-stack,"",%progbits
