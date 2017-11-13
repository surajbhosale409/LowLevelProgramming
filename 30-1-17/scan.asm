section .bss

n resd 1
arr resd 10

section .data

frmt db "%d",0
pfmt db "%d",10,0

extern printf
extern scanf

global main

main:
     push n
     push frmt
     call scanf
     add esp,8
     mov ecx,0
     mov edx,0
loop:
     mov eax,4
     mov ebx,arr
     cmp ecx,dword[n]
     jz stop
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

stop:
     mov ecx,0
     mov edx,0




print:
      mov eax,4
      mov ebx,arr
      cmp ecx,dword[n]
      jz return
      mul ecx
      add ebx,eax
      pusha
      push dword[ebx]
      push pfmt
      call printf
      add esp,8
      popa
      inc ecx
      jmp print

return: 
      ret
