	.file	"test.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d"
.LC4:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC2(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %edx
	cmpl	$1, %edx
	jle	.L8
	leal	-2(%rdx), %eax
	leal	-1(%rdx), %edi
	cmpl	$7, %eax
	jbe	.L9
	movl	%edi, %ecx
	movdqa	.LC0(%rip), %xmm0
	shrl	$2, %ecx
	xorl	%eax, %eax
	movdqa	.LC1(%rip), %xmm2
	movdqa	.LC3(%rip), %xmm4
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm2, %xmm3
	movdqa	%xmm2, %xmm1
	paddd	%xmm4, %xmm2
	addl	$1, %eax
	pmuludq	%xmm0, %xmm3
	psrlq	$32, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm0, %xmm1
	pshufd	$8, %xmm3, %xmm0
	cmpl	%ecx, %eax
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm1, %xmm0
	jb	.L4
	movdqa	%xmm0, %xmm2
	movl	%edi, %ecx
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	andl	$-4, %ecx
	psrldq	$8, %xmm2
	cmpl	%ecx, %edi
	leal	2(%rcx), %eax
	pmuludq	%xmm2, %xmm1
	psrlq	$32, %xmm2
	pshufd	$8, %xmm1, %xmm1
	pmuludq	%xmm2, %xmm0
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm1
	pmuludq	%xmm1, %xmm0
	movd	%xmm0, %esi
	je	.L2
.L3:
	leal	1(%rax), %ecx
	imull	%eax, %esi
	cmpl	%ecx, %edx
	jl	.L2
	imull	%ecx, %esi
	leal	2(%rax), %ecx
	cmpl	%edx, %ecx
	jg	.L2
	imull	%ecx, %esi
	leal	3(%rax), %ecx
	cmpl	%ecx, %edx
	jl	.L2
	imull	%ecx, %esi
	leal	4(%rax), %ecx
	cmpl	%ecx, %edx
	jl	.L2
	imull	%ecx, %esi
	leal	5(%rax), %ecx
	cmpl	%ecx, %edx
	jl	.L2
	imull	%ecx, %esi
	leal	6(%rax), %ecx
	cmpl	%ecx, %edx
	jl	.L2
	addl	$7, %eax
	imull	%ecx, %esi
	cmpl	%eax, %edx
	jl	.L2
	imull	%eax, %esi
.L2:
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L13
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movl	$1, %esi
	jmp	.L2
.L9:
	movl	$1, %esi
	movl	$2, %eax
	jmp	.L3
.L13:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC1:
	.long	2
	.long	3
	.long	4
	.long	5
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
