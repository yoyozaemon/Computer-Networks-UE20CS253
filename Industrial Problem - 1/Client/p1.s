.data
a: .word 1,2,3,4
     .word 5,6,7,8

b: .word 10,11,12,13
     .word 14,15,16,17

c: .word 0	

.text

LDR R0,=a
LDR R1, =b
LDR R6,=c
MOV R2,#2
MOV R3, #4
MOV R4,#0
MOV R5,#0

LOOP_OUT:	
 	LOOP_IN:
		LDR R7,[R0],#4
		LDR R8,[R1],#4
		ADD R9,R7,R8	
		STR R9,[R6],#4
		ADD R5,R5,#1
		CMP R3,R5
		BNE LOOP_IN
	MOV R5,#0
	ADD R4,R4,#1
	CMP R4,R2
	BNE LOOP_OUT
	BEQ EXIT

EXIT: SWI 0X11
