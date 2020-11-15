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
	extern	_gotoSleep
	extern	_checkLVD
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_lvdFlag
	extern	_timeCount
	extern	_timeStep
	extern	_count7s
	extern	_lvdCount

	extern PSAVE
	extern SSAVE
	extern WSAVE
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
r0x1010:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100E:
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
_lvdFlag:
	dw	0x00
	.debuginfo gvariable name=_lvdFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeCount:
	dw	0x00
	.debuginfo gvariable name=_timeCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_timeStep:
	dw	0x00
	.debuginfo gvariable name=_timeStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count7s:
	dw	0xbc, 0x02
	.debuginfo gvariable name=_count7s,2byte,array=0,entsize=2,ext=1


.segment "idata"
_lvdCount:
	dw	0x00
	.debuginfo gvariable name=_lvdCount,1byte,array=0,entsize=1,ext=1

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
	.line	23, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	25, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	27, "main.c"; 	TMR0 += 55;	
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	28, "main.c"; 	if(++intCount >= 100)
	INCR	_intCount,F
;;unsigned compare: left < lit (0x64=100), size=1
	MOVIA	0x64
	SUBAR	_intCount,W
	BTRSS	STATUS,0
	LGOTO	_00108_DS_
	.line	30, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	31, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	34, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	36, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	39, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	41, "main.c"; 	}
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
;   _gotoSleep
;   _workCtr
;   _checkLVD
;   _gotoSleep
;   _workCtr
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	47, "main.c"; 	IOSTB =  C_PB1_Input;	// Set PB4 & PB1 to input mode,others set to output mode
	MOVIA	0x02
	IOST	_IOSTB
	.line	48, "main.c"; 	PORTB = 0x00;                       // PB2 & PB0 output high
	CLRR	_PORTB
	.line	49, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	50, "main.c"; 	BPHCON = 0xFD;
	MOVIA	0xfd
	MOVAR	_BPHCON
	.line	51, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	52, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	53, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	54, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	56, "main.c"; 	PCON1 = C_LVD_3P0V | C_TMR0_En;
	MOVIA	0x15
	IOST	_PCON1
	.line	57, "main.c"; 	ENI();	
	ENI
_00121_DS_:
	.line	61, "main.c"; 	CLRWDT();  
	clrwdt
	.line	62, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00121_DS_
	.line	65, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	67, "main.c"; 	checkLVD();
	LCALL	_checkLVD
	.line	68, "main.c"; 	if(lvdFlag)
	MOVR	_lvdFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	70, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00121_DS_
_00118_DS_:
	.line	74, "main.c"; 	workCtr();
	LCALL	_workCtr
	LGOTO	_00121_DS_
	.line	77, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   r0x100D
;   r0x100E
;; Starting pCode block
.segment "code"; module=main, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _time[0]=r0x100C
	.debuginfo variable _time[1]=r0x100B
	.debuginfo variable _i[0]=r0x100D
	.debuginfo variable _i[1]=r0x100E
_delay:
; 2 exit points
	.line	185, "main.c"; 	void delay(u16t time)
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100C
	.line	187, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x100D
	CLRR	r0x100E
_00167_DS_:
	MOVR	r0x100B,W
	SUBAR	r0x100E,W
	BTRSS	STATUS,2
	LGOTO	_00178_DS_
	MOVR	r0x100C,W
	SUBAR	r0x100D,W
_00178_DS_:
	BTRSC	STATUS,0
	LGOTO	_00169_DS_
	INCR	r0x100D,F
	BTRSC	STATUS,2
	INCR	r0x100E,F
	LGOTO	_00167_DS_
_00169_DS_:
	.line	188, "main.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	168, "main.c"; 	lvdFlag = 0;
	CLRR	_lvdFlag
	.line	169, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
	.line	170, "main.c"; 	BWUCON = 0x02;
	MOVIA	0x02
	MOVAR	_BWUCON
	.line	171, "main.c"; 	count7s = 700;
	MOVIA	0xbc
	MOVAR	_count7s
	MOVIA	0x02
	MOVAR	(_count7s + 1)
	.line	172, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	173, "main.c"; 	INTE =  C_INT_PBKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	174, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	175, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	176, "main.c"; 	CLRWDT();
	clrwdt
	.line	177, "main.c"; 	SLEEP();
	sleep
	.line	178, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	179, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	181, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT ,  Enable LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	182, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;3 compiler assigned registers:
;   STK00
;   r0x100F
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_checkLVD
	.debuginfo subprogram _checkLVD
_checkLVD:
; 2 exit points
	.line	145, "main.c"; 	PCON1 = C_LVD_2P9V | C_TMR0_En;
	MOVIA	0x11
	IOST	_PCON1
	.line	146, "main.c"; 	delay(80);
	MOVIA	0x50
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay
	.line	148, "main.c"; 	if((PCON1 >> 6)&1)
	IOSTR	_PCON1
;;1	MOVAR	r0x100F
	ANDIA	0x40
	BTRSS	STATUS,2
	MOVIA	0x01
	MOVAR	r0x1010
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	LGOTO	_00154_DS_
	.line	150, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
	LGOTO	_00156_DS_
_00154_DS_:
	.line	154, "main.c"; 	if(lvdFlag == 0 && (++lvdCount >= 200))
	MOVR	_lvdFlag,W
	BTRSS	STATUS,2
	LGOTO	_00156_DS_
	INCR	_lvdCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_lvdCount,W
	BTRSS	STATUS,0
	LGOTO	_00156_DS_
	.line	156, "main.c"; 	lvdFlag = 1;
	MOVIA	0x01
	MOVAR	_lvdFlag
	.line	157, "main.c"; 	lvdCount = 0;
	CLRR	_lvdCount
_00156_DS_:
	.line	161, "main.c"; 	}
	RETURN	
; exit point of _checkLVD

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 2 exit points
	.line	82, "main.c"; 	if(PORTB & 0x02)
	BTRSS	_PORTB,1
	LGOTO	_00134_DS_
	.line	85, "main.c"; 	if(++timeCount > 200)
	INCR	_timeCount,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xC9=201), size=1
	MOVIA	0xc9
	SUBAR	_timeCount,W
	BTRSS	STATUS,0
	LGOTO	_00129_DS_
	.line	87, "main.c"; 	if(timeStep == 0)
	MOVR	_timeStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	89, "main.c"; 	count7s = 700;
	MOVIA	0xbc
	MOVAR	_count7s
	MOVIA	0x02
	MOVAR	(_count7s + 1)
_00127_DS_:
	.line	91, "main.c"; 	timeStep = 1;
	MOVIA	0x01
	MOVAR	_timeStep
	.line	92, "main.c"; 	timeCount = 200;
	MOVIA	0xc8
	MOVAR	_timeCount
	LGOTO	_00135_DS_
_00129_DS_:
	.line	96, "main.c"; 	PORTB &= 0xEF;		//B4关灯
	BCR	_PORTB,4
	.line	97, "main.c"; 	return;
	LGOTO	_00145_DS_
_00134_DS_:
	.line	103, "main.c"; 	if(timeStep == 1)
	MOVR	_timeStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00132_DS_
	.line	105, "main.c"; 	count7s = 700;
	MOVIA	0xbc
	MOVAR	_count7s
	MOVIA	0x02
	MOVAR	(_count7s + 1)
_00132_DS_:
	.line	107, "main.c"; 	timeStep = 0;
	CLRR	_timeStep
	.line	108, "main.c"; 	timeCount = 0;
	CLRR	_timeCount
_00135_DS_:
	.line	111, "main.c"; 	if(timeStep)
	MOVR	_timeStep,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
	.line	113, "main.c"; 	if(count7s > 0)
	MOVR	_count7s,W
	IORAR	(_count7s + 1),W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	.line	115, "main.c"; 	--count7s;
	MOVIA	0xff
	ADDAR	_count7s,F
	BTRSS	STATUS,0
	DECR	(_count7s + 1),F
	.line	116, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	LGOTO	_00138_DS_
_00137_DS_:
	.line	120, "main.c"; 	PORTB &= 0xDF;
	BCR	_PORTB,5
_00138_DS_:
	.line	122, "main.c"; 	PORTB |= 0x04;		//B2输出高电平
	BSR	_PORTB,2
	.line	123, "main.c"; 	PORTB &= 0xEF;		//B4关灯
	BCR	_PORTB,4
	LGOTO	_00145_DS_
_00143_DS_:
	.line	127, "main.c"; 	if(count7s > 0)
	MOVR	_count7s,W
	IORAR	(_count7s + 1),W
	BTRSC	STATUS,2
	LGOTO	_00140_DS_
	.line	129, "main.c"; 	--count7s;
	MOVIA	0xff
	ADDAR	_count7s,F
	BTRSS	STATUS,0
	DECR	(_count7s + 1),F
	.line	130, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	LGOTO	_00141_DS_
_00140_DS_:
	.line	134, "main.c"; 	PORTB &= 0xEF;
	BCR	_PORTB,4
	.line	136, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00141_DS_:
	.line	138, "main.c"; 	PORTB &= 0xDB;
	MOVIA	0xdb
	ANDAR	_PORTB,F
_00145_DS_:
	.line	140, "main.c"; 	}
	RETURN	
; exit point of _workCtr


;	code size estimation:
;	  203+    0 =   203 instructions (  406 byte)

	end
