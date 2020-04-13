// Multiplication of Two 8 Bit Numbers
// 2000H - XX; 2001H - YY
# ORG 2000H
# DB FF,FF

# ORG 0000H
// Pulling both numbers in register
LXI H, 2000H
MOV B,M
INX H
MOV C,M

// Clearing two registers for result
MVI A, 00H
MVI D, 00H

Loop: ADD B // Performing Addition
JNC SKIP // Check for Carry
INR D // Increment higher byte register
SKIP: DCR C // Decrement counter register
JNZ LOOP // Check for zero

STA 3000H // Store lower byte
MOV A,D
STA 3001H // Store higher byte
HLT
// Result is stored in 3000H and 3001H