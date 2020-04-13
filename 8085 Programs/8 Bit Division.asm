// Divison of Two 8-Bit Numbers
// Dividend in 3000H; Divisor in 3001H
# ORG 3000
# DB 17,03

# ORG 0000
LXI H, 3000H
MOV A,M
INX H
MOV B,M
Loop: CMP B
JC Stop
INR C
SUB B
JMP Loop
Stop: LXI H,4000H
MOV M,C
INX H
MOV M,A
HLT
// Quotient in 4000H; Remainder in 4001H
