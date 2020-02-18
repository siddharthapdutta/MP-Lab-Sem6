// Square Root of a 16-Bit Number
// Perfect Square Number Stored in 2000H, 2001H (Lower Byte First)
// Result Stored in 4000H
# ORG 2000H
# DB 01,FE,01,00

# ORG 0000H
LXI SP, 0FFFH
LXI D, 0001H
MVI C, 00 

LOOP: INR C
CALL SUB16
// Check Status Flags of Lower-Byte Subtraction
LXI H, 3000H
MOV A,M
RLC
RLC
JNC SKIP
// Check Status Flags of Higher-Byte Subtraction
INX H
MOV A,M
RLC
RLC
JC STOP
// Store Subtraction Value After Incrementing By 2
SKIP: LXI H, 2002H
MOV E,M
INX H
MOV D,M
INX D
INX D
LXI H, 2002H
MOV M,E
INX H
MOV M,D 
JMP LOOP

STOP: MOV A,C
STA 4000H
HLT


SUB16: LXI H, 2000H
MOV A,M
INX H
INX H
SUB M
// Store Status Flag of Lower-Byte Subtraction
PUSH PSW
POP D
LXI H, 3000H
MOV M,E
STA 2000H
LXI H, 2001H
MOV A,M
INX H
INX H
SBB M
// Store Status Flags of Higher-Byte Subtraction
PUSH PSW
POP D
LXI H, 3001H
MOV M,E
STA 2001H
RET

// Example - FF*FF = FE01