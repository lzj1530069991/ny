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
	extern	__moduchar
	extern	__moduint
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
	extern	_initAD
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN4_Convert
	extern	_checkBat
	extern	_keyRead
	extern	_ledSlaveCtr
	extern	_ledMasterCtr
	extern	_keyCon
	extern	_mode4
	extern	_chrgLed
	extern	_timeCtr
	extern	_gotoSleep
	extern	_init
	extern	_isr
	extern	_main
	extern	_closeledSlave
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_longPressFlag
	extern	_keyNub
	extern	_keyCount
	extern	_R_AIN4_DATA
	extern	_R_AIN4_DATA_LB
	extern	_workStep1
	extern	_workStep2
	extern	_workStep3
	extern	_batStep
	extern	_ledTime
	extern	_count500ms
	extern	_count200ms
	extern	_countms
	extern	_K1Count
	extern	_K2Count
	extern	_ledCount
	extern	_ledMin
	extern	_ledMax
	extern	_ledLock
	extern	_ain4
	extern	_flickerTime
	extern	_sleepDelay

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
_R_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN4_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN4_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN4_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyNub:
	dw	0x00
	.debuginfo gvariable name=_keyNub,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep1:
	dw	0x00
	.debuginfo gvariable name=_workStep1,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep2:
	dw	0x00
	.debuginfo gvariable name=_workStep2,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep3:
	dw	0x00
	.debuginfo gvariable name=_workStep3,1byte,array=0,entsize=1,ext=1


.segment "idata"
_batStep:
	dw	0x00
	.debuginfo gvariable name=_batStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledTime:
	dw	0x00
	.debuginfo gvariable name=_ledTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count500ms:
	dw	0x00
	.debuginfo gvariable name=_count500ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count200ms:
	dw	0x00
	.debuginfo gvariable name=_count200ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_countms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_countms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_K1Count:
	dw	0x00
	.debuginfo gvariable name=_K1Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_K2Count:
	dw	0x00
	.debuginfo gvariable name=_K2Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMin:
	dw	0x00
	.debuginfo gvariable name=_ledMin,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledMax:
	dw	0xfa
	.debuginfo gvariable name=_ledMax,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledLock:
	dw	0x00
	.debuginfo gvariable name=_ledLock,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ain4:
	dw	0xac, 0x03
	.debuginfo gvariable name=_ain4,2byte,array=0,entsize=2,ext=1


.segment "idata"
_flickerTime:
	dw	0x00
	.debuginfo gvariable name=_flickerTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1

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
;functions called:
;   __moduchar
;   _mode4
;   __moduchar
;   __moduchar
;   _mode4
;   __moduchar
;3 compiler assigned registers:
;   STK00
;   STK01
;   r0x102D
;; Starting pCode block
_isr:
; 0 exit points
	.line	68, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	70, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00123_DS_
	.line	72, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	73, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	74, "main.c"; 	if(intCount % 10 == 0)
	MOVIA	0x0a
	MOVAR	STK00
	MOVR	_intCount,W
	LCALL	__moduchar
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	r0x102D,W
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	76, "main.c"; 	if(workStep2 == 4)		//4档  交替闪烁
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	XORIA	0x04
	BTRSC	STATUS,2
	.line	77, "main.c"; 	mode4();
	LCALL	_mode4
	.line	79, "main.c"; 	if(++count200ms >= 200)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0xc8
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00114_DS_
	.line	81, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	82, "main.c"; 	if(++ain4 >= 1600)
	BANKSEL	_ain4
	INCR	_ain4,F
	BTRSC	STATUS,2
	INCR	(_ain4 + 1),F
;;unsigned compare: left < lit (0x640=1600), size=2
	MOVIA	0x06
	SUBAR	(_ain4 + 1),W
	BTRSS	STATUS,2
	LGOTO	_00159_DS_
	MOVIA	0x40
	SUBAR	_ain4,W
_00159_DS_:
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	83, "main.c"; 	ain4 = 940;
	MOVIA	0xac
	BANKSEL	_ain4
	MOVAR	_ain4
	MOVIA	0x03
	MOVAR	(_ain4 + 1)
_00108_DS_:
	.line	84, "main.c"; 	if(workStep1 == 3)		//3档
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00115_DS_
	.line	85, "main.c"; 	LED_ON();
	BSR	_PORTB,2
	LGOTO	_00115_DS_
_00114_DS_:
	.line	89, "main.c"; 	if(workStep1 == 3)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	90, "main.c"; 	LED_OFF();
	BCR	_PORTB,2
_00115_DS_:
	.line	93, "main.c"; 	if(count200ms % 20 == 0)
	MOVIA	0x14
	MOVAR	STK00
	BANKSEL	_count200ms
	MOVR	_count200ms,W
	LCALL	__moduchar
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	r0x102D,W
	BTRSS	STATUS,2
	LGOTO	_00003_DS_
	.line	94, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
_00003_DS_:
	.line	96, "main.c"; 	if(intCount == 100)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00123_DS_
	.line	98, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	99, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00123_DS_:
	.line	102, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00125_DS_
	.line	104, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00125_DS_:
	.line	107, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	109, "main.c"; 	}
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
;   _init
;   _initAD
;   _gotoSleep
;   _timeCtr
;   _keyCon
;   _ledMasterCtr
;   _ledSlaveCtr
;   _checkBat
;   _checkBat
;   _gotoSleep
;   _chrgLed
;   _init
;   _initAD
;   _gotoSleep
;   _timeCtr
;   _keyCon
;   _ledMasterCtr
;   _ledSlaveCtr
;   _checkBat
;   _checkBat
;   _gotoSleep
;   _chrgLed
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	114, "main.c"; 	init();
	LCALL	_init
	.line	115, "main.c"; 	initAD();
	LCALL	_initAD
	.line	116, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00183_DS_:
	.line	119, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	120, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00183_DS_
	.line	122, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	123, "main.c"; 	timeCtr();
	LCALL	_timeCtr
	.line	124, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	125, "main.c"; 	ledMasterCtr();
	LCALL	_ledMasterCtr
	.line	126, "main.c"; 	ledSlaveCtr();			//侧灯控制
	LCALL	_ledSlaveCtr
	.line	127, "main.c"; 	if(PORTA & 0x04)
	BTRSS	_PORTA,2
	LGOTO	_00180_DS_
	.line	130, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	131, "main.c"; 	if(batStep != 3)
	BANKSEL	_batStep
	MOVR	_batStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	LGOTO	_00167_DS_
	.line	132, "main.c"; 	batStep = 1;
	MOVIA	0x01
	MOVAR	_batStep
_00167_DS_:
	.line	133, "main.c"; 	checkBat();
	LCALL	_checkBat
	LGOTO	_00181_DS_
_00180_DS_:
	.line	138, "main.c"; 	if(workStep1 || workStep2)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSS	STATUS,2
	LGOTO	_00170_DS_
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	BTRSC	STATUS,2
	LGOTO	_00171_DS_
_00170_DS_:
	.line	139, "main.c"; 	checkBat();				//检测电池电压
	LCALL	_checkBat
	LGOTO	_00172_DS_
_00171_DS_:
	.line	142, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	143, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	144, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	145, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	146, "main.c"; 	LED4_OFF();
	BSR	_PORTA,6
	.line	147, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	148, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	149, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	150, "main.c"; 	if(++sleepDelay >= 200)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	151, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00172_DS_:
	.line	153, "main.c"; 	if(batStep == 0)
	BANKSEL	_batStep
	MOVR	_batStep,W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	.line	155, "main.c"; 	if(ledCount == 250)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0xfa
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	.line	156, "main.c"; 	batStep = 2;
	MOVIA	0x02
	BANKSEL	_batStep
	MOVAR	_batStep
	LGOTO	_00181_DS_
_00177_DS_:
	.line	160, "main.c"; 	batStep = 2;
	MOVIA	0x02
	BANKSEL	_batStep
	MOVAR	_batStep
_00181_DS_:
	.line	163, "main.c"; 	chrgLed();
	LCALL	_chrgLed
	LGOTO	_00183_DS_
	.line	165, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.line	681, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	684, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	691, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	693, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	695, "main.c"; 	PACON = C_PA4_AIN4 ;						// 
	MOVIA	0x10
	MOVAR	_PACON
	.line	696, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	697, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	700, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1020
	.debuginfo variable _time[1]=r0x101F
	.debuginfo variable _i[0]=r0x1021
	.debuginfo variable _i[1]=r0x1022
_delay:
; 2 exit points
	.line	672, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK00,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	674, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1021
	CLRR	r0x1021
	BANKSEL	r0x1022
	CLRR	r0x1022
_00611_DS_:
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BANKSEL	r0x1022
	SUBAR	r0x1022,W
	BTRSS	STATUS,2
	LGOTO	_00622_DS_
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	r0x1021
	SUBAR	r0x1021,W
_00622_DS_:
	BTRSC	STATUS,0
	LGOTO	_00613_DS_
	BANKSEL	r0x1021
	INCR	r0x1021,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1022
	INCR	r0x1022,F
_00001_DS_:
	LGOTO	_00611_DS_
_00613_DS_:
	.line	675, "main.c"; 	}
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
_00604_DS_:
	.line	668, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00604_DS_
	.line	670, "main.c"; 	}
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
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1023
	.debuginfo variable _i=r0x1024
_F_AIN4_Convert:
; 2 exit points
	.line	647, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	650, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	651, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	652, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1024
	MOVAR	r0x1024
_00597_DS_:
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1023
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	LGOTO	_00599_DS_
	.line	654, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	655, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	656, "main.c"; 	if(i>4)
	MOVIA	0x05
	BANKSEL	r0x1024
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	LGOTO	_00002_DS_
	.line	658, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x1025
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	659, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
;;1	CLRR	r0x1026
;;101	MOVR	r0x1025,W
;;99	MOVAR	r0x1027
	MOVIA	0x00
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;100	MOVR	r0x1027,W
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,0
	INCR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	652, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
	LGOTO	_00597_DS_
_00599_DS_:
	.line	662, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   _gotoSleep
;   _F_AIN4_Convert
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	510, "main.c"; 	PACON = C_PA4_AIN4;
	MOVIA	0x10
	MOVAR	_PACON
	.line	511, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	512, "main.c"; 	F_AIN4_Convert(12);					// execute AIN0 ADC converting 8 times
	MOVIA	0x0c
	LCALL	_F_AIN4_Convert
	.line	514, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	517, "main.c"; 	R_AIN4_DATA = ain4;
	BANKSEL	_ain4
	MOVR	_ain4,W
	BANKSEL	_R_AIN4_DATA
	MOVAR	_R_AIN4_DATA
	BANKSEL	_ain4
	MOVR	(_ain4 + 1),W
	BANKSEL	_R_AIN4_DATA
	MOVAR	(_R_AIN4_DATA + 1)
	.line	518, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
	.line	519, "main.c"; 	if(batStep == 0)
	BANKSEL	_batStep
	MOVR	_batStep,W
	BTRSC	STATUS,2
	.line	520, "main.c"; 	return;
	LGOTO	_00493_DS_
	.line	521, "main.c"; 	if(R_AIN4_DATA > 1563)			//8.4V
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00567_DS_
	MOVIA	0x1c
	SUBAR	_R_AIN4_DATA,W
_00567_DS_:
	BTRSS	STATUS,0
	LGOTO	_00440_DS_
	.line	523, "main.c"; 	batStep = 3;
	MOVIA	0x03
	BANKSEL	_batStep
	MOVAR	_batStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	525, "main.c"; 	if(ledMin <= 200)
	MOVIA	0xc9
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00440_DS_
	.line	527, "main.c"; 	ledMin = 201;
	MOVIA	0xc9
	MOVAR	_ledMin
	.line	528, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
_00440_DS_:
	.line	531, "main.c"; 	if(batStep == 1 || batStep == 3)
	BANKSEL	_batStep
	MOVR	_batStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00441_DS_
	MOVR	_batStep,W
	XORIA	0x03
	BTRSC	STATUS,2
_00441_DS_:
	.line	533, "main.c"; 	return;
	LGOTO	_00493_DS_
	.line	536, "main.c"; 	if(R_AIN4_DATA > 1490)			//8.0V
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00570_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00570_DS_:
	BTRSS	STATUS,0
	LGOTO	_00475_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	539, "main.c"; 	if(ledMin <= 200)
	MOVIA	0xc9
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00476_DS_
	.line	541, "main.c"; 	ledMin = 201;
	MOVIA	0xc9
	MOVAR	_ledMin
	.line	542, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x576=1398), size=2
_00475_DS_:
	.line	545, "main.c"; 	else if(R_AIN4_DATA > 1397)			//7.5V
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00572_DS_
	MOVIA	0x76
	SUBAR	_R_AIN4_DATA,W
_00572_DS_:
	BTRSS	STATUS,0
	LGOTO	_00472_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
	.line	548, "main.c"; 	if(ledMin <= 150)
	MOVIA	0x97
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00476_DS_
	.line	550, "main.c"; 	ledMin = 151;
	MOVIA	0x97
	MOVAR	_ledMin
	.line	551, "main.c"; 	ledMax = 200;
	MOVIA	0xc8
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F3=1267), size=2
_00472_DS_:
	.line	555, "main.c"; 	else if(R_AIN4_DATA > 1266)			//6.8V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00574_DS_
	MOVIA	0xf3
	SUBAR	_R_AIN4_DATA,W
_00574_DS_:
	BTRSS	STATUS,0
	LGOTO	_00469_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	.line	558, "main.c"; 	if(ledMin <= 100)
	MOVIA	0x65
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00476_DS_
	.line	560, "main.c"; 	ledMin = 101;
	MOVIA	0x65
	MOVAR	_ledMin
	.line	561, "main.c"; 	ledMax = 150;
	MOVIA	0x96
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45F=1119), size=2
_00469_DS_:
	.line	564, "main.c"; 	else if(R_AIN4_DATA > 1118)			//6.0V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00576_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00576_DS_:
	BTRSS	STATUS,0
	LGOTO	_00466_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	567, "main.c"; 	if(ledMin <= 50)
	MOVIA	0x33
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00476_DS_
	.line	569, "main.c"; 	ledMin = 51;
	MOVIA	0x33
	MOVAR	_ledMin
	.line	570, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3EE=1006), size=2
_00466_DS_:
	.line	573, "main.c"; 	else if(R_AIN4_DATA > 1005)			//5.4V
	MOVIA	0x03
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00578_DS_
	MOVIA	0xee
	SUBAR	_R_AIN4_DATA,W
_00578_DS_:
	BTRSS	STATUS,0
	LGOTO	_00463_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x34=52), size=1
	.line	576, "main.c"; 	if(ledMin <= 51)
	MOVIA	0x34
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00476_DS_
	.line	578, "main.c"; 	ledMin = 0;
	CLRR	_ledMin
	.line	579, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00476_DS_
_00463_DS_:
	.line	585, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	586, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
;;unsigned compare: left < lit (0x32=50), size=1
	.line	587, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00460_DS_
	.line	589, "main.c"; 	LED1_ON();
	BCR	_PORTB,0
	.line	590, "main.c"; 	LED2_ON();
	BCR	_PORTB,1
	.line	591, "main.c"; 	LED3_ON();
	BCR	_PORTA,7
	.line	592, "main.c"; 	LED4_ON();
	BCR	_PORTA,6
	LGOTO	_00476_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00460_DS_:
	.line	594, "main.c"; 	else if(ledCount < 100)
	MOVIA	0x64
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00457_DS_
	.line	596, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	597, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	598, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	599, "main.c"; 	LED4_OFF();	
	BSR	_PORTA,6
	LGOTO	_00476_DS_
_00457_DS_:
	.line	603, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	604, "main.c"; 	if(++flickerTime > 3)
	BANKSEL	_flickerTime
	INCR	_flickerTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_flickerTime,W
	BTRSS	STATUS,0
	LGOTO	_00476_DS_
	.line	606, "main.c"; 	flickerTime = 0;
	CLRR	_flickerTime
	.line	607, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45F=1119), size=2
_00476_DS_:
	.line	613, "main.c"; 	if(R_AIN4_DATA > 1118)    //大于6V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00583_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00583_DS_:
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
;;unsigned compare: left < lit (0x4DF=1247), size=2
	.line	615, "main.c"; 	if(R_AIN4_DATA < 1247)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00584_DS_
	MOVIA	0xdf
	SUBAR	_R_AIN4_DATA,W
_00584_DS_:
	BTRSC	STATUS,0
	LGOTO	_00489_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	.line	618, "main.c"; 	if(ledMax > 100)
	MOVIA	0x65
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
	.line	620, "main.c"; 	ledMin = 51;
	MOVIA	0x33
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	621, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;unsigned compare: left < lit (0x533=1331), size=2
_00489_DS_:
	.line	624, "main.c"; 	else if(R_AIN4_DATA < 1331)
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00586_DS_
	MOVIA	0x33
	SUBAR	_R_AIN4_DATA,W
_00586_DS_:
	BTRSC	STATUS,0
	LGOTO	_00486_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
	.line	627, "main.c"; 	if(ledMax > 150)
	MOVIA	0x97
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
	.line	629, "main.c"; 	ledMin = 101;
	MOVIA	0x65
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	630, "main.c"; 	ledMax = 150;
	MOVIA	0x96
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;unsigned compare: left < lit (0x5BE=1470), size=2
_00486_DS_:
	.line	633, "main.c"; 	else if(R_AIN4_DATA < 1470)
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00588_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN4_DATA,W
_00588_DS_:
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	636, "main.c"; 	if(ledMax > 200)
	MOVIA	0xc9
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
	.line	638, "main.c"; 	ledMin = 151;
	MOVIA	0x97
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	639, "main.c"; 	ledMax = 200;
	MOVIA	0xc8
	BANKSEL	_ledMax
	MOVAR	_ledMax
_00493_DS_:
	.line	644, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1029
_keyRead:
; 2 exit points
	.line	470, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	472, "main.c"; 	if (KeyStatus)
	MOVR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00428_DS_
	.line	474, "main.c"; 	keyNub = KeyStatus;
	MOVR	r0x1029,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
	.line	475, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	.line	476, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00429_DS_
	.line	478, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	479, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00429_DS_
	.line	481, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	482, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00430_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00428_DS_:
	.line	488, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00425_DS_
	.line	490, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	491, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	492, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00430_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00425_DS_:
	.line	494, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00426_DS_
	.line	496, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	497, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00430_DS_
_00426_DS_:
	.line	499, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	.line	500, "main.c"; 	keyNub = 0;
	BANKSEL	_keyNub
	CLRR	_keyNub
_00429_DS_:
	.line	502, "main.c"; 	return 0;
	MOVIA	0x00
_00430_DS_:
	.line	503, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _closeledSlave
;   _closeledSlave
;; Starting pCode block
.segment "code"; module=main, function=_ledSlaveCtr
	.debuginfo subprogram _ledSlaveCtr
_ledSlaveCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	448, "main.c"; 	switch(workStep2)
	MOVIA	0x05
	BANKSEL	_workStep2
	SUBAR	_workStep2,W
	BTRSC	STATUS,0
	LGOTO	_00407_DS_
	MOVIA	((_00413_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep2,W
	ADDIA	_00413_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00413_DS_:
	LGOTO	_00401_DS_
	LGOTO	_00402_DS_
	LGOTO	_00403_DS_
	LGOTO	_00404_DS_
	LGOTO	_00407_DS_
_00401_DS_:
	.line	451, "main.c"; 	closeledSlave();
	LCALL	_closeledSlave
	.line	452, "main.c"; 	break;
	LGOTO	_00407_DS_
_00402_DS_:
	.line	454, "main.c"; 	WHITE_ON();
	BSR	_PORTA,1
	.line	455, "main.c"; 	break;
	LGOTO	_00407_DS_
_00403_DS_:
	.line	457, "main.c"; 	WHITE_OFF();
	BCR	_PORTA,1
	.line	458, "main.c"; 	BLUE_ON();
	BSR	_PORTB,4
	.line	459, "main.c"; 	break;
	LGOTO	_00407_DS_
_00404_DS_:
	.line	461, "main.c"; 	WHITE_ON();
	BSR	_PORTA,1
	.line	462, "main.c"; 	BLUE_ON();
	BSR	_PORTB,4
_00407_DS_:
	.line	467, "main.c"; 	}
	RETURN	
; exit point of _ledSlaveCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_closeledSlave
	.debuginfo subprogram _closeledSlave
_closeledSlave:
; 2 exit points
	.line	440, "main.c"; 	PORTB &= 0xC7;
	MOVIA	0xc7
	ANDAR	_PORTB,F
	.line	441, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	442, "main.c"; 	}
	RETURN	
; exit point of _closeledSlave

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledMasterCtr
	.debuginfo subprogram _ledMasterCtr
_ledMasterCtr:
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	424, "main.c"; 	switch(workStep1)
	MOVIA	0x03
	BANKSEL	_workStep1
	SUBAR	_workStep1,W
	BTRSC	STATUS,0
	LGOTO	_00386_DS_
	MOVIA	((_00392_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep1,W
	ADDIA	_00392_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00392_DS_:
	LGOTO	_00382_DS_
	LGOTO	_00383_DS_
	LGOTO	_00384_DS_
_00382_DS_:
	.line	427, "main.c"; 	LED_OFF();
	BCR	_PORTB,2
	.line	428, "main.c"; 	break;
	LGOTO	_00386_DS_
_00383_DS_:
	.line	430, "main.c"; 	LED_ON();
	BSR	_PORTB,2
	.line	431, "main.c"; 	break;
	LGOTO	_00386_DS_
_00384_DS_:
	.line	433, "main.c"; 	LED_FLICKER();
	MOVIA	0x04
	XORAR	_PORTB,F
_00386_DS_:
	.line	436, "main.c"; 	}
	RETURN	
; exit point of _ledMasterCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	365, "main.c"; 	keyClick = keyRead(0x21&(~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	0x21
	ANDAR	r0x102A,F
	MOVR	r0x102A,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
;;unsigned compare: left < lit (0x1=1), size=1
	.line	367, "main.c"; 	if(keyClick >= 1)			//K1 K2短按
	MOVIA	0x01
	SUBAR	_keyClick,W
	BTRSS	STATUS,0
	LGOTO	_00377_DS_
	.line	369, "main.c"; 	if(keyNub == 1)
	BANKSEL	_keyNub
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00373_DS_
	.line	372, "main.c"; 	if(workStep2 == 0)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	BTRSS	STATUS,2
	LGOTO	_00362_DS_
	.line	375, "main.c"; 	workStep2 = 1;
	MOVIA	0x01
	MOVAR	_workStep2
	.line	376, "main.c"; 	K2Count = 10;		//5秒倒计时
	MOVIA	0x0a
	BANKSEL	_K2Count
	MOVAR	_K2Count
	LGOTO	_00377_DS_
_00362_DS_:
	.line	380, "main.c"; 	if(K2Count)
	BANKSEL	_K2Count
	MOVR	_K2Count,W
	BTRSC	STATUS,2
	LGOTO	_00359_DS_
	.line	382, "main.c"; 	K2Count = 10;		//重置5秒倒计时
	MOVIA	0x0a
	MOVAR	_K2Count
	.line	383, "main.c"; 	workStep3 = 1;		//重置
	MOVIA	0x01
	BANKSEL	_workStep3
	MOVAR	_workStep3
	.line	384, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	385, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	386, "main.c"; 	if(++workStep2 > 4)
	BANKSEL	_workStep2
	INCR	_workStep2,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep2,W
	BTRSS	STATUS,0
	LGOTO	_00377_DS_
	.line	387, "main.c"; 	workStep2 = 0;
	CLRR	_workStep2
	LGOTO	_00377_DS_
_00359_DS_:
	.line	391, "main.c"; 	workStep2 = 0;
	BANKSEL	_workStep2
	CLRR	_workStep2
	LGOTO	_00377_DS_
_00373_DS_:
	.line	398, "main.c"; 	if(workStep1 == 0)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSS	STATUS,2
	LGOTO	_00370_DS_
	.line	400, "main.c"; 	workStep1 = 1;
	MOVIA	0x01
	MOVAR	_workStep1
	.line	401, "main.c"; 	K1Count = 10;		//5秒倒计时
	MOVIA	0x0a
	BANKSEL	_K1Count
	MOVAR	_K1Count
	LGOTO	_00377_DS_
_00370_DS_:
	.line	405, "main.c"; 	if(K1Count)
	BANKSEL	_K1Count
	MOVR	_K1Count,W
	BTRSC	STATUS,2
	LGOTO	_00367_DS_
	.line	407, "main.c"; 	K1Count = 10;		//重置5秒倒计时
	MOVIA	0x0a
	MOVAR	_K1Count
	.line	408, "main.c"; 	if(++workStep1 > 3)
	BANKSEL	_workStep1
	INCR	_workStep1,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep1,W
	BTRSS	STATUS,0
	LGOTO	_00377_DS_
	.line	409, "main.c"; 	workStep1 = 0;
	CLRR	_workStep1
	LGOTO	_00377_DS_
_00367_DS_:
	.line	413, "main.c"; 	workStep1 = 0;
	BANKSEL	_workStep1
	CLRR	_workStep1
_00377_DS_:
	.line	419, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   __moduint
;   _delay
;   __moduint
;   _delay
;   _delay
;   _delay
;   _delay
;   __moduint
;   _delay
;   __moduint
;   _delay
;5 compiler assigned registers:
;   STK00
;   STK02
;   STK01
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_mode4
	.debuginfo subprogram _mode4
_mode4:
; 2 exit points
	.line	260, "main.c"; 	if(workStep3 == 1)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00289_DS_
	.line	263, "main.c"; 	if(countms == 100)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	MOVR	(_countms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	.line	265, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	266, "main.c"; 	delay(wts);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	267, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
_00254_DS_:
	.line	273, "main.c"; 	if(countms == 500)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0xf4
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	MOVR	(_countms + 1),W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	.line	275, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	276, "main.c"; 	delay(wts);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	277, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x258=600), size=2
_00256_DS_:
	.line	282, "main.c"; 	if(countms >= 600)
	MOVIA	0x02
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	MOVIA	0x58
	SUBAR	_countms,W
_00344_DS_:
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	284, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	285, "main.c"; 	if(++ledTime > 9)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledTime,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	287, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	288, "main.c"; 	workStep3 = 2;
	MOVIA	0x02
	BANKSEL	_workStep3
	MOVAR	_workStep3
	LGOTO	_00290_DS_
_00289_DS_:
	.line	292, "main.c"; 	else if(workStep3 == 2)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	.line	296, "main.c"; 	if(countms == 1)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	MOVR	(_countms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	.line	298, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	299, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	300, "main.c"; 	delay(wts);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	301, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	.line	302, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x12C=300), size=2
_00262_DS_:
	.line	310, "main.c"; 	if(countms >= 300)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00346_DS_
	MOVIA	0x2c
	SUBAR	_countms,W
_00346_DS_:
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	312, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	313, "main.c"; 	if(++ledTime > 9)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledTime,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	315, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	316, "main.c"; 	workStep3 = 3;
	MOVIA	0x03
	BANKSEL	_workStep3
	MOVAR	_workStep3
	LGOTO	_00290_DS_
_00286_DS_:
	.line	320, "main.c"; 	else if(workStep3 == 3)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00290_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x169=361), size=2
	.line	322, "main.c"; 	if(countms <= 360)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00348_DS_
	MOVIA	0x69
	SUBAR	_countms,W
_00348_DS_:
	BTRSC	STATUS,0
	LGOTO	_00277_DS_
	.line	324, "main.c"; 	if(countms % 60 == 0)
	MOVIA	0x3c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_countms
	MOVR	_countms,W
	MOVAR	STK00
	MOVR	(_countms + 1),W
	LCALL	__moduint
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK00,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	IORAR	r0x102B,W
	BTRSS	STATUS,2
	LGOTO	_00278_DS_
	.line	326, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	327, "main.c"; 	delay(wts);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	328, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	LGOTO	_00278_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
_00277_DS_:
	.line	333, "main.c"; 	else if(countms < 500)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00349_DS_
	MOVIA	0xf4
	SUBAR	_countms,W
_00349_DS_:
	BTRSC	STATUS,0
	LGOTO	_00274_DS_
	.line	335, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	LGOTO	_00278_DS_
;;unsigned compare: left < lit (0x35C=860), size=2
_00274_DS_:
	.line	337, "main.c"; 	else if(countms < 860)
	MOVIA	0x03
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00350_DS_
	MOVIA	0x5c
	SUBAR	_countms,W
_00350_DS_:
	BTRSC	STATUS,0
	LGOTO	_00278_DS_
	.line	339, "main.c"; 	if(countms % 60 == 0)
	MOVIA	0x3c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_countms
	MOVR	_countms,W
	MOVAR	STK00
	MOVR	(_countms + 1),W
	LCALL	__moduint
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	STK00,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BANKSEL	r0x102B
	IORAR	r0x102B,W
	BTRSS	STATUS,2
	LGOTO	_00278_DS_
	.line	341, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	342, "main.c"; 	delay(wts);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	343, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x35C=860), size=2
_00278_DS_:
	.line	348, "main.c"; 	if(countms >= 860)
	MOVIA	0x03
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00351_DS_
	MOVIA	0x5c
	SUBAR	_countms,W
_00351_DS_:
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	350, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	351, "main.c"; 	if(++ledTime > 9)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledTime,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	353, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	354, "main.c"; 	workStep3 = 1;
	MOVIA	0x01
	BANKSEL	_workStep3
	MOVAR	_workStep3
_00290_DS_:
	.line	358, "main.c"; 	++countms;
	BANKSEL	_countms
	INCR	_countms,F
	BTRSC	STATUS,2
	INCR	(_countms + 1),F
	.line	359, "main.c"; 	}
	RETURN	
; exit point of _mode4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_chrgLed
	.debuginfo subprogram _chrgLed
_chrgLed:
; 2 exit points
	.line	241, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	242, "main.c"; 	return;
	LGOTO	_00239_DS_
	.line	243, "main.c"; 	ledCount > 50 ? (LED1_ON()) : (LED1_OFF());
	MOVIA	0x33
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00241_DS_
	BCR	_PORTB,0
	LGOTO	_00242_DS_
_00241_DS_:
	BSR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
_00242_DS_:
	.line	244, "main.c"; 	ledCount > 100 ? (LED2_ON()) : (LED2_OFF());
	MOVIA	0x65
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00243_DS_
	BCR	_PORTB,1
	LGOTO	_00244_DS_
_00243_DS_:
	BSR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
_00244_DS_:
	.line	245, "main.c"; 	ledCount > 150 ? (LED3_ON()) : (LED3_OFF());
	MOVIA	0x97
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00245_DS_
	BCR	_PORTA,7
	LGOTO	_00246_DS_
_00245_DS_:
	BSR	_PORTA,7
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
_00246_DS_:
	.line	246, "main.c"; 	ledCount > 200 ? (LED4_ON()) : (LED4_OFF());
	MOVIA	0xc9
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00247_DS_
	BCR	_PORTA,6
	LGOTO	_00248_DS_
_00247_DS_:
	BSR	_PORTA,6
_00248_DS_:
	.line	247, "main.c"; 	if(ledCount >= ledMax)
	BANKSEL	_ledMax
	MOVR	_ledMax,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00239_DS_
	.line	249, "main.c"; 	ledCount = ledMin;		
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
_00239_DS_:
	.line	251, "main.c"; 	}
	RETURN	
; exit point of _chrgLed

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_timeCtr
	.debuginfo subprogram _timeCtr
_timeCtr:
; 0 exit points
	.line	228, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00230_DS_
	.line	230, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	231, "main.c"; 	if(K1Count)
	BANKSEL	_K1Count
	MOVR	_K1Count,W
	BTRSS	STATUS,2
	.line	232, "main.c"; 	--K1Count;
	DECR	_K1Count,F
	.line	233, "main.c"; 	if(K2Count)
	BANKSEL	_K2Count
	MOVR	_K2Count,W
	BTRSS	STATUS,2
	.line	234, "main.c"; 	--K2Count;
	DECR	_K2Count,F
_00230_DS_:
	.line	237, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	200, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	201, "main.c"; 	workStep1 = 0;
	BANKSEL	_workStep1
	CLRR	_workStep1
	.line	202, "main.c"; 	workStep2 = 0;
	BANKSEL	_workStep2
	CLRR	_workStep2
	.line	203, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	204, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	205, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	206, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	207, "main.c"; 	LED4_OFF();
	BSR	_PORTA,6
	.line	208, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	209, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	210, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	211, "main.c"; 	AWUCON = 0x25;		//PA5 PA0 PA2唤醒
	MOVIA	0x25
	MOVAR	_AWUCON
	.line	212, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	213, "main.c"; 	PORTB = 0x07;
	MOVIA	0x07
	MOVAR	_PORTB
	.line	214, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	215, "main.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	216, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	217, "main.c"; 	CLRWDT();
	clrwdt
	.line	218, "main.c"; 	SLEEP();
	sleep
	.line	219, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	220, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	222, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	223, "main.c"; 	PCON &= 0xEF;			//PA5上拉
	BCR	_PCON,4
	.line	224, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	169, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	170, "main.c"; 	PORTB = 0x07;
	MOVIA	0x07
	MOVAR	_PORTB
	.line	172, "main.c"; 	IOSTA = C_PA0_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;		
	MOVIA	0x3d
	IOST	_IOSTA
	.line	173, "main.c"; 	IOSTB =  0;								// PB1输入					
	CLRA	
	IOST	_IOSTB
	.line	174, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	175, "main.c"; 	PORTB = 0x07;                          	
	MOVIA	0x07
	MOVAR	_PORTB
	.line	176, "main.c"; 	APHCON = 0x7E;		//PA7打开上拉		，PA5关闭下拉
	MOVIA	0x7e
	IOST	_APHCON
	.line	181, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	182, "main.c"; 	PCON &= 0xF7;			//PA5打开上拉
	BCR	_PCON,3
	.line	183, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	184, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	187, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	189, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	190, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	192, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	194, "main.c"; 	ENI();
	ENI
	.line	195, "main.c"; 	}
	RETURN	
; exit point of _init


;	code size estimation:
;	  893+  180 =  1073 instructions ( 2506 byte)

	end
