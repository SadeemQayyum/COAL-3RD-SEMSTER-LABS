
.model sma 11
.stack 100h
.data
msg1 db 'Number is evens'
msg2 db 'Number is odd$'
.code
main proc
mov ax,@data
mov ds,ax
mov ah, 1
int 21h
sub al,48
mov ah,0
mov bl,2
div bl
cmp ah,0
je is_even
is_odd:
mov dx, offset msg2
mov ah,9
int 21h
mov ah, 4ch
int 21h
is_even:
mov dx, offset msg1
mov ah,9
int 21h
mov ah, 4ch
int 21h
main endp
end main
