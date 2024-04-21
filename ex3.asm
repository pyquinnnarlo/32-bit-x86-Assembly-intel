section .data
    buffer resb 256  ; Reserve space for input buffer
    prompt db "You entered: ", 0x0a  ; Prompt message
    prompt_len equ $ - prompt

section .text
    global _start

_start:
    ; Read input from stdin
    mov eax, 3        ; System call number for read
    mov ebx, 0        ; File descriptor 0 (stdin)
    mov ecx, buffer   ; Buffer to store input
    mov edx, 256      ; Maximum number of bytes to read
    int 0x80          ; Perform system call

    ; Output prompt message
    mov eax, 4         ; System call number for write
    mov ebx, 1         ; File descriptor 1 (stdout)
    mov ecx, prompt    ; Message to output
    mov edx, prompt_len ; Length of the message
    int 0x80           ; Perform system call

    ; Output the data read from stdin
    mov eax, 4         ; System call number for write
    mov ebx, 1         ; File descriptor 1 (stdout)
    mov ecx, buffer    ; Data to output
    mov edx, 256       ; Length of the data read
    int 0x80           ; Perform system call

    ; Exit the program
    mov eax, 1         ; System call number for exit
    xor ebx, ebx       ; Exit code 0
    int 0x80           ; Perform system call
