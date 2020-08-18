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
	extern	__divuint
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
	extern	_setPWMduty
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
	extern	_sumR_AIN4_DATA
	extern	_adtime
	extern	_R_AIN4_DATA_LB
	extern	_workStep1
	extern	_workStep2
	extern	_workStep3
	extern	_batStep
	extern	_ledTime
	extern	_count500ms
	extern	_count200ms
	extern	_count276ms
	extern	_count10min
	extern	_countms
	extern	_K1Count
	extern	_K2Count
	extern	_ledCount
	extern	_ledMin
	extern	_ledMax
	extern	_ledLock
	extern	_flickerTime
	extern	_sleepDelay
	extern	_ledDuty
	extern	_firstFlag

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
_sumR_AIN4_DATA:
	.res	2
	.debuginfo gvariable name=_sumR_AIN4_DATA,2byte,array=0,entsize=2,ext=1

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
r0x103C:
	.res	1
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
r0x1038:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
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
_adtime:
	dw	0x00
	.debuginfo gvariable name=_adtime,1byte,array=0,entsize=1,ext=1


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
_count276ms:
	dw	0x00
	.debuginfo gvariable name=_count276ms,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count10min:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count10min,2byte,array=0,entsize=2,ext=1


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
_flickerTime:
	dw	0x00
	.debuginfo gvariable name=_flickerTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledDuty:
	dw	0x64
	.debuginfo gvariable name=_ledDuty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_firstFlag:
	dw	0x00
	.debuginfo gvariable name=_firstFlag,1byte,array=0,entsize=1,ext=1

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
;   _setPWMduty
;   __moduchar
;   _mode4
;   _setPWMduty
;   __moduchar
;   _mode4
;3 compiler assigned registers:
;   STK00
;   STK01
;   r0x103C
;; Starting pCode block
_isr:
; 0 exit points
	.line	75, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	77, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00121_DS_
	.line	79, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	80, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	81, "main.c"; 	if(workStep1 == 1)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	83, "main.c"; 	setPWMduty(0x04,ledDuty);
	BANKSEL	_ledDuty
	MOVR	_ledDuty,W
	MOVAR	STK00
	MOVIA	0x04
	LCALL	_setPWMduty
	LGOTO	_00109_DS_
_00108_DS_:
	.line	85, "main.c"; 	else if(workStep1 == 2)			//2档
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00109_DS_
	.line	86, "main.c"; 	LED_FLICKER();
	MOVIA	0x04
	XORAR	_PORTB,F
_00109_DS_:
	.line	87, "main.c"; 	if(intCount % 10 == 0)
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_intCount
	MOVR	_intCount,W
	LCALL	__moduchar
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	89, "main.c"; 	if(workStep2 == 4)		//4档  交替闪烁
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	XORIA	0x04
	BTRSC	STATUS,2
	.line	90, "main.c"; 	mode4();
	LCALL	_mode4
	.line	92, "main.c"; 	if(++count200ms >= 200)
	BANKSEL	_count200ms
	INCR	_count200ms,F
	MOVIA	0xc8
	SUBAR	_count200ms,W
	BTRSS	STATUS,0
	LGOTO	_00117_DS_
	.line	94, "main.c"; 	count200ms = 0;
	CLRR	_count200ms
	.line	97, "main.c"; 	if(workStep1 == 3)		//3档
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00117_DS_
	.line	98, "main.c"; 	LED_FLICKER();
	MOVIA	0x04
	XORAR	_PORTB,F
_00117_DS_:
	.line	102, "main.c"; 	if(intCount == 100)
	BANKSEL	_intCount
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00121_DS_
	.line	104, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	105, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	106, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
_00121_DS_:
	.line	109, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00123_DS_
	.line	111, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00123_DS_:
	.line	114, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	116, "main.c"; 	}
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
	.line	121, "main.c"; 	init();
	LCALL	_init
	.line	122, "main.c"; 	initAD();
	LCALL	_initAD
	.line	123, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00149_DS_:
	.line	126, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	127, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00149_DS_
	.line	129, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	130, "main.c"; 	timeCtr();
	LCALL	_timeCtr
	.line	131, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	132, "main.c"; 	ledMasterCtr();
	LCALL	_ledMasterCtr
	.line	133, "main.c"; 	ledSlaveCtr();			//侧灯控制
	LCALL	_ledSlaveCtr
	.line	134, "main.c"; 	if(PORTA & 0x04)
	BTRSS	_PORTA,2
	LGOTO	_00146_DS_
	.line	137, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	138, "main.c"; 	if(batStep != 3)
	BANKSEL	_batStep
	MOVR	_batStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	LGOTO	_00131_DS_
	.line	139, "main.c"; 	batStep = 1;
	MOVIA	0x01
	MOVAR	_batStep
_00131_DS_:
	.line	140, "main.c"; 	checkBat();
	LCALL	_checkBat
	LGOTO	_00147_DS_
_00146_DS_:
	.line	145, "main.c"; 	if(workStep1 || workStep2)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSS	STATUS,2
	LGOTO	_00136_DS_
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
_00136_DS_:
	.line	147, "main.c"; 	if(firstFlag == 0)
	BANKSEL	_firstFlag
	MOVR	_firstFlag,W
	BTRSS	STATUS,2
	LGOTO	_00138_DS_
	.line	148, "main.c"; 	checkBat();				//检测电池电压
	LCALL	_checkBat
	LGOTO	_00138_DS_
_00137_DS_:
	.line	152, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	153, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	154, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	155, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	156, "main.c"; 	LED4_OFF();
	BSR	_PORTA,6
	.line	157, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	158, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	159, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	160, "main.c"; 	if(++sleepDelay >= 200)
	BANKSEL	_sleepDelay
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	161, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00138_DS_:
	.line	163, "main.c"; 	if(batStep == 0)
	BANKSEL	_batStep
	MOVR	_batStep,W
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	.line	165, "main.c"; 	if(ledCount == 250)
	BANKSEL	_ledCount
	MOVR	_ledCount,W
	XORIA	0xfa
	BTRSS	STATUS,2
	LGOTO	_00147_DS_
	.line	166, "main.c"; 	batStep = 2;
	MOVIA	0x02
	BANKSEL	_batStep
	MOVAR	_batStep
	LGOTO	_00147_DS_
_00143_DS_:
	.line	170, "main.c"; 	batStep = 2;
	MOVIA	0x02
	BANKSEL	_batStep
	MOVAR	_batStep
_00147_DS_:
	.line	173, "main.c"; 	chrgLed();
	LCALL	_chrgLed
	LGOTO	_00149_DS_
	.line	175, "main.c"; 	}
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
	.line	743, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	746, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 4V  (Note: ADC clock freq. must be equal or less than 1MHz)
	CLRR	_ADVREFH
	.line	753, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	755, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	757, "main.c"; 	PACON = C_PA4_AIN4 ;						// 
	MOVIA	0x10
	MOVAR	_PACON
	.line	758, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	759, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	762, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1025
;   STK00
;   r0x1026
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1026
	.debuginfo variable _time[1]=r0x1025
	.debuginfo variable _i[0]=r0x1027
	.debuginfo variable _i[1]=r0x1028
_delay:
; 2 exit points
	.line	734, "main.c"; 	void delay(uint16_t time)
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK00,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	736, "main.c"; 	for(uint16_t i=0;i<time;i++);
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
_00638_DS_:
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSS	STATUS,2
	LGOTO	_00649_DS_
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
_00649_DS_:
	BTRSC	STATUS,0
	LGOTO	_00640_DS_
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1028
	INCR	r0x1028,F
_00001_DS_:
	LGOTO	_00638_DS_
_00640_DS_:
	.line	737, "main.c"; 	}
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
_00631_DS_:
	.line	730, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00631_DS_
	.line	732, "main.c"; 	}
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
;   r0x1029
;   STK00
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN4_Convert
	.debuginfo subprogram _F_AIN4_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1029
	.debuginfo variable _i=r0x102A
_F_AIN4_Convert:
; 2 exit points
	.line	710, "main.c"; 	void F_AIN4_Convert(char count)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	713, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN0(PA0) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	714, "main.c"; 	delay(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	715, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x102A
	MOVAR	r0x102A
_00624_DS_:
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	LGOTO	_00626_DS_
	.line	717, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	718, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	720, "main.c"; 	R_AIN4_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102B
	BANKSEL	_R_AIN4_DATA_LB
	ADDAR	_R_AIN4_DATA_LB,F
	.line	721, "main.c"; 	R_AIN4_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102B
	MOVAR	r0x102B
;;1	CLRR	r0x102C
;;104	MOVR	r0x102B,W
;;102	MOVAR	r0x102D
	MOVIA	0x00
	BANKSEL	r0x102E
	MOVAR	r0x102E
;;103	MOVR	r0x102D,W
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	BTRSC	STATUS,0
	INCR	r0x102E,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
_00002_DS_:
	.line	715, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x102A
	INCR	r0x102A,F
	LGOTO	_00624_DS_
_00626_DS_:
	.line	724, "main.c"; 	}
	RETURN	
; exit point of _F_AIN4_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN4_Convert
;   __divuint
;   _gotoSleep
;   _F_AIN4_Convert
;   __divuint
;   _gotoSleep
;7 compiler assigned registers:
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_checkBat
	.debuginfo subprogram _checkBat
_checkBat:
; 2 exit points
	.line	557, "main.c"; 	PACON = C_PA4_AIN4;
	MOVIA	0x10
	MOVAR	_PACON
	.line	558, "main.c"; 	R_AIN4_DATA=R_AIN4_DATA_LB=0x00;
	BANKSEL	_R_AIN4_DATA_LB
	CLRR	_R_AIN4_DATA_LB
	BANKSEL	_R_AIN4_DATA
	CLRR	_R_AIN4_DATA
	CLRR	(_R_AIN4_DATA + 1)
	.line	559, "main.c"; 	F_AIN4_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN4_Convert
	.line	560, "main.c"; 	R_AIN4_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN4_DATA
	SWAPR	(_R_AIN4_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN4_DATA + 1)
	SWAPR	_R_AIN4_DATA,W
	MOVAR	_R_AIN4_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN4_DATA + 1),F
	XORAR	_R_AIN4_DATA,F
	.line	561, "main.c"; 	R_AIN4_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN4_DATA_LB
	ANDAR	_R_AIN4_DATA_LB,F
	.line	562, "main.c"; 	R_AIN4_DATA += R_AIN4_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN4_DATA_LB,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
;;101	MOVR	r0x102F,W
;;99	MOVAR	r0x1031
	MOVIA	0x00
	BANKSEL	r0x1032
	MOVAR	r0x1032
;;100	MOVR	r0x1031,W
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	BANKSEL	_R_AIN4_DATA
	ADDAR	_R_AIN4_DATA,F
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BTRSC	STATUS,0
	INCR	r0x1032,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN4_DATA
	ADDAR	(_R_AIN4_DATA + 1),F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	563, "main.c"; 	R_AIN4_DATA >>=3;					// R_AIN0_DATA divided 8
	BCR	STATUS,0
	BANKSEL	_R_AIN4_DATA
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
;;shiftRight_Left2ResultLit:5586: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN4_DATA + 1),F
	RRR	_R_AIN4_DATA,F
	.line	566, "main.c"; 	++adtime;
	BANKSEL	_adtime
	INCR	_adtime,F
	.line	567, "main.c"; 	sumR_AIN4_DATA += R_AIN4_DATA;
	BANKSEL	_R_AIN4_DATA
	MOVR	_R_AIN4_DATA,W
	BANKSEL	_sumR_AIN4_DATA
	ADDAR	_sumR_AIN4_DATA,F
	BANKSEL	_R_AIN4_DATA
	MOVR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,0
	INCR	(_R_AIN4_DATA + 1),W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	BANKSEL	_sumR_AIN4_DATA
	ADDAR	(_sumR_AIN4_DATA + 1),F
_00004_DS_:
	.line	568, "main.c"; 	if(batStep == 0 || adtime < 5)
	BANKSEL	_batStep
	MOVR	_batStep,W
	BTRSC	STATUS,2
	LGOTO	_00445_DS_
;;unsigned compare: left < lit (0x5=5), size=1
	MOVIA	0x05
	BANKSEL	_adtime
	SUBAR	_adtime,W
	BTRSS	STATUS,0
_00445_DS_:
	.line	569, "main.c"; 	return;
	LGOTO	_00510_DS_
	.line	571, "main.c"; 	R_AIN4_DATA = sumR_AIN4_DATA/adtime;
	BANKSEL	_adtime
	MOVR	_adtime,W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BANKSEL	r0x1030
	CLRR	r0x1030
	BANKSEL	r0x102F
	MOVR	r0x102F,W
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_sumR_AIN4_DATA
	MOVR	_sumR_AIN4_DATA,W
	MOVAR	STK00
	MOVR	(_sumR_AIN4_DATA + 1),W
	LCALL	__divuint
	BANKSEL	_R_AIN4_DATA
	MOVAR	(_R_AIN4_DATA + 1)
	MOVR	STK00,W
	MOVAR	_R_AIN4_DATA
	.line	572, "main.c"; 	sumR_AIN4_DATA = adtime = 0;
	BANKSEL	_adtime
	CLRR	_adtime
	BANKSEL	_sumR_AIN4_DATA
	CLRR	_sumR_AIN4_DATA
	CLRR	(_sumR_AIN4_DATA + 1)
	.line	573, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x61C=1564), size=2
	.line	574, "main.c"; 	if(R_AIN4_DATA > 1563)			//8.4V
	MOVIA	0x06
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00594_DS_
	MOVIA	0x1c
	SUBAR	_R_AIN4_DATA,W
_00594_DS_:
	BTRSS	STATUS,0
	LGOTO	_00451_DS_
	.line	576, "main.c"; 	batStep = 3;
	MOVIA	0x03
	BANKSEL	_batStep
	MOVAR	_batStep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	578, "main.c"; 	if(ledMin <= 200)
	MOVIA	0xc9
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00451_DS_
	.line	580, "main.c"; 	ledMin = 201;
	MOVIA	0xc9
	MOVAR	_ledMin
	.line	581, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
_00451_DS_:
	.line	584, "main.c"; 	if(batStep == 1 || batStep == 3)
	BANKSEL	_batStep
	MOVR	_batStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00452_DS_
	MOVR	_batStep,W
	XORIA	0x03
	BTRSC	STATUS,2
_00452_DS_:
	.line	586, "main.c"; 	return;
	LGOTO	_00510_DS_
	.line	589, "main.c"; 	if(R_AIN4_DATA > 1490)			//8.0V
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00597_DS_
	MOVIA	0xd3
	SUBAR	_R_AIN4_DATA,W
_00597_DS_:
	BTRSS	STATUS,0
	LGOTO	_00492_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	592, "main.c"; 	if(ledMin <= 200)
	MOVIA	0xc9
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	594, "main.c"; 	ledMin = 201;
	MOVIA	0xc9
	MOVAR	_ledMin
	.line	595, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x576=1398), size=2
_00492_DS_:
	.line	598, "main.c"; 	else if(R_AIN4_DATA > 1397)			//7.5V
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00599_DS_
	MOVIA	0x76
	SUBAR	_R_AIN4_DATA,W
_00599_DS_:
	BTRSS	STATUS,0
	LGOTO	_00489_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
	.line	601, "main.c"; 	if(ledMin <= 150)
	MOVIA	0x97
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	603, "main.c"; 	ledMin = 151;
	MOVIA	0x97
	MOVAR	_ledMin
	.line	604, "main.c"; 	ledMax = 200;
	MOVIA	0xc8
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4F3=1267), size=2
_00489_DS_:
	.line	608, "main.c"; 	else if(R_AIN4_DATA > 1266)			//6.8V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00601_DS_
	MOVIA	0xf3
	SUBAR	_R_AIN4_DATA,W
_00601_DS_:
	BTRSS	STATUS,0
	LGOTO	_00486_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	.line	611, "main.c"; 	if(ledMin <= 100)
	MOVIA	0x65
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	613, "main.c"; 	ledMin = 101;
	MOVIA	0x65
	MOVAR	_ledMin
	.line	614, "main.c"; 	ledMax = 150;
	MOVIA	0x96
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45F=1119), size=2
_00486_DS_:
	.line	617, "main.c"; 	else if(R_AIN4_DATA > 1118)			//6.0V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00603_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00603_DS_:
	BTRSS	STATUS,0
	LGOTO	_00483_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
	.line	620, "main.c"; 	if(ledMin <= 50)
	MOVIA	0x33
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	622, "main.c"; 	ledMin = 51;
	MOVIA	0x33
	MOVAR	_ledMin
	.line	623, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x425=1061), size=2
_00483_DS_:
	.line	626, "main.c"; 	else if(R_AIN4_DATA > 1060)			//5.4V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00605_DS_
	MOVIA	0x25
	SUBAR	_R_AIN4_DATA,W
_00605_DS_:
	BTRSS	STATUS,0
	LGOTO	_00480_DS_
	.line	628, "main.c"; 	flickerTime = 0;
	BANKSEL	_flickerTime
	CLRR	_flickerTime
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x34=52), size=1
	.line	630, "main.c"; 	if(ledMin <= 51)
	MOVIA	0x34
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	632, "main.c"; 	ledMin = 0;
	CLRR	_ledMin
	.line	633, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3EE=1006), size=2
_00480_DS_:
	.line	636, "main.c"; 	else if(R_AIN4_DATA > 1005 && flickerTime == 0)			//5.4V
	MOVIA	0x03
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00607_DS_
	MOVIA	0xee
	SUBAR	_R_AIN4_DATA,W
_00607_DS_:
	BTRSS	STATUS,0
	LGOTO	_00476_DS_
	BANKSEL	_flickerTime
	MOVR	_flickerTime,W
	BTRSS	STATUS,2
	LGOTO	_00476_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x34=52), size=1
	.line	639, "main.c"; 	if(ledMin <= 51)
	MOVIA	0x34
	BANKSEL	_ledMin
	SUBAR	_ledMin,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	641, "main.c"; 	ledMin = 0;
	CLRR	_ledMin
	.line	642, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00493_DS_
_00476_DS_:
	.line	648, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	649, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
;;unsigned compare: left < lit (0x32=50), size=1
	.line	650, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00473_DS_
	.line	652, "main.c"; 	LED1_ON();
	BCR	_PORTB,0
	.line	653, "main.c"; 	LED2_ON();
	BCR	_PORTB,1
	.line	654, "main.c"; 	LED3_ON();
	BCR	_PORTA,7
	.line	655, "main.c"; 	LED4_ON();
	BCR	_PORTA,6
	LGOTO	_00493_DS_
;;unsigned compare: left < lit (0x64=100), size=1
_00473_DS_:
	.line	657, "main.c"; 	else if(ledCount < 100)
	MOVIA	0x64
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00470_DS_
	.line	659, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	660, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	661, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	662, "main.c"; 	LED4_OFF();	
	BSR	_PORTA,6
	LGOTO	_00493_DS_
_00470_DS_:
	.line	666, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	667, "main.c"; 	if(++flickerTime > 4)
	BANKSEL	_flickerTime
	INCR	_flickerTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_flickerTime,W
	BTRSS	STATUS,0
	LGOTO	_00493_DS_
	.line	669, "main.c"; 	flickerTime = 0;
	CLRR	_flickerTime
	.line	670, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x45F=1119), size=2
_00493_DS_:
	.line	676, "main.c"; 	if(R_AIN4_DATA > 1118)    //大于6V
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00612_DS_
	MOVIA	0x5f
	SUBAR	_R_AIN4_DATA,W
_00612_DS_:
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
;;unsigned compare: left < lit (0x4DF=1247), size=2
	.line	678, "main.c"; 	if(R_AIN4_DATA < 1247)
	MOVIA	0x04
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00613_DS_
	MOVIA	0xdf
	SUBAR	_R_AIN4_DATA,W
_00613_DS_:
	BTRSC	STATUS,0
	LGOTO	_00506_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	.line	681, "main.c"; 	if(ledMax > 100)
	MOVIA	0x65
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	683, "main.c"; 	ledMin = 51;
	MOVIA	0x33
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	684, "main.c"; 	ledMax = 100;
	MOVIA	0x64
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00510_DS_
;;unsigned compare: left < lit (0x533=1331), size=2
_00506_DS_:
	.line	687, "main.c"; 	else if(R_AIN4_DATA < 1331)
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00615_DS_
	MOVIA	0x33
	SUBAR	_R_AIN4_DATA,W
_00615_DS_:
	BTRSC	STATUS,0
	LGOTO	_00503_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
	.line	690, "main.c"; 	if(ledMax > 150)
	MOVIA	0x97
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	692, "main.c"; 	ledMin = 101;
	MOVIA	0x65
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	693, "main.c"; 	ledMax = 150;
	MOVIA	0x96
	BANKSEL	_ledMax
	MOVAR	_ledMax
	LGOTO	_00510_DS_
;;unsigned compare: left < lit (0x5BE=1470), size=2
_00503_DS_:
	.line	696, "main.c"; 	else if(R_AIN4_DATA < 1470)
	MOVIA	0x05
	BANKSEL	_R_AIN4_DATA
	SUBAR	(_R_AIN4_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00617_DS_
	MOVIA	0xbe
	SUBAR	_R_AIN4_DATA,W
_00617_DS_:
	BTRSC	STATUS,0
	LGOTO	_00510_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	.line	699, "main.c"; 	if(ledMax > 200)
	MOVIA	0xc9
	BANKSEL	_ledMax
	SUBAR	_ledMax,W
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	701, "main.c"; 	ledMin = 151;
	MOVIA	0x97
	BANKSEL	_ledMin
	MOVAR	_ledMin
	.line	702, "main.c"; 	ledMax = 200;
	MOVIA	0xc8
	BANKSEL	_ledMax
	MOVAR	_ledMax
_00510_DS_:
	.line	707, "main.c"; 	}
	RETURN	
; exit point of _checkBat

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1033
_keyRead:
; 2 exit points
	.line	517, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1033
	MOVAR	r0x1033
	.line	519, "main.c"; 	if (KeyStatus)
	MOVR	r0x1033,W
	BTRSC	STATUS,2
	LGOTO	_00438_DS_
	.line	521, "main.c"; 	keyNub = KeyStatus;
	MOVR	r0x1033,W
	BANKSEL	_keyNub
	MOVAR	_keyNub
	.line	522, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0x96=150), size=1
	.line	523, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00439_DS_
	.line	525, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	526, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00439_DS_
	.line	528, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	529, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00440_DS_
;;unsigned compare: left < lit (0x96=150), size=1
_00438_DS_:
	.line	535, "main.c"; 	if(keyCount >= 150)
	MOVIA	0x96
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00435_DS_
	.line	537, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	538, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	539, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00440_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00435_DS_:
	.line	541, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00436_DS_
	.line	543, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	544, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00440_DS_
_00436_DS_:
	.line	546, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
	.line	547, "main.c"; 	keyNub = 0;
	BANKSEL	_keyNub
	CLRR	_keyNub
_00439_DS_:
	.line	549, "main.c"; 	return 0;
	MOVIA	0x00
_00440_DS_:
	.line	550, "main.c"; 	}
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
	.line	491, "main.c"; 	switch(workStep2)
	MOVIA	0x05
	BANKSEL	_workStep2
	SUBAR	_workStep2,W
	BTRSC	STATUS,0
	LGOTO	_00417_DS_
	MOVIA	((_00423_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_workStep2,W
	ADDIA	_00423_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00423_DS_:
	LGOTO	_00411_DS_
	LGOTO	_00412_DS_
	LGOTO	_00413_DS_
	LGOTO	_00414_DS_
	LGOTO	_00415_DS_
_00411_DS_:
	.line	494, "main.c"; 	closeledSlave();
	LCALL	_closeledSlave
	.line	495, "main.c"; 	break;
	LGOTO	_00417_DS_
_00412_DS_:
	.line	497, "main.c"; 	WHITE_ON();
	BSR	_PORTA,1
	.line	498, "main.c"; 	break;
	LGOTO	_00417_DS_
_00413_DS_:
	.line	500, "main.c"; 	WHITE_OFF();
	BCR	_PORTA,1
	.line	501, "main.c"; 	BLUE_ON();
	BSR	_PORTB,4
	.line	502, "main.c"; 	break;
	LGOTO	_00417_DS_
_00414_DS_:
	.line	504, "main.c"; 	WHITE_ON();
	BSR	_PORTA,1
	.line	505, "main.c"; 	BLUE_ON();
	BSR	_PORTB,4
	.line	506, "main.c"; 	break;
	LGOTO	_00417_DS_
_00415_DS_:
	.line	508, "main.c"; 	WHITE_OFF();
	BCR	_PORTA,1
	.line	509, "main.c"; 	BLUE_OFF();
	BCR	_PORTB,4
_00417_DS_:
	.line	514, "main.c"; 	}
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
	.line	483, "main.c"; 	PORTB &= 0xC7;
	MOVIA	0xc7
	ANDAR	_PORTB,F
	.line	484, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	485, "main.c"; 	}
	RETURN	
; exit point of _closeledSlave

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_ledMasterCtr
	.debuginfo subprogram _ledMasterCtr
_ledMasterCtr:
; 0 exit points
	.line	475, "main.c"; 	if(workStep1 == 0)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSC	STATUS,2
	.line	477, "main.c"; 	LED_OFF();
	BCR	_PORTB,2
	.line	479, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1034
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	402, "main.c"; 	keyClick = keyRead(0x21&(~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	0x21
	ANDAR	r0x1034,F
	MOVR	r0x1034,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
;;unsigned compare: left < lit (0x1=1), size=1
	.line	404, "main.c"; 	if(keyClick >= 1)			//K1 K2短按
	MOVIA	0x01
	SUBAR	_keyClick,W
	BTRSS	STATUS,0
	LGOTO	_00395_DS_
	.line	406, "main.c"; 	if(keyNub == 1)
	BANKSEL	_keyNub
	MOVR	_keyNub,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00391_DS_
	.line	409, "main.c"; 	if(workStep2 == 0)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	BTRSS	STATUS,2
	LGOTO	_00376_DS_
	.line	412, "main.c"; 	workStep2 = 1;
	MOVIA	0x01
	MOVAR	_workStep2
	.line	413, "main.c"; 	K2Count = 10;		//5秒倒计时
	MOVIA	0x0a
	BANKSEL	_K2Count
	MOVAR	_K2Count
	.line	414, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	415, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	416, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
	.line	417, "main.c"; 	if(workStep1 == 0)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSS	STATUS,2
	LGOTO	_00367_DS_
	.line	418, "main.c"; 	firstFlag = 1;
	MOVIA	0x01
	BANKSEL	_firstFlag
	MOVAR	_firstFlag
;;unsigned compare: left < lit (0x32=50), size=1
_00367_DS_:
	.line	419, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00395_DS_
	.line	420, "main.c"; 	ledCount = 50;
	MOVIA	0x32
	MOVAR	_ledCount
	LGOTO	_00395_DS_
_00376_DS_:
	.line	424, "main.c"; 	if(K2Count)
	BANKSEL	_K2Count
	MOVR	_K2Count,W
	BTRSC	STATUS,2
	LGOTO	_00373_DS_
	.line	426, "main.c"; 	K2Count = 10;		//重置5秒倒计时
	MOVIA	0x0a
	MOVAR	_K2Count
	.line	427, "main.c"; 	workStep3 = 1;		//重置
	MOVIA	0x01
	BANKSEL	_workStep3
	MOVAR	_workStep3
	.line	428, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	429, "main.c"; 	ledTime = 0;
	BANKSEL	_ledTime
	CLRR	_ledTime
	.line	430, "main.c"; 	if(++workStep2 > 4)
	BANKSEL	_workStep2
	INCR	_workStep2,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	MOVIA	0x05
	SUBAR	_workStep2,W
	BTRSS	STATUS,0
	LGOTO	_00395_DS_
	.line	431, "main.c"; 	workStep2 = 0;
	CLRR	_workStep2
	LGOTO	_00395_DS_
_00373_DS_:
	.line	435, "main.c"; 	workStep2 = 0;
	BANKSEL	_workStep2
	CLRR	_workStep2
	LGOTO	_00395_DS_
_00391_DS_:
	.line	442, "main.c"; 	if(workStep1 == 0)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	BTRSS	STATUS,2
	LGOTO	_00388_DS_
	.line	444, "main.c"; 	workStep1 = 1;
	MOVIA	0x01
	MOVAR	_workStep1
	.line	445, "main.c"; 	K1Count = 10;		//5秒倒计时
	MOVIA	0x0a
	BANKSEL	_K1Count
	MOVAR	_K1Count
	.line	446, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	447, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	448, "main.c"; 	ledLock = 0;
	BANKSEL	_ledLock
	CLRR	_ledLock
	.line	449, "main.c"; 	if(workStep2 == 0)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	BTRSS	STATUS,2
	LGOTO	_00379_DS_
	.line	450, "main.c"; 	firstFlag = 1;
	MOVIA	0x01
	BANKSEL	_firstFlag
	MOVAR	_firstFlag
;;unsigned compare: left < lit (0x32=50), size=1
_00379_DS_:
	.line	451, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00395_DS_
	.line	452, "main.c"; 	ledCount = 50;
	MOVIA	0x32
	MOVAR	_ledCount
	LGOTO	_00395_DS_
_00388_DS_:
	.line	456, "main.c"; 	if(K1Count)
	BANKSEL	_K1Count
	MOVR	_K1Count,W
	BTRSC	STATUS,2
	LGOTO	_00385_DS_
	.line	458, "main.c"; 	K1Count = 10;		//重置5秒倒计时
	MOVIA	0x0a
	MOVAR	_K1Count
	.line	459, "main.c"; 	if(++workStep1 > 3)
	BANKSEL	_workStep1
	INCR	_workStep1,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep1,W
	BTRSS	STATUS,0
	LGOTO	_00395_DS_
	.line	460, "main.c"; 	workStep1 = 0;
	CLRR	_workStep1
	LGOTO	_00395_DS_
_00385_DS_:
	.line	464, "main.c"; 	workStep1 = 0;
	BANKSEL	_workStep1
	CLRR	_workStep1
_00395_DS_:
	.line	470, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1035
;   STK00
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x1035
	.debuginfo variable _duty=r0x1036
_setPWMduty:
; 2 exit points
	.line	391, "main.c"; 	void setPWMduty(char portPin,char duty)
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MOVR	STK00,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	393, "main.c"; 	if(intCount <= duty)
	BANKSEL	_intCount
	MOVR	_intCount,W
	BANKSEL	r0x1036
	SUBAR	r0x1036,W
	BTRSS	STATUS,0
	LGOTO	_00359_DS_
	.line	394, "main.c"; 	PORTB |= portPin;
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	IORAR	_PORTB,F
	LGOTO	_00361_DS_
_00359_DS_:
	.line	396, "main.c"; 	PORTB &= (~portPin);
	BANKSEL	r0x1035
	COMR	r0x1035,W
	MOVAR	r0x1035
	ANDAR	_PORTB,F
_00361_DS_:
	.line	397, "main.c"; 	}
	RETURN	
; exit point of _setPWMduty

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
;   r0x1037
;   r0x1038
;; Starting pCode block
.segment "code"; module=main, function=_mode4
	.debuginfo subprogram _mode4
_mode4:
; 2 exit points
	.line	288, "main.c"; 	if(workStep3 == 1)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00291_DS_
	.line	291, "main.c"; 	if(countms == 100)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	MOVR	(_countms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	.line	293, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	294, "main.c"; 	delay(wts);
	MOVIA	0xbc
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_delay
	.line	295, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
_00256_DS_:
	.line	301, "main.c"; 	if(countms == 500)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0xf4
	BTRSS	STATUS,2
	LGOTO	_00258_DS_
	MOVR	(_countms + 1),W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00258_DS_
	.line	303, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	304, "main.c"; 	delay(wts);
	MOVIA	0xbc
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_delay
	.line	305, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x258=600), size=2
_00258_DS_:
	.line	310, "main.c"; 	if(countms >= 600)
	MOVIA	0x02
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00346_DS_
	MOVIA	0x58
	SUBAR	_countms,W
_00346_DS_:
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
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
	LGOTO	_00292_DS_
	.line	315, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	316, "main.c"; 	workStep3 = 2;
	MOVIA	0x02
	BANKSEL	_workStep3
	MOVAR	_workStep3
	LGOTO	_00292_DS_
_00291_DS_:
	.line	320, "main.c"; 	else if(workStep3 == 2)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	.line	324, "main.c"; 	if(countms == 1)
	BANKSEL	_countms
	MOVR	_countms,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	MOVR	(_countms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	.line	326, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	327, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	328, "main.c"; 	delay(wts);
	MOVIA	0xbc
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_delay
	.line	329, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	.line	330, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x12C=300), size=2
_00264_DS_:
	.line	338, "main.c"; 	if(countms >= 300)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00348_DS_
	MOVIA	0x2c
	SUBAR	_countms,W
_00348_DS_:
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	340, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	341, "main.c"; 	if(++ledTime > 9)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledTime,W
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	343, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	344, "main.c"; 	workStep3 = 3;
	MOVIA	0x03
	BANKSEL	_workStep3
	MOVAR	_workStep3
	LGOTO	_00292_DS_
_00288_DS_:
	.line	348, "main.c"; 	else if(workStep3 == 3)
	BANKSEL	_workStep3
	MOVR	_workStep3,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00292_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x169=361), size=2
	.line	350, "main.c"; 	if(countms <= 360)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00350_DS_
	MOVIA	0x69
	SUBAR	_countms,W
_00350_DS_:
	BTRSC	STATUS,0
	LGOTO	_00279_DS_
	.line	352, "main.c"; 	if(countms % 60 == 0)
	MOVIA	0x3c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_countms
	MOVR	_countms,W
	MOVAR	STK00
	MOVR	(_countms + 1),W
	LCALL	__moduint
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1037
	IORAR	r0x1037,W
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	.line	354, "main.c"; 	YELLOW_ON();
	BSR	_PORTB,5
	.line	355, "main.c"; 	delay(wts);
	MOVIA	0xbc
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_delay
	.line	356, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	LGOTO	_00280_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
_00279_DS_:
	.line	361, "main.c"; 	else if(countms < 500)
	MOVIA	0x01
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00351_DS_
	MOVIA	0xf4
	SUBAR	_countms,W
_00351_DS_:
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	.line	363, "main.c"; 	YELLOW_OFF();
	BCR	_PORTB,5
	LGOTO	_00280_DS_
;;unsigned compare: left < lit (0x35C=860), size=2
_00276_DS_:
	.line	365, "main.c"; 	else if(countms < 860)
	MOVIA	0x03
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00352_DS_
	MOVIA	0x5c
	SUBAR	_countms,W
_00352_DS_:
	BTRSC	STATUS,0
	LGOTO	_00280_DS_
	.line	367, "main.c"; 	if(countms % 60 == 0)
	MOVIA	0x3c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_countms
	MOVR	_countms,W
	MOVAR	STK00
	MOVR	(_countms + 1),W
	LCALL	__moduint
	BANKSEL	r0x1037
	MOVAR	r0x1037
	MOVR	STK00,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1037
	IORAR	r0x1037,W
	BTRSS	STATUS,2
	LGOTO	_00280_DS_
	.line	369, "main.c"; 	RED_ON();
	BSR	_PORTB,3
	.line	370, "main.c"; 	delay(wts);
	MOVIA	0xbc
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_delay
	.line	371, "main.c"; 	RED_OFF();
	BCR	_PORTB,3
;;unsigned compare: left < lit (0x35C=860), size=2
_00280_DS_:
	.line	376, "main.c"; 	if(countms >= 860)
	MOVIA	0x03
	BANKSEL	_countms
	SUBAR	(_countms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00353_DS_
	MOVIA	0x5c
	SUBAR	_countms,W
_00353_DS_:
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	378, "main.c"; 	countms = 0;
	BANKSEL	_countms
	CLRR	_countms
	CLRR	(_countms + 1)
	.line	379, "main.c"; 	if(++ledTime > 9)
	BANKSEL	_ledTime
	INCR	_ledTime,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_ledTime,W
	BTRSS	STATUS,0
	LGOTO	_00292_DS_
	.line	381, "main.c"; 	ledTime = 0;
	CLRR	_ledTime
	.line	382, "main.c"; 	workStep3 = 1;
	MOVIA	0x01
	BANKSEL	_workStep3
	MOVAR	_workStep3
_00292_DS_:
	.line	386, "main.c"; 	++countms;
	BANKSEL	_countms
	INCR	_countms,F
	BTRSC	STATUS,2
	INCR	(_countms + 1),F
	.line	387, "main.c"; 	}
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
	.line	268, "main.c"; 	if(ledLock)
	BANKSEL	_ledLock
	MOVR	_ledLock,W
	BTRSS	STATUS,2
	.line	269, "main.c"; 	return;
	LGOTO	_00241_DS_
	.line	270, "main.c"; 	ledCount > 50 ? (LED1_ON()) : (LED1_OFF());
	MOVIA	0x33
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00243_DS_
	BCR	_PORTB,0
	LGOTO	_00244_DS_
_00243_DS_:
	BSR	_PORTB,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
_00244_DS_:
	.line	271, "main.c"; 	ledCount > 100 ? (LED2_ON()) : (LED2_OFF());
	MOVIA	0x65
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00245_DS_
	BCR	_PORTB,1
	LGOTO	_00246_DS_
_00245_DS_:
	BSR	_PORTB,1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x97=151), size=1
_00246_DS_:
	.line	272, "main.c"; 	ledCount > 150 ? (LED3_ON()) : (LED3_OFF());
	MOVIA	0x97
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00247_DS_
	BCR	_PORTA,7
	LGOTO	_00248_DS_
_00247_DS_:
	BSR	_PORTA,7
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
_00248_DS_:
	.line	273, "main.c"; 	ledCount > 200 ? (LED4_ON()) : (LED4_OFF());
	MOVIA	0xc9
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00249_DS_
	BCR	_PORTA,6
	LGOTO	_00250_DS_
_00249_DS_:
	BSR	_PORTA,6
_00250_DS_:
	.line	274, "main.c"; 	if(ledCount >= ledMax)
	BANKSEL	_ledMax
	MOVR	_ledMax,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00241_DS_
	.line	276, "main.c"; 	ledCount = ledMin;	
	BANKSEL	_ledMin
	MOVR	_ledMin,W
	BANKSEL	_ledCount
	MOVAR	_ledCount
	.line	277, "main.c"; 	firstFlag = 0;
	BANKSEL	_firstFlag
	CLRR	_firstFlag
_00241_DS_:
	.line	279, "main.c"; 	}
	RETURN	
; exit point of _chrgLed

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuint
;   __divuint
;6 compiler assigned registers:
;   r0x1039
;   r0x103A
;   STK02
;   STK01
;   STK00
;   r0x103B
;; Starting pCode block
.segment "code"; module=main, function=_timeCtr
	.debuginfo subprogram _timeCtr
_timeCtr:
; 2 exit points
	.line	238, "main.c"; 	if(++count500ms >= 50)
	BANKSEL	_count500ms
	INCR	_count500ms,F
;;unsigned compare: left < lit (0x32=50), size=1
	MOVIA	0x32
	SUBAR	_count500ms,W
	BTRSS	STATUS,0
	LGOTO	_00203_DS_
	.line	240, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	.line	241, "main.c"; 	if(K1Count)
	BANKSEL	_K1Count
	MOVR	_K1Count,W
	BTRSS	STATUS,2
	.line	242, "main.c"; 	--K1Count;
	DECR	_K1Count,F
	.line	243, "main.c"; 	if(K2Count)
	BANKSEL	_K2Count
	MOVR	_K2Count,W
	BTRSS	STATUS,2
	.line	244, "main.c"; 	--K2Count;
	DECR	_K2Count,F
	.line	245, "main.c"; 	if(workStep1 == 1)
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00200_DS_
	.line	247, "main.c"; 	ledDuty = ((1200-count10min) / 12)+50;
	BANKSEL	_count10min
	MOVR	_count10min,W
	SUBIA	0xb0
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	_count10min
	MOVR	(_count10min + 1),W
	BTRSS	STATUS,0
	INCR	(_count10min + 1),W
	SUBIA	0x04
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVIA	0x0c
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MOVAR	STK00
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	LCALL	__divuint
	BANKSEL	r0x103A
	MOVAR	r0x103A
	MOVR	STK00,W
	BANKSEL	r0x1039
	MOVAR	r0x1039
	BANKSEL	r0x103B
	MOVAR	r0x103B
	MOVIA	0x32
	ADDAR	r0x103B,W
	BANKSEL	_ledDuty
	MOVAR	_ledDuty
	.line	248, "main.c"; 	if(++count10min >= 1200)
	BANKSEL	_count10min
	INCR	_count10min,F
	BTRSC	STATUS,2
	INCR	(_count10min + 1),F
;;unsigned compare: left < lit (0x4B0=1200), size=2
	MOVIA	0x04
	SUBAR	(_count10min + 1),W
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	MOVIA	0xb0
	SUBAR	_count10min,W
_00232_DS_:
	BTRSS	STATUS,0
	LGOTO	_00203_DS_
	.line	249, "main.c"; 	count10min = 1200;
	MOVIA	0xb0
	BANKSEL	_count10min
	MOVAR	_count10min
	MOVIA	0x04
	MOVAR	(_count10min + 1)
	LGOTO	_00203_DS_
_00200_DS_:
	.line	253, "main.c"; 	count10min = 0;
	BANKSEL	_count10min
	CLRR	_count10min
	CLRR	(_count10min + 1)
_00203_DS_:
	.line	257, "main.c"; 	if(++count276ms >= 27)
	BANKSEL	_count276ms
	INCR	_count276ms,F
;;unsigned compare: left < lit (0x1B=27), size=1
	MOVIA	0x1b
	SUBAR	_count276ms,W
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
	.line	259, "main.c"; 	count276ms = 0;
	CLRR	_count276ms
	.line	260, "main.c"; 	if(workStep1 == 3)			//3档
	BANKSEL	_workStep1
	MOVR	_workStep1,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	.line	261, "main.c"; 	LED_FLICKER();
	MOVIA	0x04
	XORAR	_PORTB,F
_00208_DS_:
	.line	264, "main.c"; 	}
	RETURN	
; exit point of _timeCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	210, "main.c"; 	sleepDelay = 0;
	BANKSEL	_sleepDelay
	CLRR	_sleepDelay
	.line	211, "main.c"; 	workStep1 = 0;
	BANKSEL	_workStep1
	CLRR	_workStep1
	.line	212, "main.c"; 	workStep2 = 0;
	BANKSEL	_workStep2
	CLRR	_workStep2
	.line	213, "main.c"; 	ledLock = 1;
	MOVIA	0x01
	BANKSEL	_ledLock
	MOVAR	_ledLock
	.line	214, "main.c"; 	LED1_OFF();
	BSR	_PORTB,0
	.line	215, "main.c"; 	LED2_OFF();
	BSR	_PORTB,1
	.line	216, "main.c"; 	LED3_OFF();
	BSR	_PORTA,7
	.line	217, "main.c"; 	LED4_OFF();
	BSR	_PORTA,6
	.line	218, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	.line	219, "main.c"; 	ledMax = 250;
	MOVIA	0xfa
	BANKSEL	_ledMax
	MOVAR	_ledMax
	.line	220, "main.c"; 	ledMin = 0;
	BANKSEL	_ledMin
	CLRR	_ledMin
	.line	221, "main.c"; 	AWUCON = 0x25;		//PA5 PA0 PA2唤醒
	MOVIA	0x25
	MOVAR	_AWUCON
	.line	222, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	223, "main.c"; 	PORTB = 0x03;
	MOVIA	0x03
	MOVAR	_PORTB
	.line	224, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVAR	_INTE
	.line	225, "main.c"; 	PCON =  C_LVR_En | C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	226, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	227, "main.c"; 	CLRWDT();
	clrwdt
	.line	228, "main.c"; 	SLEEP();
	sleep
	.line	229, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	230, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	232, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	233, "main.c"; 	PCON &= 0xEF;			//PA5上拉
	BCR	_PCON,4
	.line	234, "main.c"; 	}
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
	.line	179, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	180, "main.c"; 	PORTB = 0x07;
	MOVIA	0x07
	MOVAR	_PORTB
	.line	182, "main.c"; 	IOSTA = C_PA0_Input | C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;		
	MOVIA	0x3d
	IOST	_IOSTA
	.line	183, "main.c"; 	IOSTB =  0;								// PB1输入					
	CLRA	
	IOST	_IOSTB
	.line	184, "main.c"; 	PORTA = 0xC0;
	MOVIA	0xc0
	MOVAR	_PORTA
	.line	185, "main.c"; 	PORTB = 0x07;                          	
	MOVIA	0x07
	MOVAR	_PORTB
	.line	186, "main.c"; 	APHCON = 0x7E;		//PA7打开上拉		，PA5关闭下拉
	MOVIA	0x7e
	IOST	_APHCON
	.line	191, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	192, "main.c"; 	PCON &= 0xF7;			//PA5打开上拉
	BCR	_PCON,3
	.line	193, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	194, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	197, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	199, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	200, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	202, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	204, "main.c"; 	ENI();
	ENI
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _init


;	code size estimation:
;	 1043+  238 =  1281 instructions ( 3038 byte)

	end
