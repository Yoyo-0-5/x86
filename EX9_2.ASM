INCLUDE DOS.H

.MODEL SMALL
.STACK
.DATA
	MSG1 DB 'Please input the first number(0~9): $'
    MSG2 DB 'Please input the second number(0~9): $'
    CRLF DB 0Dh,0Ah,'$'
    N1 DB ?
    N2 DB ?
    ANS DB ?

.CODE
main:   
	mov ax, @data
	mov ds, ax

    ; input
	PRINT MSG1
    
	GETCHAR al
    sub al, '0'
    mov N1, al

    PRINT CRLF

	PRINT MSG2

	GETCHAR al
    sub al, '0'
    mov N2, al

    PRINT CRLF

    ; operation: ANS = N1 - N2
    mov dl, N1
    sub dl, N2
    mov ANS, dl

    ; output
    mov dl, N1
	add dl, '0'
	PUTCHAR dl

    PUTCHAR '-'

    mov dl, N2
    add dl, '0'
    PUTCHAR dl

    PUTCHAR '='

    cmp ANS, 0
    jge POSITIVE
    ; if ANS < 0
    PUTCHAR '-'
    neg ANS

POSITIVE:
    mov dl, ANS
    add dl, '0'
    PUTCHAR dl

	END_PROCESS
END main

