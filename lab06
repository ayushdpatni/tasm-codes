;Q. Write asp for following operations a) string length, b) copy string
;c) reverse of string, d) palindrome, e) concatenation of string

.model small

.data
disp1 macro msg
mov ah, 09h
lea dx, msg
int 21h
endm

P1 label byte
maxlen1 db 20
len1 db 0
arr1 db 20 dup('$')

P2 label byte
maxlen2 db 20
len2 db 0
arr2 db 20 dup('$')

arr3 db 30 dup('$')
arr4 db 20 dup('$')
arr5 db 20 dup('$')

msg10 db 10,13, "Enter First String: $"
msg11 db 10,13, "Enter Second String: $"
msg12 db 10,13, "Length of string: $"
msg13 db 10,13, "Concatenated String: $"
msg14 db 10,13, "Copied String is: $"
msg15 db 10,13, "Reverse String: $"
msg16 db 10,13, "Not Palindrome$"
msg17 db 10,13, "Yes! It is Palindrome$"

.code
mov ax, @data
mov ds, ax
mov es, ax

;accept string1
disp1 msg10
mov ah, 0ah
lea dx, P1
int 21h

;length string1
disp1 msg12
mov al, len1
call print

;accept string2
disp1 msg11
mov ah, 0ah
lea dx, P2
int 21h

;length string2
disp1 msg12
mov al, len2
call print

;concatenation
lea si, arr1			;mov si, offset arr1
lea di, arr3
mov cl, len1
cld				;clear the direction flag

m1: movsb
    dec cl
    JNZ m1

lea si, arr2
mov cl, len2
cld

m2: movsb
    dec cl
    JNZ m2

disp1 msg13
disp1 arr3

;copying
lea si, arr1
lea di, arr4
mov cl, len1
cld

m3: movsb
    dec cl
    JNZ m3

disp1 msg14
disp1 arr4

;reverse
lea si, arr1
lea di, arr5
mov cl, len1
mov ch, 00
add si, cx
dec si

m4: std
    lodsb
    cld
    stosb
    dec cl
    JNZ m4

disp1 msg15
disp1 arr5

;palindrome
lea si, arr1
lea di, arr5
mov cl, len1
repe cmpsb
JNZ np
disp1 msg17
JMP m6

np: disp1 msg16
m6: mov ah, 4ch
    int 21h

print proc near
	add al, 30h
	cmp al, 39h
	JLE l1
	add al, 07h
	l1: mov dl, al
	mov ah, 02h
	int 21h
ret
endp
end