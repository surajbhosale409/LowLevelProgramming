section .data
	str1 db "16205,Suraj Bhosale,msc,m",0
	db "16107,sushil bhile,mca,m",0
	db "16201,pravin ahire,msc,m",0


	str2 db "msc",0
	len2 equ $-str2

	msg db "count rno from str1 where class=msc",10,0
	msg1 db "total count=%d",10,0

	section .bss
	n1 resd 1
	n2 resd 1

	section .text
	global main
	extern printf

main:
	push msg
	call printf
	add esp,4
	
	mov esi,str1
	xor ebx,ebx


lp1:
	cmp byte[esi],10
	jz r1

lp2:
	inc esi
	cmp byte[esi],','
	jnz lp2

lp3:
	inc esi
	cmp byte[esi],','
	jnz lp3

	inc esi
	mov edi,str2
	mov ecx,len2
	dec ecx

lp4:	cmp ecx,0
	jz lp5

	mov al,byte[esi]
	cmp al,byte[edi]
	jnz lp6

	inc esi
	inc edi
	dec ecx
	jmp lp4

lp5:	inc ebx
	
lp6:	inc esi
	cmp byte[esi],0
	jnz lp6

lp7:
	inc esi
	jmp lp1
	
r1:
	
	pusha
	push ebx
	push msg1
	call printf
	add esp,8
	popa
	ret
