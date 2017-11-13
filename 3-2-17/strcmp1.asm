
section .bss
  len1 resd 1
  len2 resd 1

section .text

global strcmp1
extern strlen1


strcmp1:
     
     push ebp
     mov ebp,esp
     mov ebx,[ebp+8]
     
     push ebx
     call strlen1
     add esp,4
     mov dword[len1],eax
     
     mov ecx,[ebp+12]
     push ecx
     call strlen1
     add esp,4
     mov dword[len2],eax

     cmp eax,dword[len1]
     jnz notequal
     
     mov edx,0
     mov ebx,[ebp+8]
     mov ecx,[ebp+12]     
check:
       cmp dword[len1],edx
       jz equal
       mov al,byte[ebx]
       cmp al,byte[ecx]
       jnz notequal
       inc ebx
       inc ecx
       inc edx
       jmp check
    

equal: mov eax,0
       mov esp,ebp
       pop ebp
       ret

notequal:
       mov eax,-1
       mov esp,ebp
       pop ebp
       ret

