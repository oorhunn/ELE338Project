
org 100h

mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h

mov dx,offset menu
mov ah,9
int 21h

mov dx,offset item1
mov ah,9
int 21h

mov dx,offset item2
mov ah,9
int 21h

mov dx,offset item3
mov ah,9
int 21h

mov dx,offset item4
mov ah,9
int 21h

mov dx,offset item5
mov ah,9
int 21h

mov dx,offset item6
mov ah,9
int 21h

mov dx,offset message1
mov ah,9
int 21h

mov dx,offset choosenOption  ;The user choose one of the options
mov ah,0ah                
int 21h

lea bp,choosenOption
inc bp
inc bp


mov al,00h
mov bh,0Fh
mov ch,0
mov cl,0         ;kullanici menudeki seceneklerden birini sectikten sonra ekran temizlenir
mov dh,40
mov dl,40
mov ah,07h
int 10h


mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h 

mov dh,00h
mov dl,00h
mov bh,00h
mov ah,02h
int 10h

mov ax,0000h
mov bx,0000h
mov cx,0000h
mov dx,0000h

mov cx,[bp]
mov dl,31h

cmp cl,dl         ;kullanicinin menudeki seçeneklerden hangisini sectigi bulunur
je here1
inc dl

cmp cl,dl         ;kullanicinin menudeki seçeneklerden hangisini sectigi bulunur
je here2
inc dl            ;kullanicinin menudeki seçeneklerden hangisini sectigi bulunur

cmp cl,dl
je here3          ;kullanicinin menudeki seçeneklerden hangisini sectigi bulunur
inc dl

cmp cl,dl         
je here4
inc dl

cmp cl,dl         
je here5
inc dl

cmp cl,dl         
je here6

mov dx,offset error1
mov ah,9
int 21h

hlt

here5:
mov dx,offset item5
mov ah,9
int 21h

hlt

here6:
mov dx,offset item6
mov ah,9
int 21h

hlt

here1:
mov dx,offset item1
mov ah,9
int 21h

mov dx,offset ask
mov ah,9
int 21h

mov dx,offset integer  ;The user enters a number
mov ah,0ah                
int 21h

hlt

here2:
mov dx,offset item2
mov ah,9
int 21h

mov dx,offset ask
mov ah,9
int 21h

mov dx,offset integer  ;The user enters a number
mov ah,0ah                
int 21h

hlt

here3:
mov dx,offset item3
mov ah,9
int 21h

mov dx,offset ask
mov ah,9
int 21h

mov dx,offset integer  ;The user enters a number
mov ah,0ah                
int 21h

hlt 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ASAL ;;;;;;;;;;;;;;;

here4:
mov dx,offset item4
mov ah,9
int 21h

mov dx,offset ask
mov ah,9
int 21h

mov dx,offset integer  ;The user enters a number
mov ah,0ah                
int 21h

LEA BP,integer 
MOV AX,[BP+2]   ;This my testing number
MOV AH,00h
MOV BX,0031h  ;in order to test the number if it is equal to 1  
MOV DX,0000h   ; initialzing

CMP AX,BX    ;  I check the if the test number is equal to 1

JZ  asalDegil     

INC BX
             ; I check the if the test number is equal to 2
CMP AX,BX

JZ asal

SUB AX,0030h
MOV BX,AX

DEC AX
DEC AX

MOV CX,AX    ; I am gonna turn this loop for (myNumber-2) times that is why I decreased AX twice

dongu: 

MOV DX,[BP+2]   ;every time at the beginning of the cylce I carry myNumber into AX again and again because at the end of the cycle I lose the number in AX every time
MOV DH,00h
SUB DX,0030h
MOV AX,DX
DEC BL        ;I check that can myNumber is diveded by (myNumber-N)  N=1,2,3,4,5....   That is why I decrease BX by 1 for every new cycle

DIV BL

CMP AH,00h   ;if the remainder is equal to 0 the zero flag will be 1  

JZ asalDegil   ; if the   zero flag is 1 it will jump

loop dongu:

mov dx,offset message1ForItem4
mov ah,9
int 21h

HLT

asalDegil:

mov dx,offset message2ForItem4
mov ah,9
int 21h



HLT

asal:

mov dx,offset message1ForItem4
mov ah,9
int 21h

HLT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ASAL ;;;;;;;;;;;;

ret

menu db "MENU",10,13,10,13,"$"
item1 db "1)Fibonacci",10,13,10,13,"$"
item2 db "2)Factorial",10,13,10,13,"$"
item3 db "3)Square",10,13,10,13,"$"
item4 db "4)Prime",10,13,10,13,"$"
item5 db "5)ABOUT",10,13,10,13,"$"
item6 db "6)EXIT",10,13,10,13,"$"
message1 db "Please Choose One Of the Options: ","$"        
choosenOption db 2,1,1 dup(" ")
ask db 10,13,"Please enter a number: ","$"
integer db 2,1,1 dup(" ")
error1 db 10,13,"Yanlis bir secim yaptiniz","$"

message1ForItem4 db 10,13,10,13,"The number you have entered is a prime number","$"
message2ForItem4 db 10,13,10,13,"The number you have entered is not a prime number,",10,13,"The closest prime number that is smaller then the number you entered is: ","$"
