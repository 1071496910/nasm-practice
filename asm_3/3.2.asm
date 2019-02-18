section .data
arg_err_msg: db "Args num must be 2!", 0xa
err_msg_len: equ 20
sys_exit: equ 60
sys_write: equ 1
stdout: equ 1
exit_code: equ 0
err_exit_code: equ 1

section .text
  global _start

_start:
  cmp [rsp], byte 3
  jne deal_err
  add rsp, 16
  pop rdi
  call atoi
  mov r10,rax
  pop rdi
  call atoi

  add rax,r10
  mov rdi,rax

  call itoa


  jmp exit

atoi:
  xor rax,rax
  mov rcx,10

atoi_lp:
  cmp [rdi],byte 0
  jz back
  mov bl,[rdi]
  sub bl,48
  inc rdi
  mul rcx
  add rax,rbx
  jmp atoi_lp

back:
  ret

itoa:
  xor rax,rax





deal_err:
  mov rax,sys_write
  mov rdi,stdout
  mov rsi,arg_err_msg
  mov rdx,err_msg_len
  syscall
  jmp err_exit

err_exit:
  mov rax,sys_exit
  mov rdi,err_exit_code
  syscall

exit:
  mov rax,sys_exit
  mov rdi,exit_code
  syscall
