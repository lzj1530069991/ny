;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Delay1000Us
	extern	_Delay10Us
	extern	_IIC_Start
	extern	_IIC_Send_Byte
	extern	_IIC_Read_Byte
	extern	_SDA_OUT
	extern	_SDA_IN
	extern	_IIC_Ack
	extern	_IIC_NAck
	extern	_delay_us
	extern	_delay_ms
	extern	_IIC_Stop
	extern	_IIC_Wait_Ack
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_msa_WriteBytes
	extern	_main
	extern	_i2c_addr

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_i2c_addr:
	dw	0x00
	.debuginfo gvariable name=_i2c_addr,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Stop
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Stop
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _i=r0x1004
_main:
; 2 exit points
	.line	16, "main.c"; 	IOSTB = 0;				//set PortB as output mode
	CLRA	
	IOST	_IOSTB
_00107_DS_:
	.line	20, "main.c"; 	IIC_Start();
	LCALL	_IIC_Start
	.line	21, "main.c"; 	IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	RLR	_i2c_addr,W
	MOVAR	r0x1004
	LCALL	_IIC_Send_Byte
	.line	22, "main.c"; 	IIC_Ack();
	LCALL	_IIC_Ack
	.line	23, "main.c"; 	for(i=0;i<200;i++)
	CLRR	r0x1004
_00109_DS_:
	.line	25, "main.c"; 	IIC_Send_Byte(0x00);
	MOVIA	0x00
	LCALL	_IIC_Send_Byte
	.line	26, "main.c"; 	IIC_Ack();
	LCALL	_IIC_Ack
	.line	23, "main.c"; 	for(i=0;i<200;i++)
	INCR	r0x1004,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	r0x1004,W
	BTRSS	STATUS,0
	LGOTO	_00109_DS_
	.line	28, "main.c"; 	IIC_Stop();
	LCALL	_IIC_Stop
	.line	29, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	LGOTO	_00107_DS_
	.line	31, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Stop
;   _delay_ms
;   _IIC_Start
;   _IIC_Send_Byte
;   _IIC_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Send_Byte
;   _IIC_Wait_Ack
;   _IIC_Stop
;   _delay_ms
;4 compiler assigned registers:
;   r0x1001
;   STK00
;   r0x1002
;   r0x1003
;; Starting pCode block
.segment "code"; module=main, function=_msa_WriteBytes
	.debuginfo subprogram _msa_WriteBytes
;local variable name mapping:
	.debuginfo variable _RegAddr=r0x1001
	.debuginfo variable _Data=r0x1002
_msa_WriteBytes:
; 2 exit points
	.line	34, "main.c"; 	void msa_WriteBytes(uint8_t RegAddr, uint8_t Data)
	MOVAR	r0x1001
	MOVR	STK00,W
	MOVAR	r0x1002
	.line	36, "main.c"; 	IIC_Start();  
	LCALL	_IIC_Start
	.line	38, "main.c"; 	IIC_Send_Byte(i2c_addr<<1 | WRITE);	    //·¢ËÍÐ´ÃüÁî
	BCR	STATUS,0
	RLR	_i2c_addr,W
;;1	MOVAR	r0x1003
	LCALL	_IIC_Send_Byte
	.line	39, "main.c"; 	IIC_Ack();
	LCALL	_IIC_Ack
	.line	40, "main.c"; 	IIC_Send_Byte(RegAddr);//·¢ËÍ¸ßµØÖ·	  
	MOVR	r0x1001,W
	LCALL	_IIC_Send_Byte
	.line	43, "main.c"; 	IIC_Wait_Ack();	    	 										  		   
	LCALL	_IIC_Wait_Ack
	.line	44, "main.c"; 	IIC_Send_Byte(Data);     //·¢ËÍ×Ö½Ú							   
	MOVR	r0x1002,W
	LCALL	_IIC_Send_Byte
	.line	45, "main.c"; 	IIC_Wait_Ack();  		    	   
	LCALL	_IIC_Wait_Ack
	.line	46, "main.c"; 	IIC_Stop();//²úÉúÒ»¸öÍ£Ö¹Ìõ¼þ 
	LCALL	_IIC_Stop
	.line	47, "main.c"; 	delay_ms(1);
	MOVIA	0x01
	LCALL	_delay_ms
	.line	49, "main.c"; 	}
	RETURN	
; exit point of _msa_WriteBytes


;	code size estimation:
;	   38+    0 =    38 instructions (   76 byte)

	end
