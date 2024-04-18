	.file	"isr-c.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "cpu/isr-c.c"
	.globl	guest_ptd
	.section	.bss
	.align 4
	.type	guest_ptd, @object
	.size	guest_ptd, 4
guest_ptd:
	.zero	4
	.local	isr_handlers
	.comm	isr_handlers,1024,32
	.text
	.globl	register_isr_handler
	.type	register_isr_handler, @function
register_isr_handler:
.LFB0:
	.file 1 "cpu/isr-c.c"
	.loc 1 12 65
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	.loc 1 13 25
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, isr_handlers(,%eax,4)
	.loc 1 14 1
	nop
	popl	%ebp
.LCFI2:
	ret
.LFE0:
	.size	register_isr_handler, .-register_isr_handler
	.globl	isr_handler
	.type	isr_handler, @function
isr_handler:
.LFB1:
	.loc 1 17 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$24, %esp
	.loc 1 22 36
	movl	40(%ebp), %eax
	.loc 1 22 9
	movl	isr_handlers(,%eax,4), %eax
	movl	%eax, -12(%ebp)
	.loc 1 24 3
	movl	40(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	pic_send_EOI
	addl	$16, %esp
	.loc 1 25 3
	subl	$12, %esp
	leal	8(%ebp), %eax
	pushl	%eax
	movl	-12(%ebp), %eax
	call	*%eax
.LVL0:
	addl	$16, %esp
	.loc 1 27 1
	nop
	leave
.LCFI5:
	ret
.LFE1:
	.size	isr_handler, .-isr_handler
	.section	.rodata
	.align 4
.LC0:
	.string	"page_fault_handler: ERROR_CODE %x\n"
	.align 4
.LC1:
	.string	"page_fault_handler: EIP che ha generato il fault:  %x\n"
	.text
	.globl	page_fault_handler
	.type	page_fault_handler, @function
page_fault_handler:
.LFB2:
	.loc 1 30 1
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	subl	$8, %esp
	.loc 1 31 3
	movl	8(%ebp), %eax
	movl	36(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 32 3
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 33 1
	nop
	leave
.LCFI8:
	ret
.LFE2:
	.size	page_fault_handler, .-page_fault_handler
	.globl	gpf_handler
	.type	gpf_handler, @function
gpf_handler:
.LFB3:
	.loc 1 36 1
	pushl	%ebp
.LCFI9:
	movl	%esp, %ebp
.LCFI10:
	subl	$8, %esp
	.loc 1 39 3
	subl	$12, %esp
	pushl	8(%ebp)
	call	emulate_high
	addl	$16, %esp
	.loc 1 40 1
	nop
	leave
.LCFI11:
	ret
.LFE3:
	.size	gpf_handler, .-gpf_handler
	.section	.rodata
	.align 4
.LC2:
	.string	"Emulating instruction at address %x: %x\n"
	.align 4
.LC3:
	.string	"    It is 'mov cr0, <something>' ---> Emulate it!\n"
.LC4:
	.string	"        Registed index: %d\n"
.LC5:
	.string	"        CR0 is %x\n"
.LC6:
	.string	"        Corrected to %x\n"
	.align 4
.LC7:
	.string	"INSTRUCTION EMULATOR: Sto provando ad emulare mov eax, cr3\n"
	.align 4
.LC8:
	.string	"INSTRUCTION EMULATOR: L'Indirizzo della page directory del guest e' %x \n"
	.align 4
.LC9:
	.string	"    Not emulated instruction: stop!\n"
	.text
	.globl	emulate_high
	.type	emulate_high, @function
emulate_high:
.LFB4:
	.loc 1 43 1
	pushl	%ebp
.LCFI12:
	movl	%esp, %ebp
.LCFI13:
	subl	$24, %esp
	.loc 1 44 38
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	.loc 1 44 13
	movl	%eax, -12(%ebp)
	.loc 1 46 3
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-12(%ebp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	.loc 1 48 8
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 48 11
	andl	$16318463, %eax
	.loc 1 48 6
	cmpl	$12591119, %eax
	jne	.L6
.LBB2:
	.loc 1 51 5
	subl	$12, %esp
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	.loc 1 53 12
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 53 15
	shrl	$16, %eax
	.loc 1 53 9
	andl	$7, %eax
	movl	%eax, -16(%ebp)
	.loc 1 54 9
	negl	-16(%ebp)
	.loc 1 55 9
	addl	$7, -16(%ebp)
	.loc 1 56 5
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	.loc 1 58 5
/APP
# 58 "cpu/isr-c.c" 1
	mov	%cr0, %eax
# 0 "" 2
/NO_APP
	movl	%eax, -20(%ebp)
	.loc 1 60 5
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	$.LC5
	call	printf
	addl	$16, %esp
	.loc 1 61 9
	andl	$-2, -20(%ebp)
	.loc 1 62 9
	andl	$-32769, -20(%ebp)
	.loc 1 63 5
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	$.LC6
	call	printf
	addl	$16, %esp
	.loc 1 64 26
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	.loc 1 64 7
	movl	%eax, -12(%ebp)
	.loc 1 65 8
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 66 21
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	.loc 1 66 27
	leal	3(%eax), %edx
	.loc 1 66 15
	movl	8(%ebp), %eax
	movl	%edx, 40(%eax)
	.loc 1 68 12
	movl	$1, %eax
	jmp	.L5
.L6:
.LBE2:
	.loc 1 72 8
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 72 11
	andl	$16777215, %eax
	.loc 1 72 6
	cmpl	$14164495, %eax
	jne	.L8
	.loc 1 74 5
	subl	$12, %esp
	pushl	$.LC7
	call	printf
	addl	$16, %esp
	.loc 1 75 5
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC8
	call	printf
	addl	$16, %esp
	.loc 1 78 31
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	.loc 1 78 15
	movl	%eax, guest_ptd
	.loc 1 81 5
	call	vmm_init_shadow_table
	.loc 1 83 21
	movl	8(%ebp), %eax
	movl	40(%eax), %eax
	.loc 1 83 27
	leal	3(%eax), %edx
	.loc 1 83 15
	movl	8(%ebp), %eax
	movl	%edx, 40(%eax)
	.loc 1 84 12
	movl	$1, %eax
	jmp	.L5
.L8:
	.loc 1 88 3
	subl	$12, %esp
	pushl	$.LC9
	call	printf
	addl	$16, %esp
	.loc 1 89 3
	call	emulate_error
.L5:
	.loc 1 90 1
	leave
.LCFI14:
	ret
.LFE4:
	.size	emulate_high, .-emulate_high
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
	.file 2 "cpu/isr.h"
	.file 3 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.file 4 "cpu/../boot/printf.h"
	.file 5 "cpu/../cpu/pic.h"
	.file 6 "cpu/paging.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2c2
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xe
	.long	.LASF28
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
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x34
	.byte	0x19
	.long	0x5c
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x10
	.long	.LASF29
	.byte	0x2c
	.byte	0x2
	.byte	0xf
	.byte	0x10
	.long	0xff
	.uleb128 0x2
	.string	"edi"
	.byte	0x11
	.long	0x50
	.byte	0
	.uleb128 0x2
	.string	"esi"
	.byte	0x12
	.long	0x50
	.byte	0x4
	.uleb128 0x2
	.string	"ebp"
	.byte	0x13
	.long	0x50
	.byte	0x8
	.uleb128 0x2
	.string	"esp"
	.byte	0x14
	.long	0x50
	.byte	0xc
	.uleb128 0x2
	.string	"ebx"
	.byte	0x15
	.long	0x50
	.byte	0x10
	.uleb128 0x2
	.string	"edx"
	.byte	0x16
	.long	0x50
	.byte	0x14
	.uleb128 0x2
	.string	"ecx"
	.byte	0x17
	.long	0x50
	.byte	0x18
	.uleb128 0x2
	.string	"eax"
	.byte	0x18
	.long	0x50
	.byte	0x1c
	.uleb128 0xa
	.long	.LASF11
	.byte	0x19
	.long	0x50
	.byte	0x20
	.uleb128 0xa
	.long	.LASF12
	.byte	0x1a
	.long	0x50
	.byte	0x24
	.uleb128 0x2
	.string	"eip"
	.byte	0x1b
	.long	0x50
	.byte	0x28
	.byte	0
	.uleb128 0x5
	.long	.LASF14
	.byte	0x2
	.byte	0x1c
	.byte	0x3
	.long	0x78
	.uleb128 0x5
	.long	.LASF15
	.byte	0x2
	.byte	0x1f
	.byte	0x10
	.long	0x117
	.uleb128 0x4
	.long	0x11c
	.uleb128 0x11
	.long	0x127
	.uleb128 0x6
	.long	0x127
	.byte	0
	.uleb128 0x4
	.long	0xff
	.uleb128 0x12
	.long	.LASF30
	.byte	0x1
	.byte	0x8
	.byte	0xb
	.long	0x13e
	.uleb128 0x5
	.byte	0x3
	.long	guest_ptd
	.uleb128 0x4
	.long	0x50
	.uleb128 0x13
	.long	0x10b
	.long	0x153
	.uleb128 0x14
	.long	0x71
	.byte	0xff
	.byte	0
	.uleb128 0xb
	.long	.LASF20
	.byte	0xa
	.byte	0xe
	.long	0x143
	.uleb128 0x5
	.byte	0x3
	.long	isr_handlers
	.uleb128 0xc
	.long	.LASF16
	.byte	0x59
	.long	0x6a
	.long	0x174
	.uleb128 0x7
	.byte	0
	.uleb128 0x15
	.long	.LASF31
	.byte	0x6
	.byte	0x20
	.byte	0x5
	.long	0x6a
	.uleb128 0xd
	.long	.LASF17
	.byte	0x4
	.byte	0x1
	.long	0x192
	.uleb128 0x6
	.long	0x192
	.uleb128 0x7
	.byte	0
	.uleb128 0x4
	.long	0x19e
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF18
	.uleb128 0x16
	.long	0x197
	.uleb128 0xd
	.long	.LASF19
	.byte	0x5
	.byte	0x24
	.long	0x1b4
	.uleb128 0x6
	.long	0x50
	.byte	0
	.uleb128 0x17
	.long	.LASF32
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.long	0x6a
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x21f
	.uleb128 0x3
	.long	.LASF21
	.byte	0x2a
	.byte	0x1a
	.long	0x127
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.string	"p"
	.byte	0x2c
	.byte	0xd
	.long	0x13e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.long	.LASF16
	.byte	0x59
	.long	0x6a
	.long	0x1f8
	.uleb128 0x7
	.byte	0
	.uleb128 0x18
	.long	.LBB2
	.long	.LBE2-.LBB2
	.uleb128 0x8
	.string	"reg"
	.byte	0x31
	.byte	0xe
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.string	"eax"
	.byte	0x31
	.byte	0x13
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x23
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x242
	.uleb128 0x3
	.long	.LASF21
	.byte	0x23
	.byte	0x1a
	.long	0x127
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.long	.LASF23
	.byte	0x1d
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x265
	.uleb128 0x3
	.long	.LASF21
	.byte	0x1d
	.byte	0x21
	.long	0x127
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.long	.LASF24
	.byte	0x10
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x296
	.uleb128 0x3
	.long	.LASF21
	.byte	0x10
	.byte	0x19
	.long	0xff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.long	.LASF25
	.byte	0x16
	.byte	0x9
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.long	.LASF33
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.long	.LASF26
	.byte	0xc
	.byte	0x21
	.long	0x10b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF27
	.byte	0xc
	.byte	0x38
	.long	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
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
	.sleb128 2
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
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
.LASF28:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF12:
	.string	"error_code"
.LASF30:
	.string	"guest_ptd"
.LASF23:
	.string	"page_fault_handler"
.LASF19:
	.string	"pic_send_EOI"
.LASF20:
	.string	"isr_handlers"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF33:
	.string	"register_isr_handler"
.LASF27:
	.string	"isr_num"
.LASF15:
	.string	"isr_t"
.LASF14:
	.string	"regs_t"
.LASF26:
	.string	"handler_code"
.LASF32:
	.string	"emulate_high"
.LASF22:
	.string	"gpf_handler"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF21:
	.string	"regs"
.LASF11:
	.string	"intr_number"
.LASF24:
	.string	"isr_handler"
.LASF25:
	.string	"handler"
.LASF16:
	.string	"emulate_error"
.LASF5:
	.string	"long long int"
.LASF17:
	.string	"printf"
.LASF3:
	.string	"short int"
.LASF29:
	.string	"registers"
.LASF13:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF18:
	.string	"char"
.LASF2:
	.string	"signed char"
.LASF31:
	.string	"vmm_init_shadow_table"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"cpu/isr-c.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
