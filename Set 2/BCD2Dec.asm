.data
    BCD: .asciiz "BCD:\n"
    Binary: .asciiz "Binary:\n"

.text
li $v0, 4
la $a0, BCD
syscall

li $v0, 5
syscall
move $s0, $v0