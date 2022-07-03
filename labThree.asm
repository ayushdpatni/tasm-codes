.model small

.data
m1 db 10,13, "Enter five subjects marks:$"
arry db 5 dup(00)
sum dw 0000h
m2 db 10,13, "F grade$"
m3 db 10,13, "C grade$"
m4 db 10,13, "B grade$"
m5 db 10,13, "A grade$"

.code
mov ax,@data    
mov ds,ax     

mov ah,09h
lea dx,m1       ;Display message
int 21h

mov ch,05h      ;Set counter

mov si,offset arry      ;Pointer to first loc of arry  

X3:
call accept     ;PC pushes address of next instr on top of stack
mov [si],bl     ;transfer data to si pointed loc
mov bh,00h      
add sum,bx

inc si
dec ch         ;unless ZF is not set jump to accept proc
JNZ X3

mov ax,sum
mov bl,05h
div bl          ;remainder=ah and qotient=al

cmp al,40h
JBE N1

cmp al,60h
JBE N2

cmp al,80h
JBE N3

mov ah,09h
lea dx,m5
int 21h
jmp exit

N1:
mov ah,09h
lea dx,m2       ;display message
int 21h
jmp exit

N2:
mov ah,09h
lea dx,m3
int 21h
jmp exit

N3:
mov ah,09h
lea dx,m4
int 21h
jmp exit

exit:
mov ah,4ch
int 21h

accept proc near

mov ah,01h      ;ascii code goes into AL
int 21h

mov bl,al       ;make al free
sub bl,30h      ;seperate the accepted no forms ascii code
cmp bl,09h      ;if single digit is >9 then need to sub 07h
JLE X1
sub bl,07h

X1:
mov cl,04h      ;create tens place value for 2 digit no
SHL bl,cl

mov ah,01h      ;second no accept (0-F) unit value
int 21h

mov bh,al
sub bh,30h

cmp bh,09h
JLE X2

sub bh,07h
X2:
add bl,bh       ;two digit no is created

ret
endp            ;pop the next instruction addres from stack
end