#include <stdint.h>

#include "multiboot.h"
#include "uvideo.h"
#include "printf.h"


// print the main info about memory mappings
// test
void main(struct multiboot_info *mb_info)
{
  clear();
  
  printf("MB Info: %x\n", (uint32_t)mb_info);
  printf ("Multiboot Flags = 0x%x\n", mb_info->flags);

  if (mb_info->flags & MULTIBOOT_INFO_MEMORY) {
    printf("System memory:\n");
    printf("    Low memory:  %uKB\n", mb_info->mem_lower);
    printf("    High memory: %uKB\n", mb_info->mem_upper);
  } else {
    printf("No memory information provided by the bootloader!\n");
  }

  if (mb_info->flags & MULTIBOOT_INFO_BOOTDEV) {
    printf ("boot_device: 0x%x\n", (unsigned int)mb_info->boot_device);
  }
 
  if (mb_info->flags & MULTIBOOT_INFO_CMDLINE) {
    printf ("Command line: %s\n", (char *)mb_info->cmdline);
  }

  if (mb_info->flags & MULTIBOOT_INFO_MODS) {
    struct multiboot_mod_list *mod;
    int i;
      
    printf ("%d modules at 0x%x\n", (int)mb_info->mods_count, (int)mb_info->mods_addr);
    mod = (struct multiboot_mod_list *)mb_info->mods_addr;
    for (i = 0; i < mb_info->mods_count; i++) {
      printf("Module %d:\n", i);
      printf("    start: 0x%x\n", (uint32_t)mod->mod_start);
      printf("    end:   0x%x\n", (uint32_t)mod->mod_end);
      printf("    command line: %s\n", (char *)mod->cmdline);
      mod = mod + 1;
    }
  }

  if (mb_info->flags & MULTIBOOT_INFO_MEM_MAP) {
    uint32_t mmap_addr;
      
    printf("Memory map address: 0x%x\n", (unsigned int)mb_info->mmap_addr);
    printf("Memory map length:  0x%x\n", (unsigned int)mb_info->mmap_length);
    mmap_addr = mb_info->mmap_addr; 
    while (mmap_addr < mb_info->mmap_addr + mb_info->mmap_length) {
      struct multiboot_mmap_entry *mmap;

      mmap = (struct multiboot_mmap_entry *)mmap_addr;
        printf("Addr: %x\n", mmap_addr);
        printf("    %x %x --- %x %x (%x)\n",
               (uint32_t)(mmap->addr >> 32), (uint32_t)mmap->addr,
               (uint32_t)((mmap->addr + mmap->len) >> 32), (uint32_t)(mmap->addr + mmap->len),
               mmap->type); 

      mmap_addr += mmap->size + 4;
    }
  }

  if (mb_info->flags & MULTIBOOT_INFO_BOOT_LOADER_NAME) {
    printf("Bootloader name: %s\n", (char *)mb_info->boot_loader_name);
  } else {
    printf("No bootloader name!\n");
  }
  
  kmain();
}
