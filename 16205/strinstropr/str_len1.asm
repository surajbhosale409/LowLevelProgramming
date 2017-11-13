section .data
      str1 db "hellow world",10,0
      len equ $-str1
      msg dd "%d",10,0

section .text
      global main
      extern printf
 
main:
     mov ecx,len
     dec ecx
     dec ecx
     push ecx
     push msg
     call printf
     add esp,8
     ret

