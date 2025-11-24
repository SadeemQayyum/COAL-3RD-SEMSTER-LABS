mov al,12h
mov ah,0
int 10h 

mov al,01100100b
mov cx,10
mov dx,20
mov ah,0ch
int 10h

mov cx,170
mov dx,30
mov bl,120

L1:
int 10h
inc cx
dec bl
jnz L1 

mov cx,290
mov dx,30
mov bl,120

L2:
int 10h
dec cx
inc dx
dec bl
jnz L2 


mov cx,170
mov dx,150
mov bl,120

L3:
int 10h
dec cx
dec bl
jnz L3 

mov cx,50
mov dx,150
mov bl,120

L4:
int 10h
inc cx
dec dx
dec bl
jnz L4

mov cx,180
mov dx,40
mov bl,80

L5:
int 10h
inc cx
dec bl
jnz L5


mov cx,260
mov dx,40
mov bl,100

L6:
int 10h
dec cx
inc dx
dec bl
jnz L6

mov cx,160
mov dx,140
mov bl,80

L7:
int 10h
dec cx
dec bl
jnz L7  

mov cx,80
mov dx,140
mov bl,100

L8:
int 10h
inc cx
dec dx
dec bl
jnz L8

mov cx,185
mov dx,45
mov bl,60

L9:
int 10h
inc cx
dec bl
jnz L9

mov cx,245
mov dx,45
mov bl,80

L10:
int 10h
dec cx
inc dx
dec bl
jnz L10

mov cx,165
mov dx,125
mov bl,60

L11:
int 10h
dec cx
dec bl
jnz L11

mov cx,105
mov dx,125
mov bl,80

L12:
int 10h
inc cx
dec dx
dec bl
jnz L12

mov cx,190
mov dx,50
mov bl,40

L13:
int 10h
inc cx
dec bl
jnz L13

mov cx,230
mov dx,50
mov bl,60

L14:
int 10h
dec cx
inc dx
dec bl
jnz L14

mov cx,170
mov dx,110
mov bl,40

L15:
int 10h
dec cx
dec bl
jnz L15

mov cx,130
mov dx,110
mov bl,60

L16:
int 10h
dec dx
inc cx
dec bl
jnz L16 

mov cx,195
mov dx,55
mov bl,20


L17:
int 10h
inc cx
dec bl
jnz L17

mov cx,215
mov dx,55
mov bl,40

L18:
int 10h
inc dx
dec cx
dec bl
jnz L18

mov cx,175
mov dx,95
mov bl,20

L19:
int 10h
dec cx
dec bl
jnz L19

mov cx,155
mov dx,95
mov bl,40

L20:
int 10h
inc cx
dec dx
dec bl
jnz L20

 

mov cx,200
mov dx,60
mov bl,10


L21:
int 10h
inc cx
dec bl
jnz L21

mov cx,210
mov dx,60
mov bl,20

L22:
int 10h
inc dx
dec cx
dec bl
jnz L22

mov cx,190
mov dx,80
mov bl,10

L23:
int 10h
dec cx
dec bl
jnz L23

mov cx,180
mov dx,80
mov bl,20

L24:
int 10h
inc cx
dec dx
dec bl
jnz L24 

mov cx,50
mov dx,150
mov bl,50

L25:
int 10h
inc dx
dec bl
jnz L25 

mov cx,60
mov dx,150
mov bl,50

L26:
int 10h
inc dx
dec bl
jnz L26


mov cx,60
mov dx,200
mov bl,5

L27:
int 10h
inc dx
dec cx
dec bl
jnz L27 

mov cx,55
mov dx,205
mov bl,5

L28:
int 10h
dec dx
dec cx
dec bl
jnz L28
        
mov cx,175
mov dx,145
mov bl,55

L29:
int 10h
inc dx
dec bl
jnz L29 

mov cx,165
mov dx,150
mov bl,50

L30:
int 10h
inc dx
dec bl
jnz L30 

mov cx,175
mov dx,200
mov bl,5

L31:
int 10h
inc dx
dec cx
dec bl
jnz L31 

mov cx,170
mov dx,205
mov bl,5

L32:
int 10h
dec dx
dec cx
dec bl
jnz L32

mov cx,145
mov dx,150
mov bl,25

L33:
int 10h
inc dx
dec bl
jnz L33 

mov cx,135
mov dx,150
mov bl,25

L34:
int 10h
inc dx
dec bl
jnz L34 

mov cx,145
mov dx,175
mov bl,5

L35:
int 10h
inc dx
dec cx
dec bl
jnz L35 

mov cx,140
mov dx,180
mov bl,5

L36:
int 10h
dec dx
dec cx
dec bl
jnz L36 



mov cx,290
mov dx,30
mov bl,50

L37:
int 10h
inc dx
dec bl
jnz L37 

mov cx,280
mov dx,40
mov bl,40

L38:
int 10h
inc dx
dec bl
jnz L38 

mov cx,290
mov dx,80
mov bl,5

L39:
int 10h
inc dx
dec cx
dec bl
jnz L39 

mov cx,285
mov dx,85
mov bl,5

L40:
int 10h
dec dx
dec cx
dec bl
jnz L40 


;Bed

mov al,01100100b

mov cx,400         
mov dx,160        
mov ah,0Ch
int 10h   

mov bl,100 
call Horizontal_line     

mov cx,400        
mov dx,220        
mov ah,0Ch
int 10h 
        
mov bl,100
call Horizontal_line    

mov cx,400
mov dx,160
mov ah,0Ch

mov bl,60
call Vertical_line

mov cx,500        
mov dx,160
mov ah,0Ch
mov bl,60 
call Vertical_line  

mov cx,400
mov dx,220
mov ah,0Ch  
mov bl,100  
call Diagonal_line
                  
mov cx,500
mov dx,220
mov ah,0Ch  
mov bl,100  
call Diagonal_line 

; ---- FOOT AREA ----

mov cx,300        
mov dx,320    
mov ah,0Ch
int 10h   

mov bl,100 
call Horizontal_line 

mov cx,300
mov dx,320
mov ah,0Ch
int 10h   

mov bl,100

mov cx,300
mov dx,320
mov ah,0Ch
int 10h   

mov bl,50     
call Vertical_line 

mov cx,305        
mov dx,320
mov ah,0Ch
int 10h   

mov bl,50     
call Vertical_line
                   
mov cx,300
mov dx,370        
mov ah,0Ch
int 10h   

mov bl,5     
call Horizontal_line  

mov cx,395        
mov dx,320
mov ah,0Ch
int 10h   

mov bl,50     
call Vertical_line  

mov cx,400        
mov dx,320
mov ah,0Ch
int 10h   

mov bl,50     
call Vertical_line
                    
mov cx,395
mov dx,370
mov ah,0Ch
int 10h   

mov bl,5     
call Horizontal_line 

mov cx,395
mov dx,370
mov ah,0Ch
int 10h   

mov bl,5     
call Horizontal_line

hlt

Horizontal_line:
int 10h
inc cx
dec bl
jnz Horizontal_line  
ret
     
Vertical_line:
int 10h
inc dx
dec bl
jnz Vertical_line
ret

Diagonal_line:
int 10h
dec cx
inc dx
dec bl
jnz Diagonal_line


mov cx,500
mov dx,220
mov bl,50

call Vertical_line

mov cx,495
mov dx,225
mov bl,45

call Vertical_line

mov cx,495
mov dx,270
mov bl,5

call Horizontal_line
mov cx,410
mov dx,170
mov bl,80

call Horizontal_line

mov cx,490
mov dx,170
mov bl,50 

call Vertical_line 

mov cx,410
mov dx,170
mov bl,50 

call Vertical_line




mov cx,420
mov dx,180
mov bl,60

call Horizontal_line

mov cx,480
mov dx,180
mov bl,40

call Vertical_line 

mov cx,420
mov dx,180
mov bl,40 

call Vertical_line 



mov cx,430
mov dx,190
mov bl,40

call Horizontal_line

mov cx,470
mov dx,190
mov bl,30

call Vertical_line 

mov cx,430
mov dx,190
mov bl,30 

call Vertical_line



mov cx,440
mov dx,200
mov bl,20

call Horizontal_line

mov cx,460
mov dx,200
mov bl,20

call Vertical_line 

mov cx,440
mov dx,200
mov bl,20 

call Vertical_line



mov cx,450
mov dx,210
mov bl,10

call Horizontal_line

mov cx,460
mov dx,210
mov bl,10

call Vertical_line 

mov cx,450
mov dx,210
mov bl,10

call Vertical_line

ret 




