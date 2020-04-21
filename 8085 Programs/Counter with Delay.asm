// 00-99 Up Counter with 5ms Delay
// Digits Output to Port F5h and F6h

# ORG 2000H
# DB 00H

# ORG 0000H
MVI D, 64H

LOOP: 
LDA 2000H 
ANI 0FH
OUT F6H
LDA 2000H
ANI F0H
RRC
RRC
RRC
RRC
OUT F5H
LDA 2000H
ADI 01H
DAA
STA 2000H
CALL DEL
DCR D
JNZ Loop
HLT

DEL:
	   LXI B,026B
DELLoop:
	   DCX B
	   MOV A,B
	   ORA C
	   JNZ DELLoop
	   RET