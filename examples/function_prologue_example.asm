.text
.globl func
func:
    addi $sp,$sp,-8
    sw   $ra,4($sp)
    sw   $s0,0($sp)
    # ... body ...
    lw   $s0,0($sp)
    lw   $ra,4($sp)
    addi $sp,$sp,8
    jr   $ra
