;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
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
	extern	_delay
	extern	_keyRead
	extern	_KeyScan
	extern	_pwmStop
	extern	_pwmStart
	extern	_setPWMduty
	extern	_checkLVD
	extern	_ledCon
	extern	_delayCon
	extern	_gotoSleep
	extern	_isr
	extern	_main
	extern	_KeyStatus
	extern	_keyCount
	extern	_count500ms
	extern	_count4Hour
	extern	_count60s
	extern	_intCount
	extern	_IntFlag
	extern	_workStep
	extern	_ledFlag
	extern	_ledCount
	extern	_sleepDelay
	extern	_step2Count
	extern	_longPressFlag
	extern	_RDUTY
	extern	_GDUTY
	extern	_BDUTY
	extern	_startFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
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
_KeyStatus:
	.res	1
	.debuginfo gvariable name=_KeyStatus,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count500ms:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count500ms,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count4Hour:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count4Hour,2byte,array=0,entsize=2,ext=1


.segment "idata"
_count60s:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count60s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledFlag:
	dw	0x00
	.debuginfo gvariable name=_ledFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_sleepDelay:
	dw	0x00
	.debuginfo gvariable name=_sleepDelay,1byte,array=0,entsize=1,ext=1


.segment "idata"
_step2Count:
	dw	0x00
	.debuginfo gvariable name=_step2Count,1byte,array=0,entsize=1,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_RDUTY:
	dw	0x00
	.debuginfo gvariable name=_RDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_GDUTY:
	dw	0x00
	.debuginfo gvariable name=_GDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_BDUTY:
	dw	0x00
	.debuginfo gvariable name=_BDUTY,1byte,array=0,entsize=1,ext=1


.segment "idata"
_startFlag:
	dw	0x00
	.debuginfo gvariable name=_startFlag,1byte,array=0,entsize=1,ext=1

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
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;   _setPWMduty
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	61, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	63, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00110_DS_
	.line	65, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	66, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	67, "main.c"; 	if(ledFlag)
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00106_DS_
	.line	69, "main.c"; 	setPWMduty(0x02,RDUTY);
	MOVR	_RDUTY,W
	MOVAR	STK00
	MOVIA	0x02
	LCALL	_setPWMduty
	.line	70, "main.c"; 	setPWMduty(0x20,GDUTY);
	MOVR	_GDUTY,W
	MOVAR	STK00
	MOVIA	0x20
	LCALL	_setPWMduty
	.line	71, "main.c"; 	setPWMduty(0x10,BDUTY);
	MOVR	_BDUTY,W
	MOVAR	STK00
	MOVIA	0x10
	LCALL	_setPWMduty
	.line	72, "main.c"; 	ledCount++;
	INCR	_ledCount,F
_00106_DS_:
	.line	74, "main.c"; 	if(intCount == 96)
	MOVR	_intCount,W
	XORIA	0x60
	BTRSS	STATUS,2
	LGOTO	_00110_DS_
	.line	76, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	77, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00110_DS_:
	.line	80, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00112_DS_
	.line	82, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00112_DS_:
	.line	85, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	87, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
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
;   _checkLVD
;   _delayCon
;   _KeyScan
;   _keyRead
;   _pwmStart
;   _checkLVD
;   _delayCon
;   _KeyScan
;   _keyRead
;   _pwmStart
;2 compiler assigned registers:
;   r0x1025
;   r0x1026
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo variable _keyClick=r0x1025
_main:
; 2 exit points
	.line	93, "main.c"; 	PORTB = 0xFB;
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	94, "main.c"; 	BPHCON = 0xF6;
	MOVIA	0xf6
	MOVAR	_BPHCON
	.line	96, "main.c"; 	IOSTB =  C_PB0_Input | C_PB3_Input;	
	MOVIA	0x09
	IOST	_IOSTB
	.line	97, "main.c"; 	PORTB = 0xFB;                        	// PortB Data Register = 0x00
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	98, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	100, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	102, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	103, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	105, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	106, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	107, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	108, "main.c"; 	ENI();
	ENI
	.line	109, "main.c"; 	startFlag = 1;
	MOVIA	0x01
	MOVAR	_startFlag
_00132_DS_:
	.line	112, "main.c"; 	CLRWDT();
	clrwdt
	.line	114, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	.line	116, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	118, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	119, "main.c"; 	delayCon();
	LCALL	_delayCon
	.line	120, "main.c"; 	KeyStatus = KeyScan() & 0x1F;	//
	LCALL	_KeyScan
	MOVAR	r0x1025
	MOVIA	0x1f
	ANDAR	r0x1025,W
	MOVAR	_KeyStatus
	.line	121, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	MOVAR	r0x1025
	.line	123, "main.c"; 	if(keyClick == 1)
	CLRR	r0x1026
	MOVR	r0x1025,W
	XORIA	0x01
	BTRSC	STATUS,2
	INCR	r0x1026,F
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00126_DS_
	.line	125, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	126, "main.c"; 	workStep++;
	INCR	_workStep,F
;;unsigned compare: left < lit (0x3=3), size=1
	.line	127, "main.c"; 	if(workStep >= 3)
	MOVIA	0x03
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	128, "main.c"; 	workStep = 0;
	CLRR	_workStep
	LGOTO	_00127_DS_
_00126_DS_:
	.line	130, "main.c"; 	else if(keyClick == 2)
	MOVR	r0x1025,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	132, "main.c"; 	count60s = 0;
	CLRR	_count60s
	CLRR	(_count60s + 1)
	.line	133, "main.c"; 	ledFlag = ~ledFlag;
	COMR	_ledFlag,W
	MOVAR	_ledFlag
	.line	134, "main.c"; 	if(!workStep)		//未喷雾重置定时4个小时
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	135, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
_00127_DS_:
	.line	138, "main.c"; 	if(keyClick == 1 && workStep)
	MOVR	r0x1026,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00132_DS_
	.line	140, "main.c"; 	pwmStart();
	LCALL	_pwmStart
	LGOTO	_00132_DS_
	.line	145, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;   r0x101A
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x1019
	.debuginfo variable _time[1]=r0x1018
	.debuginfo variable _i[0]=r0x101A
	.debuginfo variable _i[1]=r0x101B
_delay:
; 2 exit points
	.line	423, "main.c"; 	void delay(u16t time)
	MOVAR	r0x1018
	MOVR	STK00,W
	MOVAR	r0x1019
	.line	425, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x101A
	CLRR	r0x101B
_00492_DS_:
	MOVR	r0x1018,W
	SUBAR	r0x101B,W
	BTRSS	STATUS,2
	LGOTO	_00503_DS_
	MOVR	r0x1019,W
	SUBAR	r0x101A,W
_00503_DS_:
	BTRSC	STATUS,0
	LGOTO	_00494_DS_
	INCR	r0x101A,F
	BTRSC	STATUS,2
	INCR	r0x101B,F
	LGOTO	_00492_DS_
_00494_DS_:
	.line	426, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
_keyRead:
; 2 exit points
	.line	392, "main.c"; 	if (KeyStatus & 0x01)
	BTRSS	_KeyStatus,0
	LGOTO	_00464_DS_
	.line	394, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0xC8=200), size=2
	.line	395, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00483_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00483_DS_:
	BTRSS	STATUS,0
	LGOTO	_00465_DS_
	.line	397, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	CLRR	(_keyCount + 1)
	.line	398, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00465_DS_
	.line	400, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	401, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00466_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00464_DS_:
	.line	407, "main.c"; 	if(keyCount >= 200)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00484_DS_
	MOVIA	0xc8
	SUBAR	_keyCount,W
_00484_DS_:
	BTRSS	STATUS,0
	LGOTO	_00461_DS_
	.line	409, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	410, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	411, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00466_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00461_DS_:
	.line	413, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00485_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00485_DS_:
	BTRSS	STATUS,0
	LGOTO	_00462_DS_
	.line	415, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	416, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00466_DS_
_00462_DS_:
	.line	418, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00465_DS_:
	.line	420, "main.c"; 	return 0;
	MOVIA	0x00
_00466_DS_:
	.line	421, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x101C
_KeyScan:
; 2 exit points
	.line	383, "main.c"; 	KeyStatus = ~PORTB;
	COMR	_PORTB,W
;;1	MOVAR	r0x101C
	.line	386, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStop
	.debuginfo subprogram _pwmStop
_pwmStop:
; 2 exit points
	.line	371, "main.c"; 	T1CR1 = C_TMR1_Dis;
	CLRA	
	SFUN	_T1CR1
	.line	372, "main.c"; 	PWM1DUTY = 0;
	SFUN	_PWM1DUTY
	.line	373, "main.c"; 	PORTB &= 0xFB;	//关闭
	BCR	_PORTB,2
	.line	374, "main.c"; 	}
	RETURN	
; exit point of _pwmStop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_pwmStart
	.debuginfo subprogram _pwmStart
_pwmStart:
; 2 exit points
	.line	362, "main.c"; 	TMR1 = 0x11;							//频率为110K
	MOVIA	0x11
	SFUN	_TMR1
	.line	363, "main.c"; 	PWM1DUTY = 0x08;				// 		
	MOVIA	0x08
	SFUN	_PWM1DUTY
	.line	365, "main.c"; 	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div2;	// Enable Prescaler1, Prescaler1 dividing rate = 1:2, Timer1 clock source is instruction clock 
	CLRA	
	SFUN	_T1CR2
	.line	366, "main.c"; 	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1 output will be present on PB6 , PWM1 output is active high, reloaded from TMR1, non-stop mode
	MOVIA	0x83
	SFUN	_T1CR1
	.line	367, "main.c"; 	}
	RETURN	
; exit point of _pwmStart

;***
;  pBlock Stats: dbName = C
;***
;3 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_setPWMduty
	.debuginfo subprogram _setPWMduty
;local variable name mapping:
	.debuginfo variable _portPin=r0x101D
	.debuginfo variable _duty=r0x101E
_setPWMduty:
; 0 exit points
	.line	348, "main.c"; 	void setPWMduty(char portPin,char duty)
	MOVAR	r0x101D
	MOVR	STK00,W
	MOVAR	r0x101E
	.line	350, "main.c"; 	if(ledCount <= duty)
	MOVR	_ledCount,W
	SUBAR	r0x101E,W
	BTRSS	STATUS,0
	LGOTO	_00433_DS_
	.line	351, "main.c"; 	PORTB &= (~portPin);
	COMR	r0x101D,W
	MOVAR	r0x101E
	ANDAR	_PORTB,F
	LGOTO	_00434_DS_
_00433_DS_:
	.line	353, "main.c"; 	PORTB |= portPin;
	MOVR	r0x101D,W
	IORAR	_PORTB,F
_00434_DS_:
	.line	354, "main.c"; 	if(ledCount == 100)
	MOVR	_ledCount,W
	XORIA	0x64
	BTRSC	STATUS,2
	.line	355, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	356, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _delay
;   _gotoSleep
;   _delay
;   _gotoSleep
;3 compiler assigned registers:
;   STK00
;   r0x101F
;   r0x1020
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 0 exit points
	.line	329, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	330, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	332, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x101F
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	LGOTO	_00425_DS_
	.line	334, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00427_DS_
	.line	335, "main.c"; 	PWM1DUTY = 0x08;	//45%
	MOVIA	0x08
	SFUN	_PWM1DUTY
	LGOTO	_00427_DS_
_00425_DS_:
	.line	339, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	340, "main.c"; 	PORTB = 0xFB;
	MOVIA	0xfb
	MOVAR	_PORTB
	.line	341, "main.c"; 	if(++sleepDelay >= 10)
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	342, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00427_DS_:
	.line	344, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	248, "main.c"; 	if(count60s % 5 == 0)
	MOVIA	0x05
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	MOVR	_count60s,W
	MOVAR	STK00
	MOVR	(_count60s + 1),W
	LCALL	__moduint
;;1	MOVAR	r0x1021
	IORAR	STK00,W
	BTRSS	STATUS,2
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	251, "main.c"; 	if(count60s < 500)
	MOVIA	0x01
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	MOVIA	0xf4
	SUBAR	_count60s,W
_00400_DS_:
	BTRSC	STATUS,0
	LGOTO	_00338_DS_
	.line	253, "main.c"; 	RDUTY = GDUTY = 20;
	MOVIA	0x14
	MOVAR	_GDUTY
	MOVAR	_RDUTY
	.line	254, "main.c"; 	BDUTY = 100;
	MOVIA	0x64
	MOVAR	_BDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x258=600), size=2
_00338_DS_:
	.line	256, "main.c"; 	else if(count60s < 600)
	MOVIA	0x02
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	MOVIA	0x58
	SUBAR	_count60s,W
_00401_DS_:
	BTRSC	STATUS,0
	LGOTO	_00335_DS_
	.line	258, "main.c"; 	--RDUTY;
	DECR	_RDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x3E8=1000), size=2
_00335_DS_:
	.line	260, "main.c"; 	else if(count60s < 1000)
	MOVIA	0x03
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00402_DS_
	MOVIA	0xe8
	SUBAR	_count60s,W
_00402_DS_:
	BTRSC	STATUS,0
	LGOTO	_00332_DS_
	.line	262, "main.c"; 	RDUTY = 0;
	CLRR	_RDUTY
	.line	263, "main.c"; 	++GDUTY;
	INCR	_GDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x5DC=1500), size=2
_00332_DS_:
	.line	265, "main.c"; 	else if(count60s < 1500)
	MOVIA	0x05
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00403_DS_
	MOVIA	0xdc
	SUBAR	_count60s,W
_00403_DS_:
	BTRSC	STATUS,0
	LGOTO	_00329_DS_
	.line	267, "main.c"; 	RDUTY = 0;
	CLRR	_RDUTY
	.line	268, "main.c"; 	GDUTY = 100;
	MOVIA	0x64
	MOVAR	_GDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x76C=1900), size=2
_00329_DS_:
	.line	270, "main.c"; 	else if(count60s < 1900)
	MOVIA	0x07
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	MOVIA	0x6c
	SUBAR	_count60s,W
_00404_DS_:
	BTRSC	STATUS,0
	LGOTO	_00326_DS_
	.line	272, "main.c"; 	--BDUTY;
	DECR	_BDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x7D0=2000), size=2
_00326_DS_:
	.line	274, "main.c"; 	else if(count60s < 2000)
	MOVIA	0x07
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00405_DS_
	MOVIA	0xd0
	SUBAR	_count60s,W
_00405_DS_:
	BTRSC	STATUS,0
	LGOTO	_00323_DS_
	.line	276, "main.c"; 	BDUTY = 20;
	MOVIA	0x14
	MOVAR	_BDUTY
	.line	277, "main.c"; 	++RDUTY;
	INCR	_RDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x9C4=2500), size=2
_00323_DS_:
	.line	279, "main.c"; 	else if(count60s < 2500)
	MOVIA	0x09
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00406_DS_
	MOVIA	0xc4
	SUBAR	_count60s,W
_00406_DS_:
	BTRSC	STATUS,0
	LGOTO	_00320_DS_
	.line	281, "main.c"; 	RDUTY = 20;
	MOVIA	0x14
	MOVAR	_RDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0xA28=2600), size=2
_00320_DS_:
	.line	283, "main.c"; 	else if(count60s < 2600)
	MOVIA	0x0a
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00407_DS_
	MOVIA	0x28
	SUBAR	_count60s,W
_00407_DS_:
	BTRSC	STATUS,0
	LGOTO	_00317_DS_
	.line	285, "main.c"; 	--BDUTY;
	DECR	_BDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0xBB8=3000), size=2
_00317_DS_:
	.line	287, "main.c"; 	else if(count60s < 3000)
	MOVIA	0x0b
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00408_DS_
	MOVIA	0xb8
	SUBAR	_count60s,W
_00408_DS_:
	BTRSC	STATUS,0
	LGOTO	_00314_DS_
	.line	289, "main.c"; 	BDUTY = 0;
	CLRR	_BDUTY
	.line	290, "main.c"; 	++RDUTY;
	INCR	_RDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0xDAC=3500), size=2
_00314_DS_:
	.line	292, "main.c"; 	else if(count60s < 3500)
	MOVIA	0x0d
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00409_DS_
	MOVIA	0xac
	SUBAR	_count60s,W
_00409_DS_:
	BTRSC	STATUS,0
	LGOTO	_00311_DS_
	.line	294, "main.c"; 	RDUTY = 100;
	MOVIA	0x64
	MOVAR	_RDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0xFA0=4000), size=2
_00311_DS_:
	.line	296, "main.c"; 	else if(count60s < 4000)
	MOVIA	0x0f
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00410_DS_
	MOVIA	0xa0
	SUBAR	_count60s,W
_00410_DS_:
	BTRSC	STATUS,0
	LGOTO	_00308_DS_
	.line	298, "main.c"; 	--GDUTY;
	DECR	_GDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x1194=4500), size=2
_00308_DS_:
	.line	300, "main.c"; 	else if(count60s < 4500)
	MOVIA	0x11
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00411_DS_
	MOVIA	0x94
	SUBAR	_count60s,W
_00411_DS_:
	BTRSC	STATUS,0
	LGOTO	_00305_DS_
	.line	302, "main.c"; 	GDUTY = 0;
	CLRR	_GDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x1388=5000), size=2
_00305_DS_:
	.line	304, "main.c"; 	else if(count60s < 5000)
	MOVIA	0x13
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00412_DS_
	MOVIA	0x88
	SUBAR	_count60s,W
_00412_DS_:
	BTRSC	STATUS,0
	LGOTO	_00302_DS_
	.line	306, "main.c"; 	++BDUTY;
	INCR	_BDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x157C=5500), size=2
_00302_DS_:
	.line	308, "main.c"; 	else if(count60s < 5500)
	MOVIA	0x15
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00413_DS_
	MOVIA	0x7c
	SUBAR	_count60s,W
_00413_DS_:
	BTRSC	STATUS,0
	LGOTO	_00299_DS_
	.line	310, "main.c"; 	BDUTY = 100;
	MOVIA	0x64
	MOVAR	_BDUTY
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x170C=5900), size=2
_00299_DS_:
	.line	312, "main.c"; 	else if(count60s < 5900)
	MOVIA	0x17
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00414_DS_
	MOVIA	0x0c
	SUBAR	_count60s,W
_00414_DS_:
	BTRSC	STATUS,0
	LGOTO	_00296_DS_
	.line	314, "main.c"; 	--RDUTY;
	DECR	_RDUTY,F
	LGOTO	_00341_DS_
;;unsigned compare: left < lit (0x1770=6000), size=2
_00296_DS_:
	.line	316, "main.c"; 	else if(count60s < 6000)
	MOVIA	0x17
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00415_DS_
	MOVIA	0x70
	SUBAR	_count60s,W
_00415_DS_:
	BTRSC	STATUS,0
	LGOTO	_00341_DS_
	.line	318, "main.c"; 	RDUTY = 20;
	MOVIA	0x14
	MOVAR	_RDUTY
	.line	319, "main.c"; 	++GDUTY;
	INCR	_GDUTY,F
_00341_DS_:
	.line	322, "main.c"; 	if(++count60s == 6000)
	INCR	_count60s,F
	BTRSC	STATUS,2
	INCR	(_count60s + 1),F
	MOVR	_count60s,W
	XORIA	0x70
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	MOVR	(_count60s + 1),W
	XORIA	0x17
	BTRSS	STATUS,2
	LGOTO	_00344_DS_
	.line	323, "main.c"; 	count60s = 0;
	CLRR	_count60s
	CLRR	(_count60s + 1)
_00344_DS_:
	.line	324, "main.c"; 	}
	RETURN	
; exit point of _ledCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _ledCon
;   _gotoSleep
;   _pwmStop
;   _pwmStart
;   _pwmStop
;   _ledCon
;2 compiler assigned registers:
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_delayCon
	.debuginfo subprogram _delayCon
_delayCon:
; 2 exit points
	.line	169, "main.c"; 	if(++count500ms == 50)
	INCR	_count500ms,F
	BTRSC	STATUS,2
	INCR	(_count500ms + 1),F
	MOVR	_count500ms,W
	XORIA	0x32
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	MOVR	(_count500ms + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	.line	171, "main.c"; 	count500ms = 0;
	CLRR	_count500ms
	CLRR	(_count500ms + 1)
	.line	172, "main.c"; 	count4Hour++;
	INCR	_count4Hour,F
	BTRSC	STATUS,2
	INCR	(_count4Hour + 1),F
;;unsigned compare: left < lit (0x7080=28800), size=2
	.line	174, "main.c"; 	if(count4Hour >= 28800 || (workStep == 0 && (!ledFlag) && (PORTB & 0x08)))
	MOVIA	0x70
	SUBAR	(_count4Hour + 1),W
	BTRSS	STATUS,2
	LGOTO	_00279_DS_
	MOVIA	0x80
	SUBAR	_count4Hour,W
_00279_DS_:
	BTRSC	STATUS,0
	LGOTO	_00171_DS_
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	MOVR	_ledFlag,W
	BTRSS	STATUS,2
	LGOTO	_00177_DS_
	BTRSS	_PORTB,3
	LGOTO	_00177_DS_
_00171_DS_:
	.line	176, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	177, "main.c"; 	if(++sleepDelay >= 10)
	INCR	_sleepDelay,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_sleepDelay,W
	BTRSC	STATUS,0
	.line	178, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00177_DS_:
	.line	182, "main.c"; 	if(workStep == 2)
	MOVR	_workStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00187_DS_
	.line	184, "main.c"; 	if(!count500ms)
	MOVR	_count500ms,W
	IORAR	(_count500ms + 1),W
	BTRSS	STATUS,2
	LGOTO	_00188_DS_
	.line	186, "main.c"; 	if(step2Count == 20)
	MOVR	_step2Count,W
	XORIA	0x14
	BTRSC	STATUS,2
	.line	187, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	188, "main.c"; 	if(step2Count >= 30)
	MOVIA	0x1e
	SUBAR	_step2Count,W
	BTRSS	STATUS,0
	LGOTO	_00181_DS_
	.line	190, "main.c"; 	step2Count = 0;
	CLRR	_step2Count
	.line	191, "main.c"; 	pwmStart();
	LCALL	_pwmStart
_00181_DS_:
	.line	193, "main.c"; 	step2Count++;
	INCR	_step2Count,F
	LGOTO	_00188_DS_
_00187_DS_:
	.line	196, "main.c"; 	else if(workStep == 0)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	.line	198, "main.c"; 	pwmStop();
	LCALL	_pwmStop
_00188_DS_:
	.line	202, "main.c"; 	if(ledFlag)
	MOVR	_ledFlag,W
	BTRSC	STATUS,2
	LGOTO	_00215_DS_
	.line	204, "main.c"; 	ledCon();
	LCALL	_ledCon
	.line	205, "main.c"; 	startFlag = 0;
	CLRR	_startFlag
	LGOTO	_00217_DS_
_00215_DS_:
	.line	209, "main.c"; 	if(startFlag)
	MOVR	_startFlag,W
	BTRSC	STATUS,2
	LGOTO	_00212_DS_
;;unsigned compare: left < lit (0x32=50), size=2
	.line	212, "main.c"; 	if(count60s < 50)
	MOVIA	0x00
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00282_DS_
	MOVIA	0x32
	SUBAR	_count60s,W
_00282_DS_:
	BTRSC	STATUS,0
	LGOTO	_00204_DS_
	.line	213, "main.c"; 	PORTB &= ~0x02;
	BCR	_PORTB,1
	LGOTO	_00205_DS_
;;unsigned compare: left < lit (0x64=100), size=2
_00204_DS_:
	.line	214, "main.c"; 	else if(count60s < 100)
	MOVIA	0x00
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00283_DS_
	MOVIA	0x64
	SUBAR	_count60s,W
_00283_DS_:
	BTRSC	STATUS,0
	LGOTO	_00201_DS_
	.line	215, "main.c"; 	PORTB |= 0xFB;
	MOVIA	0xfb
	IORAR	_PORTB,F
	LGOTO	_00205_DS_
;;unsigned compare: left < lit (0x96=150), size=2
_00201_DS_:
	.line	216, "main.c"; 	else if(count60s < 150)
	MOVIA	0x00
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00284_DS_
	MOVIA	0x96
	SUBAR	_count60s,W
_00284_DS_:
	BTRSC	STATUS,0
	LGOTO	_00198_DS_
	.line	217, "main.c"; 	PORTB &= ~0x20;
	BCR	_PORTB,5
	LGOTO	_00205_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00198_DS_:
	.line	218, "main.c"; 	else if(count60s < 200)
	MOVIA	0x00
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00285_DS_
	MOVIA	0xc8
	SUBAR	_count60s,W
_00285_DS_:
	BTRSC	STATUS,0
	LGOTO	_00195_DS_
	.line	219, "main.c"; 	PORTB |= 0xFB;
	MOVIA	0xfb
	IORAR	_PORTB,F
	LGOTO	_00205_DS_
;;unsigned compare: left < lit (0xFA=250), size=2
_00195_DS_:
	.line	220, "main.c"; 	else if(count60s < 250)
	MOVIA	0x00
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00286_DS_
	MOVIA	0xfa
	SUBAR	_count60s,W
_00286_DS_:
	BTRSC	STATUS,0
	LGOTO	_00192_DS_
	.line	221, "main.c"; 	PORTB &= ~0x10;
	BCR	_PORTB,4
	LGOTO	_00205_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00192_DS_:
	.line	222, "main.c"; 	else if(count60s < 300)
	MOVIA	0x01
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	MOVIA	0x2c
	SUBAR	_count60s,W
_00287_DS_:
	BTRSC	STATUS,0
	LGOTO	_00205_DS_
	.line	223, "main.c"; 	PORTB |= 0xFB;
	MOVIA	0xfb
	IORAR	_PORTB,F
_00205_DS_:
	.line	224, "main.c"; 	if(++count60s >= 300)
	INCR	_count60s,F
	BTRSC	STATUS,2
	INCR	(_count60s + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	MOVIA	0x01
	SUBAR	(_count60s + 1),W
	BTRSS	STATUS,2
	LGOTO	_00288_DS_
	MOVIA	0x2c
	SUBAR	_count60s,W
_00288_DS_:
	BTRSS	STATUS,0
	LGOTO	_00217_DS_
	.line	226, "main.c"; 	startFlag = 0;
	CLRR	_startFlag
	.line	227, "main.c"; 	count60s = 0;
	CLRR	_count60s
	CLRR	(_count60s + 1)
	LGOTO	_00217_DS_
_00212_DS_:
	.line	233, "main.c"; 	if((~PORTB) & 0x08)
	MOVR	_PORTB,W
	MOVAR	r0x1023
	CLRR	r0x1024
	COMR	r0x1023,W
	MOVAR	r0x1023
	COMR	r0x1024,W
	MOVAR	r0x1024
	BTRSS	r0x1023,3
	LGOTO	_00209_DS_
	.line	235, "main.c"; 	PORTB &= ~0x02;
	BCR	_PORTB,1
	.line	236, "main.c"; 	PORTB |= 0xF9;
	MOVIA	0xf9
	IORAR	_PORTB,F
	LGOTO	_00217_DS_
_00209_DS_:
	.line	239, "main.c"; 	PORTB |= 0xFB;
	MOVIA	0xfb
	IORAR	_PORTB,F
_00217_DS_:
	.line	244, "main.c"; 	}
	RETURN	
; exit point of _delayCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _pwmStop
;   _pwmStop
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	150, "main.c"; 	count4Hour = 0;
	CLRR	_count4Hour
	CLRR	(_count4Hour + 1)
	.line	151, "main.c"; 	pwmStop();
	LCALL	_pwmStop
	.line	152, "main.c"; 	sleepDelay = 0;
	CLRR	_sleepDelay
	.line	153, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	154, "main.c"; 	BWUCON = 0x09;
	MOVIA	0x09
	MOVAR	_BWUCON
	.line	155, "main.c"; 	INTE =  C_INT_TMR1 | C_INT_PBKey;
	MOVIA	0x0a
	MOVAR	_INTE
	.line	156, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	157, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	158, "main.c"; 	CLRWDT();
	clrwdt
	.line	159, "main.c"; 	SLEEP();
	sleep
	.line	160, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_TMR1;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x09
	MOVAR	_INTE
	.line	161, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	163, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	164, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep


;	code size estimation:
;	  648+    0 =   648 instructions ( 1296 byte)

	end
