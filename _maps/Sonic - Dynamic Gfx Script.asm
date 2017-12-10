; ---------------------------------------------------------------------------
; Uncompressed graphics	loading	array for Sonic
; ---------------------------------------------------------------------------
SonicDynPLC:	dc.w SonPLC_Null-SonicDynPLC
		dc.w SonPLC_Stand-SonicDynPLC
		dc.w SonPLC_Wait1-SonicDynPLC
		dc.w SonPLC_Wait2-SonicDynPLC
		dc.w SonPLC_Wait3-SonicDynPLC
		dc.w SonPLC_LookUp-SonicDynPLC
		dc.w SonPLC_Walk11-SonicDynPLC
		dc.w SonPLC_Walk12-SonicDynPLC
		dc.w SonPLC_Walk13-SonicDynPLC
		dc.w SonPLC_Walk14-SonicDynPLC
		dc.w SonPLC_Walk15-SonicDynPLC
		dc.w SonPLC_Walk16-SonicDynPLC
		dc.w SonPLC_Walk21-SonicDynPLC
		dc.w SonPLC_Walk22-SonicDynPLC
		dc.w SonPLC_Walk23-SonicDynPLC
		dc.w SonPLC_Walk24-SonicDynPLC
		dc.w SonPLC_Walk25-SonicDynPLC
		dc.w SonPLC_Walk26-SonicDynPLC
		dc.w SonPLC_Walk31-SonicDynPLC
		dc.w SonPLC_Walk32-SonicDynPLC
		dc.w SonPLC_Walk33-SonicDynPLC
		dc.w SonPLC_Walk34-SonicDynPLC
		dc.w SonPLC_Walk35-SonicDynPLC
		dc.w SonPLC_Walk36-SonicDynPLC
		dc.w SonPLC_Walk41-SonicDynPLC
		dc.w SonPLC_Walk42-SonicDynPLC
		dc.w SonPLC_Walk43-SonicDynPLC
		dc.w SonPLC_Walk44-SonicDynPLC
		dc.w SonPLC_Walk45-SonicDynPLC
		dc.w SonPLC_Walk46-SonicDynPLC
		dc.w SonPLC_Run11-SonicDynPLC
		dc.w SonPLC_Run12-SonicDynPLC
		dc.w SonPLC_Run13-SonicDynPLC
		dc.w SonPLC_Run14-SonicDynPLC
		dc.w SonPLC_Run21-SonicDynPLC
		dc.w SonPLC_Run22-SonicDynPLC
		dc.w SonPLC_Run23-SonicDynPLC
		dc.w SonPLC_Run24-SonicDynPLC
		dc.w SonPLC_Run31-SonicDynPLC
		dc.w SonPLC_Run32-SonicDynPLC
		dc.w SonPLC_Run33-SonicDynPLC
		dc.w SonPLC_Run34-SonicDynPLC
		dc.w SonPLC_Run41-SonicDynPLC
		dc.w SonPLC_Run42-SonicDynPLC
		dc.w SonPLC_Run43-SonicDynPLC
		dc.w SonPLC_Run44-SonicDynPLC
		dc.w SonPLC_Roll1-SonicDynPLC
		dc.w SonPLC_Roll2-SonicDynPLC
		dc.w SonPLC_Roll3-SonicDynPLC
		dc.w SonPLC_Roll4-SonicDynPLC
		dc.w SonPLC_Roll5-SonicDynPLC
		dc.w SonPLC_Warp1-SonicDynPLC
		dc.w SonPLC_Warp2-SonicDynPLC
		dc.w SonPLC_Warp3-SonicDynPLC
		dc.w SonPLC_Warp4-SonicDynPLC
		dc.w SonPLC_Stop1-SonicDynPLC
		dc.w SonPLC_Stop2-SonicDynPLC
		dc.w SonPLC_Duck-SonicDynPLC
		dc.w SonPLC_Balance1-SonicDynPLC
		dc.w SonPLC_Balance2-SonicDynPLC
		dc.w SonPLC_Float1-SonicDynPLC
		dc.w SonPLC_Float2-SonicDynPLC
		dc.w SonPLC_Float3-SonicDynPLC
		dc.w SonPLC_Float4-SonicDynPLC
		dc.w SonPLC_Spring-SonicDynPLC
		dc.w SonPLC_Hang1-SonicDynPLC
		dc.w SonPLC_Hang2-SonicDynPLC
		dc.w SonPLC_Leap1-SonicDynPLC
		dc.w SonPLC_Leap2-SonicDynPLC
		dc.w SonPLC_Push1-SonicDynPLC
		dc.w SonPLC_Push2-SonicDynPLC
		dc.w SonPLC_Push3-SonicDynPLC
		dc.w SonPLC_Push4-SonicDynPLC
		dc.w SonPLC_Surf-SonicDynPLC
		dc.w SonPLC_BubStand-SonicDynPLC
		dc.w SonPLC_Death-SonicDynPLC
		dc.w SonPLC_Drown-SonicDynPLC
		dc.w SonPLC_Burnt-SonicDynPLC
		dc.w SonPLC_Shrink1-SonicDynPLC
		dc.w SonPLC_Shrink2-SonicDynPLC
		dc.w SonPLC_Shrink3-SonicDynPLC
		dc.w SonPLC_Shrink4-SonicDynPLC
		dc.w SonPLC_Shrink5-SonicDynPLC
		dc.w SonPLC_Float1-SonicDynPLC
		dc.w SonPLC_Float3-SonicDynPLC
		dc.w SonPLC_Injury-SonicDynPLC
		dc.w SonPLC_GetAir-SonicDynPLC
		dc.w SonPLC_WaterSlide-SonicDynPLC

	if WallJumpActive=1	;Mercury Wall Jump
		dc.w SonPLC_WallJump-SonicDynPLC
	endc	;end Wall Jump
	
	if SpinDashActive=1	;Mercury Spin Dash
		dc.w SonPLC_SpinDash1-SonicDynPLC
		dc.w SonPLC_SpinDash2-SonicDynPLC
		dc.w SonPLC_SpinDash3-SonicDynPLC
		dc.w SonPLC_SpinDash4-SonicDynPLC
		dc.w SonPLC_SpinDash5-SonicDynPLC
		dc.w SonPLC_SpinDash6-SonicDynPLC
	endc	;end Spin Dash
	
	if DashCDActive=1	;Mercury Dash CD
		dc.w SonPLC_0464-SonicDynPLC
		dc.w SonPLC_046A-SonicDynPLC
		dc.w SonPLC_0470-SonicDynPLC
		dc.w SonPLC_0476-SonicDynPLC
		dc.w SonPLC_047C-SonicDynPLC
		dc.w SonPLC_0488-SonicDynPLC
		dc.w SonPLC_0490-SonicDynPLC
		dc.w SonPLC_049C-SonicDynPLC
		dc.w SonPLC_04A4-SonicDynPLC
		dc.w SonPLC_04AA-SonicDynPLC
		dc.w SonPLC_04B0-SonicDynPLC
		dc.w SonPLC_04B6-SonicDynPLC
		dc.w SonPLC_04BC-SonicDynPLC
		dc.w SonPLC_04C6-SonicDynPLC
		dc.w SonPLC_04CE-SonicDynPLC
		dc.w SonPLC_04DA-SonicDynPLC
	endc	;end Dash CD
	
	if BalanceCDActive=1	;Mercury Balance CD
		dc.w SonPLC_BalanceForward1-SonicDynPLC
		dc.w SonPLC_BalanceForward2-SonicDynPLC
		dc.w SonPLC_BalanceForward3-SonicDynPLC
		dc.w SonPLC_BalanceForward4-SonicDynPLC
		dc.w SonPLC_BalanceBack1-SonicDynPLC
		dc.w SonPLC_BalanceBack2-SonicDynPLC
		dc.w SonPLC_BalanceBack3-SonicDynPLC
		dc.w SonPLC_BalanceBack4-SonicDynPLC
	endc	;end Balance CD

SonPLC_Null:	dc.b 0
SonPLC_Stand:	dc.b 4,	$20, 0,	$70, 3,	$20, $B, $20, $E
SonPLC_Wait1:	dc.b 3,	$50, $11, $50, $17, $20, $1D
SonPLC_Wait2:	dc.b 3,	$50, $20, $50, $17, $20, $1D
SonPLC_Wait3:	dc.b 3,	$50, $20, $50, $17, $20, $26
SonPLC_LookUp:	dc.b 3,	$80, $29, $20, $B, $20,	$E
SonPLC_Walk11:	dc.b 4,	$70, $32, $50, $3A, $50, $40, $10, $46
SonPLC_Walk12:	dc.b 2,	$70, $32, $B0, $48
SonPLC_Walk13:	dc.b 2,	$50, $54, $80, $5A
SonPLC_Walk14:	dc.b 4,	$50, $54, $50, $63, $50, $69, $10, $6F
SonPLC_Walk15:	dc.b 2,	$50, $54, $B0, $71
SonPLC_Walk16:	dc.b 3,	$70, $32, $30, $7D, $50, $81
SonPLC_Walk21:	dc.b 5,	$50, $87, $50, $8D, $20, $93, $50, $96,	0, $9C
SonPLC_Walk22:	dc.b 6,	$50, $87, $10, $9D, $30, $9F, $50, $A3,	$30, $A9, 0, $AD
SonPLC_Walk23:	dc.b 4,	$50, $AE, $10, $B4, $70, $B6, $20, $BE
SonPLC_Walk24:	dc.b 5,	$50, $C1, $30, $C7, $70, $CB, $20, $D3,	$10, $D6
SonPLC_Walk25:	dc.b 4,	$50, $C1, $10, $D8, $70, $DA, $20, $E2
SonPLC_Walk26:	dc.b 5,	$50, $87, $10, $9D, 0, $93, $70, $E5, $20, $ED
SonPLC_Walk31:	dc.b 4,	$70, $F0, $50, $F8, $10, $FE, $51, 0
SonPLC_Walk32:	dc.b 2,	$70, $F0, $B1, 6
SonPLC_Walk33:	dc.b 2,	$51, $12, $81, $18
SonPLC_Walk34:	dc.b 4,	$51, $12, $51, $21, $11, $27, $51, $29
SonPLC_Walk35:	dc.b 2,	$51, $12, $B1, $2F
SonPLC_Walk36:	dc.b 3,	$70, $F0, 1, 6,	$81, $3B
SonPLC_Walk41:	dc.b 6,	$51, $44, $11, $4A, $11, $4C, $81, $4E,	1, $57,	1, $58
SonPLC_Walk42:	dc.b 6,	$51, $44, $21, $59, $11, $5C, $11, $5E,	$81, $60, 1, $57
SonPLC_Walk43:	dc.b 4,	$51, $69, $11, $6F, $81, $71, $11, $7A
SonPLC_Walk44:	dc.b 5,	$51, $7C, $21, $82, $11, $85, $71, $87,	$21, $8F
SonPLC_Walk45:	dc.b 4,	$51, $7C, $11, $92, $81, $94, $11, $9D
SonPLC_Walk46:	dc.b 5,	$51, $44, $81, $9F, $11, $5E, $11, $A8,	1, $57
SonPLC_Run11:	dc.b 2,	$51, $AA, $B1, $B0
SonPLC_Run12:	dc.b 2,	$50, $54, $B1, $BC
SonPLC_Run13:	dc.b 2,	$51, $AA, $B1, $C8
SonPLC_Run14:	dc.b 2,	$50, $54, $B1, $D4
SonPLC_Run21:	dc.b 4,	$51, $E0, $11, $E6, $B1, $E8, 1, $F4
SonPLC_Run22:	dc.b 3,	$51, $F5, $11, $FB, $B1, $FD
SonPLC_Run23:	dc.b 4,	$51, $E0, $12, 9, $B2, $B, 1, $F4
SonPLC_Run24:	dc.b 3,	$51, $F5, $11, $FB, $B2, $17
SonPLC_Run31:	dc.b 2,	$52, $23, $B2, $29
SonPLC_Run32:	dc.b 2,	$51, $12, $B2, $35
SonPLC_Run33:	dc.b 2,	$52, $23, $B2, $41
SonPLC_Run34:	dc.b 2,	$51, $12, $B2, $4D
SonPLC_Run41:	dc.b 4,	$52, $59, $12, $5F, $B2, $61, 2, $6D
SonPLC_Run42:	dc.b 2,	$72, $6E, $B2, $76
SonPLC_Run43:	dc.b 4,	$52, $59, $12, $82, $B2, $84, 2, $6D
SonPLC_Run44:	dc.b 2,	$72, $6E, $B2, $90
SonPLC_Roll1:	dc.b 1,	$F2, $9C
SonPLC_Roll2:	dc.b 1,	$F2, $AC
SonPLC_Roll3:	dc.b 1,	$F2, $BC
SonPLC_Roll4:	dc.b 1,	$F2, $CC
SonPLC_Roll5:	dc.b 1,	$F2, $DC
SonPLC_Warp1:	dc.b 2,	$B2, $EC, $22, $F8
SonPLC_Warp2:	dc.b 1,	$F2, $FB
SonPLC_Warp3:	dc.b 2,	$B3, $B, $23, $17
SonPLC_Warp4:	dc.b 1,	$F3, $1A
SonPLC_Stop1:	dc.b 2,	$53, $2A, $B3, $30
SonPLC_Stop2:	dc.b 4,	$53, $3C, $73, $42, $13, $4A, 3, $4C
SonPLC_Duck:	dc.b 4,	$13, $4D, $73, $4F, $23, $57, 3, $5A
SonPLC_Balance1:dc.b 3,	$23, $5B, $23, $5E, $F3, $61
SonPLC_Balance2:dc.b 3,	$B3, $71, $73, $7D, 0, $71
SonPLC_Float1:	dc.b 3,	$73, $85, $33, $8D, $23, $91
SonPLC_Float2:	dc.b 1,	$83, $94
SonPLC_Float3:	dc.b 3,	$73, $9D, 3, $A5, $33, $A6
SonPLC_Float4:	dc.b 3,	$73, $AA, $33, $B2, $23, $B6
SonPLC_Spring:	dc.b 3,	$B3, $B9, $13, $C5, 3, $C7
SonPLC_Hang1:	dc.b 4,	$B3, $C8, $33, $D4, 3, $D8, 3, $D9
SonPLC_Hang2:	dc.b 4,	$B3, $DA, $33, $E6, 3, $EA, 3, $EB
SonPLC_Leap1:	dc.b 5,	$83, $EC, $13, $F5, $53, $F7, $13, $FD,	3, $FF
SonPLC_Leap2:	dc.b 5,	$84, 0,	$14, 9,	$53, $F7, $13, $FD, 3, $FF
SonPLC_Push1:	dc.b 2,	$84, $B, $74, $14
SonPLC_Push2:	dc.b 3,	$84, $1C, $24, $25, $14, $28
SonPLC_Push3:	dc.b 2,	$84, $2A, $74, $33
SonPLC_Push4:	dc.b 3,	$84, $1C, $24, $3B, $14, $3E
SonPLC_Surf:	dc.b 2,	$54, $40, $B4, $46
SonPLC_BubStand:dc.b 3,	$84, $52, $34, $5B, 4, $5F
SonPLC_Death:	dc.b 3,	$74, $60, $14, $68, $B4, $6A
SonPLC_Drown:	dc.b 5,	$74, $76, $14, $7E, $54, $80, $34, $86,	4, $8A
SonPLC_Burnt:	dc.b 5,	$74, $8B, $14, $7E, $54, $93, $34, $86,	4, $8A
SonPLC_Shrink1:	dc.b 2,	$24, $99, $F4, $9C
SonPLC_Shrink2:	dc.b 3,	$24, $AC, $B4, $AF, $24, $BB
SonPLC_Shrink3:	dc.b 1,	$B4, $BE
SonPLC_Shrink4:	dc.b 1,	$54, $CA
SonPLC_Shrink5:	dc.b 1,	$14, $D0
SonPLC_Injury:	dc.b 3,	$B4, $D2, $14, $DE, $34, $E0
SonPLC_GetAir:	dc.b 3,	$54, $E4, $B4, $EA, $10, $6D
SonPLC_WaterSlide:dc.b 2, $F4, $F6, $25, 6

	if WallJumpActive=1	;Mercury Wall Jump
SonPLC_WallJump:	dc.b 2
	DynPLC	6, 0,	Art_SonicWallJump-Art_Sonic
	DynPLC	12, 6,	Art_SonicWallJump-Art_Sonic
	endc	;end Wall Jump
	
	if SpinDashActive=1	;Mercury Spin Dash
SonPLC_SpinDash1:	dc.b 1
	DynPLC	16, $00, Art_SonicSpinDash-Art_Sonic
SonPLC_SpinDash2:	dc.b 1
	DynPLC	16, $10, Art_SonicSpinDash-Art_Sonic
SonPLC_SpinDash3:	dc.b 1
	DynPLC	16, $20, Art_SonicSpinDash-Art_Sonic
SonPLC_SpinDash4:	dc.b 1
	DynPLC	16, $30, Art_SonicSpinDash-Art_Sonic
SonPLC_SpinDash5:	dc.b 1
	DynPLC	16, $40, Art_SonicSpinDash-Art_Sonic
SonPLC_SpinDash6:	dc.b 1
	DynPLC	16, $50, Art_SonicSpinDash-Art_Sonic
	endc	;end Spin Dash
	
	if DashCDActive=1	;Mercury Dash CD
SonPLC_0464:	dc.b	2
	DynPLC	3, (0x0512-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x0515-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_046A:	dc.b	2
	DynPLC	3, (0x0525-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x0528-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_0470:	dc.b	2
	DynPLC	3, (0x0538-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x053B-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_0476:	dc.b	2
	DynPLC	2, (0x054B-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x054D-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_047C:	dc.b	5
	DynPLC	3, (0x055D-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	12, (0x0560-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x056C-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	4, (0x056F-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	1, (0x0573-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_0488:	dc.b	3
	DynPLC	3, (0x0574-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x0577-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	2, (0x0587-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_0490:	dc.b	5
	DynPLC	3, (0x0589-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	12, (0x058C-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x0598-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	4, (0x059B-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	1, (0x059F-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_049C:	dc.b	3
	DynPLC	3, (0x05A0-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x05A3-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	2, (0x05B3-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04A4:	dc.b	2
	DynPLC	16, (0x05B5-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x05C5-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04AA:	dc.b	2
	DynPLC	16, (0x05C8-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x05D8-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04B0:	dc.b	2
	DynPLC	16, (0x05DB-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x05EB-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04B6:	dc.b	2
	DynPLC	16, (0x05EE-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	2, (0x05FE-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04BC:	dc.b	4
	DynPLC	6, (0x0600-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x0606-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	12, (0x0609-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	2, (0x0615-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04C6:	dc.b	3
	DynPLC	2, (0x0617-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x0619-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x061C-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04CE:	dc.b	5
	DynPLC	3, (0x062C-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x062F-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	12, (0x0632-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	2, (0x063E-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x0640-$512),	Art_SonicDashCD-Art_Sonic

SonPLC_04DA:	dc.b	3
	DynPLC	2, (0x0643-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	3, (0x0645-$512),	Art_SonicDashCD-Art_Sonic
	DynPLC	16, (0x0648-$512),	Art_SonicDashCD-Art_Sonic
	endc	;end Dash CD
	
	if BalanceCDActive=1	;Mercury Balance CD
SonPLC_BalanceForward1:	dc.b 2
	DynPLC	4,	$50,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	16,	$54,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceForward2:	dc.b 3
	DynPLC	3,	$50,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	16,	$64,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	3,	$74,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceForward3:	dc.b 2
	DynPLC	16,	$77,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	4,	$87,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceForward4:	dc.b 2
	DynPLC	16,	$8B,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	4,	$9B,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceBack1:	dc.b 2
	DynPLC	16,	$00,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	5,	$10,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceBack2:	dc.b 2
	DynPLC	16,	$15,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	3,	$25,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceBack3:	dc.b 2
	DynPLC	16,	$28,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	7,	$21,	Art_SonicBalanceCD-Art_Sonic
SonPLC_BalanceBack4:	dc.b 2
	DynPLC	16,	$38,	Art_SonicBalanceCD-Art_Sonic
	DynPLC	4,	$48,	Art_SonicBalanceCD-Art_Sonic
	endc	;end Balance CD

		even
		