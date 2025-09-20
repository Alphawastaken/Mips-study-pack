# SYS~MINI — how to talk to the world

# say("Hi")
li $v0,4        # service: print_string
la $a0,msg      # arg: address
syscall

# readInt() -> $v0
li $v0,5
syscall

# printInt(x)
li $v0,1
move $a0,$t0
syscall

# readFloat()  -> $f0
li $v0,6; syscall
# printFloat(x in $f12)
mov.s $f12,$f0; li $v0,2; syscall

# exit()
li $v0,10; syscall

.data
msg: .asciiz "Hi\n"
