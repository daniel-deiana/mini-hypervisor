#define PAGE_SIZE 0x1000


.section	.data
#------------------------------------------------------------------
.globl saved_esp
.globl regCR0
.globl regMSW
regMSW:	.long		0		# for actual CR0 value
regCR0:	.long		0		# for the emulated CR0
saved_esp: .long	0
#------------------------------------------------------------------

.section	.text
.code32
.globl guest_code

guest_code:
	mov %esp, saved_esp

	# initialize the Task-State Segment's SS0:ESP0 fields
	mov	%esp, TSSIOMAP+4	# preserve ESP register
	mov	%ss,  TSSIOMAP+8	# and the SS register

	# setup current stack for 'return' to ring 3
	pushl	$0x0000			# image for GS register
	pushl	$0x0000			# image for FS register
	pushl	$0x0000			# image for DS register
	pushl	$0x0000			# image for ES register
	pushl	$35			# image for SS register: 32 + 3
	pushl	$tos3			# image for SP register
	pushl	$0x00000002		# image for EFLAGS (bit 1 must always be set)
	pushl	$27			# image for CS register: 8 + 3
	pushl	$trapdemo		# image for IP register
ir0:	iretl				# enter Ring 3

#------------------------------------------------------------------
trapdemo: # this procedure will be executed in Ring 3
	# setup segment-register DS to address our variables
	movw	$32, %ax		# address program data
	movw	%ax, %ds		# with DS register

	# here we try to execute a privileged 'mov' instruction
	movl %cr0, %edx		# current CR0 contents
	mov	%edx, regCR0		# written to a variable

	
	//+--------------------------------------------------------------+

	/*
		Guest tries to update the value of cr3 by putting the address of
		its own page table directory
	*/
f1:	movl $guest_page_directory, %eax
		movl %eax, %cr3

		

	/* Guest modifies the value of cr0 to enable paging */

	//+--------------------------------------------------------------+
	
	# then we execute the unprivileged 'smswl' instruction
f2:	smswl	%eax			# current MSW contents
	mov	%eax, regMSW		# written to a variable

	# now we try to execute the privileged 'hlt' instruction
	hlt				# triggers an exception

#------------------------------------------------------------------
	.align	16			# ensure stack alignment
	.space	512			# region for ring3 stack
tos3:					# label for the stacktop
.section	.data
	.align	0x1000

guest_page_directory:
	.skip 0x1000
guest_page_table1:
	.skip 0x1000 


#------------------------------------------------------------------
.end
