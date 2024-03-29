#include "pmm.h"
#include "../boot/printf.h"


/*

typedef struct pframe_stack {
  pframe_stack * frame_next;  
} 


*/

/*

    -------------
--  | frame_next|
|   | --------- |
|   |           |  <--- physical page frame
|   -------------
--->|           |
    |           |
    |           |
    -------------
*/

static paddr_t *page_frame_start;
static paddr_t *page_frame_end;

void print_kernel_end(void)
{
  printf("la fine del kernel si trova all'indirizzo fisico: %x\n", 
  &_kernel_p_end);
}

void pmm_init(paddr_t kernel_start, paddr_t kernel_end, paddr_t mem_end) 
{

  // first free page right after the kernel 
  page_frame_start = (paddr_t)CEIL(_kernel_p_end);
  // last page of physical memory
  page_frame_end = (paddr_t)FLOOR(mem_end);

  printf("PAGE FRAME ALLOCATOR: prima pagina da poter allocare: %x\n", page_frame_start);
  printf("PAGE FRAME ALLOCATOR: ultima pagina da poter allocare: %x\n", page_frame_end);

  printf("PAGE FRAME ALLOCATOR: inizio del kernel: %x\n", kernel_start);
  printf("PAGE FRAME ALLOCATOR: fine del kernel: %x\n", kernel_end);
  
}
