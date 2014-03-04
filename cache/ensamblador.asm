	.text
	.globl _sumaInvertida
_sumaInvertida:
LFB4:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	L2
L3:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movd	%rdx, %xmm0
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movd	%xmm0, %rax
	movq	%rax, -8(%rbp)
	subq	$1, -16(%rbp)
L2:
	cmpq	$0, -16(%rbp)
	jns	L3
	movq	-8(%rbp), %rax
	movd	%rax, %xmm0
	popq	%rbp
LCFI2:
	ret
LFE4:
	.globl _sumaNormal
_sumaNormal:
LFB5:
	pushq	%rbp
LCFI3:
	movq	%rsp, %rbp
LCFI4:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	L6
L7:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movd	%rdx, %xmm0
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movd	%xmm0, %rax
	movq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
L6:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	L7
	movq	-8(%rbp), %rax
	movd	%rax, %xmm0
	popq	%rbp
LCFI5:
	ret
LFE5:
	.globl _sumaEnBloques2
_sumaEnBloques2:
LFB6:
	pushq	%rbp
LCFI6:
	movq	%rsp, %rbp
LCFI7:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	L10
L11:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movd	%rdx, %xmm0
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movd	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movd	%xmm1, %rax
	movq	%rax, -8(%rbp)
	addq	$2, -16(%rbp)
L10:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	L11
	movq	-8(%rbp), %rax
	movd	%rax, %xmm0
	popq	%rbp
LCFI8:
	ret
LFE6:
	.globl _sumaEnBloques4
_sumaEnBloques4:
LFB7:
	pushq	%rbp
LCFI9:
	movq	%rsp, %rbp
LCFI10:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	L14
L15:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movd	%rdx, %xmm0
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movd	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movd	%xmm1, %rax
	movq	%rax, -8(%rbp)
	addq	$4, -16(%rbp)
L14:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	L15
	movq	-8(%rbp), %rax
	movd	%rax, %xmm0
	popq	%rbp
LCFI11:
	ret
LFE7:
	.globl _sumaEnBloques8
_sumaEnBloques8:
LFB8:
	pushq	%rbp
LCFI12:
	movq	%rsp, %rbp
LCFI13:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, %eax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	L18
L19:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movd	%rdx, %xmm0
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$4, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$5, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$6, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$7, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movd	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	movd	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movd	%xmm1, %rax
	movq	%rax, -8(%rbp)
	addq	$8, -16(%rbp)
L18:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	L19
	movq	-8(%rbp), %rax
	movd	%rax, %xmm0
	popq	%rbp
LCFI14:
	ret
LFE8:
	.cstring
LC3:
	.ascii "N=%i, t=%f ms, KB=%f\12\0"
	.text
	.globl _sumaEnIncrementos
_sumaEnIncrementos:
LFB9:
	pushq	%rbp
LCFI15:
	movq	%rsp, %rbp
LCFI16:
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movsd	%xmm0, -88(%rbp)
	movq	$100, -8(%rbp)
	cvtsi2sdq	-8(%rbp), %xmm0
	movd	%xmm0, %rax
	movd	%rax, %xmm1
	mulsd	-88(%rbp), %xmm1
	movd	%xmm1, %rax
	movd	%rax, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	jmp	L22
L27:
	call	_clock
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_sumaEnBloques8
	movd	%xmm0, %rax
	movd	%rax, %xmm1
	cvttsd2siq	%xmm1, %rax
	movq	%rax, -32(%rbp)
	call	_clock
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	testq	%rax, %rax
	js	L23
	cvtsi2sdq	%rax, %xmm0
	movd	%xmm0, %rax
	jmp	L24
L23:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movd	%xmm1, %rax
L24:
	movabsq	$4696837146684686336, %rdx
	movd	%rax, %xmm0
	movd	%rdx, %xmm1
	divsd	%xmm1, %xmm0
	movabsq	$4652007308841189376, %rax
	movd	%rax, %xmm1
	mulsd	%xmm0, %xmm1
	movd	%xmm1, %rax
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rax
	subq	$1, %rax
	salq	$3, %rax
	shrq	$10, %rax
	testq	%rax, %rax
	js	L25
	cvtsi2sdq	%rax, %xmm0
	movd	%xmm0, %rax
	jmp	L26
L25:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movd	%xmm1, %rax
L26:
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rcx
	movd	%rdx, %xmm1
	movd	%rax, %xmm0
	movq	%rcx, %rsi
	leaq	LC3(%rip), %rdi
	movl	$2, %eax
	call	_printf
	movq	-16(%rbp), %rax
	addq	%rax, -8(%rbp)
L22:
	movq	-8(%rbp), %rax
	cmpq	-80(%rbp), %rax
	jle	L27
	leave
LCFI17:
	ret
LFE9:
	.globl _main
_main:
LFB10:
	pushq	%rbp
LCFI18:
	movq	%rsp, %rbp
LCFI19:
	subq	$16, %rsp
	movl	$0, %edi
	call	_time
	movl	%eax, %edi
	call	_srand
	movq	$10000000, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	L29
L30:
	call	_rand
	cvtsi2sd	%eax, %xmm0
	movd	%xmm0, %rax
	movabsq	$4746794007244308480, %rdx
	movd	%rax, %xmm1
	movd	%rdx, %xmm0
	divsd	%xmm0, %xmm1
	movd	%xmm1, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	_arreglo.3099(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -8(%rbp)
L29:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jl	L30
	movabsq	$4609434218613702656, %rax
	movq	-16(%rbp), %rdx
	movd	%rax, %xmm0
	movq	%rdx, %rsi
	leaq	_arreglo.3099(%rip), %rdi
	call	_sumaEnIncrementos
	movl	$0, %eax
	leave
LCFI20:
	ret
LFE10:
	.zerofill __DATA,__bss5,_arreglo.3099,80000000,5
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB4-.
	.set L$set$2,LFE4-LFB4
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB4
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$6,LEFDE3-LASFDE3
	.long L$set$6
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB5-.
	.set L$set$7,LFE5-LFB5
	.quad L$set$7
	.byte	0
	.byte	0x4
	.set L$set$8,LCFI3-LFB5
	.long L$set$8
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$11,LEFDE5-LASFDE5
	.long L$set$11
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB6-.
	.set L$set$12,LFE6-LFB6
	.quad L$set$12
	.byte	0
	.byte	0x4
	.set L$set$13,LCFI6-LFB6
	.long L$set$13
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$14,LCFI7-LCFI6
	.long L$set$14
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$15,LCFI8-LCFI7
	.long L$set$15
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$16,LEFDE7-LASFDE7
	.long L$set$16
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB7-.
	.set L$set$17,LFE7-LFB7
	.quad L$set$17
	.byte	0
	.byte	0x4
	.set L$set$18,LCFI9-LFB7
	.long L$set$18
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$19,LCFI10-LCFI9
	.long L$set$19
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$20,LCFI11-LCFI10
	.long L$set$20
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$21,LEFDE9-LASFDE9
	.long L$set$21
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB8-.
	.set L$set$22,LFE8-LFB8
	.quad L$set$22
	.byte	0
	.byte	0x4
	.set L$set$23,LCFI12-LFB8
	.long L$set$23
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$24,LCFI13-LCFI12
	.long L$set$24
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$25,LCFI14-LCFI13
	.long L$set$25
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$26,LEFDE11-LASFDE11
	.long L$set$26
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB9-.
	.set L$set$27,LFE9-LFB9
	.quad L$set$27
	.byte	0
	.byte	0x4
	.set L$set$28,LCFI15-LFB9
	.long L$set$28
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$29,LCFI16-LCFI15
	.long L$set$29
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$30,LCFI17-LCFI16
	.long L$set$30
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$31,LEFDE13-LASFDE13
	.long L$set$31
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB10-.
	.set L$set$32,LFE10-LFB10
	.quad L$set$32
	.byte	0
	.byte	0x4
	.set L$set$33,LCFI18-LFB10
	.long L$set$33
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$34,LCFI19-LCFI18
	.long L$set$34
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$35,LCFI20-LCFI19
	.long L$set$35
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE13:
	.subsections_via_symbols
