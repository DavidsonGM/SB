section .bss
input resw 1

section .data
linebreak db 0x0D, 0x0A

section .text
global _start

_start:
    mov eax, 3      ; Modo leitura
    mov ebx, 0      ; Ler do terminal
    mov ecx, input  ; Armazena em input
    mov edx, 1      ; Ler 2 bytes 
    int 0x80

    sub word [input], 0x30 ; ASCII para int

    push word [input]
    call is_prime

    mov word [input], ax
    add word [input], 0x30       ; Write int as byte
    mov eax, 4
    mov ebx, 0
    mov ecx, input
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 0
    mov ecx, linebreak
    mov edx, 2
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

is_prime:
    push ebp
    mov ebp, esp

    push bx
    push cx
    push dx             ; Salvando estado dos regs
    xor ebx, ebx          ; bx como contador
    xor ecx, ecx

    mov cx, [ebp + 8]   ; loop usando cx

count_divs: 
    mov ax, [ebp + 8]   ; Armazenando o parâmetro em ax
    cwd                 ; Extensão do sinal
    div cx              ; AX/CX -> Resultado em ax, resto em dx
    cmp dx, 0           ; Verifica resto 
    jne continue
    add bx, 1           ; Incrementa contador
    cmp bx, 2
    jg  result_false
continue:
    loop count_divs

    cmp bx, 2
    jne  result_false
    mov ax, 1
    jmp end_function

result_false:
    mov ax, 0

end_function:
    pop dx
    pop cx
    pop bx
    pop ebp
    
    ret 4

