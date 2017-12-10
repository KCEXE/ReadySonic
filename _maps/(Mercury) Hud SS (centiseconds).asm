; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
Map_HUD_SS:
		dc.w @allyellow-Map_HUD_SS, @ringgone-Map_HUD_SS
		dc.w @timegone-Map_HUD_SS, @bothgone-Map_HUD_SS
		
	; Normal
	if HUDInSpecialStageType=0
@allyellow:	dc.b $B
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $80, $18, 0	; RING
		dc.b $A0, 1, $80, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@ringgone:	dc.b $9
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@timegone:	dc.b $A
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $80, $18, 0	; RING
		dc.b $A0, 1, $80, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@bothgone:	dc.b $8
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
	endc
		
	; Score Missing
	if HUDInSpecialStageType=1
@allyellow:	dc.b $8
		dc.b $80, $D, $80, $20,	0	; TIME
		dc.b $80, $D, $80, $38,	$28	; n'nn
			dc.b $80, 9, $80, $0,	$48	; "nn
		dc.b $90, $D, $80, $18, 0	; RING
		dc.b $90, 1, $80, $10, $20	; S
		dc.b $90, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@ringgone:	dc.b $6
		dc.b $80, $D, $80, $20,	0	; TIME
		dc.b $80, $D, $80, $38,	$28	; n'nn
			dc.b $80, 9, $80, $0,	$48	; "nn
		dc.b $90, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@timegone:	dc.b $7
		dc.b $80, $D, $80, $38,	$28	; n'nn
			dc.b $80, 9, $80, $0,	$48	; "nn
		dc.b $90, $D, $80, $18, 0	; RING
		dc.b $90, 1, $80, $10, $20	; S
		dc.b $90, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@bothgone:	dc.b $5
		dc.b $80, $D, $80, $38,	$28	; n'nn
			dc.b $80, 9, $80, $0,	$48	; "nn
		dc.b $90, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
	endc
	
	; Score & Time Missing
	if HUDInSpecialStageType=2
@allyellow:	dc.b $5
		dc.b $80, $D, $80, $18, 0	; RING
		dc.b $80, 1, $80, $10, $20	; S
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@ringgone:	dc.b $3
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@timegone:	dc.b $5
		dc.b $80, $D, $80, $18, 0	; RING
		dc.b $80, 1, $80, $10, $20	; S
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
		dc.b 0
@bothgone:	dc.b $3
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b $40, 5, $80, $46, 0	; icon
		dc.b $40, $D, $80, $4A, $10	; SONIC x nn
	endc
	
	; Rings Only
	if HUDInSpecialStageType=3
@allyellow:	dc.b $3
		dc.b $80, $D, $80, $18, 0	; RING
		dc.b $80, 1, $80, $10, $20	; S
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b 0
@ringgone:	dc.b $1
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b 0
@timegone:	dc.b $3
		dc.b $80, $D, $80, $18, 0	; RING
		dc.b $80, 1, $80, $10, $20	; S
		dc.b $80, 9, $80, $40, $30	; rings
		dc.b 0
@bothgone:	dc.b $1
		dc.b $80, 9, $80, $40, $30	; rings
	endc
	
		even
		