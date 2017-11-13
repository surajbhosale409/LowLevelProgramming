section .data
	mat1 dd 1,2,3,4,5,6,7,8,9
	r dd 3
	c dd 3
        t dd 0
	four dd 4
        fmt db "%d",0
	nwln db 10


section .bss
        mat2 resd 9

section .text
	global main
	extern printf


main:
	mov esi,mat1
	mov edi,mat2
        
        mov ecx,0
	lp:
	   
            cmp ecx,3
	    jz print
           
	    pusha
	    mov eax,ecx
	    mul dword[four]
	    mov esi,mat1
	    add esi,eax
	    mov dword[t],esi
	    popa
	    mov esi,dword[t]

            mov edx,1
	    pusha
	    lp1:
	        
	        cmp edx,4
		jz next
		mov ecx,dword[esi]
                mov dword[edi],ecx
		add edi,4
		pusha
		mov eax,3
		mov edx,0
		mul dword[four]
		add esi,eax
		mov dword[t],esi
		popa
		mov esi,dword[t]
		inc edx
		jmp lp1

            next:
	        mov dword[t],edi
	        popa
		mov edi,dword[t]
	        inc ecx
		jmp lp


            print:
	    	mov edx,dword[r]
		mov esi,mat2
 
		plp:
		    cmp edx,0
		    jz stop

		    mov ecx,dword[c]
		    plp1:
		    	cmp ecx,0
			jz nextrow
                        mov eax,dword[esi]
			pusha
			push eax
			push fmt
			call printf
			add esp,8
			popa
			add esi,4
			dec ecx
			jmp plp1
	           nextrow:
		   	pusha
			push nwln
			call printf
			add esp,4
			popa
			dec edx
			jmp plp

	     stop: ret
		    
