.MODEL SMALL
.STACK
.DATA
	num db 98h
	message db 'NUM=', '$'
.CODE
main:   
	mov ax, @data
	mov ds, ax

	mov dx, OFFSET message
	mov ah, 09h
	int 21h

	mov bl, num
	mov cl, 4
	shl bx, cl
	shr bl, cl
	
	mov dl, bh
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, bl
	add dl, '0'
	mov ah, 02h
	int 21h
	
	mov ah, 4ch
	int 21h
END main