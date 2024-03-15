#include <stdint.h>

#ifndef IO_H 
#define IO_H

void outb(uint8_t data, uint16_t port);
uint8_t inb(uint16_t port);

void outw(uint16_t data, uint16_t port);
uint16_t inw(uint16_t port);

#endif