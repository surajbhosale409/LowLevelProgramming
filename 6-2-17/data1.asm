section .data

mydata db "16205,SURAJ,M,MSC",10,10,"16206,PRIYANKA,F,MSC","16107,SUSHIL,M,MCA",0
fmt db "%d",10,0
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
      cmp ecx,5     
      jz lastcomma
      inc ecx
      inc ebx
      inc eax
      cmp ecx,3
      jz recordadd
      jmp loop

recordadd:

      mov eax,0
      mov edx,ebx
      jmp loop      

lastcomma: 
     inc ebx
     cmp byte[ebx],10
     jz print
     mov ecx,1
     mov edx,0
     mov eax,0
     jmp loop
 
print: 
      push ebx

      pusha
      push edx
      push fmt
      call printf
      add esp,8
      popa

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
