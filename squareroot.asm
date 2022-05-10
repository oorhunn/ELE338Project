org 100h
.model small
.stack 64
.data    
.code 
main proc
    mov si,8
    call factorial  
    
             
    hlt         
endp main

factorial proc
    mov bx,si   ; Getting input into SI
    mov ax,1
    factloop:
        mul bx
        dec bx
        cmp bx,1
        je endfact    
        
        
        
    jmp factloop
    endfact:    
    ret
endp factorial    
