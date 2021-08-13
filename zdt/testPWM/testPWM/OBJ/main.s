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

.segment "uninit", 0x20000040
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
	.line	25, "main.c"; 	DISI();
	DISI
	.line	27, "main.c"; 	IOSTA = C_PA_Output;					// Set PortA as output port
	CLRA	
	IOST	_IOSTA
	.line	28, "main.c"; 	PORTA = 0x00;							// PortA Data Register = 0x00
	CLRR	_PORTA
	.line	29, "main.c"; 	PCON  = C_WDT_En | C_LVR_En; 			// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	33, "main.c"; 	TMRH  = C_TMR2_Data_b9 | C_TMR2_Data_b8 | C_TMR1_Data_b9 | C_PWM2_Duty_b9 | C_PWM2_Duty_b8 | C_PWM1_Duty_b9;
	MOVIA	0xee
	MOVAR	_TMRH
	.line	35, "main.c"; 	TMR1  = 165;							// Move FFH to TMR1 LB register ( TMR1[9:0]=3FFH )
	MOVIA	0xa5
	SFUN	_TMR1
	.line	36, "main.c"; 	TMR2  = 0xFF;							// Move FFH to TMR2 LB register ( TMR2[9:0]=3FFH )
	MOVIA	0xff
	SFUN	_TMR2
	.line	37, "main.c"; 	PWM1DUTY = C_PWM_LB_DUTY_01H;			// Move 01H to PWM1DUTY LB register ( PWM1DUTY[9:0]=001H )
	MOVIA	0x01
	SFUN	_PWM1DUTY
	.line	38, "main.c"; 	PWM2DUTY = C_PWM_LB_DUTY_FFH;			// Move FFH to PWM2DUTY LB register ( PWM2DUTY[9:0]=3FFH )
	MOVIA	0xff
	SFUN	_PWM2DUTY
	.line	39, "main.c"; 	T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// Prescaler 1:1 , Timer1 clock source is instruction clock
	MOVIA	0x08
	SFUN	_T1CR2
	.line	40, "main.c"; 	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// Enable PWM1 , Active_High , Non-Stop mode ,reloaded from TMR1[9:0] , enable Timer1
	MOVIA	0x83
	SFUN	_T1CR1
_00106_DS_:
	.line	44, "main.c"; 	CLRWDT();							// Clear WatchDog
	clrwdt
	MGOTO	_00106_DS_
	.line	46, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   21+    0 =    21 instructions (   42 byte)

	end
