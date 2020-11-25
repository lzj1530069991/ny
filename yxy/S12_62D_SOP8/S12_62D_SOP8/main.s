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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_keyCtr
	extern	_keyRead
	extern	_chrgCtr
	extern	_setLed2PWM
	extern	_setLed1PWM
	extern	_chrgPWM
	extern	_LEDOFF
	extern	_LED2ON
	extern	_LED1ON
	extern	_workCtr
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN2_Convert
	extern	_checkBat
	extern	_initAD
	extern	_isr
	extern	_main
	extern	_longPressFlag
	extern	_IntFlag
	extern	_chrgFlag
	extern	_doublePressFlag
	extern	_intCount
	extern	_count1s
	extern	_count900s
	extern	_keyCount
	extern	_sleepDelay
	extern	_workStep
	extern	_chrgCount
	extern	_duty
	extern	_led2count
	extern	_ledCount
	extern	_ledCount2
	extern	_duty5
	extern	_duty7
	extern	_ledStep
	extern	_timeCountKey
	extern	_R_AIN2_DATA
	extern	_R_AIN2_DATA_LB
	extern	_ADC_work_value
	extern	_ADC_num_value
	extern	_sleepTime
	extern	_stopFlag
	extern	_chrgTime
	extern	_checkTime
	extern	_loadFlag

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
r0x1038:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_doublePressFlag:
	dw	0x00
	.debuginfo gvariable name=_doublePressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgCount:
	dw	0x00
	.debuginfo gvariable name=_chrgCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_led2count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_led2count,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount2:
	dw	0x00
	.debuginfo gvariable name=_ledCount2,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty5:
	dw	0x00
	.debuginfo gvariable name=_duty5,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty7:
	dw	0x00
	.debuginfo gvariable name=_duty7,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCountKey:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCountKey,2byte,array=0,entsize=2,ext=1


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ADC_work_value:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ADC_work_value,2byte,array=0,entsize=2,ext=1


.segment "idata"
_ADC_num_value:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ADC_num_value,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_stopFlag:
	dw	0x00
	.debuginfo gvariable name=_stopFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgTime:
	dw	0x00
	.debuginfo gvariable name=_chrgTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_loadFlag:
	dw	0x00
	.debuginfo gvariable name=_loadFlag,1byte,array=0,entsize=1,ext=1

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
	.line	70, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	72, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00113_DS_
	.line	74, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	75, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	77, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	79, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	80, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	81, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00113_DS_
	.line	83, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	84, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	86, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	LGOTO	_00113_DS_
_00106_DS_:
	.line	90, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00113_DS_:
	.line	95, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00115_DS_
	.line	97, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00115_DS_:
	.line	100, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	101, "main.c"; 	}
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
;   _initAD
;   _chrgPWM
;   _setLed2PWM
;   _setLed1PWM
;   _setLed2PWM
;   _setLed1PWM
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _initAD
;   _chrgPWM
;   _setLed2PWM
;   _setLed1PWM
;   _setLed2PWM
;   _setLed1PWM
;   _chrgCtr
;   _keyCtr
;   _workCtr
;1 compiler assigned register :
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	106, "main.c"; 	DISI();
	DISI
	.line	107, "main.c"; 	IOSTA = C_PA5_Input;
	MOVIA	0x20
	IOST	_IOSTA
	.line	108, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	109, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	110, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	111, "main.c"; 	APHCON = 0xDF;
	MOVIA	0xdf
	IOST	_APHCON
	.line	112, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	114, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	116, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	118, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	119, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	121, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	123, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	125, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	126, "main.c"; 	ENI();
	ENI
	.line	127, "main.c"; 	initAD();						// PA3 & PA2 output high
	LCALL	_initAD
_00132_DS_:
	.line	131, "main.c"; 	if(chrgFlag)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	133, "main.c"; 	chrgPWM();
	LCALL	_chrgPWM
	.line	135, "main.c"; 	workStep == 0;
	LGOTO	_00122_DS_
_00121_DS_:
	.line	139, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
_00122_DS_:
	.line	141, "main.c"; 	if(ledStep == 2)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	144, "main.c"; 	setLed2PWM();
	LCALL	_setLed2PWM
	.line	145, "main.c"; 	setLed1PWM();
	LCALL	_setLed1PWM
	.line	146, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	LGOTO	_00128_DS_
_00127_DS_:
	.line	148, "main.c"; 	else if(ledStep == 1)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00124_DS_
	.line	151, "main.c"; 	setLed2PWM();
	LCALL	_setLed2PWM
	.line	152, "main.c"; 	setLed1PWM();
	LCALL	_setLed1PWM
	LGOTO	_00128_DS_
_00124_DS_:
	.line	156, "main.c"; 	PORTA &= 0xEA;
	MOVIA	0xea
	ANDAR	_PORTA,F
	.line	157, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BSR	r0x1038,0
	MOVR	r0x1038,W
	IOST	_IOSTA
_00128_DS_:
	.line	159, "main.c"; 	CLRWDT();
	clrwdt
	.line	160, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	.line	162, "main.c"; 	IntFlag = 0;  
	CLRR	_IntFlag
	.line	163, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	164, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	165, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00132_DS_
	.line	167, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	525, "main.c"; 	led2count = 0;
	BANKSEL	_led2count
	CLRR	_led2count
	CLRR	(_led2count + 1)
	.line	526, "main.c"; 	ADC_work_value = 0;
	BANKSEL	_ADC_work_value
	CLRR	_ADC_work_value
	CLRR	(_ADC_work_value + 1)
	.line	527, "main.c"; 	ADC_num_value = 0;
	BANKSEL	_ADC_num_value
	CLRR	_ADC_num_value
	CLRR	(_ADC_num_value + 1)
	.line	528, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	529, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	530, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	531, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	532, "main.c"; 	PORTA &= 0X6F;
	MOVIA	0x6f
	ANDAR	_PORTA,F
	.line	533, "main.c"; 	IOSTA |= 0x05;
	IOSTR	_IOSTA
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	0x05
	IORAR	r0x1022,F
	MOVR	r0x1022,W
	IOST	_IOSTA
	.line	534, "main.c"; 	AWUCON = 0x21;
	MOVIA	0x21
	MOVAR	_AWUCON
	.line	535, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	536, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	537, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	538, "main.c"; 	CLRWDT();
	clrwdt
	.line	539, "main.c"; 	SLEEP();
	sleep
	.line	540, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	541, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	542, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	544, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	546, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _LEDOFF
;   _checkBat
;   _keyRead
;   _LEDOFF
;   _checkBat
;1 compiler assigned register :
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1031
_keyCtr:
; 2 exit points
	.line	476, "main.c"; 	char kclick = keyRead();
	LCALL	_keyRead
;;1	MOVAR	r0x1031
	.line	477, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	.line	483, "main.c"; 	if(doublePressFlag == 1)
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	.line	485, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	486, "main.c"; 	doublePressFlag = 0;
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	.line	487, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	488, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
	.line	489, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	490, "main.c"; 	ADC_num_value = R_AIN2_DATA;//未工作时候的电压
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_num_value
	MOVAR	_ADC_num_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_num_value
	MOVAR	(_ADC_num_value + 1)
	.line	491, "main.c"; 	checkTime = 50;
	MOVIA	0x32
	BANKSEL	_checkTime
	MOVAR	_checkTime
	LGOTO	_00402_DS_
_00401_DS_:
	.line	496, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00398_DS_
	.line	498, "main.c"; 	workStep = 0;//停止工作
	CLRR	_workStep
	.line	499, "main.c"; 	doublePressFlag = 0;
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	LGOTO	_00402_DS_
_00398_DS_:
	.line	503, "main.c"; 	doublePressFlag = 1;
	MOVIA	0x01
	BANKSEL	_doublePressFlag
	MOVAR	_doublePressFlag
_00402_DS_:
	.line	506, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	507, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	508, "main.c"; 	timeCountKey = 0;
	BANKSEL	_timeCountKey
	CLRR	_timeCountKey
	CLRR	(_timeCountKey + 1)
_00404_DS_:
	.line	513, "main.c"; 	if(keyCount == 0 && doublePressFlag && (++timeCountKey > 100))
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00409_DS_
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	BTRSC	STATUS,2
	LGOTO	_00409_DS_
	BANKSEL	_timeCountKey
	INCR	_timeCountKey,F
	BTRSC	STATUS,2
	INCR	(_timeCountKey + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	SUBAR	(_timeCountKey + 1),W
	BTRSS	STATUS,2
	LGOTO	_00429_DS_
	MOVIA	0x65
	SUBAR	_timeCountKey,W
_00429_DS_:
	BTRSS	STATUS,0
	LGOTO	_00409_DS_
	.line	515, "main.c"; 	doublePressFlag = 0;   	//1秒内未双击，重新计数
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	.line	516, "main.c"; 	timeCountKey = 0;
	BANKSEL	_timeCountKey
	CLRR	_timeCountKey
	CLRR	(_timeCountKey + 1)
_00409_DS_:
	.line	519, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
_keyRead:
; 2 exit points
	.line	455, "main.c"; 	if (PORTA & 0x20)
	BTRSS	_PORTA,5
	LGOTO	_00390_DS_
	.line	457, "main.c"; 	if(++keyCount >= 200)
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00391_DS_
	.line	459, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00391_DS_
;;unsigned compare: left < lit (0x5=5), size=1
_00390_DS_:
	.line	464, "main.c"; 	if(keyCount >= 5)
	MOVIA	0x05
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00388_DS_
	.line	466, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	467, "main.c"; 	return 	1;
	MOVIA	0x01
	LGOTO	_00392_DS_
_00388_DS_:
	.line	469, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00391_DS_:
	.line	471, "main.c"; 	return 0;
	MOVIA	0x00
_00392_DS_:
	.line	472, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _checkBat
;   _LED1ON
;   _LED2ON
;   _LEDOFF
;   _delay
;   _checkBat
;   _LED1ON
;   _LED2ON
;   _LEDOFF
;2 compiler assigned registers:
;   r0x1033
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	409, "main.c"; 	if(ledStep == 0 || ledCount > duty5)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSC	STATUS,2
	LGOTO	_00346_DS_
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_duty5
	SUBAR	_duty5,W
	BTRSC	STATUS,0
	LGOTO	_00349_DS_
_00346_DS_:
	.line	411, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	412, "main.c"; 	IOSTA |= 0x15;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVIA	0x15
	IORAR	r0x1033,F
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	413, "main.c"; 	ABPLCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_ABPLCON
	.line	414, "main.c"; 	delay(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	415, "main.c"; 	if(PORTA & 0x01)
	BTRSS	_PORTA,0
	LGOTO	_00344_DS_
	.line	418, "main.c"; 	if(++chrgTime > 100)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_chrgTime,W
	BTRSS	STATUS,0
	LGOTO	_00329_DS_
	.line	419, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
_00329_DS_:
	.line	421, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	422, "main.c"; 	ADC_num_value = R_AIN2_DATA;
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_num_value
	MOVAR	_ADC_num_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_num_value
	MOVAR	(_ADC_num_value + 1)
;;unsigned compare: left < lit (0xB36=2870), size=2
	.line	423, "main.c"; 	if(ADC_num_value < 2870)
	MOVIA	0x0b
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	LGOTO	_00377_DS_
	MOVIA	0x36
	SUBAR	_ADC_num_value,W
_00377_DS_:
	BTRSC	STATUS,0
	LGOTO	_00333_DS_
	.line	424, "main.c"; 	LED1ON();
	LCALL	_LED1ON
	LGOTO	_00334_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB41=2881), size=2
_00333_DS_:
	.line	425, "main.c"; 	else if(ADC_num_value > 2880)
	MOVIA	0x0b
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	LGOTO	_00378_DS_
	MOVIA	0x41
	SUBAR	_ADC_num_value,W
_00378_DS_:
	BTRSS	STATUS,0
	LGOTO	_00334_DS_
	.line	426, "main.c"; 	LED2ON();
	LCALL	_LED2ON
;;unsigned compare: left < lit (0x6DB=1755), size=2
_00334_DS_:
	.line	428, "main.c"; 	if(ADC_num_value < 1755)
	MOVIA	0x06
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	LGOTO	_00379_DS_
	MOVIA	0xdb
	SUBAR	_ADC_num_value,W
_00379_DS_:
	BTRSC	STATUS,0
	LGOTO	_00339_DS_
	.line	430, "main.c"; 	duty = 5;
	MOVIA	0x05
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00345_DS_
;;unsigned compare: left < lit (0x8DA=2266), size=2
_00339_DS_:
	.line	432, "main.c"; 	else if(ADC_num_value < 2266)
	MOVIA	0x08
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	LGOTO	_00380_DS_
	MOVIA	0xda
	SUBAR	_ADC_num_value,W
_00380_DS_:
	BTRSC	STATUS,0
	LGOTO	_00336_DS_
	.line	434, "main.c"; 	duty = 75;
	MOVIA	0x4b
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00345_DS_
_00336_DS_:
	.line	438, "main.c"; 	duty = 5;
	MOVIA	0x05
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00345_DS_
_00344_DS_:
	.line	443, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	.line	444, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	445, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	446, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
_00345_DS_:
	.line	448, "main.c"; 	ABPLCON = 0xFF;   //关闭PA0下拉
	MOVIA	0xff
	MOVAR	_ABPLCON
_00349_DS_:
	.line	450, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_setLed2PWM
	.debuginfo subprogram _setLed2PWM
_setLed2PWM:
; 2 exit points
	.line	393, "main.c"; 	if(ledCount >= duty7)
	BANKSEL	_duty7
	MOVR	_duty7,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00321_DS_
	.line	395, "main.c"; 	PORTA &= 0xEF;
	BCR	_PORTA,4
	.line	396, "main.c"; 	IOSTA |= 0x10;
	IOSTR	_IOSTA
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BSR	r0x1034,4
	MOVR	r0x1034,W
	IOST	_IOSTA
	LGOTO	_00323_DS_
_00321_DS_:
	.line	400, "main.c"; 	IOSTA &= 0xEF;
	IOSTR	_IOSTA
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BCR	r0x1034,4
	MOVR	r0x1034,W
	IOST	_IOSTA
	.line	401, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
_00323_DS_:
	.line	403, "main.c"; 	}
	RETURN	
; exit point of _setLed2PWM

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_setLed1PWM
	.debuginfo subprogram _setLed1PWM
_setLed1PWM:
; 0 exit points
	.line	377, "main.c"; 	if(ledCount >= duty5)
	BANKSEL	_duty5
	MOVR	_duty5,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00311_DS_
	.line	379, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	380, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BSR	r0x1035,0
	MOVR	r0x1035,W
	IOST	_IOSTA
	LGOTO	_00312_DS_
_00311_DS_:
	.line	384, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BCR	r0x1035,0
	MOVR	r0x1035,W
	IOST	_IOSTA
	.line	385, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
_00312_DS_:
	.line	387, "main.c"; 	if(++ledCount >= 10)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	388, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	389, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_chrgPWM
	.debuginfo subprogram _chrgPWM
_chrgPWM:
; 0 exit points
	.line	362, "main.c"; 	if(chrgCount >= duty)
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_chrgCount
	SUBAR	_chrgCount,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	364, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	LGOTO	_00302_DS_
_00301_DS_:
	.line	368, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
_00302_DS_:
	.line	370, "main.c"; 	if(++chrgCount >= 100)
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_chrgCount,W
	BTRSC	STATUS,0
	.line	371, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
	.line	372, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_LEDOFF
	.debuginfo subprogram _LEDOFF
_LEDOFF:
; 2 exit points
	.line	352, "main.c"; 	IOSTA |= 0x05;
	IOSTR	_IOSTA
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	0x05
	IORAR	r0x1023,F
	MOVR	r0x1023,W
	IOST	_IOSTA
	.line	353, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	354, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	355, "main.c"; 	}
	RETURN	
; exit point of _LEDOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	342, "main.c"; 	IOSTA &= 0xEB;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVIA	0xeb
	ANDAR	r0x1032,F
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	343, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	344, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	345, "main.c"; 	duty7 = 6;
	MOVIA	0x06
	BANKSEL	_duty7
	MOVAR	_duty7
	.line	346, "main.c"; 	duty5 = 6;
	BANKSEL	_duty5
	MOVAR	_duty5
	.line	347, "main.c"; 	}
	RETURN	
; exit point of _LED2ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	333, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	334, "main.c"; 	IOSTA |= 0x04;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BSR	r0x1032,2
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	335, "main.c"; 	IOSTA &= 0xEE;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	MOVIA	0xee
	ANDAR	r0x1032,F
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	336, "main.c"; 	duty7 = 6;
	MOVIA	0x06
	BANKSEL	_duty7
	MOVAR	_duty7
	.line	337, "main.c"; 	duty5 = 4;
	MOVIA	0x04
	BANKSEL	_duty5
	MOVAR	_duty5
	.line	338, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _LEDOFF
;   _checkBat
;   _LED2ON
;   _LED2ON
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _LEDOFF
;   _checkBat
;   _LED2ON
;   _LED2ON
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _gotoSleep
;   _gotoSleep
;2 compiler assigned registers:
;   r0x1036
;   r0x1037
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=2
	.line	241, "main.c"; 	if(count900s > 40)
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	MOVIA	0x29
	SUBAR	_count900s,W
_00274_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	243, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00178_DS_:
	.line	245, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00219_DS_
	.line	247, "main.c"; 	if(checkTime > 0)
	BANKSEL	_checkTime
	MOVR	_checkTime,W
	BTRSC	STATUS,2
	LGOTO	_00183_DS_
	.line	249, "main.c"; 	--checkTime;	//检测次数
	DECR	_checkTime,F
	.line	250, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
	.line	251, "main.c"; 	checkBat();
	LCALL	_checkBat
	.line	252, "main.c"; 	ADC_work_value = R_AIN2_DATA;
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_work_value
	MOVAR	_ADC_work_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_work_value
	MOVAR	(_ADC_work_value + 1)
	.line	253, "main.c"; 	if(ADC_num_value < (ADC_work_value + 100))
	MOVIA	0x64
	ADDAR	_ADC_work_value,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1037
	CLRR	r0x1037
	RLR	r0x1037,F
	BANKSEL	_ADC_work_value
	MOVR	(_ADC_work_value + 1),W
	BANKSEL	r0x1037
	ADDAR	r0x1037,F
	MOVR	r0x1037,W
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	LGOTO	_00275_DS_
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	_ADC_num_value
	SUBAR	_ADC_num_value,W
_00275_DS_:
	BTRSC	STATUS,0
	LGOTO	_00180_DS_
	.line	255, "main.c"; 	loadFlag = 0;//空载
	BANKSEL	_loadFlag
	CLRR	_loadFlag
	LGOTO	_00183_DS_
_00180_DS_:
	.line	259, "main.c"; 	loadFlag = 1;//满载
	MOVIA	0x01
	BANKSEL	_loadFlag
	MOVAR	_loadFlag
_00183_DS_:
	.line	262, "main.c"; 	if((loadFlag == 0 && count900s < 15) || stopFlag == 1)
	BANKSEL	_loadFlag
	MOVR	_loadFlag,W
	BTRSS	STATUS,2
	LGOTO	_00192_DS_
;;unsigned compare: left < lit (0xF=15), size=2
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00276_DS_
	MOVIA	0x0f
	SUBAR	_count900s,W
_00276_DS_:
	BTRSS	STATUS,0
	LGOTO	_00188_DS_
_00192_DS_:
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00189_DS_
;;unsigned compare: left < lit (0x6=6), size=2
_00188_DS_:
	.line	265, "main.c"; 	if(count900s >= 6 || stopFlag == 1)
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00277_DS_
	MOVIA	0x06
	SUBAR	_count900s,W
_00277_DS_:
	BTRSC	STATUS,0
	LGOTO	_00184_DS_
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00185_DS_
_00184_DS_:
	.line	267, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	.line	268, "main.c"; 	stopFlag = 1;
	MOVIA	0x01
	BANKSEL	_stopFlag
	MOVAR	_stopFlag
	LGOTO	_00190_DS_
_00185_DS_:
	.line	272, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
	.line	273, "main.c"; 	LED2ON();
	LCALL	_LED2ON
	LGOTO	_00190_DS_
_00189_DS_:
	.line	279, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
	.line	280, "main.c"; 	LED2ON();
	LCALL	_LED2ON
_00190_DS_:
	.line	284, "main.c"; 	if(stopFlag)
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	BTRSC	STATUS,2
	LGOTO	_00221_DS_
;;unsigned compare: left < lit (0x64=100), size=2
	.line	286, "main.c"; 	if(led2count < 100)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00278_DS_
	MOVIA	0x64
	SUBAR	_led2count,W
_00278_DS_:
	BTRSC	STATUS,0
	LGOTO	_00206_DS_
	.line	288, "main.c"; 	LED2ON();
	LCALL	_LED2ON
	LGOTO	_00207_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00206_DS_:
	.line	290, "main.c"; 	else if(led2count < 200)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	MOVIA	0xc8
	SUBAR	_led2count,W
_00279_DS_:
	BTRSC	STATUS,0
	LGOTO	_00203_DS_
	.line	292, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
	LGOTO	_00207_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00203_DS_:
	.line	294, "main.c"; 	else if(led2count < 300)
	MOVIA	0x01
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	MOVIA	0x2c
	SUBAR	_led2count,W
_00280_DS_:
	BTRSC	STATUS,0
	LGOTO	_00200_DS_
	.line	296, "main.c"; 	LED2ON();
	LCALL	_LED2ON
	LGOTO	_00207_DS_
;;unsigned compare: left < lit (0x190=400), size=2
_00200_DS_:
	.line	298, "main.c"; 	else if(led2count < 400)
	MOVIA	0x01
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00281_DS_
	MOVIA	0x90
	SUBAR	_led2count,W
_00281_DS_:
	BTRSC	STATUS,0
	LGOTO	_00197_DS_
	.line	300, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
	LGOTO	_00207_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
_00197_DS_:
	.line	302, "main.c"; 	else if(led2count < 500)
	MOVIA	0x01
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	MOVIA	0xf4
	SUBAR	_led2count,W
_00282_DS_:
	BTRSC	STATUS,0
	LGOTO	_00194_DS_
	.line	304, "main.c"; 	LED2ON();
	LCALL	_LED2ON
	LGOTO	_00207_DS_
_00194_DS_:
	.line	308, "main.c"; 	LEDOFF();
	LCALL	_LEDOFF
_00207_DS_:
	.line	310, "main.c"; 	if(++led2count > 600)
	BANKSEL	_led2count
	INCR	_led2count,F
	BTRSC	STATUS,2
	INCR	(_led2count + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x259=601), size=2
	MOVIA	0x02
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	MOVIA	0x59
	SUBAR	_led2count,W
_00283_DS_:
	BTRSS	STATUS,0
	LGOTO	_00221_DS_
	.line	312, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	313, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00221_DS_
_00219_DS_:
	.line	320, "main.c"; 	PORTA &= 0x6F;
	MOVIA	0x6f
	ANDAR	_PORTA,F
	.line	321, "main.c"; 	if(chrgFlag == 0 && doublePressFlag == 0 && keyCount == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00221_DS_
	.line	323, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	324, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00221_DS_:
	.line	328, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1024
	.debuginfo variable _time[1]=r0x1023
	.debuginfo variable _i[0]=r0x1025
	.debuginfo variable _i[1]=r0x1026
_delay:
; 2 exit points
	.line	232, "main.c"; 	void delay(u16 time)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	234, "main.c"; 	for(u16 i=0;i<time;i++);
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1026
	CLRR	r0x1026
_00161_DS_:
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
	BTRSS	STATUS,2
	LGOTO	_00172_DS_
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
_00172_DS_:
	BTRSC	STATUS,0
	LGOTO	_00163_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00001_DS_:
	LGOTO	_00161_DS_
_00163_DS_:
	.line	235, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_F_wait_eoc
	.debuginfo subprogram _F_wait_eoc
_F_wait_eoc:
; 2 exit points
_00154_DS_:
	.line	226, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00154_DS_
	.line	228, "main.c"; 	}
	RETURN	
; exit point of _F_wait_eoc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_wait_eoc
;   _delay
;   _F_wait_eoc
;7 compiler assigned registers:
;   r0x1027
;   STK00
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1027
	.debuginfo variable _i=r0x1028
_F_AIN2_Convert:
; 2 exit points
	.line	208, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	210, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	212, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	213, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	214, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1028
	MOVAR	r0x1028
_00147_DS_:
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSS	STATUS,0
	LGOTO	_00149_DS_
	.line	216, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	217, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	218, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1029
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	219, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	CLRR	r0x102A
;;102	MOVR	r0x1029,W
;;100	MOVAR	r0x102B
	MOVIA	0x00
	BANKSEL	r0x102C
	MOVAR	r0x102C
;;101	MOVR	r0x102B,W
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,0
	INCR	r0x102C,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00002_DS_:
	.line	214, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1028
	INCR	r0x1028,F
	LGOTO	_00147_DS_
_00149_DS_:
	.line	221, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN2_Convert
;   _F_AIN2_Convert
;4 compiler assigned registers:
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	198, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	199, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN2_Convert
	.line	200, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	201, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	202, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
;;1	MOVAR	r0x102D
;;1	CLRR	r0x102E
;;99	MOVR	r0x102D,W
	MOVIA	0x00
	BANKSEL	r0x1030
	MOVAR	r0x1030
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BTRSC	STATUS,0
	INCR	r0x1030,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	203, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_initAD
	.debuginfo subprogram _initAD
_initAD:
; 2 exit points
	.line	174, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x82
	MOVAR	_ADMD
	.line	178, "main.c"; 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	184, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	186, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	189, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	190, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	193, "main.c"; 	}
	RETURN	
; exit point of _initAD


;	code size estimation:
;	  681+  159 =   840 instructions ( 1998 byte)

	end
