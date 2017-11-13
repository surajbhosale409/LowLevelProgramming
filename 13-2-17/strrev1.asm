
section .bss
  str2 resb 20
  len resd 1


section .text

global strrev1
extern strlen1,printf


strrev1:
     push ebp
     mov ebp,esp
     mov ebx,[ebp+8]
     push ebx
     call strlen1
     add esp,4
     mov ecx,eax
     mov ebx,[ebp+8]
     mov edx,str2
     dec ecx
     add ebx,ecx

 abc:
     xor eax,eax
     mov al,byte[ebx]
     mov byte[edx],al
     dec ebx
     inc edx
     dec ecx
     cmp ecx,-1
     jz return
     jmp abc  

return:
     mov eax,str2
     mov esp,ebp
     pop ebp
     ret



