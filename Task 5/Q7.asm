
.model sma11
.stack 100h
.data
msg1 db 'we find even and odd numbers'
msg_even db 'Even'
msg_odd db 'odd'
.code
main proc
mov ax,@data
mov ds,ax
mov dx, offset msg1
mov ah,9
int 21h
mov dx, 10
mov ah,2
int 21h
mov dx, 13
mov ah,2
int 21h
mov ah, 1
int 21h

sub al,'0'
mov bl,2
div bl
cmp ah,0
jne oddcase
evencase:
mov ah,9
lea dx,msg_even
int 21h
jmp done
oddcase:
mov ah,9
lea dx,msg_odd
int 21h
done:
Mov ah, 4ch
int 21h
main endp
end main
