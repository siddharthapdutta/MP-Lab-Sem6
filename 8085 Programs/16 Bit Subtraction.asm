// Subtraction of two 16-Bit Numbers
# ORG 2000H
# DB 35,B7,47,98
# DB 47,98,35,B7

# ORG 0000H
LXI H,2000H
MOV A,M
INX H
INX H
SUB M
STA 3000H
DCX H
MOV A,M
INX H
INX H
SBB M
STA 3001H
JNC Done // If number is positive, halt

// 2s Complement if number is negative
LDA 3000H
CMA
ADI 01H
STA 3000H
LDA 3001H
CMA
ACI 00H
STA 3001H
MVI A, 01H
STA 3002H // Store 1 in 3002H to indicate negative number
Done: HLT 

// B735 - 9847 = 1EEE
// 9847 - B735 = -1EEE