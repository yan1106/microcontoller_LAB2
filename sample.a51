#include "tx3703.inc"

	
	One_set 	EQU 0E0H  
	Ten_set  	EQU 0D0H  
	LOne_set	EQU 0B0H
	LTen_set	EQU 073H
	
	NINE	    EQU 0BAH ;10111010b
	
	R_TEN 	EQU 0EAH  ;11101010b  
	R_TENN	EQU 0D3H  ;11010011b  
	L_TEN	EQU 0B0H  ;10110000b
	L_TENN  EQU 070H  ;01110000b
			
	ROne	EQU 60H	  ;Memory address,
	RTen	EQU 61H	  ;Memory address,		
	LOne	EQU 62H	  ;Memory address,
	LTen	EQU 63H	  ;Memory address,
	
	ORG 000h
	AJMP Start
	ORG 400h
Start:

	MOV P0OE,#11111111b;
	MOV P0,#11111111b;
	
	MOV ROne,#One_set 	
	MOV RTen,#Ten_set 	
	MOV LOne,#LOne_set  	
	MOV LTen,#LTen_set  	


S1:
	MOV R2,#10  
S2:
	MOV P0,ROne
	ACALL delay_1s
	
	MOV P0,RTen
	ACALL delay_1s
	
	MOV P0,LOne
	ACALL delay_1s
	
	MOV P0,LTen
	ACALL delay_1s
	
	DJNZ R2,S2  ;
	
	
s3:	
	INC ROne
	MOV A,ROne
	CJNE A,#R_TEN,S4    ;0EAH  ;11101010b 
	MOV ROne,#One_set   ;0E0H 
	INC RTen

	AJMP S4
S4:	
    MOV R0,LOne
	DEC LOne
	CJNE R0,#L_TEN,S1   ;0B0H  ;10110000b
	MOV LOne,#NINE	    ;0BAH ;10111010b
	DEC LOne
	DEC LTen
	
	AJMP S5
S5:
    MOV A,RTen
    CJNE A,#R_TENN,S1   ;0D3H  ;11010011b 
	
	AJMP S6


S6:
    MOV R2,#5
S7:
	MOV P0,#11111111b;  

	ACALL delay_10s

	MOV P0,#00000000b;
	
	ACALL delay_10s
	
	DJNZ R2,S7
	
	AJMP Start

delay_1s:
	MOV R5,#18
	D1:
	MOV  R6,#8
	DJNZ R6,$
	DJNZ R5,D1
	RET
delay_10s:
	MOV R5,#100
	D2:
	MOV  R6,#100
	DJNZ R6,$
	DJNZ R5,D2
	RET