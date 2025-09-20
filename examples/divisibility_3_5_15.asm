.data
    prompt: .asciiz "Enter positive ints (end with 0):\n"
    out3:   .asciiz "\nCount %3 = "
    out5:   .asciiz "\nCount %5 = "
    out15:  .asciiz "\nCount %15 = "
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $t3, 0
    li $t4, 0
    li $t5, 0
R:
    li $v0, 5
    syscall
    move $t0, $v0
    beqz $t0, PRINT
    bltz $t0, R

    li $t7, 15
    div $t0, $t7
    mfhi $t6
    beq $t6, $zero, INC15

    li $t7, 5
    div $t0, $t7
    mfhi $t6
    beq $t6, $zero, INC5

    li $t7, 3
    div $t0, $t7
    mfhi $t6
    beq $t6, $zero, INC3

    j R
INC15:
    addi $t5, $t5, 1
    addi $t4, $t4, 1
    addi $t3, $t3, 1
    j R
INC5:
    addi $t4, $t4, 1
    addi $t3, $t3, 1
    j R
INC3:
    addi $t3, $t3, 1
    j R
PRINT:
    li $v0, 4
    la $a0, out3
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, out5
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, out15
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
