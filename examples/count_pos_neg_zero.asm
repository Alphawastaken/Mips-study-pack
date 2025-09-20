.data
    prompt: .asciiz "Enter 10 integers:\n"
    posm:   .asciiz "Positives: "
    negm:   .asciiz "Negatives: "
    zerom:  .asciiz "Zeros: "
.text
.globl main
main:
    li $v0,4
    la $a0,prompt
    syscall

    li $tP,0
    li $tN,0
    li $tZ,0
    li $tC,10

L:
    li $v0,5
    syscall
    move $t0,$v0
    bltz $t0,NEG
    beqz $t0,ZER
    addi $tP,$tP,1
    j NEXT

NEG:
    addi $tN,$tN,1
    j NEXT

ZER:
    addi $tZ,$tZ,1

NEXT:
    addi $tC,$tC,-1
    bgtz $tC,L

    li $v0,4
    la $a0,posm
    syscall
    li $v0,1
    move $a0,$tP
    syscall

    li $v0,4
    la $a0,negm
    syscall
    li $v0,1
    move $a0,$tN
    syscall

    li $v0,4
    la $a0,zerom
    syscall
    li $v0,1
    move $a0,$tZ
    syscall

    li $v0,10
    syscall
