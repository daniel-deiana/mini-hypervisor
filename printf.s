	.file	"printf.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "boot/printf.c"
	.type	itoa, @function
itoa:
.LFB2:
	.file 1 "boot/printf.c"
	.loc 1 10 1
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$32, %esp
	.loc 1 11 9
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	.loc 1 13 17
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 14 7
	movl	$10, -20(%ebp)
	.loc 1 17 6
	cmpl	$100, 12(%ebp)
	jne	.L2
	.loc 1 17 19 discriminator 1
	cmpl	$0, 16(%ebp)
	jns	.L2
	.loc 1 19 9
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	.loc 1 19 12
	movb	$45, (%eax)
	.loc 1 20 10
	addl	$1, 8(%ebp)
	.loc 1 21 12
	movl	16(%ebp), %eax
	negl	%eax
	.loc 1 21 10
	movl	%eax, -16(%ebp)
	jmp	.L6
.L2:
	.loc 1 23 11
	cmpl	$120, 12(%ebp)
	jne	.L6
	.loc 1 24 13
	movl	$16, -20(%ebp)
.L6:
.LBB2:
	.loc 1 29 26
	movl	-20(%ebp), %ecx
	movl	-16(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %ecx
	movl	%ecx, %eax
	.loc 1 29 11
	movl	%eax, -24(%ebp)
	.loc 1 31 12
	cmpl	$9, -24(%ebp)
	jg	.L4
	.loc 1 31 43 discriminator 1
	movl	-24(%ebp), %eax
	addl	$48, %eax
	.loc 1 31 12 discriminator 1
	movl	%eax, %ecx
	jmp	.L5
.L4:
	.loc 1 31 67 discriminator 2
	movl	-24(%ebp), %eax
	addl	$87, %eax
	.loc 1 31 12 discriminator 2
	movl	%eax, %ecx
.L5:
	.loc 1 31 9 discriminator 4
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	.loc 1 31 12 discriminator 4
	movb	%cl, (%eax)
.LBE2:
	.loc 1 33 13
	movl	-20(%ebp), %ecx
	movl	-16(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, -16(%ebp)
	.loc 1 33 10
	cmpl	$0, -16(%ebp)
	jne	.L6
	.loc 1 36 6
	movl	-4(%ebp), %eax
	movb	$0, (%eax)
	.loc 1 39 6
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	.loc 1 40 6
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -12(%ebp)
	.loc 1 41 9
	jmp	.L7
.L8:
.LBB3:
	.loc 1 43 12
	movl	-8(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
	.loc 1 44 13
	movl	-12(%ebp), %eax
	movzbl	(%eax), %edx
	.loc 1 44 11
	movl	-8(%ebp), %eax
	movb	%dl, (%eax)
	.loc 1 45 11
	movl	-12(%ebp), %eax
	movzbl	-25(%ebp), %edx
	movb	%dl, (%eax)
	.loc 1 46 9
	addl	$1, -8(%ebp)
	.loc 1 47 9
	subl	$1, -12(%ebp)
.L7:
.LBE3:
	.loc 1 41 13
	movl	-8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jb	.L8
	.loc 1 49 1
	nop
	nop
	leave
.LCFI2:
	ret
.LFE2:
	.size	itoa, .-itoa
	.section	.rodata
.LC0:
	.string	"(null)"
	.text
	.globl	printf
	.type	printf, @function
printf:
.LFB3:
	.loc 1 52 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$56, %esp
	.loc 1 55 3
	leal	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 57 9
	jmp	.L10
.L20:
.LBB4:
	.loc 1 58 13
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	.loc 1 58 9
	movsbl	%al, %eax
	movl	%eax, -16(%ebp)
	.loc 1 60 8
	cmpl	$37, -16(%ebp)
	je	.L11
	.loc 1 61 7
	movl	-16(%ebp), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	cputc
	addl	$16, %esp
	jmp	.L12
.L11:
.LBB5:
	.loc 1 66 9
	addl	$1, 8(%ebp)
	.loc 1 66 11
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	.loc 1 66 9
	movsbl	%al, %eax
	movl	%eax, -16(%ebp)
	.loc 1 67 7
	cmpl	$120, -16(%ebp)
	je	.L13
	cmpl	$120, -16(%ebp)
	jg	.L14
	cmpl	$117, -16(%ebp)
	je	.L13
	cmpl	$117, -16(%ebp)
	jg	.L14
	cmpl	$100, -16(%ebp)
	je	.L13
	cmpl	$115, -16(%ebp)
	je	.L15
	jmp	.L14
.L13:
	.loc 1 71 11
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	(%eax), %eax
	.loc 1 71 11 is_stmt 0 discriminator 1
	subl	$4, %esp
	pushl	%eax
	pushl	-16(%ebp)
	leal	-52(%ebp), %eax
	pushl	%eax
	call	itoa
	addl	$16, %esp
	.loc 1 72 13 is_stmt 1
	leal	-52(%ebp), %eax
	movl	%eax, -12(%ebp)
	.loc 1 73 11
	jmp	.L16
.L15:
	.loc 1 77 13
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 78 14
	cmpl	$0, -12(%ebp)
	jne	.L21
	.loc 1 79 15
	movl	$.LC0, -12(%ebp)
	jmp	.L17
.L21:
	.loc 1 81 1
	nop
.L16:
	.loc 1 82 17
	jmp	.L17
.L18:
	.loc 1 83 21
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	.loc 1 83 19
	movzbl	(%eax), %eax
	.loc 1 83 13
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	cputc
	addl	$16, %esp
.L17:
	.loc 1 82 18
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L18
	.loc 1 85 11
	jmp	.L12
.L14:
	.loc 1 88 19
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	(%eax), %eax
	.loc 1 88 17 discriminator 1
	movl	(%eax), %eax
	.loc 1 88 11 discriminator 1
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	cputc
	addl	$16, %esp
	.loc 1 89 11
	nop
.L12:
.LBE5:
	.loc 1 92 11
	addl	$1, 8(%ebp)
.L10:
.LBE4:
	.loc 1 57 10
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L20
	.loc 1 96 1
	nop
	nop
	leave
.LCFI5:
	ret
.LFE3:
	.size	printf, .-printf
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.byte	0x4
	.long	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB3
	.long	.LFE3-.LFB3
	.byte	0x4
	.long	.LCFI3-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE2:
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdarg.h"
	.file 3 "boot/uvideo.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1e9
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF19
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x5
	.long	.LASF2
	.byte	0x28
	.byte	0x1b
	.long	0x31
	.uleb128 0xa
	.byte	0x4
	.long	.LASF20
	.long	0x3b
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0xb
	.long	0x3b
	.uleb128 0x5
	.long	.LASF3
	.byte	0x67
	.byte	0x18
	.long	0x26
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF10
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0xd
	.long	.LASF21
	.byte	0x3
	.byte	0x1f
	.byte	0x6
	.long	0xaa
	.uleb128 0xe
	.long	0x3b
	.byte	0
	.uleb128 0xf
	.long	.LASF22
	.byte	0x1
	.byte	0x33
	.byte	0x6
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x124
	.uleb128 0x6
	.long	.LASF15
	.byte	0x33
	.byte	0x19
	.long	0x124
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x3
	.long	.LASF14
	.byte	0x35
	.byte	0xb
	.long	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.long	.LASF23
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.long	.L16
	.uleb128 0x4
	.long	.LBB4
	.long	.LBE4-.LBB4
	.uleb128 0x2
	.string	"c"
	.byte	0x3a
	.byte	0x9
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.long	.LBB5
	.long	.LBE5-.LBB5
	.uleb128 0x2
	.string	"p"
	.byte	0x3f
	.byte	0xd
	.long	0x129
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.string	"buf"
	.byte	0x40
	.byte	0xc
	.long	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x42
	.uleb128 0x7
	.long	0x3b
	.uleb128 0x12
	.long	0x3b
	.long	0x13e
	.uleb128 0x13
	.long	0x91
	.byte	0x1f
	.byte	0
	.uleb128 0x14
	.long	.LASF24
	.byte	0x1
	.byte	0x9
	.byte	0xd
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.string	"buf"
	.byte	0x18
	.long	0x129
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF16
	.byte	0x9
	.byte	0x21
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x8
	.string	"d"
	.byte	0x2b
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2
	.string	"p"
	.byte	0xb
	.byte	0x9
	.long	0x129
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.string	"p1"
	.byte	0xc
	.byte	0x9
	.long	0x129
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2
	.string	"p2"
	.byte	0xc
	.byte	0xe
	.long	0x129
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.string	"ud"
	.byte	0xd
	.byte	0x11
	.long	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.long	.LASF17
	.byte	0xe
	.byte	0x7
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.long	.LBB2
	.long	.LBE2-.LBB2
	.long	0x1d3
	.uleb128 0x3
	.long	.LASF18
	.byte	0x1d
	.byte	0xb
	.long	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x4
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x2
	.string	"tmp"
	.byte	0x2b
	.byte	0xc
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF20:
	.string	"__builtin_va_list"
.LASF21:
	.string	"cputc"
.LASF23:
	.string	"string"
.LASF2:
	.string	"__gnuc_va_list"
.LASF9:
	.string	"unsigned char"
.LASF11:
	.string	"long unsigned int"
.LASF24:
	.string	"itoa"
.LASF10:
	.string	"short unsigned int"
.LASF3:
	.string	"va_list"
.LASF15:
	.string	"format"
.LASF16:
	.string	"base"
.LASF13:
	.string	"unsigned int"
.LASF4:
	.string	"char"
.LASF17:
	.string	"divisor"
.LASF8:
	.string	"long long int"
.LASF14:
	.string	"parms"
.LASF22:
	.string	"printf"
.LASF6:
	.string	"short int"
.LASF7:
	.string	"long int"
.LASF18:
	.string	"remainder"
.LASF5:
	.string	"signed char"
.LASF12:
	.string	"long long unsigned int"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"boot/printf.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
