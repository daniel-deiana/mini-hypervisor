	.file	"kapp.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "kapp.c"
	.data
	.align 32
	.type	GDT, @object
	.size	GDT, 128
GDT:
	.value	0
	.zero	6
	.value	-1
	.value	0
	.byte	0
	.byte	-102
	.byte	-49
	.byte	0
	.value	-1
	.value	0
	.byte	0
	.byte	-110
	.byte	-49
	.byte	0
	.value	-1
	.value	0
	.byte	0
	.byte	-6
	.byte	-49
	.byte	0
	.value	-1
	.value	0
	.byte	0
	.byte	-14
	.byte	-49
	.byte	0
	.value	-1
	.value	0
	.byte	16
	.byte	-102
	.byte	0
	.byte	0
	.value	-1
	.value	0
	.byte	16
	.byte	-110
	.byte	0
	.byte	0
	.value	0
	.value	0
	.byte	0
	.byte	-119
	.byte	0
	.byte	0
	.zero	64
	.local	IDT
	.comm	IDT,2048,32
	.align 4
	.type	gdtr, @object
	.size	gdtr, 6
gdtr:
	.value	128
	.long	GDT
	.align 4
	.type	idtr, @object
	.size	idtr, 6
idtr:
	.value	2048
	.long	IDT
	.globl	TSSIOMAP
	.section	.bss
	.align 32
	.type	TSSIOMAP, @object
	.size	TSSIOMAP, 8297
TSSIOMAP:
	.zero	8297
	.section	.rodata
	.align 4
.LC0:
	.string	"Hello from the very stupid hypervisor!\n"
	.align 4
.LC1:
	.string	"valore del frame libero restituito: %x\n"
	.align 4
.LC2:
	.string	"ps2 keyboard data port output: %x\n"
	.text
	.globl	kmain
	.type	kmain, @function
kmain:
.LFB3:
	.file 1 "kapp.c"
	.loc 1 120 1
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$24, %esp
	.loc 1 122 7
	movl	$56, -24(%ebp)
	.loc 1 123 3
	call	clear
	.loc 1 124 3
	subl	$12, %esp
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 126 5
	movl	$TSSIOMAP+100, -12(%ebp)
	.loc 1 127 6
	movl	-12(%ebp), %eax
	movw	$0, (%eax)
	.loc 1 127 15
	movl	-12(%ebp), %eax
	addl	$2, %eax
	.loc 1 127 20
	movw	$104, (%eax)
	.loc 1 128 29
	movb	$-1, TSSIOMAP+8296
	.loc 1 129 22
	movw	$8297, GDT+56
	.loc 1 130 22
	movl	$TSSIOMAP, %eax
	movw	%ax, GDT+58
	.loc 1 131 25
	movl	$TSSIOMAP, %eax
	.loc 1 131 44
	shrl	$16, %eax
	.loc 1 131 22
	movb	%al, GDT+60
	.loc 1 132 25
	movl	$TSSIOMAP, %eax
	.loc 1 132 51
	shrl	$24, %eax
	.loc 1 132 22
	movb	%al, GDT+63
	.loc 1 134 21
	movl	$gpf_routine, %eax
	movw	%ax, IDT+104
	.loc 1 135 25
	movl	$gpf_routine, %eax
	.loc 1 135 56
	shrl	$16, %eax
	.loc 1 135 21
	movw	%ax, IDT+110
	.loc 1 136 21
	movw	$8, IDT+106
	.loc 1 137 21
	movb	$-114, IDT+109
	.loc 1 139 21
	movl	$page_fault_routine, %eax
	movw	%ax, IDT+112
	.loc 1 140 25
	movl	$page_fault_routine, %eax
	.loc 1 140 63
	shrl	$16, %eax
	.loc 1 140 21
	movw	%ax, IDT+118
	.loc 1 141 21
	movw	$8, IDT+114
	.loc 1 142 21
	movb	$-114, IDT+117
	.loc 1 145 21
	movl	$isr32, %eax
	movw	%ax, IDT+256
	.loc 1 146 25
	movl	$isr32, %eax
	.loc 1 146 50
	shrl	$16, %eax
	.loc 1 146 21
	movw	%ax, IDT+262
	.loc 1 147 21
	movw	$8, IDT+258
	.loc 1 148 21
	movb	$-114, IDT+261
	.loc 1 150 3
	movl	$_kernel_p_end, %edx
	movl	$_kernel_p_start, %eax
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	%edx
	pushl	%eax
	call	pmm_init
	addl	$16, %esp
	.loc 1 152 20
	call	pmm_alloc_frame
	.loc 1 152 12 discriminator 1
	movl	%eax, -16(%ebp)
	.loc 1 153 3
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 154 11
	call	pmm_alloc_frame
	.loc 1 154 9 discriminator 1
	movl	%eax, -16(%ebp)
	.loc 1 155 3
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 158 3
	subl	$8, %esp
	pushl	$13
	pushl	$gpf_handler
	call	register_isr_handler
	addl	$16, %esp
	.loc 1 159 3
	subl	$8, %esp
	pushl	$14
	pushl	$page_fault_handler
	call	register_isr_handler
	addl	$16, %esp
	.loc 1 160 3
	subl	$8, %esp
	pushl	$32
	pushl	$pit_handler
	call	register_isr_handler
	addl	$16, %esp
	.loc 1 162 3
/APP
# 162 "kapp.c" 1
	lgdt gdtr
# 0 "" 2
	.loc 1 163 3
# 163 "kapp.c" 1
	lidt idtr
# 0 "" 2
	.loc 1 164 3
# 164 "kapp.c" 1
	ltr  -24(%ebp)
# 0 "" 2
	.loc 1 167 3
# 167 "kapp.c" 1
		ljmp $8, $1f
	1:
	movl $16,%eax
	movl %eax,%ds
	movl %eax,%es
	movl %eax,%fs
	movl %eax,%gs
	movl %eax,%ss

# 0 "" 2
	.loc 1 181 3
/NO_APP
	call	guest_code
	.loc 1 183 3
	call	vmm_paging_test
	.loc 1 185 3
	subl	$8, %esp
	pushl	$40
	pushl	$32
	call	pic_remap
	addl	$16, %esp
	.loc 1 186 3
	subl	$12, %esp
	pushl	$0
	call	pic_unmask_irq
	addl	$16, %esp
	.loc 1 187 3
	subl	$12, %esp
	pushl	$100
	call	pit_init
	addl	$16, %esp
	.loc 1 188 22
	subl	$12, %esp
	pushl	$1
	call	pic_get_mask
	addl	$16, %esp
	movb	%al, -17(%ebp)
	.loc 1 190 23
	subl	$12, %esp
	pushl	$96
	call	inb
	addl	$16, %esp
	movb	%al, -18(%ebp)
	.loc 1 191 3
	movzbl	-18(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
.L2:
	.loc 1 195 5 discriminator 1
	call	clear
	jmp	.L2
.LFE3:
	.size	kmain, .-kmain
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
	.long	.LFB3
	.long	.LFE3-.LFB3
	.byte	0x4
	.long	.LCFI0-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE0:
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.file 3 "cpu/isr.h"
	.file 4 "cpu/pmm.h"
	.file 5 "cpu/pit.h"
	.file 6 "cpu/pic.h"
	.file 7 "cpu/paging.h"
	.file 8 "Boot/printf.h"
	.file 9 "Boot/uvideo.h"
	.file 10 "io/io.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x491
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x12
	.long	.LASF63
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF4
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x6
	.long	.LASF7
	.byte	0x2
	.byte	0x2e
	.byte	0x18
	.long	0x4e
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x6
	.long	.LASF8
	.byte	0x2
	.byte	0x31
	.byte	0x19
	.long	0x61
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x6
	.long	.LASF10
	.byte	0x2
	.byte	0x34
	.byte	0x19
	.long	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0xa
	.long	.LASF19
	.byte	0x2c
	.byte	0x3
	.byte	0xf
	.byte	0x10
	.long	0x122
	.uleb128 0x4
	.string	"edi"
	.byte	0x3
	.byte	0x11
	.long	0x68
	.byte	0
	.uleb128 0x4
	.string	"esi"
	.byte	0x3
	.byte	0x12
	.long	0x68
	.byte	0x4
	.uleb128 0x4
	.string	"ebp"
	.byte	0x3
	.byte	0x13
	.long	0x68
	.byte	0x8
	.uleb128 0x4
	.string	"esp"
	.byte	0x3
	.byte	0x14
	.long	0x68
	.byte	0xc
	.uleb128 0x4
	.string	"ebx"
	.byte	0x3
	.byte	0x15
	.long	0x68
	.byte	0x10
	.uleb128 0x4
	.string	"edx"
	.byte	0x3
	.byte	0x16
	.long	0x68
	.byte	0x14
	.uleb128 0x4
	.string	"ecx"
	.byte	0x3
	.byte	0x17
	.long	0x68
	.byte	0x18
	.uleb128 0x4
	.string	"eax"
	.byte	0x3
	.byte	0x18
	.long	0x68
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x19
	.long	0x68
	.byte	0x20
	.uleb128 0x2
	.long	.LASF15
	.byte	0x3
	.byte	0x1a
	.long	0x68
	.byte	0x24
	.uleb128 0x4
	.string	"eip"
	.byte	0x3
	.byte	0x1b
	.long	0x68
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.long	.LASF16
	.byte	0x3
	.byte	0x1c
	.byte	0x3
	.long	0x90
	.uleb128 0x6
	.long	.LASF17
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.long	0x13a
	.uleb128 0x8
	.long	0x13f
	.uleb128 0x14
	.long	0x14a
	.uleb128 0x1
	.long	0x14a
	.byte	0
	.uleb128 0x8
	.long	0x122
	.uleb128 0x6
	.long	.LASF18
	.byte	0x4
	.byte	0xf
	.byte	0x11
	.long	0x42
	.uleb128 0xa
	.long	.LASF20
	.byte	0x8
	.byte	0x1
	.byte	0x16
	.byte	0x8
	.long	0x1a5
	.uleb128 0x2
	.long	.LASF21
	.byte	0x1
	.byte	0x17
	.long	0x55
	.byte	0
	.uleb128 0x4
	.string	"sel"
	.byte	0x1
	.byte	0x18
	.long	0x55
	.byte	0x2
	.uleb128 0x2
	.long	.LASF22
	.byte	0x1
	.byte	0x19
	.long	0x42
	.byte	0x4
	.uleb128 0x2
	.long	.LASF23
	.byte	0x1
	.byte	0x1a
	.long	0x42
	.byte	0x5
	.uleb128 0x2
	.long	.LASF24
	.byte	0x1
	.byte	0x1b
	.long	0x55
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LASF25
	.byte	0x6
	.byte	0x1
	.byte	0x1e
	.byte	0x8
	.long	0x1cb
	.uleb128 0x2
	.long	.LASF26
	.byte	0x1
	.byte	0x1f
	.long	0x55
	.byte	0
	.uleb128 0x2
	.long	.LASF27
	.byte	0x1
	.byte	0x20
	.long	0x68
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	.LASF28
	.byte	0x8
	.byte	0x1
	.byte	0x23
	.byte	0x8
	.long	0x221
	.uleb128 0x2
	.long	.LASF26
	.byte	0x1
	.byte	0x24
	.long	0x55
	.byte	0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x1
	.byte	0x25
	.long	0x55
	.byte	0x2
	.uleb128 0x2
	.long	.LASF30
	.byte	0x1
	.byte	0x26
	.long	0x42
	.byte	0x4
	.uleb128 0x2
	.long	.LASF31
	.byte	0x1
	.byte	0x27
	.long	0x42
	.byte	0x5
	.uleb128 0x2
	.long	.LASF32
	.byte	0x1
	.byte	0x28
	.long	0x42
	.byte	0x6
	.uleb128 0x2
	.long	.LASF33
	.byte	0x1
	.byte	0x29
	.long	0x42
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	0x1cb
	.long	0x231
	.uleb128 0x10
	.long	0x89
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.string	"GDT"
	.byte	0x2d
	.byte	0x19
	.long	0x221
	.uleb128 0x5
	.byte	0x3
	.long	GDT
	.uleb128 0xd
	.long	0x15b
	.long	0x252
	.uleb128 0x10
	.long	0x89
	.byte	0xff
	.byte	0
	.uleb128 0xe
	.string	"IDT"
	.byte	0x69
	.byte	0x19
	.long	0x242
	.uleb128 0x5
	.byte	0x3
	.long	IDT
	.uleb128 0x7
	.long	.LASF34
	.byte	0x6a
	.byte	0x1b
	.long	0x1a5
	.uleb128 0x5
	.byte	0x3
	.long	gdtr
	.uleb128 0x7
	.long	.LASF35
	.byte	0x6b
	.byte	0x1b
	.long	0x1a5
	.uleb128 0x5
	.byte	0x3
	.long	idtr
	.uleb128 0xd
	.long	0x42
	.long	0x296
	.uleb128 0x15
	.long	0x89
	.value	0x2068
	.byte	0
	.uleb128 0x16
	.long	.LASF36
	.byte	0x1
	.byte	0x6c
	.byte	0x9
	.long	0x285
	.uleb128 0x5
	.byte	0x3
	.long	TSSIOMAP
	.uleb128 0xf
	.long	.LASF37
	.byte	0x6f
	.long	0x2b2
	.uleb128 0x17
	.byte	0x4
	.uleb128 0xf
	.long	.LASF38
	.byte	0x70
	.long	0x2b2
	.uleb128 0xf
	.long	.LASF39
	.byte	0x71
	.long	0x2b2
	.uleb128 0x18
	.string	"inb"
	.byte	0xa
	.byte	0x6
	.byte	0x9
	.long	0x42
	.long	0x2de
	.uleb128 0x1
	.long	0x55
	.byte	0
	.uleb128 0x19
	.long	.LASF40
	.byte	0x6
	.byte	0x22
	.byte	0x9
	.long	0x42
	.long	0x2f4
	.uleb128 0x1
	.long	0x82
	.byte	0
	.uleb128 0x5
	.long	.LASF41
	.byte	0x5
	.byte	0xd
	.long	0x305
	.uleb128 0x1
	.long	0x68
	.byte	0
	.uleb128 0x5
	.long	.LASF42
	.byte	0x6
	.byte	0x25
	.long	0x316
	.uleb128 0x1
	.long	0x55
	.byte	0
	.uleb128 0x5
	.long	.LASF43
	.byte	0x6
	.byte	0x23
	.long	0x32c
	.uleb128 0x1
	.long	0x68
	.uleb128 0x1
	.long	0x68
	.byte	0
	.uleb128 0xb
	.long	.LASF51
	.byte	0x7
	.byte	0x1d
	.uleb128 0xc
	.long	.LASF44
	.byte	0xb5
	.byte	0x3
	.long	0x82
	.long	0x344
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.long	.LASF45
	.byte	0x5
	.byte	0xc
	.long	0x355
	.uleb128 0x1
	.long	0x14a
	.byte	0
	.uleb128 0x5
	.long	.LASF46
	.byte	0x3
	.byte	0x22
	.long	0x366
	.uleb128 0x1
	.long	0x14a
	.byte	0
	.uleb128 0x5
	.long	.LASF47
	.byte	0x3
	.byte	0x21
	.long	0x377
	.uleb128 0x1
	.long	0x14a
	.byte	0
	.uleb128 0x5
	.long	.LASF48
	.byte	0x3
	.byte	0x27
	.long	0x38d
	.uleb128 0x1
	.long	0x12e
	.uleb128 0x1
	.long	0x68
	.byte	0
	.uleb128 0xc
	.long	.LASF49
	.byte	0x98
	.byte	0x14
	.long	0x82
	.long	0x39e
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.long	.LASF50
	.byte	0x4
	.byte	0x16
	.long	0x3b9
	.uleb128 0x1
	.long	0x68
	.uleb128 0x1
	.long	0x68
	.uleb128 0x1
	.long	0x68
	.byte	0
	.uleb128 0xb
	.long	.LASF52
	.byte	0x4
	.byte	0x13
	.uleb128 0xb
	.long	.LASF53
	.byte	0x4
	.byte	0x12
	.uleb128 0x5
	.long	.LASF54
	.byte	0x8
	.byte	0x1
	.long	0x3d9
	.uleb128 0x1
	.long	0x3d9
	.uleb128 0x9
	.byte	0
	.uleb128 0x8
	.long	0x3e5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF55
	.uleb128 0x1a
	.long	0x3de
	.uleb128 0xb
	.long	.LASF56
	.byte	0x9
	.byte	0x1e
	.uleb128 0x1b
	.long	.LASF64
	.byte	0x1
	.byte	0x77
	.byte	0x6
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x48a
	.uleb128 0x11
	.long	.LASF57
	.byte	0x77
	.byte	0x15
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF58
	.byte	0x77
	.byte	0x29
	.long	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xe
	.string	"p"
	.byte	0x79
	.byte	0xd
	.long	0x48a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.long	.LASF59
	.byte	0x7a
	.byte	0x7
	.long	0x82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.long	.LASF60
	.byte	0x98
	.byte	0xc
	.long	0x48f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.long	.LASF49
	.byte	0x98
	.byte	0x14
	.long	0x82
	.long	0x45c
	.uleb128 0x9
	.byte	0
	.uleb128 0xc
	.long	.LASF44
	.byte	0xb5
	.byte	0x3
	.long	0x82
	.long	0x46d
	.uleb128 0x9
	.byte	0
	.uleb128 0x7
	.long	.LASF61
	.byte	0xbc
	.byte	0xb
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x7
	.long	.LASF62
	.byte	0xbe
	.byte	0xb
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.byte	0
	.uleb128 0x8
	.long	0x55
	.uleb128 0x8
	.long	0x14f
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
.LASF26:
	.string	"limit"
.LASF64:
	.string	"kmain"
.LASF56:
	.string	"clear"
.LASF51:
	.string	"vmm_paging_test"
.LASF63:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF25:
	.string	"dt_register"
.LASF14:
	.string	"intr_number"
.LASF30:
	.string	"base_middle"
.LASF19:
	.string	"registers"
.LASF3:
	.string	"short int"
.LASF34:
	.string	"gdtr"
.LASF46:
	.string	"page_fault_handler"
.LASF7:
	.string	"uint8_t"
.LASF15:
	.string	"error_code"
.LASF57:
	.string	"mem_start"
.LASF39:
	.string	"isr32"
.LASF17:
	.string	"isr_t"
.LASF5:
	.string	"long long int"
.LASF44:
	.string	"guest_code"
.LASF50:
	.string	"pmm_init"
.LASF4:
	.string	"long int"
.LASF32:
	.string	"granularity"
.LASF54:
	.string	"printf"
.LASF60:
	.string	"frame"
.LASF61:
	.string	"pic_mask"
.LASF59:
	.string	"trval"
.LASF49:
	.string	"pmm_alloc_frame"
.LASF6:
	.string	"unsigned char"
.LASF40:
	.string	"pic_get_mask"
.LASF2:
	.string	"signed char"
.LASF23:
	.string	"flags"
.LASF12:
	.string	"long long unsigned int"
.LASF10:
	.string	"uint32_t"
.LASF13:
	.string	"unsigned int"
.LASF8:
	.string	"uint16_t"
.LASF21:
	.string	"offs_low"
.LASF9:
	.string	"short unsigned int"
.LASF42:
	.string	"pic_unmask_irq"
.LASF55:
	.string	"char"
.LASF31:
	.string	"type"
.LASF24:
	.string	"offs_high"
.LASF47:
	.string	"gpf_handler"
.LASF16:
	.string	"regs_t"
.LASF41:
	.string	"pit_init"
.LASF48:
	.string	"register_isr_handler"
.LASF33:
	.string	"base_high"
.LASF45:
	.string	"pit_handler"
.LASF18:
	.string	"paddr_t"
.LASF35:
	.string	"idtr"
.LASF11:
	.string	"long unsigned int"
.LASF37:
	.string	"gpf_routine"
.LASF62:
	.string	"dummy_ps2"
.LASF53:
	.string	"_kernel_p_end"
.LASF29:
	.string	"base_low"
.LASF36:
	.string	"TSSIOMAP"
.LASF38:
	.string	"page_fault_routine"
.LASF58:
	.string	"mem_end"
.LASF28:
	.string	"GDT_entry"
.LASF43:
	.string	"pic_remap"
.LASF27:
	.string	"base"
.LASF52:
	.string	"_kernel_p_start"
.LASF20:
	.string	"IDT_entry"
.LASF22:
	.string	"zero"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kapp.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
