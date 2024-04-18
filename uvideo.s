	.file	"uvideo.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "boot/uvideo.c"
	.type	char_color, @function
char_color:
.LFB0:
	.file 1 "boot/uvideo.h"
	.loc 1 21 1
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	.loc 1 22 28
	movl	12(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	.loc 1 22 15
	movl	8(%ebp), %eax
	orl	%edx, %eax
	.loc 1 23 1
	popl	%ebp
.LCFI2:
	ret
.LFE0:
	.size	char_color, .-char_color
	.type	vga_entry, @function
vga_entry:
.LFB1:
	.loc 1 26 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -4(%ebp)
	movb	%al, -8(%ebp)
	.loc 1 27 10
	movsbw	-4(%ebp), %dx
	.loc 1 27 23
	movzbl	-8(%ebp), %eax
	sall	$8, %eax
	orl	%edx, %eax
	.loc 1 28 1
	leave
.LCFI5:
	ret
.LFE1:
	.size	vga_entry, .-vga_entry
	.section	.rodata
	.align 4
	.type	screen_width, @object
	.size	screen_width, 4
screen_width:
	.long	80
	.align 4
	.type	screen_height, @object
	.size	screen_height, 4
screen_height:
	.long	25
	.local	x
	.comm	x,4,4
	.local	y
	.comm	y,4,4
	.local	color
	.comm	color,1,1
	.local	screen
	.comm	screen,4,4
	.text
	.globl	clear
	.type	clear, @function
clear:
.LFB2:
	.file 2 "boot/uvideo.c"
	.loc 2 12 1
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	pushl	%ebx
	subl	$16, %esp
.LCFI8:
	.loc 2 15 5
	movl	$0, x
	.loc 2 16 5
	movl	$0, y
	.loc 2 17 11
	pushl	$0
	pushl	$7
	call	char_color
	addl	$8, %esp
	.loc 2 17 9 discriminator 1
	movb	%al, color
	.loc 2 18 10
	movl	$-1069551616, screen
	.loc 2 19 10
	movl	$0, -8(%ebp)
	.loc 2 19 3
	jmp	.L6
.L9:
	.loc 2 20 12
	movl	$0, -12(%ebp)
	.loc 2 20 5
	jmp	.L7
.L8:
	.loc 2 21 38
	movzbl	color, %eax
	movzbl	%al, %eax
	.loc 2 21 13
	movl	screen, %edx
	.loc 2 21 16
	movl	$80, %ecx
	movl	%ecx, %ebx
	imull	-8(%ebp), %ebx
	.loc 2 21 31
	movl	-12(%ebp), %ecx
	addl	%ebx, %ecx
	.loc 2 21 13
	addl	%ecx, %ecx
	leal	(%edx,%ecx), %ebx
	.loc 2 21 38
	pushl	%eax
	pushl	$32
	call	vga_entry
	addl	$8, %esp
	.loc 2 21 36 discriminator 1
	movw	%ax, (%ebx)
	.loc 2 20 36 discriminator 3
	addl	$1, -12(%ebp)
.L7:
	.loc 2 20 19 discriminator 1
	movl	$80, %eax
	cmpl	%eax, -12(%ebp)
	jb	.L8
	.loc 2 19 35 discriminator 2
	addl	$1, -8(%ebp)
.L6:
	.loc 2 19 17 discriminator 1
	movl	$25, %eax
	cmpl	%eax, -8(%ebp)
	jb	.L9
	.loc 2 24 1
	nop
	nop
	movl	-4(%ebp), %ebx
	leave
.LCFI9:
	ret
.LFE2:
	.size	clear, .-clear
	.globl	terminal_setcolor
	.type	terminal_setcolor, @function
terminal_setcolor:
.LFB3:
	.loc 2 27 1
	pushl	%ebp
.LCFI10:
	movl	%esp, %ebp
.LCFI11:
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	.loc 2 28 11
	movzbl	-4(%ebp), %eax
	movb	%al, color
	.loc 2 29 1
	nop
	leave
.LCFI12:
	ret
.LFE3:
	.size	terminal_setcolor, .-terminal_setcolor
	.globl	terminal_putentryat
	.type	terminal_putentryat, @function
terminal_putentryat:
.LFB4:
	.loc 2 32 1
	pushl	%ebp
.LCFI13:
	movl	%esp, %ebp
.LCFI14:
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
.LCFI15:
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -12(%ebp)
	movb	%al, -16(%ebp)
	.loc 2 33 41
	movzbl	-16(%ebp), %edx
	movsbl	-12(%ebp), %eax
	.loc 2 33 9
	movl	screen, %ebx
	.loc 2 33 14
	movl	20(%ebp), %ecx
	movl	$80, %esi
	imull	%ecx, %esi
	.loc 2 33 29
	movl	16(%ebp), %ecx
	addl	%esi, %ecx
	.loc 2 33 9
	addl	%ecx, %ecx
	addl	%ecx, %ebx
	.loc 2 33 41
	pushl	%edx
	pushl	%eax
	call	vga_entry
	addl	$8, %esp
	.loc 2 33 39 discriminator 1
	movw	%ax, (%ebx)
	.loc 2 34 1
	nop
	leal	-8(%ebp), %esp
	popl	%ebx
.LCFI16:
	popl	%esi
.LCFI17:
	popl	%ebp
.LCFI18:
	ret
.LFE4:
	.size	terminal_putentryat, .-terminal_putentryat
	.globl	cputc
	.type	cputc, @function
cputc:
.LFB5:
	.loc 2 37 1
	pushl	%ebp
.LCFI19:
	movl	%esp, %ebp
.LCFI20:
	pushl	%ebx
	subl	$4, %esp
.LCFI21:
	movl	8(%ebp), %eax
	movb	%al, -8(%ebp)
	.loc 2 38 6
	cmpb	$10, -8(%ebp)
	jne	.L13
	.loc 2 39 7
	movl	$0, x
	.loc 2 40 10
	movl	y, %eax
	leal	1(%eax), %edx
	movl	%edx, y
	.loc 2 40 13
	movl	$25, %edx
	.loc 2 40 8
	cmpl	%edx, %eax
	jne	.L16
	.loc 2 41 9
	movl	$0, y
	.loc 2 44 5
	jmp	.L16
.L13:
	.loc 2 47 3
	movl	y, %eax
	movl	%eax, %ebx
	movl	x, %eax
	movl	%eax, %ecx
	movzbl	color, %eax
	movzbl	%al, %edx
	movsbl	-8(%ebp), %eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	terminal_putentryat
	addl	$16, %esp
	.loc 2 48 8
	movl	x, %eax
	leal	1(%eax), %edx
	movl	%edx, x
	.loc 2 48 11
	movl	$80, %edx
	.loc 2 48 6
	cmpl	%edx, %eax
	jne	.L12
	.loc 2 49 7
	movl	$0, x
	.loc 2 50 10
	movl	y, %eax
	leal	1(%eax), %edx
	movl	%edx, y
	.loc 2 50 13
	movl	$25, %edx
	.loc 2 50 8
	cmpl	%edx, %eax
	jne	.L12
	.loc 2 51 9
	movl	$0, y
	jmp	.L12
.L16:
	.loc 2 44 5
	nop
.L12:
	.loc 2 54 1
	movl	-4(%ebp), %ebx
	leave
.LCFI22:
	ret
.LFE5:
	.size	cputc, .-cputc
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
	.long	.LFB0
	.long	.LFE0-.LFB0
	.byte	0x4
	.long	.LCFI0-.LFB0
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
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI3-.LFB1
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
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB2
	.long	.LFE2-.LFB2
	.byte	0x4
	.long	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xc5
	.byte	0xc3
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB3
	.long	.LFE3-.LFB3
	.byte	0x4
	.long	.LCFI10-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB4
	.long	.LFE4-.LFB4
	.byte	0x4
	.long	.LCFI13-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0x86
	.uleb128 0x3
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xc3
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xc6
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB5
	.long	.LFE5-.LFB5
	.byte	0x4
	.long	.LCFI19-.LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0xc5
	.byte	0xc3
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE10:
	.text
.Letext0:
	.file 3 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x295
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x8
	.long	.LASF7
	.byte	0x2e
	.byte	0x18
	.long	0x4d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x8
	.long	.LASF8
	.byte	0x31
	.byte	0x19
	.long	0x5f
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF12
	.uleb128 0xb
	.long	0x7b
	.uleb128 0xc
	.long	.LASF41
	.byte	0x7
	.byte	0x4
	.long	0x7b
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.long	0xfa
	.uleb128 0x1
	.long	.LASF13
	.byte	0
	.uleb128 0x1
	.long	.LASF14
	.byte	0x1
	.uleb128 0x1
	.long	.LASF15
	.byte	0x2
	.uleb128 0x1
	.long	.LASF16
	.byte	0x3
	.uleb128 0xd
	.string	"red"
	.byte	0x4
	.uleb128 0x1
	.long	.LASF17
	.byte	0x5
	.uleb128 0x1
	.long	.LASF18
	.byte	0x6
	.uleb128 0x1
	.long	.LASF19
	.byte	0x7
	.uleb128 0x1
	.long	.LASF20
	.byte	0x8
	.uleb128 0x1
	.long	.LASF21
	.byte	0x9
	.uleb128 0x1
	.long	.LASF22
	.byte	0xa
	.uleb128 0x1
	.long	.LASF23
	.byte	0xb
	.uleb128 0x1
	.long	.LASF24
	.byte	0xc
	.uleb128 0x1
	.long	.LASF25
	.byte	0xd
	.uleb128 0x1
	.long	.LASF26
	.byte	0xe
	.uleb128 0x1
	.long	.LASF27
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF28
	.byte	0x4
	.byte	0x1b
	.long	0x82
	.uleb128 0x5
	.byte	0x3
	.long	screen_width
	.uleb128 0x4
	.long	.LASF29
	.byte	0x5
	.byte	0x1b
	.long	0x82
	.uleb128 0x5
	.byte	0x3
	.long	screen_height
	.uleb128 0x5
	.string	"x"
	.byte	0x7
	.byte	0x15
	.long	0x7b
	.uleb128 0x5
	.byte	0x3
	.long	x
	.uleb128 0x5
	.string	"y"
	.byte	0x7
	.byte	0x18
	.long	0x7b
	.uleb128 0x5
	.byte	0x3
	.long	y
	.uleb128 0x4
	.long	.LASF30
	.byte	0x8
	.byte	0x10
	.long	0x42
	.uleb128 0x5
	.byte	0x3
	.long	color
	.uleb128 0x4
	.long	.LASF31
	.byte	0x9
	.byte	0x12
	.long	0x15c
	.uleb128 0x5
	.byte	0x3
	.long	screen
	.uleb128 0xe
	.byte	0x4
	.long	0x54
	.uleb128 0x7
	.long	.LASF33
	.byte	0x24
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x184
	.uleb128 0x3
	.string	"c"
	.byte	0x2
	.byte	0x24
	.byte	0x11
	.long	0x184
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF32
	.uleb128 0x7
	.long	.LASF34
	.byte	0x1f
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x1da
	.uleb128 0x3
	.string	"c"
	.byte	0x2
	.byte	0x1f
	.byte	0x1f
	.long	0x184
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.string	"col"
	.byte	0x2
	.byte	0x1f
	.byte	0x2a
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x6
	.long	.LASF35
	.byte	0x2
	.byte	0x1f
	.byte	0x33
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x3
	.string	"row"
	.byte	0x2
	.byte	0x1f
	.byte	0x3f
	.long	0x74
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.byte	0
	.uleb128 0xf
	.long	.LASF36
	.byte	0x2
	.byte	0x1a
	.byte	0x6
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1fe
	.uleb128 0x3
	.string	"c"
	.byte	0x2
	.byte	0x1a
	.byte	0x20
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.long	.LASF37
	.byte	0xb
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x22b
	.uleb128 0x5
	.string	"i"
	.byte	0xd
	.byte	0x10
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.string	"j"
	.byte	0xd
	.byte	0x13
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.long	.LASF42
	.byte	0x1
	.byte	0x19
	.byte	0x18
	.long	0x54
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x263
	.uleb128 0x3
	.string	"ch"
	.byte	0x1
	.byte	0x19
	.byte	0x27
	.long	0x184
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x6
	.long	.LASF30
	.byte	0x1
	.byte	0x19
	.byte	0x33
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.long	.LASF43
	.byte	0x1
	.byte	0x14
	.byte	0x17
	.long	0x42
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.long	.LASF38
	.byte	0x1
	.byte	0x14
	.byte	0x31
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF39
	.byte	0x1
	.byte	0x14
	.byte	0x46
	.long	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
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
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x49
	.uleb128 0x13
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
.LASF40:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF19:
	.string	"grey"
.LASF18:
	.string	"brown"
.LASF17:
	.string	"magenta"
.LASF26:
	.string	"light_brown"
.LASF41:
	.string	"vga_color"
.LASF33:
	.string	"cputc"
.LASF14:
	.string	"blue"
.LASF35:
	.string	"column"
.LASF27:
	.string	"white"
.LASF6:
	.string	"unsigned char"
.LASF29:
	.string	"screen_height"
.LASF10:
	.string	"long unsigned int"
.LASF9:
	.string	"short unsigned int"
.LASF15:
	.string	"green"
.LASF22:
	.string	"light_green"
.LASF13:
	.string	"black"
.LASF21:
	.string	"light_blue"
.LASF16:
	.string	"cyan"
.LASF30:
	.string	"color"
.LASF43:
	.string	"char_color"
.LASF12:
	.string	"unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint8_t"
.LASF38:
	.string	"line"
.LASF28:
	.string	"screen_width"
.LASF39:
	.string	"background"
.LASF23:
	.string	"light_cyan"
.LASF5:
	.string	"long long int"
.LASF32:
	.string	"char"
.LASF24:
	.string	"light_red"
.LASF20:
	.string	"dark_grey"
.LASF3:
	.string	"short int"
.LASF8:
	.string	"uint16_t"
.LASF37:
	.string	"clear"
.LASF42:
	.string	"vga_entry"
.LASF36:
	.string	"terminal_setcolor"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF34:
	.string	"terminal_putentryat"
.LASF25:
	.string	"light_magenta"
.LASF31:
	.string	"screen"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"boot/uvideo.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
