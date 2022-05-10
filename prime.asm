org 100h
.model small
.stack 64
.data  
    mynumber dw 1092 
    msg db "prime","$"    
    numstr db "$$$$$$$" ;empty array for 5 digit output       
    num dw ?                                   
    nextline    db 13,10,'$'    ;line break.
.code                           
main proc
    mov ax,dx
    mov di,ax
        
    mov si,10
    call prime 


         
    hlt     
endp main

prime proc
    mov ax,si   ; input value
    cmp ax,1        ; 1 condition
    je primefound   
    cmp ax,2
    je primefound   ; 2 condition
    mov bp,2
    mov bx,ax       ; saving AX into BX     
    primeloop:
        mov ax,bx
        cmp ax,bp
        jz primefound
        mov dx,0
        div bp
        cmp dx,0
        jz notprime
        inc bp       
    jmp primeloop      
    primefound: 
        mov dx,offset msg
        mov ah,09h
        int 21h
        ret    
    notprime:  
        push bx
        push bx ; saving first input into stack
        call lowerprime
        ret 
        
prime endp        

lowerprime proc
    pop bx
    dec bx
    mov bp,2    ; init BP 
    mov ax,bx
    
    cmp bx,1
    jz onecond
    
    cmp bx,2
    jz twocond       
    innerloop:
        mov ax,bx
        cmp ax,bp
        jz lowerprimefound           
        dec bx
        
    jmp innerloop
    onecond:
    mov num,1
    call writeint
    ret
    
    twocond:
    mov num,2
    call writeint
    ret
    
    lowerprimefound:
    mov num,bx
    call writeint
    ret                       
               
lowerprime endp    


linebreak proc
    mov dx,offset nextline
    mov ah,09h
    int 21h
    ret
    
linebreak endp    
  
writeint proc
    ;mov num, 0ffffh ; input here in!!!!! do not forget
;convert number to string.
    mov  si, offset numstr
    mov  ax, num
    call number2string    ;returns numstr.

;display string.
    mov  ah, 9
    mov  dx, offset numstr
    int 21h
    ret     

writeint endp
    

number2string proc 
  call dollars ;fill string with $.
  mov  bx, 10  ;digits are extracted dividing by 10.
  mov  cx, 0   ;counter for extracted digits.
cycle1:       
  mov  dx, 0   ;necessary to divide by bx.
  div  bx      ;dx:ax / 10 = ax:quotient dx:remainder.
  push dx      ;preserve digit extracted for later.
  inc  cx      ;increase counter for every digit extracted.
  cmp  ax, 0   ;if number is
  jne  cycle1  ;not zero, loop. 
;now retrieve pushed digits.
cycle2:  
  pop  dx        
  add  dl, 48  ;convert digit to character.
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
number2string endp       

;------------------------------------------
;fills variable with '$'.
;used before convert numbers to string, because
;the string will be displayed.
;parameter : si = pointing to string to fill.

proc dollars                 
    mov  cx, 5
    mov  di, offset numstr
dollars_loop:      
    mov  bl, '$'
    mov  [ di ], bl
    inc  di
loop dollars_loop

ret
endp