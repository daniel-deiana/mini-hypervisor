#include <stdint.h> 
#include "pic.h"
#include "../io/io.h"
#include "../boot/printf.h"



/*  Inizialmente il PIC mappa le IRQ sugli interrupt della CPU che 
    si sovrappongono a quelli standard delle eccezzioni di x86 quindi
    attivando il controllore vannno rimappati
*/

void pic_remap(uint32_t offset1, uint32_t offset2)
{
	uint8_t a1, a2;
	a1 = inb(PIC1_DATA);                        // save masks
	a2 = inb(PIC2_DATA);
	
	outb(ICW1_INIT | ICW1_ICW4 ,PIC1_COMMAND);  // starts the initialization sequence (in cascade mode)
	io_wait();
	outb(ICW1_INIT | ICW1_ICW4, PIC2_COMMAND);
	io_wait();
	
	outb(offset1, PIC1_DATA);                 // ICW2: Master PIC vector offset
	io_wait();
	outb(offset2, PIC2_DATA);                 // ICW2: Slave PIC vector offset
	io_wait();
	
	outb(IRQ_MASK_SLAVE, PIC1_DATA);                       // ICW3: tell Master PIC that there is a slave PIC at IRQ2 (0000 0100)
	io_wait();
	outb(2, PIC2_DATA);                       // ICW3: tell Slave PIC its cascade identity (0000 0010)
	io_wait();
 
	outb(ICW4_8086 ,PIC1_DATA);               // ICW4: have the PICs use 8086 mode (and not 8080 mode)
	io_wait();
	outb(ICW4_8086, PIC2_DATA);
	io_wait();
 
	outb(a1, PIC1_DATA);   // restore saved masks.
	outb(a2, PIC2_DATA);
}

void pic_send_EOI(uint32_t intr_num) 
{
	// se l'irq ci era arrivato dallo slave lo mandiamo a tutti e 2
	if (intr_num >= 0x28) {
		outb(PIC_EOI, PIC2_COMMAND);
	}
	outb(PIC_EOI, PIC1_COMMAND);
}


// TEST: unmask of all IRQs line 
void pic_unmask_irq(uint16_t irq_mask)
{
  outb(irq_mask, PIC1_DATA);
	outb(irq_mask, PIC2_DATA);
}



uint8_t pic_get_mask(int pic_num) {

	uint8_t mask = 0; 

	if (pic_num == 1) {
		mask = inb(PIC1_DATA);
	} else {
		mask = inb(PIC2_DATA);
	}

	return mask;
}