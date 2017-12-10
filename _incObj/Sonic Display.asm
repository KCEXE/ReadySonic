; ---------------------------------------------------------------------------
; Subroutine to display Sonic and set music
; ---------------------------------------------------------------------------

Sonic_Display:
		move.w	obInvuln(a0),d0	;Mercury Constants
		beq.s	@display
		subq.w	#1,obInvuln(a0)	;Mercury Constants
		lsr.w	#3,d0
		bcc.s	@chkinvincible

	@display:
		jsr	DisplaySprite

	@chkinvincible:
		tst.b	(v_invinc).w	; does Sonic have invincibility?
		beq.s	@chkshoes	; if not, branch
		tst.w	obInvinc(a0)	; check	time remaining for invinciblity	;Mercury Constants
		beq.s	@chkshoes	; if no	time remains, branch
		subq.w	#1,obInvinc(a0)	; subtract 1 from time	;Mercury Constants
		bne.s	@chkshoes
		tst.b	(f_lockscreen).w
		bne.s	@removeinvincible
		cmpi.w	#$C,(v_air).w
		bcs.s	@removeinvincible
		moveq	#0,d0
		move.b	(v_zone).w,d0
		cmpi.w	#(id_LZ<<8)+3,(v_zone).w ; check if level is SBZ3
		bne.s	@music
		moveq	#5,d0		; play SBZ music

	@music:
		lea	(MusicList2).l,a1
		move.b	(a1,d0.w),d0
		jsr	(PlaySound).l	; play normal music

	@removeinvincible:
		move.b	#0,(v_invinc).w ; cancel invincibility

	@chkshoes:
		tst.b	(v_shoes).w	; does Sonic have speed	shoes?
		beq.s	@exit		; if not, branch
		tst.w	obShoes(a0)	; check	time remaining	;Mercury Constants
		beq.s	@exit
		subq.w	#1,obShoes(a0)	; subtract 1 from time	;Mercury Constants
		bne.s	@exit
		move.w	#$600,(v_sonspeedmax).w ; restore Sonic's speed
		move.w	#$C,(v_sonspeedacc).w ; restore Sonic's acceleration
		move.w	#$80,(v_sonspeeddec).w ; restore Sonic's deceleration
		
	;Mercury Speed Shoes Work Underwater
		btst	#staWater,obStatus(a0)	; is Sonic underwater?	;Mercury Constants
		beq.s	@isdry		; if not, branch
		move.w	#$300,(v_sonspeedmax).w ; change Sonic's top speed
		move.w	#$6,(v_sonspeedacc).w	; change Sonic's acceleration
		move.w	#$40,(v_sonspeeddec).w	; change Sonic's deceleration
	@isdry:
	;end Speed Shoes Work Underwater
		
		move.b	#0,(v_shoes).w	; cancel speed shoes
		move.w	#$E3,d0
		jmp	(PlaySound).l	; run music at normal speed

	@exit:
		rts	