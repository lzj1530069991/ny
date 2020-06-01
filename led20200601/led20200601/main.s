;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A050D,c=on
	#include "ny8a050d.inc"
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
	extern	_keyRead
	extern	_KeyScan
	extern	_Led10
	extern	_Led9
	extern	_Led8
	extern	_Led7
	extern	_Led6
	extern	_Led5
	extern	_Led4
	extern	_Led3
	extern	_Led2
	extern	_Led1
	extern	_ledCon
	extern	_isr
	extern	_main
	extern	_delay
	extern	_KeyStatus
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep
	extern	_keyClick
	extern	_ledCount
	extern	_time

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

.segment "uninit", 0x20000010
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
r0x1011:
	.res	1
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
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x01
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00
	.debuginfo gvariable name=_keyClick,1byte,array=0,entsize=1,ext=1


.segment "idata"
_ledCount:
	dw	0x00
	.debuginfo gvariable name=_ledCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_time:
	dw	0x00
	.debuginfo gvariable name=_time,1byte,array=0,entsize=1,ext=1

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
	.line	44, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	47, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	49, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	50, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	51, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	53, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	54, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	58, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	60, "main.c"; 	}
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
;   _KeyScan
;   _keyRead
;   _ledCon
;   _KeyScan
;   _keyRead
;   _ledCon
;1 compiler assigned register :
;   r0x1011
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	66, "main.c"; 	IOSTB =   C_PB0_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	67, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High
	CLRR	_PORTB
	.line	68, "main.c"; 	BPLCON = 0xE0;							//PB0拉低
	MOVIA	0xe0
	MOVAR	_BPLCON
	.line	69, "main.c"; 	DISI();
	DISI
	.line	71, "main.c"; 	PCON1 = C_TMR0_Dis;						// Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	72, "main.c"; 	TMR0 = 55;								// Load 0x00 to TMR0 (Initial Timer0 register)
	MOVIA	0x37
	MOVAR	_TMR0
	.line	74, "main.c"; 	T0MD = C_PS0_TMR0 | C_PS0_Div2 ;		// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:8,clock source is instruction clock
	CLRA	
	T0MD	
	.line	81, "main.c"; 	INTE = C_INT_TMR0;	// Enable Timer0 interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	84, "main.c"; 	PCON =  C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x08
	MOVAR	_PCON
	.line	87, "main.c"; 	PCON1 = C_TMR0_En;						// Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	88, "main.c"; 	ENI();									// Enable all unmasked interrupts			
	ENI
_00120_DS_:
	.line	92, "main.c"; 	CLRWDT();  
	clrwdt
	.line	93, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	95, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	97, "main.c"; 	KeyStatus = KeyScan() & 0x1F;
	LCALL	_KeyScan
	MOVAR	r0x1011
	MOVIA	0x1f
	ANDAR	r0x1011,W
	MOVAR	_KeyStatus
	.line	98, "main.c"; 	keyClick = keyRead();
	LCALL	_keyRead
	MOVAR	_keyClick
	.line	99, "main.c"; 	if(keyClick == 1)
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00118_DS_
	.line	101, "main.c"; 	workStep++;
	INCR	_workStep,F
	.line	102, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	103, "main.c"; 	time = 0;
	CLRR	_time
;;unsigned compare: left < lit (0xB=11), size=1
	.line	104, "main.c"; 	if(workStep >= 11)
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00118_DS_
	.line	105, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
_00118_DS_:
	.line	107, "main.c"; 	ledCon();
	LCALL	_ledCon
	LGOTO	_00120_DS_
	.line	109, "main.c"; 	}
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
	.line	248, "main.c"; 	void delay(u16t time)
	MOVAR	r0x100B
	MOVR	STK00,W
	MOVAR	r0x100C
	.line	250, "main.c"; 	for(u16t i=0;i<time;i++);
	CLRR	r0x100D
	CLRR	r0x100E
_00219_DS_:
	MOVR	r0x100B,W
	SUBAR	r0x100E,W
	BTRSS	STATUS,2
	LGOTO	_00230_DS_
	MOVR	r0x100C,W
	SUBAR	r0x100D,W
_00230_DS_:
	BTRSC	STATUS,0
	LGOTO	_00221_DS_
	INCR	r0x100D,F
	BTRSC	STATUS,2
	INCR	r0x100E,F
	LGOTO	_00219_DS_
_00221_DS_:
	.line	251, "main.c"; 	}
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
	.line	227, "main.c"; 	if (KeyStatus & 0x08)
	BTRSS	_KeyStatus,3
	LGOTO	_00210_DS_
	.line	229, "main.c"; 	keyCount++;
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	230, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00211_DS_
	.line	232, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00211_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00210_DS_:
	.line	238, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00208_DS_
	.line	240, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	241, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00212_DS_
_00208_DS_:
	.line	243, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
_00211_DS_:
	.line	245, "main.c"; 	return 0;
	MOVIA	0x00
_00212_DS_:
	.line	246, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
.segment "code"; module=main, function=_KeyScan
	.debuginfo subprogram _KeyScan
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x100F
_KeyScan:
; 2 exit points
	.line	218, "main.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
;;1	MOVAR	r0x100F
	.line	221, "main.c"; 	}
	RETURN	
; exit point of _KeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led10
	.debuginfo subprogram _Led10
_Led10:
; 2 exit points
	.line	209, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	210, "main.c"; 	}
	RETURN	
; exit point of _Led10

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led9
	.debuginfo subprogram _Led9
_Led9:
; 2 exit points
	.line	204, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	205, "main.c"; 	}
	RETURN	
; exit point of _Led9

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led8
	.debuginfo subprogram _Led8
_Led8:
; 2 exit points
	.line	199, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	200, "main.c"; 	}
	RETURN	
; exit point of _Led8

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led7
	.debuginfo subprogram _Led7
_Led7:
; 2 exit points
	.line	194, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	195, "main.c"; 	}
	RETURN	
; exit point of _Led7

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led6
	.debuginfo subprogram _Led6
_Led6:
; 2 exit points
	.line	189, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	190, "main.c"; 	}
	RETURN	
; exit point of _Led6

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led5
	.debuginfo subprogram _Led5
_Led5:
; 2 exit points
	.line	184, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	185, "main.c"; 	}
	RETURN	
; exit point of _Led5

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led4
	.debuginfo subprogram _Led4
_Led4:
; 2 exit points
	.line	179, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	180, "main.c"; 	}
	RETURN	
; exit point of _Led4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led3
	.debuginfo subprogram _Led3
_Led3:
; 2 exit points
	.line	174, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	175, "main.c"; 	}
	RETURN	
; exit point of _Led3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led2
	.debuginfo subprogram _Led2
_Led2:
; 2 exit points
	.line	169, "main.c"; 	PORTB = 0x12;
	MOVIA	0x12
	MOVAR	_PORTB
	.line	170, "main.c"; 	}
	RETURN	
; exit point of _Led2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Led1
	.debuginfo subprogram _Led1
_Led1:
; 2 exit points
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	152, "main.c"; 	if(ledCount >= 200)
	MOVIA	0xc8
	SUBAR	_ledCount,W
	BTRSS	STATUS,0
	LGOTO	_00154_DS_
	.line	154, "main.c"; 	ledCount = 0;
	CLRR	_ledCount
	.line	155, "main.c"; 	time++;
	INCR	_time,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x3=3), size=1
	.line	156, "main.c"; 	if(time > 2)
	MOVIA	0x03
	SUBAR	_time,W
	BTRSC	STATUS,0
	.line	157, "main.c"; 	return;
	LGOTO	_00160_DS_
_00154_DS_:
	.line	160, "main.c"; 	if(ledCount <100)
	MOVIA	0x64
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00158_DS_
	.line	161, "main.c"; 	PORTB = 0x02;
	MOVIA	0x02
	MOVAR	_PORTB
	LGOTO	_00160_DS_
;;unsigned compare: left < lit (0xC8=200), size=1
_00158_DS_:
	.line	162, "main.c"; 	else if(ledCount < 200)
	MOVIA	0xc8
	SUBAR	_ledCount,W
	BTRSC	STATUS,0
	LGOTO	_00160_DS_
	.line	163, "main.c"; 	PORTB = 0x10;
	MOVIA	0x10
	MOVAR	_PORTB
_00160_DS_:
	.line	165, "main.c"; 	}
	RETURN	
; exit point of _Led1

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Led1
;   _Led2
;   _Led3
;   _Led4
;   _Led5
;   _Led6
;   _Led7
;   _Led8
;   _Led9
;   _Led10
;   _Led1
;   _Led2
;   _Led3
;   _Led4
;   _Led5
;   _Led6
;   _Led7
;   _Led8
;   _Led9
;   _Led10
;1 compiler assigned register :
;   r0x1010
;; Starting pCode block
.segment "code"; module=main, function=_ledCon
	.debuginfo subprogram _ledCon
_ledCon:
; 2 exit points
;;unsigned compare: left < lit (0x1=1), size=1
	.line	114, "main.c"; 	switch(workStep)
	MOVIA	0x01
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	MOVIA	0x0b
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00135_DS_
	DECR	_workStep,W
	MOVAR	r0x1010
	MOVIA	((_00146_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	r0x1010,W
	ADDIA	_00146_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00146_DS_:
	LGOTO	_00125_DS_
	LGOTO	_00126_DS_
	LGOTO	_00127_DS_
	LGOTO	_00128_DS_
	LGOTO	_00129_DS_
	LGOTO	_00130_DS_
	LGOTO	_00131_DS_
	LGOTO	_00132_DS_
	LGOTO	_00133_DS_
	LGOTO	_00134_DS_
_00125_DS_:
	.line	117, "main.c"; 	Led1();
	LCALL	_Led1
	.line	118, "main.c"; 	break;
	LGOTO	_00135_DS_
_00126_DS_:
	.line	120, "main.c"; 	Led2();
	LCALL	_Led2
	.line	121, "main.c"; 	break;
	LGOTO	_00135_DS_
_00127_DS_:
	.line	123, "main.c"; 	Led3();
	LCALL	_Led3
	.line	124, "main.c"; 	break;
	LGOTO	_00135_DS_
_00128_DS_:
	.line	126, "main.c"; 	Led4();
	LCALL	_Led4
	.line	127, "main.c"; 	break;
	LGOTO	_00135_DS_
_00129_DS_:
	.line	129, "main.c"; 	Led5();
	LCALL	_Led5
	.line	130, "main.c"; 	break;
	LGOTO	_00135_DS_
_00130_DS_:
	.line	132, "main.c"; 	Led6();
	LCALL	_Led6
	.line	133, "main.c"; 	break;
	LGOTO	_00135_DS_
_00131_DS_:
	.line	135, "main.c"; 	Led7();
	LCALL	_Led7
	.line	136, "main.c"; 	break;
	LGOTO	_00135_DS_
_00132_DS_:
	.line	138, "main.c"; 	Led8();
	LCALL	_Led8
	.line	139, "main.c"; 	break;
	LGOTO	_00135_DS_
_00133_DS_:
	.line	141, "main.c"; 	Led9();
	LCALL	_Led9
	.line	142, "main.c"; 	break;
	LGOTO	_00135_DS_
_00134_DS_:
	.line	144, "main.c"; 	Led10();
	LCALL	_Led10
_00135_DS_:
	.line	147, "main.c"; 	ledCount++;
	INCR	_ledCount,F
	.line	148, "main.c"; 	}
	RETURN	
; exit point of _ledCon


;	code size estimation:
;	  222+    0 =   222 instructions (  444 byte)

	end
