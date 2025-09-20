# ARITH~MINI — integers fast

# add t = a + b
add  $t0,$t1,$t2

# t = a + 7
addi $t0,$t1,7

# sub t = a - b
sub  $t0,$t1,$t2

# mul t = a * b   (clean)
mul  $t0,$t1,$t2   # (pseudo: mult+mflo)

# div: q = a/b, r = a%b
div  $t1,$t2
mflo $tq
mfhi $tr

# cmp: t = (a<b)
slt  $t0,$t1,$t2   # 1/0
