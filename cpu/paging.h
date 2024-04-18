#ifndef PAGING_H
#define PAGING_H 
#include <stdint.h>

// referring to global symbols as functions 
extern void page_directory_table(void);
extern void page_table_tmp(void);

#define PTD_BASE_ADDRESS 0xFFC00000

#define PAGE_SIZE  4096
#define PT_ENTRIES 1024

// page entry control bits
#define PTE_P   1 << 0
#define PTE_RW  1 << 1
#define PTE_US  1 << 2
#define PTE_PWT 1 << 3
#define PTE_PCD 1 << 4
#define PTE_A   1 << 5
#define PTE_AVL 1 << 6
#define PTE_PS  1 << 7

typedef uint8_t vaddr_t;
typedef uint32_t pt_entry;

typedef struct page_table {
  pt_entry entries[PT_ENTRIES];
} page_table;

void vmm_paging_test(void);

//+--------------------------+
int vmm_init_shadow_table(void);
int vmm_modify_page_attributes(unsigned long page_adddr, unsigned long page_attr);

#endif