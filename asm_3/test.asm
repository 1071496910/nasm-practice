section .text
  global _start

_start:
  sub rsp,10
  sgdt [rsp]
  mov rax,0x0a31
  push rax
  ;mov rax,49
  ;push rax
  mov rax,1
  mov rdi,1
  mov rsi,rsp
  mov rdx,16
  syscall
  jmp exit


exit:
  mov rax,60
  mov rdi,1
  syscall
