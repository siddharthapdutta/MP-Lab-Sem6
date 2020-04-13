// Cube Root of a 8-Bit Number
// Perfect Cube is stored in 2000H
// Result is stored in 2001H
# ORG 2000
# DB D8H

# ORG 0000
MVI B, 01H // Sub Register
MVI C, 00H // Result Register

Loop: LDA 2000H
INR C
SUB B
JZ Stop
STA 2000H
CALL MUL
JMP Loop
Stop: MOV A,C
STA 2001H
HLT


MUL:
MOV A,C
STA 4000H
MOV A,B
MulLoop: ADI 06H
DCR C
JNZ MulLoop
MOV B,A
LDA 4000H
MOV C,A
RET