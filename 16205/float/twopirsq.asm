section .data
   a dq 1.0
   b dq 4.0
   c dq 2.0
   two dd 2
   four dd 4
   pfmt db "%f",10,0

section .bss
   ;c resq 1

section .text
   global main
   extern printf
 
main:

   code for 2pir^2
   fld qword[a]
   fmul qword[a]
   fldpi
   fmul st1
   fild dword[two]
   fmul st1



   fst qword[c]
   sub esp,8
   fstp qword[esp]    
   push pfmt
   call printf
   add esp,12
      
 
   ret
