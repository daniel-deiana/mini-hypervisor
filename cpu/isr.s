.section .text
.code32

# ------------------------ ROUTINE DECLARATIONS --------------------------
.globl page_fault_routine
.globl gpf_routine
.globl isr32
.globl isr33
.globl emulate_error


# -----------------------------------------------------------------
# ----------------- GENERIC INTERRUPT ROUTINE ---------------------

generic_isr_routine:

	# we call the common irq handler passing to it the isr number 
	# isr number is used to dispatch the correct routine to execute
	pushal	
	# nb: when this is called from user mode we need to change the
	# segment descriptor to use the kernel segments, now we leave this

	call isr_handler

	popal
	# this is used to clean up the interrupt number we pushed before  
	add $8, %esp
	# restore the interrupt flag
	sti
	# now we return to what we were doing
	iretl


# -----------------------------------------------------------------
# ----------------- GENERIC INTERRUPT ROUTINE ---------------------

generic_exception_routine:

	# we call the common irq handler passing to it the isr number 
	# isr number is used to dispatch the correct routine to execute
	pushal	
	# nb: when this is called from user mode we need to change the
	# segment descriptor to use the kernel segments, now we leave this
 
	call isr_handler

	popal
	# this is used to clean up the interrupt number we pushed before  
	add $8, %esp


	# now we return to what we were doing
ir: iretl	

# -----------------------------------------------------------------
# ------------------- INTERNAL TIMER ROUTINE S --------------------


isr32: 
	# pushing the code of the interrupt (used to dispatach later)
	cli
	pushl $0
	pushl $32
	jmp generic_isr_routine


# -----------------------------------------------------------------
# ------------------- PS2 KEYBOARDD INTERRUPTS --------------------

is33: 
	cli
	pushl $0
	pushl $33
	jmp generic_isr_routine


page_fault_routine:
	cli
	pushl $14
	jmp generic_exception_routine


gpf_routine:
	cli
	pushl $13
	jmp generic_exception_routine


#+---------------------------------------------------------------+
#+------------------------ Emulation ----------------------------+
#+---------------------------------------------------------------+

# This routine is called when emulating an instrucion is not possible
# We simoly return to the kernel code by restoring the esp saved when
# we jumped into user mode 
emulate_error:

# We are still in user mode, we need to restore the ds register to
# point to kernel data segment
mov $16, %ax
mov %ax, %ds

mov saved_esp, %esp
ret 