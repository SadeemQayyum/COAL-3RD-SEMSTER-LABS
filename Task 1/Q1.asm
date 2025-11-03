
.model sma11
.stack 100h
.data
.code
main proc

mov dl,'S'
mov ah,2
int 21h

mov dl,'A'
mov ah,2
int 21h 

mov dl,'D'
mov ah, 2
int 21h

mov dl,'E'
mov ah,2
int 21h

mov dl,'E'
mov ah,2
int 21h

mov dl,'M'
mov ah,2
int 21h

mov ah, 4ch
int 21h
main endp
end main
