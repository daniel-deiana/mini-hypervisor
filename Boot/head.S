#define STACK_SIZE			0x4000
#define MULTIBOOT_HEADER_FLAGS		0x00000003
#define MULTIBOOT_HEADER_MAGIC		0x1BADB002

#define PAGE_SIZE 0x1000

.section .multiboot.data, "a"
.align 4

header:
	.long	MULTIBOOT_HEADER_MAGIC
	.long	MULTIBOOT_HEADER_FLAGS
	.long	-(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
    .long _kernel_p_start
    .long _kernel_p_start
    .long _data_p_end
    .long _bss_p_end
    .long _start 

.section .multiboot.text, "ax"
.global _start
_start:
  
  // setting up identity paging and higher kernel paging  
  // edi punta alla page directory in memoria 
  movl $(page_table1 - 0xC0000000), %edi

  // current physical address stored in esi
  movl $0, %esi
  
  // number of physical pages to map (of first table)
  movl $1023, %ecx

t1:
  
  // mapping the kernel physical addresses in table1 
  cmpl $4096, %esi 
  jl t2
  cmpl $(_kernel_p_end - 0xC0000000), %esi
  jge t3

  movl %esi, %edx 
  orl $0x003, %edx
  movl %edx, (%edi)

t2:

  addl $4096, %esi
  addl $4, %edi
  loop t1

t3:
  // setting up 2 directory entries, one for identity one for higher half
	movl $(0x000B8000 | 0x003), page_table1 - 0xC0000000 + 1023 * 4
  movl $(page_table1 - 0xC0000000 + 0x003), page_directory_table - 0xC0000000 + 0
	movl $(page_table1 - 0xC0000000 + 0x003), page_directory_table - 0xC0000000 + 768 * 4

  movl $(page_directory_table - 0xC0000000), %ecx 
  movl %ecx, %cr3

  movl %cr0, %ecx
	orl $0x80010000, %ecx
	movl %ecx, %cr0

	# Jump to higher half with an absolute jump. 

 	jmp t4


.section .text
.code32
t4:  

	// movl $0, page_directory_table + 0

  movl %cr3, %ecx
	movl %ecx, %cr3

	movl	$(stack + STACK_SIZE), %esp
  cli
	//cmp $0x36d76289, %eax
	cmp $0x2BADB002, %eax
	jne wrong_multiboot_magic 
	pushl	%ebx

	jmp trampoline

wrong_multiboot_magic:
	mov $'1', %eax
	jmp error

.section .bss
stack:
	.skip STACK_SIZE 

page_directory_table:
  .skip PAGE_SIZE
page_table1:
  .skip PAGE_SIZE
