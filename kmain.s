	.file	"kmain.c"
	.text
.Ltext0:
	.file 0 "/Users/daniel/mini-Hypervisor" "boot/kmain.c"
	.section	.rodata
.LC0:
	.string	"MB Info: %x\n"
.LC1:
	.string	"Multiboot Flags = 0x%x\n"
.LC2:
	.string	"System memory:\n"
.LC3:
	.string	"    Low memory:  %uKB\n"
.LC4:
	.string	"    High memory: %uKB\n"
	.align 4
.LC5:
	.string	"No memory information provided by the bootloader!\n"
.LC6:
	.string	"boot_device: 0x%x\n"
.LC7:
	.string	"Command line: %s\n"
.LC8:
	.string	"%d modules at 0x%x\n"
.LC9:
	.string	"Module %d:\n"
.LC10:
	.string	"    start: 0x%x\n"
.LC11:
	.string	"    end:   0x%x\n"
.LC12:
	.string	"    command line: %s\n"
.LC13:
	.string	"Memory map address: 0x%x\n"
.LC14:
	.string	"Memory map length:  0x%x\n"
.LC15:
	.string	"Addr: %x\n"
.LC16:
	.string	"    %x %x --- %x %x (%x)\n"
.LC17:
	.string	"Bootloader name: %s\n"
.LC18:
	.string	"No bootloader name!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "boot/kmain.c"
	.loc 1 8 1
	leal	4(%esp), %ecx
.LCFI0:
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
.LCFI1:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
.LCFI2:
	subl	$56, %esp
	movl	%ecx, %ebx
	.loc 1 9 3
	call	clear
	.loc 1 14 3
	movl	(%ebx), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	.loc 1 15 3
	movl	(%ebx), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	.loc 1 17 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 17 22
	andl	$1, %eax
	.loc 1 17 6
	testl	%eax, %eax
	je	.L2
	.loc 1 18 5
	subl	$12, %esp
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	.loc 1 19 5
	movl	(%ebx), %eax
	movl	4(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	.loc 1 20 5
	movl	(%ebx), %eax
	movl	8(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC4
	call	printf
	addl	$16, %esp
	jmp	.L3
.L2:
	.loc 1 22 5
	subl	$12, %esp
	pushl	$.LC5
	call	printf
	addl	$16, %esp
.L3:
	.loc 1 25 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 25 22
	andl	$2, %eax
	.loc 1 25 6
	testl	%eax, %eax
	je	.L4
	.loc 1 26 57
	movl	(%ebx), %eax
	movl	12(%eax), %eax
	.loc 1 26 5
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC6
	call	printf
	addl	$16, %esp
.L4:
	.loc 1 29 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 29 22
	andl	$4, %eax
	.loc 1 29 6
	testl	%eax, %eax
	je	.L5
	.loc 1 30 50
	movl	(%ebx), %eax
	movl	16(%eax), %eax
	.loc 1 30 5
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC7
	call	printf
	addl	$16, %esp
.L5:
	.loc 1 33 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 33 22
	andl	$8, %eax
	.loc 1 33 6
	testl	%eax, %eax
	je	.L6
.LBB2:
	.loc 1 37 75
	movl	(%ebx), %eax
	movl	24(%eax), %eax
	.loc 1 37 5
	movl	%eax, %edx
	.loc 1 37 49
	movl	(%ebx), %eax
	movl	20(%eax), %eax
	.loc 1 37 5
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	$.LC8
	call	printf
	addl	$16, %esp
	.loc 1 38 47
	movl	(%ebx), %eax
	movl	24(%eax), %eax
	.loc 1 38 9
	movl	%eax, -36(%ebp)
	.loc 1 39 12
	movl	$0, -40(%ebp)
	.loc 1 39 5
	jmp	.L7
.L8:
	.loc 1 40 7
	subl	$8, %esp
	pushl	-40(%ebp)
	pushl	$.LC9
	call	printf
	addl	$16, %esp
	.loc 1 41 48
	movl	-36(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 41 7
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC10
	call	printf
	addl	$16, %esp
	.loc 1 42 48
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	.loc 1 42 7
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC11
	call	printf
	addl	$16, %esp
	.loc 1 43 51
	movl	-36(%ebp), %eax
	movl	8(%eax), %eax
	.loc 1 43 7
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC12
	call	printf
	addl	$16, %esp
	.loc 1 44 11
	addl	$16, -36(%ebp)
	.loc 1 39 43 discriminator 3
	addl	$1, -40(%ebp)
.L7:
	.loc 1 39 28 discriminator 1
	movl	(%ebx), %eax
	movl	20(%eax), %eax
	.loc 1 39 19 discriminator 1
	movl	-40(%ebp), %edx
	cmpl	%eax, %edx
	jb	.L8
.L6:
.LBE2:
	.loc 1 48 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 48 22
	andl	$64, %eax
	.loc 1 48 6
	testl	%eax, %eax
	je	.L9
.LBB3:
	.loc 1 51 63
	movl	(%ebx), %eax
	movl	48(%eax), %eax
	.loc 1 51 5
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC13
	call	printf
	addl	$16, %esp
	.loc 1 52 63
	movl	(%ebx), %eax
	movl	44(%eax), %eax
	.loc 1 52 5
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC14
	call	printf
	addl	$16, %esp
	.loc 1 53 15
	movl	(%ebx), %eax
	movl	48(%eax), %eax
	movl	%eax, -44(%ebp)
	.loc 1 54 11
	jmp	.L10
.L12:
.LBB4:
	.loc 1 57 12
	movl	-44(%ebp), %eax
	movl	%eax, -48(%ebp)
	.loc 1 58 9
	subl	$8, %esp
	pushl	-44(%ebp)
	pushl	$.LC15
	call	printf
	addl	$16, %esp
	.loc 1 59 9
	movl	-48(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, -60(%ebp)
	.loc 1 61 75
	movl	-48(%ebp), %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	.loc 1 59 9
	movl	%eax, %ecx
	.loc 1 61 88
	movl	-48(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%eax), %eax
	.loc 1 59 9
	leal	(%ecx,%eax), %edi
	movl	%edi, -64(%ebp)
	.loc 1 61 32
	movl	-48(%ebp), %eax
	movl	4(%eax), %esi
	movl	8(%eax), %edi
	.loc 1 61 45
	movl	-48(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%eax), %eax
	.loc 1 61 39
	addl	%esi, %eax
	adcl	%edi, %edx
	.loc 1 61 52
	movl	%edx, %eax
	xorl	%edx, %edx
	.loc 1 59 9
	movl	%eax, %esi
	.loc 1 60 60
	movl	-48(%ebp), %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	.loc 1 59 9
	movl	%eax, %ecx
	.loc 1 60 31
	movl	-48(%ebp), %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	.loc 1 60 38
	movl	%edx, %eax
	xorl	%edx, %edx
	.loc 1 59 9
	subl	$8, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	$.LC16
	call	printf
	addl	$32, %esp
	.loc 1 64 15
	movl	-48(%ebp), %eax
	movl	20(%eax), %eax
	.loc 1 64 10
	cmpl	$1, %eax
	jne	.L11
	.loc 1 65 25
	movl	-48(%ebp), %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	.loc 1 65 19
	movl	%eax, -32(%ebp)
	.loc 1 66 23
	movl	-48(%ebp), %eax
	movl	8(%eax), %edx
	movl	4(%eax), %eax
	.loc 1 66 30
	movl	%eax, %ecx
	.loc 1 66 36
	movl	-48(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%eax), %eax
	.loc 1 66 17
	addl	%ecx, %eax
	movl	%eax, -28(%ebp)
.L11:
	.loc 1 69 24
	movl	-48(%ebp), %eax
	movl	(%eax), %edx
	.loc 1 69 17
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	addl	$4, %eax
	movl	%eax, -44(%ebp)
.L10:
.LBE4:
	.loc 1 54 31
	movl	(%ebx), %eax
	movl	48(%eax), %edx
	.loc 1 54 52
	movl	(%ebx), %eax
	movl	44(%eax), %eax
	.loc 1 54 43
	addl	%edx, %eax
	.loc 1 54 22
	cmpl	%eax, -44(%ebp)
	jb	.L12
.L9:
.LBE3:
	.loc 1 73 14
	movl	(%ebx), %eax
	movl	(%eax), %eax
	.loc 1 73 22
	andl	$512, %eax
	.loc 1 73 6
	testl	%eax, %eax
	je	.L13
	.loc 1 74 52
	movl	(%ebx), %eax
	movl	64(%eax), %eax
	.loc 1 74 5
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC17
	call	printf
	addl	$16, %esp
	jmp	.L14
.L13:
	.loc 1 76 5
	subl	$12, %esp
	pushl	$.LC18
	call	printf
	addl	$16, %esp
.L14:
	.loc 1 79 3
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	-32(%ebp)
	call	kmain
	addl	$16, %esp
	.loc 1 80 1
	nop
	leal	-16(%ebp), %esp
	popl	%ecx
.LCFI3:
	popl	%ebx
.LCFI4:
	popl	%esi
.LCFI5:
	popl	%edi
.LCFI6:
	popl	%ebp
.LCFI7:
	leal	-4(%ecx), %esp
.LCFI8:
	ret
.LFE2:
	.size	main, .-main
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
	.byte	0xc
	.uleb128 0x1
	.uleb128 0
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0x10
	.byte	0x5
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xf
	.uleb128 0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0x10
	.byte	0x7
	.uleb128 0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x10
	.byte	0x6
	.uleb128 0x2
	.byte	0x75
	.sleb128 -8
	.byte	0x10
	.byte	0x3
	.uleb128 0x2
	.byte	0x75
	.sleb128 -12
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xc1
	.byte	0xc
	.uleb128 0x1
	.uleb128 0
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xc3
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xc6
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xc7
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xc5
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.align 4
.LEFDE0:
	.text
.Letext0:
	.file 2 "/usr/local/Cellar/x86_64-elf-gcc/13.2.0/lib/gcc/x86_64-elf/13.2.0/include/stdint-gcc.h"
	.file 3 "boot/multiboot.h"
	.file 4 "boot/printf.h"
	.file 5 "boot/uvideo.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x308
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0xc
	.long	.LASF49
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x5
	.long	.LASF8
	.byte	0x31
	.long	0x53
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x5
	.long	.LASF9
	.byte	0x34
	.long	0x64
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF11
	.byte	0x37
	.long	0x75
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0x6
	.long	.LASF36
	.byte	0x58
	.byte	0x10
	.long	0x192
	.uleb128 0x1
	.long	.LASF14
	.byte	0x12
	.byte	0xc
	.long	0x5a
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x13
	.byte	0xc
	.long	0x5a
	.byte	0x4
	.uleb128 0x1
	.long	.LASF16
	.byte	0x14
	.byte	0xc
	.long	0x5a
	.byte	0x8
	.uleb128 0x1
	.long	.LASF17
	.byte	0x15
	.byte	0xc
	.long	0x5a
	.byte	0xc
	.uleb128 0x1
	.long	.LASF18
	.byte	0x16
	.byte	0xc
	.long	0x5a
	.byte	0x10
	.uleb128 0x1
	.long	.LASF19
	.byte	0x18
	.byte	0xc
	.long	0x5a
	.byte	0x14
	.uleb128 0x1
	.long	.LASF20
	.byte	0x19
	.byte	0xc
	.long	0x5a
	.byte	0x18
	.uleb128 0x1
	.long	.LASF21
	.byte	0x1b
	.byte	0x8
	.long	0x192
	.byte	0x1c
	.uleb128 0x1
	.long	.LASF22
	.byte	0x1d
	.byte	0xc
	.long	0x5a
	.byte	0x2c
	.uleb128 0x1
	.long	.LASF23
	.byte	0x1e
	.byte	0xc
	.long	0x5a
	.byte	0x30
	.uleb128 0x1
	.long	.LASF24
	.byte	0x20
	.byte	0xc
	.long	0x5a
	.byte	0x34
	.uleb128 0x1
	.long	.LASF25
	.byte	0x21
	.byte	0xc
	.long	0x5a
	.byte	0x38
	.uleb128 0x1
	.long	.LASF26
	.byte	0x22
	.byte	0xc
	.long	0x5a
	.byte	0x3c
	.uleb128 0x1
	.long	.LASF27
	.byte	0x23
	.byte	0xc
	.long	0x5a
	.byte	0x40
	.uleb128 0x1
	.long	.LASF28
	.byte	0x24
	.byte	0xc
	.long	0x5a
	.byte	0x44
	.uleb128 0x1
	.long	.LASF29
	.byte	0x26
	.byte	0xc
	.long	0x5a
	.byte	0x48
	.uleb128 0x1
	.long	.LASF30
	.byte	0x27
	.byte	0xc
	.long	0x5a
	.byte	0x4c
	.uleb128 0x1
	.long	.LASF31
	.byte	0x28
	.byte	0xc
	.long	0x49
	.byte	0x50
	.uleb128 0x1
	.long	.LASF32
	.byte	0x29
	.byte	0xc
	.long	0x49
	.byte	0x52
	.uleb128 0x1
	.long	.LASF33
	.byte	0x2a
	.byte	0xc
	.long	0x49
	.byte	0x54
	.uleb128 0x1
	.long	.LASF34
	.byte	0x2b
	.byte	0xc
	.long	0x49
	.byte	0x56
	.byte	0
	.uleb128 0xe
	.long	0x1a2
	.long	0x1a2
	.uleb128 0xf
	.long	0x83
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF35
	.uleb128 0x10
	.long	0x1a2
	.uleb128 0x6
	.long	.LASF37
	.byte	0x10
	.byte	0x2e
	.long	0x1e8
	.uleb128 0x1
	.long	.LASF38
	.byte	0x30
	.byte	0xc
	.long	0x5a
	.byte	0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x31
	.byte	0xc
	.long	0x5a
	.byte	0x4
	.uleb128 0x1
	.long	.LASF18
	.byte	0x32
	.byte	0xc
	.long	0x5a
	.byte	0x8
	.uleb128 0x8
	.string	"pad"
	.byte	0x33
	.long	0x5a
	.byte	0
	.uleb128 0x6
	.long	.LASF40
	.byte	0x18
	.byte	0x38
	.long	0x222
	.uleb128 0x1
	.long	.LASF41
	.byte	0x3a
	.byte	0xc
	.long	0x5a
	.byte	0
	.uleb128 0x1
	.long	.LASF42
	.byte	0x3b
	.byte	0xc
	.long	0x6b
	.byte	0x4
	.uleb128 0x8
	.string	"len"
	.byte	0x3c
	.long	0x6b
	.uleb128 0x1
	.long	.LASF43
	.byte	0x3d
	.byte	0xc
	.long	0x5a
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4f
	.long	0x7c
	.long	0x232
	.uleb128 0x7
	.byte	0
	.uleb128 0x11
	.long	.LASF45
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.long	0x245
	.uleb128 0x12
	.long	0x245
	.uleb128 0x7
	.byte	0
	.uleb128 0x3
	.long	0x1a9
	.uleb128 0x13
	.long	.LASF50
	.byte	0x5
	.byte	0x1e
	.byte	0x6
	.uleb128 0x14
	.long	.LASF51
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2fc
	.uleb128 0x15
	.long	.LASF52
	.byte	0x1
	.byte	0x7
	.byte	0x22
	.long	0x2fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.long	.LASF46
	.byte	0xb
	.byte	0xc
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x4
	.long	.LASF47
	.byte	0xc
	.byte	0xc
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4f
	.long	0x7c
	.long	0x2a3
	.uleb128 0x7
	.byte	0
	.uleb128 0x16
	.long	.LBB2
	.long	.LBE2-.LBB2
	.long	0x2cb
	.uleb128 0xa
	.string	"mod"
	.byte	0x22
	.byte	0x20
	.long	0x301
	.uleb128 0x2
	.byte	0x75
	.sleb128 -36
	.uleb128 0xa
	.string	"i"
	.byte	0x23
	.byte	0x9
	.long	0x7c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LBB3
	.long	.LBE3-.LBB3
	.uleb128 0x4
	.long	.LASF23
	.byte	0x31
	.byte	0xe
	.long	0x5a
	.uleb128 0x2
	.byte	0x75
	.sleb128 -44
	.uleb128 0xb
	.long	.LBB4
	.long	.LBE4-.LBB4
	.uleb128 0x4
	.long	.LASF48
	.byte	0x37
	.byte	0x24
	.long	0x306
	.uleb128 0x2
	.byte	0x75
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x8a
	.uleb128 0x3
	.long	0x1ae
	.uleb128 0x3
	.long	0x1e8
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 25
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x21
	.sleb128 12
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
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
.LASF42:
	.string	"addr"
.LASF37:
	.string	"multiboot_mod_list"
.LASF44:
	.string	"kmain"
.LASF33:
	.string	"vbe_interface_off"
.LASF11:
	.string	"uint64_t"
.LASF49:
	.string	"GNU C17 13.2.0 -m32 -mtune=generic -march=x86-64 -g -g -O0 -fno-pic -fno-stack-protector -ffreestanding -fno-dwarf2-cfi-asm"
.LASF25:
	.string	"drives_addr"
.LASF18:
	.string	"cmdline"
.LASF51:
	.string	"main"
.LASF20:
	.string	"mods_addr"
.LASF3:
	.string	"short int"
.LASF28:
	.string	"apm_table"
.LASF5:
	.string	"long long int"
.LASF38:
	.string	"mod_start"
.LASF4:
	.string	"long int"
.LASF27:
	.string	"boot_loader_name"
.LASF50:
	.string	"clear"
.LASF52:
	.string	"mb_info"
.LASF30:
	.string	"vbe_mode_info"
.LASF40:
	.string	"multiboot_mmap_entry"
.LASF6:
	.string	"unsigned char"
.LASF29:
	.string	"vbe_control_info"
.LASF15:
	.string	"mem_lower"
.LASF2:
	.string	"signed char"
.LASF14:
	.string	"flags"
.LASF12:
	.string	"long long unsigned int"
.LASF9:
	.string	"uint32_t"
.LASF13:
	.string	"unsigned int"
.LASF8:
	.string	"uint16_t"
.LASF22:
	.string	"mmap_length"
.LASF47:
	.string	"mem_start"
.LASF7:
	.string	"short unsigned int"
.LASF35:
	.string	"char"
.LASF48:
	.string	"mmap"
.LASF17:
	.string	"boot_device"
.LASF43:
	.string	"type"
.LASF39:
	.string	"mod_end"
.LASF36:
	.string	"multiboot_info"
.LASF31:
	.string	"vbe_mode"
.LASF16:
	.string	"mem_upper"
.LASF10:
	.string	"long unsigned int"
.LASF41:
	.string	"size"
.LASF24:
	.string	"drives_length"
.LASF26:
	.string	"config_table"
.LASF34:
	.string	"vbe_interface_len"
.LASF46:
	.string	"mem_end"
.LASF19:
	.string	"mods_count"
.LASF23:
	.string	"mmap_addr"
.LASF32:
	.string	"vbe_interface_seg"
.LASF45:
	.string	"printf"
.LASF21:
	.string	"symbol_tables"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"boot/kmain.c"
.LASF1:
	.string	"/Users/daniel/mini-Hypervisor"
	.ident	"GCC: (GNU) 13.2.0"
