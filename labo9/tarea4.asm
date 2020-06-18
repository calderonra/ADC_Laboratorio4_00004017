org 	100h

section .text

	mov 	dx, msg ;Escribiendo mensaje inicial
	call 	w_strng ;Llamando a teclado


reset:	xor 	si, si 	; contador
lupi:	call 	kb
	mov	[300h+si], al ;
    sub al, 30h  ; resto 30H (48Dec) para obtener el numero
	mov [210h+si], al ;Se almacenan los numeros en las posiciones 210+si
    cmp 	si, 04h
	je	    res ;condicion de paro sera cuando si sea 4
	inc 	si
	jmp 	lupi

mostrar:mov 	dx, nl
	call	    w_strng
	mov	byte    [300h+si], "$"
	mov 	    dx, 300h
	call 	    w_strng
	call 	    kb	
	int 	    20h

texto:	 mov 	ah, 0h ; modo texto
	int 	16h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

mostrarmsg:
    mov ah,09h
    int 21h
    ret

prom:	mov 	ax, 0000h
	mov 	bx, 0000h
	mov	al,     [200h]   ;sumando
	mov	bl,     [201h]
	add	al,     bl
	mov	bl,     [202h]
	add	al,     bl
	mov	bl,     [203h]
	add	al,     bl
	mov	bl,     [204h]
	add	al,      bl
	mov	[210h], al
	mov 	DX, 0000h
	mov 	BX, 5h 
	div	BX	;division
	ret



res:
    mov dx, msg1 
    cmp al, 01h ;Comparaciones de cada posible resultado
    je mostrarmsg
    mov dx, msg2
    cmp al, 02h
    je mostrarmsg
    mov dx, msg3
    cmp al, 03h
    je mostrarmsg
    mov dx, msg4
    cmp al, 04h
    je mostrarmsg
    mov dx, msg5
    cmp al, 05h
    je mostrarmsg
    mov dx, msg6
    cmp al, 06h
    je mostrarmsg
    mov dx, msg7
    cmp al, 07h
    je mostrarmsg
    mov dx, msg8
    cmp al, 08h
    je mostrarmsg
    mov dx, msg9
    cmp al, 09h
    je mostrarmsg
    mov dx, msg10
    cmp al, 0Ah
    je mostrarmsg
    

section .data
msg 	db 	"Ingresa tu carnet: $"
nl	db 	0xA, 0xD, "$"

section .data
msg1 	db 	" Solo necesito el 0 $"
nl1	db 	0xA, 0xD, "$"

section .data
msg2 	db 	" Aun se pasa $"
nl2	db 	0xA, 0xD, "$"

section .data
msg3 	db 	" Hay salud $"
nl3	db 	0xA, 0xD, "$"

section .data
msg4 	db 	" Me recupero $"
nl4	db 	0xA, 0xD, "$"

section .data
msg5 	db 	" En el segundo $"
nl5	db 	0xA, 0xD, "$"

section .data
msg6 	db 	" Peor es nada $"
nl6	db 	0xA, 0xD, "$"

section .data
msg7 	db 	" Muy bien $"
nl7	db 	0xA, 0xD, "$"

section .data
msg8 	db 	" Colocho $"
nl8	db 	0xA, 0xD, "$"

section .data
msg9 	db 	" Siempre me esfuerzo $"
nl9	db 	0xA, 0xD, "$"

section .data
msg10 	db 	" Perfecto solo dios $"
nl10	db 	0xA, 0xD, "$"