%include "macro.mac"


section .data

booms db "~~~BOOM~~~",0
clr db "clear",0
flame db "*~",0
dyn db "$$$$$",0
space db " ",0
t dd 1

section .text
global main
extern system,printf,puts,sleep

main:
     mov ecx,0
     mov edx,25


loop:
     cmp ecx,edx
     jz boom

     pusha 
     printch space,ecx
     popa
     
     pusha 
     push flame
     call puts
     add esp,4
     popa


     pusha
     printch space,edx
     popa

     pusha
     push dyn
     call puts
     add esp,4
     popa

     inc ecx
     
     pusha 
     push dword[t]
     call sleep
     add esp,4
     popa

     pusha 
     push clr
     call system
     add esp,4
     popa

     jmp loop
     
boom:
     pusha 
     push clr
     call system
     add esp,4
     popa

     pusha
     printch space,edx
     popa

     pusha 
     push booms
     call puts
     add esp,4
     popa

     ret
