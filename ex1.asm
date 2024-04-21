; nasm -f elf32 ex1.asm -o ex1.o
; ld -m elf_i386 ex1.o -o ex1
; ./ex1
; echo $?




global _start
_start:
  mov eax, 1 ; exit system call
  mov ebx, 13 ; error code
  int 0x80 ; interrupt
