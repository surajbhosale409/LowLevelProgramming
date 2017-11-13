section .data
  n1 dd 10
  n2 dd 20
 msg: db "additon = %d",10,0


section .text
   global main
   extern printf
main:
  mov ebx,dword[n1]
  mov eax,dword[n2]
 add ebx,eax
push ebx
push msg
call printf
add esp,8
ret
