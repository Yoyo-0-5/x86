INCLUDE DOS.H

.MODEL SMALL
.STACK
.DATA
	; 宣告

.CODE
main:   
	mov ax, @data
	mov ds, ax

continue:
	GETCHAR al

    cmp al, '!'
    je exit_program

    cmp al, 'a'
    jb skip_convert
    cmp al, 'z'
    ja skip_convert
    sub al, 20h

skip_convert:
    PUTCHAR al
    jmp continue

exit_program:

	END_PROCESS
END main

