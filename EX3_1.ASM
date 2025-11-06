.MODEL SMALL
.STACK
.DATA
	num db 98
	message db 'NUM=', '$'

.CODE
main:   
	mov ax, @data
	mov ds, ax

	mov dx, OFFSET message
	mov ah, 09h
	int 21h

	mov ax, 0
	mov al, num
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, dh
	add dl, '0'
	mov ah, 02h
	int 21h
	
	mov ah, 4ch
	int 21h
END main