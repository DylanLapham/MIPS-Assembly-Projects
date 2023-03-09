.data
    num1: .asciiz "Enter a number:\n"
    num2: .asciiz "Enter a number:\n"
    num3: .asciiz "Enter a number:\n"
    SN: .asciiz "The smallest number is:\n"
    
.text
    # first number
    li $v0, 4
    la $a0, num1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    # second number
    li $v0, 4
    la $a0, num2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    # third number 
    li $v0, 4
    la $a0, num3
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0
    
    # determine smallest
    li $v0, 4
    la $a0, SN
    syscall
    
    blt $t0, $t1, message
    blt $t1, $t0, message3
    
    message:
    	blt $t0, $t2, message2
    	blt $t2, $t0, message3
    	
    message2:
 	li $v0, 1
 	move $a0, $t0
 	syscall
 	li $v0, 10
 	syscall
 	
    message3:
    	blt $t1, $t2, message4
    	blt $t2, $t1, message5 
    	
    message4:
    	li $v0, 1
    	move $a0, $t1
    	syscall
    	li $v0, 10
    	syscall
    	
    message5:
    	li $v0, 1
    	move $a0, $t2
    	syscall 
    	li $v0, 10
    	syscall
