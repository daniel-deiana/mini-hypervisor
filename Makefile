CC32=x86_64-elf-gcc -m32
AS32=x86_64-elf-as --32
CC64=x86_64-elf-gcc -m64
AS64=x86_64-elf-as --64

CC=$(CC32)
AS=$(AS32)

CFLAGS=-fno-pic -fno-stack-protector -ffreestanding -g -Wall -O0
LDFLAGS=-nostdlib -Wl,-Bstatic -Wl,-Ttext -Wl,100000 -Wl,--build-id=none 
LDFLAGS=-static -nostdlib -T kern.ld 

BOOT_OBJS=kmain.o head.o trampoline64.o uvideo.o printf.o
APP_OBJS=kapp.o isr.o isr-c.o test-ring3.o io.o
#APP_OBJS=kapp.o

.SUFFIXES:
kernel: $(BOOT_OBJS) $(APP_OBJS)
	$(CC) $(LDFLAGS) $^ -o kernel

head.o: Boot/head.S
	$(CC) -c Boot/head.S

%.s: Boot/%.c
	$(CC32) $(CFLAGS) -fno-dwarf2-cfi-asm -S $<
%.s: %.c
	$(CC32) $(CFLAGS) -fno-dwarf2-cfi-asm -S $<

%.o: %.s
	$(CC) -c $<
%.o: Boot/%.s
	$(CC) -c $<
%.o: io/%.s
	$(CC) -c $< 

clean:
	rm -f *.o
	rm -f kmain.s printf.s
	rm -f kernel 
