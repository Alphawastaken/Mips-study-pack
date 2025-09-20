# FPU~MINI — floats you actually use

# r = a + b
add.s $f0,$f1,$f2

# read float -> $f0, print
li $v0,6; syscall
mov.s $f12,$f0
li $v0,2; syscall

# compare: if (a< b) goto L
c.lt.s $f1,$f2
bc1t L

# int -> float
mtc1 $t0,$f0
cvt.s.w $f0,$f0
