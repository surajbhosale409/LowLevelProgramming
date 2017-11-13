section .text

extern printf

global main

 main:
        mov eax,0
        mov edx,0
	mov ecx,0
   abc:
	mov ebx,eax
	mov eax,dword[four]
	mul ecx
        mov edx,ebx
        mov ebx,NumArr
        add ebx,eax
        mov eax,edx
	cmp dword[ebx],-1
	jz pqr
        add eax,dword[ebx]
        inc ecx
        jmp abc
   
    pqr:
        xor edx,edx
	div ecx
        push eax
        push format
        call printf
        add esp,8
	ret









section .data

format db "%d %d",10,0
four dd 4
NumArr dd 10,20,30,40,50,-1
