%macro strcaserev 1
mov esi,%1
%%loop:    
    cmp byte[esi],0
    jz end
    mov al,byte[esi]
    cmp al,32
    jz %%next
    cmp al,96
    jg %%toupper

%%tolower:
    add al,32
    jmp %%next

%%toupper:
    sub al,32
    jmp %%next

%%next: 
     mov byte[esi],al
     inc esi
     jmp %%loop

%endmacro

section .data
mystr db "ThIs Is A sAmPlE pRoGRaMmE",0
len equ $-mystr
fmt db "%s",10,0

section .bss
temp resb 20


section .text

extern printf

global main

main:
     strcaserev mystr 

end:
     mov byte[esi],0
     pusha
     push mystr
     push fmt
     call printf
     add esp,8
     popa
     ret
     



