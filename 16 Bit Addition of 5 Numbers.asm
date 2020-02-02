// 5 Numbers are stored in memory locations 2000H - 2009H
// Numbers are stored with the lower byte first
// 5 Numbers - 6BA0, 0AF9, C345, B723, F189
# ORG 2000H
# DB A0,6B,F9,0A,45,C3,23,B7,89,F1
// Result is stored in 3000H and 3001H
// Carry is stored in 3002H

#ORG 0000H
// Initialization
MVI C, 05H
LXI H, 2000H
SPHL

Loop: POP H
DAD D
ACI 00H
XCHG
DCR C
JNZ Loop

XCHG
SHLD 3000H
STA 3002H
HLT

// Result
// 3000H - 8A, 3001H - E2, 3002H - 02



