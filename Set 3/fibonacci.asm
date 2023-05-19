.data 
	inputPrompt: .asciiz "Enter the number of terms: "
	output: .asciiz "Fibonacci Series:\n"
	newLine: .asciiz  "\n"
	
.text
	# store first two numbers of fibonacci sequence
	li $t0, 0
	li $t1, 1
	
	# display input prompt	
	li $v0, 4
	la $a0, inputPrompt
	syscall
	
	# take in integer
	li $v0, 5
	syscall
	move $t2, $v0
	
	# if user puts 0
	beq $t2, $zero, exit
	
	# loop counter
	li $t3, 3
	
	# add first two for 3rd term
	add $t4, $t0, $t1
	
	# display output
	li $v0, 4
	la $a0, output
	syscall
	
	# display first num
	li $v0, 1
	move $a0, $t0
	syscall
	move $t0, $a0
	
	# new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# display second num
	li $v0, 1
	move $a0, $t1
	syscall
	move $t1, $a0
	
	# new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	# loop to calculate fibonacci sequence and display
	loop:
		# display next number
		li $v0, 1
		move $a0, $t4
		syscall
		move $t4, $a0
		
		# new line
		li $v0, 4
		la $a0, newLine
		syscall
		
		# set term1 equal to term2
		move $t0, $t1
		
		# set term2 to next term
		move $t1, $t4
		
		# set next term to term1 + term2
		add $t4, $t0, $t1
		
		# increment counter
		addi $t3, $t3, 1
		
		# leave when number of entries user entered is equal to loop counter
		ble $t3, $t2, loop
		
		# graceful exit
		li $v0, 10
		syscall	

	exit:
		li $v0, 10
		syscall
