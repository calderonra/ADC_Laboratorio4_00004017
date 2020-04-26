org	100h

section .text
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