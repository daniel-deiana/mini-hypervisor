CC32=x86_64-elf-gcc -m32 -g 
AS32=x86_64-elf-as --32 -g 
CC64=x86_64-elf-gcc -m64
AS64=x86_64-elf-as --64

CC=$(CC32)
AS=$(AS32)

CFLAGS=-fno-pic -fno-stack-protector -ffreestanding -g -Wall -O0
LDFLAGS=-nostdlib -Wl,-Bstatic -Wl,-Ttext -Wl,100000 -Wl,--build-id=none 
LDFLAGS=-static -nostdlib -T kern.ld 

BOOT_OBJS=kmain.o head.o trampoline64.o uvideo.o printf.o
APP_OBJS=kapp.o isr.o isr-c.o test-ring3.o io.o isr.o pic.o pit.o ps2_kbd.o
#APP_OBJS=kapp.o

.SUFFIXES:

monitor:
	telnet 127.0.0.1 1235

run: 
	qemu-system-x86_64 -d int -no-reboot -kernel kernel  -s -S -machine type=pc-i440fx-3.1 -monitor telnet:127.0.0.1:1235,server,nowait;


kernel: $(BOOT_OBJS) $(APP_OBJS)
	$(CC) $(LDFLAGS) $^ -o kernel

head.o: boot/head.S
	$(CC) -c Boot/head.S

# regole per compilare i file .c in .s 
%.s: boot/%.c
	$(CC32) $(CFLAGS) -fno-dwarf2-cfi-asm -S $<
%.s: cpu/%.c
	$(CC32) $(CFLAGS) -fno-dwarf2-cfi-asm -S $<
%.s: %.c
	$(CC32) $(CFLAGS) -fno-dwarf2-cfi-asm -S $<

# regole per assemblare i .s in .o
%.o: %.s
	$(CC) -c $<
%.o: boot/%.s
	$(CC) -c $<
%.o: io/%.s
	$(CC) -c $< 
%.o: cpu/%.s
	$(CC) -c $< 

# pulizia dei vari .o
clean:
	rm -f *.o
	rm -f kmain.s printf.s
	rm -f kernel 
