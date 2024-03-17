.section .text

.code32

# ------------------------ ROUTINE DECLARATIONS --------------------------


.globl isrGPF
.globl isr32

# -----------------------------------------------------------------
# -------------- GENERAL PROTECTION FAULT ROUTINE -----------------


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


# -----------------------------------------------------------------
# ----------------- GENERIC INTERRUPT ROUTINE ---------------------

generic_interrupt_routine:


	# we call the commond irq handler passing to it the isr number 
	# isr number is used to dispatch the correct routine to execute
	pushal	
	
	# nb: when this is called from user mode we need to change the
	# segment descriptor to use the kernel segments, now we leave this
	call isr_handler
	popal

	# this is used to clean up the interrupt number we pushed before  
	add $4, %esp
	# restore the interrupt flag
	sti

	# now we return to what we were doing
	iret

# -----------------------------------------------------------------
# ------------------- INTERNAL TIMER ROUTINE S --------------------


isr32: 

	# pushing the code of the interrupt (used to dispatach later)
	cli
	pushl $32
	call generic_interrupt_routine


