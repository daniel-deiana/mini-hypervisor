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

/*
  Limiti dei frame allocabili
*/
static paddr_t *page_frame_start;
static paddr_t *page_frame_end;

/*
  Punta al prossimo frame libero da allocare
*/
static paddr_t *page_frame_next; 

void print_kernel_end(void)
{
  printf("la fine del kernel si trova all'indirizzo fisico: %x\n", 
  &_kernel_p_end);
}

void pmm_init(uint32_t kernel_start, uint32_t kernel_end, uint32_t mem_end) 
{

  // first free page right after the kernel 
  page_frame_start = (uint32_t)CEIL(_kernel_p_end);
  // last page of physical memory
  page_frame_end = (uint32_t)FLOOR(mem_end);

  page_frame_next = page_frame_start;

  printf("PAGE FRAME ALLOCATOR: prima pagina da poter allocare: %x\n", page_frame_start);
  printf("PAGE FRAME ALLOCATOR: ultima pagina da poter allocare: %x\n", page_frame_end);

  printf("PAGE FRAME ALLOCATOR: inizio del kernel: %x\n", kernel_start);
  printf("PAGE FRAME ALLOCATOR: fine del kernel: %x\n", kernel_end);
  
}


paddr_t * pmm_alloc_frame() 
{
  if (page_frame_next >= page_frame_end) {
    printf("PAGE FRAME ALLOCATOR: superato il numero massimo di pagine fisiche\n");
    return;
  }

  paddr_t *alloc_frame = page_frame_next;
  // manca controllo su allineamento del frame
  // questo codice non permette di implementare una free
  page_frame_next += PAGE_SIZE;
  return alloc_frame;
}
