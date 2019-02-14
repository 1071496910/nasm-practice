section .data
  msg db      "hello, world!"

section .text
  global _start
_start:
  ;mov     rax, 1
  ;mov     rdi, 1
  ;mov     rsi, msg
  ;mov     rdx, 13
  ;syscall
  call foo

  call exit
  ;mov    rax, 60
  ;mov    rdi, 0
  ;syscall

exit:
  mov rax, 60
  mov rdi, 0
  syscall

foo:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 13
  syscall
  ret
