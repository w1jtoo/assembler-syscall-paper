# as --32 lol.s -o lol.out; ld lol.out -melf_i386 -o result; ./result

.data
msg:        .ascii  "Hello, asm!\n"
msgl        = . - msg

.globl _start
.text

_start:
    mov     $msgl,  %edx        # len of msg
    mov     $msg,   %ecx        # ptr to msg
    mov     $1,     %ebx        # stdout descriptor
    mov     $4,     %eax        # sys_write

    push    $_continue          # return adress
    push    %ecx                # same as int0x80, but put args on stack
    push    %edx
    push    %ebp
    mov     %esp,   %ebp
    sysenter                    # call kernel
_continue:

    mov     $1,     %eax        # sys_exit
    mov     $0,     %ebx
    push    %ecx
    push    %edx
    push    %ebp
    mov     %esp,   %ebp
    sysenter
