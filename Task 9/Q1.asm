.model small
.stack 100h
.data
rem db ?
quo db ?
.code
main proc
    mov ax,26
    mov bl,5
    div bl
    mov quo,al
    mov rem,al
    mov dl,quo
    add dl,48
    mov ah,2
    int 21h
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
    
    main endp
end main

    





