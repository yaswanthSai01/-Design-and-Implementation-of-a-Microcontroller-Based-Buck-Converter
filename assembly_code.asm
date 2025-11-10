org   0100h
Start:	
      
      SOLN: MOV TMOD, #10H ;	Program	TMOD	è (0001	0000)2	...	Timer1	Mode1
REPEAT: MOV TL1, #06H ;	Load	lower	byte	of	CountON
MOV TH1, #0FFH ;	Load	upper	byte	of	CountON
SETB P3.1 ;	Display	“1”	at	Txd
MOV TCON, #40H ;	Program	TCON	è (0100		0000)2 …	start	Timer1
ON: JNB TCON.7, ON ;	Maintain	“1”	at	Txd
CLR P3.1 ;	Clear	Txd
MOV TCON, #00H ;	Stop	Timer1
MOV TL1, #12H ;	Load	lower	byte	of	CountOFF
MOV TH1, #0FDH ;	Load	upper	byte	of	CountOFF
MOV TCON, #40H ;	Program	TCON	è (0100		0000)2 …	start	Timer1
OFF: JNB TCON.7, OFF ;	Maintain	“0”	at	Txd
MOV TCON, #00H ;	Stop	Timer1
SJMP REPEAT ;	Repeat	the	process
Loop:	
      jmp Loop

;====================================================================
      END
