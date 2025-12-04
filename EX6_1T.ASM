.MODEL SMALL
.STACK
.DATA
    N1 db 7
    N2 db 8
    ANS db ?
.CODE
main:   
	mov ax, @data
	mov ds, ax

    ; operation: ANS = N1 - N2
    mov dl, N1
    sub dl, N2
    mov ANS, dl

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

