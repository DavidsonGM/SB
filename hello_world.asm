section .data

msg db	'Hello World!',0dH,0ah ;0dh + 0ah = CR + LF (Quebra de linha)

section .text
global _start
_start: mov eax,4   ; System call ID (Syswrite)
		mov ebx,1   ; Primeiro argumento: file handler (stdout)
		mov ecx,msg ; segundo argumento: Ponteiro para a string
		mov edx,14  ; Terceiro argumento: Tamanho da string
		int 80h     ; System call
		mov eax,1   ; Sys exit
		mov ebx,0   ; Exit value
		int 80h
