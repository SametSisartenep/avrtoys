OUTPUT_FORMAT("elf32-avr","elf32-avr","elf32-avr")
OUTPUT_ARCH(avr:5)
MEMORY
{
	text		(rx)   : ORIGIN = 0, LENGTH = 128K
	data		(rw!x) : ORIGIN = 0x800060, LENGTH = 64K /* 0xffa0? */
	eeprom		(rw!x) : ORIGIN = 0x810000, LENGTH = 64K
	fuse		(rw!x) : ORIGIN = 0x820000, LENGTH = 1K
	lock		(rw!x) : ORIGIN = 0x830000, LENGTH = 1K
	signature	(rw!x) : ORIGIN = 0x840000, LENGTH = 1K
	user_signatures	(rw!x) : ORIGIN = 0x850000, LENGTH = 1K
}
SECTIONS
{
	.text :
	{
		*(.vectors)
		KEEP(*(.vectors))
		*(.start)
		*(.text)
		_etext = .;
	} >text
	.data :
	{
		*(.data)
		. = ALIGN(2);
		_edata = . ;
	} >data AT>text
	.bss ADDR(.data) + SIZEOF (.data) : AT (ADDR (.bss))
	{
		*(.bss)
		*(.bss*)
		*(COMMON)
		. = ALIGN(2);
	} >data
	.eeprom :
	{
		KEEP(*(.eeprom*))
	} >eeprom
	.fuse :
	{
		KEEP(*(.fuse))
		KEEP(*(.lfuse))
		KEEP(*(.hfuse))
		KEEP(*(.efuse))
	} >fuse
	.lock :
	{
		KEEP(*(.lock*))
	} >lock
	.signature :
	{
		KEEP(*(.signature*))
	} >signature
	_end = .;
}
