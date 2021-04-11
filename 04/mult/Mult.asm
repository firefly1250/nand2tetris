// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// R2 = 0

// if R1 & 0b0001
// R1 += R0

// bit1shift = R0 *2
// if R1 & 0b0010
//   R2 += bit1shift

// bit2shift = bit1shift * 2
// if R1 & 0b0100
//   R2 += bit1shift

// ...

//@3
//D=A
//@R0
//M=D
//
//@1
//D=A
//@R1
//M=D

@R2
M=0

@BIT
M=1

@R0
D=M
@SHIFT
M=D

(LOOP)
@R1
D=M
@BIT
D=D&M
@ELSE
D;JEQ
@SHIFT
D=M
@R2
M=D+M
(ELSE)
@BIT
D=M
MD=D+M
@END
D;JEQ
@SHIFT
D=M
M=D+M
@LOOP
0;JMP
(END)