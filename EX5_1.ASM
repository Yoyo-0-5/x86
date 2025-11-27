.MODEL	SMALL
.DATA
NUM	DB	10
STR1	DB	'NUM=$'
.CODE
START:	MOV	AX,@DATA
	MOV	DS,AX

	MOV	DX,OFFSET STR1
	MOV	AH,09H
	INT	21H		; display' NUM='
	MOV	BL,NUM
	CMP	BL,10		; display one digit (<10) or two digits(>=10)
	JB	LESS10
	MOV	AX,0		; display two digits (>=10)
	MOV	AL,BL
	MOV	CL,10
	DIV	CL		; /10
	MOV	BH,AH		;keep remainder
	MOV	DL,AL
	ADD	DL,30H		;display the first digit
	MOV	AH,02H
	INT	21H
	MOV	BL,BH

LESS10:
	MOV	DL,BL		; display the second digit or one digit (<10)
	ADD	DL,30H
	MOV	AH,02H
	INT	21H

        MOV     AH,4CH
        INT     21H
        END     START