section .data
a db "Hello",0

section .bss
b resb 5

section .text
global main

main:
      mov al,'a'
      mov esi,a
      mov edi,b
      mov ecx,5
  repe movsb
