include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
mov ax,6
mov bx,4
cmp ax,bx
jg move
mov ax,5
print '5'
move:
mov ax,3
print '3'
mov ah, 4ch
int 21h
main endp
end main: