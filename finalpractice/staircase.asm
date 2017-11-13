%macro newln 0
 pusha
 mov eax,4
 mov ebx,0
 mov ecx,newline
 mov edx,1
 int 80h
 popa
%endmacro

section .data
  underscore db "_",0
  space db " ",0
  pipe db "|",0
  steps dd 5
  newline db 10

section .text
  global main
  extern printf


main:
	mov eax,8

        
	
	   mov ecx,eax

	   lp1:
	   	pusha
		mov eax,4
		mov ebx,0
		mov ecx,underscore
		mov edx,1
		int 80h
		popa
		loop lp1
       
           newln

       lp:
           cmp dword[steps],0
	   jz return

	   mov ecx,eax

	   lp2:
	   	pusha
 		mov eax,4
		mov ebx,0
		mov ecx,space
		mov edx,1
		int 80h
		popa
		loop lp2
	
           pipe1:
	   	pusha
         	mov eax,4
		mov ebx,0
		mov ecx,pipe
		mov edx,1
	        int 80h
	        popa

	   mov ecx,eax
           
           newln
           
	   lp3:
		pusha
 		mov eax,4
		mov ebx,0
		mov ecx,underscore
		mov edx,1
		int 80h
		popa
		loop lp3
	
	   pipe2:
	   	pusha
         	mov eax,4
		mov ebx,0
		mov ecx,pipe
		mov edx,1
	        int 80h
	        popa

           mov ecx,4

           lp4:
		pusha
 		mov eax,4
		mov ebx,0
		mov ecx,underscore
		mov edx,1
		int 80h
		popa
		loop lp4
	    
           newln
	   
	   add eax,4
	   dec dword[steps]
	   jmp lp


    return:

           mov ecx,eax
           lp5:
	   	pusha
		mov eax,4
		mov ebx,0
		mov ecx,space
		mov edx,1
		int 80h
		popa
		loop lp5
           
	   pipe3:
	    	pusha
		mov eax,4
		mov ebx,0
		mov ecx,pipe
		mov edx,1
		int 80h
		popa
			
           newln    

	   mov ecx,eax
           lp6:
	   	pusha
		mov eax,4
		mov ebx,0
		mov ecx,underscore
		mov edx,1
		int 80h
		popa
		loop lp6	
 	   
	   pipe4:
	    	pusha
		mov eax,4
		mov ebx,0
		mov ecx,pipe
		mov edx,1
		int 80h
		popa
    
           newln
	   newln
	   newln
     
     	   ret
