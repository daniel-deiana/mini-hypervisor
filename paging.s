	.file	"paging.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "cpu/paging.c"
	.data
	.align 4
	.type	page_directory, @object
	.size	page_directory, 4
page_directory:
	.long	page_directory_table
	.section	.rodata
	.align 4
.LC0:
	.string	"il contenuto dell ultima entry della directory e' %x\n"
	.align 4
.LC1:
	.string	"questo \303\250 una roba che non dovrebbe faultare %x"
	.text
	.globl	vmm_paging_test
	.type	vmm_paging_test, @function
vmm_paging_test:
.LFB0:
	.file 1 "cpu/paging.c"
	.loc 1 13 28
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$24, %esp
	.loc 1 14 17
	movl	page_directory, %eax
	.loc 1 14 30
	movl	$0, (%eax)
	.loc 1 15 82
	movl	page_directory, %eax
	.loc 1 15 3
	movl	4092(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 18 49
	call	pmm_alloc_frame
	.loc 1 18 34 discriminator 1
	movl	%eax, %edx
	.loc 1 18 17 discriminator 1
	movl	page_directory, %eax
	.loc 1 18 84 discriminator 1
	orl	$7, %edx
	.loc 1 18 32 discriminator 1
	movl	%edx, 3076(%eax)
	.loc 1 20 15
	movl	$-1044480, -12(%ebp)
	.loc 1 22 24
	call	pmm_alloc_frame
	.loc 1 22 59 discriminator 1
	orl	$7, %eax
	movl	%eax, %edx
	.loc 1 22 22 discriminator 1
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 23 24
	call	pmm_alloc_frame
	.loc 1 23 59 discriminator 1
	orl	$7, %eax
	movl	%eax, %edx
	.loc 1 23 22 discriminator 1
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 26 19
	movl	$-1069543424, -16(%ebp)
	.loc 1 27 4
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 28 1
	nop
	leave
.LCFI2:
	ret
.LFE0:
	.size	vmm_paging_test, .-vmm_paging_test
	.section	.rodata
	.align 4
.LC2:
	.string	"valore dell indice della ptde %x\n"
	.align 4
.LC3:
	.string	"valore dell indice della pte %x\n"
	.align 4
.LC4:
	.string	"Il valore della pte che mi traduce l'indirizzo %x e' %x\n"
	.align 4
.LC5:
	.string	"Ho superato il test della write protection!\n"
	.text
	.globl	vmm_modify_page_attributes
	.type	vmm_modify_page_attributes, @function
vmm_modify_page_attributes:
.LFB1:
	.loc 1 38 1
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	subl	$24, %esp
	.loc 1 40 17
	movl	8(%ebp), %eax
	shrl	$22, %eax
	movl	%eax, -12(%ebp)
	.loc 1 41 3
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	.loc 1 43 46
	movl	-12(%ebp), %eax
	subl	$4194304, %eax
	.loc 1 43 15
	movl	%eax, -16(%ebp)
	.loc 1 44 40
	movl	8(%ebp), %eax
	shrl	$12, %eax
	.loc 1 44 17
	andl	$1023, %eax
	movl	%eax, -20(%ebp)
	.loc 1 45 3
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	.loc 1 47 3
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	8(%ebp)
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	.loc 1 51 14
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	.loc 1 51 26
	andl	$-4, %eax
	movl	%eax, %ecx
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
	.loc 1 52 14
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	.loc 1 52 26
	andl	$-8, %eax
	movl	%eax, %ecx
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
	.loc 1 53 14
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	.loc 1 53 26
	orl	$1, %eax
	movl	%eax, %ecx
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
	.loc 1 59 3
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	8(%ebp)
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	.loc 1 67 18
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc 1 68 6
	movl	-24(%ebp), %eax
	movl	$32, (%eax)
	.loc 1 70 3
	subl	$12, %esp
	pushl	$.LC5
	call	printf
	addl	$16, %esp
	.loc 1 71 1
	nop
	leave
.LCFI5:
	ret
.LFE1:
	.size	vmm_modify_page_attributes, .-vmm_modify_page_attributes
	.globl	vmm_init_shadow_table
	.type	vmm_init_shadow_table, @function
vmm_init_shadow_table:
.LFB2:
	.loc 1 77 1
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	subl	$8, %esp
	.loc 1 81 3
	movl	guest_ptd, %eax
	subl	$8, %esp
	pushl	$2
	pushl	%eax
	call	vmm_modify_page_attributes
	addl	$16, %esp
	.loc 1 83 10
	movl	$1, %eax
	.loc 1 84 1
	leave
.LCFI8:
	ret
.LFE2:
	.size	vmm_init_shadow_table, .-vmm_init_shadow_table
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
	.file 3 "cpu/paging.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1f0
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x9
	.long	.LASF22
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
	.long	.LASF11
	.byte	0x2
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
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x17
	.byte	0x12
	.long	0x50
	.uleb128 0xb
	.long	.LASF13
	.value	0x1000
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.long	0xa0
	.uleb128 0xc
	.long	.LASF23
	.byte	0x3
	.byte	0x1a
	.byte	0xc
	.long	0xa0
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x78
	.long	0xb1
	.uleb128 0xe
	.long	0x71
	.value	0x3ff
	.byte	0
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x1b
	.byte	0x3
	.long	0x84
	.uleb128 0xf
	.long	.LASF24
	.byte	0x1
	.byte	0x6
	.byte	0x17
	.long	0xc9
	.uleb128 0x6
	.long	0x71
	.uleb128 0x4
	.long	.LASF18
	.byte	0xa
	.byte	0x14
	.long	0xdf
	.uleb128 0x5
	.byte	0x3
	.long	page_directory
	.uleb128 0x6
	.long	0xb1
	.uleb128 0x2
	.long	.LASF14
	.byte	0x12
	.byte	0x31
	.long	0x6a
	.long	0xf5
	.uleb128 0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF15
	.byte	0xf
	.byte	0x3
	.long	0x6a
	.long	0x106
	.uleb128 0x3
	.byte	0
	.uleb128 0x10
	.long	.LASF25
	.byte	0x3
	.byte	0x6
	.byte	0xd
	.uleb128 0x11
	.long	.LASF26
	.byte	0x1
	.byte	0x4c
	.byte	0x5
	.long	0x6a
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.long	.LASF27
	.byte	0x1
	.byte	0x25
	.byte	0x5
	.long	0x6a
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x19f
	.uleb128 0x8
	.long	.LASF16
	.byte	0x2e
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x47
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4
	.long	.LASF19
	.byte	0x28
	.byte	0x11
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.long	.LASF15
	.byte	0xf
	.byte	0x3
	.long	0x6a
	.long	0x177
	.uleb128 0x3
	.byte	0
	.uleb128 0x7
	.string	"pt"
	.byte	0x2b
	.byte	0xf
	.long	0xdf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.long	.LASF20
	.byte	0x2c
	.byte	0x11
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.string	"p"
	.byte	0x43
	.byte	0x12
	.long	0x19f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.long	0x5c
	.uleb128 0x13
	.long	.LASF28
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.long	.LASF15
	.byte	0xf
	.byte	0x3
	.long	0x6a
	.long	0x1c7
	.uleb128 0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF14
	.byte	0x12
	.byte	0x31
	.long	0x6a
	.long	0x1d8
	.uleb128 0x3
	.byte	0
	.uleb128 0x4
	.long	.LASF21
	.byte	0x14
	.byte	0xf
	.long	0xdf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.string	"p"
	.byte	0x1a
	.byte	0x13
	.long	0x19f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x3
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 37
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xc
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
.LASF22:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF24:
	.string	"guest_ptd"
.LASF20:
	.string	"pte_index"
.LASF14:
	.string	"pmm_alloc_frame"
.LASF28:
	.string	"vmm_paging_test"
.LASF6:
	.string	"unsigned char"
.LASF18:
	.string	"page_directory"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF25:
	.string	"page_directory_table"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF13:
	.string	"page_table"
.LASF21:
	.string	"new_pt"
.LASF19:
	.string	"ptde_index"
.LASF5:
	.string	"long long int"
.LASF27:
	.string	"vmm_modify_page_attributes"
.LASF15:
	.string	"printf"
.LASF3:
	.string	"short int"
.LASF11:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF23:
	.string	"entries"
.LASF12:
	.string	"pt_entry"
.LASF17:
	.string	"page_attr"
.LASF2:
	.string	"signed char"
.LASF16:
	.string	"page_addr"
.LASF26:
	.string	"vmm_init_shadow_table"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"cpu/paging.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
