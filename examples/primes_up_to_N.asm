.data
    prompt: .asciiz "Enter N: "
    spc:    .asciiz " "
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      # N

    li $t1, 2          # i = 2
next_num:
    move $a0, $t1
    jal isPrime
    beq $v0, $zero, skip

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, spc
    syscall
skip:
    addi $t1, $t1, 1
    ble $t1, $t0, next_num

    li $v0, 10
    syscall

# isPrime(a0) -> v0 (1/0)
isPrime:
    li  $t2, 2
    blt $a0, $t2, notp    # numbers < 2 not prime
check_div:
    mul $t3, $t2, $t2     # t3 = d*d
    bgt $t3, $a0, prime
    div $a0, $t2
    mfhi $t4
    beq $t4, $zero, notp
    addi $t2, $t2, 1
    j check_div
prime:
    li $v0, 1
    jr $ra
notp:
    li $v0, 0
    jr $ra
