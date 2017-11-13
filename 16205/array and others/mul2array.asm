
section .data
      arr dd 1,2,3,4,5
      arr1 dd 1,2,3,4,5
      msg db "%d",10
      mult dd 0

section .text
       global main
       extern printf

main:
       mov ebx, arr
       mov ecx,arr1
       mov edx,5

abc:
       cmp edx,0
       jz stop
       mov eax,dword[ebx]
       mul dword[ecx]
       mov dword[mult],eax
       pusha
       push dword[mult]
       push msg
       call printf
       add esp,8
       popa
       dec edx
       add ebx,4
       add ecx,4
       jmp abc

stop:
       ret
