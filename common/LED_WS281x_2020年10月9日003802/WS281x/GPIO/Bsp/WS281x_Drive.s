list c=on

#include "NY8A054D.h"

R_TWINKLE_COUNT		EQU		0x40
DAT					EQU		0x41

extern _WS281x_Drive_Write_Byte

.segment "code"

_WS281x_Drive_Write_Byte:

LED_TWINKLE_Q:
		movar	DAT				; 形参
		movia	8
		movar	R_TWINKLE_COUNT
LED_TWINKLE_Q_LOOP:
		bsr     Pr_PA_Data,5		; Set PA5 outputs High
		bsr     Pr_PA_Data,5		; Set PA5 outputs High
		bsr     Pr_PA_Data,5		; Set PA5 outputs High
		; nop
		; nop
		btrss	DAT,7
		bcr     Pr_PA_Data,5		; Set PA5 outputs High
		btrsc	DAT,7
		bsr     Pr_PA_Data,5		; Set PA5 outputs LOW
		; nop
		nop
		bcr     Pr_PA_Data,5		; Set PA5 outputs LOW
		RLR 	DAT,C_SaveToReg
		decrsz	R_TWINKLE_COUNT,C_SaveToReg
		lgoto	LED_TWINKLE_Q_LOOP
		ret
END
