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
   ;code for -b+sqrt(b^2-4ac)
   fld qword[a]
   fld qword[c]
   fmul st1
   fild dword[four]
   fmul st1
   fld qword[b]
   fmul qword[b]
   fsub st0,st1
   fsqrt
   fld qword[b]
   fchs
   fadd st0,st1

   fst qword[c]
   sub esp,8
   fstp qword[esp]    
   push pfmt
   call printf
   add esp,12
      
 
   ret
