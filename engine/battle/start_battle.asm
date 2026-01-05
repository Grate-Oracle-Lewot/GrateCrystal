ShowLinkBattleParticipants:
; If we're not in a communications room, we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	farcall _ShowLinkBattleParticipants
	ld c, 90
	call DelayFrames
	call ClearTilemap
	jp ClearSprites

FindFirstAliveMonAndStartBattle:
	xor a
	ldh [hMapAnims], a
	call DelayFrame
	predef DoBattleTransition
	farcall _LoadBattleFontsHPBar
	ld a, 1
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hMapAnims], a
	ret

PlayBattleMusic:
	push hl
	push de
	push bc

	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	; Are we fighting a trainer?
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .trainermusic

if DEF (_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	; creepy theme goes unused
else
	ld a, [wTempWildMonSpecies]
	ld de, MUSIC_CREEPY_BATTLE
if DEF (_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS)
	cp MISSINGNO
else
	cp FINULL
endc
	jp z, .done
endc

	ld a, [wBattleType]
	ld de, MUSIC_LEGENDARY_BATTLE
	cp BATTLETYPE_ROAMING
	jp z, .done
	cp BATTLETYPE_LEGENDARY
	jp nc, .done

	ld de, MUSIC_SPECIAL_BATTLE
	cp BATTLETYPE_SHINY
	jp nc, .done

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [wTimeOfDay]
	cp NITE_F
	jr nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jr .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	ld a, [wTimeOfDay]
	cp NITE_F
	jr nz, .done
	ld de, MUSIC_KANTO_WILD_BATTLE_NIGHT
	jr .done

.trainermusic
	ld a, [wBattleType]
	cp BATTLETYPE_INVERSE
	jr z, .inverse
	cp BATTLETYPE_TYPELESS
	jr nz, .normaltype

.inverse
	ld a, [wOtherTrainerClass]
	ld de, MUSIC_INVERSE_BOSS
	cp RIVAL2
	jr nc, .done

	ld de, MUSIC_INVERSE_BATTLE
	jr .done

.normaltype
	ld a, [wOtherTrainerClass]
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr nc, .done

	cp RIVAL2 + 1
	jr nc, .normaltrainer

	ld de, MUSIC_RIVAL_BATTLE
	cp RIVAL1
	jr nc, .done

	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr nc, .done

	ld de, MUSIC_DARKROOM_BATTLE
	cp REAL_WILL
	jr nc, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	cp BROCK
	jr nc, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	jr .done

.normaltrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johto

	farcall RegionCheck
	ld a, e
	and a
	jr z, .johto
	ld de, MUSIC_KANTO_TRAINER_BATTLE
	jr .done

.johto
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
.done
	call PlayMusic
	pop bc
	pop de
	pop hl
	ret

ClearBattleRAM:
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wForcedSwitch], a
	ld [wTimeOfDayPal], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	farcall ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a ; LOW(vBGMap0)
	ld [hli], a
	ld [hl], HIGH(vBGMap0)
	ret
