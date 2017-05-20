section .data
  fUserMsg db 'Enter the first number: '
  lenF equ $ - fUserMsg 
  sUserMsg db 'Enter the second number: '
  lenS equ $ - sUserMsg 
  ansMsg db 'The answer is: '
  lenAns equ $ - sUserMsg 

section .bss
  fNum resb 2
  sNum resb 2
  ans resb 2 

section .text
  global _start

_start:

  ;Prompt user for first number
  mov eax,4
  mov ebx,1
  mov ecx,fUserMsg
  mov edx,lenF
  int 0x80

  ;read first number
  mov eax,3
  mov ebx,2
  mov ecx,[fNum]
  mov edx,1
  int 0x80

  ;Prompt user for second number
  mov eax,4
  mov ebx,1
  mov ecx,sUserMsg
  mov edx,lenS
  int 0x80

  ;read second number
  mov eax,3
  mov ebx,2
  mov ecx,[sNum]
  mov edx,1
  int 0x80

  ;multiply the numbers
  mov eax,[fNum]
  mov ebx,[sNum]
  mul ebx
  mov [ans],ebx
  
  ;Print the answer
  mov eax,4
  mov ebx,1
  mov ecx,ansMsg
  mov edx,lenAns
  int 0x80
  mov eax,4
  mov ebx,1
  mov ecx,ans
  mov edx,1
  int 0x80

  ;sys_exit
  mov eax,1
  int 0x80
  

