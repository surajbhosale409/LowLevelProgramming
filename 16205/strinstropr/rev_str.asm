section .data
     str1 db "pooja tathod",10,0
     len equ $-str1

     section .bss
     str2 resb 50

     section .text
     global main
     extern printf

     main:
     mov esi,str1
     mov edi,str2
     mov ecx,len
     dec ecx
     add esi,ecx
     dec esi

     lp1:
     std
     lodsb
     cld
     stosb
     loop lp1

     stop:
     push str2
     call printf
     add esp,4
     ret

