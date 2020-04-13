// Count Number of 0's and 1's in given number
// Given Number is Stored in 2000H
#ORG 2000
#DB AA

#ORG 0000
LDA 2000H
MVI D, 08H // Rotate Counter
MVI B, 00H // Counts 0s
MVI C, 00H // Counts 1s

Loop: RRC
JC One
INR B
JMP Zero
One: INR C
Zero: DCR D
JNZ Loop

LXI H, 3000H
MOV M,B
INX H
MOV M,C
HLT

// Number of 0's -> 3000H
// Number of 1's -> 3001H