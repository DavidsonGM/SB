section .data
response DB ' Y'
tablel TIMES 20 DW 0
namel DB 'Jim Ray'

section .text
global _start
_start: mov AL,[response]
        mov DX, [tablel]
        mov byte [response], 'N'
        mov byte [namel+4], 'K'

        ; inc DX
        ; mov DX, 0dH
        ; inc DX
        ; mov DX, 0aH

        ; ; Print AL
        ; and eax, 0Fh
        ; mov ecx, tablel
        ; mov eax, 4 
        ; mov ebx, 1
        ; mov edx, 3
        ; int 80h

        ; ; Quit
        ; mov eax, 1
        ; mov ebx, 0
        ; int 80h
