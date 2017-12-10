; ---------------------------------------------------------------------------
; Subroutine to	update the HUD
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


HUD_Update:
		tst.w	(f_debugmode).w	; is debug mode	on?
		bne.w	HudDebug	; if yes, branch
		tst.b	(f_scorecount).w ; does the score need updating?
		beq.s	@chkrings	; if not, branch
		clr.b	(f_scorecount).w
		locVRAMd0	$DC80	; move.l	#$5C800003,d0	; set VRAM address ;Mercury Macros
		move.l	(v_score).w,d1	; load score
		bsr.w	Hud_Score

	@chkrings:
		tst.b	(f_ringcount).w	; does the ring	counter	need updating?
		beq.s	Hud_ChkTime	; if not, branch
		bpl.s	loc_1C6E4
		bsr.w	Hud_LoadZero

loc_1C6E4:
		clr.b	(f_ringcount).w
		locVRAMd0	$DF40	; move.l	#$5F400003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.w	(v_rings).w,d1	; load number of rings
		bsr.w	Hud_Rings

Hud_ChkTime:
		tst.b	(f_timecount).w	; does the time	need updating?
		beq.w	Hud_ChkLives	; if not, branch	;Mercury HUD Centiseconds (bsr.s => bsr.w)
		tst.w	(f_pause).w	; is the game paused?
		bne.w	Hud_ChkLives	; if yes, branch	;Mercury HUD Centiseconds (bsr.s => bsr.w)
		lea	(v_time).w,a1
		
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
		cmpi.l	#$93B63,(a1)+	; is the time 9'59"99?
		beq.w	TimeOver	; if yes, branch	;Mercury HUD In Special Stage (bsr.s => bsr.w)
		move.b	(v_centstep).w,d1
		addi.b	#1,d1
		cmpi.b	#3,d1
		bne.s	@skip
		move.b	#0,d1
		
	@skip:
		move.b	d1,(v_centstep).w
		cmpi.b	#2,d1
		beq.s	@skip2
		addi.b	#1,d1
		
	@skip2:
		add.b	d1,-(a1)
		cmpi.b	#100,(a1)
		bcs.s	Hud_DoCent
	else
		cmpi.l	#$93B3B,(a1)+	; is the time 9.59?
		beq.w	TimeOver	; if yes, branch	;Mercury HUD In Special Stage (bsr.s => bsr.w)
		addq.b	#1,-(a1)
		cmpi.b	#60,(a1)
		bcs.s	Hud_ChkLives
	endc	;end HUD Centiseconds
	
		move.b	#0,(a1)
		addq.b	#1,-(a1)
		cmpi.b	#60,(a1)
		bcs.s	loc_1C734
		move.b	#0,(a1)
		addq.b	#1,-(a1)
		cmpi.b	#9,(a1)
		bcs.s	loc_1C734
		move.b	#9,(a1)

loc_1C734:
		locVRAMd0	$DE40	; move.l	#$5E400003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.b	(v_timemin).w,d1 ; load	minutes
		bsr.w	Hud_Mins
		locVRAMd0	$DEC0	; move.l	#$5EC00003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.b	(v_timesec).w,d1 ; load	seconds
		bsr.w	Hud_Secs
		
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
	Hud_DoCent:
		locVRAMd0	$D780	;Mercury Macros
		moveq	#0,d1
		move.b	(v_timecent).w,d1 ; load	seconds
		bsr.w	Hud_Secs
	endc	;end HUD Centiseconds

Hud_ChkLives:
		tst.b	(f_lifecount).w ; does the lives counter need updating?
		beq.s	Hud_ChkBonus	; if not, branch
		clr.b	(f_lifecount).w
		bsr.w	Hud_Lives

Hud_ChkBonus:
		tst.b	(f_endactbonus).w ; do time/ring bonus counters need updating?
		beq.s	Hud_End		; if not, branch
		clr.b	(f_endactbonus).w
		locVRAM	$AE00
		moveq	#0,d1
		move.w	(v_timebonus).w,d1 ; load time bonus
		bsr.w	Hud_TimeRingBonus
		moveq	#0,d1
		move.w	(v_ringbonus).w,d1 ; load ring bonus
		bsr.w	Hud_TimeRingBonus

Hud_End:
		rts	
; ===========================================================================

TimeOver:				; XREF: Hud_ChkTime
		clr.b	(f_timecount).w
		lea	(v_objspace).w,a0
		movea.l	a0,a2
		bsr.w	KillSonic
		move.b	#1,(f_timeover).w
		rts	
; ===========================================================================

HudDebug:				; XREF: HUD_Update
		bsr.w	HudDb_XY
		tst.b	(f_ringcount).w	; does the ring	counter	need updating?
		beq.s	HudDb_ObjCount	; if not, branch
		bpl.s	HudDb_Rings
		bsr.w	Hud_LoadZero

HudDb_Rings:
		clr.b	(f_ringcount).w
		locVRAMd0	$DF40	; move.l	#$5F400003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.w	(v_rings).w,d1	; load number of rings
		bsr.w	Hud_Rings

HudDb_ObjCount:
		locVRAMd0	$DEC0	; move.l	#$5EC00003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.b	(v_spritecount).w,d1 ; load "number of objects" counter
		bsr.w	Hud_Secs
		tst.b	(f_lifecount).w ; does the lives counter need updating?
		beq.s	HudDb_ChkBonus	; if not, branch
		clr.b	(f_lifecount).w
		bsr.w	Hud_Lives

HudDb_ChkBonus:
		tst.b	(f_endactbonus).w ; does the ring/time bonus counter need updating?
		beq.s	HudDb_End	; if not, branch
		clr.b	(f_endactbonus).w
		locVRAM	$AE00		; set VRAM address
		moveq	#0,d1
		move.w	(v_timebonus).w,d1 ; load time bonus
		bsr.w	Hud_TimeRingBonus
		moveq	#0,d1
		move.w	(v_ringbonus).w,d1 ; load ring bonus
		bsr.w	Hud_TimeRingBonus

HudDb_End:
		rts	
; End of function HUD_Update

; ---------------------------------------------------------------------------
; Subroutine to	load "0" on the	HUD
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_LoadZero:				; XREF: HUD_Update
		locVRAM	$DF40
		lea	Hud_TilesZero(pc),a2
		move.w	#2,d2
		bra.s	loc_1C83E
; End of function Hud_LoadZero

	if HUDCentiseconds=1	;Mercury HUD Centiseconds
; ---------------------------------------------------------------------------
; Subroutine to	load " on the	HUD
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_LoadMarks:				; XREF: HUD_Update
		locVRAM	$D740
		lea	Hud_TilesMarks(pc),a2
		move.w	#2,d2
		bra.s	loc_1C83E
; End of function Hud_LoadMarks
	endc	;end HUD Centiseconds

; ---------------------------------------------------------------------------
; Subroutine to	load uncompressed HUD patterns ("E", "0", colon)
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Base:				; XREF: GM_Level; SS_EndLoop; GM_Ending
		lea	($C00000).l,a6
		bsr.w	Hud_Lives
		
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
		bsr.s	Hud_LoadMarks
	endc	;end HUD Centiseconds
		
		locVRAM	$DC40
		lea	Hud_TilesBase(pc),a2
		move.w	#$E,d2

loc_1C83E:				; XREF: Hud_LoadZero
		lea	Art_Hud(pc),a1

loc_1C842:
		move.w	#$F,d1
		move.b	(a2)+,d0
		bmi.s	loc_1C85E
		ext.w	d0
		lsl.w	#5,d0
		lea	(a1,d0.w),a3

loc_1C852:
		move.l	(a3)+,(a6)
		dbf	d1,loc_1C852

loc_1C858:
		dbf	d2,loc_1C842

		rts	
; ===========================================================================

loc_1C85E:
		move.l	#0,(a6)
		dbf	d1,loc_1C85E

		bra.s	loc_1C858
; End of function Hud_Base

; ===========================================================================

	if HUDCentiseconds=1	;Mercury HUD Centiseconds
Hud_TilesMarks:	dc.b $1A, 0, 0, 0
Hud_TilesBase:	dc.b $16, $FF, $FF, $FF, $FF, $FF, $FF,	0, 0, $18, 0, 0
	else
Hud_TilesBase:	dc.b $16, $FF, $FF, $FF, $FF, $FF, $FF,	0, 0, $14, 0, 0
	endc	;end HUD Centiseconds

Hud_TilesZero:	dc.b $FF, $FF, 0, 0
; ---------------------------------------------------------------------------
; Subroutine to	load debug mode	numbers	patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


HudDb_XY:				; XREF: HudDebug
		locVRAM	$DC40		; set VRAM address
		move.w	(v_screenposx).w,d1 ; load camera x-position
		swap	d1
		move.w	(v_player+obX).w,d1 ; load Sonic's x-position
		bsr.s	HudDb_XY2
		move.w	(v_screenposy).w,d1 ; load camera y-position
		swap	d1
		move.w	(v_player+obY).w,d1 ; load Sonic's y-position
; End of function HudDb_XY


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


HudDb_XY2:
		moveq	#7,d6
		lea	(Art_Text).l,a1

HudDb_XYLoop:
		rol.w	#4,d1
		move.w	d1,d2
		andi.w	#$F,d2
		cmpi.w	#$A,d2
		bcs.s	loc_1C8B2
		addq.w	#7,d2

loc_1C8B2:
		lsl.w	#5,d2
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		swap	d1
		dbf	d6,HudDb_XYLoop	; repeat 7 more	times

		rts	
; End of function HudDb_XY2

; ---------------------------------------------------------------------------
; Subroutine to	load rings numbers patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Rings:				; XREF: HUD_Update
		lea	(Hud_100).l,a2
		moveq	#2,d6
		bra.s	Hud_LoadArt
; End of function Hud_Rings

; ---------------------------------------------------------------------------
; Subroutine to	load score numbers patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Score:				; XREF: HUD_Update
		lea	(Hud_100000).l,a2
		moveq	#5,d6

Hud_LoadArt:
		moveq	#0,d4
		lea	Art_Hud(pc),a1

Hud_ScoreLoop:
		moveq	#0,d2
		move.l	(a2)+,d3

loc_1C8EC:
		sub.l	d3,d1
		bcs.s	loc_1C8F4
		addq.w	#1,d2
		bra.s	loc_1C8EC
; ===========================================================================

loc_1C8F4:
		add.l	d3,d1
		tst.w	d2
		beq.s	loc_1C8FE
		move.w	#1,d4

loc_1C8FE:
	
	if HUDHasLeadingZeroes=0	;Mercury HUD Has Leading Zeroes
		tst.w	d4
		beq.s	loc_1C92C
	endc	;end HUD Has Leading Zeroes
	
		lsl.w	#6,d2
		move.l	d0,4(a6)
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)

loc_1C92C:
		addi.l	#$400000,d0
		dbf	d6,Hud_ScoreLoop

		rts	

; End of function Hud_Score


; ---------------------------------------------------------------------------
; Subroutine to	load countdown numbers on the continue screen
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


ContScrCounter:				; XREF: GM_Continue
		locVRAM	$DF80
		lea	($C00000).l,a6
		lea	(Hud_10).l,a2
		moveq	#1,d6
		moveq	#0,d4
		lea	Art_Hud(pc),a1 ; load numbers patterns

ContScr_Loop:
		moveq	#0,d2
		move.l	(a2)+,d3

loc_1C95A:
		sub.l	d3,d1
		bcs.s	loc_1C962
		addq.w	#1,d2
		bra.s	loc_1C95A
; ===========================================================================

loc_1C962:
		add.l	d3,d1
		lsl.w	#6,d2
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		dbf	d6,ContScr_Loop	; repeat 1 more	time

		rts	
; End of function ContScrCounter

; ===========================================================================
; ---------------------------------------------------------------------------
; HUD counter sizes
; ---------------------------------------------------------------------------
Hud_100000:	dc.l 100000		; XREF: Hud_Score
Hud_10000:	dc.l 10000
Hud_1000:	dc.l 1000		; XREF: Hud_TimeRingBonus
Hud_100:	dc.l 100		; XREF: Hud_Rings
Hud_10:		dc.l 10			; XREF: ContScrCounter; Hud_Secs; Hud_Lives
Hud_1:		dc.l 1			; XREF: Hud_Mins

; ---------------------------------------------------------------------------
; Subroutine to	load time numbers patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Mins:				; XREF: Hud_ChkTime
		lea	(Hud_1).l,a2
		moveq	#0,d6
		bra.s	loc_1C9BA
; End of function Hud_Mins

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Secs:				; XREF: Hud_ChkTime
		lea	(Hud_10).l,a2
		moveq	#1,d6

loc_1C9BA:
		moveq	#0,d4
		lea	Art_Hud(pc),a1

Hud_TimeLoop:
		moveq	#0,d2
		move.l	(a2)+,d3

loc_1C9C4:
		sub.l	d3,d1
		bcs.s	loc_1C9CC
		addq.w	#1,d2
		bra.s	loc_1C9C4
; ===========================================================================

loc_1C9CC:
		add.l	d3,d1
		tst.w	d2
		beq.s	loc_1C9D6
		move.w	#1,d4

loc_1C9D6:
		lsl.w	#6,d2
		move.l	d0,4(a6)
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		addi.l	#$400000,d0
		dbf	d6,Hud_TimeLoop

		rts	
; End of function Hud_Secs

; ---------------------------------------------------------------------------
; Subroutine to	load time/ring bonus numbers patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_TimeRingBonus:			; XREF: Hud_ChkBonus
		lea	(Hud_1000).l,a2
		moveq	#3,d6
		moveq	#0,d4
		lea	Art_Hud(pc),a1

Hud_BonusLoop:
		moveq	#0,d2
		move.l	(a2)+,d3

loc_1CA1E:
		sub.l	d3,d1
		bcs.s	loc_1CA26
		addq.w	#1,d2
		bra.s	loc_1CA1E
; ===========================================================================

loc_1CA26:
		add.l	d3,d1
		tst.w	d2
		beq.s	loc_1CA30
		move.w	#1,d4

loc_1CA30:
		tst.w	d4
		beq.s	Hud_ClrBonus
		lsl.w	#6,d2
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)

loc_1CA5A:
		dbf	d6,Hud_BonusLoop ; repeat 3 more times

		rts	
; ===========================================================================

Hud_ClrBonus:
		moveq	#$F,d5

Hud_ClrBonusLoop:
		move.l	#0,(a6)
		dbf	d5,Hud_ClrBonusLoop

		bra.s	loc_1CA5A
; End of function Hud_TimeRingBonus

; ---------------------------------------------------------------------------
; Subroutine to	load uncompressed lives	counter	patterns
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Lives:				; XREF: Hud_ChkLives
		locVRAMd0	$FBA0	; move.l	#$7BA00003,d0	; set VRAM address ;Mercury Macros
		moveq	#0,d1
		move.b	(v_lives).w,d1	; load number of lives
		lea	(Hud_10).l,a2
		moveq	#1,d6
		moveq	#0,d4
		lea	Art_LivesNums(pc),a1

Hud_LivesLoop:
		move.l	d0,4(a6)
		moveq	#0,d2
		move.l	(a2)+,d3

loc_1CA90:
		sub.l	d3,d1
		bcs.s	loc_1CA98
		addq.w	#1,d2
		bra.s	loc_1CA90
; ===========================================================================

loc_1CA98:
		add.l	d3,d1
		tst.w	d2
		beq.s	loc_1CAA2
		move.w	#1,d4

loc_1CAA2:

	if HUDHasLeadingZeroes=0	;Mercury HUD Has Leading Zeroes
		tst.w	d4
		beq.s	Hud_ClrLives
	endc	;end HUD Has Leading Zeroes

loc_1CAA6:
		lsl.w	#5,d2
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)

loc_1CABC:
		addi.l	#$400000,d0
		dbf	d6,Hud_LivesLoop ; repeat 1 more time

		rts	
; ===========================================================================

Hud_ClrLives:
		tst.w	d6
		beq.s	loc_1CAA6
		moveq	#7,d5

Hud_ClrLivesLoop:
		move.l	#0,(a6)
		dbf	d5,Hud_ClrLivesLoop
		bra.s	loc_1CABC
; End of function Hud_Lives