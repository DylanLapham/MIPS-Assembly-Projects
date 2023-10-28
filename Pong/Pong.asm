# Author: Dylan Lapham
# Pong, in MIPS Assembly
# to run: Assemble -> Tools -> Bitmap Display -> Unit Width and Height = 8, Display Width x Display Height = 512 x 256, base address 0x10040000 (heap)
# Keyboard and Display MMIO Simulator also in tools: Connect both this and Bitmap Display to MIPS. Run. Enjoy!

.data 
	# store these as words so we can reference them when needed. For example, restarting the game.
	PLAYER_1_SCORE:		.word 0
	PLAYER_2_SCORE:		.word 0
	BACKGROUND_COLOR: 	.word 0x000000		# black
	LEFT_PADDLE_COLOR:	.word 0x0080000		# green
	RIGHT_PADDLE_COLOR:	.word 0xFF0000		# red
	BALL_COLOR: 		.word 0xFFFFFF		# white
	.eqv num_pixels 8192
	
.text
	start:
		jal ClearGameScreen	# have to clear game screen at every start or else major problems occur.
		
	ClearGameScreen:
		lw $t0, BACKGROUND_COLOR
		li $t1, num_pixels
		
		
		