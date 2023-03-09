.data
    num1: .asciiz "Enter a number:\n"
    num2: .asciiz "Enter a number:\n"
    num3: .asciiz "Enter a number:\n"
    sum: .asciiz "Sum:\n"
.text
    # first number
    li $v0, 4
    la $a0, num1
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    # second number 
    li $v0, 4
    la $a0, num2
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    # third number 
    li $v0, 4
    la $a0, num3
    syscall
    
    li $v0, 5
    syscall
    move $s2, $v0
    
    add $s0, $s0, $s1
    
    # sum
    add $s0, $s0, $s2
    li $v0, 4
    la $a0, sum
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    
    # graceful exit
    li $v0, 10
    syscall

  
    
    
    
        
