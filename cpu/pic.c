#include <stdint.h> 
#include "pic.h"
#include "../io/io.h"


/*  Inizialmente il PIC mappa le IRQ sugli interrupt della CPU che 
    si sovrappongono a quelli standard delle eccezzioni di x86 quindi
    attivando il controllore vannno rimappati
*/

void init_pic(int offset1, int offset2) 
{
  uint8_t mask1, mask2;

  mask1 = inb(PIC1_DATA);
  mask2 = inb(PIC2_DATA);

  // give init command (0x11)
  outb(ICW1_ICW4 | ICW1_INIT, PIC1_COMMAND);
  io_wait();
  outb(ICW1_ICW4 | ICW1_INIT, PIC2_COMMAND);
  io_wait();

  // tell them the offsets
  outb(offset1, PIC1_DATA);
  io_wait();
  outb(offset2, PIC2_DATA);
  io_wait();

  // telling how to set the master/slave
  outb(4, PIC1_DATA); // telling to expect the slave at IRQ2
  io_wait();

  outb(2, PIC2_DATA);
  io_wait(); // telling to the slave that is slave to itself


  // telling to work in 8086 mode (ma che vor di)
  outb(ICW4_8086, PIC1_DATA);
  io_wait();

  outb(ICW4_8086, PIC2_DATA);
  io_wait();


  // restoring the mask on both PICs
  outb(mask1, PIC1_DATA);
  outb(mask2, PIC2_DATA);
}