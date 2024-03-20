#include <stdint.h>
#include "Boot/uvideo.h"
#include "Boot/printf.h"
#include "io/io.h"
#include "cpu/pic.h"
#include "cpu/isr.h"
#include "cpu/pit.h"

#define FB_COMMAND_PORT         0x3D4
#define FB_DATA_PORT            0x3D5

/* The I/O port commands */
#define FB_HIGH_BYTE_COMMAND    14
#define FB_LOW_BYTE_COMMAND     15

struct IDT_entry {
  uint16_t offs_low;
  uint16_t sel;
  uint8_t  zero;
  uint8_t  flags;
  uint16_t offs_high;
} __attribute__ ((packed));

struct dt_register {
  uint16_t limit;
  uint32_t base;
} __attribute__ ((packed));

struct GDT_entry {
  uint16_t limit;
  uint16_t base_low;
  uint8_t  base_middle;
  uint8_t  type;
  uint8_t  granularity;
  uint8_t  base_high;
} __attribute__ ((packed));


static struct GDT_entry GDT[16] = {
  {0x00},
  {		// flat code segment
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x00,
    .type        = 0x9a,
    .granularity = 0xcf,
    .base_high   = 0x00
  },
  {		// flat data segment
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x00,
    .type        = 0x92,
    .granularity = 0xcf,
    .base_high   = 0x00
  },
  {		// flat code segment, 16 bit
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x00,
    .type        = 0xfa,
    .granularity = 0xcf,
    .base_high   = 0x00
  },
  {		// flat data segment, 16 bit
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x00,
    .type        = 0xf2,
    .granularity = 0xcf,
    .base_high   = 0x00
  },
  {		// 16 bit code segment
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x10,
    .type        = 0x9a,
    .granularity = 0x00,
    .base_high   = 0x00
  },
  {		// 16 bit data segment
    .limit    = 0xffff,
    .base_low = 0x00,
    .base_middle = 0x10,
    .type        = 0x92,
    .granularity = 0x00,
    .base_high   = 0x00
  },
  {		// task state
    .limit    = /*limTSS*/ 0,
    .base_low = /*theTSS*/ 0,
    .base_middle = 0x00,
    .type        = 0x89,
    .granularity = 0x00,
    .base_high   = 0x00
  },
};

static struct IDT_entry IDT[256];
static struct dt_register idtr = {256 * 8, (uint32_t)IDT};
static struct dt_register gdtr = {8 * 16, (uint32_t)GDT};
uint8_t TSSIOMAP[26 * 4 + 0x2001];

// external symbols
extern void *isr32;
extern void *isrGPF;

void guest(void);

extern int regMSW, regCR0;

void kmain(void)
{
  uint16_t *p;
  int trval = 56;

  clear();
  printf("Hello from the very stupid hypervisor!\n");

  p = (uint16_t *)&TSSIOMAP[25 * 4];
  *p = 0; *(p + 1) = 26 * 4;
  TSSIOMAP[26 * 4 + 0x2000] = 0xff;
  GDT[7].limit       = 26 * 4 + 0x2001;
  GDT[7].base_low    = (uint32_t)TSSIOMAP & 0xffff;
  GDT[7].base_middle = ((uint32_t)TSSIOMAP >> 16) & 0xff;
  GDT[7].base_high   = ((uint32_t)TSSIOMAP >> 24) & 0xff;

  // GPF 
  IDT[13].offs_low  = ((uint32_t)&isrGPF) & 0xffff;
  IDT[13].offs_high = (((uint32_t)&isrGPF) >> 16) & 0xffff;
  IDT[13].sel       = 8;
  IDT[13].flags     = /*0x8f*/ 0x8e;

  // INT3 instruction
  IDT[3].offs_low  = ((uint32_t)&isr32) & 0xffff;
  IDT[3].offs_high = (((uint32_t)&isr32) >> 16) & 0xffff;
  IDT[3].sel       = 8;
  IDT[3].flags     = /*0x8f*/ 0x8e;

  // IRQ0 
  IDT[32].offs_low  = ((uint32_t)&isr32) & 0xffff;
  IDT[32].offs_high = (((uint32_t)&isr32) >> 16) & 0xffff;
  IDT[32].sel       = 8;
  IDT[32].flags     = /*0x8f*/ 0x8e;

  asm volatile("sti");
  asm volatile("lgdt %0" : : "m"(gdtr));
  asm volatile ("lidt %0" : : "m" (idtr));
  asm volatile ("ltr  %0" : : "m" (trval));
  __asm__ __volatile__ (
	"\tljmp $8, $1f\n"
	"\t1:\n"
	"\tmovl $16,%%eax\n"
	"\tmovl %%eax,%%ds\n"
	"\tmovl %%eax,%%es\n"
	"\tmovl %%eax,%%fs\n"
	"\tmovl %%eax,%%gs\n"
	"\tmovl %%eax,%%ss\n"
	: : : "eax", "memory");
  printf("Going to invoke some real-mode code...\n");

  
  pic_remap(PIC1_OFFSET, PIC2_OFFSET);
  pic_unmask_irq(0x00);
  uint8_t pic_mask = pic_get_mask(1);

  
  pit_init(100);

  while(1) {}
}
