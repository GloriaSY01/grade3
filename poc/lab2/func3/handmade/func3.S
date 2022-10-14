	.arch armv7-a
	.arm
	
	.text
	.global adder
	.text @代码段
	.global main
	.type main, %function
	
main:
    push {lr}
    mov r4,#0
    ldr r5,=array
    sub sp,sp,#4
    ldr r0,=_cin
    mov r1, sp
    bl scanf
    ldr r0, [sp, #0] @取出输入的内容放入r0中
    add sp, sp, #4
    
    mov r6,r0
    b condition     @首先需要判断一下条件是否满足 跳转

    
yh_loop:
    ldr r1,[r5],#4
    ldr r0,=_cout
    bl printf
    add r4,#1

condition:
    cmp r4,r6
    blt yh_loop		//如果条件满足，则跳转到开始循环  每循环一次判断一次

    pop {lr}
    bx lr
    
.data
    _cout:
            .asciz "%d\n"
    _cin:
	    .asciz "%d"
    array: .word 1,2,3,4,5,6,7,8,9,10


