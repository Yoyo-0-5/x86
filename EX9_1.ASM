.MODEL SMALL
.STACK
.DATA
	; 宣告

.CODE
main:   
	mov ax, @data
	mov ds, ax

continue:
	mov ah, 01h
    int 21h

    cmp al, '!'
    je exit_program

    cmp al, 'a'
    jb skip_convert
    cmp al, 'z'
    ja skip_convert
    sub al, 20h

skip_convert:
    mov dl, al
    mov ah, 02h
    int 21h
    jmp continue

exit_program:

	mov ah, 4ch
	int 21h
END main

