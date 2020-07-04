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
	extern	_delay
	extern	_keyRead
	extern	_gotoSleep
	extern	_checkLVD
	extern	_initTimer0
	extern	_initAD
	extern	_ADConvert
	extern	_checkAD
	extern	_delayUs
	extern	_F_wait_eoc
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
	extern	_led2OFF
	extern	_led2ON
	extern	_led1OFF
	extern	_led1ON
	extern	_shanshuo
	extern	_ledCon
	extern	_chrgCon
	extern	_isr
	extern	_main
	extern	_R_AIN1_DATA_HB
	extern	_R_AIN1_DATA_LB
	extern	_intCount
	extern	_IntFlag
	extern	_protectState
	extern	_led1State
	extern	_led2State
	extern	_ledCount
	extern	_sstime
	extern	_chrgState
	extern	_ADdataLB
	extern	_ADdata

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
_R_AIN1_DATA_HB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_HB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_R_AIN1_DATA_LB:
	.res	1
	.debuginfo gvariable name=_R_AIN1_DATA_LB,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_ADdataLB:
	.res	3
	.debuginfo gvariable name=_ADdataLB,3byte,array=0,entsize=1,ext=1

.segment "uninit"
_ADdata:
	.res	3
	.debuginfo gvariable name=_ADdata,3byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
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
_protectState:
	dw	0x00
	.debuginfo gvariable name=_protectState,1byte,array=0,entsize=1,ext=1


.segment "idata"
_led1State:
	dw	0x00
	.debuginfo gvariable name=_led1State,1byte,array=0,entsize=1,ext=1


.segment "idata"
_led2State:
	dw	0x00
	.debuginfo gvariable name=_led2State,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sstime:
	dw	0x00
	.debuginfo gvariable name=_sstime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_chrgState:
	dw	0x00
	.debuginfo gvariable name=_chrgState,1byte,array=0,entsize=1,ext=1

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
	.line	34, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	36, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	38, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	39, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	40, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	42, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	43, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	46, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	48, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	51, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	53, "main.c"; 	}
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
;   _initTimer0
;   _initAD
;   _chrgCon
;   _ledCon
;   _checkAD
;   _initTimer0
;   _initAD
;   _chrgCon
;   _ledCon
;   _checkAD
;6 compiler assigned registers:
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	58, "main.c"; 	initTimer0();
	LCALL	_initTimer0
	.line	59, "main.c"; 	initAD(0x10);
	MOVIA	0x10
	LCALL	_initAD
_00118_DS_:
	.line	62, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	63, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	65, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	66, "main.c"; 	chrgCon();
	LCALL	_chrgCon
	.line	67, "main.c"; 	ledCon();  
	LCALL	_ledCon
	.line	68, "main.c"; 	checkAD(C_Quarter_VDD,ADdataLB,ADdata);
	BANKSEL	_ADdata
	MOVR	_ADdata,W
	MOVAR	STK05
	MOVR	(_ADdata + 1),W
	MOVAR	STK04
	MOVR	(_ADdata + 2),W
	MOVAR	STK03
	BANKSEL	_ADdataLB
	MOVR	_ADdataLB,W
	MOVAR	STK02
	MOVR	(_ADdataLB + 1),W
	MOVAR	STK01
	MOVR	(_ADdataLB + 2),W
	MOVAR	STK00
	MOVIA	0x0b
	LCALL	_checkAD
	LGOTO	_00118_DS_
	.line	70, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led2OFF
	.debuginfo subprogram _led2OFF
_led2OFF:
; 2 exit points
	.line	179, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	.line	180, "main.c"; 	}
	RETURN	
; exit point of _led2OFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led2ON
	.debuginfo subprogram _led2ON
_led2ON:
; 2 exit points
	.line	174, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
	.line	175, "main.c"; 	}
	RETURN	
; exit point of _led2ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led1OFF
	.debuginfo subprogram _led1OFF
_led1OFF:
; 2 exit points
	.line	169, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	.line	170, "main.c"; 	}
	RETURN	
; exit point of _led1OFF

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_led1ON
	.debuginfo subprogram _led1ON
_led1ON:
; 2 exit points
	.line	164, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	165, "main.c"; 	}
	RETURN	
; exit point of _led1ON

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led1ON
;   _led2OFF
;   _led1OFF
;   _led2ON
;   _led1ON
;   _led2OFF
;   _led1OFF
;   _led2ON
;; Starting pCode block
.segment "code"; module=main, function=_shanshuo
	.debuginfo subprogram _shanshuo
_shanshuo:
; 2 exit points
;;unsigned compare: left < lit (0x32=50), size=1
	.line	132, "main.c"; 	if(ledCount < 50)
	MOVIA	0x32
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00161_DS_
	.line	134, "main.c"; 	if(led1State == 3)
	BANKSEL	_led1State
	MOVR	_led1State,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	135, "main.c"; 	led1ON();
	LCALL	_led1ON
	.line	136, "main.c"; 	if(led2State == 3)
	BANKSEL	_led2State
	MOVR	_led2State,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00162_DS_
	.line	137, "main.c"; 	led2OFF();
	LCALL	_led2OFF
	LGOTO	_00162_DS_
_00161_DS_:
	.line	141, "main.c"; 	if(led1State == 3)
	BANKSEL	_led1State
	MOVR	_led1State,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	142, "main.c"; 	led1OFF();
	LCALL	_led1OFF
	.line	143, "main.c"; 	if(led2State == 3)
	BANKSEL	_led2State
	MOVR	_led2State,W
	XORIA	0x03
	BTRSC	STATUS,2
	.line	144, "main.c"; 	led2ON();
	LCALL	_led2ON
_00162_DS_:
	.line	147, "main.c"; 	if(++ledCount == 100)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00167_DS_
	.line	149, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	150, "main.c"; 	sstime--;		//闪烁次数减1
	BANKSEL	_sstime
	DECRSZ	_sstime,F
	.line	151, "main.c"; 	if(sstime == 0)
	LGOTO	_00167_DS_
	.line	153, "main.c"; 	led1State = 0;	//LED关灯状态
	BANKSEL	_led1State
	CLRR	_led1State
	.line	154, "main.c"; 	led2State = 0;	//LED关灯状态
	BANKSEL	_led2State
	CLRR	_led2State
_00167_DS_:
	.line	157, "main.c"; 	}
	RETURN	
; exit point of _shanshuo

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _shanshuo
;   _shanshuo
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 0 exit points
	.line	104, "main.c"; 	if(getbit(PORTB, 0))
	MOVR	_PORTB,W
	ANDIA	0x01
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	r0x1011,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	106, "main.c"; 	if(protectState)
	BANKSEL	_protectState
	MOVR	_protectState,W
	BTRSC	STATUS,2
	LGOTO	_00139_DS_
	.line	109, "main.c"; 	sstime = 5;
	MOVIA	0x05
	BANKSEL	_sstime
	MOVAR	_sstime
	.line	110, "main.c"; 	led1State = 3;
	MOVIA	0x03
	BANKSEL	_led1State
	MOVAR	_led1State
_00139_DS_:
	.line	112, "main.c"; 	protectState = 0;	//KEY2断开
	BANKSEL	_protectState
	CLRR	_protectState
	LGOTO	_00144_DS_
_00143_DS_:
	.line	116, "main.c"; 	if(protectState == 0)
	BANKSEL	_protectState
	MOVR	_protectState,W
	BTRSS	STATUS,2
	LGOTO	_00141_DS_
	.line	119, "main.c"; 	sstime = 5;
	MOVIA	0x05
	BANKSEL	_sstime
	MOVAR	_sstime
	.line	120, "main.c"; 	led2State = 3;
	MOVIA	0x03
	BANKSEL	_led2State
	MOVAR	_led2State
_00141_DS_:
	.line	122, "main.c"; 	protectState = 1;	//KEY2闭合
	MOVIA	0x01
	BANKSEL	_protectState
	MOVAR	_protectState
_00144_DS_:
	.line	124, "main.c"; 	if(sstime)
	BANKSEL	_sstime
	MOVR	_sstime,W
	BTRSS	STATUS,2
	.line	125, "main.c"; 	shanshuo();
	LCALL	_shanshuo
	.line	126, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _led2ON
;   _led1OFF
;   _led1ON
;   _led2OFF
;   _led2ON
;   _led1OFF
;   _led1ON
;   _led2OFF
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
.segment "code"; module=main, function=_chrgCon
	.debuginfo subprogram _chrgCon
_chrgCon:
; 2 exit points
	.line	74, "main.c"; 	if(getbit(PORTA,6))
	MOVR	_PORTA,W
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00127_DS_
	.line	77, "main.c"; 	if(!getbit(PORTA,7))
	MOVR	_PORTA,W
	ANDIA	0x80
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1012
	MOVR	r0x1012,W
	BTRSS	STATUS,2
	LGOTO	_00124_DS_
	.line	79, "main.c"; 	led2ON();
	LCALL	_led2ON
	.line	80, "main.c"; 	led1OFF();
	LCALL	_led1OFF
	.line	81, "main.c"; 	chrgState = 2;
	MOVIA	0x02
	BANKSEL	_chrgState
	MOVAR	_chrgState
	LGOTO	_00127_DS_
_00124_DS_:
	.line	84, "main.c"; 	chrgState = 0;
	BANKSEL	_chrgState
	CLRR	_chrgState
_00127_DS_:
	.line	87, "main.c"; 	if(getbit(PORTA,7))
	MOVR	_PORTA,W
	ANDIA	0x80
	BTRSS	STATUS,2
	MOVIA	0x01
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	r0x1012,W
	BTRSC	STATUS,2
	LGOTO	_00133_DS_
	.line	90, "main.c"; 	if(!getbit(PORTA,6))
	MOVR	_PORTA,W
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1012
	MOVR	r0x1012,W
	BTRSS	STATUS,2
	LGOTO	_00129_DS_
	.line	92, "main.c"; 	led1ON();
	LCALL	_led1ON
	.line	93, "main.c"; 	led2OFF();
	LCALL	_led2OFF
	.line	94, "main.c"; 	chrgState = 1;
	MOVIA	0x01
	BANKSEL	_chrgState
	MOVAR	_chrgState
	LGOTO	_00133_DS_
_00129_DS_:
	.line	97, "main.c"; 	chrgState = 0;
	BANKSEL	_chrgState
	CLRR	_chrgState
_00133_DS_:
	.line	99, "main.c"; 	}
	RETURN	
; exit point of _chrgCon


;	code size estimation:
;	  183+   36 =   219 instructions (  510 byte)

	end
