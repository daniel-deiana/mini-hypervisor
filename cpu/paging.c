#include "paging.h"
#include "pmm.h"

static page_table *page_directory = &page_directory_table;

void paging_test(void) {
  page_directory->entries[0] = 0;
  printf("il contenuto dell ultima entry della directory e' %x\n", page_directory->entries[1023]);
}
