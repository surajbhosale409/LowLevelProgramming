	section .data
	str1 db "Hello world",0
        str2 db "level",0
	noteq db "String is not palindrome",0
        neqlen equ $-noteq
	eq db "String is palindrome",0
	eqlen equ $-eq
	
	section .bss
	str2 resb 30


	section .text

        global main

main:
	mov edx,str1
        push edx
	call strrev1

	cmp eax,0
	jnz notpalind
	mov eax,4
	mov ebx,1
	mov ecx,eq
	mov edx,eqlen
	int 80h
        ret
	


notpalind:
	mov eax,4
	mov ebx,1
	mov ecx,noteq
	mov edx,neqlen
	int 80h

     
	
        ret
