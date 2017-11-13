section .bss

n resd 1
arr resd 10

section .data

msg db "Enter how many numbers",10,0
msg1 db "Enter %d numbers",10,0
pfmt db "Average of entered numbers is %d",10,0
addmsg db  "Addition of entered numbers is %d",10,0
frmt db "%d",0

extern printf
extern scanf

global main

main:
     push msg
     call printf
     add esp,4


     push n
     push frmt
     call scanf
     add esp,8
     
     push dword[n]
     push msg1
     call printf
     add esp,8

 
     mov ecx,0
     mov edx,0
    
loop:
     mov eax,4
     mov ebx,arr
     cmp ecx,dword[n]
     jz add
     mul ecx
     add ebx,eax
     pusha
     push ebx
     push frmt
     call scanf
     add esp,8
     popa
     inc ecx
     jmp loop

add: 
     
    mov eax,0
    mov edx,0
    mov ecx,0
 abc:
      mov ebx,eax
      mov eax,4
      mul ecx
      mov edx,ebx
      mov ebx,arr
      add ebx,eax
      mov eax,edx
      cmp ecx,dword[n]
      jz pqr
      add eax,dword[ebx]
      inc ecx
      jmp abc


  pqr:
      pusha
      push eax
      push addmsg
      call printf
      add esp,8
      popa

      xor edx,edx
      div ecx
      push eax
      push pfmt
      call printf
      add esp,8
      ret



