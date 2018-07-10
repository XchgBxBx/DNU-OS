//
// vga.h
// 2018-July-10
// xchgbxbx
//

#ifndef _KERNEL_VGA_H_
#define _KERNEL_VGA_H_

#include <stdint.h>

void VGAPutChatAt(char c, int x, int y, uint16_t color);
void VGAPutChar(char c);
void VGAClearScreenWithColor(uint16_t color);
void VGAClearScreen();

#endif // _KERNEL_VGA__H