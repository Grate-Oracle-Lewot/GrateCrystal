BugContest_SetCaughtContestMon:
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wNamedObjectIndex], a
	farcall DisplayAlreadyCaughtText
	farcall DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c

.firstcatch
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wContestMon
	call GeneratePartyMonStats
	ld a, [wEnemyMonCatchRate]
	ld [wContestMonUnused], a
	ld a, [wTempEnemyMonSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, .ContestCaughtMonText
	jp PrintText

.ContestCaughtMonText:
	text_far _ContestCaughtMonText
	text_end
