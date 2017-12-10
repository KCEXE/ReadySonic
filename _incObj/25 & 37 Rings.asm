; ---------------------------------------------------------------------------
; Object 25 - rings
; ---------------------------------------------------------------------------

Rings:					; XREF: Obj_Index
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Ring_Index(pc,d0.w),d1
		jmp	Ring_Index(pc,d1.w)
; ===========================================================================
Ring_Index:	dc.w Ring_Main-Ring_Index
		dc.w Ring_Animate-Ring_Index
		dc.w Ring_Collect-Ring_Index
		dc.w Ring_Sparkle-Ring_Index
		dc.w Ring_Delete-Ring_Index
		
	if MagneticRings=1	;Mercury Magnetic Rings
		dc.w Ring_Attract-Ring_Index
		dc.w Ring_Collect-Ring_Index
		dc.w Ring_Sparkle-Ring_Index
		dc.w Ring_Delete-Ring_Index
	endc	;end Magnetic Rings
		
; ---------------------------------------------------------------------------
; Distances between rings (format: horizontal, vertical)
; ---------------------------------------------------------------------------
Ring_PosData:	dc.b $10, 0		; horizontal tight
		dc.b $18, 0		; horizontal normal
		dc.b $20, 0		; horizontal wide
		dc.b 0,	$10		; vertical tight
		dc.b 0,	$18		; vertical normal
		dc.b 0,	$20		; vertical wide
		dc.b $10, $10		; diagonal
		dc.b $18, $18
		dc.b $20, $20
		dc.b $F0, $10
		dc.b $E8, $18
		dc.b $E0, $20
		dc.b $10, 8
		dc.b $18, $10
		dc.b $F0, 8
		dc.b $E8, $10
; ===========================================================================

Ring_Main:	; Routine 0
		lea	(v_objstate).w,a2
		moveq	#0,d0
		move.b	obRespawnNo(a0),d0
		lea	2(a2,d0.w),a2
		move.b	(a2),d4
		move.b	obSubtype(a0),d1
		move.b	d1,d0
		andi.w	#7,d1
		cmpi.w	#7,d1
		bne.s	loc_9B80
		moveq	#6,d1

	loc_9B80:
		swap	d1
		move.w	#0,d1
		lsr.b	#4,d0
		add.w	d0,d0
		move.b	Ring_PosData(pc,d0.w),d5 ; load ring spacing data
		ext.w	d5
		move.b	Ring_PosData+1(pc,d0.w),d6
		ext.w	d6
		movea.l	a0,a1
		move.w	obX(a0),d2
		move.w	obY(a0),d3
		lsr.b	#1,d4
		bcs.s	loc_9C02
		bclr	#7,(a2)
		bra.s	loc_9BBA
; ===========================================================================

Ring_MakeRings:
		swap	d1
		lsr.b	#1,d4
		bcs.s	loc_9C02
		bclr	#7,(a2)
		bsr.w	FindFreeObj
		bne.s	loc_9C0E

loc_9BBA:				; XREF: Ring_Main
		move.b	#id_Rings,0(a1)	; load ring object
		addq.b	#2,obRoutine(a1)
		move.w	d2,obX(a1)	; set x-axis position based on d2
		move.w	obX(a0),$32(a1)
		move.w	d3,obY(a1)	; set y-axis position based on d3
		move.l	#Map_Ring,obMap(a1)
		move.w	#$27B2,obGfx(a1)
		move.b	#4,obRender(a1)
		move.b	#2,obPriority(a1)
		move.b	#$47,obColType(a1)
		move.b	#8,obActWid(a1)
		move.b	obRespawnNo(a0),obRespawnNo(a1)
		move.b	d1,$34(a1)

loc_9C02:
		addq.w	#1,d1
		add.w	d5,d2		; add ring spacing value to d2
		add.w	d6,d3		; add ring spacing value to d3
		swap	d1
		dbf	d1,Ring_MakeRings ; repeat for	number of rings

loc_9C0E:
		btst	#0,(a2)
		bne.w	DeleteObject

Ring_Animate:	; Routine 2

	if MagneticRings=1	;Mercury Magnetic Rings
		tst.b	(v_shield).w
		beq.s	@skip
		tst.b	obRender(a0)
		bpl.s	@skip
		
		lea (v_player).w,a1
		
		move.w	obX(a1),d0	; load Sonic's x-axis position
		sub.w	obX(a0),d0
		bpl.s	@a1
		neg.w	d0
		
	@a1:
		cmpi.w	#$40,d0
		bhi.s	@skip
		
		move.w	obY(a1),d0	; load Sonic's y-axis position
		sub.w	obY(a0),d0
		bpl.s	@a2
		neg.w	d0
		
	@a2:
		cmpi.w	#$40,d0
		bhi.s	@skip
		
		move.b	#$A,obRoutine(a0)
		lea	(v_objstate).w,a2
		moveq	#0,d0
		move.b	obRespawnNo(a0),d0
		move.b	$34(a0),d1
		bset	d1,2(a2,d0.w)
		
	@skip:
	endc	;end  Magnetic Rings

		move.b	(v_ani1_frame).w,obFrame(a0) ; set frame
		bsr.w	DisplaySprite
		obRanges	Ring_Delete,$32(a0)
		rts	
; ===========================================================================

Ring_Collect:	; Routine 4
		addq.b	#2,obRoutine(a0)
		move.b	#0,obColType(a0)
		move.b	#1,obPriority(a0)
		bsr.w	CollectRing
		lea	(v_objstate).w,a2
		moveq	#0,d0
		move.b	obRespawnNo(a0),d0
		move.b	$34(a0),d1
		bset	d1,2(a2,d0.w)

Ring_Sparkle:	; Routine 6
		lea	(Ani_Ring).l,a1
		bsr.w	AnimateSprite
		bra.w	DisplaySprite
; ===========================================================================

Ring_Delete:	; Routine 8
		bra.w	DeleteObject
		
	if MagneticRings=1	;Mercury Magnetic Rings
Ring_Attract:	; Routine $A
		tst.b	(v_shield).w
		bne.s	@skip
		move.b	#id_RingLoss,0(a0)
		move.b	#2,obRoutine(a0)
		move.b	#-1,(v_ani3_time).w
		bra.s	@display
		
	@skip:
		move.w	#$30,d1	; horizontal
		move.w	(v_player+obX).w,d0
		cmp.w	obX(a0),d0
		bcc.s	@a1
		neg.w	d1
		tst.w	obVelX(a0)
		bmi.s	@a2
		add.w	d1,d1
		add.w	d1,d1
		bra.s	@a2

	@a1:
		tst.w	obVelX(a0)
		bpl.s	@a2
		add.w	d1,d1
		add.w	d1,d1

	@a2:
		add.w	d1,obVelX(a0)
		move.w	#$30,d1	; vertical
		move.w	(v_player+obY).w,d0
		cmp.w	obY(a0),d0
		bcc.s	@a3
		neg.w	d1
		tst.w	obVelY(a0)
		bmi.s	@a4
		add.w	d1,d1
		add.w	d1,d1
		bra.s	@a4

	@a3:
		tst.w	obVelY(a0)
		bpl.s	@a4
		add.w	d1,d1
		add.w	d1,d1

	@a4:
		add.w	d1,obVelY(a0)
		bsr.w	SpeedToPos
		
	@display:
		move.b	(v_ani1_frame).w,obFrame(a0) ; set frame
		bra.w	DisplaySprite
	endc	;end  Magnetic Rings

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


CollectRing:				; XREF: Ring_Collect
		addq.w	#1,(v_rings).w	; add 1 to rings
		ori.b	#1,(f_ringcount).w ; update the rings counter
		move.w	#sfx_Ring,d0	; play ring sound
		cmpi.w	#100,(v_rings).w ; do you have < 100 rings?
		bcs.s	@playsnd	; if yes, branch
		bset	#1,(v_lifecount).w ; update lives counter
		beq.s	@got100
		cmpi.w	#200,(v_rings).w ; do you have < 200 rings?
		bcs.s	@playsnd	; if yes, branch
		bset	#2,(v_lifecount).w ; update lives counter
		bne.s	@playsnd

	@got100:
	
	;Mercury Lives Over/Underflow Fix
		cmpi.b	#$63,(v_lives).w	; are lives at max?
		beq.s	@playbgm
		addq.b	#1,(v_lives).w	; add 1 to number of lives
		addq.b	#1,(f_lifecount).w ; update the lives counter
	@playbgm:
	;end Lives Over/Underflow Fix
	
		move.w	#bgm_ExtraLife,d0 ; play extra life music

	@playsnd:
		jmp	(PlaySound_Special).l
; End of function CollectRing

; ===========================================================================
; ---------------------------------------------------------------------------
; Object 37 - rings flying out of Sonic	when he's hit
; ---------------------------------------------------------------------------

RingLoss:				; XREF: Obj_Index
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	RLoss_Index(pc,d0.w),d1
		jmp	RLoss_Index(pc,d1.w)
; ===========================================================================
RLoss_Index:	dc.w RLoss_Count-RLoss_Index
		dc.w RLoss_Bounce-RLoss_Index
		dc.w RLoss_Collect-RLoss_Index
		dc.w RLoss_Sparkle-RLoss_Index
		dc.w RLoss_Delete-RLoss_Index
; ===========================================================================

RLoss_Count:	; Routine 0
		movea.l	a0,a1
		moveq	#0,d5
		move.w	(v_rings).w,d5	; check number of rings you have
		moveq	#32,d0
		cmp.w	d0,d5		; do you have 32 or more?
		bcs.s	@belowmax	; if not, branch
		move.w	d0,d5		; if yes, set d5 to 32

	@belowmax:
		subq.w	#1,d5
		move.w	#$288,d4
		bra.s	@makerings
; ===========================================================================

	@loop:
		bsr.w	FindFreeObj
		bne.w	@resetcounter

@makerings:
		move.b	#id_RingLoss,0(a1) ; load bouncing ring object
		addq.b	#2,obRoutine(a1)
		move.b	#8,obHeight(a1)
		move.b	#8,obWidth(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.l	#Map_Ring,obMap(a1)
		move.w	#$27B2,obGfx(a1)
		move.b	#4,obRender(a1)
		move.b	#3,obPriority(a1)
		move.b	#$47,obColType(a1)
		move.b	#8,obActWid(a1)
		move.b	#-1,(v_ani3_time).w
		tst.w	d4
		bmi.s	@loc_9D62
		move.w	d4,d0
		bsr.w	CalcSine
		move.w	d4,d2
		lsr.w	#8,d2
		asl.w	d2,d0
		asl.w	d2,d1
		move.w	d0,d2
		move.w	d1,d3
		addi.b	#$10,d4
		bcc.s	@loc_9D62
		subi.w	#$80,d4
		bcc.s	@loc_9D62
		move.w	#$288,d4

	@loc_9D62:
		move.w	d2,obVelX(a1)
		move.w	d3,obVelY(a1)
		neg.w	d2
		neg.w	d4
		dbf	d5,@loop	; repeat for number of rings (max 31)

@resetcounter:
		move.w	#0,(v_rings).w	; reset number of rings to zero
		move.b	#$80,(f_ringcount).w ; update ring counter
		move.b	#0,(v_lifecount).w
		sfx	sfx_RingLoss	; play ring loss sound

RLoss_Bounce:	; Routine 2
		move.b	(v_ani3_frame).w,obFrame(a0)
		bsr.w	SpeedToPos
		addi.w	#$18,obVelY(a0)
		bmi.s	@chkdel
		move.b	(v_vbla_byte).w,d0
		add.b	d7,d0
		andi.b	#3,d0
		bne.s	@chkdel
		
	if RingsBounceAtZoneBottom=1 ;Mercury Rings Bounce At Zone Bottom
		move.w	(v_limitbtm2).w,d0
		addi.w	#$E0,d0
		cmp.w	obY(a0),d0	; has object moved below level boundary?
		blt.s	@bounce		; if yes, branch
	endc	;end Rings Bounce At Zone Bottom
		
		jsr	ObjFloorDist
		tst.w	d1
		bpl.s	@chkdel
		add.w	d1,obY(a0)
		
	if RingsBounceAtZoneBottom=1 ;Mercury Rings Bounce At Zone Bottom
	@bounce:
	endc	;end Rings Bounce At Zone Bottom
	
		move.w	obVelY(a0),d0
		asr.w	#2,d0
		sub.w	d0,obVelY(a0)
		neg.w	obVelY(a0)

	@chkdel:
		tst.b	(v_ani3_time).w
		beq.s	RLoss_Delete
		
	if RingsBounceAtZoneBottom=0 ;Mercury Rings Bounce At Zone Bottom
		move.w	(v_limitbtm2).w,d0
		addi.w	#$E0,d0
		cmp.w	obY(a0),d0	; has object moved below level boundary?
		bcs.s	RLoss_Delete	; if yes, branch
	endc	;end Rings Bounce At Zone Bottom
	
	if MagneticRings=1	;Mercury Magnetic Rings
		tst.b	(v_shield).w
		beq.s	@skip
		tst.b	obRender(a0)
		bpl.s	@skip
		
		lea (v_player).w,a1
		
		move.w	obX(a1),d0	; load Sonic's x-axis position
		sub.w	obX(a0),d0
		bpl.s	@a1
		neg.w	d0
		
	@a1:
		cmpi.w	#$A0,d0
		bhi.s	@skip
		
		move.w	obY(a1),d0	; load Sonic's y-axis position
		sub.w	obY(a0),d0
		bpl.s	@a2
		neg.w	d0
		
	@a2:
		cmpi.w	#$A0,d0
		bhi.s	@skip
		
		move.b	#$A,obRoutine(a0)
		move.b	#id_Rings,0(a0)
		
	@skip:
	endc	;end  Magnetic Rings

	if LostRingsFlash=1	;Mercury Lost Rings Flash
		move.b	(v_ani3_time).w,d0
		btst	#0,d0
		beq.w	DisplaySprite
		cmpi.b	#LostRingsFlashTime,d0
		bhi.w	DisplaySprite
		rts
	else
		bra.w	DisplaySprite
	endc	;end Lost Rings Flash
	
; ===========================================================================

RLoss_Collect:	; Routine 4
		addq.b	#2,obRoutine(a0)
		move.b	#0,obColType(a0)
		move.b	#1,obPriority(a0)
		bsr.w	CollectRing

RLoss_Sparkle:	; Routine 6
		lea	(Ani_Ring).l,a1
		bsr.w	AnimateSprite
		bra.w	DisplaySprite
; ===========================================================================

RLoss_Delete:	; Routine 8
		bra.w	DeleteObject
