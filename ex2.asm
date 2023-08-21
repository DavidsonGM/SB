section .data
Snippet db  'KANGAROO',0dH,0ah

section .text
global _start
_start: mov eax,4
        mov ebx,1
        mov ecx,Snippet
        mov edx,10
        int 80h
		mov ebx,Snippet		; ebx apontando para a String 'Kangaroo'
		mov eax, 8			; Tamanho da string (8 caracteres)
DoMore: add byte [ebx],32	; Desreferenciando ebx e somando 32 bytes ao seu valor (ASCII maiúsculo para ASCII Minúsculo)
		inc ebx				; Indo para o próximo caractere
		dec eax				; Decrementa contador
		jnz DoMore			; Continua loop enquanto contador não zera
		mov eax,4
		mov ebx,1
		mov ecx,Snippet
		mov edx,10
		int 80h
		mov eax,1
		mov ebx,0
		int 80h
