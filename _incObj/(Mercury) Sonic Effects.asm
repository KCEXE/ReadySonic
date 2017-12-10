; ----------------------------------------------------------------------------
; Object 05 - Sonic Effects (Spin Dash Dust, Insta-Shield, etc.)
; ----------------------------------------------------------------------------
SonicEffects:
		moveq	#0,d0
		move.b	obRoutine(a0),d0 
		move.w	Dust_Index(pc,d0.w),d1
		jmp	Dust_Index(pc,d1.w)
; ===========================================================================
Dust_Index:
		dc.w Dust_Init-Dust_Index
		dc.w Dust_Main-Dust_Index
; ===========================================================================
Dust_Init:
		addq.b	#2,obRoutine(a0)
		move.l	#Map_Dust,obMap(a0)
		ori.b	#4,obRender(a0)
		move.b	#1,obPriority(a0)
		move.b	#$10,obActWid(a0)
		move.b	#0,obAnim(a0)
		move.w	#$7A0,obGfx(a0)
		move.w	#$F400,$3C(a0)
; ===========================================================================
Dust_Main:
		btst	#staSpinDash,(v_player+obStatus2).w		; is Player Spin Dashing?	;Mercury Constants

	if InstaShieldActive=1	;Mercury Insta-Shield
		bne.s	@active
		tst.b	(v_player+obInstaShield).w	; is Player doing the InstaShield?	;Mercury Constants
	endc	;end Insta-Shield
	
		beq.s	@return
	
	@active:
		lea	(v_player).l,a2
		move.w	obX(a2),obX(a0)		; match Player's position
		move.w	obY(a2),obY(a0)
		move.b	obStatus(a2),obStatus(a0)	; match Player's x orientation
		bclr	#staFacing,obRender(a0)	;Mercury Constants
		andi.b	#1,obStatus(a0)
		beq.s	@display
		bset	#staFacing,obRender(a0)	;Mercury Constants

	@display:
		lea	(Ani_Dust).l,a1
		jsr	AnimateSprite
		bsr.s	Dust_LoadArt
		jmp	DisplaySprite

	@return:
		rts
; ===========================================================================
Dust_LoadArt:
		moveq	#0,d0
		move.b	obFrame(a0),d0
		cmp.b	$30(a0),d0
		beq.s	return_1DF36
		move.b	d0,$30(a0)
		lea	(DynPLC_Dust).l,a2
		add.w	d0,d0
		adda.w	(a2,d0.w),a2
		move.w	(a2)+,d5
		subq.w	#1,d5
		bmi.s	return_1DF36
		move.w	$3C(a0),d4

	@loop:
		moveq	#0,d1
		move.w	(a2)+,d1
		move.w	d1,d3
		lsr.w	#8,d3
		andi.w	#$F0,d3
		addi.w	#$10,d3
		andi.w	#$FFF,d1
		lsl.l	#5,d1
		addi.l	#Art_Dust,d1
		move.w	d4,d2
		add.w	d3,d4
		add.w	d3,d4
		jsr	(QueueDMATransfer).l
		dbf	d5,@loop

	return_1DF36:
		rts
; ===========================================================================
Ani_Dust:
		dc.w Ani_DustNull-Ani_Dust
		dc.w Ani_Dust1-Ani_Dust
		
	if InstaShieldActive=1	;Mercury Insta-Shield
		dc.w Ani_InstaShield-Ani_Dust
	endc	;end Insta-Shield
		
Ani_DustNull:	dc.b	$1F, 0, afEnd
Ani_Dust1:	dc.b	1, 1, 2, 3, 4, 5, 6, 7, afEnd

	if InstaShieldActive=1	;Mercury Insta-Shield
Ani_InstaShield:dc.b	0, 8, 9, 10, 11, 12, 13, afEnd
	endc	;end Insta-Shield

		even
; ===========================================================================
Map_Dust:
		dc.w Map_DustNull-Map_Dust
		dc.w Map_Dust1-Map_Dust
		dc.w Map_Dust1-Map_Dust
		dc.w Map_Dust1-Map_Dust
		dc.w Map_Dust2-Map_Dust
		dc.w Map_Dust3-Map_Dust
		dc.w Map_Dust4-Map_Dust
		dc.w Map_Dust4-Map_Dust
	
	if InstaShieldActive=1	;Mercury Insta-Shield
		dc.w Map_InstaShield1-Map_Dust
		dc.w Map_InstaShield2-Map_Dust
		dc.w Map_InstaShield3-Map_Dust
		dc.w Map_InstaShield4-Map_Dust
		dc.w Map_InstaShield5-Map_Dust
		dc.w Map_InstaShield6-Map_Dust
	endc	;end Insta-Shield
	
Map_DustNull:	dc.b 0
Map_Dust1:	dc.b 1
		dc.b $4, $0D, $0, 0,$E0
Map_Dust2:	dc.b 2
		dc.b $F4, $01, $0, 0,$E8
		dc.b $4, $0D, $0, 2,$E0
Map_Dust3:	dc.b 2
		dc.b $F4, $05, $0, 0,$E8
		dc.b $4, $0D, $0, 4,$E0
Map_Dust4:	dc.b 2
		dc.b $F4, $09, $0, 0,$E0
		dc.b $4, $0D, $0, 6,$E0
; ===========================================================================

	if InstaShieldActive=1	;Mercury Insta-Shield
Map_InstaShield1:	dc.b 1
		SpriteMap	-16, -24, 3, 3, 0, 0, 0, 0, 0
Map_InstaShield2:	dc.b 1
		SpriteMap	0, -16, 3, 3, 0, 0, 0, 0, 0
Map_InstaShield3:	dc.b 1
		SpriteMap	-8, 0, 4, 3, 0, 0, 0, 0, 0
Map_InstaShield4:	dc.b 2
		SpriteMap	-24, -16, 4, 2, 0, 0, 0, 0, 0
		SpriteMap	-24, 0, 2, 3, 0, 0, 0, 0, 8
Map_InstaShield5:	dc.b 3
		SpriteMap	-16, -24, 2, 1, 0, 0, 0, 0, 0
		SpriteMap	0, -24, 3, 4, 0, 0, 0, 0, 2
		SpriteMap	8, 8, 2, 1, 0, 0, 0, 0, 14
Map_InstaShield6:	dc.b 3
		SpriteMap	0, 16, 2, 1, 1, 1, 0, 0, 0
		SpriteMap	-24, -8, 3, 4, 1, 1, 0, 0, 2
		SpriteMap	-24, -16, 2, 1, 1, 1, 0, 0, 14
	endc	;end Insta-Shield

		even
; ===========================================================================
DynPLC_Dust:	
		dc.w DynPLC_DustNull-DynPLC_Dust
		dc.w DynPLC_Dust1-DynPLC_Dust
		dc.w DynPLC_Dust2-DynPLC_Dust
		dc.w DynPLC_Dust3-DynPLC_Dust
		dc.w DynPLC_Dust4-DynPLC_Dust
		dc.w DynPLC_Dust5-DynPLC_Dust
		dc.w DynPLC_Dust6-DynPLC_Dust
		dc.w DynPLC_Dust7-DynPLC_Dust
		
	if InstaShieldActive=1	;Mercury Insta-Shield
		dc.w DynPLC_InstaShield1-DynPLC_Dust
		dc.w DynPLC_InstaShield2-DynPLC_Dust
		dc.w DynPLC_InstaShield3-DynPLC_Dust
		dc.w DynPLC_InstaShield4-DynPLC_Dust
		dc.w DynPLC_InstaShield5-DynPLC_Dust
		dc.w DynPLC_InstaShield5-DynPLC_Dust
	endc	;end Insta-Shield
		
DynPLC_DustNull:	dc 0
DynPLC_Dust1:	dc 1
		dc.w $7000
DynPLC_Dust2:	dc 1
		dc.w $7008
DynPLC_Dust3:	dc 1
		dc.w $7010
DynPLC_Dust4:	dc 2
		dc.w $1018
		dc.w $701A
DynPLC_Dust5:	dc 2
		dc.w $3022
		dc.w $7026
DynPLC_Dust6:	dc 2
		dc.w $502E
		dc.w $7034
DynPLC_Dust7:	dc 2
		dc.w $503C
		dc.w $7042
; ===========================================================================

	if InstaShieldActive=1	;Mercury Insta-Shield
DynPLC_InstaShield1:	dc 1
		DynPLC	9, 0, Art_InstaShield-Art_Dust
DynPLC_InstaShield2:	dc 1
		DynPLC	9, 9, Art_InstaShield-Art_Dust
DynPLC_InstaShield3:	dc 1
		DynPLC	12, 18, Art_InstaShield-Art_Dust
DynPLC_InstaShield4:	dc 1
		DynPLC	14, 30, Art_InstaShield-Art_Dust
DynPLC_InstaShield5:	dc 1
		DynPLC	16, 44, Art_InstaShield-Art_Dust
	endc	;end Insta-Shield

		even
