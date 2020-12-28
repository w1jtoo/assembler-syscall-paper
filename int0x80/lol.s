.data
msg:        .ascii  "Hello, asm!\n"
msgl        = . - msg

.globl _start
.text

_start:
    mov     $msgl,  %rdx        # len of msg
    mov     $msg,   %rcx        # ptr to msg
    mov     $1,     %rbx        # stdout descriptor
    mov     $4,     %rax        # sys_write
    int     $0x80               # call kernel

    mov     $1, %rax            # sys_exit
    int     $0x80               # call kernel
