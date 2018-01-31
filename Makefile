#
# Makefile
# 2018-Jan-31
# xchgbxbx
#

CC=i686-elf-gcc



simple: kernel.o link run

all: boot.o kernel.o link

link:
	$(CC) -T src/linker.ld -o myos.bin -ffreestanding -O2 -nostdlib src/boot.o src/kernel.o -lgcc

boot.o: src/boot.asm
	nasm -felf32 src/boot.asm -o src/boot.o

kernel.o: src/kernel.c
	$(CC) -c src/kernel.c -o src/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra 

run:
	qemu-system-i386 -kernel myos.bin



