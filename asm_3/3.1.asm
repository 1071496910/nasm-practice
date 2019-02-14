section .data
  blank: db " "

section .text
  global _start

_start:
  mov rax,rsp
  mov r10,[rsp]

main_loop:
  mov rdi,[rax+8]
  push rax
  call print_str
  call indent
  pop rax
  add rax,8
  dec r10
  cmp r10,byte 0
  jz exit
  jmp main_loop


print_str:
  ;;copy rdi
  mov r11,rdi
  mov rax,0

loop:
  cmp [r11], byte 0
  ;jz  debug_exit
  ;jz  exit
  jz  print
  inc r11
  inc rax
  ;cmp rax, byte 100
  ;je exit
  jmp loop

print:
  mov rdx,rax
  mov rsi,rdi
  mov rdi,1
  mov rax,1
  syscall
  ret

indent:
  mov rdx,1
  mov rsi,blank
  mov rdi,1
  mov rax,1
  syscall
  ret

debug_exit:
  ;mov rdi,rax
  mov rax,60
  syscall

exit:
  mov rax,60
  mov rdi,3
  syscall



