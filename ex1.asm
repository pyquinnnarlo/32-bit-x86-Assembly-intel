global _start
_start:
  mov eax, 1 ; exit system call
  mov ebx, 13 ; error code
  int 0x80 ; interrupt
