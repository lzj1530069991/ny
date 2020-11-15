;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Bsp\WS281x.c"
	list	p=NY8A054D,c=on
	#include "ny8a054d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_KEY_Proess
	extern	_ScanKey_Config
	extern	_ScanKey
	extern	_IR_Decode
	extern	_IR_KEY_Proess
	extern	_WS281x_Drive_Write_Byte
	extern	_GPIO_Init
	extern	_KEY_GPIO_Init
	extern	_Timer1_Init
	extern	_Timer3_Init
	extern	_INT1_Init
	extern	_delay
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
	extern	_K1_struct
	extern	_K2_struct
	extern	_K3_struct
	extern	_irDeCodeTimeOverFlow
	extern	_irDeCodeDat
	extern	_irDeCodeBitTime
	extern	_irDeCodeBitIndex
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
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_WS281x_RGB

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
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;   _WS281x_Drive_Write_Byte
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   STK01
;   r0x1002
;; Starting pCode block
.segment "code"; module=WS281x, function=_WS281x_RGB
	.debuginfo subprogram _WS281x_RGB
;local variable name mapping:
	.debuginfo variable _R=r0x1000
	.debuginfo variable _G=r0x1001
	.debuginfo variable _B=r0x1002
_WS281x_RGB:
; 2 exit points
	.line	9, "Bsp\WS281x.c"; 	void WS281x_RGB(uint8_t R,uint8_t G,uint8_t B) {
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MOVR	STK00,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVR	STK01,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	11, "Bsp\WS281x.c"; 	WS281x_Drive_Write_Byte(G);
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	12, "Bsp\WS281x.c"; 	WS281x_Drive_Write_Byte(R);
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	13, "Bsp\WS281x.c"; 	WS281x_Drive_Write_Byte(B);
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	LCALL	_WS281x_Drive_Write_Byte
	.line	15, "Bsp\WS281x.c"; 	}
	RETURN	
; exit point of _WS281x_RGB


;	code size estimation:
;	   12+    6 =    18 instructions (   48 byte)

	end
