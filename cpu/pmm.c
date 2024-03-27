#include "pmm.h"
#include "../boot/printf.h"

void print_kernel_end(void) {
  printf("la fine del kernel si trova all'indirizzo fisico: %x\n", 
  &_kernel_p_end);
}