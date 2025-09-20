# STACK~MINI — push/pop & function

# push $t0
addi $sp,$sp,-4
sw   $t0,0($sp)

# pop -> $t1
lw   $t1,0($sp)
addi $sp,$sp,4

# function template
# call:   jal fn
# return: jr  $ra
fn:
  addi $sp,$sp,-8
  sw   $ra,4($sp)
  sw   $s0,0($sp)
  # ... use $s0 ...
  lw   $s0,0($sp)
  lw   $ra,4($sp)
  addi $sp,$sp,8
  jr   $ra
