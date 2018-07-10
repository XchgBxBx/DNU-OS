#
# Makefile
# 2018-Jan-31
# xchgbxbx
#

CC=i686-elf-gcc

CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra

SOURCES=\
	src/vga.c\
	src/kernel.c

OBJS=\
	boot.o\
	vga.o\
	kernel.o

fast: kernel link

all: boot kernel link

link:
	$(CC) -T src/linker.ld -o myos.bin -ffreestanding -O2 -nostdlib $(OBJS) -lgcc

boot: src/boot.asm
	nasm -felf32 src/boot.asm -o boot.o

kernel:
	$(CC) -c $(SOURCES) $(CFLAGS)

run:
	qemu-system-i386 -kernel myos.bin



