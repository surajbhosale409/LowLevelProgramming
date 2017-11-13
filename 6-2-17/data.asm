section .data

mydata db "16205,SURAJ,M,MSC",10,10,"16206,PRIYANKA,F,MSC","16107,SUSHIL,M,MCA","16221,SAGAR,M,MSC",0
newline db 10,0

section .bss
temp resb 20


section .text

extern printf
global main

main:
    
    mov ebx,mydata
    mov ecx,1 
    mov eax,0
    mov edx,0  
         

 loop:   
    cmp byte[ebx],0
    jz return
    ;cmp byte[ebx],10
    ;jz newline
    cmp byte[ebx],','
    jz comma
    inc eax
    inc ebx
    jmp loop


comma:
      cmp ecx,2     
      jz nextcomma
      inc ecx
      inc ebx
      mov eax,0
      mov edx,ebx
      jmp loop      

nextcomma: 
     inc ebx
     cmp byte[ebx],'M'
     jz gcheck
     cmp byte[ebx],'F'
     jz gcheck
     mov ecx,1
     mov edx,0
     mov eax,0
     jmp loop
 
gcheck:
       inc ebx
       cmp byte[ebx],','
       jz print
       mov ecx,1
       inc ebx
       jmp loop

print: 
      push ebx
      mov ecx,edx
      mov edx,eax
      mov eax,4
      mov ebx,1
      int 0x80
      
      mov ecx,newline
      mov edx,1
      mov eax,4
      mov ebx,1
      int 0x80

      pop ebx
      inc ebx
      mov ecx,1
      mov eax,0
      mov edx,0
      jmp loop

return:
      ret
