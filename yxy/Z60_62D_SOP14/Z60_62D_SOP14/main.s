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
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_keyCtr
	extern	_initSys
	extern	_workStop
	extern	_fanzhuan
	extern	_zhengzhuan
	extern	_pwm3Stop
	extern	_pwm3Init
	extern	_pwm2Stop
	extern	_pwm1Stop
	extern	_workCtr
	extern	_ledOff
	extern	_ledOn
	extern	_isr
	extern	_main
	extern	_pwm1Init
	extern	_pwm2Init
	extern	_keyRead
	extern	_Status
	extern	_workStartFlag
	extern	_keyNub
	extern	_keyCount
	extern	_intCount
	extern	_workStep
	extern	_powerStep
	extern	_workTime
	extern	_delayTime
	extern	_resetworkTime
	extern	_resetdelayTime
	extern	_sleepTime
	extern	_count1s
	extern	_ledCount
	extern	_lastTime
	extern	_zfTime

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x101A:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStartFlag:
	dw	0x00
	.debuginfo gvariable name=_workStartFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_powerStep:
	dw	0x00
	.debuginfo gvariable name=_powerStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workTime:
	dw	0x00
	.debuginfo gvariable name=_workTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_delayTime:
	dw	0x00
	.debuginfo gvariable name=_delayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_resetworkTime:
	dw	0x00
	.debuginfo gvariable name=_resetworkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_resetdelayTime:
	dw	0x00
	.debuginfo gvariable name=_resetdelayTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lastTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lastTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_zfTime:
	dw	0x00
	.debuginfo gvariable name=_zfTime,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	.line	45, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	47, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	49, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	51, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	53, "main.c"; 	IntFlag = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	54, "main.c"; 	intCount = 0;
	BANKSEL	_intCount
	CLRR	_intCount
_00108_DS_:
	.line	61, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	63, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	66, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	68, "main.c"; 	}
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
;   _initSys
;   _ledOn
;   _keyCtr
;   _workStop
;   _ledOff
;   _workCtr
;   _ledOff
;   _pwm1Stop
;   _pwm2Stop
;   _pwm3Stop
;   _ledOn
;   _workStop
;   _ledOff
;   _gotoSleep
;   _initSys
;   _ledOn
;   _keyCtr
;   _workStop
;   _ledOff
;   _workCtr
;   _ledOff
;   _pwm1Stop
;   _pwm2Stop
;   _pwm3Stop
;   _ledOn
;   _workStop
;   _ledOff
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	74, "main.c"; 	initSys();						
	LCALL	_initSys
	.line	75, "main.c"; 	ledOn();
	LCALL	_ledOn
_00134_DS_:
	.line	78, "main.c"; 	CLRWDT();
	clrwdt
	.line	79, "main.c"; 	if(!IntFlag)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00134_DS_
	.line	81, "main.c"; 	IntFlag = 0;
	BCR	_Status,0
	.line	82, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	84, "main.c"; 	if(++count1s > 99)
	BANKSEL	_count1s
	INCR	_count1s,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00122_DS_
	.line	86, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	87, "main.c"; 	if(lastTime > 0)
	BANKSEL	_lastTime
	MOVR	_lastTime,W
	IORAR	(_lastTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00122_DS_
	.line	89, "main.c"; 	--lastTime;
	MOVIA	0xff
	ADDAR	_lastTime,F
	BTRSS	STATUS,0
	DECR	(_lastTime + 1),F
	.line	90, "main.c"; 	if(lastTime == 0)
	MOVR	_lastTime,W
	IORAR	(_lastTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
	.line	92, "main.c"; 	workStop();
	LCALL	_workStop
	.line	93, "main.c"; 	ledOff();
	LCALL	_ledOff
_00122_DS_:
	.line	98, "main.c"; 	if(powerFlag)
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00131_DS_
	.line	100, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	101, "main.c"; 	if(ledCount > 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BTRSC	STATUS,2
	LGOTO	_00124_DS_
	.line	103, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	104, "main.c"; 	ledCount--;
	BANKSEL	_ledCount
	DECR	_ledCount,F
	.line	105, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	106, "main.c"; 	pwm2Stop();
	LCALL	_pwm2Stop
	.line	107, "main.c"; 	pwm3Stop();
	LCALL	_pwm3Stop
	.line	108, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	109, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	LGOTO	_00134_DS_
_00124_DS_:
	.line	112, "main.c"; 	ledOn();
	LCALL	_ledOn
	LGOTO	_00134_DS_
_00131_DS_:
	.line	116, "main.c"; 	workStop();
	LCALL	_workStop
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x60=96), size=1
	.line	117, "main.c"; 	if(count1s > 95)
	MOVIA	0x60
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	.line	118, "main.c"; 	ledOff();
	LCALL	_ledOff
	.line	119, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSS	STATUS,0
	LGOTO	_00134_DS_
	.line	121, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00134_DS_
	.line	125, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _workStop
;   _workStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	446, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	448, "main.c"; 	workStop();
	LCALL	_workStop
	.line	449, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	450, "main.c"; 	AWUCON = 0x40;
	MOVIA	0x40
	MOVAR	_AWUCON
	.line	451, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	452, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	453, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	454, "main.c"; 	CLRWDT();
	clrwdt
	.line	455, "main.c"; 	ENI();
	ENI
	.line	456, "main.c"; 	SLEEP();
	sleep
	.line	457, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	458, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	459, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	461, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	463, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1013,enc=unsigned
_keyCtr:
; 2 exit points
	.line	378, "main.c"; 	char kclick = keyRead(0xD0 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVIA	0xd0
	ANDAR	r0x1013,F
	MOVR	r0x1013,W
	LCALL	_keyRead
	BANKSEL	r0x1013
	MOVAR	r0x1013
	.line	379, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00289_DS_
	.line	381, "main.c"; 	if((keyNub & 0x40) && powerFlag)
	BANKSEL	_keyNub
	BTRSS	_keyNub,6
	LGOTO	_00279_DS_
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00279_DS_
	.line	384, "main.c"; 	ledCount = 50;
	MOVIA	0x32
	BANKSEL	_ledCount
	MOVAR	_ledCount
	.line	385, "main.c"; 	if(++workStep > 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00253_DS_
	.line	386, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00253_DS_:
	.line	387, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00263_DS_
	.line	389, "main.c"; 	resetworkTime   = 120;
	MOVIA	0x78
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	390, "main.c"; 	resetdelayTime	= 30;
	MOVIA	0x1e
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	LGOTO	_00291_DS_
_00263_DS_:
	.line	392, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00260_DS_
	.line	394, "main.c"; 	resetworkTime   = 80;
	MOVIA	0x50
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	395, "main.c"; 	resetdelayTime	= 10;
	MOVIA	0x0a
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	LGOTO	_00291_DS_
_00260_DS_:
	.line	397, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00257_DS_
	.line	399, "main.c"; 	resetworkTime   = 40;
	MOVIA	0x28
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	400, "main.c"; 	resetdelayTime	= 10;
	MOVIA	0x0a
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	LGOTO	_00291_DS_
_00257_DS_:
	.line	402, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00291_DS_
	.line	404, "main.c"; 	resetworkTime   = 60;
	MOVIA	0x3c
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	405, "main.c"; 	resetdelayTime	= 20;
	MOVIA	0x14
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
	LGOTO	_00291_DS_
_00279_DS_:
	.line	408, "main.c"; 	else if((keyNub & 0x10) && powerFlag && workStep > 0)
	BANKSEL	_keyNub
	BTRSS	_keyNub,4
	LGOTO	_00274_DS_
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00274_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00274_DS_
	.line	411, "main.c"; 	if(++powerStep > 3)
	BANKSEL	_powerStep
	INCR	_powerStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_powerStep,W
	BTRSS	STATUS,0
	LGOTO	_00291_DS_
	.line	413, "main.c"; 	powerStep = 3;
	MOVIA	0x03
	MOVAR	_powerStep
	LGOTO	_00291_DS_
_00274_DS_:
	.line	416, "main.c"; 	else if((keyNub & 0x80) && powerFlag && workStep > 0)
	BANKSEL	_keyNub
	BTRSS	_keyNub,7
	LGOTO	_00291_DS_
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00291_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00291_DS_
	.line	419, "main.c"; 	if(--powerStep < 1)
	BANKSEL	_powerStep
	DECR	_powerStep,F
;;unsigned compare: left < lit (0x1=1), size=1
	MOVIA	0x01
	SUBAR	_powerStep,W
	BTRSC	STATUS,0
	LGOTO	_00291_DS_
	.line	420, "main.c"; 	powerStep = 1;
	MOVIA	0x01
	MOVAR	_powerStep
	LGOTO	_00291_DS_
_00289_DS_:
	.line	423, "main.c"; 	else if(kclick == 2)
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00291_DS_
	.line	425, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	426, "main.c"; 	if(keyNub & 0x40)
	BANKSEL	_keyNub
	BTRSS	_keyNub,6
	LGOTO	_00283_DS_
	.line	429, "main.c"; 	powerFlag = !powerFlag;
	MOVIA	0x04
	BANKSEL	_Status
	XORAR	_Status,F
_00283_DS_:
	.line	431, "main.c"; 	if(powerFlag)
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00291_DS_
	.line	433, "main.c"; 	lastTime = 900;
	MOVIA	0x84
	BANKSEL	_lastTime
	MOVAR	_lastTime
	MOVIA	0x03
	MOVAR	(_lastTime + 1)
	.line	434, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	435, "main.c"; 	powerStep = 1;
	BANKSEL	_powerStep
	MOVAR	_powerStep
	.line	436, "main.c"; 	resetworkTime   = 120;
	MOVIA	0x78
	BANKSEL	_resetworkTime
	MOVAR	_resetworkTime
	.line	437, "main.c"; 	resetdelayTime	= 30;
	MOVIA	0x1e
	BANKSEL	_resetdelayTime
	MOVAR	_resetdelayTime
_00291_DS_:
	.line	440, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1012,enc=unsigned
_keyRead:
; 2 exit points
	.line	340, "main.c"; 	char keyRead(char keyStatus)	
	BANKSEL	r0x1012
	MOVAR	r0x1012
	.line	342, "main.c"; 	if(keyStatus)
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00245_DS_
	.line	344, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	345, "main.c"; 	keyNub = keyStatus;
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
;;unsigned compare: left < lit (0x64=100), size=1
	.line	346, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00246_DS_
	.line	348, "main.c"; 	keyCount = 100;
	MOVIA	0x64
	MOVAR	_keyCount
	.line	349, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,1
	LGOTO	_00246_DS_
	.line	351, "main.c"; 	longPressFlag = 1;
	BSR	_Status,1
	.line	352, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00247_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00245_DS_:
	.line	358, "main.c"; 	if(keyCount >= 100)
	MOVIA	0x64
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
	.line	360, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	361, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	362, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00247_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00242_DS_:
	.line	364, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00243_DS_
	.line	366, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	367, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00247_DS_
_00243_DS_:
	.line	369, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00246_DS_:
	.line	371, "main.c"; 	return 0;
	MOVIA	0x00
_00247_DS_:
	.line	372, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_initSys
	.debuginfo subprogram _initSys
_initSys:
; 2 exit points
	.line	312, "main.c"; 	DISI();
	DISI
	.line	313, "main.c"; 	IOSTA = C_PA7_Input | C_PA5_Input | C_PA4_Input | C_PA6_Input;
	MOVIA	0xf0
	IOST	_IOSTA
	.line	314, "main.c"; 	IOSTB = C_PB1_Input | C_PB0_Input;
	MOVIA	0x03
	IOST	_IOSTB
	.line	315, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	316, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	317, "main.c"; 	APHCON = 0x2F;
	MOVIA	0x2f
	IOST	_APHCON
	.line	318, "main.c"; 	BPHCON = 0xFC;
	MOVIA	0xfc
	MOVAR	_BPHCON
	.line	319, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	321, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	323, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	325, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	326, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	328, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	331, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0x98
	MOVAR	_PCON
	.line	334, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	335, "main.c"; 	ENI();
	ENI
	.line	336, "main.c"; 	}
	RETURN	
; exit point of _initSys

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm2Stop
;   _pwm3Stop
;   _pwm1Stop
;   _pwm2Stop
;   _pwm3Stop
;; Starting pCode block
.segment "code"; module=main, function=_workStop
	.debuginfo subprogram _workStop
_workStop:
; 2 exit points
	.line	299, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	300, "main.c"; 	pwm2Stop();
	LCALL	_pwm2Stop
	.line	301, "main.c"; 	pwm3Stop();
	LCALL	_pwm3Stop
	.line	302, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	303, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	304, "main.c"; 	powerFlag = 0;
	BANKSEL	_Status
	BCR	_Status,2
	.line	305, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	306, "main.c"; 	powerStep = 0;
	BANKSEL	_powerStep
	CLRR	_powerStep
	.line	307, "main.c"; 	}
	RETURN	
; exit point of _workStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm2Stop
;   _pwm1Stop
;   _pwm2Stop
;; Starting pCode block
.segment "code"; module=main, function=_fanzhuan
	.debuginfo subprogram _fanzhuan
_fanzhuan:
; 2 exit points
	.line	290, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	291, "main.c"; 	pwm2Stop();
	LCALL	_pwm2Stop
	.line	292, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	293, "main.c"; 	PORTB |= 0X04;
	BSR	_PORTB,2
	.line	295, "main.c"; 	}
	RETURN	
; exit point of _fanzhuan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwm1Stop
;   _pwm2Stop
;   _pwm1Stop
;   _pwm2Stop
;; Starting pCode block
.segment "code"; module=main, function=_zhengzhuan
	.debuginfo subprogram _zhengzhuan
_zhengzhuan:
; 2 exit points
	.line	280, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	281, "main.c"; 	pwm2Stop();
	LCALL	_pwm2Stop
	.line	282, "main.c"; 	PORTB &= 0xFB;
	BCR	_PORTB,2
	.line	283, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
	.line	285, "main.c"; 	}
	RETURN	
; exit point of _zhengzhuan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm3Stop
	.debuginfo subprogram _pwm3Stop
_pwm3Stop:
; 2 exit points
	.line	273, "main.c"; 	T3CR1 = C_TMR3_Dis;
	CLRA	
	SFUN	_T3CR1
	.line	274, "main.c"; 	}
	RETURN	
; exit point of _pwm3Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1014
;; Starting pCode block
.segment "code"; module=main, function=_pwm3Init
	.debuginfo subprogram _pwm3Init
_pwm3Init:
; 2 exit points
	.line	261, "main.c"; 	if(0x80&T3CR1)
	SFUNR	_T3CR1
	BANKSEL	r0x1014
	MOVAR	r0x1014
	BTRSC	r0x1014,7
	.line	262, "main.c"; 	return;
	LGOTO	_00210_DS_
	.line	263, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	264, "main.c"; 	TMR3 = 199;							//频率为110K
	MOVIA	0xc7
	SFUN	_TMR3
	.line	267, "main.c"; 	T3CR2 = C_TMR3_ClkSrc_Inst | C_PS3_Div256;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	MOVIA	0x07
	SFUN	_T3CR2
	.line	268, "main.c"; 	T3CR1 = C_PWM3_En | C_TMR3_Reload | C_TMR3_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T3CR1
_00210_DS_:
	.line	269, "main.c"; 	}
	RETURN	
; exit point of _pwm3Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm2Stop
	.debuginfo subprogram _pwm2Stop
_pwm2Stop:
; 2 exit points
	.line	255, "main.c"; 	T2CR1 = C_TMR2_Dis;
	CLRA	
	SFUN	_T2CR1
	.line	256, "main.c"; 	}
	RETURN	
; exit point of _pwm2Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1015
;; Starting pCode block
.segment "code"; module=main, function=_pwm2Init
	.debuginfo subprogram _pwm2Init
_pwm2Init:
; 2 exit points
	.line	243, "main.c"; 	if(0x80&T2CR1)
	SFUNR	_T2CR1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BTRSC	r0x1015,7
	.line	244, "main.c"; 	return;
	LGOTO	_00199_DS_
	.line	245, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	246, "main.c"; 	TMR2 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR2
	.line	249, "main.c"; 	T2CR2 = C_TMR2_ClkSrc_Inst | C_PS2_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T2CR2
	.line	250, "main.c"; 	T2CR1 = C_PWM2_En | C_TMR2_Reload | C_TMR2_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T2CR1
_00199_DS_:
	.line	251, "main.c"; 	}
	RETURN	
; exit point of _pwm2Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Stop
	.debuginfo subprogram _pwm1Stop
_pwm1Stop:
; 2 exit points
	.line	236, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	237, "main.c"; 	}
	RETURN	
; exit point of _pwm1Stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1016
;; Starting pCode block
.segment "code"; module=main, function=_pwm1Init
	.debuginfo subprogram _pwm1Init
_pwm1Init:
; 2 exit points
	.line	224, "main.c"; 	if(0x80&T1CR1)
	SFUNR	_T1CR1
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BTRSC	r0x1016,7
	.line	225, "main.c"; 	return;
	LGOTO	_00188_DS_
	.line	226, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	227, "main.c"; 	TMR1 = 99;							//频率为110K
	MOVIA	0x63
	SFUN	_TMR1
	.line	230, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	231, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
_00188_DS_:
	.line	232, "main.c"; 	}
	RETURN	
; exit point of _pwm1Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;   _pwm3Init
;   _pwm3Stop
;   _pwm1Stop
;   _pwm2Stop
;   _zhengzhuan
;   _fanzhuan
;   __mulchar
;   __mulchar
;   _pwm3Init
;   _pwm3Stop
;   _pwm1Stop
;   _pwm2Stop
;   _zhengzhuan
;   _fanzhuan
;3 compiler assigned registers:
;   STK00
;   r0x1017
;   r0x1018
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	140, "main.c"; 	if(powerStep > 0)
	BANKSEL	_powerStep
	MOVR	_powerStep,W
	BTRSC	STATUS,2
	LGOTO	_00148_DS_
	.line	142, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	143, "main.c"; 	PWM1DUTY = powerStep*30;
	MOVIA	0x1e
	MOVAR	STK00
	MOVR	_powerStep,W
	LCALL	__mulchar
	BANKSEL	r0x1017
	MOVAR	r0x1017
	SFUN	_PWM1DUTY
	.line	144, "main.c"; 	PWM2DUTY = powerStep*30;
	MOVR	r0x1017,W
	SFUN	_PWM2DUTY
	.line	145, "main.c"; 	TM3RH = 0x00;
	CLRR	_TM3RH
	.line	146, "main.c"; 	PWM3DUTY = powerStep*60;
	MOVIA	0x3c
	MOVAR	STK00
	BANKSEL	_powerStep
	MOVR	_powerStep,W
	LCALL	__mulchar
	BANKSEL	r0x1017
	MOVAR	r0x1017
	SFUN	_PWM3DUTY
_00148_DS_:
	.line	151, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00162_DS_
	.line	153, "main.c"; 	if(workTime > 0)
	BANKSEL	_workTime
	MOVR	_workTime,W
	BTRSC	STATUS,2
	LGOTO	_00159_DS_
	.line	155, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	.line	156, "main.c"; 	workTime--;
	BANKSEL	_workTime
	DECR	_workTime,F
_00001_DS_:
	.line	157, "main.c"; 	delayTime = resetdelayTime;
	BANKSEL	_resetdelayTime
	MOVR	_resetdelayTime,W
	BANKSEL	_delayTime
	MOVAR	_delayTime
	.line	158, "main.c"; 	PORTA |= 0X03;
	MOVIA	0x03
	IORAR	_PORTA,F
	.line	159, "main.c"; 	pwm3Init();
	LCALL	_pwm3Init
	.line	160, "main.c"; 	PORTA |= 0X08;		//振动电机
	BSR	_PORTA,3
	LGOTO	_00162_DS_
_00159_DS_:
	.line	164, "main.c"; 	PORTA &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTA,F
	.line	165, "main.c"; 	pwm3Stop();		//敲打电机
	LCALL	_pwm3Stop
	.line	166, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	167, "main.c"; 	if(delayTime > 0)
	BANKSEL	_delayTime
	MOVR	_delayTime,W
	BTRSC	STATUS,2
	LGOTO	_00156_DS_
	.line	169, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	LGOTO	_00002_DS_
	.line	170, "main.c"; 	delayTime--;
	BANKSEL	_delayTime
	DECRSZ	_delayTime,F
_00002_DS_:
	.line	171, "main.c"; 	if(delayTime == 0)
	LGOTO	_00162_DS_
	.line	173, "main.c"; 	workTime = resetworkTime;
	BANKSEL	_resetworkTime
	MOVR	_resetworkTime,W
	BANKSEL	_workTime
	MOVAR	_workTime
	LGOTO	_00162_DS_
_00156_DS_:
	.line	178, "main.c"; 	workTime = resetworkTime;
	BANKSEL	_resetworkTime
	MOVR	_resetworkTime,W
	BANKSEL	_workTime
	MOVAR	_workTime
_00162_DS_:
	.line	182, "main.c"; 	zfTime++;
	BANKSEL	_zfTime
	INCR	_zfTime,F
	.line	183, "main.c"; 	if(0X01 & ~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
	BANKSEL	r0x1017
	COMR	r0x1017,W
	MOVAR	r0x1017
	BANKSEL	r0x1018
	COMR	r0x1018,W
	MOVAR	r0x1018
	BANKSEL	r0x1017
	BTRSS	r0x1017,0
	LGOTO	_00170_DS_
	.line	185, "main.c"; 	if(ZFFlag == 0)
	BANKSEL	_Status
	BTRSC	_Status,3
	LGOTO	_00003_DS_
	.line	186, "main.c"; 	zfTime = 0;
	BANKSEL	_zfTime
	CLRR	_zfTime
_00003_DS_:
	.line	187, "main.c"; 	ZFFlag = 1;
	BANKSEL	_Status
	BSR	_Status,3
	LGOTO	_00171_DS_
_00170_DS_:
	.line	190, "main.c"; 	else if(0X02 & ~PORTB)
	MOVR	_PORTB,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	BANKSEL	r0x1018
	CLRR	r0x1018
	BANKSEL	r0x1017
	COMR	r0x1017,W
	MOVAR	r0x1017
	BANKSEL	r0x1018
	COMR	r0x1018,W
	MOVAR	r0x1018
	BANKSEL	r0x1017
	BTRSS	r0x1017,1
	LGOTO	_00171_DS_
	.line	192, "main.c"; 	if(ZFFlag == 1)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00004_DS_
	.line	193, "main.c"; 	zfTime = 0;
	BANKSEL	_zfTime
	CLRR	_zfTime
_00004_DS_:
	.line	194, "main.c"; 	ZFFlag = 0;
	BANKSEL	_Status
	BCR	_Status,3
_00171_DS_:
	.line	196, "main.c"; 	if(zfTime < 50)
	MOVIA	0x32
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSC	STATUS,0
	LGOTO	_00173_DS_
	.line	198, "main.c"; 	pwm1Stop();
	LCALL	_pwm1Stop
	.line	199, "main.c"; 	pwm2Stop();
	LCALL	_pwm2Stop
	.line	200, "main.c"; 	PORTB &= 0xF3;
	MOVIA	0xf3
	ANDAR	_PORTB,F
_00173_DS_:
	.line	202, "main.c"; 	if(ZFFlag)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00179_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	204, "main.c"; 	if(zfTime > 50)
	MOVIA	0x33
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSS	STATUS,0
	LGOTO	_00181_DS_
	.line	206, "main.c"; 	zhengzhuan();
	LCALL	_zhengzhuan
	.line	207, "main.c"; 	zfTime = 51;
	MOVIA	0x33
	BANKSEL	_zfTime
	MOVAR	_zfTime
	LGOTO	_00181_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00179_DS_:
	.line	212, "main.c"; 	if(zfTime > 50)
	MOVIA	0x33
	BANKSEL	_zfTime
	SUBAR	_zfTime,W
	BTRSS	STATUS,0
	LGOTO	_00181_DS_
	.line	214, "main.c"; 	fanzhuan();
	LCALL	_fanzhuan
	.line	215, "main.c"; 	zfTime = 51;
	MOVIA	0x33
	BANKSEL	_zfTime
	MOVAR	_zfTime
_00181_DS_:
	.line	220, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1019
;; Starting pCode block
.segment "code"; module=main, function=_ledOff
	.debuginfo subprogram _ledOff
_ledOff:
; 2 exit points
	.line	135, "main.c"; 	IOSTA |= 0x20;
	IOSTR	_IOSTA
	BANKSEL	r0x1019
	MOVAR	r0x1019
	BSR	r0x1019,5
	MOVR	r0x1019,W
	IOST	_IOSTA
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _ledOff

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=_ledOn
	.debuginfo subprogram _ledOn
_ledOn:
; 2 exit points
	.line	129, "main.c"; 	IOSTA &= 0xDF;
	IOSTR	_IOSTA
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BCR	r0x101A,5
	MOVR	r0x101A,W
	IOST	_IOSTA
	.line	130, "main.c"; 	PORTA &= 0xDF;
	BCR	_PORTA,5
	.line	131, "main.c"; 	}
	RETURN	
; exit point of _ledOn


;	code size estimation:
;	  474+  113 =   587 instructions ( 1400 byte)

	end
