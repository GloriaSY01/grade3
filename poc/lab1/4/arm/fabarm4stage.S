
fabarm.o：     文件格式 elf32-littlearm


Disassembly of section .text:

00000000 <main>:
   0:	b590      	push	{r4, r7, lr}
   2:	b087      	sub	sp, #28
   4:	af00      	add	r7, sp, #0
   6:	4c2f      	ldr	r4, [pc, #188]	; (c4 <main+0xc4>)
   8:	447c      	add	r4, pc
   a:	4a2f      	ldr	r2, [pc, #188]	; (c8 <main+0xc8>)
   c:	447a      	add	r2, pc
   e:	4b2f      	ldr	r3, [pc, #188]	; (cc <main+0xcc>)
  10:	58d3      	ldr	r3, [r2, r3]
  12:	681b      	ldr	r3, [r3, #0]
  14:	617b      	str	r3, [r7, #20]
  16:	f04f 0300 	mov.w	r3, #0
  1a:	2300      	movs	r3, #0
  1c:	607b      	str	r3, [r7, #4]
  1e:	2301      	movs	r3, #1
  20:	60bb      	str	r3, [r7, #8]
  22:	2301      	movs	r3, #1
  24:	60fb      	str	r3, [r7, #12]
  26:	463b      	mov	r3, r7
  28:	4619      	mov	r1, r3
  2a:	4b29      	ldr	r3, [pc, #164]	; (d0 <main+0xd0>)
  2c:	58e3      	ldr	r3, [r4, r3]
  2e:	4618      	mov	r0, r3
  30:	f7ff fffe 	bl	0 <_ZNSirsERi>
  34:	6879      	ldr	r1, [r7, #4]
  36:	4b27      	ldr	r3, [pc, #156]	; (d4 <main+0xd4>)
  38:	58e3      	ldr	r3, [r4, r3]
  3a:	4618      	mov	r0, r3
  3c:	f7ff fffe 	bl	0 <_ZNSolsEi>
  40:	4602      	mov	r2, r0
  42:	4b25      	ldr	r3, [pc, #148]	; (d8 <main+0xd8>)
  44:	58e3      	ldr	r3, [r4, r3]
  46:	4619      	mov	r1, r3
  48:	4610      	mov	r0, r2
  4a:	f7ff fffe 	bl	0 <_ZNSolsEPFRSoS_E>
  4e:	68b9      	ldr	r1, [r7, #8]
  50:	4b20      	ldr	r3, [pc, #128]	; (d4 <main+0xd4>)
  52:	58e3      	ldr	r3, [r4, r3]
  54:	4618      	mov	r0, r3
  56:	f7ff fffe 	bl	0 <_ZNSolsEi>
  5a:	4602      	mov	r2, r0
  5c:	4b1e      	ldr	r3, [pc, #120]	; (d8 <main+0xd8>)
  5e:	58e3      	ldr	r3, [r4, r3]
  60:	4619      	mov	r1, r3
  62:	4610      	mov	r0, r2
  64:	f7ff fffe 	bl	0 <_ZNSolsEPFRSoS_E>
  68:	e017      	b.n	9a <main+0x9a>
  6a:	68bb      	ldr	r3, [r7, #8]
  6c:	613b      	str	r3, [r7, #16]
  6e:	68ba      	ldr	r2, [r7, #8]
  70:	687b      	ldr	r3, [r7, #4]
  72:	4413      	add	r3, r2
  74:	60bb      	str	r3, [r7, #8]
  76:	68b9      	ldr	r1, [r7, #8]
  78:	4b16      	ldr	r3, [pc, #88]	; (d4 <main+0xd4>)
  7a:	58e3      	ldr	r3, [r4, r3]
  7c:	4618      	mov	r0, r3
  7e:	f7ff fffe 	bl	0 <_ZNSolsEi>
  82:	4602      	mov	r2, r0
  84:	4b14      	ldr	r3, [pc, #80]	; (d8 <main+0xd8>)
  86:	58e3      	ldr	r3, [r4, r3]
  88:	4619      	mov	r1, r3
  8a:	4610      	mov	r0, r2
  8c:	f7ff fffe 	bl	0 <_ZNSolsEPFRSoS_E>
  90:	693b      	ldr	r3, [r7, #16]
  92:	607b      	str	r3, [r7, #4]
  94:	68fb      	ldr	r3, [r7, #12]
  96:	3301      	adds	r3, #1
  98:	60fb      	str	r3, [r7, #12]
  9a:	683b      	ldr	r3, [r7, #0]
  9c:	68fa      	ldr	r2, [r7, #12]
  9e:	429a      	cmp	r2, r3
  a0:	dbe3      	blt.n	6a <main+0x6a>
  a2:	2300      	movs	r3, #0
  a4:	490d      	ldr	r1, [pc, #52]	; (dc <main+0xdc>)
  a6:	4479      	add	r1, pc
  a8:	4a08      	ldr	r2, [pc, #32]	; (cc <main+0xcc>)
  aa:	588a      	ldr	r2, [r1, r2]
  ac:	6811      	ldr	r1, [r2, #0]
  ae:	697a      	ldr	r2, [r7, #20]
  b0:	4051      	eors	r1, r2
  b2:	f04f 0200 	mov.w	r2, #0
  b6:	d001      	beq.n	bc <main+0xbc>
  b8:	f7ff fffe 	bl	0 <__stack_chk_fail>
  bc:	4618      	mov	r0, r3
  be:	371c      	adds	r7, #28
  c0:	46bd      	mov	sp, r7
  c2:	bd90      	pop	{r4, r7, pc}
  c4:	000000b8 	.word	0x000000b8
  c8:	000000b8 	.word	0x000000b8
	...
  dc:	00000032 	.word	0x00000032

000000e0 <_Z41__static_initialization_and_destruction_0ii>:
  e0:	b590      	push	{r4, r7, lr}
  e2:	b083      	sub	sp, #12
  e4:	af00      	add	r7, sp, #0
  e6:	6078      	str	r0, [r7, #4]
  e8:	6039      	str	r1, [r7, #0]
  ea:	4c0f      	ldr	r4, [pc, #60]	; (128 <_Z41__static_initialization_and_destruction_0ii+0x48>)
  ec:	447c      	add	r4, pc
  ee:	687b      	ldr	r3, [r7, #4]
  f0:	2b01      	cmp	r3, #1
  f2:	d114      	bne.n	11e <_Z41__static_initialization_and_destruction_0ii+0x3e>
  f4:	683b      	ldr	r3, [r7, #0]
  f6:	f64f 72ff 	movw	r2, #65535	; 0xffff
  fa:	4293      	cmp	r3, r2
  fc:	d10f      	bne.n	11e <_Z41__static_initialization_and_destruction_0ii+0x3e>
  fe:	4b0b      	ldr	r3, [pc, #44]	; (12c <_Z41__static_initialization_and_destruction_0ii+0x4c>)
 100:	447b      	add	r3, pc
 102:	4618      	mov	r0, r3
 104:	f7ff fffe 	bl	0 <_ZNSt8ios_base4InitC1Ev>
 108:	4b09      	ldr	r3, [pc, #36]	; (130 <_Z41__static_initialization_and_destruction_0ii+0x50>)
 10a:	447b      	add	r3, pc
 10c:	461a      	mov	r2, r3
 10e:	4b09      	ldr	r3, [pc, #36]	; (134 <_Z41__static_initialization_and_destruction_0ii+0x54>)
 110:	58e3      	ldr	r3, [r4, r3]
 112:	4619      	mov	r1, r3
 114:	4b08      	ldr	r3, [pc, #32]	; (138 <_Z41__static_initialization_and_destruction_0ii+0x58>)
 116:	447b      	add	r3, pc
 118:	4618      	mov	r0, r3
 11a:	f7ff fffe 	bl	0 <__aeabi_atexit>
 11e:	bf00      	nop
 120:	370c      	adds	r7, #12
 122:	46bd      	mov	sp, r7
 124:	bd90      	pop	{r4, r7, pc}
 126:	bf00      	nop
 128:	00000038 	.word	0x00000038
 12c:	00000028 	.word	0x00000028
 130:	00000022 	.word	0x00000022
 134:	00000000 	.word	0x00000000
 138:	0000001e 	.word	0x0000001e

0000013c <_GLOBAL__sub_I_main>:
 13c:	b580      	push	{r7, lr}
 13e:	af00      	add	r7, sp, #0
 140:	f64f 71ff 	movw	r1, #65535	; 0xffff
 144:	2001      	movs	r0, #1
 146:	f7ff ffcb 	bl	e0 <_Z41__static_initialization_and_destruction_0ii>
 14a:	bd80      	pop	{r7, pc}
