section .data
 str1 db "My Name Is Suraj",0
 str2 db "Roll No- 16205",0

section .bss
 str3 resb 30

section .text
 global main
 extern printf


main:
     mov eax,str1
     mov ebx,str3
     mov edx,0

 l1: cmp byte[eax],0
     jz le1
     mov dl,byte[eax]
     mov byte[ebx],dl
     inc eax
     inc ebx
     inc edx
     jmp l1
 
 le1:
    mov byte[ebx],' ' 
    inc ebx
    mov eax,str2
    
 
 l2: cmp byte[eax],0
     jz le2
     mov dl,byte[eax]
     mov byte[ebx],dl
     inc eax
     inc ebx
     inc edx
     jmp l2

 le2:
    mov eax,4
    mov ebx,0
    mov ecx,str3
    int 80h
    ret
