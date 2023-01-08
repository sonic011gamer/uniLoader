ifdef CONFIG_MICROSOFT_SAANA
ENTRY(_start);
endif

OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
TARGET(binary)

INPUT(KERNEL_PATH)
INPUT(DTB_PATH)

SECTIONS
{
	ifdef CONFIG_MICROSOFT_SAANA
        _start = 0x80200000;
        . = 0x80200000;
	endif
	
        .boot : {
                arch/arm/Start.o
        }

        .dtb ALIGN(0x1000) : {
                dtb = .;
                DTB_PATH
        }

        .kernel ALIGN(0x1000) : {
                kernel = .;
                KERNEL_PATH
        }

        kernel_size = SIZEOF(.kernel);
}