#!/bin/bash



# check for multiboot 1, for multiboot 2 use --is-x86-multiboot2

if grub-file --is-x86-multiboot myos.bin; then
	echo multiboot verified
else
	echo FILE IS NOT MULTIBOOT!
fi



