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

// Put your code here.
@SCREEN
D=A
@8192
D=D+A
@SCREEN_END
M=D

(LOOP)
@KBD
D=M
@WHITE
D;JEQ

(BLACK)
@COLOR
M=-1
@COLOR_END
0;JMP

(WHITE)
@COLOR
M=0

(COLOR_END)

@SCREEN
D=A
@COUNTER
M=D
(FILL)
@COLOR
D=M
@COUNTER
A=M
M=D
@COUNTER
MD=M+1
@SCREEN_END
D=M-D
@FILL
D;JGT

@LOOP
0;JMP