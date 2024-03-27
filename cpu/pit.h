#ifndef PIT_H
#define PIT_H

#define PIT_CH0_DATA 0x40
#define PIT_CH1_DATA 0x41
#define PIT_CH2_DATA 0x42
#define PIT_COMMAND  0x43


#define RATE_GENERATOR_CMD 0x18

void pit_handler(regs_t *regs);
void pit_init(uint32_t frequency);

#endif