; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
Map_HUD:	dc.w @allyellow-Map_HUD, @ringred-Map_HUD
		dc.w @timered-Map_HUD, @allred-Map_HUD
		
	if TimeRingsFlashFixNotRed=1	;Mercury Time Rings Flash Fix
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
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@ringred:	dc.b $9
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@timered:	dc.b $A
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $80, $18, 0	; RING
		dc.b $A0, 1, $80, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@allred:	dc.b $8
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
	else
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
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@ringred:	dc.b $B
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $80, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $A0, $18, 0	; RING
		dc.b $A0, 1, $A0, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@timered:	dc.b $B
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $A0, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $80, $18, 0	; RING
		dc.b $A0, 1, $80, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
		dc.b 0
@allred:	dc.b $B
		dc.b $80, $D, $80, $10, 0	; SCOR
		dc.b $80, $D, $80, $28,	$20	; E nnn
		dc.b $80, $D, $80, $30,	$40	; nnnn
		dc.b $90, $D, $A0, $20,	0	; TIME
		dc.b $90, $D, $80, $38,	$28	; n'nn
			dc.b $90, 9, $80, $0,	$48	; "nn
		dc.b $A0, $D, $A0, $18, 0	; RING
		dc.b $A0, 1, $A0, $10, $20	; S
		dc.b $A0, 9, $80, $40, $30	; rings
		dc.b $40, 5, $81, $1A, 0	; icon
		dc.b $40, $D, $81, $1E, $10	; SONIC x nn
	endc	;end Time Rings Flash Fix
		
		even
