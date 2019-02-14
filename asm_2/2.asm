section .data

  num1: equ 100
  num2: equ 40
  target: equ 150
  string: db `Right\n`
  len:  equ 6

section .text
  global _start

_start:
  mov rax,num1
  mov rbx,num2
  add rax,rbx

  cmp rax,150
  jne .exit
  jmp .right

.right:
  mov rax,1
  mov rdi,1
  mov rsi,string
  mov rdx,len
  syscall

  jmp .exit

.exit:
  mov rax,60
  mov rdi,0
  syscall
