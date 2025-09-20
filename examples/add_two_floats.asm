.data
    firstf:  .asciiz "Please input the first float:\n"
    secondf: .asciiz "Please input the second float:\n"
    outmsg:  .asciiz "Sum = "
.text
.globl main
main:
    #read first
    li $v0,4  
    la $a0,firstf  
    syscall
    li $v0,6  
    syscall           # f0 = first
    mov.s $f2,$f0

    # read second
    li $v0,4  
    la $a0,secondf  
    syscall
    li $v0,6  
    syscall           # f0 = second

    # add
    add.s $f4,$f2,$f0

    # print
    li $v0,4 
    la $a0,outmsg 
    syscall
    mov.s $f12,$f4
    li $v0,2 
    syscall

    li $v0,11 
    li $a0,10 
    syscall
    li $v0,10
    syscall
