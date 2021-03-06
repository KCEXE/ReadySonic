; ---------------------------------------------------------------------------
; Subroutine to	reset Sonic's mode when he lands on the floor
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_ResetOnFloor:			; XREF: PlatformObject; et al

	if SonicCDRollJump=0	;Mercury Sonic CD Roll Jump
		btst	#4,obStatus(a0)
		beq.s	loc_137AE
		nop	
		nop	
		nop	

loc_137AE:
	endc	;end Sonic CD Roll Jump
	
		bclr	#staPush,obStatus(a0)	;Mercury Constants
		bclr	#1,obStatus(a0)
		
	if SonicCDRollJump=0	;Mercury Sonic CD Roll Jump
		bclr	#4,obStatus(a0)
	endc	;end Sonic CD Roll Jump
		
		btst	#2,obStatus(a0)
		beq.s	loc_137E4
		bclr	#2,obStatus(a0)
		move.b	#$13,obHeight(a0)
		move.b	#9,obWidth(a0)
		move.b	#id_Walk,obAnim(a0) ; use running/walking animation
		subq.w	#5,obY(a0)

loc_137E4:
		move.b	#0,obJumping(a0)	;Mercury Constants

	if WallJumpActive=1	;Mercury Wall Jump
		move.b	#0,obWallJump(a0)
	endc	;end Wall Jump

		move.w	#0,(v_itembonus).w
		rts	
; End of function Sonic_ResetOnFloor