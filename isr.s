.section .text

.code32

.globl isrGPF

isrGPF:	# This is our fault-handler for General Protection faults

	# Save registers on the stack and use ebp to access the stack frame
	pushal
	mov	%esp, %ebp

	# Initialize ds to flat memory space
	pushl	%ds
	mov	$16, %ax
	mov	%ax, %ds

	# Invoke the instruction decoder, written in high-level C
  push    %ebp
	call    emulate_high
	#sub $4, %esp
	pop     %ebx

	# Check the results of the instruction decoder
  cmp $1, %eax
	je	emulated
	jmp	terminate_program

emulated:
	# Return from GPF handler
	popl	%ds
	popal
	add	$4, %esp
	iretl

terminate_program:
	# Kind of hackish way to return from start_program (instead of the GPF sr)
	mov saved_esp, %esp
	ret				# back to main routine
