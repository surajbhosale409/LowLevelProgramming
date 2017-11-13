%include "macro.mac"

section .data
str1 db "Suraj Rajendra ",0
str2 db "Bhosale",0
fmt db "%s",10,0

section .bss
str3 resb 100

section .text
global main
extern printf

main:
     strcat str1,str2,str3
stop:
     push str3
     push fmt
     call printf
     add esp,8
     ret
