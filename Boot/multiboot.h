#ifndef MULTIBOOT
#define MULTIBOOT

#define MULTIBOOT_INFO_MEMORY			0x00000001
#define MULTIBOOT_INFO_BOOTDEV			0x00000002
#define MULTIBOOT_INFO_CMDLINE			0x00000004
#define MULTIBOOT_INFO_MODS			0x00000008

#define MULTIBOOT_INFO_MEM_MAP			0x00000040
#define MULTIBOOT_INFO_DRIVE_INFO		0x00000080
#define MULTIBOOT_INFO_CONFIG_TABLE		0x00000100
#define MULTIBOOT_INFO_BOOT_LOADER_NAME		0x00000200
#define MULTIBOOT_INFO_APM_TABLE		0x00000400
#define MULTIBOOT_INFO_VIDEO_INFO		0x00000800

struct multiboot_info
{
  uint32_t flags;
  uint32_t mem_lower;
  uint32_t mem_upper;
  uint32_t boot_device;
  uint32_t cmdline;

  uint32_t mods_count;
  uint32_t mods_addr;

  char symbol_tables[16];

  uint32_t mmap_length;
  uint32_t mmap_addr;

  uint32_t drives_length;
  uint32_t drives_addr;
  uint32_t config_table;
  uint32_t boot_loader_name;
  uint32_t apm_table;

  uint32_t vbe_control_info;
  uint32_t vbe_mode_info;
  uint16_t vbe_mode;
  uint16_t vbe_interface_seg;
  uint16_t vbe_interface_off;
  uint16_t vbe_interface_len;
};

struct multiboot_mod_list
{
  uint32_t mod_start;
  uint32_t mod_end;
  uint32_t cmdline;
  uint32_t pad;
};

#define MULTIBOOT_MEMORY_AVAILABLE		1
#define MULTIBOOT_MEMORY_RESERVED		2
struct multiboot_mmap_entry
{
  uint32_t size;
  uint64_t addr;
  uint64_t len;
  uint32_t type;
} __attribute__((packed));
#endif
