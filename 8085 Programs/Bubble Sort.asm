// Bubble Sort
// 10 Numbers Stored in Consecutive Memory Locations
#ORG 2000
#DB 76,65,DB,29,AB,F3,C9,8E,12,4A

#ORG 0000
MVI D, 0AH

Outloop: LXI H, 2000H
MVI C, 0AH

InLoop: MOV A,M
INX H
CMP M
JC Skip
MOV B,M
DCX H
MOV M,B
INX H
MOV M,A
Skip: DCR C
JNZ InLoop
DCR D
JNZ OutLoop
HLT

// Sorted Numbers are Stored In-Place

