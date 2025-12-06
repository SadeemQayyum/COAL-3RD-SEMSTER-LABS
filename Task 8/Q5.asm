org 100h
.data
a db "SADEEM$"
.code

mov ax,@data
mov ds,ax

mov si,offset a
mov cx,6

; Push characters into stack
L1:
mov dl,[si]
push dx
inc si
loop L1

mov cx,6

; Pop characters and display in reverse
L2:
pop dx
mov ah,2
int 21h
loop L2
