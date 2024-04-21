; nasm -f elf32 ex1.asm -o ex4.o
; ld -m elf_i386 ex4.o -o ex4
; ./ex4
; echo $?




global _start
_start:
  mov eax, 1   ; exit system call

  mov ebx, 13  ; error code
  jmp goto     ; Jump to "goto" label

  ; This instruction won't be executed
  mov ebx, 4   ; change "ebx" to 4

goto:
  int 0x80     ; interrupt
