.text
.globl main
main:
    li $t0,42
    addi $sp,$sp,-4
    sw   $t0,0($sp)    # push 42
    lw   $t1,0($sp)    # pop -> $t1
    addi $sp,$sp,4
    li $v0,10 ; syscall
