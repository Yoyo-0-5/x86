.MODEL SMALL
.STACK
.DATA
	SEQ1 DB 'This is the first string.', 30 dup(?)
    SEQ2 DB 'This is the second string.'
    LEN DW 26

.CODE
main:   
	mov ax, @data
	mov ds, ax

	
    lea si, SEQ1 + 25
    lea di, SEQ2
    mov cx, LEN

copy_loop:
    mov al, [di]
    mov [si], al
    inc si
    inc di
    loop copy_loop

	mov ah, 4ch
	int 21h
END main
