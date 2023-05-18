.data
	numbers_len: .word 10
	numbers: .word 23, -7, 15, -17, 11, -4, 23, -26, 27, 8
	num1_string: .asciiz "Enter an integer:\n"
	num2_string: .asciiz "Enter another integer:\n"
	result_string: .asciiz "Result Array Content:\n"
	newLine: .asciiz "\n"
.text
.globl main
	
	main:
		# prompt user for first number
		li $v0, 4
		la $a0, num1_string
		syscall
	
		# read integer from user and move to temp register
		li $v0, 5
		syscall 
		move $t0, $v0
	
		# prompt user for second number
		li $v0, 4
		la $a0, num2_string 
		syscall
	
		# read from user and move to another temp
		li $v0, 5
		syscall
		move $t1, $v0
	
		# store numbers length into register and store address of numbers arrray
		lw $t3, numbers_len
		la $t4, numbers
	
		# subtract num1 - num2
		sub $s0, $t0, $t1
	
		#add num1 + num2
		add $s1, $t0, $t1
	
		# loop counter
		li $t5, 0
	
		# print result
		li $v0, 4
		la $a0, result_string
		syscall
	
	loop:
		# multiply by 4 and add to get word aligned address
		sll $t6, $t5, 2 
		add $t6, $t4, $t6
		
		# load current number into register
		lw $t7, ($t6)
		
		# perform logic if evaluates to true
		blt $t7, $s1, logic
		bge $t7, $s1, continue
		
	logic:
		# perform logic
		add $t8, $t7, $s0
		
		# print
		li $v0, 1
		move $a0, $t8
		syscall
		
		# print newline
		li $v0, 4
		la $a0, newLine
		syscall
		
		# store updated value 
		sw $t8, ($t6)
	
	continue:
		# increment loop counter
		addi $t5, $t5, 1
		
		# branch check: if loop counter is less than numbers_len
		blt $t5, $t3, loop
	
		# graceful exit
		li $v0, 10
		syscall		
