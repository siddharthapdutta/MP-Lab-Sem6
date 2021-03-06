ASSUME CS:CODE, DS:DATA

DATA SEGMENT
	ORG 1000h
	FNAME DB "SIDDHARTHA PRATIM DUTTA$"
	ORG 2000h
	COUNTS DB 2 DUP(0)
DATA ENDS

CODE SEGMENT
START:	MOV AX,DATA
	MOV DS,AX

	LEA SI, FNAME
	MOV CH, ' '
	MOV CL, '$'
	MOV BX, 0000

CLOOP:	LODSB
	CMP AL, CH
	JNZ NOSP
	INC BL
NOSP:	INC BH
	CMP AL, CL
	JNZ CLOOP
	
	DEC BH
	SUB BH, BL

	MOV COUNTS, BH ;BH - Letters
	MOV COUNTS+1, BL ; BL - Spaces 

	MOV AH,4CH
	INT 21H

CODE ENDS
END START
