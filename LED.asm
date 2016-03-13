;LED 跑馬燈
#include "tx3703.inc"

                        org 00h                 
                        ajmp Start
                        org 400h
Start: 
		mov p2oe,#11111111b
	 	mov p0oe,#11111111b
		mov p2,#11110000b
		mov p0,#00000000b
		  
S1:
		mov P0,#01111111b 	   
		acall delay_1s 

		mov P0,#00111111b 	   
		acall dely5s 
		
		mov P0,#00011111b 	   
		acall delay_1s 
		
		mov P0,#00001111b 	   
		acall dely5s 
		
		mov P0,#00000111b 	   
		acall delay_1s 
		
		mov P0,#00000011b 	   
		acall dely5s
		
		mov P0,#00000001b 	   
		acall delay_1s 
		
		mov P0,#00000000b 	   
		acall dely5s
		
		ljmp S1 				


 delay_1s:
	MOV R5,#80
  D1:	
    MOV R6,#250
	DJNZ R6,$
	DJNZ R5,D1
	RET
	
	
	
  dely5s:
	MOV R4,#2000
  D2:	
    MOV R3,#250
	DJNZ R3,$
	DJNZ R4,D2
	RET
	
	END
