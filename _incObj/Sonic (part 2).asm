; ---------------------------------------------------------------------------
; Sonic	when he	gets hurt
; ---------------------------------------------------------------------------

Sonic_Hurt:	; Routine 4

	if SpinDashCameraLag=1 ;Mercury Spin Dash Camera Lag
		clr.b	(v_cameralag).w
	endc	;end Spin Dash Camera Lag

	if WallJumpActive=1	;Mercury Wall Jump
		clr.b	obWallJump(a0)
	endc	;end Wall Jump

		jsr	SpeedToPos
		addi.w	#$30,obVelY(a0)
		btst	#staWater,obStatus(a0)	;Mercury Constants
		beq.s	loc_1380C
		subi.w	#$20,obVelY(a0)

loc_1380C:
		bsr.w	Sonic_HurtStop
		bsr.w	Sonic_LevelBound
		bsr.w	Sonic_RecordPosition
		bsr.w	Sonic_Water	;Mercury Hurt Splash Fix
		bsr.w	Sonic_Animate
		bsr.w	Sonic_LoadGfx
		jmp	DisplaySprite

; ---------------------------------------------------------------------------
; Subroutine to	stop Sonic falling after he's been hurt
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sonic_HurtStop:				; XREF: Sonic_Hurt

	;Mercury Top Boundary Fix
		;move.w	(v_limitbtm2).w,d0
		;addi.w	#$E0,d0
		;cmp.w	obY(a0),d0
		;bcs.w	KillSonic
	;end Top Boundary Fix
	
		bsr.w	Sonic_Floor
		btst	#staAir,obStatus(a0)	;Mercury Constants
		bne.s	locret_13860
		moveq	#0,d0
		move.w	d0,obVelY(a0)
		move.w	d0,obVelX(a0)
		move.w	d0,obInertia(a0)
		move.b	#id_Walk,obAnim(a0)
		subq.b	#2,obRoutine(a0)
		move.w	#$78,obInvuln(a0)	;Mercury Constants

locret_13860:
		rts	
; End of function Sonic_HurtStop

; ---------------------------------------------------------------------------
; Sonic	when he	dies
; ---------------------------------------------------------------------------

Sonic_Death:	; Routine 6

	if SpinDashCameraLag=1 ;Mercury Spin Dash Camera Lag
		clr.b	(v_cameralag).w
	endc	;end Spin Dash Camera Lag
	
		bsr.w	GameOver
		jsr	ObjectFall
		bsr.w	Sonic_RecordPosition
		bsr.w	Sonic_Animate
		bsr.w	Sonic_LoadGfx
		jmp	DisplaySprite

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


GameOver:				; XREF: Sonic_Death
		
	;Mercury Game/Time Over Timing Fix
		move.w	(v_screenposy).w,d0	;move.w	(v_limitbtm2).w,d0
		addi.w	#$100,d0
		cmp.w	obY(a0),d0
		bge.w	locret_13900	;bcc.w	locret_13900
	;end Game/Time Over Timing Fix
		
		move.w	#-$38,obVelY(a0)
		addq.b	#2,obRoutine(a0)
		clr.b	(f_timecount).w	; stop time counter
		
	;Mercury Lives Over/Underflow Fix
		cmpi.b	#0,(v_lives).w	; are lives at min?
		beq.s	@skip
		addq.b	#1,(f_lifecount).w ; update lives counter
		subq.b	#1,(v_lives).w	; subtract 1 from number of lives
		bne.s	loc_138D4
	@skip:
	;end Lives Over/Underflow Fix
		
		move.w	#0,obRestartTimer(a0)	;Mercury Constants
		move.b	#id_GameOverCard,(v_objspace+$80).w ; load GAME object
		move.b	#id_GameOverCard,(v_objspace+$C0).w ; load OVER object
		move.b	#1,(v_objspace+$C0+obFrame).w ; set OVER object to correct frame
		clr.b	(f_timeover).w

loc_138C2:
		music	bgm_GameOver	; play game over music
		moveq	#3,d0
		jmp	(AddPLC).l	; load game over patterns
; ===========================================================================

loc_138D4:
		move.w	#60,obRestartTimer(a0)	; set time delay to 1 second	;Mercury Constants
		tst.b	(f_timeover).w	; is TIME OVER tag set?
		beq.s	locret_13900	; if not, branch
		move.w	#0,obRestartTimer(a0)	;Mercury Constants
		move.b	#id_GameOverCard,(v_objspace+$80).w ; load TIME object
		move.b	#id_GameOverCard,(v_objspace+$C0).w ; load OVER object
		move.b	#2,(v_objspace+$80+obFrame).w
		move.b	#3,(v_objspace+$C0+obFrame).w
		bra.s	loc_138C2
; ===========================================================================

locret_13900:
		rts	
; End of function GameOver

; ---------------------------------------------------------------------------
; Sonic	when the level is restarted
; ---------------------------------------------------------------------------

Sonic_ResetLevel:; Routine 8
		tst.w	obRestartTimer(a0)	;Mercury Constants
		beq.s	locret_13914
		subq.w	#1,obRestartTimer(a0)	; subtract 1 from time delay	;Mercury Constants
		bne.s	locret_13914
		move.w	#1,(f_restart).w ; restart the level

	locret_13914:
		rts	