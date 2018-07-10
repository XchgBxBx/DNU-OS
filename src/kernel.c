//
// kernel.c
// 2018-Jan-31
// xchgbxbx
//

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "vga.h"

void kernel_main(void)
{
	VGAClearScreen();

	VGAPutChar('H');
	VGAPutChar('e');
	VGAPutChar('l');
	VGAPutChar('l');
	VGAPutChar('o');
}
