#include <stdint.h>

// macros for page address manipulation
#define CEIL(addr) (addr + PAGE_SIZE - 1) & ~(PAGE_SIZE - 1)
#define FLOOR(addr) addr & ~(PAGE_SIZE - 1) 

#define PAGE_SIZE 0x1000
typedef uint32_t paddr_t;

/* Values of physical boundaries of memory */
void _kernel_p_end(void);
void _kernel_p_start(void);

void print_kernel_end(void);

