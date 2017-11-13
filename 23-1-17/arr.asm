section .text

extern printf

global main

 main:
 
	xor ecx,ecx
   abc:
	mov ebx,NumArr
	mov eax,dword[four]
	mul ecx
        add ebx,eax
	cmp dword[ebx],-1
	jz pqr
        pusha
        push dword[ebx]
        push format
        call printf
        add esp,8
        popa
        inc ecx
        jmp abc
   
    pqr: ret









section .data

format db "%d",10,0
four dd 4
NumArr dd 10,20,30,40,50,-1
