.model small
.data
m1 db 10,13, "Enter 5 numbers:$"
m2 db 10,13, "After sorting Number:$"
arr db 2 dup(?)

.code
mov ax,@data
mov ds,ax

mov cx,05h
mov bx,offset arr

mov ah,09h
lea dx,m1
int 21h

inputs:
mov ah,01h
int 21h
mov [bx],al
inc bx
Loop inputs

mov cx,05h
dec cx

outerloop:
mov bx,cx
mov si,0

comploop:
mov al,arr[si]
mov dl,arr[si+1]
cmp al,dl

jc noswap

mov arr[si],dl
mov arr[si+1],al

noswap:
inc si
dec bx
jnz comploop

loop outerloop

mov ah,09h
lea dx,m2
int 21h
mov dl,10
mov ah,02h
int 21h



 mov cx,05h
 mov bx,offset arr
 outputs:
 mov dl,[bx]
 mov ah,02h
 int 21h

 mov dl,32
 mov ah,02h
 int 21h

 inc bx
 loop outputs




mov ah,4ch
int 21h
end
