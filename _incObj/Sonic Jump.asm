; ---------------------------------------------------------------------------
; Subroutine allowing Sonic to jump
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_Jump:				; XREF: Obj01_MdNormal; Obj01_MdRoll
		move.b	(v_jpadpress2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		beq.w	locret_1348E	; if not, branch
		moveq	#0,d0
		move.b	obAngle(a0),d0
		addi.b	#$80,d0
		bsr.w	sub_14D48
		cmpi.w	#6,d1
		blt.w	locret_1348E
		move.w	#$680,d2
		btst	#staWater,obStatus(a0)	;Mercury Constants
		beq.s	loc_1341C
		move.w	#$380,d2

loc_1341C:
		moveq	#0,d0
		move.b	obAngle(a0),d0
		subi.b	#$40,d0
		jsr	(CalcSine).l
		muls.w	d2,d1
		asr.l	#8,d1
		add.w	d1,obVelX(a0)	; make Sonic jump
		muls.w	d2,d0
		asr.l	#8,d0
		add.w	d0,obVelY(a0)	; make Sonic jump
		bset	#staAir,obStatus(a0)	;Mercury Constants
		bclr	#staPush,obStatus(a0)	;Mercury Constants
		addq.l	#4,sp
		move.b	#1,obJumping(a0)	;Mercury Constants
		clr.b	obOnWheel(a0)	;Mercury Constants
		
	;Mercury Clear Control Lock When Jump
		clr.w	obLRLock(a0)	;clear horiz control lock	;Mercury Constants
	;end Clear Control Lock When Jump

		sfx	sfx_Jump	; play jumping sound
		move.b	#$13,obHeight(a0)
		move.b	#9,obWidth(a0)
		btst	#2,obStatus(a0)
		bne.s	loc_13490
		move.b	#$E,obHeight(a0)
		move.b	#7,obWidth(a0)
		move.b	#id_Roll,obAnim(a0) ; use "jumping" animation
		bset	#staSpin,obStatus(a0)	;Mercury Constants
		addq.w	#5,obY(a0)

locret_1348E:
		rts	
; ===========================================================================

loc_13490:
	
	if SonicCDRollJump=0	;Mercury Sonic CD Roll Jump
		bset	#staRollJump,obStatus(a0)	;Mercury Constants
	endc	;end Sonic CD Roll Jump
		
		rts	
; End of function Sonic_Jump