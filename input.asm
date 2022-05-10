org 100h
.model small
.stack 64
.data  
    mynumber dw 1092 
    msg db "prime","$"    
    numstr db "$$$$$$$" ;empty array for 5 digit output       
    num dw ?                                   
    nextline    db 13,10,'$'    ;line break.
    
    
    menu db  "---------------MENU---------------","$"
    item1 db "1)Fibonacci ","$"
    item2 db "2)Factorial ","$"
    item3 db "3)Square    ","$"
    item4 db "4)Prime     ","$"
    item5 db "5)ABOUT     ","$"
    item6 db "6)EXIT      ",10,13,10,13,"$"
    message1 db "Please Choose One Of the Options: ","$"        
    choosenOption db 2,1, 1 dup(?) 
    
    
    inputnumber db 6, 1 dup(?)
    
    ask db 10,13,"Please enter a number: ","$"
    integer db 2,1,1 dup(" ")
    error1 db 10,13,"Yanlis bir secim yaptiniz","$"
    
    errormsg db "Invalid input","$" 
.code                           
main proc
    mov ax,dx
    mov di,ax
        
    mov dx,offset menu
    mov ah,09h
    int 21h
    
;    mov dx,offset choosenOption
;    mov ah,0Ah
;    int 21h 



         
    hlt     
endp main

inputpart proc
    mov dx,offset inputnumber
    mov ah,0Ah
    int 21h
    
    lea bp,inputnumber
    add bp,2
    mov ax,0
    mov al, 0Dh
    push ax ; 0Dh will be used as escape character
    
    inputloop:
        mov ax,[bp]
        cmp al,0Dh
        je endinputloop
        cmp al,30h
        jb notvalid
        
        cmp al,39h
        ja notvalid
        inc bp 
        mov ah,0
        push ax    
    jmp inputloop                       
    endinputloop:
    mov ah,0
    mov di,1
    
    StrToIntLoop:
        pop ax
        cmp ax,0Dh  ; checking if numbers ended
        je inputend
        sub ax,30h
        mul di
        add si,ax
        mov ax,10
        mul di
        mov di,ax       
    jmp StrToIntLoop   
    notvalid: 
    mov dx,offset errormsg
    mov ah,09h
    int 21h
    ret                     
    inputend:
    
    ret    
endp inputpart    

          
linebreak proc
    mov dx,offset nextline
    mov ah,09h
    int 21h
    ret
    
linebreak endp
          
          
