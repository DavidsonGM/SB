section .bss 
    lerei resb 2
    lerei2 resb 1

section .data
    dado db "B"
    linebreak db 0Ah

section .text
    global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, lerei2
    mov edx, 10
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, lerei
    mov edx, 1
    int 80h

    ; mov byte [lerei + 1], 0AH ; funciona

    mov al, [lerei]
    mov al, 0ah
    mov [lerei+1], al

    mov eax, 4
    mov ebx, 0
    mov ecx, lerei
    mov edx, 2
    int 80h

    mov eax, -2147483648 ; 2000000000
    cdq
    imul eax, 2

    mov eax, 32
    cdq
    mov ebx, 8
    idiv ebx

    mov eax, 4
    mov ebx, 0
    mov ecx, dado
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 0
    mov ecx, linebreak
    mov edx, 1
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
