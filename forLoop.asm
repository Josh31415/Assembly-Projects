section .data
  UserMsg db 'How many times do you want to loop: '
  len equ $ - UserMsg 

section .bss
  num resb 2

section .text
  global _start

_start:

  ;Prompt user for number of iterations 
  mov eax,4
  mov ebx,1
  mov ecx,UserMsg
  mov edx,len
  int 0x80

  ;read number of iterations
  mov eax,3
  mov ebx,2
  mov ecx,[num]
  mov edx,1
  int 0x80
  jmp lp

  ;convert to decimal number
  mov eax,[num]
  sub eax,'0'
  mov [num],eax

lp:
  mov eax,4
  mov ebx,1
  mov ecx,[num]
  mov edx,4
  int 0x80
  
  mov ax,[num]
  sub ax,1
  mov bx,0
  cmp ax,bx
  je lp

  ;sys_exit
  mov eax,1
  int 0x80
  

