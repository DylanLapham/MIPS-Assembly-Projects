.data
Msg1: 	.asciiz		"What is the temperature in f? " 
Msg2: 	.asciiz		"The temperature in C is "

.text
	li	$v0, 4
	la	$a0, Msg1
	syscall
	
	addi	$v0, $zero, 5
	syscall
	 
	add	$t1, $v0, $zero
	
	addi 	$t1, $t1, -32
	li	$t2, 5
	li	$t3, 9
	mul	$t1, $t1, $t2
	div	$t1, $t1, $t3
	
	li	$v0, 4
	la	$a0, Msg2
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $t1
	syscall
	
	li 	$v0, 10		# graceful exit
	syscall
