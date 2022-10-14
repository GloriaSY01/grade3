
fabllcO0.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  16:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
  1d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
  24:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 2b <main+0x2b>
  2b:	48 8d 75 e8          	lea    -0x18(%rbp),%rsi
  2f:	e8 00 00 00 00       	call   34 <main+0x34>
  34:	8b 75 f8             	mov    -0x8(%rbp),%esi
  37:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 3e <main+0x3e>
  3e:	e8 00 00 00 00       	call   43 <main+0x43>
  43:	48 89 c7             	mov    %rax,%rdi
  46:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 4d <main+0x4d>
  4d:	e8 00 00 00 00       	call   52 <main+0x52>
  52:	8b 75 f4             	mov    -0xc(%rbp),%esi
  55:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 5c <main+0x5c>
  5c:	e8 00 00 00 00       	call   61 <main+0x61>
  61:	48 89 c7             	mov    %rax,%rdi
  64:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 6b <main+0x6b>
  6b:	e8 00 00 00 00       	call   70 <main+0x70>
  70:	8b 45 f0             	mov    -0x10(%rbp),%eax
  73:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  76:	7d 3e                	jge    b6 <main+0xb6>
  78:	8b 45 f4             	mov    -0xc(%rbp),%eax
  7b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  7e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  81:	03 45 f4             	add    -0xc(%rbp),%eax
  84:	89 45 f4             	mov    %eax,-0xc(%rbp)
  87:	8b 75 f4             	mov    -0xc(%rbp),%esi
  8a:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 91 <main+0x91>
  91:	e8 00 00 00 00       	call   96 <main+0x96>
  96:	48 89 c7             	mov    %rax,%rdi
  99:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # a0 <main+0xa0>
  a0:	e8 00 00 00 00       	call   a5 <main+0xa5>
  a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  a8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  ab:	8b 45 f0             	mov    -0x10(%rbp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	89 45 f0             	mov    %eax,-0x10(%rbp)
  b4:	eb ba                	jmp    70 <main+0x70>
  b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  b9:	48 83 c4 20          	add    $0x20,%rsp
  bd:	5d                   	pop    %rbp
  be:	c3                   	ret    

Disassembly of section .text.startup:

0000000000000000 <__cxx_global_var_init>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
   b:	00 00 00 
   e:	e8 00 00 00 00       	call   13 <__cxx_global_var_init+0x13>
  13:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1a <__cxx_global_var_init+0x1a>
  1a:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
  21:	00 00 00 
  24:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  2b:	00 00 00 
  2e:	e8 00 00 00 00       	call   33 <__cxx_global_var_init+0x33>
  33:	5d                   	pop    %rbp
  34:	c3                   	ret    
  35:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  3c:	00 00 00 
  3f:	90                   	nop

0000000000000040 <_GLOBAL__sub_I_fabnacci.cpp>:
  40:	55                   	push   %rbp
  41:	48 89 e5             	mov    %rsp,%rbp
  44:	e8 b7 ff ff ff       	call   0 <__cxx_global_var_init>
  49:	5d                   	pop    %rbp
  4a:	c3                   	ret    
