; ---------------------------------------------------------------------------
; Subroutine controlling Sonic's jump height/duration
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_JumpHeight:			; XREF: Obj01_MdJump; Obj01_MdJump2

	if WallJumpActive=1	;Mercury Wall Jump
		tst.b	obWallJump(a0)	; on wall?
		beq.s	@skip
		move.b	(v_jpadpress2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		beq.s	@skip	; if yes, branch
		move.w	#0,obWallJump(a0)	; clear Wall Jump data
		move.b	#1,obJumping(a0)	;Mercury Constants
		move.b	#id_Roll,obAnim(a0) ; use "jumping" animation
		move.w	#-$600,d0
		btst	#bitUp,(v_jpadhold2).w
		bne.s	@uponly
		move.w	#-$580,d0
		move.w	#-$400,obVelX(a0)
		btst	#staFacing,obStatus(a0)	;Mercury Constants
		beq.s	@uponly
		neg.w	obVelX(a0)
		
	@uponly:
		btst	#staWater,obStatus(a0)	;Mercury Constants
		beq.s	@nowtr
		addi.w	#$280,d0
		
	@nowtr:
		move.w	d0,obVelY(a0)
		sfx	sfx_Jump	; play jumping sound
		
	@skip:
	endc	;end Wall Jump

		tst.b	obJumping(a0)	;Mercury Constants
		beq.s	loc_134C4
		move.w	#-$400,d1
		btst	#staWater,obStatus(a0)	;Mercury Constants
		beq.s	loc_134AE
		move.w	#-$200,d1

loc_134AE:
		cmp.w	obVelY(a0),d1
		ble.s	locret_134C2
		move.b	(v_jpadhold2).w,d0
		andi.b	#btnABC,d0	; is A, B or C pressed?
		bne.s	locret_134C2	; if yes, branch
		move.w	d1,obVelY(a0)

locret_134C2:
		rts	
; ===========================================================================

loc_134C4:
		cmpi.w	#-$FC0,obVelY(a0)
		bge.s	locret_134D2
		move.w	#-$FC0,obVelY(a0)

locret_134D2:
		rts	
; End of function Sonic_JumpHeight