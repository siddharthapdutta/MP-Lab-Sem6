// Finding Smallest Number From Given 10 Numbers
// Smallest Number is Stored in 3000H
# ORG 2000H
# DB FF,23,FE,56,AB,F7,60,CB,89,67

# ORG 0000H
LDA 2000H
LXI H, 2000H
MVI D, 00H
MVI C, 09H // 10 Numbers

Loop: INX H 
CMP M
JZ Skip
JC Skip
MOV A,M
Skip: DCR C
JNZ Loop

STA 3000H
HLT