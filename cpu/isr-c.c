#include <stdint.h>
#include "../boot/printf.h"
#include "isr.h"

void isr_handler(regs_t regs) 
{

  printf("ciao sono dentro l'interrupt n: %x routine definita prima!\n", 
  regs.intr_number);
  // uint32_t *handler = isr_handlers[regs.intr_number];
  // handler(regs);
};

int emulate_high(unsigned int esp)
{
  /* Memory address of the faulting instruction */
  /* +36 because before calling emulate i pushed all main registers
    with the pushal instr. so 32 + 4. the 4 is for the eip saved when the fault happened*/
  unsigned int *addr = (unsigned int *)(esp + 36);
  /* The faulty instruction itself, as 32-bit number */
  uint32_t *p = (unsigned int *)*addr;

  /*print eax, ecx, edx, ebx, esp, ebp, esi, and edi content to screen */

  uint32_t *stack_addr = (unsigned int *)(esp);

  for (int i = 0; i <= 7; i++) {
    int reg = (unsigned int*) *(stack_addr + i);
    printf("the content of the register is: %x\n", reg);
  }

  printf("Emulating instruction at address %x: %x\n", p, *p);

  if ((*p & 0xf8ffff) == 0xc0200f) {
    uint32_t reg, eax;

    printf("    It is 'mov cr0, <something>' ---> Emulate it!\n");

    /* <something> is a register... Find its index! */
    reg = (*p >> 16) & 0x07;
    reg = ~reg + 1;
    reg = reg + 7;
    printf("        Registed index: %d\n", reg);
    
    asm volatile ("mov	%%cr0, %%eax" : "=a" (eax) : );

    printf("        CR0 is %x\n", eax);
    eax &= ~1;
    eax &= ~0x8000;
    printf("        Corrected to %x\n", eax);
    p = (uint32_t *)(esp + reg * 4);
    *p = eax;
    *addr = *addr + 3;

    return 1;
  }

  printf("    Not emulated instruction: stop!\n");
  return 0;
}
