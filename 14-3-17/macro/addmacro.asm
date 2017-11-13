%macro add2 2
 mov eax,%1
 mov ebx,%2
 add eax,ebx
%endmacro 

section .data
fmt db "%d",10,0

section .text
global main
extern printf

main:
     add2 5,4
     push eax
     push fmt
     call printf
     add esp,8
     ret
