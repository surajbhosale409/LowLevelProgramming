section .data
	msg1 db "accept no of rows and columns for matrix1",10,0
	msg2 db "accept no of rows and columns for matrix2",10,0
	msg3 db "subtraction not possible",10,0
	msg4 db "addition is",10,0
	msg5 db "accept matrix1",10,0
	msg6 db "accept matrix2",10,0
	sf db "%d",0
	pf db "%d  ",0
	nl db "",10,0

section .bss
	row1 resd 1
	col1 resd 1
	row2 resd 1
	col2 resd 1
	matrix1 resd 10
	matrix2 resd 10
	result resd 10

section .text
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp,4

	push row1
	push sf
	call scanf
	add esp,8

	push col1
	push sf
	call scanf
	add esp,8

	push msg5
	call printf
	add esp,4
	
	mov eax,dword[row1]
	mul dword[col1]
	mov ecx,eax
	mov eax,matrix1



lp1:
	pusha
	push eax
	push sf
	call scanf
	add esp,8
	popa
	add eax,4
	loop lp1

	push msg2
	call printf
	add esp,4

	push row2
	push sf
	call scanf
	add esp,8

	push col2
	push sf
	call scanf
	add esp,8

	push msg6
	call printf
	add esp,4
	
	mov eax,dword[row2]
	mul dword[col2]
	mov ecx,eax
	mov eax,matrix2


lp2:
	pusha
	push eax
	push sf
	call scanf
	add esp,8
	popa
	add eax,4
	loop lp2


	mov eax,dword[row1]
	cmp dword[row2],eax
	jnz error
	mov eax,dword[col1]
	cmp dword[col2],eax
	jnz error


	mov eax,dword[row2]
	mul dword[col2]
	mov ecx,eax
	
	mov eax,matrix1
	mov ebx,matrix2
	mov edx,result

addn:	mov esi,dword[eax]
	mov dword[edx],esi
	mov esi,dword[ebx]
	sub dword[edx],esi
	add eax,4
	add ebx,4
	add edx,4
	loop addn

	push msg4
	call printf
	add esp,4

	mov eax,result
	mov ebx,dword[row2]

lp3:    mov ecx,dword[col2]
	
lp4:
	pusha
	push dword[eax]
	push pf
	call printf
	add esp,8
	popa
	add eax,4
	loop lp4

	pusha
	push nl
	call printf
	add esp,4
	popa

	dec ebx
	cmp ebx,0
	jnz lp3
	ret


error:
	push msg3
	call printf
	add esp,4
	ret
	
