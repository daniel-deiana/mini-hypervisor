#include <stdint.h>
#include "uvideo.h"

static const unsigned int screen_width  = 80;
static const unsigned int screen_height = 25;

static unsigned int x, y;
static uint8_t color;
static uint16_t *screen;

void clear(void)
{
  unsigned int i, j;

  x = 0;
  y = 0;
  color = char_color(grey, black);
  screen = (uint16_t*)0xB8000;
  for (i = 0; i < screen_height; i++) {
    for (j = 0; j < screen_width; j++) {
      screen[i * screen_width + j] = vga_entry(' ', color);
    }
  }
}

void terminal_setcolor(uint8_t c)
{
    color = c;
}

void terminal_putentryat(char c, uint8_t col, int column, int row)
{
  screen[row * screen_width + column] = vga_entry(c, col);
}

void cputc(char c)
{
  if (c == '\n') {
    x = 0;
    if (y++ == screen_height) {
      y = 0;
    }

    return;
  }

  terminal_putentryat(c, color, x, y);
  if (x++ == screen_width) {
    x = 0;
    if (y++ == screen_height) {
      y = 0;
    }
  }
}
