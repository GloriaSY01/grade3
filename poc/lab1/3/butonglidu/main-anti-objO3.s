
fabllcO3.o：     文件格式 elf64-x86-64

Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  16:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  1d:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  24:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 2b <main+0x2b>
  2b:	48 8d 75 f0          	lea    -0x10(%rbp),%rsi
  2f:	e8 00 00 00 00       	call   34 <main+0x34>
  34:	8b 75 f4             	mov    -0xc(%rbp),%esi
  37:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 3e <main+0x3e>
  3e:	e8 00 00 00 00       	call   43 <main+0x43>
  43:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 4a <main+0x4a>
  4a:	48 89 c7             	mov    %rax,%rdi
  4d:	e8 00 00 00 00       	call   52 <main+0x52>
  52:	8b 75 fc             	mov    -0x4(%rbp),%esi
  55:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 5c <main+0x5c>
  5c:	e8 00 00 00 00       	call   61 <main+0x61>
  61:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 68 <main+0x68>
  68:	48 89 c7             	mov    %rax,%rdi
  6b:	e8 00 00 00 00       	call   70 <main+0x70>
  70:	8b 45 f8             	mov    -0x8(%rbp),%eax
  73:	3b 45 f0             	cmp    -0x10(%rbp),%eax
  76:	7d 3e                	jge    b6 <main+0xb6>
  78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  7b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  7e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  81:	03 45 fc             	add    -0x4(%rbp),%eax
  84:	89 45 fc             	mov    %eax,-0x4(%rbp)
  87:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8a:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 91 <main+0x91>
  91:	e8 00 00 00 00       	call   96 <main+0x96>
  96:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 9d <main+0x9d>
  9d:	48 89 c7             	mov    %rax,%rdi
  a0:	e8 00 00 00 00       	call   a5 <main+0xa5>
  a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  a8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  b4:	eb ba                	jmp    70 <main+0x70>
  b6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  b9:	48 83 c4 20          	add    $0x20,%rsp
  bd:	5d                   	pop    %rbp
  be:	c3                   	ret    

Disassembly of section .text.startup:

0000000000000000 <__cxx_global_var_init>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	bf 00 00 00 00       	mov    $0x0,%edi
   9:	e8 00 00 00 00       	call   e <__cxx_global_var_init+0xe>
   e:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 15 <__cxx_global_var_init+0x15>
  15:	be 00 00 00 00       	mov    $0x0,%esi
  1a:	ba 00 00 00 00       	mov    $0x0,%edx
  1f:	e8 00 00 00 00       	call   24 <__cxx_global_var_init+0x24>
  24:	5d                   	pop    %rbp
  25:	c3                   	ret    
  26:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  2d:	00 00 00 

0000000000000030 <_GLOBAL__sub_I_fabnacci.cpp>:
  30:	55                   	push   %rbp
  31:	48 89 e5             	mov    %rsp,%rbp
  34:	e8 c7 ff ff ff       	call   0 <__cxx_global_var_init>
  39:	5d                   	pop    %rbp
  3a:	c3                   	ret    
