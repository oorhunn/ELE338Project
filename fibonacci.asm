org 100h
.model small
.stack 64
.data    
.code 
main proc
    mov ax,dx
    mov di,ax    
    mov si,14     
    call fibonacci          
    hlt         
endp main

fibonacci proc   
    mov ax,si
    mov bx,2
    mov cx,1
    cmp ax,0000d    ; 0 condition
    jzfibonTrue:
    cmp ax,0001d    ; 1 condition
    jz fibonTrue
    checker:
        mov dx,0
        add dx,bx
        add dx,cx
        mov cx,bx
        mov bx,dx
        cmp ax,bx
        jz fibonTrue
        cmp bx,ax
        ja fibonExit
    jmp checker
    fibonTrue:
    mov dx,ax
    jmp fibonend
    fibonExit:
    mov dx,cx
    
    fibonend:         
    ret
fibonacci endp