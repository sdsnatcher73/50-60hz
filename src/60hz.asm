; 60HZ.COM

RDSLT	equ 0000Ch
RG9SAV	equ 0FFE8h
RG1SAV  equ 0F3E0h

	org		0100h

	ld		a,(0fcc1h)
	ld		hl,0007h
	call	RDSLT
	ld		c,a
	inc		c

	ld		a,(0fcc1h)
	ld		hl,002dh
	push    bc
	call	RDSLT
	pop     bc
	or		a
	jr		z,MSX1

MSX2:
	ld		a,(RG9SAV)
	jr		CONTINUE

MSX1:
	ld		a,0

CONTINUE:
	and		0fdh
	di
	out		(c),a
	ld		(RG9SAV),a
	ld		a,80h+9		; Set the 60Hz mode (writing in the register 1 if MSX1 VDP)
	out		(c),a

	ld		a,(RG1SAV)
	out		(c),a
	ld		a,80h+1		; Restore the register 1 for the MSX1 VDP case
	ei
	out		(c),a
	ret					; Back to the DOS