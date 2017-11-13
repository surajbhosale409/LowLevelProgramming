%include "macro.mac"

section .data
 sfmt db "%d",0
 pfmt db "Factorial of %d is %d",10,0

 section .bss
 num resd 1

section .text
extern printf,scanf
global main

main:
     push num
     push sfmt 
     call scanf
     add esp,8
     
     fact dword[num]
end:
     push eax
     push dword[num]
     push pfmt
     call printf
     add esp,12
     ret
      


