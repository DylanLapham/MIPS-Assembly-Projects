.data
	input: .asciiz "Enter a number ( >= 0 ): "
	factorial: .asciiz "!"
	equals: .asciiz " = "
.text
	# take in string for input
	li $v0, 4
	la $a0, input
	syscall
	
	# take in number from user and move to register t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	# if number is 0, display 0 and leave
	beq $t0, $zero, zero
	
	# loop counter
	move $t1, $t0
	
	# move original input to new register
	move $t2, $t0
	
	loop:
		# subtract loop counter by 1
		sub $t1, $t1, 1
		
		# multiply number by loop counter
		mul $t0, $t0, $t1 
		
		# if we are greater than 1, we keep going
		bgt $t1, 1, loop
		
		# exit when loop counter is 1
		beq $t1, 1, exit
	
	exit:
		# display original number input
		li $v0, 1
		move $a0, $t2
		syscall
		
		# factorial !
		li $v0, 4
		la $a0, factorial
		syscall
		
		# = 
		li $v0, 4
		la $a0, equals
		syscall
		
		# output
		li $v0, 1
		move $a0, $t0
		syscall
		
		# graceful exit
		li $v0, 10
		syscall
		
	zero:
		# display 0
		li $v0, 1
		move $a0, $t0
		syscall
		
		# factorial !
		li $v0, 4
		la $a0, factorial
		syscall
		
		# = 
		li $v0, 4
		la $a0, equals
		syscall
		
		# 1
		li $v0, 1
		move $a0, $v0
		syscall
		
		# graceful exit
		li $v0, 10
		syscall
