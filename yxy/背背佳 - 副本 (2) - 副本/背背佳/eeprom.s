;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"eeprom.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
	extern	_RFCbits
	extern	_INTE2bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_IIC_Read_Byte
	extern	_IIC_Send_Byte
	extern	_IIC_NAck
	extern	_IIC_Ack
	extern	_IIC_Wait_Ack
	extern	_IIC_Stop
	extern	_IIC_Start
	extern	_delay_ms
	extern	_delay_us
	extern	_SDA_IN
	extern	_SDA_OUT
	extern	_Delay10Us
	extern	_Delay1000Us

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
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_IN
;   _delay_us
;   _delay_us
;   _IIC_NAck
;   _IIC_Ack
;   _SDA_IN
;   _delay_us
;   _delay_us
;   _IIC_NAck
;   _IIC_Ack
;4 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Read_Byte
	.debuginfo subprogram _IIC_Read_Byte
;local variable name mapping:
	.debuginfo variable _ack=r0x1004
	.debuginfo variable _receive=r0x1005
	.debuginfo variable _i=r0x1006
_IIC_Read_Byte:
; 2 exit points
	.line	190, "eeprom.c"; 	u8t IIC_Read_Byte(u8t ack)
	BANKSEL	r0x1004
	MOVAR	r0x1004
	.line	192, "eeprom.c"; 	u8t i,receive=0;
	BANKSEL	r0x1005
	CLRR	r0x1005
	.line	193, "eeprom.c"; 	SDA_IN();//SDAÉèÖÃÎªÊäÈë
	LCALL	_SDA_IN
	.line	194, "eeprom.c"; 	for(i=0;i<8;i++ )
	BANKSEL	r0x1006
	CLRR	r0x1006
_00203_DS_:
	.line	196, "eeprom.c"; 	IIC_SCL=0; 
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	197, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	198, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	199, "eeprom.c"; 	receive<<=1;
	BCR	STATUS,0
	BANKSEL	r0x1005
	RLR	r0x1005,F
	.line	200, "eeprom.c"; 	if(IIC_SDA)receive++;   
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	LGOTO	_00001_DS_
	BANKSEL	r0x1005
	INCR	r0x1005,F
_00001_DS_:
	.line	201, "eeprom.c"; 	delay_us(1); 
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	194, "eeprom.c"; 	for(i=0;i<8;i++ )
	BANKSEL	r0x1006
	INCR	r0x1006,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1006,W
	BTRSS	STATUS,0
	LGOTO	_00203_DS_
	.line	203, "eeprom.c"; 	if (!ack)
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	BTRSS	STATUS,2
	LGOTO	_00201_DS_
	.line	204, "eeprom.c"; 	IIC_NAck();//·¢ËÍnACK
	LCALL	_IIC_NAck
	LGOTO	_00202_DS_
_00201_DS_:
	.line	206, "eeprom.c"; 	IIC_Ack(); //·¢ËÍACK   
	LCALL	_IIC_Ack
_00202_DS_:
	.line	207, "eeprom.c"; 	return receive;
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	.line	208, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Read_Byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _delay_us
;3 compiler assigned registers:
;   r0x1007
;   r0x1008
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Send_Byte
	.debuginfo subprogram _IIC_Send_Byte
;local variable name mapping:
	.debuginfo variable _txd=r0x1007
	.debuginfo variable _t=r0x1008
_IIC_Send_Byte:
; 2 exit points
	.line	164, "eeprom.c"; 	void IIC_Send_Byte(u8t txd)
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	167, "eeprom.c"; 	SDA_OUT(); 	    
	LCALL	_SDA_OUT
	.line	168, "eeprom.c"; 	IIC_SCL=0;//À­µÍÊ±ÖÓ¿ªÊ¼Êý¾Ý´«Êä
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	169, "eeprom.c"; 	for(t=0;t<8;t++)
	BANKSEL	r0x1008
	CLRR	r0x1008
_00192_DS_:
	.line	171, "eeprom.c"; 	if((txd&0x80)>0) //0x80  1000 0000
	BANKSEL	r0x1007
	BTRSS	r0x1007,7
	LGOTO	_00189_DS_
	.line	172, "eeprom.c"; 	IIC_SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	LGOTO	_00190_DS_
_00189_DS_:
	.line	174, "eeprom.c"; 	IIC_SDA=0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
_00190_DS_:
	.line	175, "eeprom.c"; 	txd<<=1; 	  
	BCR	STATUS,0
	BANKSEL	r0x1007
	RLR	r0x1007,F
	.line	176, "eeprom.c"; 	delay_us(2);   //¶ÔTEA5767ÕâÈý¸öÑÓÊ±¶¼ÊÇ±ØÐëµÄ
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	177, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	178, "eeprom.c"; 	delay_us(2); 
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	179, "eeprom.c"; 	IIC_SCL=0;	
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	180, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	169, "eeprom.c"; 	for(t=0;t<8;t++)
	BANKSEL	r0x1008
	INCR	r0x1008,F
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1008,W
	BTRSS	STATUS,0
	LGOTO	_00192_DS_
	.line	182, "eeprom.c"; 	} 
	RETURN	
; exit point of _IIC_Send_Byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_NAck
	.debuginfo subprogram _IIC_NAck
_IIC_NAck:
; 2 exit points
	.line	149, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	150, "eeprom.c"; 	SDA_OUT();
	LCALL	_SDA_OUT
	.line	151, "eeprom.c"; 	IIC_SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	152, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	153, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	154, "eeprom.c"; 	delay_us(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	155, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	156, "eeprom.c"; 	}	
	RETURN	
; exit point of _IIC_NAck

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Ack
	.debuginfo subprogram _IIC_Ack
_IIC_Ack:
; 2 exit points
	.line	132, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	133, "eeprom.c"; 	SDA_OUT();
	LCALL	_SDA_OUT
	.line	134, "eeprom.c"; 	IIC_SDA=0;
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	135, "eeprom.c"; 	delay_us(2);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	136, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	137, "eeprom.c"; 	delay_us(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	138, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	139, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_IN
;   _delay_us
;   _delay_us
;   _IIC_Stop
;   _SDA_IN
;   _delay_us
;   _delay_us
;   _IIC_Stop
;2 compiler assigned registers:
;   STK00
;   r0x1009
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Wait_Ack
	.debuginfo subprogram _IIC_Wait_Ack
;local variable name mapping:
	.debuginfo variable _tempTime=r0x1009
_IIC_Wait_Ack:
; 2 exit points
	.line	106, "eeprom.c"; 	SDA_IN();      //SDAÉèÖÃÎªÊäÈë  
	LCALL	_SDA_IN
	.line	107, "eeprom.c"; 	IIC_SDA=1;
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	108, "eeprom.c"; 	delay_us(1);	   
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	109, "eeprom.c"; 	IIC_SCL=1;
	BANKSEL	_PORTA
	BSR	_PORTA,7
	.line	110, "eeprom.c"; 	delay_us(1);	 
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	111, "eeprom.c"; 	while(IIC_SDA)
	BANKSEL	r0x1009
	CLRR	r0x1009
_00172_DS_:
	BANKSEL	_PORTA
	BTRSS	_PORTA,6
	LGOTO	_00174_DS_
	.line	113, "eeprom.c"; 	tempTime++;
	BANKSEL	r0x1009
	INCR	r0x1009,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xFB=251), size=1
	.line	114, "eeprom.c"; 	if(tempTime>250)
	MOVIA	0xfb
	SUBAR	r0x1009,W
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	116, "eeprom.c"; 	IIC_Stop();
	LCALL	_IIC_Stop
	.line	117, "eeprom.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00175_DS_
_00174_DS_:
	.line	120, "eeprom.c"; 	IIC_SCL=0;//Ê±ÖÓÊä³ö0 	   
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	121, "eeprom.c"; 	return 0;  
	MOVIA	0x00
_00175_DS_:
	.line	122, "eeprom.c"; 	} 
	RETURN	
; exit point of _IIC_Wait_Ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Stop
	.debuginfo subprogram _IIC_Stop
_IIC_Stop:
; 2 exit points
	.line	87, "eeprom.c"; 	SDA_OUT();//sdaÏßÊä³ö
	LCALL	_SDA_OUT
	.line	88, "eeprom.c"; 	IIC_SCL=0;
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	89, "eeprom.c"; 	IIC_SDA=0;//STOP:when CLK is high DATA change form low to high
	BCR	_PORTA,6
	.line	90, "eeprom.c"; 	IIC_SCL=1; 
	BSR	_PORTA,7
	.line	91, "eeprom.c"; 	delay_us(6); 
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	92, "eeprom.c"; 	IIC_SDA=1;//·¢ËÍI2C×ÜÏß½áÊøÐÅºÅ
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	93, "eeprom.c"; 	delay_us(6);							   	
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	94, "eeprom.c"; 	}
	RETURN	
; exit point of _IIC_Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SDA_OUT
;   _delay_us
;   _delay_us
;   _SDA_OUT
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=eeprom, function=_IIC_Start
	.debuginfo subprogram _IIC_Start
_IIC_Start:
; 2 exit points
	.line	70, "eeprom.c"; 	SDA_OUT();     //sdaÏßÊä³ö
	LCALL	_SDA_OUT
	.line	71, "eeprom.c"; 	IIC_SDA=1;	  	  
	BANKSEL	_PORTA
	BSR	_PORTA,6
	.line	72, "eeprom.c"; 	IIC_SCL=1;
	BSR	_PORTA,7
	.line	73, "eeprom.c"; 	delay_us(5);
	MOVIA	0x05
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	74, "eeprom.c"; 	IIC_SDA=0;//START:when CLK is high,DATA change form high to low 
	BANKSEL	_PORTA
	BCR	_PORTA,6
	.line	75, "eeprom.c"; 	delay_us(6);
	MOVIA	0x06
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	76, "eeprom.c"; 	IIC_SCL=0;//Ç¯×¡I2C×ÜÏß£¬×¼±¸·¢ËÍ»ò½ÓÊÕÊý¾Ý 
	BANKSEL	_PORTA
	BCR	_PORTA,7
	.line	77, "eeprom.c"; 	}	
	RETURN	
; exit point of _IIC_Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay1000Us
;   _Delay1000Us
;2 compiler assigned registers:
;   r0x100C
;   r0x100D
;; Starting pCode block
.segment "code"; module=eeprom, function=_delay_ms
	.debuginfo subprogram _delay_ms
;local variable name mapping:
	.debuginfo variable _time=r0x100C
	.debuginfo variable _i=r0x100D
_delay_ms:
; 2 exit points
	.line	53, "eeprom.c"; 	void delay_ms(u8t time)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	.line	55, "eeprom.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x100D
	CLRR	r0x100D
_00155_DS_:
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	BANKSEL	r0x100D
	SUBAR	r0x100D,W
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	.line	57, "eeprom.c"; 	Delay1000Us();
	LCALL	_Delay1000Us
	.line	55, "eeprom.c"; 	for(u8t i=0;i<time;i++)
	BANKSEL	r0x100D
	INCR	r0x100D,F
	LGOTO	_00155_DS_
_00157_DS_:
	.line	59, "eeprom.c"; 	}
	RETURN	
; exit point of _delay_ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
.segment "code"; module=eeprom, function=_delay_us
	.debuginfo subprogram _delay_us
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1001
	.debuginfo variable _time[1]=r0x1000
	.debuginfo variable _i[0]=r0x1002
	.debuginfo variable _i[1]=r0x1003
_delay_us:
; 2 exit points
	.line	45, "eeprom.c"; 	void delay_us(u16t time)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MOVR	STK00,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	47, "eeprom.c"; 	for(u16t i=0;i<time;i++)
	BANKSEL	r0x1002
	CLRR	r0x1002
	BANKSEL	r0x1003
	CLRR	r0x1003
_00137_DS_:
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	BANKSEL	r0x1003
	SUBAR	r0x1003,W
	BTRSS	STATUS,2
	LGOTO	_00148_DS_
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BANKSEL	r0x1002
	SUBAR	r0x1002,W
_00148_DS_:
	BTRSC	STATUS,0
	LGOTO	_00139_DS_
	.line	49, "eeprom.c"; 	NOP();
	nop
	.line	47, "eeprom.c"; 	for(u16t i=0;i<time;i++)
	BANKSEL	r0x1002
	INCR	r0x1002,F
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x1003
	INCR	r0x1003,F
_00002_DS_:
	LGOTO	_00137_DS_
_00139_DS_:
	.line	51, "eeprom.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDA_IN
	.debuginfo subprogram _SDA_IN
_SDA_IN:
; 2 exit points
	.line	37, "eeprom.c"; 	DISI();
	DISI
	.line	38, "eeprom.c"; 	APHCON &= 0xBF;
	IOSTR	_APHCON
	BANKSEL	r0x1000
	MOVAR	r0x1000
	BCR	r0x1000,6
	MOVR	r0x1000,W
	IOST	_APHCON
	.line	39, "eeprom.c"; 	IOSTA |= 0X40;
	IOSTR	_IOSTA
	MOVAR	r0x1000
	BSR	r0x1000,6
	MOVR	r0x1000,W
	IOST	_IOSTA
	.line	40, "eeprom.c"; 	ENI();
	ENI
	.line	41, "eeprom.c"; 	}
	RETURN	
; exit point of _SDA_IN

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
.segment "code"; module=eeprom, function=_SDA_OUT
	.debuginfo subprogram _SDA_OUT
_SDA_OUT:
; 2 exit points
	.line	30, "eeprom.c"; 	DISI();
	DISI
	.line	31, "eeprom.c"; 	APHCON |= 0x40;
	IOSTR	_APHCON
	BANKSEL	r0x1000
	MOVAR	r0x1000
	BSR	r0x1000,6
	MOVR	r0x1000,W
	IOST	_APHCON
	.line	32, "eeprom.c"; 	IOSTA &= 0XBF;
	IOSTR	_IOSTA
	MOVAR	r0x1000
	BCR	r0x1000,6
	MOVR	r0x1000,W
	IOST	_IOSTA
	.line	33, "eeprom.c"; 	ENI();
	ENI
	.line	34, "eeprom.c"; 	}
	RETURN	
; exit point of _SDA_OUT

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=eeprom, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	19, "eeprom.c"; 	NOP();
	nop
	.line	20, "eeprom.c"; 	NOP();
	nop
	.line	21, "eeprom.c"; 	NOP();
	nop
	.line	22, "eeprom.c"; 	NOP();
	nop
	.line	23, "eeprom.c"; 	NOP();
	nop
	.line	24, "eeprom.c"; 	NOP();
	nop
	.line	25, "eeprom.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=eeprom, function=_Delay1000Us
	.debuginfo subprogram _Delay1000Us
;local variable name mapping:
	.debuginfo variable _i[0]=r0x100A
	.debuginfo variable _i[1]=r0x100B
_Delay1000Us:
; 2 exit points
	.line	6, "eeprom.c"; 	for(int i=0;i<100;i++)
	BANKSEL	r0x100A
	CLRR	r0x100A
	BANKSEL	r0x100B
	CLRR	r0x100B
;;signed compare: left < lit (0x64=100), size=2, mask=ffff
_00107_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	MOVIA	0x64
	BANKSEL	r0x100A
	SUBAR	r0x100A,W
_00118_DS_:
	BTRSC	STATUS,0
	LGOTO	_00109_DS_
	.line	8, "eeprom.c"; 	NOP();
	nop
	.line	9, "eeprom.c"; 	NOP();
	nop
	.line	10, "eeprom.c"; 	NOP();
	nop
	.line	11, "eeprom.c"; 	NOP();
	nop
	.line	12, "eeprom.c"; 	NOP();
	nop
	.line	13, "eeprom.c"; 	NOP();
	nop
	.line	6, "eeprom.c"; 	for(int i=0;i<100;i++)
	BANKSEL	r0x100A
	INCR	r0x100A,F
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x100B
	INCR	r0x100B,F
_00003_DS_:
	LGOTO	_00107_DS_
_00109_DS_:
	.line	15, "eeprom.c"; 	}
	RETURN	
; exit point of _Delay1000Us


;	code size estimation:
;	  213+   63 =   276 instructions (  678 byte)

	end
