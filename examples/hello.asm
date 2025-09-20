.data
    msg: .asciiz "Hello, this is my first assembly code!\n"
.text
.globl main
main:
    li $v0,4
    la $a0,msg
    syscall
    li $v0,10
    syscall
