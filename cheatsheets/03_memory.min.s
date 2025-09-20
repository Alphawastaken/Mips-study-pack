# MEM~MINI — load/store + arrays

# t = *(base+off)
lw  $t0,8($s0)

# *(base+off) = t
sw  $t0,8($s0)

# bytes/half
lb  $t0,0($s0)   # sign
lbu $t0,0($s0)   # zero
sb  $t0,0($s0)

# address of label
la  $t0,arr

# array[i] (words)
# addr = base + i*4
sll $t1,$i,2
addu $addr,$base,$t1
lw  $val,0($addr)

.data
arr: .word 10,20,30,40
