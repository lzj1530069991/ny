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
	extern	__moduint
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
	extern	__gptrget1
	extern	__gptrput1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_motor1
	extern	_motor2
	extern	_keyRead2
	extern	_keyCon
	extern	_workCon
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_duty
	extern	_power
	extern	_modeSpeed
	extern	_modeStep
	extern	_ledCount
	extern	_motorEn
	extern	_timeCount
	extern	_sleepCount
	extern	_count1s
	extern	_keyCount1
	extern	_keyCount2
	extern	_keyCount3
	extern	_keyCount4
	extern	_keyCount5

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
_keyCount1:
	.res	1
	.debuginfo gvariable name=_keyCount1,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_keyCount2:
	.res	1
	.debuginfo gvariable name=_keyCount2,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_keyCount3:
	.res	1
	.debuginfo gvariable name=_keyCount3,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_keyCount4:
	.res	1
	.debuginfo gvariable name=_keyCount4,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_keyCount5:
	.res	1
	.debuginfo gvariable name=_keyCount5,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
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
_duty:
	dw	0x00
	.debuginfo gvariable name=_duty,1byte,array=0,entsize=1,ext=1


.segment "idata"
_power:
	dw	0x00
	.debuginfo gvariable name=_power,1byte,array=0,entsize=1,ext=1


.segment "idata"
_modeSpeed:
	dw	0x00
	.debuginfo gvariable name=_modeSpeed,1byte,array=0,entsize=1,ext=1


.segment "idata"
_modeStep:
	dw	0x00
	.debuginfo gvariable name=_modeStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_motorEn:
	dw	0x00
	.debuginfo gvariable name=_motorEn,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_timeCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepCount:
	dw	0x00
	.debuginfo gvariable name=_sleepCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count1s:
	dw	0x00
	.debuginfo gvariable name=_count1s,1byte,array=0,entsize=1,ext=1

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
;   _motor1
;   _motor2
;   _motor1
;   _motor2
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	35, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	37, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00114_DS_
	.line	39, "main.c"; 	TMR0 += 57;
	MOVIA	0x39
	ADDAR	_TMR0,F
	.line	40, "main.c"; 	if(power && motorEn)
	BANKSEL	_power
	MOVR	_power,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	BANKSEL	_motorEn
	MOVR	_motorEn,W
	BTRSC	STATUS,2
	LGOTO	_00109_DS_
	.line	42, "main.c"; 	if(power == 1)
	BANKSEL	_power
	MOVR	_power,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00106_DS_
	.line	43, "main.c"; 	motor1();
	LCALL	_motor1
	LGOTO	_00107_DS_
_00106_DS_:
	.line	45, "main.c"; 	motor2();
	LCALL	_motor2
_00107_DS_:
	.line	46, "main.c"; 	ledCount++;
	BANKSEL	_ledCount
	INCR	_ledCount,F
_00109_DS_:
	.line	48, "main.c"; 	if(++intCount >= 100)
	BANKSEL	_intCount
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00114_DS_
	.line	50, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	51, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00114_DS_:
	.line	54, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00116_DS_
	.line	56, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00116_DS_:
	.line	59, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	61, "main.c"; 	}
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
;   _ledCon
;   _keyCon
;   _workCon
;   _gotoSleep
;   _ledCon
;   _keyCon
;   _workCon
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	68, "main.c"; 	keyCount1 = keyCount2 = keyCount3 = keyCount4 = keyCount5 = 0;
	BANKSEL	_keyCount5
	CLRR	_keyCount5
	BANKSEL	_keyCount4
	CLRR	_keyCount4
	BANKSEL	_keyCount3
	CLRR	_keyCount3
	BANKSEL	_keyCount2
	CLRR	_keyCount2
	BANKSEL	_keyCount1
	CLRR	_keyCount1
	.line	69, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	70, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	71, "main.c"; 	IOSTA = C_PA3_Input;
	MOVIA	0x08
	IOST	_IOSTA
	.line	72, "main.c"; 	IOSTB = C_PB3_Input | C_PB4_Input | C_PB5_Input | C_PB0_Input | C_PB1_Input | C_PB2_Input;
	MOVIA	0x3f
	IOST	_IOSTB
	.line	73, "main.c"; 	BPHCON = 0xD0;
	MOVIA	0xd0
	MOVAR	_BPHCON
	.line	74, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	76, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	78, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	79, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	81, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	82, "main.c"; 	INTE =  C_INT_TMR0 ;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVAR	_INTE
	.line	83, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	84, "main.c"; 	ENI();
	ENI
_00144_DS_:
	.line	87, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	88, "main.c"; 	if(motorEn == 0 || power == 0)
	BANKSEL	_motorEn
	MOVR	_motorEn,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	BANKSEL	_power
	MOVR	_power,W
	BTRSS	STATUS,2
	LGOTO	_00122_DS_
_00121_DS_:
	.line	90, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	.line	91, "main.c"; 	PORTB &= 0xBF;
	BCR	_PORTB,6
_00122_DS_:
	.line	93, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00144_DS_
	.line	95, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	96, "main.c"; 	if(PORTB & 0X08)
	BTRSS	_PORTB,3
	LGOTO	_00135_DS_
	.line	99, "main.c"; 	if(PORTB & 0X10)
	BTRSS	_PORTB,4
	LGOTO	_00132_DS_
	.line	102, "main.c"; 	LEDON();
	BSR	_PORTA,0
	LGOTO	_00136_DS_
_00132_DS_:
	.line	106, "main.c"; 	if(++count1s >= 100)
	BANKSEL	_count1s
	INCR	_count1s,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	.line	107, "main.c"; 	count1s = 0;
	CLRR	_count1s
	.line	108, "main.c"; 	if(count1s < 50)
	MOVIA	0x32
	SUBAR	_count1s,W
	BTRSC	STATUS,0
	LGOTO	_00129_DS_
	.line	109, "main.c"; 	LEDON();
	BSR	_PORTA,0
	LGOTO	_00136_DS_
_00129_DS_:
	.line	111, "main.c"; 	LEDOFF();
	BCR	_PORTA,0
	LGOTO	_00136_DS_
_00135_DS_:
	.line	116, "main.c"; 	ledCon();
	LCALL	_ledCon
_00136_DS_:
	.line	118, "main.c"; 	keyCon();
	LCALL	_keyCon
	.line	119, "main.c"; 	if(power)
	BANKSEL	_power
	MOVR	_power,W
	BTRSS	STATUS,2
	.line	120, "main.c"; 	workCon();
	LCALL	_workCon
	.line	121, "main.c"; 	if(power == 0 && keyCount1 == 0 && ++sleepCount > 200)
	BANKSEL	_power
	MOVR	_power,W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	_keyCount1
	MOVR	_keyCount1,W
	BTRSS	STATUS,2
	LGOTO	_00144_DS_
	BANKSEL	_sleepCount
	INCR	_sleepCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_sleepCount,W
	BTRSS	STATUS,0
	LGOTO	_00144_DS_
	.line	122, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00144_DS_
	.line	124, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	341, "main.c"; 	sleepCount = 0;
	BANKSEL	_sleepCount
	CLRR	_sleepCount
	.line	342, "main.c"; 	BWUCON = 0x30;		//PB5唤醒
	MOVIA	0x30
	MOVAR	_BWUCON
	.line	343, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	344, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	345, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	346, "main.c"; 	CLRWDT();
	clrwdt
	.line	347, "main.c"; 	SLEEP();
	sleep
	.line	348, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	349, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	351, "main.c"; 	PCON = C_WDT_En | C_LVR_En ;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	352, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_motor1
	.debuginfo subprogram _motor1
_motor1:
; 0 exit points
	.line	331, "main.c"; 	if(ledCount >= duty)
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00336_DS_
	.line	332, "main.c"; 	PORTA &= 0xFD;
	BCR	_PORTA,1
	LGOTO	_00337_DS_
_00336_DS_:
	.line	334, "main.c"; 	PORTA |= 0x02;
	BSR	_PORTA,1
;;unsigned compare: left < lit (0x64=100), size=1
_00337_DS_:
	.line	335, "main.c"; 	if(ledCount >= 100)
	MOVIA	0x64
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	336, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	337, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_motor2
	.debuginfo subprogram _motor2
_motor2:
; 0 exit points
	.line	319, "main.c"; 	if(ledCount >= duty)
	BANKSEL	_duty
	MOVR	_duty,W
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00326_DS_
	.line	320, "main.c"; 	PORTB &= 0xBF;
	BCR	_PORTB,6
	LGOTO	_00327_DS_
_00326_DS_:
	.line	322, "main.c"; 	PORTB |= 0x40;
	BSR	_PORTB,6
;;unsigned compare: left < lit (0x64=100), size=1
_00327_DS_:
	.line	323, "main.c"; 	if(ledCount >= 100)
	MOVIA	0x64
	BANKSEL	_ledCount
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	.line	324, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	325, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;   __gptrget1
;   __gptrput1
;   __gptrput1
;7 compiler assigned registers:
;   r0x1014
;   STK00
;   r0x1015
;   STK01
;   r0x1016
;   STK02
;   r0x1017
;; Starting pCode block
.segment "code"; module=main, function=_keyRead2
	.debuginfo subprogram _keyRead2
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1014
	.debuginfo variable _keyCount[0]=r0x1017
	.debuginfo variable _keyCount[1]=r0x1016
	.debuginfo variable _keyCount[2]=r0x1015
_keyRead2:
; 2 exit points
	.line	294, "main.c"; 	char keyRead2(char KeyStatus,u8t* keyCount)	
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	STK00,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK01,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVR	STK02,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	.line	296, "main.c"; 	if (KeyStatus)
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BTRSC	STATUS,2
	LGOTO	_00318_DS_
	.line	298, "main.c"; 	(*keyCount)++;
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
	INCR	r0x1014,F
	MOVR	r0x1014,W
	MOVAR	STK02
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrput1
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	299, "main.c"; 	if(*keyCount >= 200)
	MOVIA	0xc8
	BANKSEL	r0x1014
	SUBAR	r0x1014,W
	BTRSS	STATUS,0
	LGOTO	_00319_DS_
	.line	301, "main.c"; 	*keyCount = 200;
	MOVIA	0xc8
	MOVAR	STK02
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrput1
	LGOTO	_00319_DS_
_00318_DS_:
	.line	306, "main.c"; 	if(*keyCount >= 8)
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrget1
	BANKSEL	r0x1014
	MOVAR	r0x1014
;;unsigned compare: left < lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1014,W
	BTRSS	STATUS,0
	LGOTO	_00316_DS_
	.line	308, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrput1
	.line	309, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00320_DS_
_00316_DS_:
	.line	311, "main.c"; 	*keyCount = 0;
	MOVIA	0x00
	MOVAR	STK02
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MOVAR	STK01
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK00
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	LCALL	__gptrput1
_00319_DS_:
	.line	313, "main.c"; 	return 0;
	MOVIA	0x00
_00320_DS_:
	.line	314, "main.c"; 	}
	RETURN	
; exit point of _keyRead2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;   _keyRead2
;7 compiler assigned registers:
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_keyCon
	.debuginfo subprogram _keyCon
_keyCon:
; 2 exit points
	.line	223, "main.c"; 	if(keyRead2(0x20&~PORTB,&keyCount1))
	COMR	_PORTB,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x20
	ANDAR	r0x1018,F
	MOVIA	((_keyCount1 + 0) >> 8) & 0xff
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	(_keyCount1 + 0)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_keyRead2
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00283_DS_
	.line	226, "main.c"; 	count1s = 100;
	MOVIA	0x64
	BANKSEL	_count1s
	MOVAR	_count1s
	.line	227, "main.c"; 	if(power)
	BANKSEL	_power
	MOVR	_power,W
	BTRSC	STATUS,2
	LGOTO	_00280_DS_
	.line	229, "main.c"; 	power = 0;
	CLRR	_power
	.line	230, "main.c"; 	modeSpeed = 0;
	BANKSEL	_modeSpeed
	CLRR	_modeSpeed
	.line	231, "main.c"; 	modeStep = 0;
	BANKSEL	_modeStep
	CLRR	_modeStep
	LGOTO	_00283_DS_
_00280_DS_:
	.line	235, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	BANKSEL	_modeStep
	MOVAR	_modeStep
	.line	236, "main.c"; 	modeSpeed = 1;
	BANKSEL	_modeSpeed
	MOVAR	_modeSpeed
	.line	237, "main.c"; 	power = 1;
	BANKSEL	_power
	MOVAR	_power
_00283_DS_:
	.line	241, "main.c"; 	if(power)
	BANKSEL	_power
	MOVR	_power,W
	BTRSC	STATUS,2
	LGOTO	_00308_DS_
	.line	243, "main.c"; 	if(keyRead2(0x01&~PORTB,&keyCount2))
	COMR	_PORTB,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x01
	ANDAR	r0x1018,F
	MOVIA	((_keyCount2 + 0) >> 8) & 0xff
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	(_keyCount2 + 0)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_keyRead2
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00290_DS_
	.line	246, "main.c"; 	count1s = 100;
	MOVIA	0x64
	BANKSEL	_count1s
	MOVAR	_count1s
	.line	247, "main.c"; 	if(power == 1)
	BANKSEL	_power
	MOVR	_power,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	.line	249, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	250, "main.c"; 	if(++modeStep > 5)
	BANKSEL	_modeStep
	INCR	_modeStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	LGOTO	_00290_DS_
	.line	251, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	MOVAR	_modeStep
	LGOTO	_00290_DS_
_00287_DS_:
	.line	255, "main.c"; 	power = 1;
	MOVIA	0x01
	BANKSEL	_power
	MOVAR	_power
_00290_DS_:
	.line	259, "main.c"; 	if(keyRead2(0x02&~PORTB,&keyCount3))
	COMR	_PORTB,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x02
	ANDAR	r0x1018,F
	MOVIA	((_keyCount3 + 0) >> 8) & 0xff
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	(_keyCount3 + 0)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_keyRead2
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00297_DS_
	.line	262, "main.c"; 	count1s = 100;
	MOVIA	0x64
	BANKSEL	_count1s
	MOVAR	_count1s
	.line	263, "main.c"; 	if(power == 2)
	BANKSEL	_power
	MOVR	_power,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00294_DS_
	.line	265, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
	.line	266, "main.c"; 	if(++modeStep > 5)
	BANKSEL	_modeStep
	INCR	_modeStep,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	LGOTO	_00297_DS_
	.line	267, "main.c"; 	modeStep = 1;
	MOVIA	0x01
	MOVAR	_modeStep
	LGOTO	_00297_DS_
_00294_DS_:
	.line	271, "main.c"; 	power = 2;
	MOVIA	0x02
	BANKSEL	_power
	MOVAR	_power
_00297_DS_:
	.line	275, "main.c"; 	if(keyRead2(0x04&~PORTB,&keyCount4))
	COMR	_PORTB,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x04
	ANDAR	r0x1018,F
	MOVIA	((_keyCount4 + 0) >> 8) & 0xff
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	(_keyCount4 + 0)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_keyRead2
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00301_DS_
	.line	278, "main.c"; 	count1s = 100;
	MOVIA	0x64
	BANKSEL	_count1s
	MOVAR	_count1s
	.line	279, "main.c"; 	if(++modeSpeed > 5)
	BANKSEL	_modeSpeed
	INCR	_modeSpeed,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_modeSpeed,W
	BTRSS	STATUS,0
	LGOTO	_00301_DS_
	.line	280, "main.c"; 	modeSpeed = 5;
	MOVIA	0x05
	MOVAR	_modeSpeed
_00301_DS_:
	.line	283, "main.c"; 	if(keyRead2(0x08&~PORTA,&keyCount5))
	COMR	_PORTA,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVIA	0x08
	ANDAR	r0x1018,F
	MOVIA	((_keyCount5 + 0) >> 8) & 0xff
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVIA	(_keyCount5 + 0)
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	CLRR	r0x101B
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	LCALL	_keyRead2
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	r0x1018,W
	BTRSC	STATUS,2
	LGOTO	_00308_DS_
	.line	286, "main.c"; 	count1s = 100;
	MOVIA	0x64
	BANKSEL	_count1s
	MOVAR	_count1s
	.line	287, "main.c"; 	if(--modeSpeed < 1)
	BANKSEL	_modeSpeed
	DECR	_modeSpeed,F
;;unsigned compare: left < lit (0x1=1), size=1
	MOVIA	0x01
	SUBAR	_modeSpeed,W
	BTRSC	STATUS,0
	LGOTO	_00308_DS_
	.line	288, "main.c"; 	modeSpeed = 1;
	MOVIA	0x01
	MOVAR	_modeSpeed
_00308_DS_:
	.line	292, "main.c"; 	}
	RETURN	
; exit point of _keyCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;   __moduint
;   __moduint
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   r0x101C
;   STK02
;   STK01
;   STK00
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_workCon
	.debuginfo subprogram _workCon
_workCon:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	140, "main.c"; 	switch(modeSpeed)
	MOVIA	0x01
	BANKSEL	_modeSpeed
	SUBAR	_modeSpeed,W
	BTRSS	STATUS,0
	LGOTO	_00162_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_modeSpeed,W
	BTRSC	STATUS,0
	LGOTO	_00162_DS_
	DECR	_modeSpeed,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVIA	((_00258_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x101C,W
	ADDIA	_00258_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00258_DS_:
	LGOTO	_00157_DS_
	LGOTO	_00158_DS_
	LGOTO	_00159_DS_
	LGOTO	_00160_DS_
	LGOTO	_00161_DS_
_00157_DS_:
	.line	143, "main.c"; 	duty = 35;
	MOVIA	0x23
	BANKSEL	_duty
	MOVAR	_duty
	.line	144, "main.c"; 	break;
	LGOTO	_00162_DS_
_00158_DS_:
	.line	146, "main.c"; 	duty = 50;
	MOVIA	0x32
	BANKSEL	_duty
	MOVAR	_duty
	.line	147, "main.c"; 	break;
	LGOTO	_00162_DS_
_00159_DS_:
	.line	149, "main.c"; 	duty = 65;
	MOVIA	0x41
	BANKSEL	_duty
	MOVAR	_duty
	.line	150, "main.c"; 	break;
	LGOTO	_00162_DS_
_00160_DS_:
	.line	152, "main.c"; 	duty = 80;
	MOVIA	0x50
	BANKSEL	_duty
	MOVAR	_duty
	.line	153, "main.c"; 	break;
	LGOTO	_00162_DS_
_00161_DS_:
	.line	155, "main.c"; 	duty = 100;
	MOVIA	0x64
	BANKSEL	_duty
	MOVAR	_duty
;;unsigned compare: left < lit (0x1=1), size=1
_00162_DS_:
	.line	159, "main.c"; 	switch(modeStep)
	MOVIA	0x01
	BANKSEL	_modeStep
	SUBAR	_modeStep,W
	BTRSS	STATUS,0
	LGOTO	_00203_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	MOVIA	0x06
	SUBAR	_modeStep,W
	BTRSC	STATUS,0
	LGOTO	_00203_DS_
	DECR	_modeStep,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	MOVIA	((_00261_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x101C,W
	ADDIA	_00261_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00261_DS_:
	LGOTO	_00163_DS_
	LGOTO	_00164_DS_
	LGOTO	_00170_DS_
	LGOTO	_00176_DS_
	LGOTO	_00185_DS_
_00163_DS_:
	.line	162, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	.line	163, "main.c"; 	break;
	LGOTO	_00203_DS_
_00164_DS_:
	.line	165, "main.c"; 	if(++timeCount >= 39)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x27=39), size=2
	MOVIA	0x00
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00262_DS_
	MOVIA	0x27
	SUBAR	_timeCount,W
_00262_DS_:
	BTRSS	STATUS,0
	LGOTO	_00166_DS_
	.line	166, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
;;unsigned compare: left < lit (0x11=17), size=2
_00166_DS_:
	.line	167, "main.c"; 	if(timeCount < 17)
	MOVIA	0x00
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00263_DS_
	MOVIA	0x11
	SUBAR	_timeCount,W
_00263_DS_:
	BTRSC	STATUS,0
	LGOTO	_00168_DS_
	.line	168, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
_00168_DS_:
	.line	170, "main.c"; 	motorEn = 0;
	BANKSEL	_motorEn
	CLRR	_motorEn
	.line	171, "main.c"; 	break;
	LGOTO	_00203_DS_
_00170_DS_:
	.line	173, "main.c"; 	if(++timeCount >= 18)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x12=18), size=2
	MOVIA	0x00
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00264_DS_
	MOVIA	0x12
	SUBAR	_timeCount,W
_00264_DS_:
	BTRSS	STATUS,0
	LGOTO	_00172_DS_
	.line	174, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
;;unsigned compare: left < lit (0x8=8), size=2
_00172_DS_:
	.line	175, "main.c"; 	if(timeCount < 8)
	MOVIA	0x00
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00265_DS_
	MOVIA	0x08
	SUBAR	_timeCount,W
_00265_DS_:
	BTRSC	STATUS,0
	LGOTO	_00174_DS_
	.line	176, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
_00174_DS_:
	.line	178, "main.c"; 	motorEn = 0;
	BANKSEL	_motorEn
	CLRR	_motorEn
	.line	179, "main.c"; 	break;
	LGOTO	_00203_DS_
_00176_DS_:
	.line	181, "main.c"; 	if(++timeCount >= 259)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x103=259), size=2
	MOVIA	0x01
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00266_DS_
	MOVIA	0x03
	SUBAR	_timeCount,W
_00266_DS_:
	BTRSS	STATUS,0
	LGOTO	_00178_DS_
	.line	182, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xAB=171), size=2
_00178_DS_:
	.line	183, "main.c"; 	if(timeCount > 170)
	MOVIA	0x00
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00267_DS_
	MOVIA	0xab
	SUBAR	_timeCount,W
_00267_DS_:
	BTRSS	STATUS,0
	LGOTO	_00183_DS_
	.line	184, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
_00183_DS_:
	.line	187, "main.c"; 	if((timeCount % 17) > 9)
	MOVIA	0x11
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK00,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0xA=10), size=2
	MOVIA	0x00
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,2
	LGOTO	_00268_DS_
	MOVIA	0x0a
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
_00268_DS_:
	BTRSS	STATUS,0
	LGOTO	_00180_DS_
	.line	188, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
_00180_DS_:
	.line	190, "main.c"; 	motorEn = 0;
	BANKSEL	_motorEn
	CLRR	_motorEn
	.line	192, "main.c"; 	break;
	LGOTO	_00203_DS_
_00185_DS_:
	.line	194, "main.c"; 	if(++timeCount >= 889)
	BANKSEL	_timeCount
	INCR	_timeCount,F
	BTRSC	STATUS,2
	INCR	(_timeCount + 1),F
;;unsigned compare: left < lit (0x379=889), size=2
	MOVIA	0x03
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00269_DS_
	MOVIA	0x79
	SUBAR	_timeCount,W
_00269_DS_:
	BTRSS	STATUS,0
	LGOTO	_00187_DS_
	.line	195, "main.c"; 	timeCount = 0;
	BANKSEL	_timeCount
	CLRR	_timeCount
	CLRR	(_timeCount + 1)
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x2A9=681), size=2
_00187_DS_:
	.line	196, "main.c"; 	if(timeCount > 680)
	MOVIA	0x02
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00270_DS_
	MOVIA	0xa9
	SUBAR	_timeCount,W
_00270_DS_:
	BTRSS	STATUS,0
	LGOTO	_00200_DS_
	.line	197, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
;;unsigned compare: left < lit (0xED=237), size=2
_00200_DS_:
	.line	200, "main.c"; 	if(timeCount < 237)
	MOVIA	0x00
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00271_DS_
	MOVIA	0xed
	SUBAR	_timeCount,W
_00271_DS_:
	BTRSC	STATUS,0
	LGOTO	_00197_DS_
	.line	202, "main.c"; 	if((timeCount % 35) > 30)
	MOVIA	0x23
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK00,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x1F=31), size=2
	MOVIA	0x00
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,2
	LGOTO	_00272_DS_
	MOVIA	0x1f
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
_00272_DS_:
	BTRSS	STATUS,0
	LGOTO	_00189_DS_
	.line	203, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
	LGOTO	_00203_DS_
_00189_DS_:
	.line	205, "main.c"; 	motorEn = 0;
	BANKSEL	_motorEn
	CLRR	_motorEn
	LGOTO	_00203_DS_
;;unsigned compare: left < lit (0x2A8=680), size=2
_00197_DS_:
	.line	207, "main.c"; 	else if(timeCount < 680)
	MOVIA	0x02
	BANKSEL	_timeCount
	SUBAR	(_timeCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00273_DS_
	MOVIA	0xa8
	SUBAR	_timeCount,W
_00273_DS_:
	BTRSC	STATUS,0
	LGOTO	_00203_DS_
	.line	209, "main.c"; 	if((timeCount % 63) > 26)
	MOVIA	0x3f
	MOVAR	STK02
	MOVIA	0x00
	MOVAR	STK01
	BANKSEL	_timeCount
	MOVR	_timeCount,W
	MOVAR	STK00
	MOVR	(_timeCount + 1),W
	LCALL	__moduint
	BANKSEL	r0x101D
	MOVAR	r0x101D
	MOVR	STK00,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x1B=27), size=2
	MOVIA	0x00
	BANKSEL	r0x101D
	SUBAR	r0x101D,W
	BTRSS	STATUS,2
	LGOTO	_00274_DS_
	MOVIA	0x1b
	BANKSEL	r0x101C
	SUBAR	r0x101C,W
_00274_DS_:
	BTRSS	STATUS,0
	LGOTO	_00192_DS_
	.line	210, "main.c"; 	motorEn = 0;
	BANKSEL	_motorEn
	CLRR	_motorEn
	LGOTO	_00203_DS_
_00192_DS_:
	.line	212, "main.c"; 	motorEn = 1;
	MOVIA	0x01
	BANKSEL	_motorEn
	MOVAR	_motorEn
_00203_DS_:
	.line	219, "main.c"; 	}
	RETURN	
; exit point of _workCon

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
	.line	129, "main.c"; 	if(count1s > 0)
	BANKSEL	_count1s
	MOVR	_count1s,W
	BTRSC	STATUS,2
	LGOTO	_00150_DS_
	.line	131, "main.c"; 	LEDON();
	BSR	_PORTA,0
	.line	132, "main.c"; 	count1s--;
	DECR	_count1s,F
	LGOTO	_00152_DS_
_00150_DS_:
	.line	135, "main.c"; 	LEDOFF();
	BCR	_PORTA,0
_00152_DS_:
	.line	136, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  674+  172 =   846 instructions ( 2036 byte)

	end
