#include "paging.h"
#include "pmm.h"

// Guest shadow paging structures
//+------------------------------------------------------------+
extern unsigned int * guest_ptd;

//+------------------------------------------------------------+

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

/*+-------------------------------------------------------------+*/
/*+------------------------Shadow paging------------------------+*/

/*
  This function modifies the attributes of a page given a pointer to its location in the virtual address space
  nb: it is better to have 2 pair of function for each page attribute (set/unset)
*/
int vmm_modify_page_attributes(unsigned long page_addr, unsigned long page_attr)
{
  // get the reference to the pte that points to the physical page
  unsigned long ptde_index = (page_addr >> 22) & 0x3ff;
  printf("valore dell indice della ptde %x\n", ptde_index);
  
  page_table *pt = (unsigned long)PTD_BASE_ADDRESS + ptde_index;
  unsigned long pte_index = (page_addr >> 12) & 0x3ff;
  printf("valore dell indice della pte %x\n", pte_index);

  printf("Il valore della pte che mi traduce l'indirizzo %x e' %x\n", page_addr,
  pt->entries[pte_index]);

  /*Set the page as Write protected,  */
  pt->entries[pte_index] &= (pt_entry)~PTE_RW;
  pt->entries[pte_index] &= (pt_entry)~PTE_US;
  pt->entries[pte_index] |= (pt_entry)PTE_P;

  printf("Il valore della pte che mi traduce l'indirizzo %x e' %x\n", page_addr,
         pt->entries[pte_index]);
}
/*
  This function Initializes a shadow page table for a guest virtual machine
  First it copies the hypervisor mappings , then intializes all other entries to 0 
*/
int vmm_init_shadow_table(void) 
{
  /* 
    Modify the write protection of the guest page table by making the page of the guest ptd write protected 
  */
  vmm_modify_page_attributes(guest_ptd, PTE_RW);

  return 1;
}
