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
	lea dx, MSG1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov N1, al

    lea dx, CRLF
    mov ah, 09h
    int 21h

	lea dx, MSG2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov N2, al

    lea dx, CRLF
    mov ah, 09h
    int 21h

    ; operation: ANS = N1 - N2
    mov dl, N1
    sub dl, N2
    mov ANS, dl

    ; output
    mov dl, N1
	add dl, '0'
	mov ah, 02h
	int 21h

    mov dl, '-'
    mov ah, 02h
    int 21h

    mov dl, N2
    add dl, '0'
    mov ah, 02h
    int 21h

    mov dl, '='
    mov ah, 02h
    int 21h

    cmp ANS, 0
    jge POSITIVE
    ; if ANS < 0
    mov dl, '-'
    mov ah, 02h
    int 21h
    neg ANS

POSITIVE:
    mov dl, ANS
    add dl, '0'
    mov ah, 02h
    int 21h

	mov ah, 4ch
	int 21h
END main

