# BR~MINI — move the flow

# if (a==b) goto L
beq  $t1,$t2,L
# if (a!=b) goto L
bne  $t1,$t2,L
# if (x<=y)  (pseudo)
slt $t0,$y,$x   # t0 = y<x
beq $t0,$zero,L

# for (i=0;i<N;i++)
li $t0,0
for:
  bge $t0,$N,end
  # body
  addi $t0,$t0,1
  j for
end:

# float equal
c.eq.s $f0,$f1
bc1t L
