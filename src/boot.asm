;
; boot.asm
; xchgbxbx
; 2018-Jan-31
;
; Based on https://wiki.osdev.org/Bare_Bones_with_NASM
; Multiboot info: https://www.gnu.org/software/grub/manual/multiboot/multiboot.html
;
; Build with:
;	nasm -felf32 boot.asm -o boot.o
;

MBALIGN		equ 1<<0	; set bit 0
MEMINFO 	equ 1<<1	; set bit 1
FLAGS		equ MBALIGN | MEMINFO
MAGIC		equ	0x1BADB002
CHECKSUM 	equ	-(MAGIC + FLAGS)

section .multiboot
align 4
	dd	MAGIC
	dd	FLAGS
	dd	CHECKSUM

;-----------------------------------------

section .bss
align 16	; stack must be 16-byte aligned

stack_botom:
	resb 16384 	; 16 KiB

stack_top:

;------------------------------------------

section .text:

global _start:function (_start.end - _start)
_start:
	
	mov		esp, stack_top	; setup stack

	;
	; setup gdt
	; paging
	;

	extern 	kernel_main
	call 	kernel_main

	cli
.hang:
	hlt
	jmp 	.hang

.end:

