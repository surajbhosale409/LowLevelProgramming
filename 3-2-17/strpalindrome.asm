
section .bss
  revstr resb 50

section .text

global strpalindrome
extern strrev1,strcmp1


strpalindrome:
     
     push ebp
     mov ebp,esp
     mov ebx,[ebp+8]
     
     push ebx
     call strrev1
     add esp,4
     
     push eax
     push ebx
     call strcmp1
     add esp,8
     ret

   
