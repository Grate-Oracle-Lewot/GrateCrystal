_ReturnToBattle_UseBall:
	call ClearBGPalettes
	call ClearTilemap
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial
	farcall GetBattleMonBackpic
	call .common
	call UpdateBattleHuds
.end
	call WaitBGMap
	jp SetPalettes

.tutorial
	farcall GetTrainerBackpic
	call .common
	jr .end

.common
	farcall GetEnemyMonFrontpic
	farcall _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	jp LoadStandardMenuHeader
