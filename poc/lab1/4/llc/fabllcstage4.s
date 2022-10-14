
fabllc.o:	file format elf64-x86-64

Disassembly of section .text:

0000000000000000 <main>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 48 83 ec 20                  	subq	$32, %rsp
       8: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
       f: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
      16: c7 45 fc 01 00 00 00         	movl	$1, -4(%rbp)
      1d: c7 45 f8 01 00 00 00         	movl	$1, -8(%rbp)
      24: 48 8b 3d 00 00 00 00         	movq	(%rip), %rdi            # 0x2b <main+0x2b>
      2b: 48 8d 75 f0                  	leaq	-16(%rbp), %rsi
      2f: e8 00 00 00 00               	callq	0x34 <main+0x34>
      34: 8b 75 f4                     	movl	-12(%rbp), %esi
      37: 48 8b 3d 00 00 00 00         	movq	(%rip), %rdi            # 0x3e <main+0x3e>
      3e: e8 00 00 00 00               	callq	0x43 <main+0x43>
      43: 48 8b 35 00 00 00 00         	movq	(%rip), %rsi            # 0x4a <main+0x4a>
      4a: 48 89 c7                     	movq	%rax, %rdi
      4d: e8 00 00 00 00               	callq	0x52 <main+0x52>
      52: 8b 75 fc                     	movl	-4(%rbp), %esi
      55: 48 8b 3d 00 00 00 00         	movq	(%rip), %rdi            # 0x5c <main+0x5c>
      5c: e8 00 00 00 00               	callq	0x61 <main+0x61>
      61: 48 8b 35 00 00 00 00         	movq	(%rip), %rsi            # 0x68 <main+0x68>
      68: 48 89 c7                     	movq	%rax, %rdi
      6b: e8 00 00 00 00               	callq	0x70 <main+0x70>
      70: 8b 45 f8                     	movl	-8(%rbp), %eax
      73: 3b 45 f0                     	cmpl	-16(%rbp), %eax
      76: 7d 3e                        	jge	0xb6 <main+0xb6>
      78: 8b 45 fc                     	movl	-4(%rbp), %eax
      7b: 89 45 ec                     	movl	%eax, -20(%rbp)
      7e: 8b 45 f4                     	movl	-12(%rbp), %eax
      81: 03 45 fc                     	addl	-4(%rbp), %eax
      84: 89 45 fc                     	movl	%eax, -4(%rbp)
      87: 8b 75 fc                     	movl	-4(%rbp), %esi
      8a: 48 8b 3d 00 00 00 00         	movq	(%rip), %rdi            # 0x91 <main+0x91>
      91: e8 00 00 00 00               	callq	0x96 <main+0x96>
      96: 48 8b 35 00 00 00 00         	movq	(%rip), %rsi            # 0x9d <main+0x9d>
      9d: 48 89 c7                     	movq	%rax, %rdi
      a0: e8 00 00 00 00               	callq	0xa5 <main+0xa5>
      a5: 8b 45 ec                     	movl	-20(%rbp), %eax
      a8: 89 45 f4                     	movl	%eax, -12(%rbp)
      ab: 8b 45 f8                     	movl	-8(%rbp), %eax
      ae: 83 c0 01                     	addl	$1, %eax
      b1: 89 45 f8                     	movl	%eax, -8(%rbp)
      b4: eb ba                        	jmp	0x70 <main+0x70>
      b6: 8b 45 e8                     	movl	-24(%rbp), %eax
      b9: 48 83 c4 20                  	addq	$32, %rsp
      bd: 5d                           	popq	%rbp
      be: c3                           	retq

Disassembly of section .text.startup:

0000000000000000 <__cxx_global_var_init>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: bf 00 00 00 00               	movl	$0, %edi
       9: e8 00 00 00 00               	callq	0xe <__cxx_global_var_init+0xe>
       e: 48 8b 3d 00 00 00 00         	movq	(%rip), %rdi            # 0x15 <__cxx_global_var_init+0x15>
      15: be 00 00 00 00               	movl	$0, %esi
      1a: ba 00 00 00 00               	movl	$0, %edx
      1f: e8 00 00 00 00               	callq	0x24 <__cxx_global_var_init+0x24>
      24: 5d                           	popq	%rbp
      25: c3                           	retq
      26: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000000030 <_GLOBAL__sub_I_fabnacci.cpp>:
      30: 55                           	pushq	%rbp
      31: 48 89 e5                     	movq	%rsp, %rbp
      34: e8 c7 ff ff ff               	callq	0x0 <__cxx_global_var_init>
      39: 5d                           	popq	%rbp
      3a: c3                           	retq
