%macro mult 2
 mov esi,%1
 mov edi,%2
 mov edx,0
 mov eax,esi
 mov ebx,edi
 mul ebx
%endmacro

section .data
sfmt db "%d",0
pfmt db "%d",10,0

section .bss
num dd 1

section .text
extern printf,scanf
global main

main:
     push num
     push sfmt
     call scanf
     add esp,8
     mov ecx,1
          
loop:
     cmp ecx,11
     jz end
     mult ecx,dword[num]
     pusha
     push eax
     push pfmt
     call printf
     add esp,8
     popa
     inc ecx
     jmp loop

end:
    ret      
