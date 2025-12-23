INCLUDE DOS.H
.MODEL SMALL
.STACK
.DATA
	PW DB 'IAMPASSWORD'
    MSG1 DB 'Please input password: $'
    MSG2 DB 'correct!$'
    MSG3 DB 'incorrect! Please try again$'
    CRLF DB 0Dh,0Ah,'$'
    REQPW DB 12, 0, 12 DUP (?)
.CODE
main:
	mov ax, @data
	mov ds, ax
	mov es, ax

TRY_AGAIN:

    PRINT MSG1
    INPUT REQPW
    PRINT CRLF

    lea si, REQPW + 2
    lea di, PW
    mov cx, 11
    REPE CMPSB
    jz  CORRECT

    PRINT MSG3
    PRINT CRLF

    jmp TRY_AGAIN
CORRECT:
    PRINT MSG2

	mov ah, 4ch
	int 21h
END main
