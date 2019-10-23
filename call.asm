global call

extern fillarray
extern printf
extern scanf
extern getchar

segment .data

message1 db "Sending array to be filled", 10, 0
stringformat db "%s", 0
integerformat db "%ld", 0

segment .bss

myarray resq 10

segment .text

call:

push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14
push       r15                                              ;Back up r15

mov   qword rax, 0
mov         rdi, stringformat
mov         rsi, message1
call        printf

mov rax, 0
mov rdi, myarray
mov rsi, 10
call fillarray
mov r15, rax                                                ;hold size


mov r14, 0                                                  ;counter
mov r13, 0                                                  ;holds sum


begin_loop:
push qword 0
mov qword rax, 0
cmp r14, r15                                                ;compare counter to size
je loop_done
add r13, [myarray + r14*8]                                  ;add array elements to r13
pop rax
inc r14
jmp begin_loop

loop_done:
pop rax

mov rax, r13

pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                                               ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
pop        rbp                                              ;Restore rbp

ret
