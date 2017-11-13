section .data
 fmt db "%d  ",0


section .text
 global main
 extern printf

main:
  
   
    mov ecx,5
    mov eax,0
    mov ebx,1
    mov edx,0
    
    pusha
    push eax
    push fmt
    call printf
    add esp,8
    popa

    pusha
    push ebx
    push fmt
    call printf
    add esp,8
    popa

lp:
    mov edx,0
    add edx,eax
    add edx,ebx
    pusha
    push edx
    push fmt
    call printf
    add esp,8
    popa
    mov eax,ebx
    mov ebx,edx
    loop lp

    ret

