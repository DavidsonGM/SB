%include "io.mac"

; Write the following c program in assembly:
;
; int main() {
;     int a, b;

;     scanf("%d", &a);
;     scanf("%d", &b)
;     printf("Soma: %d", a + b);

;     return 0;
; }

section .data
    soma db "Soma: " 

section .text
global _start

_start:
call main
mov ebx, eax
mov eax, 1
int 0x80

main:
    push ebp
    mov ebp, esp

    sub esp, 4         ; Alocates space in stack for 2 ints

    GetInt [ebp - 2]   ; Read a
    GetInt [ebp - 4]   ; Read b
    
    PutStr soma

    mov ax, [ebp - 2]
    add ax, [ebp - 4]  ; a + b

    PutInt ax
    nwln

    add esp, 4          ; Free vars
    mov eax, 0           ; Return 0
    pop ebp
    ret
