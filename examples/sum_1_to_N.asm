.data
    prompt: .asciiz "Enter N: "
    outmsg: .asciiz "Sum(1..N) = "
.text
.globl main
main:
    li $v0,4
    la $a0,prompt
    syscall
    li $v0,5
    syscall
    move $t3,$v0       # N
    li $t0,1           # i
    li $t1,0           # sum
loop:
    add $t1,$t1,$t0
    addi $t0,$t0,1
    ble $t0,$t3,loop
    li $v0,4
    la $a0,outmsg
    syscall
    li $v0,1
    move $a0,$t1
    syscall
    li $v0,10
    syscall
