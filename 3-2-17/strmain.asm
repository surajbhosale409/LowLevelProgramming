section .data
  str1 db "Hello",0
  str2 db "Hello",0
  str3 db "Hiii",0
  str4 db "level",0  
 
  msg db "%d",10,0
  lenmsg db "%s String is of %d length",10,0
  cpymsg db "Copied String is %s",10,0
  revmsg db "%s String after reversing",10,0
  cmpeqmsg db "%s and %s strings are equal",10,0
  cmpneqmsg db "%s and %s strings are not equal",10,0
  palindmsg db "%s String is palindrome",10,0
  notpalindmsg db "%s String is not palindrome",10,0

section .text

global main
extern strlen1,printf,strrev1,strcpy1,strcmp1,strpalindrome

main :
      pusha
      push str1
      call strlen1 
      add esp,4
      push eax
      push str1
      push lenmsg
      call printf
      add esp,12
      popa



     pusha 
     push str1
     call strcpy1 
     add esp,4
     push eax
     push cpymsg
     call printf
     add esp,8
     popa


     pusha
     push str1
     call strrev1 
     add esp,4
     push eax
     push revmsg
     call printf
     add esp,8
     popa

     pusha
     push str1
     push str3
     call strcmp1 
     add esp,8
     cmp eax,0
     jz eq
     push str3
     push str1
     push cmpneqmsg
     call printf
     add esp,12
     cmp eax,0
     jnz palindrome

  eq:
     push str3
     push str1
     push cmpeqmsg
     call printf
     add esp,12
     popa    

palindrome:
    
     push str4
     call strpalindrome
     add esp,4
     cmp eax,0
     jz palind
     
     push str4
     push notpalindmsg
     call printf
     add esp,8

palind:
     push str4
     push palindmsg
     call printf
     add esp,8
    
     ret
