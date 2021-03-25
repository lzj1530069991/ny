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
	extern	_motorPWM
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
	extern	_duty1
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
	extern	_resultTime
	extern	_motorCount

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
r0x103C:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgFlag:
	dw	0x00
	.debuginfo gvariable name=_chrgFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_doublePressFlag:
	dw	0x00
	.debuginfo gvariable name=_doublePressFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count900s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count900s,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgCount:
	dw	0x00
	.debuginfo gvariable name=_chrgCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_led2count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_led2count,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount2:
	dw	0x00
	.debuginfo gvariable name=_ledCount2,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty1:
	dw	0x00
	.debuginfo gvariable name=_duty1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty5:
	dw	0x00
	.debuginfo gvariable name=_duty5,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty7:
	dw	0x00
	.debuginfo gvariable name=_duty7,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledStep:
	dw	0x00
	.debuginfo gvariable name=_ledStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_timeCountKey:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCountKey,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA:
	dw	0x00, 0x00
	.debuginfo gvariable name=_R_AIN2_DATA,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_R_AIN2_DATA_LB:
	dw	0x00
	.debuginfo gvariable name=_R_AIN2_DATA_LB,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ADC_work_value:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ADC_work_value,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ADC_num_value:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ADC_num_value,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_sleepTime:
	dw	0x00
	.debuginfo gvariable name=_sleepTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_stopFlag:
	dw	0x00
	.debuginfo gvariable name=_stopFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_chrgTime:
	dw	0x00
	.debuginfo gvariable name=_chrgTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_loadFlag:
	dw	0x00
	.debuginfo gvariable name=_loadFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_resultTime:
	dw	0x00
	.debuginfo gvariable name=_resultTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_motorCount:
	dw	0x00
	.debuginfo gvariable name=_motorCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _setLed2PWM
;   _setLed1PWM
;   _setLed2PWM
;   _setLed1PWM
;   _setLed2PWM
;   _setLed1PWM
;   _setLed2PWM
;   _setLed1PWM
;3 compiler assigned registers:
;   STK00
;   STK01
;   r0x103C
;; Starting pCode block
_isr:
; 0 exit points
	.line	74, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	76, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00119_DS_
	.line	78, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	79, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	81, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	MGOTO	_00111_DS_
	.line	83, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	84, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	85, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00111_DS_
	.line	87, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	88, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00106_DS_
	.line	90, "main.c"; 	++count900s;
	BANKSEL	_count900s
	INCR	_count900s,F
	BTRSC	STATUS,2
	INCR	(_count900s + 1),F
	MGOTO	_00111_DS_
_00106_DS_:
	.line	94, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
_00111_DS_:
	.line	98, "main.c"; 	if(ledStep == 2)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00116_DS_
	.line	101, "main.c"; 	setLed2PWM();
	MCALL	_setLed2PWM
	.line	102, "main.c"; 	setLed1PWM();
	MCALL	_setLed1PWM
	MGOTO	_00119_DS_
_00116_DS_:
	.line	105, "main.c"; 	else if(ledStep == 1)
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00113_DS_
	.line	108, "main.c"; 	setLed2PWM();
	MCALL	_setLed2PWM
	.line	109, "main.c"; 	setLed1PWM();
	MCALL	_setLed1PWM
	MGOTO	_00119_DS_
_00113_DS_:
	.line	113, "main.c"; 	PORTA &= 0xEA;
	MOVIA	0xea
	ANDAR	_PORTA,F
	.line	114, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x103C
	MOVAR	r0x103C
	BSR	r0x103C,0
	MOVR	r0x103C,W
	IOST	_IOSTA
_00119_DS_:
	.line	117, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_00121_DS_
	.line	119, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00121_DS_:
	.line	122, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	123, "main.c"; 	}
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
;   _chrgCtr
;   _keyCtr
;   _workCtr
;   _initAD
;   _chrgPWM
;   _chrgCtr
;   _keyCtr
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	128, "main.c"; 	DISI();
	DISI
	.line	129, "main.c"; 	IOSTA = C_PA5_Input | C_PA2_Input;
	MOVIA	0x24
	IOST	_IOSTA
	.line	130, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	131, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	132, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	133, "main.c"; 	APHCON = 0xDF;
	MOVIA	0xdf
	IOST	_APHCON
	.line	134, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	136, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	138, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	140, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	141, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div4;
	MOVIA	0x01
	T0MD	
	.line	143, "main.c"; 	PCON1 = C_TMR0_En;
	IOST	_PCON1
	.line	145, "main.c"; 	PCON = C_WDT_En | C_LVR_En | 0x10;				// Enable WDT ,  Enable LVR,PA5关闭上拉
	MOVIA	0x98
	MOVAR	_PCON
	.line	147, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	148, "main.c"; 	ENI();
	ENI
	.line	149, "main.c"; 	initAD();						// PA3 & PA2 output high
	MCALL	_initAD
_00136_DS_:
	.line	153, "main.c"; 	if(chrgFlag)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSC	STATUS,2
	MGOTO	_00127_DS_
	.line	155, "main.c"; 	chrgPWM();
	MCALL	_chrgPWM
	.line	157, "main.c"; 	workStep == 0;
	MGOTO	_00128_DS_
_00127_DS_:
	.line	161, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
_00128_DS_:
	.line	166, "main.c"; 	if(workStep == 1 && stopFlag == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00130_DS_
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	BTRSS	STATUS,2
	MGOTO	_00130_DS_
	.line	168, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
	MGOTO	_00131_DS_
_00130_DS_:
	.line	172, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
_00131_DS_:
	.line	175, "main.c"; 	CLRWDT();
	clrwdt
	.line	176, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00136_DS_
	.line	178, "main.c"; 	IntFlag = 0; 
	CLRR	_IntFlag
	.line	179, "main.c"; 	chrgCtr();
	MCALL	_chrgCtr
	.line	180, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	181, "main.c"; 	workCtr();
	MCALL	_workCtr
	MGOTO	_00136_DS_
	.line	183, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _LEDOFF
;   _LEDOFF
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	579, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
	.line	580, "main.c"; 	duty1 = 0;
	BANKSEL	_duty1
	CLRR	_duty1
	.line	581, "main.c"; 	led2count = 0;
	BANKSEL	_led2count
	CLRR	_led2count
	CLRR	(_led2count + 1)
	.line	582, "main.c"; 	ADC_work_value = 0;
	BANKSEL	_ADC_work_value
	CLRR	_ADC_work_value
	CLRR	(_ADC_work_value + 1)
	.line	583, "main.c"; 	ADC_num_value = 0;
	BANKSEL	_ADC_num_value
	CLRR	_ADC_num_value
	CLRR	(_ADC_num_value + 1)
	.line	584, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	585, "main.c"; 	sleepTime = 0;
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	.line	586, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	587, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	588, "main.c"; 	PORTA &= 0X6F;
	MOVIA	0x6f
	ANDAR	_PORTA,F
	.line	589, "main.c"; 	IOSTA |= 0x05;
	IOSTR	_IOSTA
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	0x05
	IORAR	r0x1026,F
	MOVR	r0x1026,W
	IOST	_IOSTA
	.line	590, "main.c"; 	AWUCON = 0x21;
	MOVIA	0x21
	MOVAR	_AWUCON
	.line	591, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	592, "main.c"; 	PCON =  C_LVR_En | 0x10;	
	MOVIA	0x18
	MOVAR	_PCON
	.line	593, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	594, "main.c"; 	CLRWDT();
	clrwdt
	.line	595, "main.c"; 	SLEEP();
	sleep
	.line	596, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	597, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	598, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	600, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En | 0x10;				// Enable WDT ,  Enable LVR
	MOVIA	0xb8
	MOVAR	_PCON
	.line	602, "main.c"; 	}
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
;   r0x1035
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1035,enc=unsigned
_keyCtr:
; 2 exit points
	.line	529, "main.c"; 	char kclick = keyRead();
	MCALL	_keyRead
;;1	MOVAR	r0x1035
	.line	530, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00460_DS_
	.line	536, "main.c"; 	if(doublePressFlag == 1)
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00457_DS_
	.line	538, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	539, "main.c"; 	duty1 = 20;
	MOVIA	0x14
	BANKSEL	_duty1
	MOVAR	_duty1
	.line	540, "main.c"; 	doublePressFlag = 0;
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	.line	541, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	542, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
	.line	543, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	544, "main.c"; 	ADC_num_value = R_AIN2_DATA;//未工作时候的电压
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_num_value
	MOVAR	_ADC_num_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_num_value
	MOVAR	(_ADC_num_value + 1)
	MGOTO	_00458_DS_
_00457_DS_:
	.line	549, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00454_DS_
	.line	551, "main.c"; 	workStep = 0;//停止工作
	CLRR	_workStep
	.line	552, "main.c"; 	doublePressFlag = 0;
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	MGOTO	_00458_DS_
_00454_DS_:
	.line	556, "main.c"; 	doublePressFlag = 1;
	MOVIA	0x01
	BANKSEL	_doublePressFlag
	MOVAR	_doublePressFlag
_00458_DS_:
	.line	560, "main.c"; 	count1s = 0;
	BANKSEL	_count1s
	CLRR	_count1s
	.line	561, "main.c"; 	count900s = 0;
	BANKSEL	_count900s
	CLRR	_count900s
	CLRR	(_count900s + 1)
	.line	562, "main.c"; 	timeCountKey = 0;
	BANKSEL	_timeCountKey
	CLRR	_timeCountKey
	CLRR	(_timeCountKey + 1)
_00460_DS_:
	.line	567, "main.c"; 	if(keyCount == 0 && doublePressFlag && (++timeCountKey > 50))
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00465_DS_
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	BTRSC	STATUS,2
	MGOTO	_00465_DS_
	BANKSEL	_timeCountKey
	INCR	_timeCountKey,F
	BTRSC	STATUS,2
	INCR	(_timeCountKey + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=2
	MOVIA	0x00
	SUBAR	(_timeCountKey + 1),W
	BTRSS	STATUS,2
	MGOTO	_00485_DS_
	MOVIA	0x33
	SUBAR	_timeCountKey,W
_00485_DS_:
	BTRSS	STATUS,0
	MGOTO	_00465_DS_
	.line	569, "main.c"; 	doublePressFlag = 0;   	//1秒内未双击，重新计数
	BANKSEL	_doublePressFlag
	CLRR	_doublePressFlag
	.line	570, "main.c"; 	timeCountKey = 0;
	BANKSEL	_timeCountKey
	CLRR	_timeCountKey
	CLRR	(_timeCountKey + 1)
_00465_DS_:
	.line	573, "main.c"; 	}
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
	.line	508, "main.c"; 	if (PORTA & 0x20)
	BTRSS	_PORTA,5
	MGOTO	_00446_DS_
	.line	510, "main.c"; 	if(++keyCount >= 200)
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00447_DS_
	.line	512, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00447_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00446_DS_:
	.line	517, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00444_DS_
	.line	519, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	520, "main.c"; 	return 	1;
	MOVIA	0x01
	MGOTO	_00448_DS_
_00444_DS_:
	.line	522, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00447_DS_:
	.line	524, "main.c"; 	return 0;
	MOVIA	0x00
_00448_DS_:
	.line	525, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
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
;   r0x1037
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 0 exit points
	.line	464, "main.c"; 	if(ledCount > duty7 || ledStep == 0)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_duty7
	SUBAR	_duty7,W
	BTRSS	STATUS,0
	MGOTO	_00402_DS_
	BANKSEL	_ledStep
	MOVR	_ledStep,W
	BTRSS	STATUS,2
	MGOTO	_00405_DS_
_00402_DS_:
	.line	466, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BSR	r0x1037,0
	MOVR	r0x1037,W
	IOST	_IOSTA
	.line	467, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	468, "main.c"; 	delay(10);
	MOVIA	0x0a
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	469, "main.c"; 	if(PORTA & 0x01)
	BTRSS	_PORTA,0
	MGOTO	_00400_DS_
	.line	472, "main.c"; 	if(++chrgTime > 100)
	BANKSEL	_chrgTime
	INCR	_chrgTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_chrgTime,W
	BTRSS	STATUS,0
	MGOTO	_00385_DS_
	.line	473, "main.c"; 	chrgFlag = 1;
	MOVIA	0x01
	BANKSEL	_chrgFlag
	MOVAR	_chrgFlag
_00385_DS_:
	.line	475, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	476, "main.c"; 	ADC_num_value = R_AIN2_DATA;
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_num_value
	MOVAR	_ADC_num_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_num_value
	MOVAR	(_ADC_num_value + 1)
;;unsigned compare: left < lit (0xB36=2870), size=2
	.line	477, "main.c"; 	if(ADC_num_value < 2870)
	MOVIA	0x0b
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	MGOTO	_00433_DS_
	MOVIA	0x36
	SUBAR	_ADC_num_value,W
_00433_DS_:
	BTRSC	STATUS,0
	MGOTO	_00389_DS_
	.line	478, "main.c"; 	LED1ON();
	MCALL	_LED1ON
	MGOTO	_00390_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB41=2881), size=2
_00389_DS_:
	.line	479, "main.c"; 	else if(ADC_num_value > 2880)
	MOVIA	0x0b
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	MGOTO	_00434_DS_
	MOVIA	0x41
	SUBAR	_ADC_num_value,W
_00434_DS_:
	BTRSS	STATUS,0
	MGOTO	_00390_DS_
	.line	480, "main.c"; 	LED2ON();
	MCALL	_LED2ON
;;unsigned compare: left < lit (0x6DB=1755), size=2
_00390_DS_:
	.line	482, "main.c"; 	if(ADC_num_value < 1755)
	MOVIA	0x06
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	MGOTO	_00435_DS_
	MOVIA	0xdb
	SUBAR	_ADC_num_value,W
_00435_DS_:
	BTRSC	STATUS,0
	MGOTO	_00395_DS_
	.line	484, "main.c"; 	duty = 5;
	MOVIA	0x05
	BANKSEL	_duty
	MOVAR	_duty
	MGOTO	_00405_DS_
;;unsigned compare: left < lit (0x8DA=2266), size=2
_00395_DS_:
	.line	486, "main.c"; 	else if(ADC_num_value < 2266)
	MOVIA	0x08
	BANKSEL	_ADC_num_value
	SUBAR	(_ADC_num_value + 1),W
	BTRSS	STATUS,2
	MGOTO	_00436_DS_
	MOVIA	0xda
	SUBAR	_ADC_num_value,W
_00436_DS_:
	BTRSC	STATUS,0
	MGOTO	_00392_DS_
	.line	488, "main.c"; 	duty = 75;
	MOVIA	0x4b
	BANKSEL	_duty
	MOVAR	_duty
	MGOTO	_00405_DS_
_00392_DS_:
	.line	492, "main.c"; 	duty = 5;
	MOVIA	0x05
	BANKSEL	_duty
	MOVAR	_duty
	MGOTO	_00405_DS_
_00400_DS_:
	.line	497, "main.c"; 	chrgTime = 0;
	BANKSEL	_chrgTime
	CLRR	_chrgTime
	.line	498, "main.c"; 	chrgFlag = 0;
	BANKSEL	_chrgFlag
	CLRR	_chrgFlag
	.line	499, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	500, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
_00405_DS_:
	.line	503, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_setLed2PWM
	.debuginfo subprogram _setLed2PWM
_setLed2PWM:
; 2 exit points
	.line	445, "main.c"; 	if(ledCount >= duty7)
	BANKSEL	_duty7
	MOVR	_duty7,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00377_DS_
	.line	447, "main.c"; 	PORTA &= 0xEB;
	MOVIA	0xeb
	ANDAR	_PORTA,F
	.line	448, "main.c"; 	IOSTA |= 0x14;
	IOSTR	_IOSTA
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVIA	0x14
	IORAR	r0x1038,F
	MOVR	r0x1038,W
	IOST	_IOSTA
	MGOTO	_00379_DS_
_00377_DS_:
	.line	452, "main.c"; 	IOSTA &= 0xEB;
	IOSTR	_IOSTA
	BANKSEL	r0x1038
	MOVAR	r0x1038
	MOVIA	0xeb
	ANDAR	r0x1038,F
	MOVR	r0x1038,W
	IOST	_IOSTA
	.line	453, "main.c"; 	PORTA |= 0x10;
	BSR	_PORTA,4
	.line	454, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
_00379_DS_:
	.line	456, "main.c"; 	}
	RETURN	
; exit point of _setLed2PWM

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x1039
;; Starting pCode block
.segment "code"; module=main, function=_setLed1PWM
	.debuginfo subprogram _setLed1PWM
_setLed1PWM:
; 0 exit points
	.line	427, "main.c"; 	if(ledCount >= duty5)
	BANKSEL	_duty5
	MOVR	_duty5,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	MGOTO	_00367_DS_
	.line	429, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	430, "main.c"; 	IOSTA |= 0x01;
	IOSTR	_IOSTA
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BSR	r0x1039,0
	MOVR	r0x1039,W
	IOST	_IOSTA
	MGOTO	_00368_DS_
_00367_DS_:
	.line	434, "main.c"; 	IOSTA &= 0xFE;
	IOSTR	_IOSTA
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BCR	r0x1039,0
	MOVR	r0x1039,W
	IOST	_IOSTA
	.line	435, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
_00368_DS_:
	.line	437, "main.c"; 	if(++ledCount >= 50)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	439, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	441, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_motorPWM
	.debuginfo subprogram _motorPWM
_motorPWM:
; 0 exit points
	.line	412, "main.c"; 	if(motorCount >= duty1)
	BANKSEL	_duty1
	MOVR	_duty1,W
	BANKSEL	_motorCount
	SUBAR	_motorCount,W
	BTRSS	STATUS,0
	MGOTO	_00357_DS_
	.line	414, "main.c"; 	PORTA &= 0x7F;
	BCR	_PORTA,7
	MGOTO	_00358_DS_
_00357_DS_:
	.line	418, "main.c"; 	PORTA |= 0x80;
	BSR	_PORTA,7
_00358_DS_:
	.line	420, "main.c"; 	if(++motorCount >= 50)
	BANKSEL	_motorCount
	INCR	_motorCount,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_motorCount,W
	BTRSC	STATUS,0
	.line	421, "main.c"; 	motorCount = 0;
	CLRR	_motorCount
	.line	422, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_chrgPWM
	.debuginfo subprogram _chrgPWM
_chrgPWM:
; 0 exit points
	.line	398, "main.c"; 	if(chrgCount >= duty)
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_chrgCount
	SUBAR	_chrgCount,W
	BTRSS	STATUS,0
	MGOTO	_00347_DS_
	.line	400, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	MGOTO	_00348_DS_
_00347_DS_:
	.line	404, "main.c"; 	PORTB |= 0x08;
	BSR	_PORTB,3
_00348_DS_:
	.line	406, "main.c"; 	if(++chrgCount >= 100)
	BANKSEL	_chrgCount
	INCR	_chrgCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_chrgCount,W
	BTRSC	STATUS,0
	.line	407, "main.c"; 	chrgCount = 0;
	CLRR	_chrgCount
	.line	408, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_LEDOFF
	.debuginfo subprogram _LEDOFF
_LEDOFF:
; 2 exit points
	.line	388, "main.c"; 	IOSTA |= 0x05;
	IOSTR	_IOSTA
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	0x05
	IORAR	r0x1025,F
	MOVR	r0x1025,W
	IOST	_IOSTA
	.line	389, "main.c"; 	ledStep = 0;
	BANKSEL	_ledStep
	CLRR	_ledStep
	.line	390, "main.c"; 	PORTA &= 0xF7;
	BCR	_PORTA,3
	.line	391, "main.c"; 	}
	RETURN	
; exit point of _LEDOFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_LED2ON
	.debuginfo subprogram _LED2ON
_LED2ON:
; 2 exit points
	.line	379, "main.c"; 	IOSTA &= 0xEF;
	IOSTR	_IOSTA
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BCR	r0x1036,4
	MOVR	r0x1036,W
	IOST	_IOSTA
	.line	380, "main.c"; 	ledStep = 2;
	MOVIA	0x02
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	381, "main.c"; 	duty7 = 30;
	MOVIA	0x1e
	BANKSEL	_duty7
	MOVAR	_duty7
	.line	382, "main.c"; 	duty5 = 40;
	MOVIA	0x28
	BANKSEL	_duty5
	MOVAR	_duty5
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _LED2ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_LED1ON
	.debuginfo subprogram _LED1ON
_LED1ON:
; 2 exit points
	.line	370, "main.c"; 	ledStep = 1;
	MOVIA	0x01
	BANKSEL	_ledStep
	MOVAR	_ledStep
	.line	371, "main.c"; 	IOSTA |= 0x04;
	IOSTR	_IOSTA
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BSR	r0x1036,2
	MOVR	r0x1036,W
	IOST	_IOSTA
	.line	372, "main.c"; 	IOSTA &= 0xEE;
	IOSTR	_IOSTA
	MOVAR	r0x1036
	MOVIA	0xee
	ANDAR	r0x1036,F
	MOVR	r0x1036,W
	IOST	_IOSTA
	.line	373, "main.c"; 	duty7 = 15;
	MOVIA	0x0f
	BANKSEL	_duty7
	MOVAR	_duty7
	.line	374, "main.c"; 	duty5 = 1;
	MOVIA	0x01
	BANKSEL	_duty5
	MOVAR	_duty5
	.line	375, "main.c"; 	}
	RETURN	
; exit point of _LED1ON

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _gotoSleep
;   _checkBat
;   _LED2ON
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _gotoSleep
;   _gotoSleep
;   _gotoSleep
;   _checkBat
;   _LED2ON
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _LED2ON
;   _LEDOFF
;   _gotoSleep
;   _gotoSleep
;2 compiler assigned registers:
;   r0x103A
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x29=41), size=2
	.line	262, "main.c"; 	if(count900s > 40)
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00314_DS_
	MOVIA	0x29
	SUBAR	_count900s,W
_00314_DS_:
	BTRSS	STATUS,0
	MGOTO	_00182_DS_
	.line	264, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00182_DS_:
	.line	266, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00238_DS_
	.line	268, "main.c"; 	if(++duty1 > 100)
	BANKSEL	_duty1
	INCR	_duty1,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_duty1,W
	BTRSS	STATUS,0
	MGOTO	_00184_DS_
	.line	269, "main.c"; 	duty1 = 100;
	MOVIA	0x64
	MOVAR	_duty1
_00184_DS_:
	.line	272, "main.c"; 	if(ledCount > duty)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	BANKSEL	_duty
	SUBAR	_duty,W
	BTRSS	STATUS,0
	.line	273, "main.c"; 	checkBat();
	MCALL	_checkBat
	.line	274, "main.c"; 	if(count900s > 3 && count900s < 6)
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00317_DS_
	MOVIA	0x04
	SUBAR	_count900s,W
_00317_DS_:
	BTRSS	STATUS,0
	MGOTO	_00193_DS_
;;unsigned compare: left < lit (0x6=6), size=2
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00318_DS_
	MOVIA	0x06
	SUBAR	_count900s,W
_00318_DS_:
	BTRSC	STATUS,0
	MGOTO	_00193_DS_
	.line	276, "main.c"; 	ADC_work_value = R_AIN2_DATA;
	BANKSEL	_R_AIN2_DATA
	MOVR	_R_AIN2_DATA,W
	BANKSEL	_ADC_work_value
	MOVAR	_ADC_work_value
	BANKSEL	_R_AIN2_DATA
	MOVR	(_R_AIN2_DATA + 1),W
	BANKSEL	_ADC_work_value
	MOVAR	(_ADC_work_value + 1)
	.line	278, "main.c"; 	if(ADC_num_value > ADC_work_value + 300)
	MOVIA	0x2c
	ADDAR	_ADC_work_value,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0x01
	BANKSEL	r0x103B
	MOVAR	r0x103B
	BANKSEL	_ADC_work_value
	MOVR	(_ADC_work_value + 1),W
	BTRSC	STATUS,0
	INCR	(_ADC_work_value + 1),W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x103B
	ADDAR	r0x103B,F
_00001_DS_:
	BANKSEL	_ADC_num_value
	MOVR	(_ADC_num_value + 1),W
	BANKSEL	r0x103B
	SUBAR	r0x103B,W
	BTRSS	STATUS,2
	MGOTO	_00319_DS_
	BANKSEL	_ADC_num_value
	MOVR	_ADC_num_value,W
	BANKSEL	r0x103A
	SUBAR	r0x103A,W
_00319_DS_:
	BTRSC	STATUS,0
	MGOTO	_00190_DS_
	.line	280, "main.c"; 	if(++resultTime > 10)
	BANKSEL	_resultTime
	INCR	_resultTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_resultTime,W
	BTRSS	STATUS,0
	MGOTO	_00194_DS_
	.line	281, "main.c"; 	loadFlag = 1;//满载
	MOVIA	0x01
	BANKSEL	_loadFlag
	MOVAR	_loadFlag
	MGOTO	_00194_DS_
_00190_DS_:
	.line	285, "main.c"; 	loadFlag = 0;//空载
	BANKSEL	_loadFlag
	CLRR	_loadFlag
	MGOTO	_00194_DS_
_00193_DS_:
	.line	290, "main.c"; 	resultTime = 0;
	BANKSEL	_resultTime
	CLRR	_resultTime
_00194_DS_:
	.line	294, "main.c"; 	if((loadFlag == 0 && count900s < 15) || stopFlag == 1)
	BANKSEL	_loadFlag
	MOVR	_loadFlag,W
	BTRSS	STATUS,2
	MGOTO	_00208_DS_
;;unsigned compare: left < lit (0xF=15), size=2
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00321_DS_
	MOVIA	0x0f
	SUBAR	_count900s,W
_00321_DS_:
	BTRSS	STATUS,0
	MGOTO	_00204_DS_
_00208_DS_:
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00205_DS_
;;unsigned compare: left < lit (0x6=6), size=2
_00204_DS_:
	.line	297, "main.c"; 	if(count900s >= 6 || stopFlag == 1)
	MOVIA	0x00
	BANKSEL	_count900s
	SUBAR	(_count900s + 1),W
	BTRSS	STATUS,2
	MGOTO	_00322_DS_
	MOVIA	0x06
	SUBAR	_count900s,W
_00322_DS_:
	BTRSC	STATUS,0
	MGOTO	_00198_DS_
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00199_DS_
_00198_DS_:
	.line	299, "main.c"; 	stopFlag = 1;
	MOVIA	0x01
	BANKSEL	_stopFlag
	MOVAR	_stopFlag
	MGOTO	_00206_DS_
_00199_DS_:
	.line	303, "main.c"; 	if(checkTime == 0)
	BANKSEL	_checkTime
	MOVR	_checkTime,W
	BTRSS	STATUS,2
	MGOTO	_00206_DS_
	.line	304, "main.c"; 	LED2ON();
	MCALL	_LED2ON
	MGOTO	_00206_DS_
_00205_DS_:
	.line	310, "main.c"; 	if(checkTime == 0)
	BANKSEL	_checkTime
	MOVR	_checkTime,W
	BTRSC	STATUS,2
	.line	311, "main.c"; 	LED2ON();
	MCALL	_LED2ON
_00206_DS_:
	.line	315, "main.c"; 	if(stopFlag)
	BANKSEL	_stopFlag
	MOVR	_stopFlag,W
	BTRSC	STATUS,2
	MGOTO	_00240_DS_
;;unsigned compare: left < lit (0x32=50), size=2
	.line	317, "main.c"; 	if(led2count < 50)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00323_DS_
	MOVIA	0x32
	SUBAR	_led2count,W
_00323_DS_:
	BTRSC	STATUS,0
	MGOTO	_00225_DS_
	.line	319, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
	MGOTO	_00226_DS_
;;unsigned compare: left < lit (0x64=100), size=2
_00225_DS_:
	.line	321, "main.c"; 	else if(led2count < 100)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00324_DS_
	MOVIA	0x64
	SUBAR	_led2count,W
_00324_DS_:
	BTRSC	STATUS,0
	MGOTO	_00222_DS_
	.line	323, "main.c"; 	LED2ON();
	MCALL	_LED2ON
	MGOTO	_00226_DS_
;;unsigned compare: left < lit (0x96=150), size=2
_00222_DS_:
	.line	325, "main.c"; 	else if(led2count < 150)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00325_DS_
	MOVIA	0x96
	SUBAR	_led2count,W
_00325_DS_:
	BTRSC	STATUS,0
	MGOTO	_00219_DS_
	.line	327, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
	MGOTO	_00226_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00219_DS_:
	.line	329, "main.c"; 	else if(led2count < 200)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00326_DS_
	MOVIA	0xc8
	SUBAR	_led2count,W
_00326_DS_:
	BTRSC	STATUS,0
	MGOTO	_00216_DS_
	.line	331, "main.c"; 	LED2ON();
	MCALL	_LED2ON
	MGOTO	_00226_DS_
;;unsigned compare: left < lit (0xFA=250), size=2
_00216_DS_:
	.line	333, "main.c"; 	else if(led2count < 250)
	MOVIA	0x00
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00327_DS_
	MOVIA	0xfa
	SUBAR	_led2count,W
_00327_DS_:
	BTRSC	STATUS,0
	MGOTO	_00213_DS_
	.line	335, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
	MGOTO	_00226_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00213_DS_:
	.line	337, "main.c"; 	else if(led2count < 300)
	MOVIA	0x01
	BANKSEL	_led2count
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00328_DS_
	MOVIA	0x2c
	SUBAR	_led2count,W
_00328_DS_:
	BTRSC	STATUS,0
	MGOTO	_00210_DS_
	.line	339, "main.c"; 	LED2ON();
	MCALL	_LED2ON
	MGOTO	_00226_DS_
_00210_DS_:
	.line	343, "main.c"; 	LEDOFF();
	MCALL	_LEDOFF
_00226_DS_:
	.line	345, "main.c"; 	if(++led2count > 350)
	BANKSEL	_led2count
	INCR	_led2count,F
	BTRSC	STATUS,2
	INCR	(_led2count + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x15F=351), size=2
	MOVIA	0x01
	SUBAR	(_led2count + 1),W
	BTRSS	STATUS,2
	MGOTO	_00329_DS_
	MOVIA	0x5f
	SUBAR	_led2count,W
_00329_DS_:
	BTRSS	STATUS,0
	MGOTO	_00240_DS_
	.line	347, "main.c"; 	stopFlag = 0;
	BANKSEL	_stopFlag
	CLRR	_stopFlag
	.line	348, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00240_DS_
_00238_DS_:
	.line	355, "main.c"; 	PORTA &= 0x6F;
	MOVIA	0x6f
	ANDAR	_PORTA,F
	.line	356, "main.c"; 	if(chrgFlag == 0 && doublePressFlag == 0 && keyCount == 0)
	BANKSEL	_chrgFlag
	MOVR	_chrgFlag,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	BANKSEL	_doublePressFlag
	MOVR	_doublePressFlag,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00240_DS_
	.line	358, "main.c"; 	if(++sleepTime > 200)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepTime,W
	BTRSC	STATUS,0
	.line	359, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
_00240_DS_:
	.line	363, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1027
;   STK00
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1028,enc=unsigned
	.debuginfo variable _time[1]=r0x1027,enc=unsigned
	.debuginfo variable _i[0]=r0x1029,enc=unsigned
	.debuginfo variable _i[1]=r0x102A,enc=unsigned
_delay:
; 2 exit points
	.line	253, "main.c"; 	void delay(u16 time)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK00,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	255, "main.c"; 	for(u16 i=0;i<time;i++);
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
_00165_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x102A
	SUBAR	r0x102A,W
	BTRSS	STATUS,2
	MGOTO	_00176_DS_
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
_00176_DS_:
	BTRSC	STATUS,0
	MGOTO	_00167_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,F
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
_00002_DS_:
	MGOTO	_00165_DS_
_00167_DS_:
	.line	256, "main.c"; 	}
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
_00158_DS_:
	.line	247, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	MGOTO	_00158_DS_
	.line	249, "main.c"; 	}
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
;   r0x102B
;   STK00
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN2_Convert
	.debuginfo subprogram _F_AIN2_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x102B,enc=unsigned
	.debuginfo variable _i=r0x102C,enc=unsigned
_F_AIN2_Convert:
; 2 exit points
	.line	229, "main.c"; 	void F_AIN2_Convert(char count)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	231, "main.c"; 	R_AIN2_DATA=R_AIN2_DATA_LB=0x00;   
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	233, "main.c"; 	ADMD  = 0x90 | C_ADC_PA2;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x92
	MOVAR	_ADMD
	.line	234, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	235, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102C
	MOVAR	r0x102C
_00151_DS_:
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BANKSEL	r0x102B
	SUBAR	r0x102B,W
	BTRSS	STATUS,0
	MGOTO	_00153_DS_
	.line	237, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	238, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	MCALL	_F_wait_eoc
	.line	239, "main.c"; 	R_AIN2_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102D
	BANKSEL	_R_AIN2_DATA_LB
	ADDAR	_R_AIN2_DATA_LB,F
	.line	240, "main.c"; 	R_AIN2_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;1	CLRR	r0x102E
;;104	MOVR	r0x102D,W
;;102	MOVAR	r0x102F
	MOVIA	0x00
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;103	MOVR	r0x102F,W
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BTRSC	STATUS,0
	INCR	r0x1030,W
	BTRSC	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
_00003_DS_:
	.line	235, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102C
	INCR	r0x102C,F
	MGOTO	_00151_DS_
_00153_DS_:
	.line	242, "main.c"; 	}
	RETURN	
; exit point of _F_AIN2_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _F_AIN2_Convert
;   _delay
;   _F_AIN2_Convert
;5 compiler assigned registers:
;   r0x1031
;   STK00
;   r0x1032
;   r0x1033
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	215, "main.c"; 	PORTA &= 0xFB;
	BCR	_PORTA,2
	.line	216, "main.c"; 	IOSTA |= 0x14;
	IOSTR	_IOSTA
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVIA	0x14
	IORAR	r0x1031,F
	MOVR	r0x1031,W
	IOST	_IOSTA
	.line	217, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	218, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	219, "main.c"; 	R_AIN2_DATA = R_AIN2_DATA_LB = 0x00;
	BANKSEL	_R_AIN2_DATA_LB
	CLRR	_R_AIN2_DATA_LB
	BANKSEL	_R_AIN2_DATA
	CLRR	_R_AIN2_DATA
	CLRR	(_R_AIN2_DATA + 1)
	.line	220, "main.c"; 	F_AIN2_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	MCALL	_F_AIN2_Convert
	.line	221, "main.c"; 	R_AIN2_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN2_DATA
	SWAPR	(_R_AIN2_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN2_DATA + 1)
	SWAPR	_R_AIN2_DATA,W
	MOVAR	_R_AIN2_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN2_DATA + 1),F
	XORAR	_R_AIN2_DATA,F
	.line	222, "main.c"; 	R_AIN2_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN2_DATA_LB
	ANDAR	_R_AIN2_DATA_LB,F
	.line	223, "main.c"; 	R_AIN2_DATA += R_AIN2_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN2_DATA_LB,W
	BANKSEL	r0x1031
	MOVAR	r0x1031
;;1	CLRR	r0x1032
;;101	MOVR	r0x1031,W
;;99	MOVAR	r0x1033
	MOVIA	0x00
	BANKSEL	r0x1034
	MOVAR	r0x1034
;;100	MOVR	r0x1033,W
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BANKSEL	_R_AIN2_DATA
	ADDAR	_R_AIN2_DATA,F
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BTRSC	STATUS,0
	INCR	r0x1034,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_R_AIN2_DATA
	ADDAR	(_R_AIN2_DATA + 1),F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
_00004_DS_:
	.line	224, "main.c"; 	R_AIN2_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN2_DATA
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
;;shiftRight_Left2ResultLit:5590: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN2_DATA + 1),F
	RRR	_R_AIN2_DATA,F
	.line	226, "main.c"; 	}
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
	.line	190, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA2 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x82
	MOVAR	_ADMD
	.line	194, "main.c"; 	ADVREFH = C_Vrefh_3V;					// ADC reference high voltage is supplied by internal 3V  (Note: ADC clock freq. must be equal or less than 500KHz)
	MOVIA	0x01
	MOVAR	_ADVREFH
	.line	200, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	202, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	205, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	206, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_delay
	.line	209, "main.c"; 	}
	RETURN	
; exit point of _initAD


;	code size estimation:
;	  758+  175 =   933 instructions ( 2216 byte)

	end
