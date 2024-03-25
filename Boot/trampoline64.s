.section .text
.code32
.globl trampoline
.globl error

trampoline:
	/* Check if CPUID is present */
	pushf
	mov (%esp), %eax
	xorl $1 << 21, (%esp)
	popf

	pushf
	pop %ecx
	push %eax
	popf

	cmp %eax, %ecx
	je no_cpuid

	/* Yes, we have CPUID... Use it to check if the CPU has long mode */
	mov $0x80000000, %eax
	cpuid
	cmp $0x80000001, %eax
	jb no_long_mode

	mov $0x80000001, %eax
	cpuid
	and $1 << 29, %edx
	jz no_long_mode

	call main
	jmp end

no_cpuid:
	mov  $'2', %eax
	jmp error

no_long_mode:
	mov  $'3', %eax
error:
	movl $0x40724045, (0xb8000)
	movl $0x406f4072, (0xb8004)
	movl $0x40204072, (0xb8008)
	mov  $0x40, %ah
	mov  %ax,         (0xb800c)
end:
	cli
	hlt
