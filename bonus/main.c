#include <stdlib.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>

void segfault_sigaction(int signal, siginfo_t *si, void *arg)
{
    printf("Do not segfault!\n");
    exit(0);
}

void boo() {
    __asm__("mov 0xFFFF0000, %rax");
    return;
}

int main(void) {
    struct sigaction sa;
    memset(&sa, 0, sizeof(struct sigaction));
    sigemptyset(&sa.sa_mask);

    sa.sa_sigaction = segfault_sigaction;
    sa.sa_flags     = SA_SIGINFO;

    sigaction(SIGSEGV, &sa, NULL);

    boo();

    return 0;
}
