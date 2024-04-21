; nasm -f elf32 ex2.asm -o ex2.o
; ld -m elf_i386 ex2.o -o ex2
; ./ex2


section .data
  msg db "Hello Assembly", 0x0a    ; Define a string with the message "Hello Assembly" followed by a newline character (0x0a)
  len equ $ - msg                  ; Calculate the length of the string by subtracting the memory address of msg from the current location (the '$' symbol)

global _start
_start:
  mov eax, 4       ; Move the system call number for 'write' (syscall number 4) into EAX
  mov ebx, 1       ; Move file descriptor 1 (stdout) into EBX
  mov ecx, msg     ; Move the memory address of the message string into ECX
  mov edx, len     ; Move the length of the message into EDX
  int 0x80         ; Perform the system call

  ; Exiting the program
  mov eax, 1        ; syscall number for sys_exit
  xor ebx, ebx      ; exit code 0
  int 0x80          ; invoke syscall
