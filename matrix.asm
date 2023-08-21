%include "io.mac"

section .data
    ROWS EQU 3
    COLUMNS EQU 3
    m1  
        dw 20, 10, 5
        dw 5, 12, 3
        dw 4, 1, 0

    m2  
        dw 10, 11, 12
        dw 13, 14, 15
        dw 16, 17, 18


section .bss
    result resw 9
    number resw 1
    string resb 10

section .text
global _start
_start:
    mov ecx, ROWS   ; Iterar nas linhas usando ecx
    mov ebx, 0      ; Começar na primeira linha
    mov esi, 0      ; Começar na primeira coluna
    mov ah, 0
    mov dh, 0

sum_loop:
    mov al, [m1 + ebx + esi * 2]
    mov dl, [m2 + ebx + esi * 2]
    add al, dl                      ; m1[i][j] + m2[i][j] (j = esi, i = ebx)
    mov [result + ebx + esi * 2], al ; result = soma acima
    PutInt [result + ebx + esi * 2]
    PutCh 0x20
    inc esi                         ; j++
    cmp esi, COLUMNS        
    jb sum_loop                     ; soma enquanto j < COLUMNS ?
    add ebx, COLUMNS * 2            ; Incrementa EBX no tamanho da coluna (vai para próxima linha)
    mov esi, 0
    nwln
    loop sum_loop                   ; Faz o loop até que ecx (inicialmente igual a ROWS) atinja 0

    mov eax,1                       ; Exit program
    mov ebx,0
    int 80h 
