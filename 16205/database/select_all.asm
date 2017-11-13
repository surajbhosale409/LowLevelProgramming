	section .data
	str1 db "16202,priya auti,msc,f",0
	db "16101,karan aghav,mca,m",0
	db "16201,pravin ahire,msc,m",0
	db "16153,someone,mca,m",0,10

	str2 db "msc",0
	len2 equ $-str2

	msg db "select * from str1 where class=msc",10,0
	pf db "%c",0
	nn db 10,0
	pf1 db "%s",10,0

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
	pusha
	push nn
	push pf1
	call printf
	add esp,8
	popa
	mov ebx,esi
	cmp byte[ebx],10
	jz r1

lp2:
	inc esi
	cmp byte[esi],','
	jnz lp2

lp3:
	inc esi
	cmp byte[esi],','
	jnz lp3

lp4:
	inc esi
	mov edi,str2
	mov ecx,len2
	dec ecx

lp5:
	cmp ecx,0
	jz lp6

	mov al,byte[esi]
	cmp byte[edi],al
	jnz lp7

	inc esi
	inc edi
	dec ecx
	jmp lp5
lp7:
	inc esi
	cmp byte[esi],0
	jnz lp7
	inc esi
	jmp lp1

lp6:

	mov al,byte[ebx]
	cmp al,0
	jz lp7
	pusha
	push eax
	push pf
	call printf
	add esp,8
	popa

	inc ebx
	jmp lp6

r1:	ret
