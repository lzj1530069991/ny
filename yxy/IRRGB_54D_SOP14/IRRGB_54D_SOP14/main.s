;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_irwork
	extern	_irpros
	extern	_setPWMduty
	extern	_keyCallBack
	extern	__divuchar
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__mulchar
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_rainbow
	extern	_colorChange
	extern	_keyCtr
	extern	_keyRead
	extern	_workCtr
	extern	_showRGB
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
	extern	_ledFlag
	extern	_ledCount
	extern	_lowTime
	extern	_Status
	extern	_proTime
	extern	_red
	extern	_green
	extern	_blue
	extern	_white
	extern	_workStep
	extern	_count1s
	extern	_light
	extern	_lightValue
	extern	_keyCount
	extern	_colorStep
	extern	_lastRed
	extern	_lastGreen
	extern	_lastBlue
	extern	_T1Counter
	extern	_accTimeH

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
_lastRed:
	.res	1
	.debuginfo gvariable name=_lastRed,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_lastGreen:
	.res	1
	.debuginfo gvariable name=_lastGreen,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_lastBlue:
	.res	1
	.debuginfo gvariable name=_lastBlue,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1023:
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
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lowTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_lowTime,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_Status:
	dw	0x00
	.debuginfo gvariable name=_Status,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_proTime:
	dw	0x00
	.debuginfo gvariable name=_proTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_red:
	dw	0x00
	.debuginfo gvariable name=_red,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_green:
	dw	0x00
	.debuginfo gvariable name=_green,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_blue:
	dw	0x00
	.debuginfo gvariable name=_blue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_white:
	dw	0x00
	.debuginfo gvariable name=_white,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_light:
	dw	0x00
	.debuginfo gvariable name=_light,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_lightValue:
	dw	0x00
	.debuginfo gvariable name=_lightValue,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_colorStep:
	dw	0x00
	.debuginfo gvariable name=_colorStep,1byte,array=0,entsize=1,ext=1,enc=unsigned


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
	.line	86, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	88, "main.c"; 	if(INTFbits.T1IF)
	BTRSS	_INTFbits,3
	LGOTO	_00106_DS_
	.line	90, "main.c"; 	accTimeH++;		//0.256ms执行一次
	BANKSEL	_accTimeH
	INCR	_accTimeH,F
	.line	92, "main.c"; 	INTF= (unsigned char)~(C_INT_TMR1);	// Clear T1IF flag bit	
	MOVIA	0xf7
	MOVAR	_INTF
_00106_DS_:
	.line	95, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	97, "main.c"; 	TMR0 += 56;
	MOVIA	0x38
	ADDAR	_TMR0,F
	.line	98, "main.c"; 	if(++count == 100)
	BANKSEL	_count
	INCR	_count,F
	MOVR	_count,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	100, "main.c"; 	count = 0;
	CLRR	_count
	.line	101, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00110_DS_:
	.line	105, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	107, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	110, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	113, "main.c"; 	}
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
;   _showRGB
;   _keyCtr
;   _workCtr
;   _gotoSleep
;   _proData
;   _proLow
;   _proHight
;   _showRGB
;   _keyCtr
;   _workCtr
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	393, "main.c"; 	IOSTA =   C_PA2_Input | C_PA4_Input | C_PA5_Input; 
	MOVIA	0x34
	IOST	_IOSTA
	.line	394, "main.c"; 	IOSTB =   0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTB
	.line	395, "main.c"; 	APHCON = 0xEF;
	MOVIA	0xef
	IOST	_APHCON
	.line	396, "main.c"; 	BPHCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	397, "main.c"; 	ABPLCON = 0xFF;
	MOVAR	_ABPLCON
	.line	398, "main.c"; 	PORTA = 0x00;    
	CLRR	_PORTA
	.line	399, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High
	CLRR	_PORTB
	.line	400, "main.c"; 	DISI();
	DISI
	.line	402, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	406, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	407, "main.c"; 	T1CR2 = C_PS1_Div64 | C_PS1_EN | C_TMR1_ClkSrc_Inst;
	MOVIA	0x05
	SFUN	_T1CR2
	.line	408, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	411, "main.c"; 	INT1Level = 1;
	BANKSEL	_Status
	BSR	_Status,5
	.line	414, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	416, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	417, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	420, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	423, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	424, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
	.line	425, "main.c"; 	data1 = data2 = data3 = data4 = 0;
	BANKSEL	_data4
	CLRR	_data4
	BANKSEL	_data3
	CLRR	_data3
	BANKSEL	_data2
	CLRR	_data2
	BANKSEL	_data1
	CLRR	_data1
_00370_DS_:
	.line	428, "main.c"; 	if(ReadOver)
	BANKSEL	_Status
	BTRSC	_Status,4
	.line	430, "main.c"; 	proData();
	LCALL	_proData
_00343_DS_:
	.line	432, "main.c"; 	if(INT1Level && (PORTA & 0x04))
	BANKSEL	_Status
	BTRSS	_Status,5
	LGOTO	_00348_DS_
	BTRSS	_PORTA,2
	LGOTO	_00348_DS_
	.line	434, "main.c"; 	INT1Level = 0;
	BCR	_Status,5
	.line	435, "main.c"; 	proLow();
	LCALL	_proLow
	LGOTO	_00349_DS_
_00348_DS_:
	.line	437, "main.c"; 	else if(INT1Level == 0 && (PORTA & 0x04) == 0)
	BANKSEL	_Status
	BTRSC	_Status,5
	LGOTO	_00349_DS_
	BTRSC	_PORTA,2
	LGOTO	_00349_DS_
	.line	440, "main.c"; 	INT1Level = 1;
	BSR	_Status,5
	.line	441, "main.c"; 	proHight();
	LCALL	_proHight
_00349_DS_:
	.line	443, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00352_DS_
	.line	444, "main.c"; 	red = green = blue = white = 0;
	BANKSEL	_white
	CLRR	_white
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_red
	CLRR	_red
_00352_DS_:
	.line	445, "main.c"; 	showRGB();
	LCALL	_showRGB
	.line	446, "main.c"; 	CLRWDT();
	clrwdt
	.line	447, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00370_DS_
	.line	449, "main.c"; 	IntFlag = 0;		//10ms执行一次
	CLRR	_IntFlag
	.line	450, "main.c"; 	keyCtr();
	LCALL	_keyCtr
	.line	451, "main.c"; 	if(workStep > 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	452, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	453, "main.c"; 	if(bitIndex == 0 &&  keyCount == 0 && workStep == 0 && ++sleepCount >= 250)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00358_DS_
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
	BTRSC	STATUS,2
	INCR	(_sleepCount + 1),F
;;unsigned compare: left < lit (0xFA=250), size=2
	MOVIA	0x00
	SUBAR	(_sleepCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00422_DS_
	MOVIA	0xfa
	SUBAR	_sleepCount,W
_00422_DS_:
	BTRSS	STATUS,0
	LGOTO	_00358_DS_
	.line	455, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00358_DS_:
	.line	457, "main.c"; 	if(++count1s > 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	MOVIA	0x65
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	459, "main.c"; 	count1s = 0;
	CLRR	_count1s
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5=5), size=1
	.line	460, "main.c"; 	if(workStep > 4)
	MOVIA	0x05
	BANKSEL	_workStep
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00370_DS_
	.line	463, "main.c"; 	if(lowTime > 0)
	BANKSEL	_lowTime
	MOVR	_lowTime,W
	IORAR	(_lowTime + 1),W
	BTRSC	STATUS,2
	LGOTO	_00363_DS_
	.line	465, "main.c"; 	--lowTime;
	MOVIA	0xff
	ADDAR	_lowTime,F
	BTRSS	STATUS,0
	DECR	(_lowTime + 1),F
	LGOTO	_00370_DS_
_00363_DS_:
	.line	469, "main.c"; 	sleepFlag = 1;
	MOVIA	0x01
	BANKSEL	_sleepFlag
	MOVAR	_sleepFlag
	.line	470, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	LGOTO	_00370_DS_
	.line	478, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_rainbow
	.debuginfo subprogram _rainbow
_rainbow:
; 2 exit points
	.line	728, "main.c"; 	if(colorStep == 1)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00586_DS_
	.line	730, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	731, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	732, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	LGOTO	_00587_DS_
_00586_DS_:
	.line	734, "main.c"; 	else if(colorStep == 2)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00583_DS_
	.line	736, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	737, "main.c"; 	lastGreen = 150;
	MOVIA	0x96
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	738, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	LGOTO	_00587_DS_
_00583_DS_:
	.line	740, "main.c"; 	else if(colorStep == 3)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00580_DS_
	.line	742, "main.c"; 	lastRed = 250;
	MOVIA	0xfa
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	743, "main.c"; 	lastGreen = 250;
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	744, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	LGOTO	_00587_DS_
_00580_DS_:
	.line	746, "main.c"; 	else if(colorStep == 4)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00577_DS_
	.line	748, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	749, "main.c"; 	lastGreen = 250;
	MOVIA	0xfa
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	750, "main.c"; 	lastBlue = 0;
	BANKSEL	_lastBlue
	CLRR	_lastBlue
	LGOTO	_00587_DS_
_00577_DS_:
	.line	752, "main.c"; 	else if(colorStep == 5)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00574_DS_
	.line	754, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	755, "main.c"; 	lastGreen = 250;
	MOVIA	0xfa
	BANKSEL	_lastGreen
	MOVAR	_lastGreen
	.line	756, "main.c"; 	lastBlue = 250;
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
	LGOTO	_00587_DS_
_00574_DS_:
	.line	758, "main.c"; 	else if(colorStep == 6)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00571_DS_
	.line	760, "main.c"; 	lastRed = 0;
	BANKSEL	_lastRed
	CLRR	_lastRed
	.line	761, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	762, "main.c"; 	lastBlue = 250;
	MOVIA	0xfa
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
	LGOTO	_00587_DS_
_00571_DS_:
	.line	764, "main.c"; 	else if(colorStep == 7)
	BANKSEL	_colorStep
	MOVR	_colorStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00587_DS_
	.line	766, "main.c"; 	lastRed = 150;
	MOVIA	0x96
	BANKSEL	_lastRed
	MOVAR	_lastRed
	.line	767, "main.c"; 	lastGreen = 0;
	BANKSEL	_lastGreen
	CLRR	_lastGreen
	.line	768, "main.c"; 	lastBlue = 250;
	MOVIA	0xfa
	BANKSEL	_lastBlue
	MOVAR	_lastBlue
_00587_DS_:
	.line	771, "main.c"; 	if(red > lastRed)
	BANKSEL	_red
	MOVR	_red,W
	BANKSEL	_lastRed
	SUBAR	_lastRed,W
	BTRSC	STATUS,0
	LGOTO	_00001_DS_
	.line	772, "main.c"; 	red--;
	BANKSEL	_red
	DECR	_red,F
_00001_DS_:
	.line	773, "main.c"; 	if(green > lastGreen)
	BANKSEL	_green
	MOVR	_green,W
	BANKSEL	_lastGreen
	SUBAR	_lastGreen,W
	BTRSC	STATUS,0
	LGOTO	_00002_DS_
	.line	774, "main.c"; 	green--;
	BANKSEL	_green
	DECR	_green,F
_00002_DS_:
	.line	775, "main.c"; 	if(blue > lastBlue)
	BANKSEL	_blue
	MOVR	_blue,W
	BANKSEL	_lastBlue
	SUBAR	_lastBlue,W
	BTRSC	STATUS,0
	LGOTO	_00003_DS_
	.line	776, "main.c"; 	blue--;
	BANKSEL	_blue
	DECR	_blue,F
_00003_DS_:
	.line	777, "main.c"; 	if(red < lastRed)
	BANKSEL	_lastRed
	MOVR	_lastRed,W
	BANKSEL	_red
	SUBAR	_red,W
	BTRSS	STATUS,0
	.line	778, "main.c"; 	red++;
	INCR	_red,F
	.line	779, "main.c"; 	if(green < lastGreen)
	BANKSEL	_lastGreen
	MOVR	_lastGreen,W
	BANKSEL	_green
	SUBAR	_green,W
	BTRSS	STATUS,0
	.line	780, "main.c"; 	green++;
	INCR	_green,F
	.line	781, "main.c"; 	if(blue < lastBlue)
	BANKSEL	_lastBlue
	MOVR	_lastBlue,W
	BANKSEL	_blue
	SUBAR	_blue,W
	BTRSS	STATUS,0
	.line	782, "main.c"; 	blue++;
	INCR	_blue,F
	.line	784, "main.c"; 	if(red == lastRed && blue == lastBlue && green == lastGreen)
	BANKSEL	_lastRed
	MOVR	_lastRed,W
	BANKSEL	_red
	XORAR	_red,W
	BTRSS	STATUS,2
	LGOTO	_00606_DS_
	BANKSEL	_lastBlue
	MOVR	_lastBlue,W
	BANKSEL	_blue
	XORAR	_blue,W
	BTRSS	STATUS,2
	LGOTO	_00606_DS_
	BANKSEL	_lastGreen
	MOVR	_lastGreen,W
	BANKSEL	_green
	XORAR	_green,W
	BTRSS	STATUS,2
	LGOTO	_00606_DS_
	.line	786, "main.c"; 	if(++colorStep > 7)
	BANKSEL	_colorStep
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	LGOTO	_00606_DS_
	.line	787, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
_00606_DS_:
	.line	789, "main.c"; 	}
	RETURN	
; exit point of _rainbow

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_colorChange
	.debuginfo subprogram _colorChange
_colorChange:
; 2 exit points
	.line	660, "main.c"; 	if(++colorStep > 16)
	BANKSEL	_colorStep
	INCR	_colorStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x11=17), size=1
	MOVIA	0x11
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	LGOTO	_00531_DS_
	.line	661, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	MOVAR	_colorStep
_00531_DS_:
	.line	662, "main.c"; 	white = red = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_red
	CLRR	_red
	BANKSEL	_white
	CLRR	_white
;;unsigned compare: left < lit (0x1=1), size=1
	.line	663, "main.c"; 	switch(colorStep)
	MOVIA	0x01
	BANKSEL	_colorStep
	SUBAR	_colorStep,W
	BTRSS	STATUS,0
	LGOTO	_00549_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x11=17), size=1
	MOVIA	0x11
	SUBAR	_colorStep,W
	BTRSC	STATUS,0
	LGOTO	_00549_DS_
	DECR	_colorStep,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	((_00563_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1023,W
	ADDIA	_00563_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00563_DS_:
	LGOTO	_00532_DS_
	LGOTO	_00533_DS_
	LGOTO	_00534_DS_
	LGOTO	_00535_DS_
	LGOTO	_00536_DS_
	LGOTO	_00537_DS_
	LGOTO	_00538_DS_
	LGOTO	_00539_DS_
	LGOTO	_00540_DS_
	LGOTO	_00541_DS_
	LGOTO	_00542_DS_
	LGOTO	_00543_DS_
	LGOTO	_00544_DS_
	LGOTO	_00545_DS_
	LGOTO	_00546_DS_
	LGOTO	_00547_DS_
_00532_DS_:
	.line	666, "main.c"; 	red = 250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	667, "main.c"; 	break;
	LGOTO	_00549_DS_
_00533_DS_:
	.line	669, "main.c"; 	green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	.line	670, "main.c"; 	break;
	LGOTO	_00549_DS_
_00534_DS_:
	.line	672, "main.c"; 	blue = 250;
	MOVIA	0xfa
	BANKSEL	_blue
	MOVAR	_blue
	.line	673, "main.c"; 	break;
	LGOTO	_00549_DS_
_00535_DS_:
	.line	675, "main.c"; 	white = 250;
	MOVIA	0xfa
	BANKSEL	_white
	MOVAR	_white
	.line	676, "main.c"; 	break;
	LGOTO	_00549_DS_
_00536_DS_:
	.line	678, "main.c"; 	red = green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	BANKSEL	_red
	MOVAR	_red
	.line	679, "main.c"; 	break;
	LGOTO	_00549_DS_
_00537_DS_:
	.line	681, "main.c"; 	green = blue = 250;
	MOVIA	0xfa
	BANKSEL	_blue
	MOVAR	_blue
	BANKSEL	_green
	MOVAR	_green
	.line	682, "main.c"; 	break;
	LGOTO	_00549_DS_
_00538_DS_:
	.line	684, "main.c"; 	red = blue = 250;
	MOVIA	0xfa
	BANKSEL	_blue
	MOVAR	_blue
	BANKSEL	_red
	MOVAR	_red
	.line	685, "main.c"; 	break;
	LGOTO	_00549_DS_
_00539_DS_:
	.line	687, "main.c"; 	red =  250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	688, "main.c"; 	green = 100;
	MOVIA	0x64
	BANKSEL	_green
	MOVAR	_green
	.line	689, "main.c"; 	break;
	LGOTO	_00549_DS_
_00540_DS_:
	.line	691, "main.c"; 	green = 100;
	MOVIA	0x64
	BANKSEL	_green
	MOVAR	_green
	.line	692, "main.c"; 	blue = 250;
	MOVIA	0xfa
	BANKSEL	_blue
	MOVAR	_blue
	.line	693, "main.c"; 	break;
	LGOTO	_00549_DS_
_00541_DS_:
	.line	695, "main.c"; 	red = 100;
	MOVIA	0x64
	BANKSEL	_red
	MOVAR	_red
	.line	696, "main.c"; 	blue = 250;
	MOVIA	0xfa
	BANKSEL	_blue
	MOVAR	_blue
	.line	697, "main.c"; 	break;
	LGOTO	_00549_DS_
_00542_DS_:
	.line	699, "main.c"; 	red =  100;
	MOVIA	0x64
	BANKSEL	_red
	MOVAR	_red
	.line	700, "main.c"; 	green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	.line	701, "main.c"; 	break;
	LGOTO	_00549_DS_
_00543_DS_:
	.line	703, "main.c"; 	green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	.line	704, "main.c"; 	blue = 100;
	MOVIA	0x64
	BANKSEL	_blue
	MOVAR	_blue
	.line	705, "main.c"; 	break;
	LGOTO	_00549_DS_
_00544_DS_:
	.line	707, "main.c"; 	red = 250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	708, "main.c"; 	blue = 100;
	MOVIA	0x64
	BANKSEL	_blue
	MOVAR	_blue
	.line	709, "main.c"; 	break;
	LGOTO	_00549_DS_
_00545_DS_:
	.line	711, "main.c"; 	red =  50;
	MOVIA	0x32
	BANKSEL	_red
	MOVAR	_red
	.line	712, "main.c"; 	green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	.line	713, "main.c"; 	break;
	LGOTO	_00549_DS_
_00546_DS_:
	.line	715, "main.c"; 	green = 250;
	MOVIA	0xfa
	BANKSEL	_green
	MOVAR	_green
	.line	716, "main.c"; 	blue = 50;
	MOVIA	0x32
	BANKSEL	_blue
	MOVAR	_blue
	.line	717, "main.c"; 	break;
	LGOTO	_00549_DS_
_00547_DS_:
	.line	719, "main.c"; 	red = 250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	720, "main.c"; 	blue = 50;
	MOVIA	0x32
	BANKSEL	_blue
	MOVAR	_blue
_00549_DS_:
	.line	723, "main.c"; 	}
	RETURN	
; exit point of _colorChange

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _keyRead
;1 compiler assigned register :
;   r0x1025
;; Starting pCode block
.segment "code"; module=main, function=_keyCtr
	.debuginfo subprogram _keyCtr
;local variable name mapping:
	.debuginfo variable _kclick=r0x1025,enc=unsigned
_keyCtr:
; 2 exit points
	.line	637, "main.c"; 	char kclick = keyRead(0x30 & (~PORTA));
	COMR	_PORTA,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	0x30
	ANDAR	r0x1025,F
	MOVR	r0x1025,W
	LCALL	_keyRead
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	638, "main.c"; 	if(kclick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00525_DS_
	.line	640, "main.c"; 	if(++workStep > 5)
	BANKSEL	_workStep
	INCR	_workStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	.line	641, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	642, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	643, "main.c"; 	if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00521_DS_
	.line	645, "main.c"; 	light = 5;
	MOVIA	0x05
	BANKSEL	_light
	MOVAR	_light
	.line	646, "main.c"; 	lightValue = 25*light;
	MOVIA	0x7d
	BANKSEL	_lightValue
	MOVAR	_lightValue
	.line	647, "main.c"; 	colorStep = 0;
	BANKSEL	_colorStep
	CLRR	_colorStep
	LGOTO	_00525_DS_
_00521_DS_:
	.line	649, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00525_DS_
	.line	651, "main.c"; 	lowTime = 600;
	MOVIA	0x58
	BANKSEL	_lowTime
	MOVAR	_lowTime
	MOVIA	0x02
	MOVAR	(_lowTime + 1)
_00525_DS_:
	.line	655, "main.c"; 	}
	RETURN	
; exit point of _keyCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divuchar
;   __divuchar
;   __divuchar
;   __divuchar
;2 compiler assigned registers:
;   r0x1024
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _keyStatus=r0x1024,enc=unsigned
_keyRead:
; 2 exit points
	.line	587, "main.c"; 	char keyRead(uint8 keyStatus)	
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	589, "main.c"; 	if(keyStatus)
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	LGOTO	_00509_DS_
	.line	591, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
	.line	592, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	593, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00510_DS_
	.line	595, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	.line	596, "main.c"; 	if(keyStatus & 0x10)
	BANKSEL	r0x1024
	BTRSS	r0x1024,4
	LGOTO	_00497_DS_
	.line	598, "main.c"; 	if(++lightValue > 250)
	BANKSEL	_lightValue
	INCR	_lightValue,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFB=251), size=1
	MOVIA	0xfb
	SUBAR	_lightValue,W
	BTRSS	STATUS,0
	LGOTO	_00491_DS_
	.line	599, "main.c"; 	lightValue = 250;
	MOVIA	0xfa
	MOVAR	_lightValue
_00491_DS_:
	.line	600, "main.c"; 	light = lightValue/25;
	MOVIA	0x19
	MOVAR	STK00
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	LCALL	__divuchar
	BANKSEL	_light
	MOVAR	_light
	LGOTO	_00498_DS_
_00497_DS_:
	.line	602, "main.c"; 	else if(keyStatus &= 0x20)
	BANKSEL	r0x1024
	BTRSS	r0x1024,5
	LGOTO	_00498_DS_
	.line	604, "main.c"; 	if(--lightValue < 25)
	BANKSEL	_lightValue
	DECR	_lightValue,F
;;unsigned compare: left < lit (0x19=25), size=1
	MOVIA	0x19
	SUBAR	_lightValue,W
	BTRSC	STATUS,0
	LGOTO	_00493_DS_
	.line	605, "main.c"; 	lightValue = 25;
	MOVIA	0x19
	MOVAR	_lightValue
_00493_DS_:
	.line	606, "main.c"; 	light = lightValue/25;
	MOVIA	0x19
	MOVAR	STK00
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	LCALL	__divuchar
	BANKSEL	_light
	MOVAR	_light
_00498_DS_:
	.line	608, "main.c"; 	if(!longPressFlag)
	BANKSEL	_Status
	BTRSC	_Status,6
	LGOTO	_00510_DS_
	.line	610, "main.c"; 	longPressFlag = 1;
	BSR	_Status,6
	.line	611, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00511_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00509_DS_:
	.line	617, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00506_DS_
	.line	619, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	620, "main.c"; 	longPressFlag = 0;
	BANKSEL	_Status
	BCR	_Status,6
	.line	621, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00511_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00506_DS_:
	.line	623, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00507_DS_
	.line	625, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	626, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00511_DS_
_00507_DS_:
	.line	628, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00510_DS_:
	.line	630, "main.c"; 	return 0;
	MOVIA	0x00
_00511_DS_:
	.line	631, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   __mulchar
;   _colorChange
;   _colorChange
;   _rainbow
;   _rainbow
;   __mulchar
;   _colorChange
;   _colorChange
;   _rainbow
;   _rainbow
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	530, "main.c"; 	if(lightValue == 0)
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	BTRSS	STATUS,2
	LGOTO	_00449_DS_
	.line	531, "main.c"; 	lightValue = 25*light;
	MOVIA	0x19
	MOVAR	STK00
	BANKSEL	_light
	MOVR	_light,W
	LCALL	__mulchar
	BANKSEL	_lightValue
	MOVAR	_lightValue
_00449_DS_:
	.line	532, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00483_DS_
	.line	534, "main.c"; 	white = red = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_red
	CLRR	_red
	BANKSEL	_white
	CLRR	_white
	.line	535, "main.c"; 	PORTB &= 0xBE;
	MOVIA	0xbe
	ANDAR	_PORTB,F
	.line	536, "main.c"; 	PORTA &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTA,F
	LGOTO	_00485_DS_
_00483_DS_:
	.line	538, "main.c"; 	else if(workStep == 1)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00480_DS_
	.line	540, "main.c"; 	white = lightValue;
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	BANKSEL	_white
	MOVAR	_white
	.line	541, "main.c"; 	red = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_red
	CLRR	_red
	LGOTO	_00485_DS_
_00480_DS_:
	.line	543, "main.c"; 	else if(workStep == 2)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00477_DS_
	.line	545, "main.c"; 	red = lightValue;
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	BANKSEL	_red
	MOVAR	_red
	.line	546, "main.c"; 	white = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_white
	CLRR	_white
	LGOTO	_00485_DS_
_00477_DS_:
	.line	548, "main.c"; 	else if(workStep == 3)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00474_DS_
	.line	550, "main.c"; 	green = lightValue;
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	BANKSEL	_green
	MOVAR	_green
	.line	551, "main.c"; 	white = red = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_red
	CLRR	_red
	BANKSEL	_white
	CLRR	_white
	LGOTO	_00485_DS_
_00474_DS_:
	.line	553, "main.c"; 	else if(workStep == 4)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x04
	BTRSS	STATUS,2
	LGOTO	_00471_DS_
	.line	555, "main.c"; 	blue = lightValue;
	BANKSEL	_lightValue
	MOVR	_lightValue,W
	BANKSEL	_blue
	MOVAR	_blue
	.line	556, "main.c"; 	white = green = red = 0;
	BANKSEL	_red
	CLRR	_red
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_white
	CLRR	_white
	LGOTO	_00485_DS_
_00471_DS_:
	.line	558, "main.c"; 	else if(workStep == 5)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x05
	BTRSS	STATUS,2
	LGOTO	_00468_DS_
	.line	560, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	LGOTO	_00485_DS_
	.line	561, "main.c"; 	colorChange();
	LCALL	_colorChange
	LGOTO	_00485_DS_
_00468_DS_:
	.line	563, "main.c"; 	else if(workStep == 6)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x06
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	.line	565, "main.c"; 	if(count1s == 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSS	STATUS,2
	LGOTO	_00455_DS_
	.line	567, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	568, "main.c"; 	colorChange();
	LCALL	_colorChange
	LGOTO	_00485_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x33=51), size=1
_00455_DS_:
	.line	570, "main.c"; 	else if(count1s > 50)
	MOVIA	0x33
	BANKSEL	_count1s
	SUBAR	_count1s,W
	BTRSS	STATUS,0
	LGOTO	_00485_DS_
	.line	572, "main.c"; 	ledFlag = 0;
	BANKSEL	_ledFlag
	CLRR	_ledFlag
	LGOTO	_00485_DS_
_00465_DS_:
	.line	575, "main.c"; 	else if(workStep == 7)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x07
	BTRSS	STATUS,2
	LGOTO	_00462_DS_
	.line	577, "main.c"; 	if(count1s %2 == 0)
	BANKSEL	_count1s
	BTRSC	_count1s,0
	LGOTO	_00485_DS_
	.line	578, "main.c"; 	rainbow();
	LCALL	_rainbow
	LGOTO	_00485_DS_
_00462_DS_:
	.line	580, "main.c"; 	else if(workStep == 8)
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x08
	BTRSC	STATUS,2
	.line	582, "main.c"; 	rainbow();
	LCALL	_rainbow
_00485_DS_:
	.line	584, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_showRGB
	.debuginfo subprogram _showRGB
_showRGB:
; 0 exit points
	.line	483, "main.c"; 	if(ledFlag == 0)
	BANKSEL	_ledFlag
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	LGOTO	_00428_DS_
	.line	485, "main.c"; 	PORTB &= 0xDE;
	MOVIA	0xde
	ANDAR	_PORTB,F
	.line	486, "main.c"; 	PORTA &= 0xFC;
	MOVIA	0xfc
	ANDAR	_PORTA,F
	.line	487, "main.c"; 	return;
	LGOTO	_00443_DS_
_00428_DS_:
	.line	489, "main.c"; 	if(white > ledCount)
	BANKSEL	_white
	MOVR	_white,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00430_DS_
	.line	491, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	LGOTO	_00431_DS_
_00430_DS_:
	.line	495, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
_00431_DS_:
	.line	498, "main.c"; 	if(blue > ledCount)
	BANKSEL	_blue
	MOVR	_blue,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00433_DS_
	.line	500, "main.c"; 	PORTA |= 0x01;
	BSR	_PORTA,0
	LGOTO	_00434_DS_
_00433_DS_:
	.line	504, "main.c"; 	PORTA &= 0xFE;
	BCR	_PORTA,0
_00434_DS_:
	.line	507, "main.c"; 	if(green > ledCount)
	BANKSEL	_green
	MOVR	_green,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00436_DS_
	.line	509, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
	LGOTO	_00437_DS_
_00436_DS_:
	.line	513, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
_00437_DS_:
	.line	516, "main.c"; 	if(red > ledCount)
	BANKSEL	_red
	MOVR	_red,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00439_DS_
	.line	518, "main.c"; 	PORTB |= 0x01;
	BSR	_PORTB,0
	LGOTO	_00440_DS_
_00439_DS_:
	.line	522, "main.c"; 	PORTB &= 0xFE;
	BCR	_PORTB,0
_00440_DS_:
	.line	524, "main.c"; 	if(++ledCount > 254)
	BANKSEL	_ledCount
	INCR	_ledCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xFF=255), size=1
	MOVIA	0xff
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	525, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
_00443_DS_:
	.line	526, "main.c"; 	}
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
	.line	372, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	CLRR	(_sleepCount + 1)
	.line	373, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	374, "main.c"; 	AWUCON = 0x34;
	MOVIA	0x34
	MOVAR	_AWUCON
	.line	375, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;
	MOVIA	0x0b
	MOVAR	_INTE
	.line	376, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	377, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	378, "main.c"; 	CLRWDT();
	clrwdt
	.line	379, "main.c"; 	SLEEP();
	sleep
	.line	380, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x0b
	MOVAR	_INTE
	.line	381, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	383, "main.c"; 	PCON = C_WDT_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x80
	MOVAR	_PCON
	.line	384, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	385, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	386, "main.c"; 	value = 0;
	BANKSEL	_value
	CLRR	_value
	.line	387, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;1 compiler assigned register :
;   STK00
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
	LGOTO	_00264_DS_
	.line	290, "main.c"; 	ledFlag = 1;
	MOVIA	0x01
	BANKSEL	_ledFlag
	MOVAR	_ledFlag
	.line	291, "main.c"; 	colorStep = 0;
	BANKSEL	_colorStep
	CLRR	_colorStep
	.line	292, "main.c"; 	if(workStep == 0 && irCode > 1)	//遥控失效
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00242_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2=2), size=1
	MOVIA	0x02
	BANKSEL	_irCode
	SUBAR	_irCode,W
	BTRSS	STATUS,0
	LGOTO	_00242_DS_
	.line	294, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
	.line	295, "main.c"; 	return;
	LGOTO	_00265_DS_
_00242_DS_:
	.line	297, "main.c"; 	switch(irCode)
	BANKSEL	_irCode
	MOVR	_irCode,W
	BTRSC	STATUS,2
	LGOTO	_00247_DS_
	MOVR	_irCode,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00244_DS_
	MOVR	_irCode,W
	XORIA	0x06
	BTRSC	STATUS,2
	LGOTO	_00260_DS_
	MOVR	_irCode,W
	XORIA	0x08
	BTRSC	STATUS,2
	LGOTO	_00261_DS_
	MOVR	_irCode,W
	XORIA	0x09
	BTRSC	STATUS,2
	LGOTO	_00251_DS_
	MOVR	_irCode,W
	XORIA	0x0a
	BTRSC	STATUS,2
	LGOTO	_00254_DS_
	MOVR	_irCode,W
	XORIA	0x0c
	BTRSC	STATUS,2
	LGOTO	_00248_DS_
	MOVR	_irCode,W
	XORIA	0x0d
	BTRSC	STATUS,2
	LGOTO	_00257_DS_
	MOVR	_irCode,W
	XORIA	0x0e
	BTRSC	STATUS,2
	LGOTO	_00258_DS_
	MOVR	_irCode,W
	XORIA	0x14
	BTRSC	STATUS,2
	LGOTO	_00259_DS_
	MOVR	_irCode,W
	XORIA	0x15
	BTRSC	STATUS,2
	LGOTO	_00255_DS_
	MOVR	_irCode,W
	XORIA	0x16
	BTRSC	STATUS,2
	LGOTO	_00256_DS_
	LGOTO	_00264_DS_
_00244_DS_:
	.line	300, "main.c"; 	if(workStep == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	.line	302, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	.line	303, "main.c"; 	light = 5;
	MOVIA	0x05
	BANKSEL	_light
	MOVAR	_light
	.line	304, "main.c"; 	lightValue = 25*light;
	MOVIA	0x7d
	BANKSEL	_lightValue
	MOVAR	_lightValue
	.line	306, "main.c"; 	break;
	LGOTO	_00264_DS_
_00247_DS_:
	.line	308, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	310, "main.c"; 	break;
	LGOTO	_00264_DS_
_00248_DS_:
	.line	312, "main.c"; 	if(++light > 10)
	BANKSEL	_light
	INCR	_light,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_light,W
	BTRSS	STATUS,0
	LGOTO	_00250_DS_
	.line	314, "main.c"; 	light = 10;
	MOVIA	0x0a
	MOVAR	_light
_00250_DS_:
	.line	316, "main.c"; 	lightValue = 25*light;
	MOVIA	0x19
	MOVAR	STK00
	BANKSEL	_light
	MOVR	_light,W
	LCALL	__mulchar
	BANKSEL	_lightValue
	MOVAR	_lightValue
	.line	317, "main.c"; 	break;
	LGOTO	_00264_DS_
_00251_DS_:
	.line	319, "main.c"; 	if(--light < 1)
	BANKSEL	_light
	DECR	_light,F
;;unsigned compare: left < lit (0x1=1), size=1
	MOVIA	0x01
	SUBAR	_light,W
	BTRSC	STATUS,0
	LGOTO	_00253_DS_
	.line	321, "main.c"; 	light = 1;
	MOVIA	0x01
	MOVAR	_light
_00253_DS_:
	.line	323, "main.c"; 	lightValue = 25*light;
	MOVIA	0x19
	MOVAR	STK00
	BANKSEL	_light
	MOVR	_light,W
	LCALL	__mulchar
	BANKSEL	_lightValue
	MOVAR	_lightValue
	.line	324, "main.c"; 	break;
	LGOTO	_00264_DS_
_00254_DS_:
	.line	326, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	327, "main.c"; 	break;
	LGOTO	_00264_DS_
_00255_DS_:
	.line	329, "main.c"; 	workStep = 2;
	MOVIA	0x02
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	330, "main.c"; 	break;
	LGOTO	_00264_DS_
_00256_DS_:
	.line	332, "main.c"; 	workStep = 3;
	MOVIA	0x03
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	333, "main.c"; 	break;
	LGOTO	_00264_DS_
_00257_DS_:
	.line	335, "main.c"; 	workStep = 4;
	MOVIA	0x04
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	336, "main.c"; 	break;
	LGOTO	_00264_DS_
_00258_DS_:
	.line	338, "main.c"; 	workStep = 5;
	MOVIA	0x05
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	339, "main.c"; 	lowTime = 600;
	MOVIA	0x58
	BANKSEL	_lowTime
	MOVAR	_lowTime
	MOVIA	0x02
	MOVAR	(_lowTime + 1)
	.line	340, "main.c"; 	break;
	LGOTO	_00264_DS_
_00259_DS_:
	.line	342, "main.c"; 	workStep = 6;
	MOVIA	0x06
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	343, "main.c"; 	lowTime = 1800;
	MOVIA	0x08
	BANKSEL	_lowTime
	MOVAR	_lowTime
	MOVIA	0x07
	MOVAR	(_lowTime + 1)
	.line	344, "main.c"; 	break;
	LGOTO	_00264_DS_
_00260_DS_:
	.line	346, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	BANKSEL	_colorStep
	MOVAR	_colorStep
	.line	347, "main.c"; 	white = red = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_white
	CLRR	_white
	.line	348, "main.c"; 	red = 250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	349, "main.c"; 	workStep = 7;
	MOVIA	0x07
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	350, "main.c"; 	lowTime = 3600;
	MOVIA	0x10
	BANKSEL	_lowTime
	MOVAR	_lowTime
	MOVIA	0x0e
	MOVAR	(_lowTime + 1)
	.line	351, "main.c"; 	break;
	LGOTO	_00264_DS_
_00261_DS_:
	.line	353, "main.c"; 	colorStep = 1;
	MOVIA	0x01
	BANKSEL	_colorStep
	MOVAR	_colorStep
	.line	354, "main.c"; 	white = red = green = blue = 0;
	BANKSEL	_blue
	CLRR	_blue
	BANKSEL	_green
	CLRR	_green
	BANKSEL	_white
	CLRR	_white
	.line	355, "main.c"; 	red = 250;
	MOVIA	0xfa
	BANKSEL	_red
	MOVAR	_red
	.line	356, "main.c"; 	workStep = 8;
	MOVIA	0x08
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	357, "main.c"; 	lowTime = 7200;
	MOVIA	0x20
	BANKSEL	_lowTime
	MOVAR	_lowTime
	MOVIA	0x1c
	MOVAR	(_lowTime + 1)
_00264_DS_:
	.line	361, "main.c"; 	ReadOver = 0;
	BANKSEL	_Status
	BCR	_Status,4
_00265_DS_:
	.line	362, "main.c"; 	}
	RETURN	
; exit point of _proData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_GetOneByte
	.debuginfo subprogram _GetOneByte
;local variable name mapping:
	.debuginfo variable _bitNub=r0x1026,enc=unsigned
_GetOneByte:
; 2 exit points
	.line	240, "main.c"; 	void GetOneByte(uint8 bitNub)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	242, "main.c"; 	if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00236_DS_
	.line	244, "main.c"; 	if(bitIndex == 0)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	BTRSS	STATUS,2
	LGOTO	_00220_DS_
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
_00220_DS_:
	.line	250, "main.c"; 	++bitIndex;
	BANKSEL	_bitIndex
	INCR	_bitIndex,F
	.line	251, "main.c"; 	if(bitNub)
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00004_DS_
	.line	253, "main.c"; 	value |= 0x80;
	BANKSEL	_value
	BSR	_value,7
_00004_DS_:
	.line	256, "main.c"; 	if(bitIndex == 8)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x08
	BTRSS	STATUS,2
	LGOTO	_00232_DS_
	.line	258, "main.c"; 	data1 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data1
	MOVAR	_data1
	LGOTO	_00233_DS_
_00232_DS_:
	.line	260, "main.c"; 	else if(bitIndex == 16)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x10
	BTRSS	STATUS,2
	LGOTO	_00229_DS_
	.line	262, "main.c"; 	data2 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data2
	MOVAR	_data2
	LGOTO	_00233_DS_
_00229_DS_:
	.line	265, "main.c"; 	else if(bitIndex == 24)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x18
	BTRSS	STATUS,2
	LGOTO	_00226_DS_
	.line	267, "main.c"; 	data3 = value;
	BANKSEL	_value
	MOVR	_value,W
	BANKSEL	_data3
	MOVAR	_data3
	LGOTO	_00233_DS_
_00226_DS_:
	.line	270, "main.c"; 	else if(bitIndex == 32)
	BANKSEL	_bitIndex
	MOVR	_bitIndex,W
	XORIA	0x20
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
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
;;shiftRight_Left2ResultLit:5590: shCount=1, size=1, sign=0, same=1, offr=0
_00233_DS_:
	.line	281, "main.c"; 	value = value >> 1;
	BCR	STATUS,0
	BANKSEL	_value
	RRR	_value,F
_00236_DS_:
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
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
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
;;3	MOVAR	r0x1026
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	SUBIA	0xff
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00005_DS_
	BANKSEL	r0x1028
	INCR	r0x1028,W
_00005_DS_:
	SUBIA	0x00
	BANKSEL	r0x1028
	MOVAR	r0x1028
;;1	MOVAR	r0x1029
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BTRSC	STATUS,0
	INCR	r0x1028,W
	BTRSC	STATUS,2
	LGOTO	_00006_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00006_DS_:
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
;;unsigned compare: left >= lit (0x1F7=503), size=2
	.line	203, "main.c"; 	if((T1Counter > (HeadCont_L - (FaultTolerant*FaultTolerantX)))&&(T1Counter < (HeadCont_L + (FaultTolerant*FaultTolerantX))))
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	MOVIA	0xf7
	SUBAR	_T1Counter,W
_00211_DS_:
	BTRSS	STATUS,0
	LGOTO	_00191_DS_
;;unsigned compare: left < lit (0x26E=622), size=2
	MOVIA	0x02
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00212_DS_
	MOVIA	0x6e
	SUBAR	_T1Counter,W
_00212_DS_:
	BTRSC	STATUS,0
	LGOTO	_00191_DS_
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
	LGOTO	_00194_DS_
_00191_DS_:
	.line	213, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00194_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1B=27), size=2
	.line	224, "main.c"; 	if((T1Counter >(OneCode_L - FaultTolerant))&&(T1Counter < (OneCode_L + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00213_DS_
	MOVIA	0x1b
	SUBAR	_T1Counter,W
_00213_DS_:
	BTRSS	STATUS,0
	LGOTO	_00185_DS_
;;unsigned compare: left < lit (0x2E=46), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00214_DS_
	MOVIA	0x2e
	SUBAR	_T1Counter,W
_00214_DS_:
	BTRSC	STATUS,0
	LGOTO	_00185_DS_
	.line	227, "main.c"; 	NOP();
	nop
	LGOTO	_00194_DS_
_00185_DS_:
	.line	232, "main.c"; 	cleanData();
	LCALL	_cleanData
_00194_DS_:
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
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_proHight
	.debuginfo subprogram _proHight
_proHight:
; 2 exit points
	.line	129, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	130, "main.c"; 	T1Counter = accTimeH;
	BANKSEL	_accTimeH
	MOVR	_accTimeH,W
	BANKSEL	_T1Counter
	MOVAR	_T1Counter
	CLRR	(_T1Counter + 1)
	.line	131, "main.c"; 	T1Counter <<= 8;
	MOVR	_T1Counter,W
	MOVAR	(_T1Counter + 1)
	CLRR	_T1Counter
	.line	132, "main.c"; 	T1Counter += (0xFF - TMR1);
	SFUNR	_TMR1
;;3	MOVAR	r0x1027
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	SUBIA	0xff
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVIA	0x00
	BTRSC	STATUS,0
	LGOTO	_00007_DS_
	BANKSEL	r0x1029
	INCR	r0x1029,W
_00007_DS_:
	SUBIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
;;1	MOVAR	r0x102A
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	_T1Counter
	ADDAR	_T1Counter,F
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,0
	INCR	r0x1029,W
	BTRSC	STATUS,2
	LGOTO	_00008_DS_
	BANKSEL	_T1Counter
	ADDAR	(_T1Counter + 1),F
_00008_DS_:
	.line	133, "main.c"; 	accTimeH = 0;
	BANKSEL	_accTimeH
	CLRR	_accTimeH
	.line	134, "main.c"; 	TMRH = 0x00;
	CLRR	_TMRH
	.line	135, "main.c"; 	TMR1 = 0xFF;
	MOVIA	0xff
	SFUN	_TMR1
	.line	136, "main.c"; 	T1CR1 = C_TMR1_En | C_TMR1_Reload;
	MOVIA	0x03
	SFUN	_T1CR1
	.line	137, "main.c"; 	if(MaybeRemoteStart && T1Counter > (HeadCont_H - (FaultTolerant*FaultTolerantX)) && T1Counter < (HeadCont_H + (FaultTolerant*FaultTolerantX)))
	BANKSEL	_Status
	BTRSS	_Status,2
	LGOTO	_00138_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xDE=222), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00174_DS_
	MOVIA	0xde
	SUBAR	_T1Counter,W
_00174_DS_:
	BTRSS	STATUS,0
	LGOTO	_00138_DS_
;;unsigned compare: left < lit (0x155=341), size=2
	MOVIA	0x01
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00175_DS_
	MOVIA	0x55
	SUBAR	_T1Counter,W
_00175_DS_:
	BTRSC	STATUS,0
	LGOTO	_00138_DS_
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
	LGOTO	_00142_DS_
_00138_DS_:
	.line	147, "main.c"; 	else if(RemoteStart)
	BANKSEL	_Status
	BTRSS	_Status,3
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x5E=94), size=2
	.line	149, "main.c"; 	if((T1Counter> (OneCode_H - FaultTolerant))&&(T1Counter < (OneCode_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00176_DS_
	MOVIA	0x5e
	SUBAR	_T1Counter,W
_00176_DS_:
	BTRSS	STATUS,0
	LGOTO	_00126_DS_
;;unsigned compare: left < lit (0x71=113), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	MOVIA	0x71
	SUBAR	_T1Counter,W
_00177_DS_:
	BTRSC	STATUS,0
	LGOTO	_00126_DS_
	.line	151, "main.c"; 	OneCode = 1;
	BANKSEL	_Status
	BSR	_Status,1
	.line	152, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	LGOTO	_00127_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x13=19), size=2
_00126_DS_:
	.line	156, "main.c"; 	if((T1Counter > (Zero_H - FaultTolerant))&&(T1Counter < (Zero_H + FaultTolerant)))
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00178_DS_
	MOVIA	0x13
	SUBAR	_T1Counter,W
_00178_DS_:
	BTRSS	STATUS,0
	LGOTO	_00122_DS_
;;unsigned compare: left < lit (0x26=38), size=2
	MOVIA	0x00
	BANKSEL	_T1Counter
	SUBAR	(_T1Counter + 1),W
	BTRSS	STATUS,2
	LGOTO	_00179_DS_
	MOVIA	0x26
	SUBAR	_T1Counter,W
_00179_DS_:
	BTRSC	STATUS,0
	LGOTO	_00122_DS_
	.line	158, "main.c"; 	ZeroCode = 1;
	BANKSEL	_Status
	BSR	_Status,0
	.line	159, "main.c"; 	OneCode = 0;
	BCR	_Status,1
	LGOTO	_00127_DS_
_00122_DS_:
	.line	163, "main.c"; 	ZeroCode = 0;
	BANKSEL	_Status
	BCR	_Status,0
	.line	164, "main.c"; 	OneCode = 0;
	BCR	_Status,1
_00127_DS_:
	.line	168, "main.c"; 	if(OneCode)
	BANKSEL	_Status
	BTRSS	_Status,1
	LGOTO	_00132_DS_
	.line	171, "main.c"; 	GetOneByte(1);
	MOVIA	0x01
	LCALL	_GetOneByte
	LGOTO	_00142_DS_
_00132_DS_:
	.line	173, "main.c"; 	else if(ZeroCode)
	BANKSEL	_Status
	BTRSS	_Status,0
	LGOTO	_00142_DS_
	.line	176, "main.c"; 	GetOneByte(0);
	MOVIA	0x00
	LCALL	_GetOneByte
	LGOTO	_00142_DS_
_00135_DS_:
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
_00142_DS_:
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
	.line	117, "main.c"; 	MaybeRemoteStart = 0;       //遥控数据头
	BANKSEL	_Status
	BCR	_Status,2
	.line	118, "main.c"; 	RemoteStart = 0;
	BCR	_Status,3
	.line	119, "main.c"; 	sleepFlag = 0;
	BANKSEL	_sleepFlag
	CLRR	_sleepFlag
	.line	120, "main.c"; 	bitIndex = 0;
	BANKSEL	_bitIndex
	CLRR	_bitIndex
	.line	121, "main.c"; 	OneCode = 0;
	BANKSEL	_Status
	BCR	_Status,1
	.line	122, "main.c"; 	ZeroCode = 0;
	BCR	_Status,0
	.line	123, "main.c"; 	ReadOver = 0;
	BCR	_Status,4
	.line	124, "main.c"; 	}
	RETURN	
; exit point of _cleanData


;	code size estimation:
;	 1064+  333 =  1397 instructions ( 3460 byte)

	end
