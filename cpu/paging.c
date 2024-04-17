#include "paging.h"
#include "pmm.h"

static page_table *page_directory = &page_directory_table;

// NB: il codice causa page fault, controllare bene i mapping
void vmm_paging_test(void) {
  page_directory->entries[0] = 0;
  printf("il contenuto dell ultima entry della directory e' %x\n", page_directory->entries[1023]);

  // scrivo l'indirizzo fisico della nuova pt in una entry della directory
  page_directory->entries[769] = (unsigned long)pmm_alloc_frame() | PTE_US | PTE_P | PTE_RW;
  // ottengo l'indirizzo virtuale della nuova page table
  page_table *new_pt = (unsigned long)0xFFC00000 + (769 << 12);
  // aggiungo un mapping sulla nuova page table
  new_pt->entries[0] = pmm_alloc_frame() | PTE_US | PTE_P | PTE_RW;
  new_pt->entries[1] = pmm_alloc_frame() | PTE_US | PTE_P | PTE_RW;

  // provo a dereferenziare un indirizzo che ho appena mappato
   unsigned long *p = (unsigned long*)0xC0401000 ;
   printf("questo è una roba che non dovrebbe faultare %x", *p);
}

void * vmm_allocate_page(vaddr_t page_vaddr) {

}
