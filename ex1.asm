; nasm -f elf32 <name.asm> -o <name.o>

; ld -m elf_i386 <name.o> -o <name>

; ./<name>



global _start
_start:
  mov eax, 1 ; exit system call
  mov ebx, 13 ; error code
  int 0x80 ; interrupt
