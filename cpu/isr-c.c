#include <stdint.h>
#include "../boot/printf.h"
#include "../cpu/pic.h"
#include "paging.h"
#include "isr.h"

// pointer to the guest page table directory
uint32_t *guest_ptd;

static isr_t isr_handlers[256];

void register_isr_handler(isr_t handler_code, uint32_t isr_num) {
  isr_handlers[isr_num] = handler_code;
}

void isr_handler(regs_t regs) 
{

  //printf("ciao sono dentro l'interrupt n: %x routine definita prima!\n", 
//  regs.intr_number);

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
  // printf("gpf_handler: ERROR_CODE %x\n", regs->error_code);
  // printf("gpf_handler: EIP che ha generato il fault:  %x\n", regs->eip);
  emulate_high(regs);
}

int emulate_high(regs_t* regs)
{
  uint32_t *p = (unsigned int *)(regs->eip);  
  
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
    p = (uint32_t *)(regs->edx);
    *p = eax;
    regs->eip = regs->eip + 3;

    return 1;
  }
  
  /* Emulating mov reg, cr3 */  
  if ((*p & 0xffffff) == 0xd8220f) {
    
    printf("INSTRUCTION EMULATOR: Sto provando ad emulare mov eax, cr3\n");
    printf("INSTRUCTION EMULATOR: L'Indirizzo della page directory del guest e' %x \n", regs->eax);
    
    // Guest is loading its own pdt, trace it
    guest_ptd = (uint32_t)regs->eax;

    // Initialize shadow table
    vmm_init_shadow_table();

    regs->eip = regs->eip + 3;
    return 1; 
  }

  /* Instruction is not emulated, return to kernel code */
  printf("    Not emulated instruction: stop!\n");
  emulate_error();
}
