org	100h

section .text


	;ejercicio 2

	mov	ax,2d
	mov	bx,0000h
	mov	cx,0000h
	mov	dx,0000h
	mov	cx,2d
	mov	bx, 0h
	mul	cx
	mov	[bx+210h],ax

loop: inc bx
	mul cx
	mov[bx+210h], ax
	cmp ax, 0xff
	jb loop

loopOverlow: inc bx
	inc bx
	mul cx 
	mov [bx+210h], ax 
	cmp bx, 12d
	jb loopOverlow
	

;Ejercicio 3 

	mov	ax,0000h
	mov	bx,0000h
	mov	cx,0000h
	mov	dx,0000h
	
	mov	

	;Ejercicio 1

	mov     ax, 4d
        mov     bx, 0d
	add     ax, bx ;AX = 4

        mov     bx, 1d
        add     ax, bx ;AX =5

        mov     bx, 7d
        add     ax, bx ; AX = 4

	mov	dx, 0000h ; limpiando
	mov	bx, 4d
	div	bx
	mov	[220h], dx ; total

	mov	di, 0d
	mov	cx, [len]

lupi:   mov	bl, [comnt+di]
	mov	[di +200h], bl
	inc	di
	loop	lupi

	int	20h

section .data

comnt	db	"Hay salud"
len	equ	$-comnt

