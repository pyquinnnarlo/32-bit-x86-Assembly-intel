; nasm -f elf32 ex6.asm -o ex6.o
; ld -m elf_i386 ex6.o -o ex6
; ./ex6


global _start

section .data
    addr db "yellow"
    len equ $ - addr

section .text
_start:
    mov [addr], byte 'H'
    mov [addr+5], byte '!'
    mov eax, 4              ; sys_write system call
    mov ebx, 1              ; stdout file descriptor
    mov ecx, addr           ; bytes to write
    mov edx, len            ; number of bytes to write
    int 0x80                ; perform system call
    mov eax, 1              ; sys_exit system call
    mov ebx, 0              ; exit status is 0
    int 0x80
