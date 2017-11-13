
 ;printf la error det hot kashamule tari so write call use kela ahe  comments read kr write call chya mhnje kalel

section .data
	msg db "my name is",0
	msg1 db "samruddhi",0
        msg2 db "%s",10,0

section .bss
	constrng resb 25

section .text
        extern printf
	global main
	
main:
	mov eax,msg          ;first string cha address
 	mov ecx,constrng      ; destination string address
        mov ebx,0             ;character counter ha write call la string length denyasathi use hoto

abc:    cmp byte[eax],0
	jz abc1
	mov dl,byte[eax]
	mov byte[ecx],dl
	inc eax
	inc ecx
        inc ebx    ;ebx as counter work hoel atta hya loop sathi ani kiti characters copy krtoy tyacha count store krel for first string
	jmp abc
	

abc1:
        mov eax,msg       ;ata eax madhech second string cha address yeil
	
abc11:
        cmp byte[eax],0
	jz abc2
	mov dl,byte[eax]
	mov byte[ecx],dl
	inc ebx            ; ebx ithe pn as character count work hoel and second string che character count krel
        inc eax
	inc ecx
	jmp abc11

abc2:	mov edx,ebx          ;write call krtana edx madhe string length dyavi lagte so ebx madhe aleli lenght edx madhe copy keli
        mov eax,4             ; write call sathi eax madhe 4 copy karava lagta
        mov ebx,0             ; write call sathi ebx madhe 0 copy karava lagta
        mov ecx,constrng       ; write call krtana ecx madhe string cha start address dyava lagto 
   
        int 80h                ;int 80 ne write call hoto
        

        ;push constrng
	;push msg2
	;call printf
	;add esp,8
        

        ret
	
	
