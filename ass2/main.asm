%include "macro.mac"

section .data
        newline db 10,0
	space db " ",0
	star db "*",0
        rf dd 0
	fmt db "%d",0

        pfmt db "Enter no of rows for traingle",10,0
	sfmt db "%d",0
        n dd 1


section .bss
	
	
section .text 
        extern printf,scanf
	global main
	
main: 

	


first:	
	
	mov ecx,1
        mov edx,4
	mov ebx,edx
	inc edx

	
loop:	cmp ecx,edx
	jz second
	mov eax,ebx
	sub eax,ecx
	pusha
        printch space,eax
        popa
        pusha
	printch star,ecx
        popa
	pusha
	printch newline,1
        popa
	inc ecx
	jmp loop
	
second:	

	printch newline,3
	
	
	mov ecx,1
        mov edx,4
	mov ebx,edx
	inc edx
	
loop1:	cmp ecx,edx
	jz third
	mov eax,ebx
	sub eax,ecx
	pusha
        printch space,eax
        popa

	pusha

here1:	cmp ecx,0
	jz next1
        pusha
	printch star,1
        popa
	pusha
	printch space,1
	popa
	dec ecx
	jmp here1	
next1:
	popa
	pusha
	printch newline,1
        popa
	inc ecx
	jmp loop1



third:	
        printch newline,3

	mov dword[n],1
	mov ecx,1
        mov edx,4
	mov ebx,edx
	inc edx
        
	
loop2:	cmp ecx,edx
	jz forth
	mov eax,ebx
	sub eax,ecx
	pusha
        printch space,eax
        popa
        pusha
	printch star,1
        popa
        pusha 
        cmp ecx,1
        jz nxt
        dec edx
        cmp ecx,edx
        jz nxt
        printch space,dword[n]
        mov ecx,dword[n]
        add ecx,2
        mov dword[n],ecx
    nxt:popa
	pusha
        cmp ecx,1
        jz nxt2
        cmp ecx,4
        jz nxt1
	printch star,1
        jmp nxt2
   nxt1:popa
        pusha
        inc edx
        printch star,edx
   nxt2:popa
        pusha
	printch newline,1
        popa
	inc ecx
	jmp loop2
	

forth:	
        printch newline,3

	mov dword[n],1
	mov ecx,2
        mov edx,4
        inc edx
	mov ebx,edx
	inc edx
        
	
loop22:	cmp ecx,edx
	jz stop
	mov eax,ebx
	sub eax,ecx
	pusha
        printch space,eax
        popa
        pusha
	printch star,1
        popa
        pusha 
        printch space,dword[n]
        mov ecx,dword[n]
        ;cmp dword[rf],1
        ;sub ecx,2
        ;cmp dword[rf],0
        add ecx,2
        mov dword[n],ecx
   nxtt:popa
	pusha
	printch star,1
  nxt22:popa
        pusha
	printch newline,1
        popa

        ;cmp dword[rf],1
	;dec ecx
        ;cmp dword[rf],0
        inc ecx
        
	jmp loop22
	
reverse:
        cmp ecx,1
        jz stop
        mov edx,dword[n]
        sub edx,2
        mov dword[n],edx
        mov dword[rf],1
        mov ecx,5
        mov edx,1
        jmp loop22

	
stop:	
	ret
