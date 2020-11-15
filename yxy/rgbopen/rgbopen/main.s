;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_setLow
	extern	_setHight
	extern	_keyCallBack
	extern	_irwork
	extern	_irpros
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_ADMDbits
	extern	_ADRbits
	extern	_ADVREFHbits
	extern	_ADCRbits
	extern	_AWUCONbits
	extern	_PACONbits
	extern	_INTEDGbits
	extern	_ANAENbits
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
	extern	_ADMD
	extern	_ADR
	extern	_ADD
	extern	_ADVREFH
	extern	_ADCR
	extern	_AWUCON
	extern	_PACON
	extern	_INTEDG
	extern	_TMRH
	extern	_ANAEN
	extern	_RFC
	extern	_TM3RH
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
	extern	_TMR2
	extern	_T2CR1
	extern	_T2CR2
	extern	_PWM2DUTY
	extern	_PS2CV
	extern	_BZ2CR
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_BZ3CR
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__gptrget1
	extern	__gptrput1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_sendtoLast
	extern	_sendRGB3
	extern	_sendRGB2
	extern	_sendRGB
	extern	_Delay80us
	extern	_breath3
	extern	_proData
	extern	_GetOneByte
	extern	_proLow
	extern	_proHight
	extern	_cleanData
	extern	_isr
	extern	_main
	extern	_Delay10Us
	extern	_Status
	extern	_Rdata
	extern	_Gdata
	extern	_Bdata
	extern	_Rdata1
	extern	_Gdata1
	extern	_Bdata1
	extern	_intCount
	extern	_IntFlag
	extern	_bitIndex
	extern	_data1
	extern	_data2
	extern	_data3
	extern	_data4
	extern	_irCode
	extern	_irCode2
	extern	_value
	extern	_sleepFlag
	extern	_keyTime
	extern	_lowTime
	extern	_T1Counter
	extern	_accTimeH

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

.segment "uninit", 0x20000040
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
	.res 1
STK04:
	.res 1
STK03:
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
.segment "uninit"
_bitIndex:
	.res	1
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data1:
	.res	1
	.debuginfo gvariable name=_data1,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data2:
	.res	1
	.debuginfo gvariable name=_data2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data3:
	.res	1
	.debuginfo gvariable name=_data3,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_data4:
	.res	1
	.debuginfo gvariable name=_data4,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode:
	.res	1
	.debuginfo gvariable name=_irCode,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_irCode2:
	.res	1
	.debuginfo gvariable name=_irCode2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_value:
	.res	1
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_T1Counter:
	.res	2
	.debuginfo gvariable name=_T1Counter,2byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Rdata:
	dw	0x00
	.debuginfo gvariable name=_Rdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata:
	dw	0x00
	.debuginfo gvariable name=_Gdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata:
	dw	0x00
	.debuginfo gvariable name=_Bdata,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Rdata1:
	dw	0x00
	.debuginfo gvariable name=_Rdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Gdata1:
	dw	0x00
	.debuginfo gvariable name=_Gdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_Bdata1:
	dw	0x00
	.debuginfo gvariable name=_Bdata1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyTime:
	dw	0x00
	.debuginfo gvariable name=_keyTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_lowTime:
	dw	0x00
	.debuginfo gvariable name=_lowTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_accTimeH:
	dw	0x00
	.debuginfo gvariable name=_accTimeH,1byte,array=0,entsize=1,ext=1

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
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	lgoto	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	165, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	167, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	170, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	171, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	172, "main.c"; 	if(intCount == 50)
	MOVR	_intCount,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	174, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	175, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	178, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00110_DS_
	.line	180, "main.c"; 	accTimeH++;		//4.096ms执行一次
	BANKSEL	_accTimeH
	INCR	_accTimeH,F
	.line	181, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00110_DS_:
	.line	185, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	187, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	191, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	193, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _proData
;   _proLow
;   _proHight
;   _proData
;   _proLow
;   _proHight
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	198, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	199, "main.c"; 	APHCON = 0xDB;		//PA5下拉
	MOVIA	0xdb
	IOST	_APHCON
	.line	201, "main.c"; 	IOSTA =  C_PA2_Input | C_PA5_Input;					//PA5输入
	MOVIA	0x24
	IOST	_IOSTA
	.line	202, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	203, "main.c"; 	PORTA = 0x00;  
	CLRR	_PORTA
	.line	204, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	205, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	206, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	208, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	209, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	210, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	211, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	214, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	215, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	216, "main.c"; 	T1CR2 = C_PS1_Div128 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x06
	SFUN	_T1CR2
	.line	217, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	220, "main.c"; 	INT1Level = 1;
	BANKSEL	_Status
	BSR	_Status,5
	.line	223, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	226, "main.c"; 	ENI();
	ENI
_00131_DS_:
	.line	230, "main.c"; 	if(ReadOver)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	232, "main.c"; 	proData();
	LCALL	_proData
_00118_DS_:
	.line	234, "main.c"; 	if(INT1Level && (PORTA & 0x20))
	BANKSEL	_Status
	BTRSS	_Status,5
	LGOTO	_00123_DS_
	BTRSS	_PORTA,5
	LGOTO	_00123_DS_
	.line	236, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	237, "main.c"; 	proLow();
	LCALL	_proLow
	LGOTO	_00124_DS_
_00123_DS_:
	.line	239, "main.c"; 	else if(INT1Level == 0 && (PORTA & 0x20) == 0)
	BANKSEL	_Status
	BTRSC	_Status,5
	LGOTO	_00124_DS_
	BTRSC	_PORTA,5
	LGOTO	_00124_DS_
	.line	242, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	243, "main.c"; 	proHight();
	LCALL	_proHight
_00124_DS_:
	.line	246, "main.c"; 	CLRWDT();
	clrwdt
	.line	247, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	249, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	251, "main.c"; 	if(keyTime > 0)
	BANKSEL	_keyTime
	MOVR	_keyTime,W
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	253, "main.c"; 	--keyTime;
	DECR	_keyTime,F
	LGOTO	_00131_DS_
	.line	256, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendRGB
;   _sendRGB2
;   _sendRGB3
;   _Delay80us
;   _sendRGB
;   _sendRGB2
;   _sendRGB3
;   _Delay80us
;11 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;   STK01
;   r0x101A
;   STK02
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_sendtoLast
	.debuginfo subprogram _sendtoLast
;local variable name mapping:
	.debuginfo variable _colorR=r0x1018
	.debuginfo variable _colorG=r0x1019
	.debuginfo variable _colorB=r0x101A
	.debuginfo variable _index=r0x101B
	.debuginfo variable _i[0]=r0x101B
	.debuginfo variable _i[1]=r0x101F
_sendtoLast:
; 2 exit points
	BANKSEL	_Rdata1
	MOVAR	_Rdata1
	.line	845, "main.c"; 	void sendtoLast(unsigned char colorR,unsigned char colorG,unsigned char colorB,char index)
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	STK00,W
	BANKSEL	_Gdata1
	MOVAR	_Gdata1
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVR	STK01,W
	BANKSEL	_Bdata1
	MOVAR	_Bdata1
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVR	STK02,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
;;101	MOVR	r0x1018,W
;;102	MOVR	r0x1019,W
;;103	MOVR	r0x101A,W
	.line	853, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x101C
	CLRR	r0x101C
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x101C
	INCR	r0x101C,F
_00001_DS_:
	BANKSEL	r0x101D
	CLRR	r0x101D
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	r0x101D
	INCR	r0x101D,F
_00002_DS_:
	BANKSEL	r0x101E
	CLRR	r0x101E
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	r0x101E
	INCR	r0x101E,F
_00003_DS_:
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101F
	CLRR	r0x101F
;;signed compare: left < lit (0x28=40), size=2, mask=ffff
_00979_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	LGOTO	_01002_DS_
	MOVIA	0x28
	BANKSEL	r0x101B
	SUBAR	r0x101B,W
_01002_DS_:
	BTRSC	STATUS,0
	LGOTO	_00977_DS_
	.line	855, "main.c"; 	if(index == 1)
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BTRSC	STATUS,2
	LGOTO	_00975_DS_
	.line	856, "main.c"; 	sendRGB(colorR,colorG,colorB);
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_sendRGB
	LGOTO	_00980_DS_
_00975_DS_:
	.line	857, "main.c"; 	else if(index == 2)
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	LGOTO	_00972_DS_
	.line	858, "main.c"; 	sendRGB2(colorR,colorG,colorB);
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_sendRGB2
	LGOTO	_00980_DS_
_00972_DS_:
	.line	859, "main.c"; 	else if(index == 3)
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	LGOTO	_00980_DS_
	.line	860, "main.c"; 	sendRGB3(colorR,colorG,colorB);
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_sendRGB3
_00980_DS_:
	.line	853, "main.c"; 	for(int i=0;i<LED_N;i++)
	BANKSEL	r0x101B
	INCR	r0x101B,F
	BTRSS	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	r0x101F
	INCR	r0x101F,F
_00004_DS_:
	LGOTO	_00979_DS_
_00977_DS_:
	.line	862, "main.c"; 	Delay80us();
	LCALL	_Delay80us
	.line	863, "main.c"; 	}
	RETURN	
; exit point of _sendtoLast

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB3
	.debuginfo subprogram _sendRGB3
_sendRGB3:
; 2 exit points
	.line	733, "main.c"; 	void sendRGB3(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	741, "main.c"; 	DISI();	
	DISI
	.line	742, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00752_DS_
	.line	743, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00757_DS_
_00752_DS_:
	.line	745, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00757_DS_:
	.line	746, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00761_DS_
	.line	747, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00766_DS_
_00761_DS_:
	.line	749, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00766_DS_:
	.line	750, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00770_DS_
	.line	751, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00775_DS_
_00770_DS_:
	.line	753, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00775_DS_:
	.line	754, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00779_DS_
	.line	755, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00784_DS_
_00779_DS_:
	.line	757, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00784_DS_:
	.line	758, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00788_DS_
	.line	759, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00793_DS_
_00788_DS_:
	.line	761, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00793_DS_:
	.line	762, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00797_DS_
	.line	763, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00802_DS_
_00797_DS_:
	.line	765, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00802_DS_:
	.line	766, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00806_DS_
	.line	767, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00811_DS_
_00806_DS_:
	.line	769, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00811_DS_:
	.line	770, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00815_DS_
	.line	771, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00820_DS_
_00815_DS_:
	.line	773, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00820_DS_:
	.line	775, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00824_DS_
	.line	776, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00829_DS_
_00824_DS_:
	.line	778, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00829_DS_:
	.line	779, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00833_DS_
	.line	780, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00838_DS_
_00833_DS_:
	.line	782, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00838_DS_:
	.line	783, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00842_DS_
	.line	784, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00847_DS_
_00842_DS_:
	.line	786, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00847_DS_:
	.line	787, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00851_DS_
	.line	788, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00856_DS_
_00851_DS_:
	.line	790, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00856_DS_:
	.line	791, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00860_DS_
	.line	792, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00865_DS_
_00860_DS_:
	.line	794, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00865_DS_:
	.line	795, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00869_DS_
	.line	796, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00874_DS_
_00869_DS_:
	.line	798, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00874_DS_:
	.line	799, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00878_DS_
	.line	800, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00883_DS_
_00878_DS_:
	.line	802, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00883_DS_:
	.line	803, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00887_DS_
	.line	804, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00892_DS_
_00887_DS_:
	.line	806, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00892_DS_:
	.line	808, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00896_DS_
	.line	809, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00901_DS_
_00896_DS_:
	.line	811, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00901_DS_:
	.line	812, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00905_DS_
	.line	813, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00910_DS_
_00905_DS_:
	.line	815, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00910_DS_:
	.line	816, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00914_DS_
	.line	817, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00919_DS_
_00914_DS_:
	.line	819, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00919_DS_:
	.line	820, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00923_DS_
	.line	821, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00928_DS_
_00923_DS_:
	.line	823, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00928_DS_:
	.line	824, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00932_DS_
	.line	825, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00937_DS_
_00932_DS_:
	.line	827, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00937_DS_:
	.line	828, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00941_DS_
	.line	829, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00946_DS_
_00941_DS_:
	.line	831, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00946_DS_:
	.line	832, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00950_DS_
	.line	833, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00955_DS_
_00950_DS_:
	.line	835, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00955_DS_:
	.line	836, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00959_DS_
	.line	837, "main.c"; 	NUB31();
	BCR	_PORTA,0
	nop
	BSR	_PORTA,0
	LGOTO	_00964_DS_
_00959_DS_:
	.line	839, "main.c"; 	NUB30();
	BCR	_PORTA,0
	BSR	_PORTA,0
	nop
	nop
	BCR	_PORTA,0
_00964_DS_:
	.line	841, "main.c"; 	PA0 = 0;
	BCR	_PORTA,0
	.line	842, "main.c"; 	ENI();	
	ENI
	.line	843, "main.c"; 	}
	RETURN	
; exit point of _sendRGB3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB2
	.debuginfo subprogram _sendRGB2
_sendRGB2:
; 2 exit points
	.line	620, "main.c"; 	void sendRGB2(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	628, "main.c"; 	DISI();	
	DISI
	.line	629, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00532_DS_
	.line	630, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00537_DS_
_00532_DS_:
	.line	632, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00537_DS_:
	.line	633, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00541_DS_
	.line	634, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00546_DS_
_00541_DS_:
	.line	636, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00546_DS_:
	.line	637, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00550_DS_
	.line	638, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00555_DS_
_00550_DS_:
	.line	640, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00555_DS_:
	.line	641, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00559_DS_
	.line	642, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00564_DS_
_00559_DS_:
	.line	644, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00564_DS_:
	.line	645, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00568_DS_
	.line	646, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00573_DS_
_00568_DS_:
	.line	648, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00573_DS_:
	.line	649, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00577_DS_
	.line	650, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00582_DS_
_00577_DS_:
	.line	652, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00582_DS_:
	.line	653, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00586_DS_
	.line	654, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00591_DS_
_00586_DS_:
	.line	656, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00591_DS_:
	.line	657, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00595_DS_
	.line	658, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00600_DS_
_00595_DS_:
	.line	660, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00600_DS_:
	.line	662, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00604_DS_
	.line	663, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00609_DS_
_00604_DS_:
	.line	665, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00609_DS_:
	.line	666, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00613_DS_
	.line	667, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00618_DS_
_00613_DS_:
	.line	669, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00618_DS_:
	.line	670, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00622_DS_
	.line	671, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00627_DS_
_00622_DS_:
	.line	673, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00627_DS_:
	.line	674, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00631_DS_
	.line	675, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00636_DS_
_00631_DS_:
	.line	677, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00636_DS_:
	.line	678, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00640_DS_
	.line	679, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00645_DS_
_00640_DS_:
	.line	681, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00645_DS_:
	.line	682, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00649_DS_
	.line	683, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00654_DS_
_00649_DS_:
	.line	685, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00654_DS_:
	.line	686, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00658_DS_
	.line	687, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00663_DS_
_00658_DS_:
	.line	689, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00663_DS_:
	.line	690, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00667_DS_
	.line	691, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00672_DS_
_00667_DS_:
	.line	693, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00672_DS_:
	.line	695, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00676_DS_
	.line	696, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00681_DS_
_00676_DS_:
	.line	698, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00681_DS_:
	.line	699, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00685_DS_
	.line	700, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00690_DS_
_00685_DS_:
	.line	702, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00690_DS_:
	.line	703, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00694_DS_
	.line	704, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00699_DS_
_00694_DS_:
	.line	706, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00699_DS_:
	.line	707, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00703_DS_
	.line	708, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00708_DS_
_00703_DS_:
	.line	710, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00708_DS_:
	.line	711, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00712_DS_
	.line	712, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00717_DS_
_00712_DS_:
	.line	714, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00717_DS_:
	.line	715, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00721_DS_
	.line	716, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00726_DS_
_00721_DS_:
	.line	718, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00726_DS_:
	.line	719, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00730_DS_
	.line	720, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00735_DS_
_00730_DS_:
	.line	722, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00735_DS_:
	.line	723, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00739_DS_
	.line	724, "main.c"; 	NUB21();
	BCR	_PORTA,7
	nop
	BSR	_PORTA,7
	LGOTO	_00744_DS_
_00739_DS_:
	.line	726, "main.c"; 	NUB20();
	BCR	_PORTA,7
	BSR	_PORTA,7
	nop
	nop
	BCR	_PORTA,7
_00744_DS_:
	.line	728, "main.c"; 	PA7 = 0;
	BCR	_PORTA,7
	.line	729, "main.c"; 	ENI();	
	ENI
	.line	730, "main.c"; 	}
	RETURN	
; exit point of _sendRGB2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_sendRGB
	.debuginfo subprogram _sendRGB
_sendRGB:
; 2 exit points
	.line	508, "main.c"; 	void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
	BANKSEL	_Rdata
	MOVAR	_Rdata
	MOVR	STK00,W
	BANKSEL	_Gdata
	MOVAR	_Gdata
	MOVR	STK01,W
	BANKSEL	_Bdata
	MOVAR	_Bdata
	.line	516, "main.c"; 	DISI();	
	DISI
	.line	517, "main.c"; 	if(R7)
	BANKSEL	_Rdata
	BTRSS	_Rdata,7
	LGOTO	_00312_DS_
	.line	518, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00317_DS_
_00312_DS_:
	.line	520, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00317_DS_:
	.line	521, "main.c"; 	if(R6)
	BANKSEL	_Rdata
	BTRSS	_Rdata,6
	LGOTO	_00321_DS_
	.line	522, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00326_DS_
_00321_DS_:
	.line	524, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00326_DS_:
	.line	525, "main.c"; 	if(R5)
	BANKSEL	_Rdata
	BTRSS	_Rdata,5
	LGOTO	_00330_DS_
	.line	526, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00335_DS_
_00330_DS_:
	.line	528, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00335_DS_:
	.line	529, "main.c"; 	if(R4)
	BANKSEL	_Rdata
	BTRSS	_Rdata,4
	LGOTO	_00339_DS_
	.line	530, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00344_DS_
_00339_DS_:
	.line	532, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00344_DS_:
	.line	533, "main.c"; 	if(R3)
	BANKSEL	_Rdata
	BTRSS	_Rdata,3
	LGOTO	_00348_DS_
	.line	534, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00353_DS_
_00348_DS_:
	.line	536, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00353_DS_:
	.line	537, "main.c"; 	if(R2)
	BANKSEL	_Rdata
	BTRSS	_Rdata,2
	LGOTO	_00357_DS_
	.line	538, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00362_DS_
_00357_DS_:
	.line	540, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00362_DS_:
	.line	541, "main.c"; 	if(R1)
	BANKSEL	_Rdata
	BTRSS	_Rdata,1
	LGOTO	_00366_DS_
	.line	542, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00371_DS_
_00366_DS_:
	.line	544, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00371_DS_:
	.line	545, "main.c"; 	if(R0)
	BANKSEL	_Rdata
	BTRSS	_Rdata,0
	LGOTO	_00375_DS_
	.line	546, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00380_DS_
_00375_DS_:
	.line	548, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00380_DS_:
	.line	550, "main.c"; 	if(G7)
	BANKSEL	_Gdata
	BTRSS	_Gdata,7
	LGOTO	_00384_DS_
	.line	551, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00389_DS_
_00384_DS_:
	.line	553, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00389_DS_:
	.line	554, "main.c"; 	if(G6)
	BANKSEL	_Gdata
	BTRSS	_Gdata,6
	LGOTO	_00393_DS_
	.line	555, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00398_DS_
_00393_DS_:
	.line	557, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00398_DS_:
	.line	558, "main.c"; 	if(G5)
	BANKSEL	_Gdata
	BTRSS	_Gdata,5
	LGOTO	_00402_DS_
	.line	559, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00407_DS_
_00402_DS_:
	.line	561, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00407_DS_:
	.line	562, "main.c"; 	if(G4)
	BANKSEL	_Gdata
	BTRSS	_Gdata,4
	LGOTO	_00411_DS_
	.line	563, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00416_DS_
_00411_DS_:
	.line	565, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00416_DS_:
	.line	566, "main.c"; 	if(G3)
	BANKSEL	_Gdata
	BTRSS	_Gdata,3
	LGOTO	_00420_DS_
	.line	567, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00425_DS_
_00420_DS_:
	.line	569, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00425_DS_:
	.line	570, "main.c"; 	if(G2)
	BANKSEL	_Gdata
	BTRSS	_Gdata,2
	LGOTO	_00429_DS_
	.line	571, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00434_DS_
_00429_DS_:
	.line	573, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00434_DS_:
	.line	574, "main.c"; 	if(G1)
	BANKSEL	_Gdata
	BTRSS	_Gdata,1
	LGOTO	_00438_DS_
	.line	575, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00443_DS_
_00438_DS_:
	.line	577, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00443_DS_:
	.line	578, "main.c"; 	if(G0)
	BANKSEL	_Gdata
	BTRSS	_Gdata,0
	LGOTO	_00447_DS_
	.line	579, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00452_DS_
_00447_DS_:
	.line	581, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00452_DS_:
	.line	583, "main.c"; 	if(B7)
	BANKSEL	_Bdata
	BTRSS	_Bdata,7
	LGOTO	_00456_DS_
	.line	584, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00461_DS_
_00456_DS_:
	.line	586, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00461_DS_:
	.line	587, "main.c"; 	if(B6)
	BANKSEL	_Bdata
	BTRSS	_Bdata,6
	LGOTO	_00465_DS_
	.line	588, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00470_DS_
_00465_DS_:
	.line	590, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00470_DS_:
	.line	591, "main.c"; 	if(B5)
	BANKSEL	_Bdata
	BTRSS	_Bdata,5
	LGOTO	_00474_DS_
	.line	592, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00479_DS_
_00474_DS_:
	.line	594, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00479_DS_:
	.line	595, "main.c"; 	if(B4)
	BANKSEL	_Bdata
	BTRSS	_Bdata,4
	LGOTO	_00483_DS_
	.line	596, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00488_DS_
_00483_DS_:
	.line	598, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00488_DS_:
	.line	599, "main.c"; 	if(B3)
	BANKSEL	_Bdata
	BTRSS	_Bdata,3
	LGOTO	_00492_DS_
	.line	600, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00497_DS_
_00492_DS_:
	.line	602, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00497_DS_:
	.line	603, "main.c"; 	if(B2)
	BANKSEL	_Bdata
	BTRSS	_Bdata,2
	LGOTO	_00501_DS_
	.line	604, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00506_DS_
_00501_DS_:
	.line	606, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00506_DS_:
	.line	607, "main.c"; 	if(B1)
	BANKSEL	_Bdata
	BTRSS	_Bdata,1
	LGOTO	_00510_DS_
	.line	608, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00515_DS_
_00510_DS_:
	.line	610, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00515_DS_:
	.line	611, "main.c"; 	if(B0)
	BANKSEL	_Bdata
	BTRSS	_Bdata,0
	LGOTO	_00519_DS_
	.line	612, "main.c"; 	NUB1();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	nop
	BANKSEL	_PORTB
	BSR	_PORTB,3
	LGOTO	_00524_DS_
_00519_DS_:
	.line	614, "main.c"; 	NUB0();
	BANKSEL	_PORTB
	BCR	_PORTB,3
	BSR	_PORTB,3
	nop
	nop
	BANKSEL	_PORTB
	BCR	_PORTB,3
_00524_DS_:
	.line	616, "main.c"; 	PB3 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,3
	.line	617, "main.c"; 	ENI();	
	ENI
	.line	618, "main.c"; 	}
	RETURN	
; exit point of _sendRGB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Delay10Us
	.debuginfo subprogram _Delay10Us
_Delay10Us:
; 2 exit points
	.line	499, "main.c"; 	NOP();
	nop
	.line	500, "main.c"; 	NOP();
	nop
	.line	501, "main.c"; 	NOP();
	nop
	.line	502, "main.c"; 	NOP();
	nop
	.line	503, "main.c"; 	NOP();
	nop
	.line	504, "main.c"; 	NOP();
	nop
	.line	505, "main.c"; 	}
	RETURN	
; exit point of _Delay10Us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_Delay80us
	.debuginfo subprogram _Delay80us
;local variable name mapping:
	.debuginfo variable _i=r0x1017
_Delay80us:
; 2 exit points
	.line	491, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1017
	CLRR	r0x1017
;;unsigned compare: left < lit (0x32=50), size=1
_00298_DS_:
	MOVIA	0x32
	BANKSEL	r0x1017
	SUBAR	r0x1017,W
	BTRSC	STATUS,0
	LGOTO	_00300_DS_
	.line	493, "main.c"; 	NOP();
	nop
	.line	491, "main.c"; 	for(unsigned char i=0;i<50;i++)
	BANKSEL	r0x1017
	INCR	r0x1017,F
	LGOTO	_00298_DS_
_00300_DS_:
	.line	495, "main.c"; 	}
	RETURN	
; exit point of _Delay80us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _sendtoLast
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _sendtoLast
;20 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK01
;   r0x1022
;   STK02
;   r0x1023
;   STK03
;   r0x1024
;   STK04
;   r0x1025
;   STK05
;   r0x1026
;   STK06
;   r0x1027
;   STK07
;   r0x1028
;   STK08
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_breath3
	.debuginfo subprogram _breath3
;local variable name mapping:
	.debuginfo variable _data[0]=r0x1022
	.debuginfo variable _data[1]=r0x1021
	.debuginfo variable _data[2]=r0x1020
	.debuginfo variable _data2[0]=r0x1025
	.debuginfo variable _data2[1]=r0x1024
	.debuginfo variable _data2[2]=r0x1023
	.debuginfo variable _data3[0]=r0x1028
	.debuginfo variable _data3[1]=r0x1027
	.debuginfo variable _data3[2]=r0x1026
	.debuginfo variable _index=r0x1029
_breath3:
; 2 exit points
	.line	468, "main.c"; 	void breath3(unsigned char *data,unsigned char *data2,unsigned char *data3,char index)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK01,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	STK02,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK03,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK04,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK05,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK06,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK07,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	STK08,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	470, "main.c"; 	if((*data3) > 10)
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	LCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00287_DS_
	.line	472, "main.c"; 	--(*data3);
	DECR	r0x102A,F
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	LCALL	__gptrput1
_00287_DS_:
	.line	475, "main.c"; 	if((*data2) > 10)
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	LCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00289_DS_
	.line	477, "main.c"; 	--(*data2);
	DECR	r0x102A,F
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	LCALL	__gptrput1
_00289_DS_:
	.line	480, "main.c"; 	if((*data) > 10)
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	LCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	LGOTO	_00291_DS_
	.line	482, "main.c"; 	--(*data);
	DECR	r0x102A,F
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	LCALL	__gptrput1
_00291_DS_:
	.line	484, "main.c"; 	sendtoLast(*data,*data2,*data3,index);
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	LCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	LCALL	__gptrget1
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	LCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK00
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	LCALL	_sendtoLast
	.line	485, "main.c"; 	}
	RETURN	
; exit point of _breath3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _breath3
;   _breath3
;   _breath3
;   _sendtoLast
;   _sendtoLast
;   _sendtoLast
;   _breath3
;   _breath3
;   _breath3
;18 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   STK08
;   STK07
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting pCode block
.segment "code"; module=main, function=_proData
	.debuginfo subprogram _proData
_proData:
; 2 exit points
	.line	429, "main.c"; 	irCode = (u8t)(~data4);
	BANKSEL	_data4
	COMR	_data4,W
	BANKSEL	_irCode
	MOVAR	_irCode
	.line	430, "main.c"; 	if(irCode == data3 && keyTime == 0)
	BANKSEL	_data3
	XORAR	_data3,W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	BANKSEL	_keyTime
	MOVR	_keyTime,W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	.line	432, "main.c"; 	keyTime = 30;
	MOVIA	0x1e
	MOVAR	_keyTime
	.line	433, "main.c"; 	switch(irCode)
	BANKSEL	_irCode
	MOVR	_irCode,W
	XORIA	0x45
	BTRSC	STATUS,2
	LGOTO	_00260_DS_
	MOVR	_irCode,W
	XORIA	0x46
	BTRSC	STATUS,2
	LGOTO	_00261_DS_
	LGOTO	_00264_DS_
_00260_DS_:
	.line	436, "main.c"; 	sendtoLast(COLOR3,1);
	MOVIA	0x01
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	437, "main.c"; 	sendtoLast(COLOR3,2);
	MOVIA	0x02
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	438, "main.c"; 	sendtoLast(COLOR3,3);
	MOVIA	0x03
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVIA	0xff
	MOVAR	STK00
	LCALL	_sendtoLast
	.line	439, "main.c"; 	break;
	LGOTO	_00264_DS_
_00261_DS_:
	.line	441, "main.c"; 	breath3(&Rdata1,&Gdata1,&Bdata1,1);
	MOVIA	((_Rdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	(_Rdata1 + 0)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	((_Gdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	(_Gdata1 + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
	MOVIA	((_Bdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVIA	(_Bdata1 + 0)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BANKSEL	r0x1033
	CLRR	r0x1033
	MOVIA	0x01
	MOVAR	STK08
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK07
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK04
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_breath3
	.line	442, "main.c"; 	breath3(&Rdata1,&Gdata1,&Bdata1,2);
	MOVIA	((_Rdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	(_Rdata1 + 0)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	((_Gdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	(_Gdata1 + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
	MOVIA	((_Bdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVIA	(_Bdata1 + 0)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BANKSEL	r0x1033
	CLRR	r0x1033
	MOVIA	0x02
	MOVAR	STK08
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK07
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK04
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_breath3
	.line	443, "main.c"; 	breath3(&Rdata1,&Gdata1,&Bdata1,3);
	MOVIA	((_Rdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	(_Rdata1 + 0)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	((_Gdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVIA	(_Gdata1 + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
	MOVIA	((_Bdata1 + 0) >> 8) & 0xff
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVIA	(_Bdata1 + 0)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BANKSEL	r0x1033
	CLRR	r0x1033
	MOVIA	0x03
	MOVAR	STK08
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	MOVAR	STK07
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	MOVAR	STK06
	MOVIA	0x00
	MOVAR	STK05
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK04
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_breath3
_00264_DS_:
	.line	462, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	463, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x1034
_GetOneByte:
; 2 exit points
	.line	383, "main.c"; 	void GetOneByte(u8t bitNub)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	385, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00255_DS_
	.line	387, "main.c"; 	if(bitIndex == 0)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00239_DS_
	.line	389, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	390, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	391, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	BANKSEL	_data4
	CLRR	_data4
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00239_DS_:
	.line	393, "main.c"; 	++bitIndex;
	BANKSEL	_bitIndex
	INCR	_bitIndex,F
	.line	394, "main.c"; 	if(bitNub)
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,2
	LGOTO	_00005_DS_
	.line	396, "main.c"; 	value |= 0x80;
	BANKSEL	_value
	BSR	_value,7
_00005_DS_:
	.line	399, "main.c"; 	if(bitIndex == 8)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00251_DS_
	.line	401, "main.c"; 	data1 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data1
	MOVAR	_data1
	LGOTO	_00252_DS_
_00251_DS_:
	.line	403, "main.c"; 	else if(bitIndex == 16)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00248_DS_
	.line	405, "main.c"; 	data2 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data2
	MOVAR	_data2
	LGOTO	_00252_DS_
_00248_DS_:
	.line	408, "main.c"; 	else if(bitIndex == 24)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00245_DS_
	.line	410, "main.c"; 	data3 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data3
	MOVAR	_data3
	LGOTO	_00252_DS_
_00245_DS_:
	.line	413, "main.c"; 	else if(bitIndex == 32)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	LGOTO	_00252_DS_
	.line	415, "main.c"; 	data4 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data4
	MOVAR	_data4
	.line	416, "main.c"; 	ReadOver = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	417, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	418, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	419, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	420, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
;;shiftRight_Left2ResultLit:5589: shCount=1, size=1, sign=0, same=1, offr=0
_00252_DS_:
	.line	423, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	BANKSEL	_value
	RRR	_value,F
_00255_DS_:
	.line	425, "main.c"; 	}
	RETURN	
; exit point of _GetOneByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _cleanData
;   _cleanData
;4 compiler assigned registers:
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_proLow
	.debuginfo subprogram _proLow
_proLow:
; 2 exit points
	.line	339, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	340, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	341, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	342, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1035
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1037
	CLRR	r0x1037
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	SUBIA	0xff
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00006_DS_
	BANKSEL	r0x1037
	INCR	r0x1037,W
_00006_DS_:
	SUBIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
;;1	MOVAR	r0x1038
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	BTRSC	STATUS,0
	INCR	r0x1037,W
	BTRSC	STATUS,2
	LGOTO	_00007_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00007_DS_:
	.line	343, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	344, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	345, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	MOVIA	0x03
	SFUN	_T1CR1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1FD=509), size=2
	.line	346, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00230_DS_
	MOVIA	0xfd
	SUBAR	_T1Counter,W
_00230_DS_:
	BTRSS	STATUS,0
	LGOTO	_00210_DS_
;;unsigned compare: left < lit (0x28C=652), size=2
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00231_DS_
	MOVIA	0x8c
	SUBAR	_T1Counter,W
_00231_DS_:
	BTRSC	STATUS,0
	LGOTO	_00210_DS_
	.line	348, "main.c"; 	RemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,3
	.line	349, "main.c"; 	MaybeRemoteStart = 1;		//疑似遥控数据头
	BSR	_Status,2
	.line	350, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	351, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	352, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	353, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	354, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	354, "main.c"; 	}
	LGOTO	_00213_DS_
_00210_DS_:
	.line	356, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00213_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x19=25), size=2
	.line	367, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	MOVIA	0x19
	SUBAR	_T1Counter,W
_00232_DS_:
	BTRSS	STATUS,0
	LGOTO	_00204_DS_
;;unsigned compare: left < lit (0x30=48), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	MOVIA	0x30
	SUBAR	_T1Counter,W
_00233_DS_:
	BTRSC	STATUS,0
	LGOTO	_00204_DS_
	.line	370, "main.c"; 	NOP();
	nop
	LGOTO	_00213_DS_
_00204_DS_:
	.line	375, "main.c"; 	cleanData();
	LCALL	_cleanData
_00213_DS_:
	.line	380, "main.c"; 	}
	RETURN	
; exit point of _proLow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;   _GetOneByte
;4 compiler assigned registers:
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	272, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	273, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	274, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	275, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1039
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BANKSEL	r0x103B
	CLRR	r0x103B
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	SUBIA	0xff
	BANKSEL	r0x1039
	MOVAR	r0x1039
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00008_DS_
	BANKSEL	r0x103B
	INCR	r0x103B,W
_00008_DS_:
	SUBIA	0x00
	BANKSEL	r0x103B
	MOVAR	r0x103B
;;1	MOVAR	r0x103C
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	BTRSC	STATUS,0
	INCR	r0x103B,W
	BTRSC	STATUS,2
	LGOTO	_00009_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00009_DS_:
	.line	276, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	277, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	278, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	279, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	280, "main.c"; 	if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00157_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xCD=205), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00193_DS_
	MOVIA	0xcd
	SUBAR	_T1Counter,W
_00193_DS_:
	BTRSS	STATUS,0
	LGOTO	_00157_DS_
;;unsigned compare: left < lit (0x15C=348), size=2
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00194_DS_
	MOVIA	0x5c
	SUBAR	_T1Counter,W
_00194_DS_:
	BTRSC	STATUS,0
	LGOTO	_00157_DS_
	.line	282, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	283, "main.c"; 	RemoteStart = 1;
	BSR	_Status,3
	.line	284, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	285, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	286, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	287, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	288, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	LGOTO	_00161_DS_
_00157_DS_:
	.line	290, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00154_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5B=91), size=2
	.line	292, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00195_DS_
	MOVIA	0x5b
	SUBAR	_T1Counter,W
_00195_DS_:
	BTRSS	STATUS,0
	LGOTO	_00145_DS_
;;unsigned compare: left < lit (0x72=114), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	MOVIA	0x72
	SUBAR	_T1Counter,W
_00196_DS_:
	BTRSC	STATUS,0
	LGOTO	_00145_DS_
	.line	294, "main.c"; 	OneCode = 1;
	BANKSEL	_Status
	BSR	_Status,1
	.line	295, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	LGOTO	_00146_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1A=26), size=2
_00145_DS_:
	.line	299, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00197_DS_
	MOVIA	0x1a
	SUBAR	_T1Counter,W
_00197_DS_:
	BTRSS	STATUS,0
	LGOTO	_00141_DS_
;;unsigned compare: left < lit (0x31=49), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00198_DS_
	MOVIA	0x31
	SUBAR	_T1Counter,W
_00198_DS_:
	BTRSC	STATUS,0
	LGOTO	_00141_DS_
	.line	301, "main.c"; 	ZeroCode = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	302, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	LGOTO	_00146_DS_
_00141_DS_:
	.line	306, "main.c"; 	ZeroCode = 0;
	BANKSEL	_Status
	BCR	_Status,0
	.line	307, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00146_DS_:
	.line	311, "main.c"; 	if(OneCode)
	BANKSEL	_Status
	BTRSS	_Status,1
	LGOTO	_00151_DS_
	.line	314, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	LCALL	_GetOneByte
	LGOTO	_00161_DS_
_00151_DS_:
	.line	316, "main.c"; 	else if(ZeroCode)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00161_DS_
	.line	319, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	LCALL	_GetOneByte
	LGOTO	_00161_DS_
_00154_DS_:
	.line	324, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	325, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	326, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	327, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	328, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	329, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	330, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
_00161_DS_:
	.line	335, "main.c"; 	}
	RETURN	
; exit point of _proHight

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_cleanData
	.debuginfo subprogram _cleanData
_cleanData:
; 2 exit points
	.line	261, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	262, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	263, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	264, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	265, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	266, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	267, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	268, "main.c"; 	}
	RETURN	
; exit point of _cleanData


;	code size estimation:
;	 1304+  416 =  1720 instructions ( 4272 byte)

	end
