#ifndef PIC_H
#define PIC_H

#define PIC1		0x20		/* IO base address for master PIC */
#define PIC2		0xA0		/* IO base address for slave PIC */
#define PIC1_COMMAND	PIC1
#define PIC1_DATA	(PIC1+1)
#define PIC2_COMMAND	PIC2
#define PIC2_DATA	(PIC2+1)

#define PIC1_OFFSET 0x20
#define PIC2_OFFSET 0x28

/* 
   reinitialize the PIC controllers, giving them specified vector offsets
   rather than 8h and 70h, as configured by default (BIOS default)
*/
 
#define ICW1_ICW4	       0x01		/* Indicates that ICW4 will be present */
#define ICW1_SINGLE	    0x02		/* Single (cascade) mode */
#define ICW1_INTERVAL4	 0x04		/* Call address interval 4 (8) */
#define ICW1_LEVEL	    0x08		/* Level triggered (edge) mode */
#define ICW1_INIT	       0x10		/* Initialization - required! */
 
#define ICW4_8086	       0x01		/* 8086/88 (MCS-80/85) mode */
#define ICW4_AUTO	       0x02		/* Auto (normal) EOI */
#define ICW4_BUF_SLAVE	 0x08		/* Buffered mode/slave */
#define ICW4_BUF_MASTER	 0x0C		/* Buffered mode/master */
#define ICW4_SFNM	       0x10		/* Special fully nested (not) */

#define PIC_EOI         0x20
#define IRQ_MASK_SLAVE  4

uint8_t pic_get_mask(int pic_num);
void pic_remap(uint32_t offset1, uint32_t offset2);
void pic_send_EOI(uint32_t intr_number);
void pic_unmask_irq(uint16_t irq_mask);

// initialize the pic and remap irq to correct isr's
#endif