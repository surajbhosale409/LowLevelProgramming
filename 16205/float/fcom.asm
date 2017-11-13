section .data
a dq 29.0
b dq 20.1
pfmt db "Max is %f",10,0


section .text
global main
extern printf

main:
 	fld qword[b]
	fld qword[a]
	fcom
	fstsw ax
	SAHF
	jb pp
	sub esp,8
	fstp qword[esp]
	push pfmt
	call printf
	add esp,12
	ret
pp:
        fstp qword[b]
	sub esp,8
	fstp qword[esp]
	push pfmt
	call printf
	add esp,12
	ret
