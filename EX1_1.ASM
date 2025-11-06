.MODEL SMALL
.STACK
.DATA
	message DB 'Legin error',13,10
        	DB 'Try again','$'
.CODE
begin:   
	mov ax,@data
	mov ds,ax

	mov dx,OFFSET message
	mov ah,09h
	int 21h

	mov ah,4ch
	int 21h
END begin

