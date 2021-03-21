ENTRY(init)

MEMORY
{
    mem : ORIGIN = 0x82000000, LENGTH = 16K
}
 
SECTIONS
{
	. = 0x82000000;
	
	begin = .;
	
	.text :
	{
		*(.boot)
		*(.text)
	} > mem
	
	.rodata :
	{
		*(.rodata)
	} > mem
	
	.data :
	{
		*(.data)
	} > mem
	
	.bss :
	{
		*(.bss)
	} > mem
	
	end = .;
}

