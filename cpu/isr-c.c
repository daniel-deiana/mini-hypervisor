#include <stdint.h>
#include "../boot/printf.h"
#include "../cpu/pic.h"
#include "isr.h"

static isr_t isr_handlers[256];

void register_isr_handler(isr_t handler_code, uint32_t isr_num) {
  isr_handlers[isr_num] = handler_code;
}

void isr_handler(regs_t regs) 
{

  printf("ciao sono dentro l'interrupt n: %x routine definita prima!\n", 
  regs.intr_number);

  isr_t handler = isr_handlers[regs.intr_number];
  
  pic_send_EOI(regs.intr_number);
  handler(&regs);
};

void page_fault_handler(regs_t* regs) 
{
  printf("page_fault_handler: ERROR_CODE %x\n", regs->error_code);
  printf("page_fault_handler: EIP che ha generato il fault:  %x\n", regs->eip);
}

void gpf_handler(regs_t* regs) 
{
  printf("gpf_handler: ERROR_CODE %x\n", regs->error_code);
  printf("gpf_handler: EIP che ha generato il fault:  %x\n", regs->eip);
}

/*

int emulate_high(unsigned int esp)
{
  uint32_t *p = (unsigned int *)*addr;

  
  uint32_t *stack_addr = (unsigned int *)(esp);

  for (int i = 0; i <= 7; i++) {
    int reg = (unsigned int*) *(stack_addr + i);
    printf("the content of the register is: %x\n", reg);
  }

  printf("Emulating instruction at address %x: %x\n", p, *p);

  if ((*p & 0xf8ffff) == 0xc0200f) {
    uint32_t reg, eax;

    printf("    It is 'mov cr0, <something>' ---> Emulate it!\n");

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
*/
