; BattleTransitionJumptable.Jumptable indexes
	const_def
	const BATTLETRANSITION_LOAD_POKEBALL_GFX ; 0
	const BATTLETRANSITION_SET_UP_BG_MAP     ; 1
	const BATTLETRANSITION_FLASH             ; 2
	const BATTLETRANSITION_DETERMINE_ANIM    ; 3
NUM_SET_UP_PHASES EQU const_value
	const BATTLETRANSITION_WAVY              ; 4
	const_skip                               ; 5
	const BATTLETRANSITION_ZOOM_TO_BLACK     ; 6
	; no set up so no skip
	const BATTLETRANSITION_SPIN              ; 7
	const_skip                               ; 8
	const BATTLETRANSITION_SCATTER           ; 9
	const_skip                               ; a
	const BATTLETRANSITION_FINISH            ; b

; StartTrainerBattle_DetermineWhichAnimation.StartingPoints indexes
BATTLETRANSITION_CAVE             EQU BATTLETRANSITION_WAVY
BATTLETRANSITION_CAVE_STRONGER    EQU BATTLETRANSITION_ZOOM_TO_BLACK
BATTLETRANSITION_NO_CAVE          EQU BATTLETRANSITION_SPIN
BATTLETRANSITION_NO_CAVE_STRONGER EQU BATTLETRANSITION_SCATTER

NUM_BATTLETRANSITION_FLASHES EQU 3

BATTLETRANSITION_SQUARE EQU "8" ; $fe
BATTLETRANSITION_BLACK  EQU "9" ; $ff

; transition animations
	const_def
	const TRANS_CAVE             ; 0
	const TRANS_CAVE_STRONGER    ; 1
	const TRANS_NO_CAVE          ; 2
	const TRANS_NO_CAVE_STRONGER ; 3

; transition animation bits
TRANS_STRONGER_F EQU 0 ; bit set in TRANS_CAVE_STRONGER and TRANS_NO_CAVE_STRONGER
TRANS_NO_CAVE_F  EQU 1 ; bit set in TRANS_NO_CAVE and TRANS_NO_CAVE_STRONGER

; quadrants
	const_def
	const UPPER_LEFT  ; 0
	const UPPER_RIGHT ; 1
	const LOWER_LEFT  ; 2
	const LOWER_RIGHT ; 3

; quadrant bits
RIGHT_QUADRANT_F EQU 0 ; bit set in UPPER_RIGHT and LOWER_RIGHT
LOWER_QUADRANT_F EQU 1 ; bit set in LOWER_LEFT and LOWER_RIGHT

DoBattleTransition:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr z, .mobile
	farcall ReanchorBGMap_NoOAMUpdate
	call UpdateSprites
	call DelayFrame
	call .NonMobile_LoadPokeballTiles
	call CGBOnly_CopyTilemapAtOnce
	jr .resume

.mobile
	call LoadTrainerBattlePokeballTiles
.resume
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call WipeLYOverrides

	ldh a, [rBGP]
	ld [wBGP], a
	ldh a, [rOBP0]
	ld [wOBP0], a
	ldh a, [rOBP1]
	ld [wOBP1], a
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $1

.loop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .done
	call BattleTransitionJumptable
	call DelayFrame
	jr .loop

.done
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld bc, 8 palettes
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a

	ld a, %11111111
	ld [wBGP], a
	call DmgToCgbBGPals
	call DelayFrame
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCY], a

	ld a, $1 ; unnecessary bankswitch?
	ldh [rSVBK], a
	pop af
	ldh [hVBlank], a
	jp DelayFrame

.NonMobile_LoadPokeballTiles:
	call LoadTrainerBattlePokeballTiles
	hlbgcoord 0, 0
	; fallthrough

ConvertTrainerBattlePokeballTilesTo2bpp:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push hl
	ld hl, wDecompressScratch
	ld bc, $28 tiles

.loop
	ld [hl], -1
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop

	pop hl
	ld de, wDecompressScratch
	ld b, BANK(@)
	ld c, $28
	call Request2bpp
	pop af
	ldh [rSVBK], a
	ret

LoadTrainerBattlePokeballTiles:
	ld de, TrainerBattlePokeballTiles
	ld hl, vTiles0 tile BATTLETRANSITION_SQUARE
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	ld de, TrainerBattlePokeballTiles
	ld hl, vTiles3 tile BATTLETRANSITION_SQUARE
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	pop af
	ldh [rVBK], a
	ret

TrainerBattlePokeballTiles:
INCBIN "gfx/overworld/trainer_battle_pokeball_tiles.2bpp"

BattleTransitionJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	; BATTLETRANSITION_LOAD_POKEBALL_GFX
	dw StartTrainerBattle_LoadPokeBallGraphics

	; BATTLETRANSITION_SET_UP_BG_MAP
	dw StartTrainerBattle_SetUpBGMap

	; BATTLETRANSITION_FLASH
	dw StartTrainerBattle_Flash

	; BATTLETRANSITION_DETERMINE_ANIM
	dw StartTrainerBattle_DetermineWhichAnimation

	; BATTLETRANSITION_WAVY
	dw StartTrainerBattle_SetUpForWavyOutro
	dw StartTrainerBattle_SineWave

	; BATTLETRANSITION_ZOOM_TO_BLACK
	dw StartTrainerBattle_ZoomToBlack

	; BATTLETRANSITION_SPIN
	dw StartTrainerBattle_SetUpForSpinOutro
	dw StartTrainerBattle_SpinToBlack

	; BATTLETRANSITION_SCATTER
	dw StartTrainerBattle_SetUpForRandomScatterOutro
	dw StartTrainerBattle_SpeckleToBlack

	; BATTLETRANSITION_FINISH
	dw StartTrainerBattle_Finish

StartTrainerBattle_DetermineWhichAnimation:
	ld a, [wOtherTrainerClass]
	and a
	jr z, .wild
	farcall SetTrainerBattleLevel

.wild
	ld b, PARTY_LENGTH
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .okay
	add hl, de
	dec b
	jr nz, .loop

.okay
	ld de, MON_LEVEL - MON_HP - 1
	add hl, de
	ld de, 0
	ld a, [hl]
	ld hl, wCurPartyLevel
	cp [hl]
	jr nc, .not_stronger
	set TRANS_STRONGER_F, e
.not_stronger
	ld a, [wEnvironment]
	cp CAVE
	jr nc, .cave
	set TRANS_NO_CAVE_F, e
.cave
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	farcall RespawnPlayerAndOpponent
	ret

.StartingPoints:
; entries correspond to TRANS_* constants
	db BATTLETRANSITION_CAVE
	db BATTLETRANSITION_CAVE_STRONGER
	db BATTLETRANSITION_NO_CAVE
	db BATTLETRANSITION_NO_CAVE_STRONGER

StartTrainerBattle_Finish:
	call ClearSprites
	ld a, JUMPTABLE_EXIT
	ld [wJumptableIndex], a
	ret

StartTrainerBattle_SetUpBGMap:
	call StartTrainerBattle_NextScene
	xor a
	ld [wBattleTransitionCounter], a
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_NextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

StartTrainerBattle_Flash:
	ld b, -1
.loop
	inc b
	ld a, b
	cp NUM_BATTLETRANSITION_FLASHES
	jr nc, StartTrainerBattle_NextScene
.inner_loop
	call .DoFlashAnimation
	jr c, .loop
	call DelayFrame
	jr .inner_loop

.DoFlashAnimation:
	ld a, [wTimeOfDayPalset]
	cp DARKNESS_PALSET
	jr z, .done
	ld hl, wBattleTransitionCounter
	ld a, [hl]
	inc [hl]
	srl a
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	cp %00000001
	jr z, .done
	ld [wBGP], a
	call DmgToCgbBGPals
	and a
	ret

.done
	xor a
	ld [wBattleTransitionCounter], a
	scf
	ret

.pals:
	dc 3, 3, 2, 1
	dc 3, 3, 3, 2
	dc 3, 3, 3, 3
	dc 3, 3, 3, 2
	dc 3, 3, 2, 1
	dc 3, 2, 1, 0
	dc 2, 1, 0, 0
	dc 1, 0, 0, 0
	dc 0, 0, 0, 0
	dc 1, 0, 0, 0
	dc 2, 1, 0, 0
	dc 3, 2, 1, 0
	dc 0, 0, 0, 1

StartTrainerBattle_SetUpForWavyOutro:
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene

	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $90
	ldh [hLYOverrideEnd], a
	xor a
	ld [wBattleTransitionCounter], a
	ld [wBattleTransitionSineWaveOffset], a
	ret

StartTrainerBattle_SineWave:
	ld a, [wBattleTransitionCounter]
	cp $60
	jr c, .DoSineWave
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.DoSineWave:
	ld hl, wBattleTransitionSineWaveOffset
	ld a, [hl]
	inc [hl]
	ld hl, wBattleTransitionCounter
	ld d, [hl]
	add [hl]
	ld [hl], a
	ld a, wLYOverridesEnd - wLYOverrides
	ld bc, wLYOverrides
	ld e, 0

.loop
	push af
	push de
	ld a, e
	call StartTrainerBattle_DrawSineWave
	ld [bc], a
	inc bc
	pop de
	ld a, e
	add 2
	ld e, a
	pop af
	dec a
	jr nz, .loop
	ret

StartTrainerBattle_SetUpForSpinOutro:
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	xor a
	ld [wBattleTransitionCounter], a
	ret

StartTrainerBattle_SpinToBlack:
	xor a
	ldh [hBGMapMode], a
	ld a, [wBattleTransitionCounter]
	ld e, a
	ld d, 0
	ld hl, .spin_quadrants
rept 5
	add hl, de
endr
	ld a, [hli]
	cp -1
	jr z, .end
	ld [wBattleTransitionSineWaveOffset], a
	call .load
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ld hl, wBattleTransitionCounter
	inc [hl]
	ret

.end
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.spin_quadrants:
spin_quadrant: MACRO
	db \1
	dw \2
	dwcoord \3, \4
ENDM
	spin_quadrant UPPER_LEFT,  .wedge1,  1,  6
	spin_quadrant UPPER_LEFT,  .wedge2,  0,  3
	spin_quadrant UPPER_LEFT,  .wedge3,  1,  0
	spin_quadrant UPPER_LEFT,  .wedge4,  5,  0
	spin_quadrant UPPER_LEFT,  .wedge5,  9,  0
	spin_quadrant UPPER_RIGHT, .wedge5, 10,  0
	spin_quadrant UPPER_RIGHT, .wedge4, 14,  0
	spin_quadrant UPPER_RIGHT, .wedge3, 18,  0
	spin_quadrant UPPER_RIGHT, .wedge2, 19,  3
	spin_quadrant UPPER_RIGHT, .wedge1, 18,  6
	spin_quadrant LOWER_RIGHT, .wedge1, 18, 11
	spin_quadrant LOWER_RIGHT, .wedge2, 19, 14
	spin_quadrant LOWER_RIGHT, .wedge3, 18, 17
	spin_quadrant LOWER_RIGHT, .wedge4, 14, 17
	spin_quadrant LOWER_RIGHT, .wedge5, 10, 17
	spin_quadrant LOWER_LEFT,  .wedge5,  9, 17
	spin_quadrant LOWER_LEFT,  .wedge4,  5, 17
	spin_quadrant LOWER_LEFT,  .wedge3,  1, 17
	spin_quadrant LOWER_LEFT,  .wedge2,  0, 14
	spin_quadrant LOWER_LEFT,  .wedge1,  1, 11
	db -1

.load:
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [de]
	ld c, a
	inc de
.loop1
	ld [hl], BATTLETRANSITION_BLACK
	ld a, [wBattleTransitionSineWaveOffset]
	bit RIGHT_QUADRANT_F, a
	jr z, .leftside
	inc hl
	jr .okay1
.leftside
	dec hl
.okay1
	dec c
	jr nz, .loop1
	pop hl
	ld a, [wBattleTransitionSineWaveOffset]
	bit LOWER_QUADRANT_F, a
	ld bc, SCREEN_WIDTH
	jr z, .upper
	ld bc, -SCREEN_WIDTH
.upper
	add hl, bc
	ld a, [de]
	inc de
	cp -1
	ret z
	and a
	jr z, .loop
	ld c, a
.loop2
	ld a, [wBattleTransitionSineWaveOffset]
	bit RIGHT_QUADRANT_F, a
	jr z, .leftside2
	dec hl
	jr .okay2
.leftside2
	inc hl
.okay2
	dec c
	jr nz, .loop2
	jr .loop

.wedge1: db 2, 3, 5, 4, 9, -1
.wedge2: db 1, 1, 2, 2, 4, 2, 4, 2, 3, -1
.wedge3: db 2, 1, 3, 1, 4, 1, 4, 1, 4, 1, 3, 1, 2, 1, 1, 1, 1, -1
.wedge4: db 4, 1, 4, 0, 3, 1, 3, 0, 2, 1, 2, 0, 1, -1
.wedge5: db 4, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, -1

StartTrainerBattle_SetUpForRandomScatterOutro:
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	ld a, $10
	ld [wBattleTransitionCounter], a
	ld a, 1
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_SpeckleToBlack:
	ld hl, wBattleTransitionCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld c, $c
.loop
	push bc
	call .BlackOutRandomTile
	pop bc
	dec c
	jr nz, .loop
	ret

.done
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.BlackOutRandomTile:
.y_loop
	call Random
	cp SCREEN_HEIGHT
	jr nc, .y_loop
	ld b, a

.x_loop
	call Random
	cp SCREEN_WIDTH
	jr nc, .x_loop
	ld c, a

	hlcoord 0, -1
	ld de, SCREEN_WIDTH
	inc b

.row_loop
	add hl, de
	dec b
	jr nz, .row_loop
	add hl, bc

; If the tile has already been blacked out, sample a new tile
	ld a, [hl]
	cp BATTLETRANSITION_BLACK
	jr z, .y_loop
	ld [hl], BATTLETRANSITION_BLACK
	ret

WipeLYOverrides:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	ld hl, wLYOverrides
	call .wipe
	ld hl, wLYOverridesBackup
	call .wipe

	pop af
	ldh [rSVBK], a
	ret

.wipe
	xor a
	ld c, SCREEN_HEIGHT_PX
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

StartTrainerBattle_LoadPokeBallGraphics:
	ld a, [wOtherTrainerClass]
	and a
	jp z, StartTrainerBattle_NextScene ; don't need to be here if wild

	xor a
	ldh [hBGMapMode], a

	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	inc b
	inc c
	jr .enter_loop_midway

.pal_loop
; set all pals to 7
	ld a, [hl]
	or PAL_BG_TEXT
	ld [hli], a
.enter_loop_midway
	dec c
	jr nz, .pal_loop
	dec b
	jr nz, .pal_loop

	call .loadpokeballgfx
	hlcoord 2, 1

	ld b, SCREEN_WIDTH - 4
.tile_loop
	push hl
	ld c, 2
.row_loop
	push hl
	ld a, [de]
	inc de
.col_loop
; Loading is done bit by bit
	and a
	jr z, .done
	sla a
	jr nc, .no_load
	ld [hl], BATTLETRANSITION_SQUARE
.no_load
	inc hl
	jr .col_loop

.done
	pop hl
	push bc
	ld bc, (SCREEN_WIDTH - 4) / 2
	add hl, bc
	pop bc
	dec c
	jr nz, .row_loop

	pop hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .tile_loop

	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	jr .nextscene

.cgb
	ld hl, .pals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	jr nz, .not_dark
	ld hl, .darkpals
.not_dark
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	call .copypals
	push hl
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ld de, wBGPals2 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a

	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call CGBOnly_CopyTilemapAtOnce

.nextscene
	jp StartTrainerBattle_NextScene

.copypals
	ld de, wBGPals1 palette PAL_BG_TEXT
	call .copy
	ld de, wBGPals2 palette PAL_BG_TEXT
	call .copy
	ld de, wOBPals1 palette PAL_OW_TREE
	call .copy
	ld de, wOBPals2 palette PAL_OW_TREE
	call .copy
	ld de, wOBPals1 palette PAL_OW_ROCK
	call .copy
	ld de, wOBPals2 palette PAL_OW_ROCK

.copy
	push hl
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ret

.pals:
INCLUDE "gfx/overworld/trainer_battle.pal"

.darkpals:
INCLUDE "gfx/overworld/trainer_battle_dark.pal"

.loadpokeballgfx:
	ld a, [wOtherTrainerClass]
	ld de, UbeqcTransition
	cp GRATE_ORACLE
	ret z
	ld de, MissingnoTransition
	cp AEROBONES
	ret z
	cp KABUBONES
	ret z
	cp MISSINGNO_T
	ret z
	ld de, TeamRocketTransition
	cp GRUNTM
	ret nc
	ld de, PokeBallTransition
	ret

PokeBallTransition:
; 16x16 overlay of a Poke Ball
pusho
opt b.X ; . = 0, X = 1
	bigdw %......XXXX......
	bigdw %....XXXXXXXX....
	bigdw %..XXXX....XXXX..
	bigdw %..XX........XX..
	bigdw %.XX..........XX.
	bigdw %.XX...XXXX...XX.
	bigdw %XX...XX..XX...XX
	bigdw %XXXXXX....XXXXXX
	bigdw %XXXXXX....XXXXXX
	bigdw %XX...XX..XX...XX
	bigdw %.XX...XXXX...XX.
	bigdw %.XX..........XX.
	bigdw %..XX........XX..
	bigdw %..XXXX....XXXX..
	bigdw %....XXXXXXXX....
	bigdw %......XXXX......
popo

TeamRocketTransition:
pusho
opt b.X ; . = 0, X = 1
	bigdw %XXXXXXXXXXXX....
	bigdw %XXXXXXXXXXXXXX..
	bigdw %XXXXXXXXXXXXXXX.
	bigdw %XXXXXXXXXXXXXXX.
	bigdw %XXXXX.....XXXXXX
	bigdw %XXXXX......XXXXX
	bigdw %XXXXX.....XXXXXX
	bigdw %XXXXXXXXXXXXXXX.
	bigdw %XXXXXXXXXXXXXXX.
	bigdw %XXXXXXXXXXXXXX..
	bigdw %XXXXXXXXXXXXX...
	bigdw %XXXXX....XXXXX..
	bigdw %XXXXX....XXXXX..
	bigdw %XXXXX.....XXXXX.
	bigdw %XXXXX......XXXXX
	bigdw %XXXXX......XXXXX
popo

MissingnoTransition:
pusho
opt b.X ; . = 0, X = 1
	bigdw %.........X.X.X..
	bigdw %........X.X.X.X.
	bigdw %.........X.X.X..
	bigdw %........X.X.X.X.
	bigdw %.........X.X.X..
	bigdw %........X.X.X.X.
	bigdw %.........X.X.X..
	bigdw %..X.X.X.X.X.X.X.
	bigdw %.X.X.X.X.X.X.X..
	bigdw %..X.X.X.X.X.X.X.
	bigdw %.X.X.X.X.X.X.X..
	bigdw %..X.X.X.X.X.X.X.
	bigdw %.X.X.X.X.X.X.X..
	bigdw %..X.X.X.X.X.X.X.
	bigdw %.X.X.X.X.X.X.X..
	bigdw %..X.X.X.X.X.X.X.
popo

UbeqcTransition:
pusho
opt b.X ; . = 0, X = 1
	bigdw %................
	bigdw %................
	bigdw %XXXXXX......XX..
	bigdw %XXXXXX.....XXXX.
	bigdw %XXXXXX....XXXXXX
	bigdw %XXXXXX....XXXXXX
	bigdw %XXXXXX.....XXXX.
	bigdw %XXXXXX......XX..
	bigdw %...XXXXXXXXXXX..
	bigdw %........X.......
	bigdw %.......XXX......
	bigdw %......XXXXX.....
	bigdw %.....XXXXXXX....
	bigdw %....XXXXXXXXX...
	bigdw %...XXXXXXXXXXX..
	bigdw %................
popo

StartTrainerBattle_DrawSineWave:
	calc_sine_wave

StartTrainerBattle_ZoomToBlack:
	farcall RespawnPlayerAndOpponent
	ld de, .boxes

.loop
	ld a, [de]
	cp -1
	jr z, .done
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	xor a
	ldh [hBGMapMode], a
	ld a, BATTLETRANSITION_BLACK
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	call WaitBGMap
	jr .loop

.done
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.boxes
zoombox: MACRO
; width, height, start y, start x
	db \1, \2
	dwcoord \3, \4
ENDM
	zoombox  4,  2,  8, 8
	zoombox  6,  4,  7, 7
	zoombox  8,  6,  6, 6
	zoombox 10,  8,  5, 5
	zoombox 12, 10,  4, 4
	zoombox 14, 12,  3, 3
	zoombox 16, 14,  2, 2
	zoombox 18, 16,  1, 1
	zoombox 20, 18,  0, 0
	db -1
