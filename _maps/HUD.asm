; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
Map_HUD:	dc.w @allyellow-Map_HUD, @ringred-Map_HUD
		dc.w @timered-Map_HUD, @allred-Map_HUD
		
	if TimeRingsFlashFixNotRed=1	;Mercury Time Rings Flash Fix
@allyellow:	dc.b $A
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, $D, $80, 8, 0		; RING
		dc.b $A0, 1, $80, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $81, $A, 0		; icon
		dc.b $40, $D, $81, $E, $10	; SONIC x nn
		dc.b 0
@ringred:	dc.b $8
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $81, $A, 0		; icon
		dc.b $40, $D, $81, $E, $10	; SONIC x nn
		dc.b 0
@timered:	dc.b $9
		dc.b $80, $D, $80, 0, 0
		dc.b $80, $D, $80, $18,	$20
		dc.b $80, $D, $80, $20,	$40
		dc.b $90, $D, $80, $28,	$28
		dc.b $A0, $D, $80, 8, 0
		dc.b $A0, 1, $80, 0, $20
		dc.b $A0, 9, $80, $30, $30
		dc.b $40, 5, $81, $A, 0
		dc.b $40, $D, $81, $E, $10
		dc.b 0
@allred:	dc.b $7
		dc.b $80, $D, $80, 0, 0
		dc.b $80, $D, $80, $18,	$20
		dc.b $80, $D, $80, $20,	$40
		dc.b $90, $D, $80, $28,	$28
		dc.b $A0, 9, $80, $30, $30
		dc.b $40, 5, $81, $A, 0
		dc.b $40, $D, $81, $E, $10
	else
@allyellow:	dc.b $A
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, $D, $80, 8, 0		; RING
		dc.b $A0, 1, $80, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $81, $A, 0		; icon
		dc.b $40, $D, $81, $E, $10	; SONIC x nn
		dc.b 0
@ringred:	dc.b $A
		dc.b $80, $D, $80, 0, 0		; SCOR
		dc.b $80, $D, $80, $18,	$20	; E nnn
		dc.b $80, $D, $80, $20,	$40	; nnnn
		dc.b $90, $D, $80, $10,	0	; TIME
		dc.b $90, $D, $80, $28,	$28	; n:nn
		dc.b $A0, $D, $A0, 8, 0		; RING
		dc.b $A0, 1, $A0, 0, $20	; S
		dc.b $A0, 9, $80, $30, $30	; rings
		dc.b $40, 5, $81, $A, 0		; icon
		dc.b $40, $D, $81, $E, $10	; SONIC x nn
		dc.b 0
@timered:	dc.b $A
		dc.b $80, $D, $80, 0, 0
		dc.b $80, $D, $80, $18,	$20
		dc.b $80, $D, $80, $20,	$40
		dc.b $90, $D, $A0, $10,	0
		dc.b $90, $D, $80, $28,	$28
		dc.b $A0, $D, $80, 8, 0
		dc.b $A0, 1, $80, 0, $20
		dc.b $A0, 9, $80, $30, $30
		dc.b $40, 5, $81, $A, 0
		dc.b $40, $D, $81, $E, $10
		dc.b 0
@allred:	dc.b $A
		dc.b $80, $D, $80, 0, 0
		dc.b $80, $D, $80, $18,	$20
		dc.b $80, $D, $80, $20,	$40
		dc.b $90, $D, $A0, $10,	0
		dc.b $90, $D, $80, $28,	$28
		dc.b $A0, $D, $A0, 8, 0
		dc.b $A0, 1, $A0, 0, $20
		dc.b $A0, 9, $80, $30, $30
		dc.b $40, 5, $81, $A, 0
		dc.b $40, $D, $81, $E, $10
	endc	;end Time Rings Flash Fix
		
		even
