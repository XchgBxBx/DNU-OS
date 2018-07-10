//
// vga.c
// 2018-July-10
// xchgbxbx
//

#include "vga.h"

uint16_t* 		videoMemory = (uint16_t*)0xB8000;
const int 		terminalWidth  = 80;
const int 		terminalHeight = 25;
const uint16_t 	defaultColor = 14 | 8 << 4;

int cursorPosX = 0;
int cursorPosY = 0;

void VGAPutChatAt(char c, int x, int y, uint16_t color)
{
	videoMemory[(y * terminalWidth) + x] = (uint16_t) c | color << 8;
}

void VGAPutChar(char c)
{
	VGAPutChatAt(c, cursorPosX, cursorPosY, defaultColor);

	if(++cursorPosX == terminalWidth)
	{
		cursorPosX = 0;
		if(++cursorPosY == terminalHeight)
		{
			cursorPosY = 0;
		}
	}
}

void VGAClearScreenWithColor(uint16_t color)
{
	for(int x = 0; x < terminalWidth; x++)
	{
		for(int y = 0; y < terminalHeight; y++)
		{
			VGAPutChatAt(' ', x, y, color);
		}
	}
}

void VGAClearScreen()
{
	VGAClearScreenWithColor(defaultColor);
}
