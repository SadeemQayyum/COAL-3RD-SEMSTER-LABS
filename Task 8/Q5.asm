org 100h
.data
a db "SADEEM$"; Name
.code

mov ax, @data
mov ds,ax
mov si,offset a ;SI points to the start of the string 'S'
mov cx,6; CX is the loop counter (6 characters: S, A, D, E, E, M)

L1:
mov dl, [si]
inc si
mov ah, 2
int 21h   
loop L1







