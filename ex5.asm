; nasm -f elf32 ex5.asm -o ex5.o
; ld -m elf_i386 ex5.o -o ex5
; ./ex5


global _start

section .text
_start:
    mov ebx, 1    ; start ebx at 1
    mov ecx, 6    ; number of iterations
label:
    add ebx, ebx  ; ebx += ebx
    dec ecx       ; ecx -= 1
    cmp ecx, 0    ; compare ecx with 0
    jg label      ; jump to label if greater
    mov eax, 1    ; sys_exit system call
    int 0x80
