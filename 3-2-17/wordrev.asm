section .data

  str2 db "Hello my name is suraj",0  
  msg db "%s ",0
  msg1 db "%d",10,0

section .bss
  addr resd 1
  addr1 resd 1
  str1 resb 100


section .text

global main
extern strlen1,printf,strrev1

main :
     

     mov ecx,0
     mov edx,str1
     mov ebx,str2
loop:
     mov al,byte[ebx]
     cmp al,0
     jz return
     cmp al,' '
     jz rev
     mov byte[edx],al
     inc ecx
     inc ebx
     inc edx
     jmp loop
rev:
     mov dword[addr1],edx
     mov dword[addr],ebx
    
     pusha
     push ecx
     push msg1
     call printf
     add esp,8
     popa
     sub edx,ecx
     push edx
     call strrev1 
     add esp,4
     push eax
     push msg
     call printf
     add esp,8
     
     mov ecx,0
     mov ebx,dword[addr]
     mov edx,dword[addr1]
     inc ebx
     inc edx
     mov ecx,0
     jmp loop

return:
          ret
