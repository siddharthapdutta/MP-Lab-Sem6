ASSUME CS:CODE, DS:DATA

DATA SEGMENT
	ORG 1000h
	PSQ DW 85B1H ; Perfect Square: 34,225‬
	RES DB 2 DUP(0)
DATA ENDS

CODE SEGMENT
START:	MOV AX, DATA
	MOV DS, AX

	MOV AX, PSQ
	MOV BX, 0001
	MOV CL, 00 ; Result Register
		

SLOOP:	INC CL
	SUB AX, BX
	JZ SKIP
	INC BX
	INC BX
	JMP SLOOP
SKIP:	MOV RES, CL

	MOV AH, 4Ch
	INT 21h
CODE ENDS
END START