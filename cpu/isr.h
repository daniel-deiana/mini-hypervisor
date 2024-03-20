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
} regs_t;

int emulate_high(unsigned int esp);

// common dispatcher for isr 
void isr_handler(regs_t regs); 

#endif