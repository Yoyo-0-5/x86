.MODEL	SMALL
.DATA
N1	DB	9
SUM	DB	1
.STACK
.CODE
START:	MOV	AX,@DATA
	MOV	DS,AX

	MOV	BL,1
	MOV	DL,31H
	MOV	AH,02H
	INT	21H		; print"1'

	MOV	CL,N1
	DEC	CL		; loop count =N1-1

AGAIN:
	MOV	DL,'+'
	MOV	AH,02H
	INT	21H		; print '+'
	INC	BL		
	MOV	DL,BL
	ADD	DL,30H
	MOV	AH,02H
	INT	21H		; print another number
	ADD	SUM,BL		; add SUM with another number
	CMP	BL,N1		; add finish?
	JNE	AGAIN		; if no, add again

	MOV	DL,'='
	MOV	AH,02H
	INT	21H		;print '='

	CMP	SUM,10		; ptint SUM

	MOV	BL,SUM
	CMP	BL,10
	JB	LESS10
	MOV	AX,0
	MOV	AL,BL
	MOV	CL,10
	DIV	CL
	MOV	BH,AH		;keep remainder
	MOV	DL,AL
	ADD	DL,30H		;display ASCII code
	MOV	AH,02H
	INT	21H
	MOV	BL,BH

LESS10:
	MOV	DL,BL
	ADD	DL,30H
	MOV	AH,02H
	INT	21H

        MOV     AH,4CH
        INT     21H
        END     START