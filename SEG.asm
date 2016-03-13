;程式功能:四顆七段顯示器顯示數字(2014)
#include "tx3703.inc"

	org 000h
	ajmp Start
	org 400h
Start:

	mov p0oe,#11111111b;
	mov p0,#11111111b;
	mov p2oe,#111111111b;
	mov p2,#11110000b;

S1:
	mov p0,#11000000b
	mov p2,#11111110b;
	acall delay_1s
	
	mov p0,#11111001b
	mov p2,#11111100b;
	acall delay_1s
	
	mov p0,#10100100b
	mov p2,#11111000b;
	acall delay_1s
	
	mov p0,#10110000b
	mov p2,#11110000b;
	acall delay_1s
	
	ljmp S1
	
delay_1s:
	MOV R5,#200
	D1:
	MOV R6,#2500
	DJNZ R6,$
	DJNZ R5,D1
	RET
	
	END