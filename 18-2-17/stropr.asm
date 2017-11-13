	section .data
	str1 db "This is a  String",0
        len equ $-str1

	str5 db "16205,SURAJ,MSC",0
        frmt db "%s",10,0
	fmt db "%d",10,0
	section .bss
	str2 resb 30
        str3 resb 30
	str4 resb 30
        str6 resb 30
	
	section .text

	extern printf

	global main

main:	

first:	
	mov esi,str1
	mov edi,str2
	mov ecx,len
	
	
rep	movsb
   
	
	push str2
	push frmt
	call printf
	add esp,8

	mov edi,str1
        mov al,'S'
	repnz scasb

        mov ecx,edi
	dec ecx
	sub ecx,str1
        mov esi,str1
	mov edi,str3
	
rep	movsb

	
        push str3
	push frmt
	call printf
	add esp,8

	
second:	

        mov ecx,len	
	mov edi,str1
        mov al,' '
	repnz scasb
        
        mov esi,edi
	mov edi,str4
	
rep	movsb

	
        push str4
	push frmt
	call printf
	add esp,8
	 

third:	

        mov edi,str5
	mov al,','
	repnz scasb
	
	mov edx,edi

	mov al,','
	repnz scasb
	mov ecx,edi
	dec ecx

	mov esi,edx
	sub ecx,edx

	
	mov edi,str6
	rep     movsb
	

        push str6
	push frmt
	call printf
	add esp,8


	ret
