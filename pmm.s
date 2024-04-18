	.file	"pmm.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "cpu/pmm.c"
	.local	page_frame_start
	.comm	page_frame_start,4,4
	.local	page_frame_end
	.comm	page_frame_end,4,4
	.local	page_frame_next
	.comm	page_frame_next,4,4
	.section	.rodata
	.align 4
.LC0:
	.string	"la fine del kernel si trova all'indirizzo fisico: %x\n"
	.text
	.globl	print_kernel_end
	.type	print_kernel_end, @function
print_kernel_end:
.LFB0:
	.file 1 "cpu/pmm.c"
	.loc 1 39 1
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$8, %esp
	.loc 1 40 3
	subl	$8, %esp
	pushl	$_kernel_p_end
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 42 1
	nop
	leave
.LCFI2:
	ret
.LFE0:
	.size	print_kernel_end, .-print_kernel_end
	.section	.rodata
	.align 4
.LC1:
	.string	"PAGE FRAME ALLOCATOR: prima pagina da poter allocare: %x\n"
	.align 4
.LC2:
	.string	"PAGE FRAME ALLOCATOR: ultima pagina da poter allocare: %x\n"
	.align 4
.LC3:
	.string	"PAGE FRAME ALLOCATOR: inizio del kernel: %x\n"
	.align 4
.LC4:
	.string	"PAGE FRAME ALLOCATOR: fine del kernel: %x\n"
	.text
	.globl	pmm_init
	.type	pmm_init, @function
pmm_init:
.LFB1:
	.loc 1 45 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$8, %esp
	.loc 1 48 32
	movl	$_kernel_p_end+4095, %eax
	andl	$-4096, %eax
	.loc 1 48 20
	movl	%eax, page_frame_start
	.loc 1 50 30
	movl	16(%ebp), %eax
	andl	$-4096, %eax
	.loc 1 50 18
	movl	%eax, page_frame_end
	.loc 1 52 19
	movl	page_frame_start, %eax
	movl	%eax, page_frame_next
	.loc 1 54 3
	movl	page_frame_start, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 55 3
	movl	page_frame_end, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	.loc 1 57 3
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	.loc 1 58 3
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	.loc 1 60 1
	nop
	leave
.LCFI5:
	ret
.LFE1:
	.size	pmm_init, .-pmm_init
	.section	.rodata
	.align 4
.LC5:
	.string	"PAGE FRAME ALLOCATOR: superato il numero massimo di pagine fisiche\n"
	.text
	.globl	pmm_alloc_frame
	.type	pmm_alloc_frame, @function
pmm_alloc_frame:
.LFB2:
	.loc 1 64 1
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	subl	$24, %esp
	.loc 1 65 23
	movl	page_frame_next, %edx
	movl	page_frame_end, %eax
	.loc 1 65 6
	cmpl	%eax, %edx
	jb	.L4
	.loc 1 66 5
	subl	$12, %esp
	pushl	$.LC5
	call	printf
	addl	$16, %esp
	.loc 1 67 5
	nop
	jmp	.L3
.L4:
	.loc 1 70 12
	movl	page_frame_next, %eax
	movl	%eax, -12(%ebp)
	.loc 1 73 19
	movl	page_frame_next, %eax
	addl	$4096, %eax
	movl	%eax, page_frame_next
	.loc 1 74 10
	movl	-12(%ebp), %eax
.L3:
	.loc 1 75 1
	leave
.LCFI8:
	ret
.LFE2:
	.size	pmm_alloc_frame, .-pmm_alloc_frame
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
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.file 3 "cpu/pmm.h"
	.file 4 "cpu/../boot/printf.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x16a
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x6
	.long	.LASF24
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
	.long	.LASF8
	.byte	0x2
	.byte	0x2e
	.byte	0x18
	.long	0x4e
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x2
	.byte	0x34
	.byte	0x19
	.long	0x68
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x3
	.byte	0xf
	.byte	0x11
	.long	0x42
	.uleb128 0x2
	.long	.LASF14
	.byte	0x1e
	.byte	0x11
	.long	0xa1
	.uleb128 0x5
	.byte	0x3
	.long	page_frame_start
	.uleb128 0x5
	.long	0x84
	.uleb128 0x2
	.long	.LASF15
	.byte	0x1f
	.byte	0x11
	.long	0xa1
	.uleb128 0x5
	.byte	0x3
	.long	page_frame_end
	.uleb128 0x2
	.long	.LASF16
	.byte	0x24
	.byte	0x11
	.long	0xa1
	.uleb128 0x5
	.byte	0x3
	.long	page_frame_next
	.uleb128 0x8
	.long	.LASF25
	.byte	0x3
	.byte	0x12
	.byte	0x6
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.long	0xe3
	.uleb128 0xa
	.long	0xe3
	.uleb128 0xb
	.byte	0
	.uleb128 0x5
	.long	0xef
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF17
	.uleb128 0xc
	.long	0xe8
	.uleb128 0xd
	.long	.LASF19
	.byte	0x1
	.byte	0x3f
	.byte	0xb
	.long	0xa1
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x11d
	.uleb128 0x2
	.long	.LASF18
	.byte	0x46
	.byte	0xc
	.long	0xa1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x15b
	.uleb128 0x4
	.long	.LASF21
	.byte	0x18
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.long	.LASF22
	.byte	0x2f
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4
	.long	.LASF23
	.byte	0x44
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0xf
	.long	.LASF27
	.byte	0x1
	.byte	0x26
	.byte	0x6
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 44
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
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
.LASF24:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF21:
	.string	"kernel_start"
.LASF18:
	.string	"alloc_frame"
.LASF19:
	.string	"pmm_alloc_frame"
.LASF16:
	.string	"page_frame_next"
.LASF22:
	.string	"kernel_end"
.LASF20:
	.string	"pmm_init"
.LASF6:
	.string	"unsigned char"
.LASF10:
	.string	"long unsigned int"
.LASF23:
	.string	"mem_end"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"page_frame_start"
.LASF27:
	.string	"print_kernel_end"
.LASF12:
	.string	"unsigned int"
.LASF11:
	.string	"long long unsigned int"
.LASF8:
	.string	"uint8_t"
.LASF15:
	.string	"page_frame_end"
.LASF5:
	.string	"long long int"
.LASF17:
	.string	"char"
.LASF26:
	.string	"printf"
.LASF3:
	.string	"short int"
.LASF25:
	.string	"_kernel_p_end"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF13:
	.string	"paddr_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
.LASF0:
	.string	"cpu/pmm.c"
	.ident	"GCC: (GNU) 13.2.0"
