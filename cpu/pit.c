#include <stdint.h>
#include "isr.h"
#include "pit.h"
#include "../boot/printf.h"
#include "../io/io.h"

static void pit_handler(void) {
  printf("sono all interno dell handler per il timer\n");
}

void pit_init(uint32_t frequency) {

  // set the handler for timer interrupts
  register_isr_handler(&pit_handler, 32);

  // test: setting the pit to generate periodical IRQ0 signalss
  uint32_t divisor = 1193180 / frequency;

  // Send the command byte.
  outb(0x36, 0x43);

  // Divisor has to be sent byte-wise, so split here into upper/lower bytes.
  uint8_t l = (uint8_t)(divisor & 0xFF);
  uint8_t h = (uint8_t)((divisor >> 8) & 0xFF);

  // Send the frequency divisor.
  outb(l, 0x40);
  outb(h, 0x40);
}

