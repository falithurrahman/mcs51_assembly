high_on:
	mov TMOD, #00010000b
	mov TH1, #0FEH
	mov TL1, #015H
	setb TR1
	jmp case1
case1:	
	setb p0.7	
	jnb TF1, case1
	clr TF1
	jmp low_on
low_on:
	mov TMOD, #00010000b
	mov TH1, #0B3H
	mov TL1, #0C9H
	setb TR1
	jmp case2
case2:	
	clr p0.7	
	jnb TF1, case2
	clr TF1
	jmp awal
high_off:
	mov TMOD, #00010000b
	mov TH1, #0F7H
	mov TL1, #0CBH
	setb TR1
	jmp case1
case3:	
	setb p0.7	
	jnb TF1, case3
	clr TF1
	jmp low_off
low_off:
	mov TMOD, #00010000b
	mov TH1, #0BAH
	mov TL1, #013H
	setb TR1
	jmp case4
case4:	
	clr p0.7	
	jnb TF1, case4
	clr TF1
	jmp awal
awal:
	jb p0.6, high_on
	jmp high_off
	
	jmp awal
end
