.data
msg:        .ascii  "Hello, asm!\n"
msgl        = . - msg

.globl _start
.text

_start:
    mov     $msgl,  %rdx        # len of msg
    mov     $msg,   %rsi        # ptr to msg
    mov     $1,     %rdi        # stdout descriptor
    mov     $1,     %rax        # sys_write
    syscall                     # call kernel

    mov     $60,    %rax        # sys_exit
    syscall                     # call kernel
