// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(CHECK)
	@8191
	D=A
	@i
	M=D
	(RESET_LOOP)
		@KBD
		D=M
		@SET_START
		D;JNE

		@i
		D=M
		@SCREEN
		A=A+D
		M=0

		@i
		M=M-1
		D=M
		@RESET_LOOP
		D;JGE

	@KBD
	D=M
	@CHECK
	D;JEQ

	(SET_START)
	@8191
	D=A
	@i
	M=D
	(SET_LOOP)
		@i
		D=M
		@SCREEN
		A=A+D
		M=!M

		@i
		M=M-1
		D=M
		@SET_LOOP
		D;JGE

	@CHECK
	0;JMP