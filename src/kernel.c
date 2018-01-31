//
// kernel.c
// 2018-Jan-31
// xchgbxbx
//
// To build:
//	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
//

char *videoBuffer = (char*)0xb8000;

void kernel_main(void)
{
	videoBuffer[0] = 'H';
	videoBuffer[2] = 'e';
	videoBuffer[4] = 'l';
	videoBuffer[6] = 'l';
	videoBuffer[8] = 'o';
}
