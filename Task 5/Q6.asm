
.model sma 11
.stack 100h
.data
.code
main proc
mov cx, 10
mov dx, 48
L1:
mov ah,2
int 21h
add dx,1
Loop L1
mov dx, 10
mov ah,2
int 21h
mov dx, 13
mov ah,2
int 21h
mov cx,5
mov dx, 48
LZ:
mov dx, 48
L2:
mov ah,2
int 21h
add dx,2
Loop L2
mov dx, 10
mov ah,2
int 21h
mov dx, 13
mov ah,2
int 21h
mov cx,5
mov dx,49
L3:
mov ah,2
int 21h
add dx,2
Loop L3
mov ah, 4ch
int 21h
main endp
end main
