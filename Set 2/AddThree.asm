.data
    num1: .asciiz "Enter a number:\n"
    num2: .asciiz "Enter a number:\n"
    num3: .asciiz "Enter a number:\n"
    sum: .asciiz "Sum:\n"
.text
    # prompt to enter first number
    # print string
    li $v0, 4
    la $a0, num1
    syscall
    
    # read integer from user, place in register s0
    li $v0, 5
    syscall
    move $s0, $v0
    
    # prompt to enter second number 
    li $v0, 4
    la $a0, num2
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    # prompt to enter third number 
    li $v0, 4
    la $a0, num3
    syscall
    
    li $v0, 5
    syscall
    move $s2, $v0
    
    # sum
    # add first two numbers and place in s0, then add to that total the third number
    add $s0, $s0, $s1
    add $s0, $s0, $s2
    
    # print text: sum:
    li $v0, 4
    la $a0, sum
    syscall
    
    # print integer and move to a0 to print
    li $v0, 1
    move $a0, $s0
    syscall
    
    # graceful exit
    li $v0, 10
    syscall
