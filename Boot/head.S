#define STACK_SIZE			0x4000
#define MULTIBOOT_HEADER_FLAGS		0x00010003
#define MULTIBOOT_HEADER_MAGIC		0x1BADB002

.section .multiboot
.align 4

/*
struct multiboot_header
{
  multiboot_uint32_t magic;
  multiboot_uint32_t flags; // Feature flags.

  multiboot_uint32_t checksum;

  // These are only valid if MULTIBOOT_AOUT_KLUDGE is set.
  multiboot_uint32_t header_addr;
  multiboot_uint32_t load_addr;
  multiboot_uint32_t load_end_addr;
  multiboot_uint32_t bss_end_addr;
  multiboot_uint32_t entry_addr;

  // These are only valid if MULTIBOOT_VIDEO_MODE is set.
  multiboot_uint32_t mode_type;
  multiboot_uint32_t width;
  multiboot_uint32_t height;
  multiboot_uint32_t depth;
};
*/

header:
	.long	MULTIBOOT_HEADER_MAGIC
	.long	MULTIBOOT_HEADER_FLAGS
	.long	-(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
        .long   header
        .long   header
        .long   _edata
        .long   _end
        .long   _start
.text
.code32
.globl _start
_start:
	movl	$(stack + STACK_SIZE), %esp

	pushl	$0
	popf
	//cmp $0x36d76289, %eax
	cmp $0x2BADB002, %eax
	jne wrong_multiboot_magic 
	pushl	%ebx

	jmp trampoline

wrong_multiboot_magic:
	mov $'1', %eax
	jmp error

.bss
stack:
	.skip STACK_SIZE 
