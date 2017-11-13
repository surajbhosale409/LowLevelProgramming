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
  one db "1 ",0
  star db "*",0
  space db " ",0
  zero db "0 ",0
  n dd 5
  newline db 10
  prev dd 0
  linetoggle dd 1
  beenhere dd 0
 
section .text
  global main
  extern printf


main:
        mov eax,0
        
     lp:
        cmp eax,dword[n]
	jz reverse
        
		mov ecx,-1
  		lp1: 
	 	  	cmp ecx,eax
	   		jz spaces
	        
		        pusha
			mov eax,4
			mov ebx,0
			mov edx,2                
			
			cmp dword[prev],1
           		jz loadz
	   		cmp dword[prev],0
	   		jz loado
       		 here: 
		        int 80h
			popa
	   		inc ecx
           		jmp lp1
	 
		 loadz:
		 	mov ecx,zero
			mov dword[prev],0
			jmp here
               	 loado:
	 		mov ecx,one
			mov dword[prev],1
	                jmp here

        spaces:
	       cmp dword[beenhere],1
	       jz next
	       mov dword[beenhere],1
	       mov ecx,dword[n]
	       sub ecx,eax
	       dec ecx
	       pusha
	       mov eax,ecx
	       xor edx,edx
	       mul ecx
	       mov ecx,eax
	       dec ecx

		slp1:
		     cmp ecx,0
		     jz ryttri
                     pusha 
		     mov eax,4
		     mov ebx,0
		     mov ecx,space
		     mov edx,1
		     int 80h
		     popa
		     dec ecx
		     jmp slp1

              ryttri:
	             mov ecx,-1
		     jmp lp1



	next:   
	        mov dword[beenhere],0
	        cmp dword[linetoggle],0
		jz lineloado
		cmp dword[linetoggle],1
                jz lineloadz
          here1:
         	inc eax
	 	newln
	 	jmp lp
	   
          lineloado:
	            mov dword[prev],0
		    mov dword[linetoggle],1
		    jmp here1
          lineloadz:
	  	    mov dword[prev],1
		    mov dword[linetoggle],0
		    jmp here1

reverse:
          dec eax

	nlp:
        	cmp eax,0
		jz stop
        
		mov ecx,0
  		lp2: 
	 	  	cmp ecx,eax
	   		jz next1
	        
		        pusha
			mov eax,4
			mov ebx,0
			mov edx,2                
			
			cmp dword[prev],1
           		jz loadz1
	   		cmp dword[prev],0
	   		jz loado1
       		 here2: 
		        int 80h
			popa
	   		inc ecx
           		jmp lp2
	 
		 loadz1:
		 	mov ecx,zero
			mov dword[prev],0
			jmp here2
               	 loado1:
	 		mov ecx,one
			mov dword[prev],1
			jmp here2

	next1:   
	        cmp dword[linetoggle],0
		jz lineloado1
		cmp dword[linetoggle],1
                jz lineloadz1
          here3:
         	dec eax
	 	newln
	 	jmp nlp
	   
          lineloado1:
	            mov dword[prev],0
		    mov dword[linetoggle],1
		    jmp here3
          lineloadz1:
	  	    mov dword[prev],1
		    mov dword[linetoggle],0
		    jmp here3




     stop:        
   	 ret
