	section .data
	str1 db "LEVEL",0
        len equ $-str1
        noteq db 10,"String is not palindrome",10,0
        neqlen equ $-noteq
	eq db 10,"String is palindrome",10,0
	eqlen equ $-eq
	

	
	section .bss
	str2 resb 30


	section .text

        global main

main:

        mov esi,str1
	mov edi,str2

	
	mov ecx,len
        dec ecx
	add esi,ecx
	mov ecx,len
	

	
lp:     std
	lodsb
	cld
	stosb
        loop lp
	
	
	
	mov eax,4
	mov ebx,1
	mov ecx,str2
	mov edx,len
	int 080h


        mov esi,str1
	mov edi,str2
        mov ecx,len
        inc edi
	
repz	cmpsb
        

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

	
	
        
