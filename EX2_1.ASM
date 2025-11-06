.MODEL SMALL
.STACK
.DATA
	num db 9
	message1 db 'The result is ', '$'
        message2 db '. Press any key to continue.','$'

.CODE
begin:
	mov ax, @data
	mov ds, ax

	mov dx, OFFSET message1
	mov ah, 09h
	int 21h
	
	mov dl, num
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dx, OFFSET message2
	mov ah, 09h
	int 21h

	mov ah, 4ch
	int 21h
END begin