.model small
.stack 100h
.data
array db 2,4,6,8
result db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov cx,4
    mov bl,0
    LEA si,array
    
    L1:
    mov al,[si]
    cmp al,bl
    jl L2
    mov bl,al
    
    L2:
    inc si
    dec cx
    jnz L1
    
    mov result,bl
    mov dl,result
    
    add dl,48
    mov ah,2
    int 21h
    mov ah,4ch
    
    int 21h

    

    
    main endp
end main

    





