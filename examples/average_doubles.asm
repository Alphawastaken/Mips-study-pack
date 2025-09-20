.data
    promptN: .asciiz "Enter N: "
    outmsg:  .asciiz "Average = "
.text
.globl main
main:
    li $v0,4
    la $a0,promptN
    syscall

    li $v0,5
    syscall
    move $t1,$v0        # N

    li $t0,0            # i
    mov.d $f2,$fzero    # sum=0.0

avg_loop:
    blt $t0,$t1,readx
    j done

readx:
    # li $v0,7
    # syscall            # read_double -> $f0/$f1 (uncomment if using doubles input)
    # add.d $f2,$f2,$f0
    addi $t0,$t0,1
    j avg_loop

done:
    mtc1 $t1,$f4
    cvt.d.w $f4,$f4
    div.d $f6,$f2,$f4

    li $v0,4
    la $a0,outmsg
    syscall

    mov.d $f12,$f6
    li $v0,3
    syscall

    li $v0,10
    syscall
