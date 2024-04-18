	.file	"pic.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "cpu/pic.c"
	.type	io_wait, @function
io_wait:
.LFB0:
	.file 1 "cpu/../io/io.h"
	.loc 1 12 34
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$8, %esp
	.loc 1 13 3
	subl	$8, %esp
	pushl	$128
	pushl	$0
	call	outb
	addl	$16, %esp
	.loc 1 14 1
	nop
	leave
.LCFI2:
	ret
.LFE0:
	.size	io_wait, .-io_wait
	.globl	pic_remap
	.type	pic_remap, @function
pic_remap:
.LFB1:
	.file 2 "cpu/pic.c"
	.loc 2 14 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$24, %esp
	.loc 2 16 7
	subl	$12, %esp
	pushl	$33
	call	inb
	addl	$16, %esp
	movb	%al, -9(%ebp)
	.loc 2 17 7
	subl	$12, %esp
	pushl	$161
	call	inb
	addl	$16, %esp
	movb	%al, -10(%ebp)
	.loc 2 19 2
	subl	$8, %esp
	pushl	$32
	pushl	$17
	call	outb
	addl	$16, %esp
	.loc 2 20 2
	call	io_wait
	.loc 2 21 2
	subl	$8, %esp
	pushl	$160
	pushl	$17
	call	outb
	addl	$16, %esp
	.loc 2 22 2
	call	io_wait
	.loc 2 24 2
	movl	8(%ebp), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	$33
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 25 2
	call	io_wait
	.loc 2 26 2
	movl	12(%ebp), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	$161
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 27 2
	call	io_wait
	.loc 2 29 2
	subl	$8, %esp
	pushl	$33
	pushl	$4
	call	outb
	addl	$16, %esp
	.loc 2 30 2
	call	io_wait
	.loc 2 31 2
	subl	$8, %esp
	pushl	$161
	pushl	$2
	call	outb
	addl	$16, %esp
	.loc 2 32 2
	call	io_wait
	.loc 2 34 2
	subl	$8, %esp
	pushl	$33
	pushl	$1
	call	outb
	addl	$16, %esp
	.loc 2 35 2
	call	io_wait
	.loc 2 36 2
	subl	$8, %esp
	pushl	$161
	pushl	$1
	call	outb
	addl	$16, %esp
	.loc 2 37 2
	call	io_wait
	.loc 2 39 2
	movzbl	-9(%ebp), %eax
	subl	$8, %esp
	pushl	$33
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 40 2
	movzbl	-10(%ebp), %eax
	subl	$8, %esp
	pushl	$161
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 41 1
	nop
	leave
.LCFI5:
	ret
.LFE1:
	.size	pic_remap, .-pic_remap
	.globl	pic_send_EOI
	.type	pic_send_EOI, @function
pic_send_EOI:
.LFB2:
	.loc 2 44 1
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	subl	$8, %esp
	.loc 2 46 5
	cmpl	$39, 8(%ebp)
	jbe	.L4
	.loc 2 47 3
	subl	$8, %esp
	pushl	$160
	pushl	$32
	call	outb
	addl	$16, %esp
.L4:
	.loc 2 49 2
	subl	$8, %esp
	pushl	$32
	pushl	$32
	call	outb
	addl	$16, %esp
	.loc 2 50 1
	nop
	leave
.LCFI8:
	ret
.LFE2:
	.size	pic_send_EOI, .-pic_send_EOI
	.globl	pic_unmask_irq
	.type	pic_unmask_irq, @function
pic_unmask_irq:
.LFB3:
	.loc 2 55 1
	pushl	%ebp
.LCFI9:
	movl	%esp, %ebp
.LCFI10:
	subl	$24, %esp
	movl	8(%ebp), %eax
	movw	%ax, -12(%ebp)
	.loc 2 56 3
	movzwl	-12(%ebp), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	$33
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 57 2
	movzwl	-12(%ebp), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	$161
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 2 58 1
	nop
	leave
.LCFI11:
	ret
.LFE3:
	.size	pic_unmask_irq, .-pic_unmask_irq
	.globl	pic_get_mask
	.type	pic_get_mask, @function
pic_get_mask:
.LFB4:
	.loc 2 62 35
	pushl	%ebp
.LCFI12:
	movl	%esp, %ebp
.LCFI13:
	subl	$24, %esp
	.loc 2 64 10
	movb	$0, -9(%ebp)
	.loc 2 66 5
	cmpl	$1, 8(%ebp)
	jne	.L7
	.loc 2 67 10
	subl	$12, %esp
	pushl	$33
	call	inb
	addl	$16, %esp
	movb	%al, -9(%ebp)
	jmp	.L8
.L7:
	.loc 2 69 10
	subl	$12, %esp
	pushl	$161
	call	inb
	addl	$16, %esp
	movb	%al, -9(%ebp)
.L8:
	.loc 2 72 9
	movzbl	-9(%ebp), %eax
	.loc 2 73 1
	leave
.LCFI14:
	ret
.LFE4:
	.size	pic_get_mask, .-pic_get_mask
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
	.byte	0xc5
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
	.long	.LCFI9-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI11-.LCFI10
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
	.long	.LCFI12-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xc5
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE8:
	.text
.Letext0:
	.file 3 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x190
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x7
	.long	.LASF23
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.long	.LASF4
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF7
	.byte	0x2e
	.byte	0x18
	.long	0x4d
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF8
	.byte	0x31
	.byte	0x19
	.long	0x5f
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x34
	.byte	0x19
	.long	0x71
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0x9
	.long	.LASF24
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.long	0xa4
	.uleb128 0x4
	.long	0x42
	.uleb128 0x4
	.long	0x54
	.byte	0
	.uleb128 0xa
	.string	"inb"
	.byte	0x1
	.byte	0x6
	.byte	0x9
	.long	0x42
	.long	0xba
	.uleb128 0x4
	.long	0x54
	.byte	0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x2
	.byte	0x3e
	.byte	0x9
	.long	0x42
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xf2
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3e
	.byte	0x1a
	.long	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.long	.LASF22
	.byte	0x2
	.byte	0x40
	.byte	0xa
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x5
	.long	.LASF16
	.byte	0x36
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x115
	.uleb128 0x2
	.long	.LASF15
	.byte	0x36
	.byte	0x1e
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.long	.LASF17
	.byte	0x2b
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x138
	.uleb128 0x2
	.long	.LASF18
	.byte	0x2b
	.byte	0x1c
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0xd
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x181
	.uleb128 0x2
	.long	.LASF20
	.byte	0xd
	.byte	0x19
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2
	.long	.LASF21
	.byte	0xd
	.byte	0x2b
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"a1"
	.byte	0xa
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x6
	.string	"a2"
	.byte	0xe
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xd
	.long	.LASF26
	.byte	0x1
	.byte	0xc
	.byte	0x14
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x5
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xc
	.uleb128 0x34
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
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
.LASF23:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF20:
	.string	"offset1"
.LASF21:
	.string	"offset2"
.LASF25:
	.string	"pic_get_mask"
.LASF16:
	.string	"pic_unmask_irq"
.LASF19:
	.string	"pic_remap"
.LASF17:
	.string	"pic_send_EOI"
.LASF14:
	.string	"pic_num"
.LASF6:
	.string	"unsigned char"
.LASF11:
	.string	"long unsigned int"
.LASF9:
	.string	"short unsigned int"
.LASF15:
	.string	"irq_mask"
.LASF24:
	.string	"outb"
.LASF13:
	.string	"unsigned int"
.LASF12:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint8_t"
.LASF5:
	.string	"long long int"
.LASF22:
	.string	"mask"
.LASF18:
	.string	"intr_num"
.LASF3:
	.string	"short int"
.LASF8:
	.string	"uint16_t"
.LASF10:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF26:
	.string	"io_wait"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"cpu/pic.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
