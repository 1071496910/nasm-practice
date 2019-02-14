section .data
  msg: db "rax is 2!",0xa

section .text
  global _start

_start:
  mov rax,1
  call .mr
  cmp rax,2
  jne .exit
  jmp .alert

.mr:
  inc rax
  ret

.alert:
  mov rax,1
  mov rdi,1
  mov rsi,msg
  mov rdx,10
  syscall

  call .exit

.exit:
  mov rax,60
  mov rdi,0
  syscall
