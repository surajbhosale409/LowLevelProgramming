	.file	"2.c"
	.section	.rodata
.LC0:
	.string	"In 2.c"
.LC1:
	.string	"Back in 2.c"
.LC2:
	.string	"%d"
	.text
	.globl	print2
	.type	print2, @function
print2:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	call	print3
	subl	$12, %esp
	pushl	$.LC1
	call	puts
	addl	$16, %esp
	subl	$8, %esp
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	nop
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L2
	call	__stack_chk_fail
.L2:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	print2, .-print2
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
