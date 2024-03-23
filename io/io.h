#include <stdint.h>

#ifndef IO_H 
#define IO_H

uint8_t inb(uint16_t port);
uint16_t inw(uint16_t port);

void outb(uint8_t data, uint16_t port);
void outw(uint16_t data, uint16_t port);

static inline void io_wait(void) {
  outb(0, 0x80);
}

#endif