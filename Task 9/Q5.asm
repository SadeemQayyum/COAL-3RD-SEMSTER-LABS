.model small
.stack 100h

.data
msg1 db 10,13,"Alphabet$"
msg2 db 10,13,"Number$"
msg3 db 10,13,"Special Character$"

.code
main proc
    mov ax,@data
    mov ds,ax

   
    mov ah,1
    int 21h         

    
    cmp al,'0'
    jb check_alpha   ; if below '0'not digit
    cmp al,'9'
    jbe is_digit     ; if between 0 to 9 it's a digit

check_alpha:
     ;check if it's uppercase A to Z
    cmp al,'A'
    jb check_lower   ;if less than A ? 
    cmp al,'Z'
    jbe is_alpha     ;if between A to Z

check_lower:
    ;check if it's lowercase a to z
    cmp al,'a'
    jb is_special    ; if less than 'a'not alphabet
    cmp al,'z'
    jbe is_alpha     ; if between a to z ? alphabet
    jmp is_special   ; otherwise not alphabet



is_alpha:
    mov dx,offset msg1
    mov ah,9
    int 21h
    jmp exit

is_digit:
    mov dx,offset msg2
    mov ah,9
    int 21h
    jmp exit

is_special:
    mov dx,offset msg3
    mov ah,9
    int 21h

exit:
    mov ah,4ch
    int 21h
main endp
end main