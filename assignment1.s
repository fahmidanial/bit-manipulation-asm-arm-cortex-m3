;GROUP 5
;Assignment1
;QUESTION : Find the number BB inside address from location 0x20000000 until 0x20000008 and move it to new address started at 0x2000000A.

	AREA  assignment1, CODE, READONLY
    EXPORT  __main
    ENTRY
	
__main
		MOVW R0, #0x0000
		MOVT R0, #0x2000 ;Set R0 as pointer for 0x20000000_OLD LOCATION
		MOVW R1, #0x000A
		MOVT R1, #0x2000 ;Set R1 as pointer for 0x2000000A_NEW LOCATION
		MOVW R4, #0x0004
		MOVT R4, #0x2000 ;Set R4 as pointer for 0x20000004 to store the next value 0xBBBB
		MOV  R6, #0xBBBB 

		STR R6, [R4] 	 ;Store data in R6 at starting pointer 0x20000004
		LDRB R3, MyData   ;Insert input value BB to R3 
MyData	DCB	0xBB 

		
loop	CMP R8, R3	     ;Compare the input value in R3 and data in R8
		BEQ next1		 ;If R8 = R3 go to next1		
		LDRB R8,[R0], #1 ;Load the counter value from data in R0 to the R8		
		B loop			 ;Is the counter = BB?			
		
next1 	STRB R8, [R1]	 ;Store the data in R8 to the new location
		

stop	B	stop

		END
		
