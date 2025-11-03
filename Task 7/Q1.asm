
.model small
.data
.code
main proc
mov bx, 1
mov cx,5
L1:
push cx 
mov cx, bx
mov dl,'A'
L2:
mov ah,2
int 21h
inc dl
loop L2
mov dx, 10
mov ah, 2
int 21h
mov dx, 13
mov ah,2
int 21h
inc bx
loop L1
mov ah, 4ch
int 21h
main endp
end main
