section .data
     arr dd 1,2,3,4,5
     msg db "%d",10

section .text
     global main
     extern printf

main:
      mov edx,0
      mov ebx,arr
      mov ecx,5

abc:
      cmp ecx,0
      jz stop
      mov eax,dword[ebx]
      mul eax
     
      pusha
      push eax
      push msg
      call printf
      add esp,8
      popa
      dec ecx
      add ebx,4
      jmp abc


stop:
      ret
