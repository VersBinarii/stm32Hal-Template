ENTRY(Reset_Handler)

_estack = ORIGIN(SRAM) + LENGTH(SRAM);

MEMORY
{
	FLASH(rx): ORIGIN = 0x08000000, LENGTH = 512K
	SRAM(rwx): ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
	.isr_vector :
	{
		. = ALIGN(4);
		KEEP(*(.isr_vector))
		. = ALIGN(4);
	} >FLASH

	.text :
	{
		. = ALIGN(4);
		*(.text)
		*(.text.*)
		*(.init)
		*(.fini)
		*(.rodata)
		*(.rodata.*)
		. = ALIGN(4);
	} >FLASH

	_sidata = LOADADDR(.data);

	.data :
	{
		. = ALIGN(4);
		_sdata = .;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		_edata = .;
	} >SRAM AT> FLASH

	.bss :
	{
		_sbss = .;
		*(.bss)
		*(.bss.*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
	} >SRAM
}
