; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
Map_HUD_SS:
		dc.w @allyellow-Map_HUD_SS, @ringgone-Map_HUD_SS
		dc.w @timegone-Map_HUD_SS, @bothgone-Map_HUD_SS
		
	; Normal
	if HUDInSpecialStageType=0
@allyellow:	dc.b $A
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, $D, $80, 8, 0		; RING
		dc.b $A0, 1, $80, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@ringgone:	dc.b $8
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@timegone:	dc.b $9
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, $D, $80, 8, 0		; RING
		dc.b $A0, 1, $80, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@bothgone:	dc.b $7
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
	endc
		
	; Score Missing
	if HUDInSpecialStageType=1
@allyellow:	dc.b $7
		dc.b $80, $D, $80, $10,	0	; TIME
		dc.b $80, $D, $80, $28,	$28	; n:nn
		dc.b $90, $D, $80, 8, 0		; RING
		dc.b $90, 1, $80, 0, $20	; S
		dc.b $90, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@ringgone:	dc.b $5
		dc.b $80, $D, $80, $10,	0	; TIME
		dc.b $80, $D, $80, $28,	$28	; n:nn
		dc.b $90, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@timegone:	dc.b $6
		dc.b $80, $D, $80, $28,	$28	; n:nn
		dc.b $90, $D, $80, 8, 0		; RING
		dc.b $90, 1, $80, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@bothgone:	dc.b $4
		dc.b $80, $D, $80, $28,	$28	; n:nn
		dc.b $90, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
	endc
	
	; Score & Time Missing
	if HUDInSpecialStageType=2
@allyellow:	dc.b $5
		dc.b $80, $D, $80, 8, 0		; RING
		dc.b $80, 1, $80, 0, $20	; S
		dc.b $80, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@ringgone:	dc.b $3
		dc.b $80, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@timegone:	dc.b $5
		dc.b $80, $D, $80, 8, 0		; RING
		dc.b $80, 1, $80, 0, $20	; S
		dc.b $80, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
@bothgone:	dc.b $3
		dc.b $80, 9, $80, $30, $30	; rings
		dc.b $40, 5, $80, $36, 0	; icon
		dc.b $40, $D, $80, $3A, $10	; SONIC x nn
	endc
	
	; Rings Only
	if HUDInSpecialStageType=3
@allyellow:	dc.b $3
		dc.b $80, $D, $80, 8, 0		; RING
		dc.b $80, 1, $80, 0, $20	; S
		dc.b $80, 9, $80, $30, $30	; rings
@ringgone:	dc.b $1
		dc.b $80, 9, $80, $30, $30	; rings
@timegone:	dc.b $3
		dc.b $80, $D, $80, 8, 0		; RING
		dc.b $80, 1, $80, 0, $20	; S
		dc.b $80, 9, $80, $30, $30	; rings
@bothgone:	dc.b $1
		dc.b $80, 9, $80, $30, $30	; rings
	endc
	
		even
		