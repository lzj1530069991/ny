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
	extern	_showNub
	extern	_setHightOutput
	extern	_setlowOutput
	extern	_setOutput
	extern	_setInput
	extern	_showNubGewei
	extern	_showNubGewei2
	extern	_showNubShiwei
	extern	_showNubShiwei2
	extern	_showBaiwei
	extern	_B1
	extern	_C1
	extern	_A2
	extern	_B2
	extern	_C2
	extern	_D2
	extern	_E2
	extern	_F2
	extern	_G2
	extern	_A3
	extern	_B3
	extern	_C3
	extern	_D3
	extern	_E3
	extern	_F3
	extern	_G3
	extern	_HIGHT
	extern	_MEDIUM
	extern	_LOW
	extern	_MIN
	extern	_delayms
	extern	__divuchar
	extern	__moduchar
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_keyCon
	extern	_keyRead2
	extern	_keyRead
	extern	_gotoSleep
	extern	_delay
	extern	_F_wait_eoc
	extern	_F_AIN5_Convert
	extern	_checkMaxAD
	extern	_initAD
	extern	_setPWMduty
	extern	_refreshNub
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_numArray
	extern	_tempshiweiNum
	extern	_tempgeweiNum
	extern	_refreshCount
	extern	_shiweiNum
	extern	_geweiNum
	extern	_overLoadTime
	extern	_workStep
	extern	_workStep2
	extern	_duty
	extern	_ledCount
	extern	_min
	extern	_second
	extern	_longPressFlag
	extern	_keyCount
	extern	_keyCount2
	extern	_keyClick
	extern	_R_AIN5_DATA
	extern	_R_AIN5_DATA_LB

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
.segment "uninit"
_R_AIN5_DATA:
	.res	2
	.debuginfo gvariable name=_R_AIN5_DATA,2byte,array=0,entsize=2,ext=1

.segment "uninit"
_R_AIN5_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN5_DATA_LB,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
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
_numArray:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x67
	.debuginfo gvariable name=_numArray,10byte,array=1,entsize=1,ext=1


.segment "idata"
_tempshiweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempshiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_tempgeweiNum:
	dw	0x00
	.debuginfo gvariable name=_tempgeweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_refreshCount:
	dw	0x00
	.debuginfo gvariable name=_refreshCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_shiweiNum:
	dw	0x00
	.debuginfo gvariable name=_shiweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_geweiNum:
	dw	0x00
	.debuginfo gvariable name=_geweiNum,1byte,array=0,entsize=1,ext=1


.segment "idata"
_overLoadTime:
	dw	0x00
	.debuginfo gvariable name=_overLoadTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep2:
	dw	0x00
	.debuginfo gvariable name=_workStep2,1byte,array=0,entsize=1,ext=1


.segment "idata"
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_min:
	dw	0x00
	.debuginfo gvariable name=_min,1byte,array=0,entsize=1,ext=1


.segment "idata"
_second:
	dw	0x00
	.debuginfo gvariable name=_second,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount2:
	dw	0x00
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1

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
;   _setPWMduty
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
	LGOTO	_00110_DS_
	.line	49, "main.c"; 	TMR0 += 58;
	MOVIA	0x3a
	ADDAR	_TMR0,F
	.line	50, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	51, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00110_DS_
	.line	53, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	54, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	55, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
	.line	56, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00110_DS_
	.line	57, "main.c"; 	setPWMduty(0x08,duty);
	BANKSEL	_duty
	MOVR	_duty,W
	MOVAR	STK00
	MOVIA	0x08
	LCALL	_setPWMduty
_00110_DS_:
	.line	60, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00112_DS_
	.line	62, "main.c"; 	INTF = 0;
	CLRR	_INTF
_00112_DS_:
	.line	65, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00114_DS_
	.line	67, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	_INTF
_00114_DS_:
	.line	70, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	72, "main.c"; 	}
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
;   _refreshNub
;   _checkMaxAD
;   _keyCon
;   __divuchar
;   __moduchar
;   _gotoSleep
;   _initAD
;   _refreshNub
;   _checkMaxAD
;   _keyCon
;   __divuchar
;   __moduchar
;   _gotoSleep
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	76, "main.c"; 	DISI();
	DISI
	.line	77, "main.c"; 	IOSTA = C_PA3_Input;
	MOVIA	0x08
	IOST	_IOSTA
	.line	78, "main.c"; 	IOSTB = C_PB1_Input;
	MOVIA	0x02
	IOST	_IOSTB
	.line	79, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	80, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	81, "main.c"; 	APHCON = 0xF7;
	MOVIA	0xf7
	IOST	_APHCON
	.line	82, "main.c"; 	BPHCON = 0xFD;
	MOVIA	0xfd
	MOVAR	_BPHCON
	.line	84, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	86, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	88, "main.c"; 	TMR0 = 58;
	MOVIA	0x3a
	MOVAR	_TMR0
	.line	89, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	91, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	93, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	96, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	97, "main.c"; 	ENI();
	ENI
	.line	98, "main.c"; 	initAD();
	LCALL	_initAD
_00127_DS_:
	.line	101, "main.c"; 	CLRWDT();
	clrwdt
	.line	102, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	103, "main.c"; 	refreshNub();
	LCALL	_refreshNub
	.line	104, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00127_DS_
	.line	106, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	107, "main.c"; 	checkMaxAD();
	LCALL	_checkMaxAD
	.line	108, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	109, "main.c"; 	shiweiNum = min/10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_min
	MOVR	_min,W
	LCALL	__divuchar
	BANKSEL	_shiweiNum
	MOVAR	_shiweiNum
	.line	110, "main.c"; 	geweiNum = min%10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_min
	MOVR	_min,W
	LCALL	__moduchar
	BANKSEL	_geweiNum
	MOVAR	_geweiNum
	.line	111, "main.c"; 	if(workStep == 0 && keyCount == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	113, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00127_DS_
	.line	117, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _gotoSleep
;   _keyRead2
;   _keyRead
;   _gotoSleep
;   _keyRead2
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	331, "main.c"; 	keyClick = keyRead(0x08&(~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	0x08
	ANDAR	r0x1023,F
	MOVR	r0x1023,W
	LCALL	_keyRead
	BANKSEL	_keyClick
	MOVAR	_keyClick
	.line	333, "main.c"; 	if(keyClick == 1)			//短按
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	.line	335, "main.c"; 	if(++workStep >= 4)
	BANKSEL	_workStep
	INCR	_workStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00275_DS_
	.line	337, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00275_DS_:
	.line	339, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	.line	341, "main.c"; 	duty = 100;
	MOVIA	0x64
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00288_DS_
_00282_DS_:
	.line	343, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	.line	345, "main.c"; 	duty = 75;
	MOVIA	0x4b
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00288_DS_
_00279_DS_:
	.line	347, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	.line	349, "main.c"; 	duty = 50;
	MOVIA	0x32
	BANKSEL	_duty
	MOVAR	_duty
	LGOTO	_00288_DS_
_00287_DS_:
	.line	352, "main.c"; 	else if(keyClick == 2)		//长按
	BANKSEL	_keyClick
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	.line	354, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	355, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00288_DS_:
	.line	358, "main.c"; 	if(keyRead2(0x02&(~PORTB)))
	COMR	_PORTB,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	0x02
	ANDAR	r0x1023,F
	MOVR	r0x1023,W
	LCALL	_keyRead2
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	LGOTO	_00301_DS_
	.line	360, "main.c"; 	if(++workStep2 >= 4)
	BANKSEL	_workStep2
	INCR	_workStep2,F
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep2,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	362, "main.c"; 	workStep2 = 1;
	MOVIA	0x01
	MOVAR	_workStep2
_00290_DS_:
	.line	364, "main.c"; 	if(workStep2 == 1)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00297_DS_
	.line	366, "main.c"; 	min = 20;
	MOVIA	0x14
	BANKSEL	_min
	MOVAR	_min
	LGOTO	_00301_DS_
_00297_DS_:
	.line	368, "main.c"; 	else if(workStep2 == 2)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00294_DS_
	.line	370, "main.c"; 	min = 40;
	MOVIA	0x28
	BANKSEL	_min
	MOVAR	_min
	LGOTO	_00301_DS_
_00294_DS_:
	.line	372, "main.c"; 	else if(workStep2 == 3)
	BANKSEL	_workStep2
	MOVR	_workStep2,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00301_DS_
	.line	374, "main.c"; 	min = 60;
	MOVIA	0x3c
	BANKSEL	_min
	MOVAR	_min
_00301_DS_:
	.line	378, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1022
_keyRead2:
; 2 exit points
	.line	307, "main.c"; 	char keyRead2(char KeyStatus)	
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	309, "main.c"; 	if (KeyStatus)
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	LGOTO	_00267_DS_
	.line	311, "main.c"; 	keyCount2++;
	BANKSEL	_keyCount2
	INCR	_keyCount2,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	312, "main.c"; 	if(keyCount2 >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	LGOTO	_00268_DS_
	.line	314, "main.c"; 	keyCount2 = 200;
	MOVIA	0xc8
	MOVAR	_keyCount2
	LGOTO	_00268_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00267_DS_:
	.line	319, "main.c"; 	if(keyCount2 >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount2
	SUBAR	_keyCount2,W
	BTRSS	STATUS,0
	LGOTO	_00265_DS_
	.line	321, "main.c"; 	keyCount2 = 0;
	CLRR	_keyCount2
	.line	322, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00269_DS_
_00265_DS_:
	.line	324, "main.c"; 	keyCount2 = 0;
	BANKSEL	_keyCount2
	CLRR	_keyCount2
_00268_DS_:
	.line	326, "main.c"; 	return 0;
	MOVIA	0x00
_00269_DS_:
	.line	327, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1022
_keyRead:
; 2 exit points
	.line	274, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	276, "main.c"; 	if (KeyStatus)
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	LGOTO	_00255_DS_
	.line	278, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	279, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00256_DS_
	.line	281, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	282, "main.c"; 	if(!longPressFlag)
	BANKSEL	_longPressFlag
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	.line	284, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	285, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00257_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00255_DS_:
	.line	291, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00252_DS_
	.line	293, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	294, "main.c"; 	longPressFlag = 0;
	BANKSEL	_longPressFlag
	CLRR	_longPressFlag
	.line	295, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00257_DS_
;;unsigned compare: left < lit (0x4=4), size=1
_00252_DS_:
	.line	297, "main.c"; 	else if(keyCount >= 4)
	MOVIA	0x04
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00253_DS_
	.line	299, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	300, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00257_DS_
_00253_DS_:
	.line	302, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00256_DS_:
	.line	304, "main.c"; 	return 0;
	MOVIA	0x00
_00257_DS_:
	.line	305, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setInput
;   _setInput
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	250, "main.c"; 	setInput();
	LCALL	_setInput
	.line	251, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	252, "main.c"; 	workStep2 = 1;
	MOVIA	0x01
	BANKSEL	_workStep2
	MOVAR	_workStep2
	.line	253, "main.c"; 	PORTB &= 0xF7;
	BCR	_PORTB,3
	.line	254, "main.c"; 	AWUCON = 0x08;
	MOVIA	0x08
	MOVAR	_AWUCON
	.line	255, "main.c"; 	duty = 0;
	BANKSEL	_duty
	CLRR	_duty
	.line	256, "main.c"; 	min = 20;
	MOVIA	0x14
	BANKSEL	_min
	MOVAR	_min
	.line	257, "main.c"; 	tempshiweiNum = 2;
	MOVIA	0x02
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	258, "main.c"; 	tempgeweiNum = 0;
	BANKSEL	_tempgeweiNum
	CLRR	_tempgeweiNum
	.line	259, "main.c"; 	second = 0;
	BANKSEL	_second
	CLRR	_second
	.line	260, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	261, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	262, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	263, "main.c"; 	CLRWDT();
	clrwdt
	.line	264, "main.c"; 	ENI();
	ENI
	.line	265, "main.c"; 	SLEEP();
	sleep
	.line	266, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	267, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	268, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	270, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	272, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1025
	.debuginfo variable _time[1]=r0x1024
	.debuginfo variable _i[0]=r0x1026
	.debuginfo variable _i[1]=r0x1027
_delay:
; 2 exit points
	.line	243, "main.c"; 	void delay(u16t time)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK00,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	245, "main.c"; 	for(u16t i=0;i<time;i++);
	BANKSEL	r0x1026
	CLRR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
_00225_DS_:
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSS	STATUS,2
	LGOTO	_00236_DS_
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1026
	SUBAR	r0x1026,W
_00236_DS_:
	BTRSC	STATUS,0
	LGOTO	_00227_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
	BTRSS	STATUS,2
	LGOTO	_00001_DS_
	BANKSEL	r0x1027
	INCR	r0x1027,F
_00001_DS_:
	LGOTO	_00225_DS_
_00227_DS_:
	.line	246, "main.c"; 	}
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
_00218_DS_:
	.line	237, "main.c"; 	while(ADMDbits.EOC==0)
	BTRSS	_ADMDbits,5
	LGOTO	_00218_DS_
	.line	239, "main.c"; 	}
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
;   r0x1028
;   STK00
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_F_AIN5_Convert
	.debuginfo subprogram _F_AIN5_Convert
;local variable name mapping:
	.debuginfo variable _count=r0x1028
	.debuginfo variable _i=r0x1029
_F_AIN5_Convert:
; 2 exit points
	.line	218, "main.c"; 	void F_AIN5_Convert(char count)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	220, "main.c"; 	R_AIN5_DATA=R_AIN5_DATA_LB=0x00;   
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	222, "main.c"; 	ADMD  = 0x90 | C_ADC_PA4;				// Select AIN6(PB1) pad as ADC input
	MOVIA	0x94
	MOVAR	_ADMD
	.line	223, "main.c"; 	delay(200);	
	MOVIA	0xc8
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	224, "main.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	BANKSEL	r0x1029
	MOVAR	r0x1029
_00211_DS_:
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	LGOTO	_00213_DS_
	.line	226, "main.c"; 	ADMDbits.START = 1;					// Start a ADC conversion session
	BSR	_ADMDbits,6
	.line	227, "main.c"; 	F_wait_eoc();							// Wait for ADC conversion complete
	LCALL	_F_wait_eoc
	.line	228, "main.c"; 	R_AIN5_DATA_LB += ( 0x0F & ADR); 
	MOVIA	0x0f
	ANDAR	_ADR,W
;;3	MOVAR	r0x102A
	BANKSEL	_R_AIN5_DATA_LB
	ADDAR	_R_AIN5_DATA_LB,F
	.line	229, "main.c"; 	R_AIN5_DATA    += ADD; 
	MOVR	_ADD,W
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;1	CLRR	r0x102B
;;102	MOVR	r0x102A,W
;;100	MOVAR	r0x102C
	MOVIA	0x00
	BANKSEL	r0x102D
	MOVAR	r0x102D
;;101	MOVR	r0x102C,W
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,0
	INCR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00002_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
_00002_DS_:
	.line	224, "main.c"; 	for(i=1;i<=count;i++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
	LGOTO	_00211_DS_
_00213_DS_:
	.line	231, "main.c"; 	}
	RETURN	
; exit point of _F_AIN5_Convert

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _F_AIN5_Convert
;   _F_AIN5_Convert
;4 compiler assigned registers:
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;; Starting pCode block
.segment "code"; module=main, function=_checkMaxAD
	.debuginfo subprogram _checkMaxAD
_checkMaxAD:
; 2 exit points
	.line	192, "main.c"; 	R_AIN5_DATA = R_AIN5_DATA_LB = 0x00;
	BANKSEL	_R_AIN5_DATA_LB
	CLRR	_R_AIN5_DATA_LB
	BANKSEL	_R_AIN5_DATA
	CLRR	_R_AIN5_DATA
	CLRR	(_R_AIN5_DATA + 1)
	.line	193, "main.c"; 	F_AIN5_Convert(8);					// execute AIN0 ADC converting 8 times
	MOVIA	0x08
	LCALL	_F_AIN5_Convert
	.line	194, "main.c"; 	R_AIN5_DATA <<= 4;					// R_AIN0_DATA shift left 4 bit
	BANKSEL	_R_AIN5_DATA
	SWAPR	(_R_AIN5_DATA + 1),W
	ANDIA	0xf0
	MOVAR	(_R_AIN5_DATA + 1)
	SWAPR	_R_AIN5_DATA,W
	MOVAR	_R_AIN5_DATA
	ANDIA	0x0f
	IORAR	(_R_AIN5_DATA + 1),F
	XORAR	_R_AIN5_DATA,F
	.line	195, "main.c"; 	R_AIN5_DATA_LB &= 0xF0;				// Only get Bit7~4
	MOVIA	0xf0
	BANKSEL	_R_AIN5_DATA_LB
	ANDAR	_R_AIN5_DATA_LB,F
	.line	196, "main.c"; 	R_AIN5_DATA += R_AIN5_DATA_LB;		// R_AIN0_DATA + R_AIN0_DATA_LB
	MOVR	_R_AIN5_DATA_LB,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
;;1	MOVAR	r0x102E
;;1	CLRR	r0x102F
;;99	MOVR	r0x102E,W
	MOVIA	0x00
	BANKSEL	r0x1031
	MOVAR	r0x1031
	BANKSEL	r0x1030
	MOVR	r0x1030,W
	BANKSEL	_R_AIN5_DATA
	ADDAR	_R_AIN5_DATA,F
	BANKSEL	r0x1031
	MOVR	r0x1031,W
	BTRSC	STATUS,0
	INCR	r0x1031,W
	BTRSC	STATUS,2
	LGOTO	_00003_DS_
	BANKSEL	_R_AIN5_DATA
	ADDAR	(_R_AIN5_DATA + 1),F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
_00003_DS_:
	.line	197, "main.c"; 	R_AIN5_DATA >>=3;					// R_AIN0_DATA divided 8	
	BCR	STATUS,0
	BANKSEL	_R_AIN5_DATA
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;shiftRight_Left2ResultLit:5589: shCount=1, size=2, sign=0, same=1, offr=0
	BCR	STATUS,0
	RRR	(_R_AIN5_DATA + 1),F
	RRR	_R_AIN5_DATA,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x68=104), size=2
	.line	199, "main.c"; 	if(R_AIN5_DATA > 103)
	MOVIA	0x00
	SUBAR	(_R_AIN5_DATA + 1),W
	BTRSS	STATUS,2
	LGOTO	_00204_DS_
	MOVIA	0x68
	SUBAR	_R_AIN5_DATA,W
_00204_DS_:
	BTRSS	STATUS,0
	LGOTO	_00194_DS_
	.line	201, "main.c"; 	if(++overLoadTime>=100)
	BANKSEL	_overLoadTime
	INCR	_overLoadTime,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_overLoadTime,W
	BTRSS	STATUS,0
	LGOTO	_00196_DS_
	.line	203, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	204, "main.c"; 	overLoadTime = 0;
	BANKSEL	_overLoadTime
	CLRR	_overLoadTime
	LGOTO	_00196_DS_
_00194_DS_:
	.line	209, "main.c"; 	overLoadTime = 0;
	BANKSEL	_overLoadTime
	CLRR	_overLoadTime
_00196_DS_:
	.line	212, "main.c"; 	}
	RETURN	
; exit point of _checkMaxAD

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
	.line	169, "main.c"; 	ADMD  = C_ADC_En | C_ADC_CH_Dis | C_ADC_PA4 ;	// Enable ADC power, Disable global ADC input channel, Select PA0 pad as ADC input (SFR "ADMD")
	MOVIA	0x84
	MOVAR	_ADMD
	.line	174, "main.c"; 	ADVREFH = C_Vrefh_2V;					// ADC reference high voltage is supplied by internal 2V  (Note: ADC clock freq. must be equal or less than 250KHz)
	CLRR	_ADVREFH
	.line	179, "main.c"; 	ADR	  = C_Ckl_Div8;						// ADC clock=Fcpu/8, Clear ADIF, disable ADC interrupt	
	MOVIA	0x10
	MOVAR	_ADR
	.line	181, "main.c"; 	ADCR  = C_Sample_1clk | C_12BIT;
	MOVIA	0x03
	MOVAR	_ADCR
	.line	184, "main.c"; 	ADMDbits.GCHS = 1;						// Enable global ADC channel	(SFR "ADMD")
	BSR	_ADMDbits,4
	.line	185, "main.c"; 	delay(100);								// Delay 0.56ms(Instruction clock=4MHz/2T) for waiting ADC stable 
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	188, "main.c"; 	}
	RETURN	
; exit point of _initAD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1032
;   STK00
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x1032
	.debuginfo variable _duty=r0x1033
_setPWMduty:
; 2 exit points
	.line	148, "main.c"; 	void setPWMduty(char portPin,char duty)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK00,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
;;unsigned compare: left < lit (0x64=100), size=1
	.line	150, "main.c"; 	if(ledCount >= 100)
	MOVIA	0x64
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	152, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	153, "main.c"; 	if(++second >= 60)
	BANKSEL	_second
	INCR	_second,F
;;unsigned compare: left < lit (0x3C=60), size=1
	MOVIA	0x3c
	SUBAR	_second,W
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	155, "main.c"; 	second = 0;
	CLRR	_second
	.line	156, "main.c"; 	if(--min == 0)
	BANKSEL	_min
	DECRSZ	_min,F
	LGOTO	_00178_DS_
	.line	157, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
_00178_DS_:
	.line	160, "main.c"; 	if(ledCount < duty)
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00180_DS_
	.line	161, "main.c"; 	PORTB |= portPin;
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	IORAR	_PORTB,F
	LGOTO	_00182_DS_
_00180_DS_:
	.line	163, "main.c"; 	PORTB &= (~portPin);
	BANKSEL	r0x1032
	COMR	r0x1032,W
	MOVAR	r0x1032
	ANDAR	_PORTB,F
_00182_DS_:
	.line	164, "main.c"; 	}
	RETURN	
; exit point of _setPWMduty

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _MIN
;   _HIGHT
;   _MEDIUM
;   _LOW
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;   _MIN
;   _HIGHT
;   _MEDIUM
;   _LOW
;   __gptrget1
;   _showNubShiwei
;   __gptrget1
;   _showNubGewei
;5 compiler assigned registers:
;   r0x1034
;   r0x1035
;   STK01
;   STK00
;   r0x1036
;; Starting pCode block
.segment "code"; module=main, function=_refreshNub
	.debuginfo subprogram _refreshNub
_refreshNub:
; 2 exit points
	.line	122, "main.c"; 	if(tempshiweiNum != shiweiNum || tempgeweiNum != geweiNum )
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	XORAR	_tempshiweiNum,W
	BTRSS	STATUS,2
	LGOTO	_00134_DS_
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	XORAR	_tempgeweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00135_DS_
_00134_DS_:
	.line	124, "main.c"; 	if(++refreshCount >= 200)
	BANKSEL	_refreshCount
	INCR	_refreshCount,F
	MOVIA	0xc8
	SUBAR	_refreshCount,W
	BTRSS	STATUS,0
	LGOTO	_00136_DS_
	.line	126, "main.c"; 	refreshCount = 0;
	CLRR	_refreshCount
	.line	127, "main.c"; 	tempshiweiNum = shiweiNum;
	BANKSEL	_shiweiNum
	MOVR	_shiweiNum,W
	BANKSEL	_tempshiweiNum
	MOVAR	_tempshiweiNum
	.line	128, "main.c"; 	tempgeweiNum = geweiNum;
	BANKSEL	_geweiNum
	MOVR	_geweiNum,W
	BANKSEL	_tempgeweiNum
	MOVAR	_tempgeweiNum
	LGOTO	_00136_DS_
_00135_DS_:
	.line	133, "main.c"; 	refreshCount = 0;
	BANKSEL	_refreshCount
	CLRR	_refreshCount
_00136_DS_:
	.line	135, "main.c"; 	MIN();
	LCALL	_MIN
	.line	136, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	.line	137, "main.c"; 	HIGHT();
	LCALL	_HIGHT
	LGOTO	_00145_DS_
_00144_DS_:
	.line	138, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	.line	139, "main.c"; 	MEDIUM();
	LCALL	_MEDIUM
	LGOTO	_00145_DS_
_00141_DS_:
	.line	140, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	141, "main.c"; 	LOW();
	LCALL	_LOW
_00145_DS_:
	.line	142, "main.c"; 	if(tempshiweiNum)
	BANKSEL	_tempshiweiNum
	MOVR	_tempshiweiNum,W
	BTRSC	STATUS,2
	LGOTO	_00147_DS_
	.line	143, "main.c"; 	showNubShiwei(numArray[tempshiweiNum]);
	MOVR	_tempshiweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1036
	MOVAR	r0x1036
	LCALL	_showNubShiwei
_00147_DS_:
	.line	144, "main.c"; 	showNubGewei(numArray[tempgeweiNum]);
	BANKSEL	_tempgeweiNum
	MOVR	_tempgeweiNum,W
	ADDIA	(_numArray + 0)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	((_numArray + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x1036
	MOVAR	r0x1036
	LCALL	_showNubGewei
	.line	145, "main.c"; 	}
	RETURN	
; exit point of _refreshNub


;	code size estimation:
;	  499+  131 =   630 instructions ( 1522 byte)

	end
