.text	

.globl	rsaz_1024_sqr_avx2
.def	rsaz_1024_sqr_avx2;	.scl 2;	.type 32;	.endef
.p2align	6
rsaz_1024_sqr_avx2:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_rsaz_1024_sqr_avx2:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx
	movq	40(%rsp),%r8

	leaq	(%rsp),%rax
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	vzeroupper
	leaq	-168(%rsp),%rsp
	vmovaps	%xmm6,-216(%rax)
	vmovaps	%xmm7,-200(%rax)
	vmovaps	%xmm8,-184(%rax)
	vmovaps	%xmm9,-168(%rax)
	vmovaps	%xmm10,-152(%rax)
	vmovaps	%xmm11,-136(%rax)
	vmovaps	%xmm12,-120(%rax)
	vmovaps	%xmm13,-104(%rax)
	vmovaps	%xmm14,-88(%rax)
	vmovaps	%xmm15,-72(%rax)
.Lsqr_1024_body:
	movq	%rax,%rbp
	movq	%rdx,%r13
	subq	$832,%rsp
	movq	%r13,%r15
	subq	$-128,%rdi
	subq	$-128,%rsi
	subq	$-128,%r13

	andq	$4095,%r15
	addq	$320,%r15
	shrq	$12,%r15
	vpxor	%ymm9,%ymm9,%ymm9
	jz	.Lsqr_1024_no_n_copy





	subq	$320,%rsp
	vmovdqu	0-128(%r13),%ymm0
	andq	$-2048,%rsp
	vmovdqu	32-128(%r13),%ymm1
	vmovdqu	64-128(%r13),%ymm2
	vmovdqu	96-128(%r13),%ymm3
	vmovdqu	128-128(%r13),%ymm4
	vmovdqu	160-128(%r13),%ymm5
	vmovdqu	192-128(%r13),%ymm6
	vmovdqu	224-128(%r13),%ymm7
	vmovdqu	256-128(%r13),%ymm8
	leaq	832+128(%rsp),%r13
	vmovdqu	%ymm0,0-128(%r13)
	vmovdqu	%ymm1,32-128(%r13)
	vmovdqu	%ymm2,64-128(%r13)
	vmovdqu	%ymm3,96-128(%r13)
	vmovdqu	%ymm4,128-128(%r13)
	vmovdqu	%ymm5,160-128(%r13)
	vmovdqu	%ymm6,192-128(%r13)
	vmovdqu	%ymm7,224-128(%r13)
	vmovdqu	%ymm8,256-128(%r13)
	vmovdqu	%ymm9,288-128(%r13)

.Lsqr_1024_no_n_copy:
	andq	$-1024,%rsp

	vmovdqu	32-128(%rsi),%ymm1
	vmovdqu	64-128(%rsi),%ymm2
	vmovdqu	96-128(%rsi),%ymm3
	vmovdqu	128-128(%rsi),%ymm4
	vmovdqu	160-128(%rsi),%ymm5
	vmovdqu	192-128(%rsi),%ymm6
	vmovdqu	224-128(%rsi),%ymm7
	vmovdqu	256-128(%rsi),%ymm8

	leaq	192(%rsp),%rbx
	vpbroadcastq	.Land_mask(%rip),%ymm15
	jmp	.LOOP_GRANDE_SQR_1024

.p2align	5
.LOOP_GRANDE_SQR_1024:
	leaq	576+128(%rsp),%r9
	leaq	448(%rsp),%r12




	vpaddq	%ymm1,%ymm1,%ymm1
	vpbroadcastq	0-128(%rsi),%ymm10
	vpaddq	%ymm2,%ymm2,%ymm2
	vmovdqa	%ymm1,0-128(%r9)
	vpaddq	%ymm3,%ymm3,%ymm3
	vmovdqa	%ymm2,32-128(%r9)
	vpaddq	%ymm4,%ymm4,%ymm4
	vmovdqa	%ymm3,64-128(%r9)
	vpaddq	%ymm5,%ymm5,%ymm5
	vmovdqa	%ymm4,96-128(%r9)
	vpaddq	%ymm6,%ymm6,%ymm6
	vmovdqa	%ymm5,128-128(%r9)
	vpaddq	%ymm7,%ymm7,%ymm7
	vmovdqa	%ymm6,160-128(%r9)
	vpaddq	%ymm8,%ymm8,%ymm8
	vmovdqa	%ymm7,192-128(%r9)
	vpxor	%ymm9,%ymm9,%ymm9
	vmovdqa	%ymm8,224-128(%r9)

	vpmuludq	0-128(%rsi),%ymm10,%ymm0
	vpbroadcastq	32-128(%rsi),%ymm11
	vmovdqu	%ymm9,288-192(%rbx)
	vpmuludq	%ymm10,%ymm1,%ymm1
	vmovdqu	%ymm9,320-448(%r12)
	vpmuludq	%ymm10,%ymm2,%ymm2
	vmovdqu	%ymm9,352-448(%r12)
	vpmuludq	%ymm10,%ymm3,%ymm3
	vmovdqu	%ymm9,384-448(%r12)
	vpmuludq	%ymm10,%ymm4,%ymm4
	vmovdqu	%ymm9,416-448(%r12)
	vpmuludq	%ymm10,%ymm5,%ymm5
	vmovdqu	%ymm9,448-448(%r12)
	vpmuludq	%ymm10,%ymm6,%ymm6
	vmovdqu	%ymm9,480-448(%r12)
	vpmuludq	%ymm10,%ymm7,%ymm7
	vmovdqu	%ymm9,512-448(%r12)
	vpmuludq	%ymm10,%ymm8,%ymm8
	vpbroadcastq	64-128(%rsi),%ymm10
	vmovdqu	%ymm9,544-448(%r12)

	movq	%rsi,%r15
	movl	$4,%r14d
	jmp	.Lsqr_entry_1024
.p2align	5
.LOOP_SQR_1024:
	vpbroadcastq	32-128(%r15),%ymm11
	vpmuludq	0-128(%rsi),%ymm10,%ymm0
	vpaddq	0-192(%rbx),%ymm0,%ymm0
	vpmuludq	0-128(%r9),%ymm10,%ymm1
	vpaddq	32-192(%rbx),%ymm1,%ymm1
	vpmuludq	32-128(%r9),%ymm10,%ymm2
	vpaddq	64-192(%rbx),%ymm2,%ymm2
	vpmuludq	64-128(%r9),%ymm10,%ymm3
	vpaddq	96-192(%rbx),%ymm3,%ymm3
	vpmuludq	96-128(%r9),%ymm10,%ymm4
	vpaddq	128-192(%rbx),%ymm4,%ymm4
	vpmuludq	128-128(%r9),%ymm10,%ymm5
	vpaddq	160-192(%rbx),%ymm5,%ymm5
	vpmuludq	160-128(%r9),%ymm10,%ymm6
	vpaddq	192-192(%rbx),%ymm6,%ymm6
	vpmuludq	192-128(%r9),%ymm10,%ymm7
	vpaddq	224-192(%rbx),%ymm7,%ymm7
	vpmuludq	224-128(%r9),%ymm10,%ymm8
	vpbroadcastq	64-128(%r15),%ymm10
	vpaddq	256-192(%rbx),%ymm8,%ymm8
.Lsqr_entry_1024:
	vmovdqu	%ymm0,0-192(%rbx)
	vmovdqu	%ymm1,32-192(%rbx)

	vpmuludq	32-128(%rsi),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	32-128(%r9),%ymm11,%ymm14
	vpaddq	%ymm14,%ymm3,%ymm3
	vpmuludq	64-128(%r9),%ymm11,%ymm13
	vpaddq	%ymm13,%ymm4,%ymm4
	vpmuludq	96-128(%r9),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	128-128(%r9),%ymm11,%ymm14
	vpaddq	%ymm14,%ymm6,%ymm6
	vpmuludq	160-128(%r9),%ymm11,%ymm13
	vpaddq	%ymm13,%ymm7,%ymm7
	vpmuludq	192-128(%r9),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	224-128(%r9),%ymm11,%ymm0
	vpbroadcastq	96-128(%r15),%ymm11
	vpaddq	288-192(%rbx),%ymm0,%ymm0

	vmovdqu	%ymm2,64-192(%rbx)
	vmovdqu	%ymm3,96-192(%rbx)

	vpmuludq	64-128(%rsi),%ymm10,%ymm13
	vpaddq	%ymm13,%ymm4,%ymm4
	vpmuludq	64-128(%r9),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	96-128(%r9),%ymm10,%ymm14
	vpaddq	%ymm14,%ymm6,%ymm6
	vpmuludq	128-128(%r9),%ymm10,%ymm13
	vpaddq	%ymm13,%ymm7,%ymm7
	vpmuludq	160-128(%r9),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	192-128(%r9),%ymm10,%ymm14
	vpaddq	%ymm14,%ymm0,%ymm0
	vpmuludq	224-128(%r9),%ymm10,%ymm1
	vpbroadcastq	128-128(%r15),%ymm10
	vpaddq	320-448(%r12),%ymm1,%ymm1

	vmovdqu	%ymm4,128-192(%rbx)
	vmovdqu	%ymm5,160-192(%rbx)

	vpmuludq	96-128(%rsi),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm6,%ymm6
	vpmuludq	96-128(%r9),%ymm11,%ymm14
	vpaddq	%ymm14,%ymm7,%ymm7
	vpmuludq	128-128(%r9),%ymm11,%ymm13
	vpaddq	%ymm13,%ymm8,%ymm8
	vpmuludq	160-128(%r9),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm0,%ymm0
	vpmuludq	192-128(%r9),%ymm11,%ymm14
	vpaddq	%ymm14,%ymm1,%ymm1
	vpmuludq	224-128(%r9),%ymm11,%ymm2
	vpbroadcastq	160-128(%r15),%ymm11
	vpaddq	352-448(%r12),%ymm2,%ymm2

	vmovdqu	%ymm6,192-192(%rbx)
	vmovdqu	%ymm7,224-192(%rbx)

	vpmuludq	128-128(%rsi),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	128-128(%r9),%ymm10,%ymm14
	vpaddq	%ymm14,%ymm0,%ymm0
	vpmuludq	160-128(%r9),%ymm10,%ymm13
	vpaddq	%ymm13,%ymm1,%ymm1
	vpmuludq	192-128(%r9),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	224-128(%r9),%ymm10,%ymm3
	vpbroadcastq	192-128(%r15),%ymm10
	vpaddq	384-448(%r12),%ymm3,%ymm3

	vmovdqu	%ymm8,256-192(%rbx)
	vmovdqu	%ymm0,288-192(%rbx)
	leaq	8(%rbx),%rbx

	vpmuludq	160-128(%rsi),%ymm11,%ymm13
	vpaddq	%ymm13,%ymm1,%ymm1
	vpmuludq	160-128(%r9),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	192-128(%r9),%ymm11,%ymm14
	vpaddq	%ymm14,%ymm3,%ymm3
	vpmuludq	224-128(%r9),%ymm11,%ymm4
	vpbroadcastq	224-128(%r15),%ymm11
	vpaddq	416-448(%r12),%ymm4,%ymm4

	vmovdqu	%ymm1,320-448(%r12)
	vmovdqu	%ymm2,352-448(%r12)

	vpmuludq	192-128(%rsi),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm3,%ymm3
	vpmuludq	192-128(%r9),%ymm10,%ymm14
	vpbroadcastq	256-128(%r15),%ymm0
	vpaddq	%ymm14,%ymm4,%ymm4
	vpmuludq	224-128(%r9),%ymm10,%ymm5
	vpbroadcastq	0+8-128(%r15),%ymm10
	vpaddq	448-448(%r12),%ymm5,%ymm5

	vmovdqu	%ymm3,384-448(%r12)
	vmovdqu	%ymm4,416-448(%r12)
	leaq	8(%r15),%r15

	vpmuludq	224-128(%rsi),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	224-128(%r9),%ymm11,%ymm6
	vpaddq	480-448(%r12),%ymm6,%ymm6

	vpmuludq	256-128(%rsi),%ymm0,%ymm7
	vmovdqu	%ymm5,448-448(%r12)
	vpaddq	512-448(%r12),%ymm7,%ymm7
	vmovdqu	%ymm6,480-448(%r12)
	vmovdqu	%ymm7,512-448(%r12)
	leaq	8(%r12),%r12

	decl	%r14d
	jnz	.LOOP_SQR_1024

	vmovdqu	256(%rsp),%ymm8
	vmovdqu	288(%rsp),%ymm1
	vmovdqu	320(%rsp),%ymm2
	leaq	192(%rsp),%rbx

	vpsrlq	$29,%ymm8,%ymm14
	vpand	%ymm15,%ymm8,%ymm8
	vpsrlq	$29,%ymm1,%ymm11
	vpand	%ymm15,%ymm1,%ymm1

	vpermq	$0x93,%ymm14,%ymm14
	vpxor	%ymm9,%ymm9,%ymm9
	vpermq	$0x93,%ymm11,%ymm11

	vpblendd	$3,%ymm9,%ymm14,%ymm10
	vpblendd	$3,%ymm14,%ymm11,%ymm14
	vpaddq	%ymm10,%ymm8,%ymm8
	vpblendd	$3,%ymm11,%ymm9,%ymm11
	vpaddq	%ymm14,%ymm1,%ymm1
	vpaddq	%ymm11,%ymm2,%ymm2
	vmovdqu	%ymm1,288-192(%rbx)
	vmovdqu	%ymm2,320-192(%rbx)

	movq	(%rsp),%rax
	movq	8(%rsp),%r10
	movq	16(%rsp),%r11
	movq	24(%rsp),%r12
	vmovdqu	32(%rsp),%ymm1
	vmovdqu	64-192(%rbx),%ymm2
	vmovdqu	96-192(%rbx),%ymm3
	vmovdqu	128-192(%rbx),%ymm4
	vmovdqu	160-192(%rbx),%ymm5
	vmovdqu	192-192(%rbx),%ymm6
	vmovdqu	224-192(%rbx),%ymm7

	movq	%rax,%r9
	imull	%ecx,%eax
	andl	$0x1fffffff,%eax
	vmovd	%eax,%xmm12

	movq	%rax,%rdx
	imulq	-128(%r13),%rax
	vpbroadcastq	%xmm12,%ymm12
	addq	%rax,%r9
	movq	%rdx,%rax
	imulq	8-128(%r13),%rax
	shrq	$29,%r9
	addq	%rax,%r10
	movq	%rdx,%rax
	imulq	16-128(%r13),%rax
	addq	%r9,%r10
	addq	%rax,%r11
	imulq	24-128(%r13),%rdx
	addq	%rdx,%r12

	movq	%r10,%rax
	imull	%ecx,%eax
	andl	$0x1fffffff,%eax

	movl	$9,%r14d
	jmp	.LOOP_REDUCE_1024

.p2align	5
.LOOP_REDUCE_1024:
	vmovd	%eax,%xmm13
	vpbroadcastq	%xmm13,%ymm13

	vpmuludq	32-128(%r13),%ymm12,%ymm10
	movq	%rax,%rdx
	imulq	-128(%r13),%rax
	vpaddq	%ymm10,%ymm1,%ymm1
	addq	%rax,%r10
	vpmuludq	64-128(%r13),%ymm12,%ymm14
	movq	%rdx,%rax
	imulq	8-128(%r13),%rax
	vpaddq	%ymm14,%ymm2,%ymm2
	vpmuludq	96-128(%r13),%ymm12,%ymm11
.byte	0x67
	addq	%rax,%r11
.byte	0x67
	movq	%rdx,%rax
	imulq	16-128(%r13),%rax
	shrq	$29,%r10
	vpaddq	%ymm11,%ymm3,%ymm3
	vpmuludq	128-128(%r13),%ymm12,%ymm10
	addq	%rax,%r12
	addq	%r10,%r11
	vpaddq	%ymm10,%ymm4,%ymm4
	vpmuludq	160-128(%r13),%ymm12,%ymm14
	movq	%r11,%rax
	imull	%ecx,%eax
	vpaddq	%ymm14,%ymm5,%ymm5
	vpmuludq	192-128(%r13),%ymm12,%ymm11
	andl	$0x1fffffff,%eax
	vpaddq	%ymm11,%ymm6,%ymm6
	vpmuludq	224-128(%r13),%ymm12,%ymm10
	vpaddq	%ymm10,%ymm7,%ymm7
	vpmuludq	256-128(%r13),%ymm12,%ymm14
	vmovd	%eax,%xmm12

	vpaddq	%ymm14,%ymm8,%ymm8

	vpbroadcastq	%xmm12,%ymm12

	vpmuludq	32-8-128(%r13),%ymm13,%ymm11
	vmovdqu	96-8-128(%r13),%ymm14
	movq	%rax,%rdx
	imulq	-128(%r13),%rax
	vpaddq	%ymm11,%ymm1,%ymm1
	vpmuludq	64-8-128(%r13),%ymm13,%ymm10
	vmovdqu	128-8-128(%r13),%ymm11
	addq	%rax,%r11
	movq	%rdx,%rax
	imulq	8-128(%r13),%rax
	vpaddq	%ymm10,%ymm2,%ymm2
	addq	%r12,%rax
	shrq	$29,%r11
	vpmuludq	%ymm13,%ymm14,%ymm14
	vmovdqu	160-8-128(%r13),%ymm10
	addq	%r11,%rax
	vpaddq	%ymm14,%ymm3,%ymm3
	vpmuludq	%ymm13,%ymm11,%ymm11
	vmovdqu	192-8-128(%r13),%ymm14
.byte	0x67
	movq	%rax,%r12
	imull	%ecx,%eax
	vpaddq	%ymm11,%ymm4,%ymm4
	vpmuludq	%ymm13,%ymm10,%ymm10
.byte	0xc4,0x41,0x7e,0x6f,0x9d,0x58,0x00,0x00,0x00
	andl	$0x1fffffff,%eax
	vpaddq	%ymm10,%ymm5,%ymm5
	vpmuludq	%ymm13,%ymm14,%ymm14
	vmovdqu	256-8-128(%r13),%ymm10
	vpaddq	%ymm14,%ymm6,%ymm6
	vpmuludq	%ymm13,%ymm11,%ymm11
	vmovdqu	288-8-128(%r13),%ymm9
	vmovd	%eax,%xmm0
	imulq	-128(%r13),%rax
	vpaddq	%ymm11,%ymm7,%ymm7
	vpmuludq	%ymm13,%ymm10,%ymm10
	vmovdqu	32-16-128(%r13),%ymm14
	vpbroadcastq	%xmm0,%ymm0
	vpaddq	%ymm10,%ymm8,%ymm8
	vpmuludq	%ymm13,%ymm9,%ymm9
	vmovdqu	64-16-128(%r13),%ymm11
	addq	%rax,%r12

	vmovdqu	32-24-128(%r13),%ymm13
	vpmuludq	%ymm12,%ymm14,%ymm14
	vmovdqu	96-16-128(%r13),%ymm10
	vpaddq	%ymm14,%ymm1,%ymm1
	vpmuludq	%ymm0,%ymm13,%ymm13
	vpmuludq	%ymm12,%ymm11,%ymm11
.byte	0xc4,0x41,0x7e,0x6f,0xb5,0xf0,0xff,0xff,0xff
	vpaddq	%ymm1,%ymm13,%ymm13
	vpaddq	%ymm11,%ymm2,%ymm2
	vpmuludq	%ymm12,%ymm10,%ymm10
	vmovdqu	160-16-128(%r13),%ymm11
.byte	0x67
	vmovq	%xmm13,%rax
	vmovdqu	%ymm13,(%rsp)
	vpaddq	%ymm10,%ymm3,%ymm3
	vpmuludq	%ymm12,%ymm14,%ymm14
	vmovdqu	192-16-128(%r13),%ymm10
	vpaddq	%ymm14,%ymm4,%ymm4
	vpmuludq	%ymm12,%ymm11,%ymm11
	vmovdqu	224-16-128(%r13),%ymm14
	vpaddq	%ymm11,%ymm5,%ymm5
	vpmuludq	%ymm12,%ymm10,%ymm10
	vmovdqu	256-16-128(%r13),%ymm11
	vpaddq	%ymm10,%ymm6,%ymm6
	vpmuludq	%ymm12,%ymm14,%ymm14
	shrq	$29,%r12
	vmovdqu	288-16-128(%r13),%ymm10
	addq	%r12,%rax
	vpaddq	%ymm14,%ymm7,%ymm7
	vpmuludq	%ymm12,%ymm11,%ymm11

	movq	%rax,%r9
	imull	%ecx,%eax
	vpaddq	%ymm11,%ymm8,%ymm8
	vpmuludq	%ymm12,%ymm10,%ymm10
	andl	$0x1fffffff,%eax
	vmovd	%eax,%xmm12
	vmovdqu	96-24-128(%r13),%ymm11
.byte	0x67
	vpaddq	%ymm10,%ymm9,%ymm9
	vpbroadcastq	%xmm12,%ymm12

	vpmuludq	64-24-128(%r13),%ymm0,%ymm14
	vmovdqu	128-24-128(%r13),%ymm10
	movq	%rax,%rdx
	imulq	-128(%r13),%rax
	movq	8(%rsp),%r10
	vpaddq	%ymm14,%ymm2,%ymm1
	vpmuludq	%ymm0,%ymm11,%ymm11
	vmovdqu	160-24-128(%r13),%ymm14
	addq	%rax,%r9
	movq	%rdx,%rax
	imulq	8-128(%r13),%rax
.byte	0x67
	shrq	$29,%r9
	movq	16(%rsp),%r11
	vpaddq	%ymm11,%ymm3,%ymm2
	vpmuludq	%ymm0,%ymm10,%ymm10
	vmovdqu	192-24-128(%r13),%ymm11
	addq	%rax,%r10
	movq	%rdx,%rax
	imulq	16-128(%r13),%rax
	vpaddq	%ymm10,%ymm4,%ymm3
	vpmuludq	%ymm0,%ymm14,%ymm14
	vmovdqu	224-24-128(%r13),%ymm10
	imulq	24-128(%r13),%rdx
	addq	%rax,%r11
	leaq	(%r9,%r10,1),%rax
	vpaddq	%ymm14,%ymm5,%ymm4
	vpmuludq	%ymm0,%ymm11,%ymm11
	vmovdqu	256-24-128(%r13),%ymm14
	movq	%rax,%r10
	imull	%ecx,%eax
	vpmuludq	%ymm0,%ymm10,%ymm10
	vpaddq	%ymm11,%ymm6,%ymm5
	vmovdqu	288-24-128(%r13),%ymm11
	andl	$0x1fffffff,%eax
	vpaddq	%ymm10,%ymm7,%ymm6
	vpmuludq	%ymm0,%ymm14,%ymm14
	addq	24(%rsp),%rdx
	vpaddq	%ymm14,%ymm8,%ymm7
	vpmuludq	%ymm0,%ymm11,%ymm11
	vpaddq	%ymm11,%ymm9,%ymm8
	vmovq	%r12,%xmm9
	movq	%rdx,%r12

	decl	%r14d
	jnz	.LOOP_REDUCE_1024
	leaq	448(%rsp),%r12
	vpaddq	%ymm9,%ymm13,%ymm0
	vpxor	%ymm9,%ymm9,%ymm9

	vpaddq	288-192(%rbx),%ymm0,%ymm0
	vpaddq	320-448(%r12),%ymm1,%ymm1
	vpaddq	352-448(%r12),%ymm2,%ymm2
	vpaddq	384-448(%r12),%ymm3,%ymm3
	vpaddq	416-448(%r12),%ymm4,%ymm4
	vpaddq	448-448(%r12),%ymm5,%ymm5
	vpaddq	480-448(%r12),%ymm6,%ymm6
	vpaddq	512-448(%r12),%ymm7,%ymm7
	vpaddq	544-448(%r12),%ymm8,%ymm8

	vpsrlq	$29,%ymm0,%ymm14
	vpand	%ymm15,%ymm0,%ymm0
	vpsrlq	$29,%ymm1,%ymm11
	vpand	%ymm15,%ymm1,%ymm1
	vpsrlq	$29,%ymm2,%ymm12
	vpermq	$0x93,%ymm14,%ymm14
	vpand	%ymm15,%ymm2,%ymm2
	vpsrlq	$29,%ymm3,%ymm13
	vpermq	$0x93,%ymm11,%ymm11
	vpand	%ymm15,%ymm3,%ymm3
	vpermq	$0x93,%ymm12,%ymm12

	vpblendd	$3,%ymm9,%ymm14,%ymm10
	vpermq	$0x93,%ymm13,%ymm13
	vpblendd	$3,%ymm14,%ymm11,%ymm14
	vpaddq	%ymm10,%ymm0,%ymm0
	vpblendd	$3,%ymm11,%ymm12,%ymm11
	vpaddq	%ymm14,%ymm1,%ymm1
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm11,%ymm2,%ymm2
	vpblendd	$3,%ymm13,%ymm9,%ymm13
	vpaddq	%ymm12,%ymm3,%ymm3
	vpaddq	%ymm13,%ymm4,%ymm4

	vpsrlq	$29,%ymm0,%ymm14
	vpand	%ymm15,%ymm0,%ymm0
	vpsrlq	$29,%ymm1,%ymm11
	vpand	%ymm15,%ymm1,%ymm1
	vpsrlq	$29,%ymm2,%ymm12
	vpermq	$0x93,%ymm14,%ymm14
	vpand	%ymm15,%ymm2,%ymm2
	vpsrlq	$29,%ymm3,%ymm13
	vpermq	$0x93,%ymm11,%ymm11
	vpand	%ymm15,%ymm3,%ymm3
	vpermq	$0x93,%ymm12,%ymm12

	vpblendd	$3,%ymm9,%ymm14,%ymm10
	vpermq	$0x93,%ymm13,%ymm13
	vpblendd	$3,%ymm14,%ymm11,%ymm14
	vpaddq	%ymm10,%ymm0,%ymm0
	vpblendd	$3,%ymm11,%ymm12,%ymm11
	vpaddq	%ymm14,%ymm1,%ymm1
	vmovdqu	%ymm0,0-128(%rdi)
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm11,%ymm2,%ymm2
	vmovdqu	%ymm1,32-128(%rdi)
	vpblendd	$3,%ymm13,%ymm9,%ymm13
	vpaddq	%ymm12,%ymm3,%ymm3
	vmovdqu	%ymm2,64-128(%rdi)
	vpaddq	%ymm13,%ymm4,%ymm4
	vmovdqu	%ymm3,96-128(%rdi)
	vpsrlq	$29,%ymm4,%ymm14
	vpand	%ymm15,%ymm4,%ymm4
	vpsrlq	$29,%ymm5,%ymm11
	vpand	%ymm15,%ymm5,%ymm5
	vpsrlq	$29,%ymm6,%ymm12
	vpermq	$0x93,%ymm14,%ymm14
	vpand	%ymm15,%ymm6,%ymm6
	vpsrlq	$29,%ymm7,%ymm13
	vpermq	$0x93,%ymm11,%ymm11
	vpand	%ymm15,%ymm7,%ymm7
	vpsrlq	$29,%ymm8,%ymm0
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm8,%ymm8
	vpermq	$0x93,%ymm13,%ymm13

	vpblendd	$3,%ymm9,%ymm14,%ymm10
	vpermq	$0x93,%ymm0,%ymm0
	vpblendd	$3,%ymm14,%ymm11,%ymm14
	vpaddq	%ymm10,%ymm4,%ymm4
	vpblendd	$3,%ymm11,%ymm12,%ymm11
	vpaddq	%ymm14,%ymm5,%ymm5
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm11,%ymm6,%ymm6
	vpblendd	$3,%ymm13,%ymm0,%ymm13
	vpaddq	%ymm12,%ymm7,%ymm7
	vpaddq	%ymm13,%ymm8,%ymm8

	vpsrlq	$29,%ymm4,%ymm14
	vpand	%ymm15,%ymm4,%ymm4
	vpsrlq	$29,%ymm5,%ymm11
	vpand	%ymm15,%ymm5,%ymm5
	vpsrlq	$29,%ymm6,%ymm12
	vpermq	$0x93,%ymm14,%ymm14
	vpand	%ymm15,%ymm6,%ymm6
	vpsrlq	$29,%ymm7,%ymm13
	vpermq	$0x93,%ymm11,%ymm11
	vpand	%ymm15,%ymm7,%ymm7
	vpsrlq	$29,%ymm8,%ymm0
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm8,%ymm8
	vpermq	$0x93,%ymm13,%ymm13

	vpblendd	$3,%ymm9,%ymm14,%ymm10
	vpermq	$0x93,%ymm0,%ymm0
	vpblendd	$3,%ymm14,%ymm11,%ymm14
	vpaddq	%ymm10,%ymm4,%ymm4
	vpblendd	$3,%ymm11,%ymm12,%ymm11
	vpaddq	%ymm14,%ymm5,%ymm5
	vmovdqu	%ymm4,128-128(%rdi)
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm11,%ymm6,%ymm6
	vmovdqu	%ymm5,160-128(%rdi)
	vpblendd	$3,%ymm13,%ymm0,%ymm13
	vpaddq	%ymm12,%ymm7,%ymm7
	vmovdqu	%ymm6,192-128(%rdi)
	vpaddq	%ymm13,%ymm8,%ymm8
	vmovdqu	%ymm7,224-128(%rdi)
	vmovdqu	%ymm8,256-128(%rdi)

	movq	%rdi,%rsi
	decl	%r8d
	jne	.LOOP_GRANDE_SQR_1024

	vzeroall
	movq	%rbp,%rax
	movaps	-216(%rax),%xmm6
	movaps	-200(%rax),%xmm7
	movaps	-184(%rax),%xmm8
	movaps	-168(%rax),%xmm9
	movaps	-152(%rax),%xmm10
	movaps	-136(%rax),%xmm11
	movaps	-120(%rax),%xmm12
	movaps	-104(%rax),%xmm13
	movaps	-88(%rax),%xmm14
	movaps	-72(%rax),%xmm15
	movq	-48(%rax),%r15
	movq	-40(%rax),%r14
	movq	-32(%rax),%r13
	movq	-24(%rax),%r12
	movq	-16(%rax),%rbp
	movq	-8(%rax),%rbx
	leaq	(%rax),%rsp
.Lsqr_1024_epilogue:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3
.LSEH_end_rsaz_1024_sqr_avx2:
.globl	rsaz_1024_mul_avx2
.def	rsaz_1024_mul_avx2;	.scl 2;	.type 32;	.endef
.p2align	6
rsaz_1024_mul_avx2:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_rsaz_1024_mul_avx2:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx
	movq	40(%rsp),%r8

	leaq	(%rsp),%rax
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	vzeroupper
	leaq	-168(%rsp),%rsp
	vmovaps	%xmm6,-216(%rax)
	vmovaps	%xmm7,-200(%rax)
	vmovaps	%xmm8,-184(%rax)
	vmovaps	%xmm9,-168(%rax)
	vmovaps	%xmm10,-152(%rax)
	vmovaps	%xmm11,-136(%rax)
	vmovaps	%xmm12,-120(%rax)
	vmovaps	%xmm13,-104(%rax)
	vmovaps	%xmm14,-88(%rax)
	vmovaps	%xmm15,-72(%rax)
.Lmul_1024_body:
	movq	%rax,%rbp
	vzeroall
	movq	%rdx,%r13
	subq	$64,%rsp






.byte	0x67,0x67
	movq	%rsi,%r15
	andq	$4095,%r15
	addq	$320,%r15
	shrq	$12,%r15
	movq	%rsi,%r15
	cmovnzq	%r13,%rsi
	cmovnzq	%r15,%r13

	movq	%rcx,%r15
	subq	$-128,%rsi
	subq	$-128,%rcx
	subq	$-128,%rdi

	andq	$4095,%r15
	addq	$320,%r15
.byte	0x67,0x67
	shrq	$12,%r15
	jz	.Lmul_1024_no_n_copy





	subq	$320,%rsp
	vmovdqu	0-128(%rcx),%ymm0
	andq	$-512,%rsp
	vmovdqu	32-128(%rcx),%ymm1
	vmovdqu	64-128(%rcx),%ymm2
	vmovdqu	96-128(%rcx),%ymm3
	vmovdqu	128-128(%rcx),%ymm4
	vmovdqu	160-128(%rcx),%ymm5
	vmovdqu	192-128(%rcx),%ymm6
	vmovdqu	224-128(%rcx),%ymm7
	vmovdqu	256-128(%rcx),%ymm8
	leaq	64+128(%rsp),%rcx
	vmovdqu	%ymm0,0-128(%rcx)
	vpxor	%ymm0,%ymm0,%ymm0
	vmovdqu	%ymm1,32-128(%rcx)
	vpxor	%ymm1,%ymm1,%ymm1
	vmovdqu	%ymm2,64-128(%rcx)
	vpxor	%ymm2,%ymm2,%ymm2
	vmovdqu	%ymm3,96-128(%rcx)
	vpxor	%ymm3,%ymm3,%ymm3
	vmovdqu	%ymm4,128-128(%rcx)
	vpxor	%ymm4,%ymm4,%ymm4
	vmovdqu	%ymm5,160-128(%rcx)
	vpxor	%ymm5,%ymm5,%ymm5
	vmovdqu	%ymm6,192-128(%rcx)
	vpxor	%ymm6,%ymm6,%ymm6
	vmovdqu	%ymm7,224-128(%rcx)
	vpxor	%ymm7,%ymm7,%ymm7
	vmovdqu	%ymm8,256-128(%rcx)
	vmovdqa	%ymm0,%ymm8
	vmovdqu	%ymm9,288-128(%rcx)
.Lmul_1024_no_n_copy:
	andq	$-64,%rsp

	movq	(%r13),%rbx
	vpbroadcastq	(%r13),%ymm10
	vmovdqu	%ymm0,(%rsp)
	xorq	%r9,%r9
.byte	0x67
	xorq	%r10,%r10
	xorq	%r11,%r11
	xorq	%r12,%r12

	vmovdqu	.Land_mask(%rip),%ymm15
	movl	$9,%r14d
	vmovdqu	%ymm9,288-128(%rdi)
	jmp	.Loop_mul_1024

.p2align	5
.Loop_mul_1024:
	vpsrlq	$29,%ymm3,%ymm9
	movq	%rbx,%rax
	imulq	-128(%rsi),%rax
	addq	%r9,%rax
	movq	%rbx,%r10
	imulq	8-128(%rsi),%r10
	addq	8(%rsp),%r10

	movq	%rax,%r9
	imull	%r8d,%eax
	andl	$0x1fffffff,%eax

	movq	%rbx,%r11
	imulq	16-128(%rsi),%r11
	addq	16(%rsp),%r11

	movq	%rbx,%r12
	imulq	24-128(%rsi),%r12
	addq	24(%rsp),%r12
	vpmuludq	32-128(%rsi),%ymm10,%ymm0
	vmovd	%eax,%xmm11
	vpaddq	%ymm0,%ymm1,%ymm1
	vpmuludq	64-128(%rsi),%ymm10,%ymm12
	vpbroadcastq	%xmm11,%ymm11
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	96-128(%rsi),%ymm10,%ymm13
	vpand	%ymm15,%ymm3,%ymm3
	vpaddq	%ymm13,%ymm3,%ymm3
	vpmuludq	128-128(%rsi),%ymm10,%ymm0
	vpaddq	%ymm0,%ymm4,%ymm4
	vpmuludq	160-128(%rsi),%ymm10,%ymm12
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	192-128(%rsi),%ymm10,%ymm13
	vpaddq	%ymm13,%ymm6,%ymm6
	vpmuludq	224-128(%rsi),%ymm10,%ymm0
	vpermq	$0x93,%ymm9,%ymm9
	vpaddq	%ymm0,%ymm7,%ymm7
	vpmuludq	256-128(%rsi),%ymm10,%ymm12
	vpbroadcastq	8(%r13),%ymm10
	vpaddq	%ymm12,%ymm8,%ymm8

	movq	%rax,%rdx
	imulq	-128(%rcx),%rax
	addq	%rax,%r9
	movq	%rdx,%rax
	imulq	8-128(%rcx),%rax
	addq	%rax,%r10
	movq	%rdx,%rax
	imulq	16-128(%rcx),%rax
	addq	%rax,%r11
	shrq	$29,%r9
	imulq	24-128(%rcx),%rdx
	addq	%rdx,%r12
	addq	%r9,%r10

	vpmuludq	32-128(%rcx),%ymm11,%ymm13
	vmovq	%xmm10,%rbx
	vpaddq	%ymm13,%ymm1,%ymm1
	vpmuludq	64-128(%rcx),%ymm11,%ymm0
	vpaddq	%ymm0,%ymm2,%ymm2
	vpmuludq	96-128(%rcx),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm3,%ymm3
	vpmuludq	128-128(%rcx),%ymm11,%ymm13
	vpaddq	%ymm13,%ymm4,%ymm4
	vpmuludq	160-128(%rcx),%ymm11,%ymm0
	vpaddq	%ymm0,%ymm5,%ymm5
	vpmuludq	192-128(%rcx),%ymm11,%ymm12
	vpaddq	%ymm12,%ymm6,%ymm6
	vpmuludq	224-128(%rcx),%ymm11,%ymm13
	vpblendd	$3,%ymm14,%ymm9,%ymm9
	vpaddq	%ymm13,%ymm7,%ymm7
	vpmuludq	256-128(%rcx),%ymm11,%ymm0
	vpaddq	%ymm9,%ymm3,%ymm3
	vpaddq	%ymm0,%ymm8,%ymm8

	movq	%rbx,%rax
	imulq	-128(%rsi),%rax
	addq	%rax,%r10
	vmovdqu	-8+32-128(%rsi),%ymm12
	movq	%rbx,%rax
	imulq	8-128(%rsi),%rax
	addq	%rax,%r11
	vmovdqu	-8+64-128(%rsi),%ymm13

	movq	%r10,%rax
	imull	%r8d,%eax
	andl	$0x1fffffff,%eax

	imulq	16-128(%rsi),%rbx
	addq	%rbx,%r12
	vpmuludq	%ymm10,%ymm12,%ymm12
	vmovd	%eax,%xmm11
	vmovdqu	-8+96-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm1,%ymm1
	vpmuludq	%ymm10,%ymm13,%ymm13
	vpbroadcastq	%xmm11,%ymm11
	vmovdqu	-8+128-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm2,%ymm2
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-8+160-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm3,%ymm3
	vpmuludq	%ymm10,%ymm12,%ymm12
	vmovdqu	-8+192-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm4,%ymm4
	vpmuludq	%ymm10,%ymm13,%ymm13
	vmovdqu	-8+224-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm5,%ymm5
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-8+256-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm6,%ymm6
	vpmuludq	%ymm10,%ymm12,%ymm12
	vmovdqu	-8+288-128(%rsi),%ymm9
	vpaddq	%ymm12,%ymm7,%ymm7
	vpmuludq	%ymm10,%ymm13,%ymm13
	vpaddq	%ymm13,%ymm8,%ymm8
	vpmuludq	%ymm10,%ymm9,%ymm9
	vpbroadcastq	16(%r13),%ymm10

	movq	%rax,%rdx
	imulq	-128(%rcx),%rax
	addq	%rax,%r10
	vmovdqu	-8+32-128(%rcx),%ymm0
	movq	%rdx,%rax
	imulq	8-128(%rcx),%rax
	addq	%rax,%r11
	vmovdqu	-8+64-128(%rcx),%ymm12
	shrq	$29,%r10
	imulq	16-128(%rcx),%rdx
	addq	%rdx,%r12
	addq	%r10,%r11

	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovq	%xmm10,%rbx
	vmovdqu	-8+96-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm1,%ymm1
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-8+128-128(%rcx),%ymm0
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-8+160-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm3,%ymm3
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-8+192-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm4,%ymm4
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-8+224-128(%rcx),%ymm0
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-8+256-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm6,%ymm6
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-8+288-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm7,%ymm7
	vpmuludq	%ymm11,%ymm12,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	%ymm11,%ymm13,%ymm13
	vpaddq	%ymm13,%ymm9,%ymm9

	vmovdqu	-16+32-128(%rsi),%ymm0
	movq	%rbx,%rax
	imulq	-128(%rsi),%rax
	addq	%r11,%rax

	vmovdqu	-16+64-128(%rsi),%ymm12
	movq	%rax,%r11
	imull	%r8d,%eax
	andl	$0x1fffffff,%eax

	imulq	8-128(%rsi),%rbx
	addq	%rbx,%r12
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovd	%eax,%xmm11
	vmovdqu	-16+96-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm1,%ymm1
	vpmuludq	%ymm10,%ymm12,%ymm12
	vpbroadcastq	%xmm11,%ymm11
	vmovdqu	-16+128-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	%ymm10,%ymm13,%ymm13
	vmovdqu	-16+160-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm3,%ymm3
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-16+192-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm4,%ymm4
	vpmuludq	%ymm10,%ymm12,%ymm12
	vmovdqu	-16+224-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	%ymm10,%ymm13,%ymm13
	vmovdqu	-16+256-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm6,%ymm6
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-16+288-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm7,%ymm7
	vpmuludq	%ymm10,%ymm12,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	%ymm10,%ymm13,%ymm13
	vpbroadcastq	24(%r13),%ymm10
	vpaddq	%ymm13,%ymm9,%ymm9

	vmovdqu	-16+32-128(%rcx),%ymm0
	movq	%rax,%rdx
	imulq	-128(%rcx),%rax
	addq	%rax,%r11
	vmovdqu	-16+64-128(%rcx),%ymm12
	imulq	8-128(%rcx),%rdx
	addq	%rdx,%r12
	shrq	$29,%r11

	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovq	%xmm10,%rbx
	vmovdqu	-16+96-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm1,%ymm1
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-16+128-128(%rcx),%ymm0
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-16+160-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm3,%ymm3
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-16+192-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm4,%ymm4
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-16+224-128(%rcx),%ymm0
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-16+256-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm6,%ymm6
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-16+288-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm7,%ymm7
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-24+32-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-24+64-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm9,%ymm9

	addq	%r11,%r12
	imulq	-128(%rsi),%rbx
	addq	%rbx,%r12

	movq	%r12,%rax
	imull	%r8d,%eax
	andl	$0x1fffffff,%eax

	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovd	%eax,%xmm11
	vmovdqu	-24+96-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm1,%ymm1
	vpmuludq	%ymm10,%ymm12,%ymm12
	vpbroadcastq	%xmm11,%ymm11
	vmovdqu	-24+128-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm2,%ymm2
	vpmuludq	%ymm10,%ymm13,%ymm13
	vmovdqu	-24+160-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm3,%ymm3
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-24+192-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm4,%ymm4
	vpmuludq	%ymm10,%ymm12,%ymm12
	vmovdqu	-24+224-128(%rsi),%ymm0
	vpaddq	%ymm12,%ymm5,%ymm5
	vpmuludq	%ymm10,%ymm13,%ymm13
	vmovdqu	-24+256-128(%rsi),%ymm12
	vpaddq	%ymm13,%ymm6,%ymm6
	vpmuludq	%ymm10,%ymm0,%ymm0
	vmovdqu	-24+288-128(%rsi),%ymm13
	vpaddq	%ymm0,%ymm7,%ymm7
	vpmuludq	%ymm10,%ymm12,%ymm12
	vpaddq	%ymm12,%ymm8,%ymm8
	vpmuludq	%ymm10,%ymm13,%ymm13
	vpbroadcastq	32(%r13),%ymm10
	vpaddq	%ymm13,%ymm9,%ymm9
	addq	$32,%r13

	vmovdqu	-24+32-128(%rcx),%ymm0
	imulq	-128(%rcx),%rax
	addq	%rax,%r12
	shrq	$29,%r12

	vmovdqu	-24+64-128(%rcx),%ymm12
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovq	%xmm10,%rbx
	vmovdqu	-24+96-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm1,%ymm0
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	%ymm0,(%rsp)
	vpaddq	%ymm12,%ymm2,%ymm1
	vmovdqu	-24+128-128(%rcx),%ymm0
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-24+160-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm3,%ymm2
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-24+192-128(%rcx),%ymm13
	vpaddq	%ymm0,%ymm4,%ymm3
	vpmuludq	%ymm11,%ymm12,%ymm12
	vmovdqu	-24+224-128(%rcx),%ymm0
	vpaddq	%ymm12,%ymm5,%ymm4
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovdqu	-24+256-128(%rcx),%ymm12
	vpaddq	%ymm13,%ymm6,%ymm5
	vpmuludq	%ymm11,%ymm0,%ymm0
	vmovdqu	-24+288-128(%rcx),%ymm13
	movq	%r12,%r9
	vpaddq	%ymm0,%ymm7,%ymm6
	vpmuludq	%ymm11,%ymm12,%ymm12
	addq	(%rsp),%r9
	vpaddq	%ymm12,%ymm8,%ymm7
	vpmuludq	%ymm11,%ymm13,%ymm13
	vmovq	%r12,%xmm12
	vpaddq	%ymm13,%ymm9,%ymm8

	decl	%r14d
	jnz	.Loop_mul_1024
	vpermq	$0,%ymm15,%ymm15
	vpaddq	(%rsp),%ymm12,%ymm0

	vpsrlq	$29,%ymm0,%ymm12
	vpand	%ymm15,%ymm0,%ymm0
	vpsrlq	$29,%ymm1,%ymm13
	vpand	%ymm15,%ymm1,%ymm1
	vpsrlq	$29,%ymm2,%ymm10
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm2,%ymm2
	vpsrlq	$29,%ymm3,%ymm11
	vpermq	$0x93,%ymm13,%ymm13
	vpand	%ymm15,%ymm3,%ymm3

	vpblendd	$3,%ymm14,%ymm12,%ymm9
	vpermq	$0x93,%ymm10,%ymm10
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpermq	$0x93,%ymm11,%ymm11
	vpaddq	%ymm9,%ymm0,%ymm0
	vpblendd	$3,%ymm13,%ymm10,%ymm13
	vpaddq	%ymm12,%ymm1,%ymm1
	vpblendd	$3,%ymm10,%ymm11,%ymm10
	vpaddq	%ymm13,%ymm2,%ymm2
	vpblendd	$3,%ymm11,%ymm14,%ymm11
	vpaddq	%ymm10,%ymm3,%ymm3
	vpaddq	%ymm11,%ymm4,%ymm4

	vpsrlq	$29,%ymm0,%ymm12
	vpand	%ymm15,%ymm0,%ymm0
	vpsrlq	$29,%ymm1,%ymm13
	vpand	%ymm15,%ymm1,%ymm1
	vpsrlq	$29,%ymm2,%ymm10
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm2,%ymm2
	vpsrlq	$29,%ymm3,%ymm11
	vpermq	$0x93,%ymm13,%ymm13
	vpand	%ymm15,%ymm3,%ymm3
	vpermq	$0x93,%ymm10,%ymm10

	vpblendd	$3,%ymm14,%ymm12,%ymm9
	vpermq	$0x93,%ymm11,%ymm11
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm9,%ymm0,%ymm0
	vpblendd	$3,%ymm13,%ymm10,%ymm13
	vpaddq	%ymm12,%ymm1,%ymm1
	vpblendd	$3,%ymm10,%ymm11,%ymm10
	vpaddq	%ymm13,%ymm2,%ymm2
	vpblendd	$3,%ymm11,%ymm14,%ymm11
	vpaddq	%ymm10,%ymm3,%ymm3
	vpaddq	%ymm11,%ymm4,%ymm4

	vmovdqu	%ymm0,0-128(%rdi)
	vmovdqu	%ymm1,32-128(%rdi)
	vmovdqu	%ymm2,64-128(%rdi)
	vmovdqu	%ymm3,96-128(%rdi)
	vpsrlq	$29,%ymm4,%ymm12
	vpand	%ymm15,%ymm4,%ymm4
	vpsrlq	$29,%ymm5,%ymm13
	vpand	%ymm15,%ymm5,%ymm5
	vpsrlq	$29,%ymm6,%ymm10
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm6,%ymm6
	vpsrlq	$29,%ymm7,%ymm11
	vpermq	$0x93,%ymm13,%ymm13
	vpand	%ymm15,%ymm7,%ymm7
	vpsrlq	$29,%ymm8,%ymm0
	vpermq	$0x93,%ymm10,%ymm10
	vpand	%ymm15,%ymm8,%ymm8
	vpermq	$0x93,%ymm11,%ymm11

	vpblendd	$3,%ymm14,%ymm12,%ymm9
	vpermq	$0x93,%ymm0,%ymm0
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm9,%ymm4,%ymm4
	vpblendd	$3,%ymm13,%ymm10,%ymm13
	vpaddq	%ymm12,%ymm5,%ymm5
	vpblendd	$3,%ymm10,%ymm11,%ymm10
	vpaddq	%ymm13,%ymm6,%ymm6
	vpblendd	$3,%ymm11,%ymm0,%ymm11
	vpaddq	%ymm10,%ymm7,%ymm7
	vpaddq	%ymm11,%ymm8,%ymm8

	vpsrlq	$29,%ymm4,%ymm12
	vpand	%ymm15,%ymm4,%ymm4
	vpsrlq	$29,%ymm5,%ymm13
	vpand	%ymm15,%ymm5,%ymm5
	vpsrlq	$29,%ymm6,%ymm10
	vpermq	$0x93,%ymm12,%ymm12
	vpand	%ymm15,%ymm6,%ymm6
	vpsrlq	$29,%ymm7,%ymm11
	vpermq	$0x93,%ymm13,%ymm13
	vpand	%ymm15,%ymm7,%ymm7
	vpsrlq	$29,%ymm8,%ymm0
	vpermq	$0x93,%ymm10,%ymm10
	vpand	%ymm15,%ymm8,%ymm8
	vpermq	$0x93,%ymm11,%ymm11

	vpblendd	$3,%ymm14,%ymm12,%ymm9
	vpermq	$0x93,%ymm0,%ymm0
	vpblendd	$3,%ymm12,%ymm13,%ymm12
	vpaddq	%ymm9,%ymm4,%ymm4
	vpblendd	$3,%ymm13,%ymm10,%ymm13
	vpaddq	%ymm12,%ymm5,%ymm5
	vpblendd	$3,%ymm10,%ymm11,%ymm10
	vpaddq	%ymm13,%ymm6,%ymm6
	vpblendd	$3,%ymm11,%ymm0,%ymm11
	vpaddq	%ymm10,%ymm7,%ymm7
	vpaddq	%ymm11,%ymm8,%ymm8

	vmovdqu	%ymm4,128-128(%rdi)
	vmovdqu	%ymm5,160-128(%rdi)
	vmovdqu	%ymm6,192-128(%rdi)
	vmovdqu	%ymm7,224-128(%rdi)
	vmovdqu	%ymm8,256-128(%rdi)
	vzeroupper

	movq	%rbp,%rax
	movaps	-216(%rax),%xmm6
	movaps	-200(%rax),%xmm7
	movaps	-184(%rax),%xmm8
	movaps	-168(%rax),%xmm9
	movaps	-152(%rax),%xmm10
	movaps	-136(%rax),%xmm11
	movaps	-120(%rax),%xmm12
	movaps	-104(%rax),%xmm13
	movaps	-88(%rax),%xmm14
	movaps	-72(%rax),%xmm15
	movq	-48(%rax),%r15
	movq	-40(%rax),%r14
	movq	-32(%rax),%r13
	movq	-24(%rax),%r12
	movq	-16(%rax),%rbp
	movq	-8(%rax),%rbx
	leaq	(%rax),%rsp
.Lmul_1024_epilogue:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3
.LSEH_end_rsaz_1024_mul_avx2:
.globl	rsaz_1024_red2norm_avx2
.def	rsaz_1024_red2norm_avx2;	.scl 2;	.type 32;	.endef
.p2align	5
rsaz_1024_red2norm_avx2:
	subq	$-128,%rdx
	xorq	%rax,%rax
	movq	-128(%rdx),%r8
	movq	-120(%rdx),%r9
	movq	-112(%rdx),%r10
	shlq	$0,%r8
	shlq	$29,%r9
	movq	%r10,%r11
	shlq	$58,%r10
	shrq	$6,%r11
	addq	%r8,%rax
	addq	%r9,%rax
	addq	%r10,%rax
	adcq	$0,%r11
	movq	%rax,0(%rcx)
	movq	%r11,%rax
	movq	-104(%rdx),%r8
	movq	-96(%rdx),%r9
	shlq	$23,%r8
	movq	%r9,%r10
	shlq	$52,%r9
	shrq	$12,%r10
	addq	%r8,%rax
	addq	%r9,%rax
	adcq	$0,%r10
	movq	%rax,8(%rcx)
	movq	%r10,%rax
	movq	-88(%rdx),%r11
	movq	-80(%rdx),%r8
	shlq	$17,%r11
	movq	%r8,%r9
	shlq	$46,%r8
	shrq	$18,%r9
	addq	%r11,%rax
	addq	%r8,%rax
	adcq	$0,%r9
	movq	%rax,16(%rcx)
	movq	%r9,%rax
	movq	-72(%rdx),%r10
	movq	-64(%rdx),%r11
	shlq	$11,%r10
	movq	%r11,%r8
	shlq	$40,%r11
	shrq	$24,%r8
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,24(%rcx)
	movq	%r8,%rax
	movq	-56(%rdx),%r9
	movq	-48(%rdx),%r10
	movq	-40(%rdx),%r11
	shlq	$5,%r9
	shlq	$34,%r10
	movq	%r11,%r8
	shlq	$63,%r11
	shrq	$1,%r8
	addq	%r9,%rax
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,32(%rcx)
	movq	%r8,%rax
	movq	-32(%rdx),%r9
	movq	-24(%rdx),%r10
	shlq	$28,%r9
	movq	%r10,%r11
	shlq	$57,%r10
	shrq	$7,%r11
	addq	%r9,%rax
	addq	%r10,%rax
	adcq	$0,%r11
	movq	%rax,40(%rcx)
	movq	%r11,%rax
	movq	-16(%rdx),%r8
	movq	-8(%rdx),%r9
	shlq	$22,%r8
	movq	%r9,%r10
	shlq	$51,%r9
	shrq	$13,%r10
	addq	%r8,%rax
	addq	%r9,%rax
	adcq	$0,%r10
	movq	%rax,48(%rcx)
	movq	%r10,%rax
	movq	0(%rdx),%r11
	movq	8(%rdx),%r8
	shlq	$16,%r11
	movq	%r8,%r9
	shlq	$45,%r8
	shrq	$19,%r9
	addq	%r11,%rax
	addq	%r8,%rax
	adcq	$0,%r9
	movq	%rax,56(%rcx)
	movq	%r9,%rax
	movq	16(%rdx),%r10
	movq	24(%rdx),%r11
	shlq	$10,%r10
	movq	%r11,%r8
	shlq	$39,%r11
	shrq	$25,%r8
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,64(%rcx)
	movq	%r8,%rax
	movq	32(%rdx),%r9
	movq	40(%rdx),%r10
	movq	48(%rdx),%r11
	shlq	$4,%r9
	shlq	$33,%r10
	movq	%r11,%r8
	shlq	$62,%r11
	shrq	$2,%r8
	addq	%r9,%rax
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,72(%rcx)
	movq	%r8,%rax
	movq	56(%rdx),%r9
	movq	64(%rdx),%r10
	shlq	$27,%r9
	movq	%r10,%r11
	shlq	$56,%r10
	shrq	$8,%r11
	addq	%r9,%rax
	addq	%r10,%rax
	adcq	$0,%r11
	movq	%rax,80(%rcx)
	movq	%r11,%rax
	movq	72(%rdx),%r8
	movq	80(%rdx),%r9
	shlq	$21,%r8
	movq	%r9,%r10
	shlq	$50,%r9
	shrq	$14,%r10
	addq	%r8,%rax
	addq	%r9,%rax
	adcq	$0,%r10
	movq	%rax,88(%rcx)
	movq	%r10,%rax
	movq	88(%rdx),%r11
	movq	96(%rdx),%r8
	shlq	$15,%r11
	movq	%r8,%r9
	shlq	$44,%r8
	shrq	$20,%r9
	addq	%r11,%rax
	addq	%r8,%rax
	adcq	$0,%r9
	movq	%rax,96(%rcx)
	movq	%r9,%rax
	movq	104(%rdx),%r10
	movq	112(%rdx),%r11
	shlq	$9,%r10
	movq	%r11,%r8
	shlq	$38,%r11
	shrq	$26,%r8
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,104(%rcx)
	movq	%r8,%rax
	movq	120(%rdx),%r9
	movq	128(%rdx),%r10
	movq	136(%rdx),%r11
	shlq	$3,%r9
	shlq	$32,%r10
	movq	%r11,%r8
	shlq	$61,%r11
	shrq	$3,%r8
	addq	%r9,%rax
	addq	%r10,%rax
	addq	%r11,%rax
	adcq	$0,%r8
	movq	%rax,112(%rcx)
	movq	%r8,%rax
	movq	144(%rdx),%r9
	movq	152(%rdx),%r10
	shlq	$26,%r9
	movq	%r10,%r11
	shlq	$55,%r10
	shrq	$9,%r11
	addq	%r9,%rax
	addq	%r10,%rax
	adcq	$0,%r11
	movq	%rax,120(%rcx)
	movq	%r11,%rax
	.byte	0xf3,0xc3


.globl	rsaz_1024_norm2red_avx2
.def	rsaz_1024_norm2red_avx2;	.scl 2;	.type 32;	.endef
.p2align	5
rsaz_1024_norm2red_avx2:
	subq	$-128,%rcx
	movq	(%rdx),%r8
	movl	$0x1fffffff,%eax
	movq	8(%rdx),%r9
	movq	%r8,%r11
	shrq	$0,%r11
	andq	%rax,%r11
	movq	%r11,-128(%rcx)
	movq	%r8,%r10
	shrq	$29,%r10
	andq	%rax,%r10
	movq	%r10,-120(%rcx)
	shrdq	$58,%r9,%r8
	andq	%rax,%r8
	movq	%r8,-112(%rcx)
	movq	16(%rdx),%r10
	movq	%r9,%r8
	shrq	$23,%r8
	andq	%rax,%r8
	movq	%r8,-104(%rcx)
	shrdq	$52,%r10,%r9
	andq	%rax,%r9
	movq	%r9,-96(%rcx)
	movq	24(%rdx),%r11
	movq	%r10,%r9
	shrq	$17,%r9
	andq	%rax,%r9
	movq	%r9,-88(%rcx)
	shrdq	$46,%r11,%r10
	andq	%rax,%r10
	movq	%r10,-80(%rcx)
	movq	32(%rdx),%r8
	movq	%r11,%r10
	shrq	$11,%r10
	andq	%rax,%r10
	movq	%r10,-72(%rcx)
	shrdq	$40,%r8,%r11
	andq	%rax,%r11
	movq	%r11,-64(%rcx)
	movq	40(%rdx),%r9
	movq	%r8,%r11
	shrq	$5,%r11
	andq	%rax,%r11
	movq	%r11,-56(%rcx)
	movq	%r8,%r10
	shrq	$34,%r10
	andq	%rax,%r10
	movq	%r10,-48(%rcx)
	shrdq	$63,%r9,%r8
	andq	%rax,%r8
	movq	%r8,-40(%rcx)
	movq	48(%rdx),%r10
	movq	%r9,%r8
	shrq	$28,%r8
	andq	%rax,%r8
	movq	%r8,-32(%rcx)
	shrdq	$57,%r10,%r9
	andq	%rax,%r9
	movq	%r9,-24(%rcx)
	movq	56(%rdx),%r11
	movq	%r10,%r9
	shrq	$22,%r9
	andq	%rax,%r9
	movq	%r9,-16(%rcx)
	shrdq	$51,%r11,%r10
	andq	%rax,%r10
	movq	%r10,-8(%rcx)
	movq	64(%rdx),%r8
	movq	%r11,%r10
	shrq	$16,%r10
	andq	%rax,%r10
	movq	%r10,0(%rcx)
	shrdq	$45,%r8,%r11
	andq	%rax,%r11
	movq	%r11,8(%rcx)
	movq	72(%rdx),%r9
	movq	%r8,%r11
	shrq	$10,%r11
	andq	%rax,%r11
	movq	%r11,16(%rcx)
	shrdq	$39,%r9,%r8
	andq	%rax,%r8
	movq	%r8,24(%rcx)
	movq	80(%rdx),%r10
	movq	%r9,%r8
	shrq	$4,%r8
	andq	%rax,%r8
	movq	%r8,32(%rcx)
	movq	%r9,%r11
	shrq	$33,%r11
	andq	%rax,%r11
	movq	%r11,40(%rcx)
	shrdq	$62,%r10,%r9
	andq	%rax,%r9
	movq	%r9,48(%rcx)
	movq	88(%rdx),%r11
	movq	%r10,%r9
	shrq	$27,%r9
	andq	%rax,%r9
	movq	%r9,56(%rcx)
	shrdq	$56,%r11,%r10
	andq	%rax,%r10
	movq	%r10,64(%rcx)
	movq	96(%rdx),%r8
	movq	%r11,%r10
	shrq	$21,%r10
	andq	%rax,%r10
	movq	%r10,72(%rcx)
	shrdq	$50,%r8,%r11
	andq	%rax,%r11
	movq	%r11,80(%rcx)
	movq	104(%rdx),%r9
	movq	%r8,%r11
	shrq	$15,%r11
	andq	%rax,%r11
	movq	%r11,88(%rcx)
	shrdq	$44,%r9,%r8
	andq	%rax,%r8
	movq	%r8,96(%rcx)
	movq	112(%rdx),%r10
	movq	%r9,%r8
	shrq	$9,%r8
	andq	%rax,%r8
	movq	%r8,104(%rcx)
	shrdq	$38,%r10,%r9
	andq	%rax,%r9
	movq	%r9,112(%rcx)
	movq	120(%rdx),%r11
	movq	%r10,%r9
	shrq	$3,%r9
	andq	%rax,%r9
	movq	%r9,120(%rcx)
	movq	%r10,%r8
	shrq	$32,%r8
	andq	%rax,%r8
	movq	%r8,128(%rcx)
	shrdq	$61,%r11,%r10
	andq	%rax,%r10
	movq	%r10,136(%rcx)
	xorq	%r8,%r8
	movq	%r11,%r10
	shrq	$26,%r10
	andq	%rax,%r10
	movq	%r10,144(%rcx)
	shrdq	$55,%r8,%r11
	andq	%rax,%r11
	movq	%r11,152(%rcx)
	movq	%r8,160(%rcx)
	movq	%r8,168(%rcx)
	movq	%r8,176(%rcx)
	movq	%r8,184(%rcx)
	.byte	0xf3,0xc3

.globl	rsaz_1024_scatter5_avx2
.def	rsaz_1024_scatter5_avx2;	.scl 2;	.type 32;	.endef
.p2align	5
rsaz_1024_scatter5_avx2:
	vzeroupper
	vmovdqu	.Lscatter_permd(%rip),%ymm5
	shll	$4,%r8d
	leaq	(%rcx,%r8,1),%rcx
	movl	$9,%eax
	jmp	.Loop_scatter_1024

.p2align	5
.Loop_scatter_1024:
	vmovdqu	(%rdx),%ymm0
	leaq	32(%rdx),%rdx
	vpermd	%ymm0,%ymm5,%ymm0
	vmovdqu	%xmm0,(%rcx)
	leaq	512(%rcx),%rcx
	decl	%eax
	jnz	.Loop_scatter_1024

	vzeroupper
	.byte	0xf3,0xc3


.globl	rsaz_1024_gather5_avx2
.def	rsaz_1024_gather5_avx2;	.scl 2;	.type 32;	.endef
.p2align	5
rsaz_1024_gather5_avx2:
	vzeroupper
	movq	%rsp,%r11
	leaq	-136(%rsp),%rax
.LSEH_begin_rsaz_1024_gather5:

.byte	0x48,0x8d,0x60,0xe0
.byte	0xc5,0xf8,0x29,0x70,0xe0
.byte	0xc5,0xf8,0x29,0x78,0xf0
.byte	0xc5,0x78,0x29,0x40,0x00
.byte	0xc5,0x78,0x29,0x48,0x10
.byte	0xc5,0x78,0x29,0x50,0x20
.byte	0xc5,0x78,0x29,0x58,0x30
.byte	0xc5,0x78,0x29,0x60,0x40
.byte	0xc5,0x78,0x29,0x68,0x50
.byte	0xc5,0x78,0x29,0x70,0x60
.byte	0xc5,0x78,0x29,0x78,0x70
	leaq	-256(%rsp),%rsp
	andq	$-32,%rsp
	leaq	.Linc(%rip),%r10
	leaq	-128(%rsp),%rax

	vmovd	%r8d,%xmm4
	vmovdqa	(%r10),%ymm0
	vmovdqa	32(%r10),%ymm1
	vmovdqa	64(%r10),%ymm5
	vpbroadcastd	%xmm4,%ymm4

	vpaddd	%ymm5,%ymm0,%ymm2
	vpcmpeqd	%ymm4,%ymm0,%ymm0
	vpaddd	%ymm5,%ymm1,%ymm3
	vpcmpeqd	%ymm4,%ymm1,%ymm1
	vmovdqa	%ymm0,0+128(%rax)
	vpaddd	%ymm5,%ymm2,%ymm0
	vpcmpeqd	%ymm4,%ymm2,%ymm2
	vmovdqa	%ymm1,32+128(%rax)
	vpaddd	%ymm5,%ymm3,%ymm1
	vpcmpeqd	%ymm4,%ymm3,%ymm3
	vmovdqa	%ymm2,64+128(%rax)
	vpaddd	%ymm5,%ymm0,%ymm2
	vpcmpeqd	%ymm4,%ymm0,%ymm0
	vmovdqa	%ymm3,96+128(%rax)
	vpaddd	%ymm5,%ymm1,%ymm3
	vpcmpeqd	%ymm4,%ymm1,%ymm1
	vmovdqa	%ymm0,128+128(%rax)
	vpaddd	%ymm5,%ymm2,%ymm8
	vpcmpeqd	%ymm4,%ymm2,%ymm2
	vmovdqa	%ymm1,160+128(%rax)
	vpaddd	%ymm5,%ymm3,%ymm9
	vpcmpeqd	%ymm4,%ymm3,%ymm3
	vmovdqa	%ymm2,192+128(%rax)
	vpaddd	%ymm5,%ymm8,%ymm10
	vpcmpeqd	%ymm4,%ymm8,%ymm8
	vmovdqa	%ymm3,224+128(%rax)
	vpaddd	%ymm5,%ymm9,%ymm11
	vpcmpeqd	%ymm4,%ymm9,%ymm9
	vpaddd	%ymm5,%ymm10,%ymm12
	vpcmpeqd	%ymm4,%ymm10,%ymm10
	vpaddd	%ymm5,%ymm11,%ymm13
	vpcmpeqd	%ymm4,%ymm11,%ymm11
	vpaddd	%ymm5,%ymm12,%ymm14
	vpcmpeqd	%ymm4,%ymm12,%ymm12
	vpaddd	%ymm5,%ymm13,%ymm15
	vpcmpeqd	%ymm4,%ymm13,%ymm13
	vpcmpeqd	%ymm4,%ymm14,%ymm14
	vpcmpeqd	%ymm4,%ymm15,%ymm15

	vmovdqa	-32(%r10),%ymm7
	leaq	128(%rdx),%rdx
	movl	$9,%r8d

.Loop_gather_1024:
	vmovdqa	0-128(%rdx),%ymm0
	vmovdqa	32-128(%rdx),%ymm1
	vmovdqa	64-128(%rdx),%ymm2
	vmovdqa	96-128(%rdx),%ymm3
	vpand	0+128(%rax),%ymm0,%ymm0
	vpand	32+128(%rax),%ymm1,%ymm1
	vpand	64+128(%rax),%ymm2,%ymm2
	vpor	%ymm0,%ymm1,%ymm4
	vpand	96+128(%rax),%ymm3,%ymm3
	vmovdqa	128-128(%rdx),%ymm0
	vmovdqa	160-128(%rdx),%ymm1
	vpor	%ymm2,%ymm3,%ymm5
	vmovdqa	192-128(%rdx),%ymm2
	vmovdqa	224-128(%rdx),%ymm3
	vpand	128+128(%rax),%ymm0,%ymm0
	vpand	160+128(%rax),%ymm1,%ymm1
	vpand	192+128(%rax),%ymm2,%ymm2
	vpor	%ymm0,%ymm4,%ymm4
	vpand	224+128(%rax),%ymm3,%ymm3
	vpand	256-128(%rdx),%ymm8,%ymm0
	vpor	%ymm1,%ymm5,%ymm5
	vpand	288-128(%rdx),%ymm9,%ymm1
	vpor	%ymm2,%ymm4,%ymm4
	vpand	320-128(%rdx),%ymm10,%ymm2
	vpor	%ymm3,%ymm5,%ymm5
	vpand	352-128(%rdx),%ymm11,%ymm3
	vpor	%ymm0,%ymm4,%ymm4
	vpand	384-128(%rdx),%ymm12,%ymm0
	vpor	%ymm1,%ymm5,%ymm5
	vpand	416-128(%rdx),%ymm13,%ymm1
	vpor	%ymm2,%ymm4,%ymm4
	vpand	448-128(%rdx),%ymm14,%ymm2
	vpor	%ymm3,%ymm5,%ymm5
	vpand	480-128(%rdx),%ymm15,%ymm3
	leaq	512(%rdx),%rdx
	vpor	%ymm0,%ymm4,%ymm4
	vpor	%ymm1,%ymm5,%ymm5
	vpor	%ymm2,%ymm4,%ymm4
	vpor	%ymm3,%ymm5,%ymm5

	vpor	%ymm5,%ymm4,%ymm4
	vextracti128	$1,%ymm4,%xmm5
	vpor	%xmm4,%xmm5,%xmm5
	vpermd	%ymm5,%ymm7,%ymm5
	vmovdqu	%ymm5,(%rcx)
	leaq	32(%rcx),%rcx
	decl	%r8d
	jnz	.Loop_gather_1024

	vpxor	%ymm0,%ymm0,%ymm0
	vmovdqu	%ymm0,(%rcx)
	vzeroupper
	movaps	-168(%r11),%xmm6
	movaps	-152(%r11),%xmm7
	movaps	-136(%r11),%xmm8
	movaps	-120(%r11),%xmm9
	movaps	-104(%r11),%xmm10
	movaps	-88(%r11),%xmm11
	movaps	-72(%r11),%xmm12
	movaps	-56(%r11),%xmm13
	movaps	-40(%r11),%xmm14
	movaps	-24(%r11),%xmm15
.LSEH_end_rsaz_1024_gather5:
	leaq	(%r11),%rsp
	.byte	0xf3,0xc3


.globl	rsaz_avx2_eligible
.def	rsaz_avx2_eligible;	.scl 2;	.type 32;	.endef
.p2align	5
rsaz_avx2_eligible:
	movl	OPENSSL_ia32cap_P+8(%rip),%eax
	movl	$524544,%ecx
	movl	$0,%edx
	andl	%eax,%ecx
	cmpl	$524544,%ecx
	cmovel	%edx,%eax
	andl	$32,%eax
	shrl	$5,%eax
	.byte	0xf3,0xc3


.p2align	6
.Land_mask:
.quad	0x1fffffff,0x1fffffff,0x1fffffff,-1
.Lscatter_permd:
.long	0,2,4,6,7,7,7,7
.Lgather_permd:
.long	0,7,1,7,2,7,3,7
.Linc:
.long	0,0,0,0, 1,1,1,1
.long	2,2,2,2, 3,3,3,3
.long	4,4,4,4, 4,4,4,4
.p2align	6

.def	rsaz_se_handler;	.scl 3;	.type 32;	.endef
.p2align	4
rsaz_se_handler:
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushfq
	subq	$64,%rsp

	movq	120(%r8),%rax
	movq	248(%r8),%rbx

	movq	8(%r9),%rsi
	movq	56(%r9),%r11

	movl	0(%r11),%r10d
	leaq	(%rsi,%r10,1),%r10
	cmpq	%r10,%rbx
	jb	.Lcommon_seh_tail

	movq	152(%r8),%rax

	movl	4(%r11),%r10d
	leaq	(%rsi,%r10,1),%r10
	cmpq	%r10,%rbx
	jae	.Lcommon_seh_tail

	movq	160(%r8),%rax

	movq	-48(%rax),%r15
	movq	-40(%rax),%r14
	movq	-32(%rax),%r13
	movq	-24(%rax),%r12
	movq	-16(%rax),%rbp
	movq	-8(%rax),%rbx
	movq	%r15,240(%r8)
	movq	%r14,232(%r8)
	movq	%r13,224(%r8)
	movq	%r12,216(%r8)
	movq	%rbp,160(%r8)
	movq	%rbx,144(%r8)

	leaq	-216(%rax),%rsi
	leaq	512(%r8),%rdi
	movl	$20,%ecx
.long	0xa548f3fc

.Lcommon_seh_tail:
	movq	8(%rax),%rdi
	movq	16(%rax),%rsi
	movq	%rax,152(%r8)
	movq	%rsi,168(%r8)
	movq	%rdi,176(%r8)

	movq	40(%r9),%rdi
	movq	%r8,%rsi
	movl	$154,%ecx
.long	0xa548f3fc

	movq	%r9,%rsi
	xorq	%rcx,%rcx
	movq	8(%rsi),%rdx
	movq	0(%rsi),%r8
	movq	16(%rsi),%r9
	movq	40(%rsi),%r10
	leaq	56(%rsi),%r11
	leaq	24(%rsi),%r12
	movq	%r10,32(%rsp)
	movq	%r11,40(%rsp)
	movq	%r12,48(%rsp)
	movq	%rcx,56(%rsp)
	call	*__imp_RtlVirtualUnwind(%rip)

	movl	$1,%eax
	addq	$64,%rsp
	popfq
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	.byte	0xf3,0xc3


.section	.pdata
.p2align	2
.rva	.LSEH_begin_rsaz_1024_sqr_avx2
.rva	.LSEH_end_rsaz_1024_sqr_avx2
.rva	.LSEH_info_rsaz_1024_sqr_avx2

.rva	.LSEH_begin_rsaz_1024_mul_avx2
.rva	.LSEH_end_rsaz_1024_mul_avx2
.rva	.LSEH_info_rsaz_1024_mul_avx2

.rva	.LSEH_begin_rsaz_1024_gather5
.rva	.LSEH_end_rsaz_1024_gather5
.rva	.LSEH_info_rsaz_1024_gather5
.section	.xdata
.p2align	3
.LSEH_info_rsaz_1024_sqr_avx2:
.byte	9,0,0,0
.rva	rsaz_se_handler
.rva	.Lsqr_1024_body,.Lsqr_1024_epilogue
.LSEH_info_rsaz_1024_mul_avx2:
.byte	9,0,0,0
.rva	rsaz_se_handler
.rva	.Lmul_1024_body,.Lmul_1024_epilogue
.LSEH_info_rsaz_1024_gather5:
.byte	0x01,0x36,0x17,0x0b
.byte	0x36,0xf8,0x09,0x00
.byte	0x31,0xe8,0x08,0x00
.byte	0x2c,0xd8,0x07,0x00
.byte	0x27,0xc8,0x06,0x00
.byte	0x22,0xb8,0x05,0x00
.byte	0x1d,0xa8,0x04,0x00
.byte	0x18,0x98,0x03,0x00
.byte	0x13,0x88,0x02,0x00
.byte	0x0e,0x78,0x01,0x00
.byte	0x09,0x68,0x00,0x00
.byte	0x04,0x01,0x15,0x00
.byte	0x00,0xb3,0x00,0x00
