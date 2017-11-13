section .text


global strlen1



strlen1:
      push ebp
      mov ebp,esp
      mov ebx,[ebp+8]
      mov ecx,0 

loop:
     cmp byte[ebx],0
     jz return
     inc ecx
     inc ebx
     jmp loop


return:
       mov eax,ecx 
       mov esp,ebp
       pop ebp
       ret      
