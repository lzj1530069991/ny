;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053D,c=on
	#include "ny8a053d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_keyCallBack
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
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
	extern	_IOSTA
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_setPWMduty
	extern	_keyCtr
	extern	_setWorkStep
	extern	_setIRWorkStep
	extern	_keyRead
	extern	_workCtr
	extern	_setModeStep
	extern	_breathCtr
	extern	_gotoSleep
	extern	_proData
	extern	_GetOneByte
	extern	_proLow
	extern	_proHight
	extern	_cleanData
	extern	_isr
	extern	_main
	extern	_IntFlag
	extern	_count
	extern	_bitIndex
	extern	_data1
	extern	_data2
	extern	_data3
	extern	_data4
	extern	_irCode
	extern	_irCode2
	extern	_value
	extern	_sleepFlag
	extern	_sleepCount
	extern	_Status
	extern	_workStep
	extern	_keyCount
	extern	_duty
	extern	_ledCount
	extern	_modeStep
	extern	_count1s
	extern	_deadTime
	extern	_timeStep
	extern	_breathFlag
	extern	_T1Counter
	extern	_accTimeH

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000020
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
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
_IntFlag:
	.res	1
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_count:
	.res	1
	.debuginfo gvariable name=_count,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data1:
	.res	1
	.debuginfo gvariable name=_data1,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data2:
	.res	1
	.debuginfo gvariable name=_data2,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data3:
	.res	1
	.debuginfo gvariable name=_data3,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_data4:
	.res	1
	.debuginfo gvariable name=_data4,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_irCode:
	.res	1
	.debuginfo gvariable name=_irCode,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_irCode2:
	.res	1
	.debuginfo gvariable name=_irCode2,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_value:
	.res	1
	.debuginfo gvariable name=_value,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_T1Counter:
	.res	2
	.debuginfo gvariable name=_T1Counter,2byte,array=0,entsize=2,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_bitIndex:
	dw	0x00
	.debuginfo gvariable name=_bitIndex,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepFlag:
	dw	0x00
	.debuginfo gvariable name=_sleepFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_sleepCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_duty:
	dw	0x00, 0x00
	.debuginfo gvariable name=_duty,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_ledCount,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_modeStep:
	dw	0x00
	.debuginfo gvariable name=_modeStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_deadTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_deadTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_timeStep:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeStep,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_breathFlag:
	dw	0x00
	.debuginfo gvariable name=_breathFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_accTimeH:
	dw	0x00
	.debuginfo gvariable name=_accTimeH,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	78, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	80, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	MGOTO	_00106_DS_
	.line	82, "main.c"; 	accTimeH++;		//0.256ms执行一次
	BANKSEL	_accTimeH
	INCR	_accTimeH,F
	.line	84, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00106_DS_:
	.line	87, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_00114_DS_
	.line	89, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	90, "main.c"; 	if(++count == 100)
	BANKSEL	_count
	INCR	_count,F
	MOVR	_count,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00114_DS_
	.line	92, "main.c"; 	count = 0;
	CLRR	_count
	.line	93, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
	.line	95, "main.c"; 	if(++count1s > 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	MGOTO	_00114_DS_
	.line	97, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	98, "main.c"; 	if(deadTime > 0)
	BANKSEL	_deadTime
	MOVR	_deadTime,W
	IORAR	(_deadTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00114_DS_
	.line	100, "main.c"; 	deadTime--;
	MOVIA	0xff
	ADDAR	_deadTime,F
	BTRSS	STATUS,0
	DECR	(_deadTime + 1),F
_00114_DS_:
	.line	106, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	MGOTO	_00116_DS_
	.line	108, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);
	MOVIA	0xfd
	MOVAR	_INTF
_00116_DS_:
	.line	111, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	114, "main.c"; 	}
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
;   _setPWMduty
;   _setModeStep
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _proData
;   _proLow
;   _proHight
;   _setPWMduty
;   _setModeStep
;   _keyCtr
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	336, "main.c"; 	IOSTB =   0x0F;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x0f
	IOST	_IOSTB
	.line	337, "main.c"; 	BPHCON = 0xF0;
	MOVIA	0xf0
	MOVAR	_BPHCON
	.line	338, "main.c"; 	ABPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_ABPLCON
	.line	339, "main.c"; 	PORTB = 0x30;                           // PB0、PB1 & PB2 are output High
	MOVIA	0x30
	MOVAR	_PORTB
	.line	340, "main.c"; 	DISI();
	DISI
	.line	342, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	346, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	347, "main.c"; 	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	.line	348, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	351, "main.c"; 	INT1Level = 1;
	BANKSEL	_Status
	BSR	_Status,5
	.line	354, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	356, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	357, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	360, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	363, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	364, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
	.line	365, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	BANKSEL	_data4
	CLRR	_data4
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00291_DS_:
	.line	368, "main.c"; 	if(ReadOver)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	370, "main.c"; 	proData();
	MCALL	_proData
_00271_DS_:
	.line	372, "main.c"; 	if(INT1Level && (PORTB & 0x08))
	BANKSEL	_Status
	BTRSS	_Status,5
	MGOTO	_00276_DS_
	BTRSS	_PORTB,3
	MGOTO	_00276_DS_
	.line	374, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	375, "main.c"; 	proLow();
	MCALL	_proLow
	MGOTO	_00277_DS_
_00276_DS_:
	.line	377, "main.c"; 	else if(INT1Level == 0 && (PORTB & 0x08) == 0)
	BANKSEL	_Status
	BTRSC	_Status,5
	MGOTO	_00277_DS_
	BTRSC	_PORTB,3
	MGOTO	_00277_DS_
	.line	380, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	381, "main.c"; 	proHight();
	MCALL	_proHight
_00277_DS_:
	.line	383, "main.c"; 	CLRWDT();
	clrwdt
	.line	384, "main.c"; 	if(breathFlag)
	BANKSEL	_breathFlag
	MOVR	_breathFlag,W
	BTRSS	STATUS,2
	.line	385, "main.c"; 	setPWMduty();
	MCALL	_setPWMduty
	.line	386, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	MGOTO	_00291_DS_
	.line	388, "main.c"; 	IntFlag = 0;		//10ms执行一次
	CLRR	_IntFlag
	.line	389, "main.c"; 	setModeStep();
	MCALL	_setModeStep
	.line	390, "main.c"; 	keyCtr();
	MCALL	_keyCtr
	.line	391, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	392, "main.c"; 	workCtr();
	MCALL	_workCtr
	.line	393, "main.c"; 	if(bitIndex == 0 &&  keyCount == 0 && workStep == 0 && ++sleepCount >= 100)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00291_DS_
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00334_DS_
	MOVIA	0x64
	SUBAR	_sleepCount,W
_00334_DS_:
	BTRSS	STATUS,0
	MGOTO	_00291_DS_
	.line	395, "main.c"; 	gotoSleep();
	MCALL	_gotoSleep
	MGOTO	_00291_DS_
	.line	402, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
_setPWMduty:
; 2 exit points
	.line	609, "main.c"; 	if(duty > ledCount)
	BANKSEL	_duty
	MOVR	(_duty + 1),W
	BANKSEL	_ledCount
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00507_DS_
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
_00507_DS_:
	BTRSC	STATUS,0
	MGOTO	_00495_DS_
	.line	611, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
	MGOTO	_00496_DS_
_00495_DS_:
	.line	615, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
_00496_DS_:
	.line	618, "main.c"; 	if(++ledCount>313)
	BANKSEL	_ledCount
	INCR	_ledCount,F
	BTRSC	STATUS,2
	INCR	(_ledCount + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x13A=314), size=2
	MOVIA	0x01
	SUBAR	(_ledCount + 1),W
	BTRSS	STATUS,2
	MGOTO	_00508_DS_
	MOVIA	0x3a
	SUBAR	_ledCount,W
_00508_DS_:
	BTRSS	STATUS,0
	MGOTO	_00499_DS_
	.line	620, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
_00499_DS_:
	.line	622, "main.c"; 	}
	RETURN	
; exit point of _setPWMduty

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _keyRead
;   _setWorkStep
;   _keyRead
;   _setWorkStep
;1 compiler assigned register :
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1020,enc=unsigned
_keyCtr:
; 0 exit points
	.line	597, "main.c"; 	char kclick = keyRead(0x01 & (~PORTB));
	COMR	_PORTB,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVIA	0x01
	ANDAR	r0x1020,F
	MOVR	r0x1020,W
	MCALL	_keyRead
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	598, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSC	STATUS,2
	.line	600, "main.c"; 	setWorkStep();
	MCALL	_setWorkStep
	.line	603, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setWorkStep
	.debuginfo subprogram _setWorkStep
_setWorkStep:
; 2 exit points
	.line	550, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	MGOTO	_00480_DS_
	.line	553, "main.c"; 	if(modeStep == 1)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00472_DS_
	.line	555, "main.c"; 	if(++workStep > 2)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00468_DS_
	.line	557, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	558, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
	CLRR	(_deadTime + 1)
	.line	559, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	560, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
_00468_DS_:
	.line	562, "main.c"; 	if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00482_DS_
	.line	564, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	565, "main.c"; 	duty = 0;
	BANKSEL	_duty
	CLRR	_duty
	CLRR	(_duty + 1)
	.line	566, "main.c"; 	timeStep = 0;
	BANKSEL	_timeStep
	CLRR	_timeStep
	CLRR	(_timeStep + 1)
	MGOTO	_00482_DS_
_00472_DS_:
	.line	571, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	572, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
	CLRR	(_deadTime + 1)
	.line	573, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	574, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
	MGOTO	_00482_DS_
_00480_DS_:
	.line	579, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	580, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	581, "main.c"; 	if(modeStep == 2)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00477_DS_
	.line	583, "main.c"; 	deadTime = 600;
	MOVIA	0x58
	BANKSEL	_deadTime
	MOVAR	_deadTime
	MOVIA	0x02
	MOVAR	(_deadTime + 1)
	MGOTO	_00482_DS_
_00477_DS_:
	.line	586, "main.c"; 	else if(modeStep == 3)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00482_DS_
	.line	588, "main.c"; 	deadTime = 30;
	MOVIA	0x1e
	BANKSEL	_deadTime
	MOVAR	_deadTime
	CLRR	(_deadTime + 1)
_00482_DS_:
	.line	592, "main.c"; 	}
	RETURN	
; exit point of _setWorkStep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setIRWorkStep
	.debuginfo subprogram _setIRWorkStep
_setIRWorkStep:
; 2 exit points
	.line	515, "main.c"; 	if(modeStep == 1)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00460_DS_
	.line	517, "main.c"; 	if(++workStep > 2)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	MGOTO	_00451_DS_
	.line	519, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	520, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
_00451_DS_:
	.line	522, "main.c"; 	if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00462_DS_
	.line	524, "main.c"; 	ledCount = 0;
	BANKSEL	_ledCount
	CLRR	_ledCount
	CLRR	(_ledCount + 1)
	.line	525, "main.c"; 	duty = 0;
	BANKSEL	_duty
	CLRR	_duty
	CLRR	(_duty + 1)
	.line	526, "main.c"; 	timeStep = 0;
	BANKSEL	_timeStep
	CLRR	_timeStep
	CLRR	(_timeStep + 1)
	MGOTO	_00462_DS_
_00460_DS_:
	.line	531, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	532, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	533, "main.c"; 	if(modeStep == 2)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00457_DS_
	.line	535, "main.c"; 	deadTime = 600;
	MOVIA	0x58
	BANKSEL	_deadTime
	MOVAR	_deadTime
	MOVIA	0x02
	MOVAR	(_deadTime + 1)
	MGOTO	_00462_DS_
_00457_DS_:
	.line	538, "main.c"; 	else if(modeStep == 3)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00462_DS_
	.line	540, "main.c"; 	deadTime = 30;
	MOVIA	0x1e
	BANKSEL	_deadTime
	MOVAR	_deadTime
	CLRR	(_deadTime + 1)
_00462_DS_:
	.line	544, "main.c"; 	}
	RETURN	
; exit point of _setIRWorkStep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x101F,enc=unsigned
_keyRead:
; 2 exit points
	.line	489, "main.c"; 	char keyRead(uint8 keyStatus)	
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	491, "main.c"; 	if(keyStatus)
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_00443_DS_
	.line	493, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	494, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	495, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00444_DS_
	.line	497, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	MGOTO	_00444_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00443_DS_:
	.line	502, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	MGOTO	_00441_DS_
	.line	504, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	505, "main.c"; 	return	1;
	MOVIA	0x01
	MGOTO	_00445_DS_
_00441_DS_:
	.line	507, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00444_DS_:
	.line	509, "main.c"; 	return 0;
	MOVIA	0x00
_00445_DS_:
	.line	510, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _breathCtr
;   _breathCtr
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	456, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	MGOTO	_00394_DS_
	.line	458, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
_00394_DS_:
	.line	461, "main.c"; 	if(modeStep == 1)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00408_DS_
	.line	463, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00398_DS_
	.line	465, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	466, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
	MGOTO	_00410_DS_
_00398_DS_:
	.line	468, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00410_DS_
	.line	470, "main.c"; 	breathCtr();
	MCALL	_breathCtr
	MGOTO	_00410_DS_
_00408_DS_:
	.line	473, "main.c"; 	else if(modeStep == 2 || modeStep == 3)
	BANKSEL	_modeStep
	MOVR	_modeStep,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_00404_DS_
	MOVR	_modeStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00410_DS_
_00404_DS_:
	.line	475, "main.c"; 	if(deadTime > 0 && workStep == 1)
	BANKSEL	_deadTime
	MOVR	_deadTime,W
	IORAR	(_deadTime + 1),W
	BTRSC	STATUS,2
	MGOTO	_00401_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00401_DS_
	.line	477, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
	.line	478, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	MGOTO	_00410_DS_
_00401_DS_:
	.line	482, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	483, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	484, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
_00410_DS_:
	.line	487, "main.c"; 	}
	RETURN	
; exit point of _workCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_setModeStep
	.debuginfo subprogram _setModeStep
_setModeStep:
; 2 exit points
	.line	434, "main.c"; 	if((PORTB & 0x02) && (PORTB & 0x04))
	BTRSS	_PORTB,1
	MGOTO	_00385_DS_
	BTRSS	_PORTB,2
	MGOTO	_00385_DS_
	.line	436, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	BANKSEL	_modeStep
	MOVAR	_modeStep
	MGOTO	_00388_DS_
_00385_DS_:
	.line	438, "main.c"; 	else if(PORTB & 0x04)
	BTRSS	_PORTB,2
	MGOTO	_00382_DS_
	.line	440, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	441, "main.c"; 	modeStep = 2;
	MOVIA	0x02
	BANKSEL	_modeStep
	MOVAR	_modeStep
	MGOTO	_00388_DS_
_00382_DS_:
	.line	443, "main.c"; 	else if((PORTB & 0x02))
	BTRSS	_PORTB,1
	MGOTO	_00379_DS_
	.line	445, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	446, "main.c"; 	modeStep = 3;
	MOVIA	0x03
	BANKSEL	_modeStep
	MOVAR	_modeStep
	MGOTO	_00388_DS_
_00379_DS_:
	.line	450, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
_00388_DS_:
	.line	452, "main.c"; 	}
	RETURN	
; exit point of _setModeStep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_breathCtr
	.debuginfo subprogram _breathCtr
_breathCtr:
; 2 exit points
;;unsigned compare: left < lit (0xBB=187), size=2
	.line	407, "main.c"; 	if(timeStep < 187)
	MOVIA	0x00
	BANKSEL	_timeStep
	SUBAR	(_timeStep + 1),W
	BTRSS	STATUS,2
	MGOTO	_00369_DS_
	MOVIA	0xbb
	SUBAR	_timeStep,W
_00369_DS_:
	BTRSC	STATUS,0
	MGOTO	_00348_DS_
	.line	409, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	410, "main.c"; 	PORTB &= 0xCF;
	MOVIA	0xcf
	ANDAR	_PORTB,F
	MGOTO	_00349_DS_
;;unsigned compare: left < lit (0x1E7=487), size=2
_00348_DS_:
	.line	412, "main.c"; 	else if(timeStep < 487)
	MOVIA	0x01
	BANKSEL	_timeStep
	SUBAR	(_timeStep + 1),W
	BTRSS	STATUS,2
	MGOTO	_00370_DS_
	MOVIA	0xe7
	SUBAR	_timeStep,W
_00370_DS_:
	BTRSC	STATUS,0
	MGOTO	_00345_DS_
	.line	414, "main.c"; 	breathFlag = 1;
	MOVIA	0x01
	BANKSEL	_breathFlag
	MOVAR	_breathFlag
	.line	415, "main.c"; 	duty = timeStep-187;
	MOVIA	0x45
	BANKSEL	_timeStep
	ADDAR	_timeStep,W
	BANKSEL	_duty
	MOVAR	_duty
	MOVIA	0xff
	MOVAR	(_duty + 1)
	BANKSEL	_timeStep
	MOVR	(_timeStep + 1),W
	BTRSC	STATUS,0
	INCR	(_timeStep + 1),W
	BTRSC	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	_duty
	ADDAR	(_duty + 1),F
_00001_DS_:
	MGOTO	_00349_DS_
;;unsigned compare: left < lit (0x2AF=687), size=2
_00345_DS_:
	.line	417, "main.c"; 	else if(timeStep < 687)
	MOVIA	0x02
	BANKSEL	_timeStep
	SUBAR	(_timeStep + 1),W
	BTRSS	STATUS,2
	MGOTO	_00371_DS_
	MOVIA	0xaf
	SUBAR	_timeStep,W
_00371_DS_:
	BTRSC	STATUS,0
	MGOTO	_00342_DS_
	.line	419, "main.c"; 	breathFlag = 1;
	MOVIA	0x01
	BANKSEL	_breathFlag
	MOVAR	_breathFlag
	.line	420, "main.c"; 	duty = 300;
	MOVIA	0x2c
	BANKSEL	_duty
	MOVAR	_duty
	MOVIA	0x01
	MOVAR	(_duty + 1)
	MGOTO	_00349_DS_
;;unsigned compare: left < lit (0x3DB=987), size=2
_00342_DS_:
	.line	422, "main.c"; 	else if(timeStep < 987)
	MOVIA	0x03
	BANKSEL	_timeStep
	SUBAR	(_timeStep + 1),W
	BTRSS	STATUS,2
	MGOTO	_00372_DS_
	MOVIA	0xdb
	SUBAR	_timeStep,W
_00372_DS_:
	BTRSC	STATUS,0
	MGOTO	_00349_DS_
	.line	424, "main.c"; 	breathFlag = 1;
	MOVIA	0x01
	BANKSEL	_breathFlag
	MOVAR	_breathFlag
	.line	425, "main.c"; 	duty = 987 - timeStep;
	BANKSEL	_timeStep
	MOVR	_timeStep,W
	SUBIA	0xdb
	BANKSEL	_duty
	MOVAR	_duty
	BANKSEL	_timeStep
	MOVR	(_timeStep + 1),W
	BTRSS	STATUS,0
	INCR	(_timeStep + 1),W
	SUBIA	0x03
	BANKSEL	_duty
	MOVAR	(_duty + 1)
_00349_DS_:
	.line	428, "main.c"; 	if(++timeStep > 987)
	BANKSEL	_timeStep
	INCR	_timeStep,F
	BTRSC	STATUS,2
	INCR	(_timeStep + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3DC=988), size=2
	MOVIA	0x03
	SUBAR	(_timeStep + 1),W
	BTRSS	STATUS,2
	MGOTO	_00373_DS_
	MOVIA	0xdc
	SUBAR	_timeStep,W
_00373_DS_:
	BTRSS	STATUS,0
	MGOTO	_00352_DS_
	.line	429, "main.c"; 	timeStep = 0;
	BANKSEL	_timeStep
	CLRR	_timeStep
	CLRR	(_timeStep + 1)
_00352_DS_:
	.line	430, "main.c"; 	}
	RETURN	
; exit point of _breathCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	314, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	315, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	316, "main.c"; 	BWUCON = 0X09;
	MOVIA	0x09
	MOVAR	_BWUCON
	.line	317, "main.c"; 	PORTB = 0x30;
	MOVIA	0x30
	MOVAR	_PORTB
	.line	318, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	319, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	320, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	321, "main.c"; 	CLRWDT();
	clrwdt
	.line	322, "main.c"; 	SLEEP();
	sleep
	.line	323, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PBKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	324, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	326, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	327, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	328, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	329, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	330, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _setIRWorkStep
;   _setIRWorkStep
;; Starting pCode block
.segment "code"; module=main, function=_proData
	.debuginfo subprogram _proData
_proData:
; 2 exit points
	.line	287, "main.c"; 	irCode = (uint8)(~data4);
	BANKSEL	_data4
	COMR	_data4,W
	BANKSEL	_irCode
	MOVAR	_irCode
	.line	288, "main.c"; 	if(irCode == data3)
	BANKSEL	_data3
	XORAR	_data3,W
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	290, "main.c"; 	switch(irCode)
	BANKSEL	_irCode
	MOVR	_irCode,W
	XORIA	0x15
	BTRSC	STATUS,2
	MGOTO	_00246_DS_
	MOVR	_irCode,W
	XORIA	0x46
	BTRSS	STATUS,2
	MGOTO	_00249_DS_
	.line	293, "main.c"; 	setIRWorkStep();
	MCALL	_setIRWorkStep
	.line	294, "main.c"; 	break;
	MGOTO	_00249_DS_
_00246_DS_:
	.line	296, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	297, "main.c"; 	deadTime = 0;
	BANKSEL	_deadTime
	CLRR	_deadTime
	CLRR	(_deadTime + 1)
	.line	298, "main.c"; 	breathFlag = 0;
	BANKSEL	_breathFlag
	CLRR	_breathFlag
	.line	299, "main.c"; 	PORTB |= 0x30;
	MOVIA	0x30
	IORAR	_PORTB,F
_00249_DS_:
	.line	303, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	304, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x1021,enc=unsigned
_GetOneByte:
; 2 exit points
	.line	240, "main.c"; 	void GetOneByte(uint8 bitNub)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	242, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00240_DS_
	.line	244, "main.c"; 	if(bitIndex == 0)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	MGOTO	_00224_DS_
	.line	246, "main.c"; 	bitIndex = 0;
	CLRR	_bitIndex
	.line	247, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	248, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	BANKSEL	_data4
	CLRR	_data4
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00224_DS_:
	.line	250, "main.c"; 	++bitIndex;
	BANKSEL	_bitIndex
	INCR	_bitIndex,F
	.line	251, "main.c"; 	if(bitNub)
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	.line	253, "main.c"; 	value |= 0x80;
	BANKSEL	_value
	BSR	_value,7
_00002_DS_:
	.line	256, "main.c"; 	if(bitIndex == 8)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_00236_DS_
	.line	258, "main.c"; 	data1 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data1
	MOVAR	_data1
	MGOTO	_00237_DS_
_00236_DS_:
	.line	260, "main.c"; 	else if(bitIndex == 16)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	MGOTO	_00233_DS_
	.line	262, "main.c"; 	data2 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data2
	MOVAR	_data2
	MGOTO	_00237_DS_
_00233_DS_:
	.line	265, "main.c"; 	else if(bitIndex == 24)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	MGOTO	_00230_DS_
	.line	267, "main.c"; 	data3 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data3
	MOVAR	_data3
	MGOTO	_00237_DS_
_00230_DS_:
	.line	270, "main.c"; 	else if(bitIndex == 32)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	MGOTO	_00237_DS_
	.line	272, "main.c"; 	data4 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data4
	MOVAR	_data4
	.line	273, "main.c"; 	ReadOver = 1;
	BANKSEL	_Status
	BSR	_Status,4
	.line	274, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	.line	275, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	276, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	277, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	278, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=1, offr=0
_00237_DS_:
	.line	281, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	BANKSEL	_value
	RRR	_value,F
_00240_DS_:
	.line	283, "main.c"; 	}
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
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_proLow
	.debuginfo subprogram _proLow
_proLow:
; 2 exit points
	.line	196, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	197, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	198, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	199, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1021
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	SUBIA	0xff
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVIA	0x00
	BTRSC	STATUS,0
	MGOTO	_00003_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,W
_00003_DS_:
	SUBIA	0x00
	BANKSEL	r0x1023
	MOVAR	r0x1023
;;1	MOVAR	r0x1024
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,0
	INCR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00004_DS_:
	.line	200, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	201, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	202, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload; 
	MOVIA	0x03
	SFUN	_T1CR1
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x205=517), size=2
	.line	203, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00215_DS_
	MOVIA	0x05
	SUBAR	_T1Counter,W
_00215_DS_:
	BTRSS	STATUS,0
	MGOTO	_00195_DS_
;;unsigned compare: left < lit (0x27C=636), size=2
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00216_DS_
	MOVIA	0x7c
	SUBAR	_T1Counter,W
_00216_DS_:
	BTRSC	STATUS,0
	MGOTO	_00195_DS_
	.line	205, "main.c"; 	RemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,3
	.line	206, "main.c"; 	MaybeRemoteStart = 1;		//疑似遥控数据头
	BSR	_Status,2
	.line	207, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	208, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	209, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	210, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	211, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	211, "main.c"; 	}
	MGOTO	_00198_DS_
_00195_DS_:
	.line	213, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00198_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x20=32), size=2
	.line	224, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00217_DS_
	MOVIA	0x20
	SUBAR	_T1Counter,W
_00217_DS_:
	BTRSS	STATUS,0
	MGOTO	_00189_DS_
;;unsigned compare: left < lit (0x33=51), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00218_DS_
	MOVIA	0x33
	SUBAR	_T1Counter,W
_00218_DS_:
	BTRSC	STATUS,0
	MGOTO	_00189_DS_
	.line	227, "main.c"; 	NOP();
	nop
	MGOTO	_00198_DS_
_00189_DS_:
	.line	232, "main.c"; 	cleanData();
	MCALL	_cleanData
_00198_DS_:
	.line	237, "main.c"; 	}
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
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	130, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	131, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	132, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	133, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1022
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	SUBIA	0xff
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	0x00
	BTRSC	STATUS,0
	MGOTO	_00005_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,W
_00005_DS_:
	SUBIA	0x00
	BANKSEL	r0x1024
	MOVAR	r0x1024
;;1	MOVAR	r0x1025
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,0
	INCR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00006_DS_:
	.line	134, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	135, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	136, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	137, "main.c"; 	if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
	BANKSEL	_Status
	BTRSS	_Status,2
	MGOTO	_00142_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xD9=217), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00178_DS_
	MOVIA	0xd9
	SUBAR	_T1Counter,W
_00178_DS_:
	BTRSS	STATUS,0
	MGOTO	_00142_DS_
;;unsigned compare: left < lit (0x150=336), size=2
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00179_DS_
	MOVIA	0x50
	SUBAR	_T1Counter,W
_00179_DS_:
	BTRSC	STATUS,0
	MGOTO	_00142_DS_
	.line	139, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	140, "main.c"; 	RemoteStart = 1;
	BSR	_Status,3
	.line	141, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	142, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	143, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	144, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	145, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	MGOTO	_00146_DS_
_00142_DS_:
	.line	147, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	MGOTO	_00139_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x59=89), size=2
	.line	149, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00180_DS_
	MOVIA	0x59
	SUBAR	_T1Counter,W
_00180_DS_:
	BTRSS	STATUS,0
	MGOTO	_00130_DS_
;;unsigned compare: left < lit (0x6C=108), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVIA	0x6c
	SUBAR	_T1Counter,W
_00181_DS_:
	BTRSC	STATUS,0
	MGOTO	_00130_DS_
	.line	151, "main.c"; 	OneCode = 1;
	BANKSEL	_Status
	BSR	_Status,1
	.line	152, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	MGOTO	_00131_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x17=23), size=2
_00130_DS_:
	.line	156, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00182_DS_
	MOVIA	0x17
	SUBAR	_T1Counter,W
_00182_DS_:
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
;;unsigned compare: left < lit (0x2A=42), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	MGOTO	_00183_DS_
	MOVIA	0x2a
	SUBAR	_T1Counter,W
_00183_DS_:
	BTRSC	STATUS,0
	MGOTO	_00126_DS_
	.line	158, "main.c"; 	ZeroCode = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	159, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	MGOTO	_00131_DS_
_00126_DS_:
	.line	163, "main.c"; 	ZeroCode = 0;
	BANKSEL	_Status
	BCR	_Status,0
	.line	164, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00131_DS_:
	.line	168, "main.c"; 	if(OneCode)
	BANKSEL	_Status
	BTRSS	_Status,1
	MGOTO	_00136_DS_
	.line	171, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	MCALL	_GetOneByte
	MGOTO	_00146_DS_
_00136_DS_:
	.line	173, "main.c"; 	else if(ZeroCode)
	BANKSEL	_Status
	BTRSS	_Status,0
	MGOTO	_00146_DS_
	.line	176, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	MCALL	_GetOneByte
	MGOTO	_00146_DS_
_00139_DS_:
	.line	181, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	182, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	183, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	184, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	185, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	186, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	187, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
_00146_DS_:
	.line	192, "main.c"; 	}
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
	.line	118, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	119, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	120, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	121, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	122, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	123, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	124, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	125, "main.c"; 	}
	RETURN	
; exit point of _cleanData


;	code size estimation:
;	  760+  209 =   969 instructions ( 2356 byte)

	end
