#include <stdint.h>

/* 
  we use the upper 4Mb of our virtual address space to map the
  page table entries pointed by the page directory
*/

#define PTD_BASE_VIRT 0xFFC00000
 
// macros for page address manipulation
#define CEIL(addr) (addr + PAGE_SIZE - 1) & ~(PAGE_SIZE - 1)
#define FLOOR(addr) addr & ~(PAGE_SIZE - 1) 

#define PAGE_SIZE 0x1000
typedef uint8_t paddr_t;

/* Values of physical boundaries of memory */
void _kernel_p_end(void);
void _kernel_p_start(void);

void print_kernel_end(void);
void pmm_init(uint32_t kernel_start, uint32_t kernel_end, uint32_t mem_end);
