.MODEL SMALL
.STACK
.DATA
	SEQ1 DB 'This is a string.'
    SEQ2 DB 17 dup(?)
    LEN DW 17

.CODE
main:   
	mov ax, @data
	mov ds, ax

    lea si, SEQ1
    lea di, SEQ2
    mov cx, LEN

copy_loop:
    mov dl, [si]
    mov [di], dl
    inc si
    inc di
    loop copy_loop

	mov ah, 4ch
	int 21h
END main

