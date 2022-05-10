org 100h
.model small
.stack 64
.data
    mynumber dw 1092 
    msg db "prime","$"    
    numstr db "$$$$$$$" ;empty array for 5 digit output       
    num dw ?                                   
    nextline    db 13,10,'$'    ;line break.    
    menu db     "<<<<<<<<<<MENU>>>>>>>>>","$" 
    border db   "<<<<<<<<<>>>>>>>>","$" 
    item1 db    "<  1-Fibonacci  >","$"
    item2 db    "<  2-Factorial  >","$"
    item3 db    "<  3-Square     >","$"
    item4 db    "<  4-Prime      >","$"
    item5 db    "<  5-ABOUT      >","$"
    item6 db    "<  6-EXIT       >","$"
    
    aboutmsg1 db  "<<<<<<<<<<<<<AUTHOR>>>>>>>>>>>>",10,13,10,13,"$"
    aboutmsg2 db  "Full Name: Anil Orhun Demiroglu",10,13,10,13,"$"
    aboutmsg3 db  "Studen Number: 21728184",10,13,10,13,"$"
    aboutmsg4 db  "Nickname: Vuzuu",10,13,10,13,"$"
    aboutmsg5 db  "About Project: This project is written for ELE338 lecture.",10,13,10,13,"$"
    aboutmsg6 db  "<<<<<<<<<<ABOUT PROJECT>>>>>>>>",10,13,10,13,"$"    
    aboutmsg7 db  "Code has 4 utilities.",10,13,10,13,"$"  
    aboutmsg8 db  "1-) It can find if input is a Fibonacci Number or not.",10,13,10,13,"$"
    aboutmsg9 db  "If it is not a Fibonacci Number it will print nearst Fibonacci Number",10,13,10,13,"$"
    aboutmsg10 db  "2-) It can find factorial of an input.",10,13,10,13,"$"
    aboutmsg11 db "But be careful 16-bbit register can calculate if your input if lower than 9.",10,13,10,13,"$"
    aboutmsg12 db "3-) It can find Square Root of an input. ",10,13,10,13,"$"
    aboutmsg13 db "If it is not square number it will print nearst one.",10,13,10,13,"$"
    aboutmsg14 db "4-) It can find if a number is prime or not. ",10,13,10,13,"$"
    aboutmsg15 db "If input is not a prime number it will print closest prime to input",10,13,10,13,"$"
    aboutmsg16 db "Thats all about this code.",10,13,10,13,"$"
    aboutmsg17 db "Have a nice a day :)",10,13,10,13,"$"
    
    
    
    
    
    optionmsg db "Please choose one of the options: ","$"                
    inputnumber db 6, 1 dup(?)    
    ask db 10,13,"Please enter a number: ","$"
    integer db 2,1,1 dup(" ")

    inputmsg db "Please enter your input: ","$" 
    
    errormsg db "Invalid input please enter valid input","$" 
    
    squarerootmsg db "You have selected Square Root","$"
    positvsqrmsg db "Your number is square number and square root is:  ","$"      
    negativesqrmsg db "Your number is not square number closest square root is: ","$"
    
    primemsg db "You have selected prime number","$"
    positvprimemsg db "Your input is a prime number: ","$"
    negativevprimemsg db "Your input is not a prime number closest prime number is: ","$"
    
    factorialinitmsg db "You have selected Factorial","$"
    facterrormsg db "Your inputs result wont fit in 16-bit register please enter a number that smaller than 9","$"
    
    
    fiboninitmsg db "You have selected Fibonacci Number","$"    
    fibonlowermsg db "Your input is not a Fibonacci Number closest Fibonacci Number is: ","$"    
    fibonmsg db "Your input is Fibonacci Number","$"
.code 
main proc
; factorial     input -> SI, OUTPUT-> AX
; square root   input -> SI, OUTPUT-> BP
; prime         input -> SI, OUTPUT-> BP printpart done
; fibonacci     input -> SI, OUTPUT-> DX needs to lower part
; input leaves input in SI
; TODO add EXIT 
; TODO fix about part it is too long to fit in screen
    
foreverloop:
    
    call mainmenu
    call choice 
jmp foreverloop    
        
             
    hlt         
endp main  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
choice proc
    choicestart:
    call inputpart

    cmp si,1
    je tofibon
    
    cmp si,2
    je tofactorial 
    
    cmp si,3
    je tosqr
    
    cmp si,4
    je toprime
    
    cmp si,5
    je toabout
    
    cmp si,6
    je toexit

    call linebreak    
    mov dx,offset errormsg
    mov ah,09h
    int 21h
    call linebreak
      
    jmp choicestart 
    
    
    tofibon:        
        mov ax,3
        int 10h        
        mov dx,offset fiboninitmsg
        mov ah,09h
        int 21h
        call linebreak
        mov dx, offset inputmsg
        mov ah,09h 
        int 21h

                    
        call inputpart
        call fibonacci
        ret
    tofactorial:      
        mov ax,3
        int 10h
        
        mov dx,offset factorialinitmsg
        mov ah,09h
        int 21h
        call linebreak
        mov dx,offset inputmsg
        mov ah,09h
        int 21h
        call inputpart
        call factorial
        call linebreak
        ret
    tosqr:
        mov ax,3
        int 10h
        
        mov dx,offset squarerootmsg
        mov ah,09h
        int 21h
        call linebreak
        mov dx,offset inputmsg
        mov ah,09h
        int 21h
        
        call inputpart
        call squareroot
        call linebreak        
        ret
    toprime:          
        mov ax,3
        int 10h
        mov dx,offset primemsg
        mov ah,09h
        int 21h
        call linebreak
        mov dx,offset inputmsg
        mov ah,09h
        int 21h 
        call inputpart
        call prime
        call linebreak       
        ret
    toabout:          
        mov ax,3
        int 10h
        
        mov dx,offset aboutmsg1
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg2
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg3
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg4
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg5
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg6
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg7
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg8
        mov ah,09h
        int 21h         
        mov dx,offset aboutmsg9
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg10
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg11
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg12
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg13
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg14
        mov ah,09h
        int 21h        
        mov dx,offset aboutmsg15
        mov ah,09h
        int 21h
        mov dx,offset aboutmsg16
        mov ah,09h
        int 21h          
        mov dx,offset aboutmsg17
        mov ah,09h
        int 21h         
               
        ret
    toexit:
        mov ax,3
        int 10h               
        hlt
    ret    
endp choice    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mainmenu proc

    mov dx,offset menu
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset item1
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset item2
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset item3
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset item4
    mov ah,09h
    int 21h 
    call linebreak   

    mov dx,offset item5
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset item6
    mov ah,09h
    int 21h  
    call linebreak  
    
    mov dx,offset border
    mov ah,09h
    int 21h 
    call linebreak

    mov dx,offset optionmsg
    mov ah,09h
    int 21h  
    ret                      
endp mainmenu     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
        mov num,bp 
        call linebreak
        mov dx,offset positvsqrmsg
        mov ah,09h
        int 21h
       
        call writeINT
        call linebreak
        ; value in bp
        ret
    
    lowersqr:
        dec bp
        mov num,bp
        call linebreak
        mov dx,offset negativesqrmsg
        mov ah,09h
        int 21h
        call writeINT
        call linebreak        
        ; lower val in bp                            
        
    ret
endp squareroot 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    call linebreak 
        mov dx,offset positvprimemsg
        mov ah,09h
        int 21h
        mov num,bx
        call writeint
        call linebreak
        ret    
    notprime:  
        dec bx
        mov bp,2    ; init BP 
        mov ax,bx        
        cmp bx,1
        jz onecond        
        cmp bx,2
        jz twocond       
        innerloop:
            mov dx,0
            mov ax,bx
            div bp
            cmp dx,0
            jz notprime
            inc bp
            cmp bx,bp
            jz lowerprimefound                                   
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
        call linebreak
        mov dx,offset negativevprimemsg
        mov ah,09h
        int 21h
        mov num,bx
        call writeint
        call linebreak
        ret                 
endp prime 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
writeINT proc
    ;mov num, 0FFFFh ; INPUT HERE IN!!!!! DO NOT FORGET
;convert number to string.
    mov  si, offset numstr
    mov  ax, num
    call number2string    ;returns numstr.
;display string.
    mov  ah, 9
    mov  dx, offset numstr
    int 21h
    ret     
endp writeINT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
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
endp number2string       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
    mov si,0
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
        call linebreak
        mov dx,offset fibonlowermsg
        mov ah,09h
        int 21h
        
        mov num,cx
        call writeINT 
 ;       mov dx,cx    
        call linebreak
        ret 
    fibonend:
        call linebreak
        mov dx,offset fibonmsg
        mov ah,09h
        int 21h   
        call linebreak               
        ret
endp fibonacci    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
factorial proc
    mov bx,si   ; Getting input into SI
    mov ax,1
    cmp bx,8
    ja facterror
    factloop:
        mul bx
        dec bx
        cmp bx,1
        je endfact            
    jmp factloop
    endfact:
	;OUTPUT is in AX REGISTER
	mov num,ax
	call linebreak
	call writeINT
	call linebreak
	ret    
	facterror:
	    call linebreak
	    mov dx,offset facterrormsg
	    mov ah,09h
	    int 21h
	    call linebreak
    ret
endp factorial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
linebreak proc
    mov dx,offset nextline
    mov ah,09h
    int 21h
    ret    
linebreak endp    
  