.model small
.stack 100h
.data
    num dw ?                                   
    lbk    db 13,10,'$'   ;line break.
    numstr db '$$$$$$$'     ;string for 4 digits.
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    call writeINT
    mov ax,4c00h
    int 21h
main endp

;------------------------------------------
;convert a number in string.
;algorithm : extract digits one by one, store
;them in stack, then extract them in reverse
;order to construct string (str).
;parameters : ax = number to convert.
;             si = pointing where to store string.

writeINT proc
    mov num, 0FFFFh ; INPUT HERE IN!!!!! DO NOT FORGET
;convert number to string.
    mov  si, offset numstr
    mov  ax, num
    call number2string    ;returns numstr.

;display string.
    mov  ah, 9
    mov  dx, offset numstr
    int 21h
    ret     

writeINT endp
    

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
endp dollars                   

