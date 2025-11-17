mov al,13h
mov ah,0
int 10h 

mov al,01100100b
mov cx,10
mov dx,20
mov ah,0ch
int 10h

mov bl,100
firstline:
int 10h
inc cx
dec bl
jnz firstline 

mov bl,100
secondline:
int 10h
inc dx
dec bl
jnz secondline

mov bl,100
thirdline:
int 10h
dec cx
dec bl
jnz thirdline

mov bl,100
fourthline:
int 10h
dec dx
dec bl
jnz fourthline
              
              

mov cx,60
mov dx,70


mov bl,100
firstline2:
int 10h
inc cx
dec bl
jnz firstline2 

mov bl,100
secondline2:
int 10h
inc dx
dec bl
jnz secondline2

mov bl,100
thirdline2:
int 10h
dec cx
dec bl
jnz thirdline2

mov bl,100
fourthline2:
int 10h
dec dx
dec bl
jnz fourthline2
          
          

mov cx,10
mov dx,20


mov bl,50
firstline3:
int 10h
inc cx
inc dx
dec bl
jnz firstline3



mov cx,110
mov dx,120


mov bl,50
secondline3:
int 10h
inc cx
inc dx
dec bl
jnz secondline3 


mov cx,110
mov dx,20


mov bl,50
thirdline3:
int 10h
inc cx
inc dx
dec bl
jnz thirdline3


mov cx,10
mov dx,120

mov bl,50
fourthline3:
int 10h
inc cx
inc dx
dec bl
jnz fourthline3