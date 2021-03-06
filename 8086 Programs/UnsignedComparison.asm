; Unsigned Comparison
ASSUME CS:CODE, DS:DATA, ES:EXTRA

DATA SEGMENT
	ARR1 DB -18, 12, -06, 00, 04, 02, -17, 07, 13, -04
	ORG 1000h
	RES DB 3 DUP(0)
DATA ENDS

EXTRA SEGMENT
	ARR2 DB 24, -09, 00, 15, 04, 20, 17, -08, 01, -03 
EXTRA ENDS

CODE SEGMENT
START:	MOV AX, DATA
	MOV DS, AX
	MOV AX, EXTRA
	MOV ES, AX

	MOV CX, 0000
	MOV BL, 00
	MOV BH, 0Ah ; Counter

	LEA SI, ARR1
	LEA DI, ARR2

CLOOP:	MOV AL, ES:[DI]
	CMP [SI], AL
	JAE GTE ;
	INC CL ; [ARR1] < [ARR2]
	JMP SKIP
GTE:	JE EQUAL
	INC CH ; [ARR1] > [ARR2]
	JMP SKIP
EQUAL:	INC BL ; [ARR1] = [ARR2]

SKIP:	INC SI
	INC DI
	DEC BH
	JNZ CLOOP

	MOV RES, CH ; No. of times [ARR1] > [ARR2]
	MOV RES+1, CL ; No. of times [ARR1] < [ARR2]
	MOV RES+2, BL ; No. of times [ARR1] = [ARR2]

	MOV AH, 4Ch
	INT 21h


CODE ENDS
END START