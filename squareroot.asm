org 100h
.model small
.stack 64
.data    
.code 
main proc
    mov si,144
    call squareroot
    
             
    hlt         
endp main

squareroot proc
    mov bx,si
    mov bp,1    ; init bp to 1
    sqrloop:
        mov ax,bp
        mul ax
        cmp ax,bx
        je sqrtrue
        
        cmp ax,bx
        ja lowersqr
        
        inc bp    
    jmp sqrloop
    sqrtrue:
        ; value in bp
        ret
    
    lowersqr:
        dec bp
        ; lower val in bp          
              
    
        
    ret
endp squareroot    
