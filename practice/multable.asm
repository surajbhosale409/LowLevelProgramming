section .data
 
 sfmt db "%d",0
 pfmt db "%d",10,0

section .bss
 num resd 1
 multable resd 10

section .text
 extern printf,scanf
 global main

main:
     push num 
     push sfmt
     call scanf
     add esp,8
     
     mov ecx,multable
     mov ebx,1
    
loop: 
     cmp ebx,11
     jz stop
     mov eax,dword[num]
     mov edx,0
     mul ebx
     mov dword[ecx],eax
     inc ebx
     add ecx,4     

     pusha 
     push eax
     push pfmt
     call printf
     add esp,8
     popa
    
     jmp loop

stop:
     ret  
