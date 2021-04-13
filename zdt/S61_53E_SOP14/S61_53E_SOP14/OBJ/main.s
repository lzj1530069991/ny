;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A053E,c=on
	#include "ny8a053e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_TMRH
	extern	_TM34RH
	extern	_OSCCR
	extern	_P3CR1
	extern	_PWM3DUTY
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_IOSTA
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main

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
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	27, "main.c"; 	DISI();
	DISI
	.line	29, "main.c"; 	IOSTB = C_PB_Output;					// Set PortB as output port    
	CLRA	
	IOST	_IOSTB
	.line	30, "main.c"; 	IOSTA = C_PA_Output;					// Set PortA as output port
	IOST	_IOSTA
	.line	31, "main.c"; 	PORTA = 0x00;							// PortA Data Register = 0x00
	CLRR	_PORTA
	.line	32, "main.c"; 	PORTB = 0x00;							// PortB Data Register = 0x00    
	CLRR	_PORTB
	.line	33, "main.c"; 	PCON  = C_WDT_En | C_LVR_En; 			// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	36, "main.c"; 	TMRH  = C_TMR1_Data_b9 | C_TMR1_Data_b8 | C_PWM2_Duty_b9 | C_PWM2_Duty_b8;	// SET TMR1_Data_b9 , TMR1_Data_b8 , PWM2_Duty_b9 & PWM2_Duty_b8 as 1
	MOVIA	0x3c
	SFUN	_TMRH
	.line	37, "main.c"; 	TMR1  = 0xFF;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
	MOVIA	0xff
	SFUN	_TMR1
	.line	38, "main.c"; 	PWM1DUTY = C_PWM_LB_DUTY_01H;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
	MOVIA	0x01
	SFUN	_PWM1DUTY
	.line	39, "main.c"; 	PWM2DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM2DUTY LB register ( PWM2DUTY[9:0]=3FFH )
	MOVIA	0xff
	SFUN	_PWM2DUTY
	.line	40, "main.c"; 	T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clock
	MOVIA	0x08
	SFUN	_T1CR2
	.line	41, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x83
	SFUN	_T1CR1
	.line	42, "main.c"; 	P2CR1	 = C_PWM2_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM2 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1 
	SFUN	_P2CR1
	.line	45, "main.c"; 	TM34RH   = C_PWM3_Duty_b9 | C_PWM3_Duty_b8;	// SET PWM3_Duty_b9 & PWM3_Duty_b8 as 1 
	MOVIA	0x03
	SFUN	_TM34RH
	.line	46, "main.c"; 	PWM3DUTY = C_PWM_LB_DUTY_00H;			// Move 00H to PWM3DUTY LB register ( PWM3DUTY[9:0]=300H )
	CLRA	
	SFUN	_PWM3DUTY
	.line	47, "main.c"; 	PWM4DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM4DUTY LB register ( PWM4DUTY[9:0]=0FFH )
	MOVIA	0xff
	SFUN	_PWM4DUTY
	.line	48, "main.c"; 	P3CR1	 = C_PWM3_En | C_PWM3_Active_Hi; // Enable PWM3 , Active_High
	MOVIA	0x80
	SFUN	_P3CR1
	.line	49, "main.c"; 	P4CR1	 = C_PWM4_En | C_PWM4_Active_Hi; // Enable PWM4 , Active_High 
	SFUN	_P4CR1
_00106_DS_:
	.line	53, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	MGOTO	_00106_DS_
	.line	55, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   31+    0 =    31 instructions (   62 byte)

	end
