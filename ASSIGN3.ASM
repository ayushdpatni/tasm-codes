.model small

.data
m1 db 10,13, "Enter the 2 digit no.$"
arry db 5 dup(?)
sum db 0000h

.code
mov ax,@data  ; Intilize the data seg address
mov ds,ax

mov ah,09h
lea dx,m1       ;Display message
int 21h

mov ch, 05     ;set Counter

lea si,arry   ;pointer pointing to first location of arry
mov al,00

X3:
call accept   ; PC pushes address of next instr on top of the stack
mov [si],bl     ;transfer data to that location pointed by si
add bl,[si]
inc si
dec ch
JNZ X3         ;unless ZF is not set 
mov ah,4ch
int 21h

accept proc near

mov ah,01h      ; ascii code goes in to AL(0 to F)
int 21h

mov bl,al        ;make free al
sub bl,30h       ; seperate the accepted no forms ascii code
cmp bl,09h       ; if single digit is >9 then need to sub 07h
JLE X1                    ; bl=5  bl=50     bl=50+8=58                    58
sub bl,07h                       ;bh=8

X1:
mov cl,04h        ;create Tens place value for 2 digit no
SHL bl,cl

mov ah,01h       ; second no. accept (0-F) unit value
mov bh,al
sub bh,30h

cmp bh,09h
JLE X2

sub bh,07h
X2:
add bl,bh          ;two digit no is created

ret                 ;pop the next instruction address from the stack
endp
end
        
