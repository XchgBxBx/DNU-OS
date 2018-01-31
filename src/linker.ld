/* 
	linker.ld
	2018-Jan-31
	xchgbxbx
*/

ENTRY(_start)

SECTIONS
{
	/*	Load kernel at 1MiB	*/
	. = 1M;

	/*	Multiboot header, followed by .text section	*/
	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}
	.data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}
}
