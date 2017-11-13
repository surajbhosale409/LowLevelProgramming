section .data
msg db "%d",10,0
n dd 0
a dd 0
b dd 1

section .text

global main
extern printf

main:
  mov eax,0
  mov ebx,1
  mov edx,5
loop:
  add eax,ebx
  mov ecx,eax
  mov eax,ebx
  mov ebx,ecx
  cmp edx,0
  jz loop1
  pusha
  push ecx
  push msg
  call printf
  popa
  add eax,ebx
  mov ecx,eax
  pusha
  push ecx
  push msg
  call printf
  popa
 add esp,8
  add esp,8
  dec edx
; jmp loop

loop1:
    ret
