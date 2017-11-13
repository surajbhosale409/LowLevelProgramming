section .data
       arr dd 1,2,3,4,5
       min dd 1000
       msg db "manimum element is %d",0

section .text
       global main
       extern printf

main:
       xor eax,eax
       xor ecx,ecx
       mov ecx,5
       mov eax,arr
       mov ebx,dword[min]

abc:
       cmp ecx,0
       jz stop
       cmp ebx,dword[eax]
       jl next
       mov ebx,dword[eax]
       add eax,4
       dec ecx
       jmp abc

next:
       add eax,4
       dec ecx
       jmp abc

stop:
     push ebx
     push msg
     call printf
     add esp,8
     ret
