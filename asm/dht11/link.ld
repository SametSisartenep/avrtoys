OUTPUT_FORMAT("elf32-avr","elf32-avr","elf32-avr")
OUTPUT_ARCH(avr:5)
MEMORY
{
	text		(rx)   : ORIGIN = 0, LENGTH = 32K
	data		(rw!x) : ORIGIN = 0x800100, LENGTH = 2303
	eeprom		(rw!x) : ORIGIN = 0x800900, LENGTH = 1K
}
SECTIONS
{
	.text :
	{
		*(.vectors)
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
		*(COMMON)
		. = ALIGN(2);
	} >data
	.eeprom :
	{
		*(.eeprom*)
	} >eeprom
	_end = .;
}
