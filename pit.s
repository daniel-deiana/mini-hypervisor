	.file	"pit.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "cpu/pit.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"sono all interno dell handler per il timer\n"
	.text
	.globl	pit_handler
	.type	pit_handler, @function
pit_handler:
.LFB1:
	.file 1 "cpu/pit.c"
	.loc 1 7 32
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$8, %esp
	.loc 1 8 3
	subl	$12, %esp
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 9 1
	nop
	leave
.LCFI2:
	ret
.LFE1:
	.size	pit_handler, .-pit_handler
	.globl	pit_init
	.type	pit_init, @function
pit_init:
.LFB2:
	.loc 1 11 35
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$24, %esp
	.loc 1 13 12
	movl	$1193180, %eax
	movl	$0, %edx
	divl	8(%ebp)
	movl	%eax, -12(%ebp)
	.loc 1 16 3
	subl	$8, %esp
	pushl	$67
	pushl	$54
	call	outb
	addl	$16, %esp
	.loc 1 19 11
	movl	-12(%ebp), %eax
	movb	%al, -13(%ebp)
	.loc 1 20 34
	movl	-12(%ebp), %eax
	shrl	$8, %eax
	.loc 1 20 11
	movb	%al, -14(%ebp)
	.loc 1 23 3
	movzbl	-13(%ebp), %eax
	subl	$8, %esp
	pushl	$64
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 1 24 3
	movzbl	-14(%ebp), %eax
	subl	$8, %esp
	pushl	$64
	pushl	%eax
	call	outb
	addl	$16, %esp
	.loc 1 25 1
	nop
	leave
.LCFI5:
	ret
.LFE2:
	.size	pit_init, .-pit_init
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
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI0-.LFB1
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
	.long	.LFB2
	.long	.LFE2-.LFB2
	.byte	0x4
	.long	.LCFI3-.LFB2
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
	.file 2 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.file 3 "cpu/isr.h"
	.file 4 "cpu/../io/io.h"
	.file 5 "cpu/../boot/printf.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c9
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xa
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
	.byte	0x2
	.byte	0x2e
	.byte	0x18
	.long	0x4e
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0x31
	.byte	0x19
	.long	0x61
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x3
	.long	.LASF10
	.byte	0x2
	.byte	0x34
	.byte	0x19
	.long	0x74
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0xc
	.long	.LASF24
	.byte	0x2c
	.byte	0x3
	.byte	0xf
	.byte	0x10
	.long	0x117
	.uleb128 0x2
	.string	"edi"
	.byte	0x11
	.long	0x68
	.byte	0
	.uleb128 0x2
	.string	"esi"
	.byte	0x12
	.long	0x68
	.byte	0x4
	.uleb128 0x2
	.string	"ebp"
	.byte	0x13
	.long	0x68
	.byte	0x8
	.uleb128 0x2
	.string	"esp"
	.byte	0x14
	.long	0x68
	.byte	0xc
	.uleb128 0x2
	.string	"ebx"
	.byte	0x15
	.long	0x68
	.byte	0x10
	.uleb128 0x2
	.string	"edx"
	.byte	0x16
	.long	0x68
	.byte	0x14
	.uleb128 0x2
	.string	"ecx"
	.byte	0x17
	.long	0x68
	.byte	0x18
	.uleb128 0x2
	.string	"eax"
	.byte	0x18
	.long	0x68
	.byte	0x1c
	.uleb128 0x5
	.long	.LASF14
	.byte	0x19
	.long	0x68
	.byte	0x20
	.uleb128 0x5
	.long	.LASF15
	.byte	0x1a
	.long	0x68
	.byte	0x24
	.uleb128 0x2
	.string	"eip"
	.byte	0x1b
	.long	0x68
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.long	.LASF16
	.byte	0x3
	.byte	0x1c
	.byte	0x3
	.long	0x90
	.uleb128 0x6
	.long	0x117
	.uleb128 0x7
	.long	.LASF17
	.byte	0x4
	.byte	0x9
	.long	0x13e
	.uleb128 0x4
	.long	0x42
	.uleb128 0x4
	.long	0x55
	.byte	0
	.uleb128 0x7
	.long	.LASF18
	.byte	0x5
	.byte	0x1
	.long	0x150
	.uleb128 0x4
	.long	0x150
	.uleb128 0xd
	.byte	0
	.uleb128 0x6
	.long	0x15c
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0xe
	.long	0x155
	.uleb128 0xf
	.long	.LASF25
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ab
	.uleb128 0x8
	.long	.LASF21
	.byte	0xb
	.byte	0x18
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.long	.LASF20
	.byte	0x1
	.byte	0xd
	.byte	0xc
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.string	"l"
	.byte	0x13
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x9
	.string	"h"
	.byte	0x14
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF22
	.byte	0x7
	.byte	0x1a
	.long	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
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
	.uleb128 0x11
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
.LASF15:
	.string	"error_code"
.LASF21:
	.string	"frequency"
.LASF25:
	.string	"pit_init"
.LASF6:
	.string	"unsigned char"
.LASF11:
	.string	"long unsigned int"
.LASF9:
	.string	"short unsigned int"
.LASF22:
	.string	"regs"
.LASF16:
	.string	"regs_t"
.LASF17:
	.string	"outb"
.LASF13:
	.string	"unsigned int"
.LASF12:
	.string	"long long unsigned int"
.LASF7:
	.string	"uint8_t"
.LASF14:
	.string	"intr_number"
.LASF26:
	.string	"pit_handler"
.LASF5:
	.string	"long long int"
.LASF18:
	.string	"printf"
.LASF3:
	.string	"short int"
.LASF8:
	.string	"uint16_t"
.LASF10:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF19:
	.string	"char"
.LASF20:
	.string	"divisor"
.LASF2:
	.string	"signed char"
.LASF24:
	.string	"registers"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"cpu/pit.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
