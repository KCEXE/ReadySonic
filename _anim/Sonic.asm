; ---------------------------------------------------------------------------
; Animation script - Sonic
; ---------------------------------------------------------------------------
Ani_Sonic:

ptr_Walk:	dc.w SonAni_Walk-Ani_Sonic
ptr_Run:	dc.w SonAni_Run-Ani_Sonic
ptr_Roll:	dc.w SonAni_Roll-Ani_Sonic
ptr_Roll2:	dc.w SonAni_Roll2-Ani_Sonic
ptr_Push:	dc.w SonAni_Push-Ani_Sonic
ptr_Wait:	dc.w SonAni_Wait-Ani_Sonic
ptr_Balance:	dc.w SonAni_Balance-Ani_Sonic
ptr_LookUp:	dc.w SonAni_LookUp-Ani_Sonic
ptr_Duck:	dc.w SonAni_Duck-Ani_Sonic
ptr_Warp1:	dc.w SonAni_Warp1-Ani_Sonic
ptr_Warp2:	dc.w SonAni_Warp2-Ani_Sonic
ptr_Warp3:	dc.w SonAni_Warp3-Ani_Sonic
ptr_Warp4:	dc.w SonAni_Warp4-Ani_Sonic
ptr_Stop:	dc.w SonAni_Stop-Ani_Sonic
ptr_Float1:	dc.w SonAni_Float1-Ani_Sonic
ptr_Float2:	dc.w SonAni_Float2-Ani_Sonic
ptr_Spring:	dc.w SonAni_Spring-Ani_Sonic
ptr_Hang:	dc.w SonAni_Hang-Ani_Sonic
ptr_Leap1:	dc.w SonAni_Leap1-Ani_Sonic
ptr_Leap2:	dc.w SonAni_Leap2-Ani_Sonic
ptr_Surf:	dc.w SonAni_Surf-Ani_Sonic
ptr_GetAir:	dc.w SonAni_GetAir-Ani_Sonic
ptr_Burnt:	dc.w SonAni_Burnt-Ani_Sonic
ptr_Drown:	dc.w SonAni_Drown-Ani_Sonic
ptr_Death:	dc.w SonAni_Death-Ani_Sonic
ptr_Shrink:	dc.w SonAni_Shrink-Ani_Sonic
ptr_Hurt:	dc.w SonAni_Hurt-Ani_Sonic
ptr_WaterSlide:	dc.w SonAni_WaterSlide-Ani_Sonic
ptr_Null:	dc.w SonAni_Null-Ani_Sonic
ptr_Float3:	dc.w SonAni_Float3-Ani_Sonic
ptr_Float4:	dc.w SonAni_Float4-Ani_Sonic

	if WallJumpActive=1	;Mercury Wall Jump
ptr_WallJump:	dc.w SonAni_WallJump-Ani_Sonic
	id_WallJump:	equ (ptr_WallJump-Ani_Sonic)/2
	endc	;end Wall Jump
	
	if SpinDashActive=1	;Mercury Spin Dash
ptr_SpinDash: dc.w SonAni_SpinDash-Ani_Sonic
	id_SpinDash:	equ (ptr_SpinDash-Ani_Sonic)/2
	endc	;end Spin Dash
	
	if DashCDActive=1	;Mercury Dash CD
ptr_Dash:	dc.w SonAni_Dash-Ani_Sonic
ptr_DashCharge:	dc.w SonAni_DashCharge-Ani_Sonic
	id_Dash:	equ (ptr_Dash-Ani_Sonic)/2
	id_DashCharge:	equ (ptr_DashCharge-Ani_Sonic)/2
	endc	;end Dash CD
	
	if BalanceCDActive=1	;Mercury Balance CD
ptr_BalanceForward: dc.w SonAni_BalanceForward-Ani_Sonic
ptr_BalanceBack:	dc.w SonAni_BalanceBack-Ani_Sonic
	id_BalanceForward:	equ (ptr_BalanceForward-Ani_Sonic)/2
	id_BalanceBack:	equ (ptr_BalanceBack-Ani_Sonic)/2
	endc	;end Balance CD

SonAni_Walk:	dc.b $FF, fr_walk13, fr_walk14,	fr_walk15, fr_walk16, fr_walk11, fr_walk12, afEnd
		even
SonAni_Run:	dc.b $FF,  fr_run11,  fr_run12,  fr_run13,  fr_run14,     afEnd,     afEnd, afEnd
		even
SonAni_Roll:	dc.b $FE,  fr_Roll1,  fr_Roll2,  fr_Roll3,  fr_Roll4,  fr_Roll5,     afEnd, afEnd
		even
SonAni_Roll2:	dc.b $FE,  fr_Roll1,  fr_Roll2,  fr_Roll5,  fr_Roll3,  fr_Roll4,  fr_Roll5, afEnd
		even
SonAni_Push:	dc.b $FD,  fr_push1,  fr_push2,  fr_push3,  fr_push4,     afEnd,     afEnd, afEnd
		even
SonAni_Wait:	dc.b $17, fr_stand, fr_stand, fr_stand, fr_stand, fr_stand, fr_stand, fr_stand, fr_stand, fr_stand
		dc.b fr_stand, fr_stand, fr_stand, fr_wait2, fr_wait1, fr_wait1, fr_wait1, fr_wait2, fr_wait3, afBack, 2
		even
SonAni_Balance:	dc.b $1F, fr_balance1, fr_balance2, afEnd
		even
SonAni_LookUp:	dc.b $3F, fr_lookup, afEnd
		even
SonAni_Duck:	dc.b $3F, fr_duck, afEnd
		even
SonAni_Warp1:	dc.b $3F, fr_warp1, afEnd
		even
SonAni_Warp2:	dc.b $3F, fr_warp2, afEnd
		even
SonAni_Warp3:	dc.b $3F, fr_warp3, afEnd
		even
SonAni_Warp4:	dc.b $3F, fr_warp4, afEnd
		even
SonAni_Stop:	dc.b 7,	fr_stop1, fr_stop2, afEnd
		even
SonAni_Float1:	dc.b 7,	fr_float1, fr_float4, afEnd
		even
SonAni_Float2:	dc.b 7,	fr_float1, fr_float2, fr_float5, fr_float3, fr_float6, afEnd
		even
SonAni_Spring:	dc.b $2F, fr_spring, afChange, id_Walk
		even
SonAni_Hang:	dc.b 4,	fr_hang1, fr_hang2, afEnd
		even
SonAni_Leap1:	dc.b $F, fr_leap1, fr_leap1, fr_leap1,	afBack, 1
		even
SonAni_Leap2:	dc.b $F, fr_leap1, fr_leap2, afBack, 1
		even
SonAni_Surf:	dc.b $3F, fr_surf, afEnd
		even
SonAni_GetAir:	dc.b $B, fr_getair, fr_getair, fr_walk15, fr_walk16, afChange, id_Walk
		even
SonAni_Burnt:	dc.b $20, fr_burnt, afEnd
		even
SonAni_Drown:	dc.b $2F, fr_drown, afEnd
		even
SonAni_Death:	dc.b 3,	fr_death, afEnd
		even
		
	if TimeLimitInSpecialStage=1	;Mercury Time Limit In Special Stage
SonAni_Shrink:	dc.b 8,	fr_shrink1, fr_shrink1, fr_shrink1, fr_shrink1, fr_shrink1, fr_shrink1, fr_shrink2, fr_shrink3, fr_shrink4, fr_shrink5, fr_null, afBack, 1
		even
	else
SonAni_Shrink:	dc.b 3,	fr_shrink1, fr_shrink2, fr_shrink3, fr_shrink4, fr_shrink5, fr_null, afBack, 1
		even
	endc	;end Time Limit In Special Stage
		
SonAni_Hurt:	dc.b 3,	fr_injury, afEnd
		even
SonAni_WaterSlide:
		dc.b 7, fr_injury, fr_waterslide, afEnd
		even
SonAni_Null:	dc.b $77, fr_null, afChange, id_Walk
		even
SonAni_Float3:	dc.b 3,	fr_float1, fr_float2, fr_float5, fr_float3, fr_float6, afEnd
		even
SonAni_Float4:	dc.b 3,	fr_float1, afChange, id_Walk
		even

	if WallJumpActive=1	;Mercury Wall Jump
SonAni_WallJump:	dc.b 3,	fr_WallJump, afEnd
		even
	endc	;end Wall Jump
	
	if SpinDashActive=1	;Mercury Spin Dash
SonAni_SpinDash:	dc.b 0, fr_SpinDash1, fr_SpinDash2, fr_SpinDash1, fr_SpinDash3, fr_SpinDash1, fr_SpinDash4, fr_SpinDash1, fr_SpinDash5, fr_SpinDash1, fr_SpinDash6, afEnd
		even
	endc	;end Spin Dash
	
	if DashCDActive=1	;Mercury Dash CD
SonAni_Dash:	dc.b $FF,  fr_dash11,  fr_dash12,  fr_dash13,  fr_dash14,     afEnd,     afEnd, afEnd
		even
SonAni_DashCharge:	dc.b 0,  fr_walk13, fr_walk13, fr_walk13, fr_walk13, fr_walk13, fr_walk13, fr_walk13, fr_walk13
		dc.b	fr_walk14, fr_walk14, fr_walk14, fr_walk14, fr_walk15, fr_walk15, fr_run14, fr_run14
		dc.b	fr_Run11,  fr_Run12,  fr_Run13,  fr_Run14, fr_Run11,  fr_Run12,  fr_Run13,  fr_Run14
		dc.b	fr_dash11,  fr_dash12,  fr_dash13,  fr_dash14, afBack, 4
		even
	endc	;end Dash CD
	
	if BalanceCDActive=1	;Mercury Balance CD
SonAni_BalanceForward:	dc.b $F, fr_BalanceForward1, fr_BalanceForward2, fr_BalanceForward3, fr_BalanceForward4, afEnd
		even
SonAni_BalanceBack:	dc.b $F, fr_BalanceBack1, fr_BalanceBack2, fr_BalanceBack3,fr_BalanceBack4, afEnd
		even
	endc	;end Balance CD

id_Walk:	equ (ptr_Walk-Ani_Sonic)/2	; 0
id_Run:		equ (ptr_Run-Ani_Sonic)/2	; 1
id_Roll:	equ (ptr_Roll-Ani_Sonic)/2	; 2
id_Roll2:	equ (ptr_Roll2-Ani_Sonic)/2	; 3
id_Push:	equ (ptr_Push-Ani_Sonic)/2	; 4
id_Wait:	equ (ptr_Wait-Ani_Sonic)/2	; 5
id_Balance:	equ (ptr_Balance-Ani_Sonic)/2	; 6
id_LookUp:	equ (ptr_LookUp-Ani_Sonic)/2	; 7
id_Duck:	equ (ptr_Duck-Ani_Sonic)/2	; 8
id_Warp1:	equ (ptr_Warp1-Ani_Sonic)/2	; 9
id_Warp2:	equ (ptr_Warp2-Ani_Sonic)/2	; $A
id_Warp3:	equ (ptr_Warp3-Ani_Sonic)/2	; $B
id_Warp4:	equ (ptr_Warp4-Ani_Sonic)/2	; $C
id_Stop:	equ (ptr_Stop-Ani_Sonic)/2	; $D
id_Float1:	equ (ptr_Float1-Ani_Sonic)/2	; $E
id_Float2:	equ (ptr_Float2-Ani_Sonic)/2	; $F
id_Spring:	equ (ptr_Spring-Ani_Sonic)/2	; $10
id_Hang:	equ (ptr_Hang-Ani_Sonic)/2	; $11
id_Leap1:	equ (ptr_Leap1-Ani_Sonic)/2	; $12
id_Leap2:	equ (ptr_Leap2-Ani_Sonic)/2	; $13
id_Surf:	equ (ptr_Surf-Ani_Sonic)/2	; $14
id_GetAir:	equ (ptr_GetAir-Ani_Sonic)/2	; $15
id_Burnt:	equ (ptr_Burnt-Ani_Sonic)/2	; $16
id_Drown:	equ (ptr_Drown-Ani_Sonic)/2	; $17
id_Death:	equ (ptr_Death-Ani_Sonic)/2	; $18
id_Shrink:	equ (ptr_Shrink-Ani_Sonic)/2	; $19
id_Hurt:	equ (ptr_Hurt-Ani_Sonic)/2	; $1A
id_WaterSlide:	equ (ptr_WaterSlide-Ani_Sonic)/2 ; $1B
id_Null:	equ (ptr_Null-Ani_Sonic)/2	; $1C
id_Float3:	equ (ptr_Float3-Ani_Sonic)/2	; $1D
id_Float4:	equ (ptr_Float4-Ani_Sonic)/2	; $1E