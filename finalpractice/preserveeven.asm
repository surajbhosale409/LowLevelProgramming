section .data
 arr1 dd 1,2,3,4,5,6,7,8,9,10
 fmt db "%d   ",0
 c dd 0
 two dd 2

section .bss
 arr2 resd 10

section .text
 global main
 extern printf

main:
     mov esi,arr1
     mov edi,arr2
     mov ecx,10
    

lp:
   cmp ecx,0
   jz printing
   mov ebx,esi
   lodsd
   mov edx,0
   div dword[two]
   cmp edx,0
   jz store
   dec ecx
   jmp lp
   

printing:
	 mov esi,arr2
	 mov ecx,dword[c]

print:
	lodsd
	pusha
	push eax
	push fmt
	call printf
	add esp,8
	popa
	loop print

	ret



store:
      mov eax,dword[ebx]
      stosd
      inc dword[c]
      dec ecx
      jmp lp
