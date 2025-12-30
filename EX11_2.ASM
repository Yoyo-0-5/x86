INCLUDE DOS.H
.MODEL SMALL
.STACK
.DATA
	SEQ1 DB 30, 0, 30 dup(?)
    SEQ2 DB 30, 0, 30 dup(?)
    NEWSEQ DB 60 dup(?)
    MSG1 DB 'please input the first string: $'
    MSG2 DB 'please input the second string: $'
    MSG3 DB 'The new string : $'
    CRLF DB 0Dh,0Ah,'$'

.CODE
main:   
	mov ax, @data
	mov ds, ax

    PRINT MSG1
    INPUT SEQ1
    PRINT CRLF
    
    PRINT MSG2
    INPUT
    PRINT CRLF

	; 複製到 NEWSEQ
    lea di, NEWSEQ 

    ; 複製 SEQ1 到 NEWSEQ
    lea si, SEQ1 + 2
    mov cx, 0
    mov cl, SEQ1[1]
    
    
copy_seq1:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_seq1

    ; 複製 SEQ2 到 NEWSEQ
    lea si, SEQ2 + 2
    mov cx, 0
    mov cl, SEQ2[1]
    
copy_seq2:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_seq2

    ; 在 NEWSEQ 結尾加上 '$' 符號
    mov al, '$'
    mov [di], al
    
    PRINT MSG3
    PRINT NEWSEQ

	mov ah, 4ch
	int 21h
END main
