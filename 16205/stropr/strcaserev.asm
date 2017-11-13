section .data
mystr db "ThIs Is A sAmPlE pRoGRaMmE",0
fmt db "%s",10,0

section .bss
temp resb 20


section .text

extern printf

global main

main:
  
    mov ebx,mystr
    mov edx,temp

loop:    
    cmp byte[ebx],0
    jz end
    mov al,byte[ebx]
    cmp al,32
    jz next
    cmp al,96
    jg toupper

tolower:
    add al,32
    jmp next

toupper:
    sub al,32
    jmp next

next: 
     mov byte[edx],al
     inc ebx
     inc edx
     jmp loop
    
end:
     mov byte[edx],0
     pusha
     push temp
     push fmt
     call printf
     add esp,8
     popa
     ret
     



