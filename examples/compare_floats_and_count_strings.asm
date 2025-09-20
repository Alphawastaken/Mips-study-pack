.data
    msg1: .asciiz "Input first float:\n"
    msg2: .asciiz "Input second float:\n"
    equalmsg: .asciiz "Equal floats. Bye.\n"
    strmsg: .asciiz "Input a string:\n"
    c3msg: .asciiz "Len==3: "
    c4msg: .asciiz "Len==4: "
    cOthermsg: .asciiz "Other: "
    done: .asciiz "Done.\n"
    buf: .space 128

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 6
    syscall
    mov.s $f2, $f0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 6
    syscall

    c.eq.s $f2, $f0
    bc1t equal_exit

    li $t0, 0        # c3
    li $t1, 0        # c4
    li $t2, 0        # other

loop:
    bge $t0, 3, end
    bge $t1, 3, end

    li $v0, 4
    la $a0, strmsg
    syscall

    li $v0, 8
    la $a0, buf
    li $a1, 128
    syscall

    la $t3, buf
    li $t4, 0
len:
    lb $t5, 0($t3)
    beqz $t5, classify
    addi $t4, $t4, 1
    addi $t3, $t3, 1
    j len

classify:
    beq $t4, 3, inc3
    beq $t4, 4, inc4
    addi $t2, $t2, 1
    j loop

inc3:
    addi $t0, $t0, 1
    j loop

inc4:
    addi $t1, $t1, 1
    j loop

equal_exit:
    li $v0, 4
    la $a0, equalmsg
    syscall

    li $v0, 10
    syscall

end:
    li $v0, 4
    la $a0, c3msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, c4msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, cOthermsg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, done
    syscall

    li $v0, 10
    syscall
