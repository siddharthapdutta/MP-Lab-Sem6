// Square Root of a Perfect Number
// Input Number is Stored in 2000H
// Square Root is Stored in 2001H
# ORG 2000
# DB 64h

# ORG 0000
LDA 2000H
MVI B, 01H
MVI C, 00H // Result Register

Loop: INR C
SUB B
JZ Stop
INR B
INR B
JMP Loop
Stop: MOV A,C
STA 2001H 
HLT