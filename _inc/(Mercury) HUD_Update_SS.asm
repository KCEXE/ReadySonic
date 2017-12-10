; ---------------------------------------------------------------------------
; Subroutine to	update the HUD in the Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


HUD_Update_SS:
		lea	($C00000).l,a6
		tst.w	(f_debugmode).w	; is debug mode	on?
		bne.w	HudDebug_SS	; if yes, branch
		tst.b	(f_scorecount).w ; does the score need updating?
		beq.s	@chkrings	; if not, branch
		clr.b	(f_scorecount).w
		locVRAMd0	$4260	;Mercury Macros		
		move.l	(v_score).w,d1	; load score
		bsr.w	Hud_Score

	@chkrings:
		tst.b	(f_ringcount).w	; does the ring	counter	need updating?
		beq.s	Hud_ChkTime_SS	; if not, branch
		bpl.s	@dorings
		bsr.w	Hud_LoadZero_SS

	@dorings:
		clr.b	(f_ringcount).w
		locVRAMd0	$4520	;Mercury Macros
		moveq	#0,d1
		move.w	(v_rings).w,d1	; load number of rings
		bsr.w	Hud_Rings

Hud_ChkTime_SS:
		tst.b	(f_timecount).w	; does the time	need updating?
		beq.w	Hud_ChkLives_SS	; if not, branch	;Mercury HUD Centiseconds (bsr.s => bsr.w)
		tst.w	(f_pause).w	; is the game paused?
		bne.w	Hud_ChkLives_SS	; if yes, branch	;Mercury HUD Centiseconds (bsr.s => bsr.w)
		lea	(v_time).w,a1
		
	if TimeLimitInSpecialStage=1	;Mercury Time Limit In Special Stage
	
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
		cmpi.l	#0,(a1)+	; has the time run out?
		beq.w	TimeOver_SS	; if yes, branch	;Mercury HUD In Special Stage (bsr.s => bsr.w)
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
		sub.b	d1,-(a1)
		cmpi.b	#-1,(a1)
		bgt.s	Hud_DoCent_SS
		move.b	#99,(a1)	; set cent to 59
	else
		cmpi.l	#0,(a1)+	; has the time run out?
		beq.w	TimeOver_SS	; if yes, branch
		subq.b	#1,-(a1)	; dec jiffy
		cmpi.b	#-1,(a1)	; if -1
		bgt.s	Hud_ChkLives_SS
		move.b	#59,(a1)	; set jiffy to 59
	endc	;end HUD Centiseconds

		subq.b	#1,-(a1)	; dec sec
		cmpi.b	#-1,(a1)	; if -1
		bgt.s	@dotime
		move.b	#59,(a1)	; set sec to 59
		subq.b	#1,-(a1)	; dec min
		cmpi.b	#-1,(a1)	; if -1
		bgt.s	@dotime
		move.l	#0,(v_time).w	; set time to 0
	else
	
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
		cmpi.l	#$93B63,(a1)+	; is the time 9'59"99?
		beq.w	TimeOver_SS	; if yes, branch	;Mercury HUD In Special Stage (bsr.s => bsr.w)
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
		bcs.s	Hud_DoCent_SS
	else
		cmpi.l	#$93B3B,(a1)+	; is the time 9.59?
		beq.s	TimeOver_SS	; if yes, branch
		addq.b	#1,-(a1)	; inc jiffy
		cmpi.b	#60,(a1)	; if 60
		bcs.s	Hud_ChkLives_SS
	endc	;end HUD Centiseconds
	
		move.b	#0,(a1)		; clear jiffy
		addq.b	#1,-(a1)	; inc sec
		cmpi.b	#60,(a1)	; if 60
		bcs.s	@dotime
		move.b	#0,(a1)		; clear sec
		addq.b	#1,-(a1)	; inc min
		cmpi.b	#9,(a1)		; if 9
		bcs.s	@dotime
		move.b	#9,(a1)		; set min to 9
	endc	;end Time Limit In Special Stage

	@dotime:
		locVRAMd0	$4420	;Mercury Macros
		moveq	#0,d1
		move.b	(v_timemin).w,d1 ; load	minutes
		bsr.w	Hud_Mins
		locVRAMd0	$44A0	;Mercury Macros
		moveq	#0,d1
		move.b	(v_timesec).w,d1 ; load	seconds
		bsr.w	Hud_Secs
		
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
	Hud_DoCent_SS:
		locVRAMd0	$3D60	;Mercury Macros
		moveq	#0,d1
		move.b	(v_timecent).w,d1 ; load	seconds
		bsr.w	Hud_Secs
	endc	;end HUD Centiseconds
		

Hud_ChkLives_SS:
		tst.b	(f_lifecount).w ; does the lives counter need updating?
		beq.s	@return		; if not, branch
		clr.b	(f_lifecount).w
		bsr.w	Hud_Lives_SS
		
	@return:
		rts	
; ===========================================================================

TimeOver_SS:				; XREF: Hud_ChkTime_SS
		clr.b	(f_timecount).w	; stop the time counter
		
	if TimeLimitInSpecialStage=1	;Mercury Time Limit In Special Stage
		lea	(v_objspace).w,a0
		movea.l	a0,a2
		bsr.w	KillSonic
		move.b	#1,(f_timeover).w
	endc	;end Time Limit In Special Stage
		
		rts	
; ===========================================================================

HudDebug_SS:				; XREF: HUD_Update
		bsr.w	HudDb_XY_SS
		tst.b	(f_ringcount).w	; does the ring	counter	need updating?
		beq.s	HudDb_ObjCount_SS	; if not, branch
		bpl.s	HudDb_Rings_SS
		bsr.w	Hud_LoadZero_SS

HudDb_Rings_SS:
		clr.b	(f_ringcount).w
		locVRAMd0	$4520	;Mercury Macros		
		moveq	#0,d1
		move.w	(v_rings).w,d1	; load number of rings
		bsr.w	Hud_Rings

HudDb_ObjCount_SS:
		locVRAMd0	$44A0	;Mercury Macros
		moveq	#0,d1
		move.b	(v_spritecount).w,d1 ; load "number of objects" counter
		bsr.w	Hud_Secs
		tst.b	(f_lifecount).w ; does the lives counter need updating?
		beq.s	@return		; if not, branch
		clr.b	(f_lifecount).w
		bsr.w	Hud_Lives_SS

	@return:
		rts	
; End of function HUD_Update_SS

; ---------------------------------------------------------------------------
; Subroutine to	load "0" on the	HUD in the Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_LoadZero_SS:				; XREF: HUD_Update_SS
		locVRAM	$4520	;Mercury Macros		
		lea	Hud_TilesZero(pc),a2
		move.w	#2,d2
		bra.w	loc_1C83E
; End of function Hud_LoadZero_SS

	if HUDCentiseconds=1	;Mercury HUD Centiseconds
; ---------------------------------------------------------------------------
; Subroutine to	load " on the	HUD in the Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_LoadMarks_SS:				; XREF: HUD_Update_SS
		locVRAM	$3D20
		lea	Hud_TilesMarks(pc),a2
		move.w	#2,d2
		bra.w	loc_1C83E
; End of function Hud_LoadMarks_SS
	endc	;end HUD Centiseconds

; ---------------------------------------------------------------------------
; Subroutine to	load uncompressed HUD patterns ("E", "0", colon) in Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Base_SS:				; XREF: GM_Special
		lea	($C00000).l,a6
		bsr.w	Hud_Lives_SS
		
	if HUDCentiseconds=1	;Mercury HUD Centiseconds
		bsr.s	Hud_LoadMarks_SS
	endc	;end HUD Centiseconds
		
		locVRAM	$4220	;Mercury Macros
		lea	Hud_TilesBase(pc),a2
		move.w	#$E,d2
		bra.w	loc_1C83E
; End of function Hud_Base_SS

; ---------------------------------------------------------------------------
; Subroutine to	load debug mode	numbers	patterns in Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


HudDb_XY_SS:				; XREF: HudDebug_SS
		locVRAM	$4220	;Mercury Macros
		move.w	(v_screenposx).w,d1 ; load camera x-position
		swap	d1
		move.w	(v_player+obX).w,d1 ; load Sonic's x-position
		bsr.w	HudDb_XY2
		move.w	(v_screenposy).w,d1 ; load camera y-position
		swap	d1
		move.w	(v_player+obY).w,d1 ; load Sonic's y-position
		bra.w	HudDb_XY2
		;rts
; End of function HudDb_XY_SS

; ---------------------------------------------------------------------------
; Subroutine to	load uncompressed lives	counter	patterns in Special Stage
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Hud_Lives_SS:				; XREF: Hud_ChkLives_SS
		locVRAMd0	$4700	;Mercury Macros
		moveq	#0,d1
		move.b	(v_lives).w,d1	; load number of lives
		lea	(Hud_10).l,a2
		moveq	#1,d6
		moveq	#0,d4
		lea	Art_LivesNums(pc),a1
		bra.w	Hud_LivesLoop
		;rts
; End of function Hud_Lives_SS