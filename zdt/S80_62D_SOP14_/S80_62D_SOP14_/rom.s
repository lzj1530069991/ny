	list c=on
	extern ___rolling_code_addr

	org 0x0e
___rolling_code_addr:
		nop				; fill nop allow rolling code
		nop

	end
