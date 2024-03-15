enum vga_color {
  black   = 0,
  blue    = 1,
  green   = 2,
  cyan    = 3,
  red     = 4,
  magenta = 5,
  brown   = 6,
  grey    = 7,
  dark_grey     = 8,
  light_blue    = 9,
  light_green   = 10,
  light_cyan    = 11,
  light_red     = 12,
  light_magenta = 13,
  light_brown   = 14,
  white         = 15,
};

static inline uint8_t char_color(enum vga_color line, enum vga_color background)
{
  return line | background << 4;
}

static inline uint16_t vga_entry(char ch, uint8_t color)
{
  return (uint16_t)ch | ((uint16_t)color << 8);
}

void clear(void);
void cputc(char c);

