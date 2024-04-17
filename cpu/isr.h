#ifndef ISR_H
#define ISR_H

#define ISR_IRQ_MIN 0x20
#define ISR_IRQ_MAX 48

#include <stdint.h>
// i parametri vengono pushati sullo stack partendo da quelli
// piu a dx verso quelli piu a sx, quindi quando eseguo la funzione
// al top dello stack mi ritrovo quelli di sx

/*print eax, ecx, edx, ebx, esp, ebp, esi, and edi content to screen */

// state of the cpu that we save entering an isr  
typedef struct registers 
{
  uint32_t edi;
  uint32_t esi;
  uint32_t ebp;
  uint32_t esp;
  uint32_t ebx;
  uint32_t edx;
  uint32_t ecx;
  uint32_t eax; 
  uint32_t intr_number;
  uint32_t error_code;
  uint32_t eip;
} regs_t;

// defines function pointer to isr
typedef void (*isr_t)(regs_t*);

void gpf_handler(regs_t* regs);
void page_fault_handler(regs_t* regs);
int  emulate_high(regs_t* regs);

// common dispatcher for isr
void isr_handler(regs_t regs);
void register_isr_handler(isr_t handler_code, uint32_t isr_num);

#endif