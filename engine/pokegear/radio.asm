PlayRadioShow:
; If we're already in the radio program proper, we don't need to be here.
	ld a, [wCurRadioLine]
	cp POKE_FLUTE_RADIO
	jr nc, .ok
; If Team Rocket is not occupying the radio tower, we don't need to be here.
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
	jr z, .ok
; If we're in Kanto, we don't need to be here.
	call IsInJohto
	and a
	jr nz, .ok
; Team Rocket broadcasts on all stations.
	ld a, ROCKET_RADIO
	ld [wCurRadioLine], a
.ok
; Jump to the currently loaded station.  The index to which we need to jump is in wCurRadioLine.
	jumptable RadioJumptable, wCurRadioLine

RadioJumptable:
; entries correspond to constants/radio_constants.asm
	table_width 2, RadioJumptable
	dw OaksPKMNTalk1      ; $00
	dw PokedexShow1       ; $01
	dw BenMonMusic1       ; $02
	dw LuckyNumberShow1   ; $03
	dw BuenasPassword1    ; $04
	dw PeoplePlaces1      ; $05
	dw FernMonMusic1      ; $06
	dw RocketRadio1       ; $07
	dw PokeFluteRadio     ; $08
	dw UnownRadio         ; $09
	dw EvolutionRadio     ; $0a
	dw MewtwoRadio1       ; $0b
	dw JohtoFishingRadio1 ; $0c
	dw KantoFishingRadio1 ; $0d
	assert_table_length NUM_RADIO_CHANNELS
; OaksPKMNTalk
	dw OaksPKMNTalk2      ; $0e
	dw OaksPKMNTalk3      ; $0f
	dw OaksPKMNTalk4      ; $10
	dw OaksPKMNTalk5      ; $11
	dw OaksPKMNTalk6      ; $12
	dw OaksPKMNTalk7      ; $13
	dw OaksPKMNTalk8      ; $14
	dw OaksPKMNTalk9      ; $15
	dw PokedexShow2       ; $16
	dw PokedexShow3       ; $17
	dw PokedexShow4       ; $18
	dw PokedexShow5       ; $19
; Ben Music
	dw BenMonMusic2       ; $1a
	dw BenMonMusic3       ; $1b
	dw BenFernMusic4      ; $1c
	dw BenFernMusic5      ; $1d
	dw BenFernMusic6      ; $1e
	dw BenFernMusic7      ; $1f
	dw FernMonMusic2      ; $20
; Lucky Number Show
	dw LuckyNumberShow2   ; $21
	dw LuckyNumberShow3   ; $22
	dw LuckyNumberShow4   ; $23
	dw LuckyNumberShow5   ; $24
	dw LuckyNumberShow6   ; $25
	dw LuckyNumberShow7   ; $26
	dw LuckyNumberShow8   ; $27
	dw LuckyNumberShow9   ; $28
	dw LuckyNumberShow10  ; $29
	dw LuckyNumberShow11  ; $2a
	dw LuckyNumberShow12  ; $2b
	dw LuckyNumberShow13  ; $2c
	dw LuckyNumberShow14  ; $2d
	dw LuckyNumberShow15  ; $2e
; People & Places
	dw PeoplePlaces2      ; $2f
	dw PeoplePlaces3      ; $30
	dw PeoplePlaces4      ; $31
	dw PeoplePlaces5      ; $32
	dw PeoplePlaces6      ; $33
	dw PeoplePlaces7      ; $34
; Rocket Radio
	dw RocketRadio2       ; $35
	dw RocketRadio3       ; $36
	dw RocketRadio4       ; $37
	dw RocketRadio5       ; $38
	dw RocketRadio6       ; $39
	dw RocketRadio7       ; $3a
	dw RocketRadio8       ; $3b
	dw RocketRadio9       ; $3c
	dw RocketRadio10      ; $3d
; More Pokemon Channel stuff
	dw OaksPKMNTalk10     ; $3e
	dw OaksPKMNTalk11     ; $3f
	dw OaksPKMNTalk12     ; $40
	dw OaksPKMNTalk13     ; $41
	dw OaksPKMNTalk14     ; $42
; Buenas Password
	dw BuenasPassword2    ; $43
	dw BuenasPassword3    ; $44
	dw BuenasPassword4    ; $45
	dw BuenasPassword5    ; $46
	dw BuenasPassword6    ; $47
	dw BuenasPassword7    ; $48
	dw BuenasPassword8    ; $49
	dw BuenasPassword9    ; $4a
	dw BuenasPassword10   ; $4b
	dw BuenasPassword11   ; $4c
	dw BuenasPassword12   ; $4d
	dw BuenasPassword13   ; $4e
	dw BuenasPassword14   ; $4f
	dw BuenasPassword15   ; $50
	dw BuenasPassword16   ; $51
	dw BuenasPassword17   ; $52
	dw BuenasPassword18   ; $53
	dw BuenasPassword19   ; $54
	dw BuenasPassword20   ; $55
	dw BuenasPassword21   ; $56
	dw RadioScroll        ; $57
; More Pokemon Channel stuff
	dw PokedexShow6       ; $58
	dw PokedexShow7       ; $59
	dw PokedexShow8       ; $5a
; Mewtwo Radio
	dw MewtwoRadio2       ; $5b
	dw MewtwoRadio3       ; $5c
	dw MewtwoRadio4       ; $5d
	dw MewtwoRadio5       ; $5e
	dw MewtwoRadio6       ; $5f
	dw MewtwoRadio7       ; $60
	dw MewtwoRadio8       ; $61
	dw MewtwoRadio9       ; $62
	dw MewtwoRadio10      ; $63
; Johto Fishing Radio
	dw JohtoFishingRadio2 ; $64
; Kanto Fishing Radio
	dw KantoFishingRadio2 ; $65
	assert_table_length NUM_RADIO_SEGMENTS

PrintRadioLine:
	ld [wNextRadioLine], a
	ld hl, wRadioText
	ld a, [wNumRadioLinesPrinted]
	cp 2
	jr nc, .print
	inc hl
	ld [hl], TX_START
	inc a
	ld [wNumRadioLinesPrinted], a
	cp 2
	jr nz, .print
	bccoord 1, 16
	call PlaceHLTextAtBC
	jr .skip
.print
	call PrintTextboxText
.skip
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

RadioScroll:
	ld hl, wRadioTextDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wNextRadioLine]
	ld [wCurRadioLine], a
	ld a, [wNumRadioLinesPrinted]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPKMNTalk1:
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	call StartRadioStation
	ld hl, OPT_IntroText1
	ld a, OAKS_POKEMON_TALK_2
	jr OaksPKMNTalkNextRadioLine1

OaksPKMNTalk2:
	ld hl, OPT_IntroText2
	ld a, OAKS_POKEMON_TALK_3
	jr OaksPKMNTalkNextRadioLine1

OaksPKMNTalk3:
	ld hl, OPT_IntroText3
	ld a, OAKS_POKEMON_TALK_4
OaksPKMNTalkNextRadioLine1:
	jp NextRadioLine

OaksPKMNTalk4:
; Choose a random route, and a random Pokemon from that route.
.sample
	call Random
	and %11111
	cp (OaksPKMNTalkRoutes.End - OaksPKMNTalkRoutes) / 2
	jr nc, .sample
	ld hl, OaksPKMNTalkRoutes
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	; bc now contains the chosen map's group and number indices.
	push bc

	; Search the JohtoGrassWildMons array for the chosen map.
	ld hl, JohtoGrassWildMons
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .overflow
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, GRASS_WILDDATA_LENGTH
	add hl, de
	jr .loop

.done
	; Point hl to the list of morning Pokémon., skipping percentages
rept 4
	inc hl
endr
	; Generate a number, either 0, 1, or 2, to choose a time of day.
.loop2
	call Random
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	jr z, .loop2

	ld bc, 2 * NUM_GRASSMON
	call AddNTimes
.loop3
	; Choose one of the middle three Pokemon.
	call Random
	maskbits NUM_GRASSMON
	cp 2
	jr c, .loop3
	cp 5
	jr nc, .loop3
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	inc hl ; skip level
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wNamedObjectIndex], a
	ld [wCurPartySpecies], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	; Now that we've chosen our wild Pokemon,
	; let's recover the map index info and get its name.
	pop bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, OPT_OakText1
	call CopyRadioTextToRAM
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

.overflow
	pop bc
	ld a, OAKS_POKEMON_TALK
	jp PrintRadioLine

INCLUDE "data/radio/oaks_pkmn_talk_routes.asm"

OaksPKMNTalk5:
	ld hl, OPT_OakText2
	ld a, OAKS_POKEMON_TALK_6
	jr OaksPKMNTalkNextRadioLine2

OaksPKMNTalk6:
	ld hl, OPT_OakText3
	ld a, OAKS_POKEMON_TALK_7
OaksPKMNTalkNextRadioLine2:
	jp NextRadioLine

OPT_IntroText1:
	text_far _OPT_IntroText1
	text_end

OPT_IntroText2:
	text_far _OPT_IntroText2
	text_end

OPT_IntroText3:
	text_far _OPT_IntroText3
	text_end

OPT_OakText1:
	text_far _OPT_OakText1
	text_end

OPT_OakText2:
	text_far _OPT_OakText2
	text_end

OPT_OakText3:
	text_far _OPT_OakText3
	text_end

OaksPKMNTalk7:
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jr OaksPKMNTalkNextRadioLine2

OPT_MaryText1:
	text_far _OPT_MaryText1
	text_end

OaksPKMNTalk8:
	; 0-15 are all valid indexes into .Adverbs,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADVERBS
	assert_power_of_2 NUM_OAKS_POKEMON_TALK_ADVERBS
	ld e, a
	ld d, 0
	ld hl, .Adverbs
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine

.Adverbs:
	table_width 2, OaksPKMNTalk8.Adverbs
	dw .OPT_SweetAdorablyText
	dw .OPT_WigglySlicklyText
	dw .OPT_AptlyNamedText
	dw .OPT_UndeniablyKindOfText
	dw .OPT_UnbearablyText
	dw .OPT_WowImpressivelyText
	dw .OPT_AlmostPoisonouslyText
	dw .OPT_SensuallyText
	dw .OPT_MischievouslyText
	dw .OPT_TopicallyText
	dw .OPT_AddictivelyText
	dw .OPT_LooksInWaterText
	dw .OPT_EvolutionMustBeText
	dw .OPT_ProvocativelyText
	dw .OPT_FlippedOutText
	dw .OPT_HeartMeltinglyText
	assert_table_length NUM_OAKS_POKEMON_TALK_ADVERBS

.OPT_SweetAdorablyText:
	text_far _OPT_SweetAdorablyText
	text_end

.OPT_WigglySlicklyText:
	text_far _OPT_WigglySlicklyText
	text_end

.OPT_AptlyNamedText:
	text_far _OPT_AptlyNamedText
	text_end

.OPT_UndeniablyKindOfText:
	text_far _OPT_UndeniablyKindOfText
	text_end

.OPT_UnbearablyText:
	text_far _OPT_UnbearablyText
	text_end

.OPT_WowImpressivelyText:
	text_far _OPT_WowImpressivelyText
	text_end

.OPT_AlmostPoisonouslyText:
	text_far _OPT_AlmostPoisonouslyText
	text_end

.OPT_SensuallyText:
	text_far _OPT_SensuallyText
	text_end

.OPT_MischievouslyText:
	text_far _OPT_MischievouslyText
	text_end

.OPT_TopicallyText:
	text_far _OPT_TopicallyText
	text_end

.OPT_AddictivelyText:
	text_far _OPT_AddictivelyText
	text_end

.OPT_LooksInWaterText:
	text_far _OPT_LooksInWaterText
	text_end

.OPT_EvolutionMustBeText:
	text_far _OPT_EvolutionMustBeText
	text_end

.OPT_ProvocativelyText:
	text_far _OPT_ProvocativelyText
	text_end

.OPT_FlippedOutText:
	text_far _OPT_FlippedOutText
	text_end

.OPT_HeartMeltinglyText:
	text_far _OPT_HeartMeltinglyText
	text_end

OaksPKMNTalk9:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADJECTIVES
	assert_power_of_2 NUM_OAKS_POKEMON_TALK_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOaksPKMNTalkSegmentCounter]
	dec a
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_4
	jr nz, .ok
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_10
.ok
	jp NextRadioLine

.Adjectives:
	table_width 2, OaksPKMNTalk9.Adjectives
	dw .OPT_CuteText
	dw .OPT_WeirdText
	dw .OPT_PleasantText
	dw .OPT_BoldSortOfText
	dw .OPT_FrighteningText
	dw .OPT_SuaveDebonairText
	dw .OPT_PowerfulText
	dw .OPT_ExcitingText
	dw .OPT_GroovyText
	dw .OPT_InspiringText
	dw .OPT_FriendlyText
	dw .OPT_HotHotHotText
	dw .OPT_StimulatingText
	dw .OPT_GuardedText
	dw .OPT_LovelyText
	dw .OPT_SpeedyText
	assert_table_length NUM_OAKS_POKEMON_TALK_ADJECTIVES

.OPT_CuteText:
	text_far _OPT_CuteText
	text_end

.OPT_WeirdText:
	text_far _OPT_WeirdText
	text_end

.OPT_PleasantText:
	text_far _OPT_PleasantText
	text_end

.OPT_BoldSortOfText:
	text_far _OPT_BoldSortOfText
	text_end

.OPT_FrighteningText:
	text_far _OPT_FrighteningText
	text_end

.OPT_SuaveDebonairText:
	text_far _OPT_SuaveDebonairText
	text_end

.OPT_PowerfulText:
	text_far _OPT_PowerfulText
	text_end

.OPT_ExcitingText:
	text_far _OPT_ExcitingText
	text_end

.OPT_GroovyText:
	text_far _OPT_GroovyText
	text_end

.OPT_InspiringText:
	text_far _OPT_InspiringText
	text_end

.OPT_FriendlyText:
	text_far _OPT_FriendlyText
	text_end

.OPT_HotHotHotText:
	text_far _OPT_HotHotHotText
	text_end

.OPT_StimulatingText:
	text_far _OPT_StimulatingText
	text_end

.OPT_GuardedText:
	text_far _OPT_GuardedText
	text_end

.OPT_LovelyText:
	text_far _OPT_LovelyText
	text_end

.OPT_SpeedyText:
	text_far _OPT_SpeedyText
	text_end

OaksPKMNTalk10:
	farcall RadioMusicRestartPokemonChannel
	ld hl, OPT_RestartText
	call PrintText
	call WaitBGMap
	ld hl, OPT_PokemonChannelText
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

OPT_PokemonChannelText:
	text_far _OPT_PokemonChannelText
OPT_RestartText:
	text_end

OaksPKMNTalk11:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jr OaksPKMNTalkPlaceRadioString

.pokemon_string
	db "#MON@"

OaksPKMNTalk12:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
OaksPKMNTalkPlaceRadioString:
	jp PlaceRadioString

.pokemon_channel_string
	db "#MON Channel@"

OaksPKMNTalk13:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, LoadTerminatorCharacter
	ld a, OAKS_POKEMON_TALK_14
	jr OaksPKMNTalkPlaceRadioString

LoadTerminatorCharacter:
	db "@"

OaksPKMNTalk14:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	ld de, MUSIC_POKEMON_TALK
	callfar RadioMusicRestartDE
	ld hl, LoadTerminatorCharacter
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wNextRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 10
	ld [wRadioTextDelay], a
	ret

PlaceRadioString:
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	jp PlaceString

CopyBottomLineToTopLine:
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine:
	hlcoord 1, 15
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	jp ByteFill

PokedexShow1:
	call StartRadioStation
.loop
	call Random
	cp NUM_POKEMON
	jr nc, .loop
	ld c, a
	push bc
	ld a, c
	call CheckCaughtMon
	pop bc
	jr z, .loop
	inc c
	ld a, c
	ld [wCurPartySpecies], a
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, PokedexShowText
	ld a, POKEDEX_SHOW_2
	jp NextRadioLine

PokedexShow2:
	ld a, [wCurPartySpecies]
	dec a
	ld hl, PokedexDataPointerTable
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	; b = bank
	ld a, BANK(PokedexDataPointerTable)
	call GetFarByte
	ld b, a
	inc hl
	; hl = address
	ld a, BANK(PokedexDataPointerTable)
	call GetFarWord
	ld a, b
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
rept 4
	inc hl
endr
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, POKEDEX_SHOW_3
	jr PokedexShowPrintRadioLine

PokedexShow3:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_4
	jr PokedexShowPrintRadioLine

PokedexShow4:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_5
	jr PokedexShowPrintRadioLine

PokedexShow5:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_6
PokedexShowPrintRadioLine:
	jp PrintRadioLine

PokedexShow6:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_7
	jr PokedexShowPrintRadioLine

PokedexShow7:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_8
	jr PokedexShowPrintRadioLine

PokedexShow8:
	call CopyDexEntry
	ld a, POKEDEX_SHOW
	jr PokedexShowPrintRadioLine

CopyDexEntry:
	ld a, [wPokedexShowPointerAddr]
	ld l, a
	ld a, [wPokedexShowPointerAddr + 1]
	ld h, a
	ld a, [wPokedexShowPointerBank]
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	jp CopyDexEntryPart2

CopyDexEntryPart1:
	ld de, wPokedexShowPointerBank
	ld bc, SCREEN_WIDTH - 1
	call FarCopyBytes
	ld hl, wPokedexShowPointerAddr
	ld [hl], TX_START
	inc hl
	ld [hl], "<LINE>"
	inc hl
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp "<NEXT>"
	ret z
	cp "<DEXEND>"
	ret z
	jr .loop

CopyDexEntryPart2:
	ld d, a
.loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr z, .okay
	cp "<NEXT>"
	jr z, .okay
	cp "<DEXEND>"
	jr nz, .loop
.okay
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, d
	ld [wPokedexShowPointerBank], a
	ret

PokedexShowText:
	text_far _PokedexShowText
	text_end

BenMonMusic1:
	call StartPokemonMusicChannel
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jr MonMusicNextRadioLine

BenMonMusic2:
	ld hl, BenIntroText2
	ld a, POKEMON_MUSIC_3
	jr MonMusicNextRadioLine

BenMonMusic3:
	ld hl, BenIntroText3
	ld a, POKEMON_MUSIC_4
	jr MonMusicNextRadioLine

FernMonMusic1:
	call StartPokemonMusicChannel
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jr MonMusicNextRadioLine

FernMonMusic2:
	ld hl, FernIntroText2
	ld a, POKEMON_MUSIC_4
	jr MonMusicNextRadioLine

BenFernMusic4:
	ld hl, BenFernText1
	ld a, POKEMON_MUSIC_5
	jr MonMusicNextRadioLine

BenFernMusic5:
	call GetWeekday
	and 1
	ld hl, BenFernText2A
	jr z, .SunTueThurSun
	ld hl, BenFernText2B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_6
MonMusicNextRadioLine:
	jp NextRadioLine

BenFernMusic6:
	call GetWeekday
	and 1
	ld hl, BenFernText3A
	jr z, .SunTueThurSun
	ld hl, BenFernText3B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_7
	jr MonMusicNextRadioLine

StartPokemonMusicChannel:
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .SunTueThurSun
	ld de, MUSIC_POKEMON_LULLABY
.SunTueThurSun:
	callfar RadioMusicRestartDE
BenFernMusic7:
	ret

BenIntroText1:
	text_far _BenIntroText1
	text_end

BenIntroText2:
	text_far _BenIntroText2
	text_end

BenIntroText3:
	text_far _BenIntroText3
	text_end

FernIntroText1:
	text_far _FernIntroText1
	text_end

FernIntroText2:
	text_far _FernIntroText2
	text_end

BenFernText1:
	text_far _BenFernText1
	text_end

BenFernText2A:
	text_far _BenFernText2A
	text_end

BenFernText2B:
	text_far _BenFernText2B
	text_end

BenFernText3A:
	text_far _BenFernText3A
	text_end

BenFernText3B:
	text_far _BenFernText3B
	text_end

LuckyNumberShow1:
	call StartRadioStation
	callfar CheckLuckyNumberShowFlag
	jr nz, .dontreset
	callfar ResetLuckyNumberShowFlag
.dontreset
	ld hl, LC_Text1
	ld a, LUCKY_NUMBER_SHOW_2
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow2:
	ld hl, LC_Text2
	ld a, LUCKY_NUMBER_SHOW_3
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow3:
	ld hl, LC_Text3
	ld a, LUCKY_NUMBER_SHOW_4
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow4:
	ld hl, LC_Text4
	ld a, LUCKY_NUMBER_SHOW_5
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow5:
	ld hl, LC_Text5
	ld a, LUCKY_NUMBER_SHOW_6
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow6:
	ld hl, LC_Text6
	ld a, LUCKY_NUMBER_SHOW_7
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow7:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_8
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow8:
	ld hl, wStringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer1 + 5], a
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_9
LuckyNumberShowNextRadioLine:
	jp NextRadioLine

LuckyNumberShow9:
	ld hl, LC_Text9
	ld a, LUCKY_NUMBER_SHOW_10
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow10:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_11
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow11:
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_12
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow12:
	ld hl, LC_Text10
	ld a, LUCKY_NUMBER_SHOW_13
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow13:
	ld hl, LC_Text11
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow14:
	ld hl, LC_DragText1
	ld a, LUCKY_NUMBER_SHOW_15
	jr LuckyNumberShowNextRadioLine

LuckyNumberShow15:
	ld hl, LC_DragText2
	ld a, LUCKY_CHANNEL
	jr LuckyNumberShowNextRadioLine

LC_Text1:
	text_far _LC_Text1
	text_end

LC_Text2:
	text_far _LC_Text2
	text_end

LC_Text3:
	text_far _LC_Text3
	text_end

LC_Text4:
	text_far _LC_Text4
	text_end

LC_Text5:
	text_far _LC_Text5
	text_end

LC_Text6:
	text_far _LC_Text6
	text_end

LC_Text7:
	text_far _LC_Text7
	text_end

LC_Text8:
	text_far _LC_Text8
	text_end

LC_Text9:
	text_far _LC_Text9
	text_end

LC_Text10:
	text_far _LC_Text10
	text_end

LC_Text11:
	text_far _LC_Text11
	text_end

LC_DragText1:
	text_far _LC_DragText1
	text_end

LC_DragText2:
	text_far _LC_DragText2
	text_end

PeoplePlaces1:
	call StartRadioStation
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jr PeoplePlacesNextRadioLine

PeoplePlaces2:
	ld hl, PnP_Text2
	ld a, PLACES_AND_PEOPLE_3
	jr PeoplePlacesNextRadioLine

PeoplePlaces3:
	ld hl, PnP_Text3
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, PeoplePlacesNextRadioLine
	ld a, PLACES_AND_PEOPLE_6 ; Places
PeoplePlacesNextRadioLine:
	jp NextRadioLine

PnP_Text1:
	text_far _PnP_Text1
	text_end

PnP_Text2:
	text_far _PnP_Text2
	text_end

PnP_Text3:
	text_far _PnP_Text3
	text_end

PeoplePlaces4: ; People
	call Random
	maskbits NUM_TRAINER_CLASSES
	inc a
	cp NUM_TRAINER_CLASSES ; exclude MYSTICALMAN
	jr nc, PeoplePlaces4
	push af
	ld hl, PnP_HiddenPeople
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .ok
	ld hl, PnP_HiddenPeople_BeatE4
	ld a, [wKantoBadges]
	cp %11111111 ; all badges
	jr nz, .ok
	ld hl, PnP_HiddenPeople_BeatKanto
.ok
	pop af
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	callfar GetTrainerClassName
	ld de, wStringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	callfar GetTrainerName
	ld hl, PnP_Text4
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_people.asm"

PnP_Text4:
	text_far _PnP_Text4
	text_end

PeoplePlaces5:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PEOPLE_ADJECTIVES
	assert_power_of_2 NUM_PNP_PEOPLE_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

.Adjectives:
	table_width 2, PeoplePlaces5.Adjectives
	dw PnP_CuteText
	dw PnP_LazyText
	dw PnP_HappyText
	dw PnP_NoisyText
	dw PnP_PrecociousText
	dw PnP_BoldText
	dw PnP_PickyText
	dw PnP_SortOfOKText
	dw PnP_SoSoText
	dw PnP_GreatText
	dw PnP_MyTypeText
	dw PnP_CoolText
	dw PnP_InspiringText
	dw PnP_WeirdText
	dw PnP_RightForMeText
	dw PnP_OddText
	assert_table_length NUM_PNP_PEOPLE_ADJECTIVES

PnP_CuteText:
	text_far _PnP_CuteText
	text_end

PnP_LazyText:
	text_far _PnP_LazyText
	text_end

PnP_HappyText:
	text_far _PnP_HappyText
	text_end

PnP_NoisyText:
	text_far _PnP_NoisyText
	text_end

PnP_PrecociousText:
	text_far _PnP_PrecociousText
	text_end

PnP_BoldText:
	text_far _PnP_BoldText
	text_end

PnP_PickyText:
	text_far _PnP_PickyText
	text_end

PnP_SortOfOKText:
	text_far _PnP_SortOfOKText
	text_end

PnP_SoSoText:
	text_far _PnP_SoSoText
	text_end

PnP_GreatText:
	text_far _PnP_GreatText
	text_end

PnP_MyTypeText:
	text_far _PnP_MyTypeText
	text_end

PnP_CoolText:
	text_far _PnP_CoolText
	text_end

PnP_InspiringText:
	text_far _PnP_InspiringText
	text_end

PnP_WeirdText:
	text_far _PnP_WeirdText
	text_end

PnP_RightForMeText:
	text_far _PnP_RightForMeText
	text_end

PnP_OddText:
	text_far _PnP_OddText
	text_end

PeoplePlaces6: ; Places
	call Random
	cp (PnP_Places.End - PnP_Places) / 2
	jr nc, PeoplePlaces6
	ld hl, PnP_Places
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, PnP_Text5
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine

INCLUDE "data/radio/pnp_places.asm"

PnP_Text5:
	text_far _PnP_Text5
	text_end

PeoplePlaces7:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PLACES_ADJECTIVES
	assert_power_of_2 NUM_PNP_PLACES_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine

.Adjectives:
	table_width 2, PeoplePlaces7.Adjectives
	dw PnP_CuteText
	dw PnP_LazyText
	dw PnP_HappyText
	dw PnP_NoisyText
	dw PnP_PrecociousText
	dw PnP_BoldText
	dw PnP_PickyText
	dw PnP_SortOfOKText
	dw PnP_SoSoText
	dw PnP_GreatText
	dw PnP_MyTypeText
	dw PnP_CoolText
	dw PnP_InspiringText
	dw PnP_WeirdText
	dw PnP_RightForMeText
	dw PnP_OddText
	assert_table_length NUM_PNP_PLACES_ADJECTIVES

RocketRadio1:
	call StartRadioStation
	ld hl, RocketRadioText1
	ld a, ROCKET_RADIO_2
	jr RocketRadioNextRadioLine

RocketRadio2:
	ld hl, RocketRadioText2
	ld a, ROCKET_RADIO_3
	jr RocketRadioNextRadioLine

RocketRadio3:
	ld hl, RocketRadioText3
	ld a, ROCKET_RADIO_4
	jr RocketRadioNextRadioLine

RocketRadio4:
	ld hl, RocketRadioText4
	ld a, ROCKET_RADIO_5
	jr RocketRadioNextRadioLine

RocketRadio5:
	ld hl, RocketRadioText5
	ld a, ROCKET_RADIO_6
	jr RocketRadioNextRadioLine

RocketRadio6:
	ld hl, RocketRadioText6
	ld a, ROCKET_RADIO_7
RocketRadioNextRadioLine:
	jp NextRadioLine

RocketRadio7:
	ld hl, RocketRadioText7
	ld a, ROCKET_RADIO_8
	jr RocketRadioNextRadioLine

RocketRadio8:
	ld hl, RocketRadioText8
	ld a, ROCKET_RADIO_9
	jr RocketRadioNextRadioLine

RocketRadio9:
	ld hl, RocketRadioText9
	ld a, ROCKET_RADIO_10
	jr RocketRadioNextRadioLine

RocketRadio10:
	ld hl, RocketRadioText10
	ld a, ROCKET_RADIO
	jr RocketRadioNextRadioLine

RocketRadioText1:
	text_far _RocketRadioText1
	text_end

RocketRadioText2:
	text_far _RocketRadioText2
	text_end

RocketRadioText3:
	text_far _RocketRadioText3
	text_end

RocketRadioText4:
	text_far _RocketRadioText4
	text_end

RocketRadioText5:
	text_far _RocketRadioText5
	text_end

RocketRadioText6:
	text_far _RocketRadioText6
	text_end

RocketRadioText7:
	text_far _RocketRadioText7
	text_end

RocketRadioText8:
	text_far _RocketRadioText8
	text_end

RocketRadioText9:
	text_far _RocketRadioText9
	text_end

RocketRadioText10:
	text_far _RocketRadioText10
	text_end

PokeFluteRadio:
UnownRadio:
EvolutionRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

BuenasPassword1:
; Determine if we need to be here
	call BuenasPasswordCheckTime
	jp nc, .PlayPassword
	ld a, [wNumRadioLinesPrinted]
	and a
	jp z, BuenasPassword20
	jp BuenasPassword8

.PlayPassword:
	call StartRadioStation
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld de, BuenasPasswordChannelName
	hlcoord 2, 9
	call PlaceString
	pop af
	ldh [hBGMapMode], a
	ld hl, BuenaRadioText1
	ld a, BUENAS_PASSWORD_2
	jr BuenasPasswordNextRadioLine1

BuenasPassword2:
	ld hl, BuenaRadioText2
	ld a, BUENAS_PASSWORD_3
BuenasPasswordNextRadioLine1:
	jp NextRadioLine

BuenasPassword3:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText3
	jp c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD_4
	jr BuenasPasswordNextRadioLine1

BuenasPassword4:
	call BuenasPasswordCheckTime
	jp c, BuenasPassword8
	ld a, [wBuenasPassword]
; If we already generated the password today, we don't need to generate a new one.
	ld hl, wDailyFlags2
	bit DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	jr nz, .AlreadyGotIt
; There are only 11 groups to choose from.
.greater_than_11
	call Random
	maskbits NUM_PASSWORD_CATEGORIES
	cp NUM_PASSWORD_CATEGORIES
	jr nc, .greater_than_11
; Store it in the high nybble of e.
	swap a
	ld e, a
; For each group, choose one of the three passwords.
.greater_than_three
	call Random
	maskbits NUM_PASSWORDS_PER_CATEGORY
	cp NUM_PASSWORDS_PER_CATEGORY
	jr nc, .greater_than_three
; The high nybble of wBuenasPassword will now contain the password group index, and the low nybble contains the actual password.
	add e
	ld [wBuenasPassword], a
; Set the flag so that we don't generate a new password this week.
	ld hl, wDailyFlags2
	set DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
.AlreadyGotIt:
	ld c, a
	call GetBuenasPassword
	ld hl, BuenaRadioText4
	ld a, BUENAS_PASSWORD_5
	jp NextRadioLine

GetBuenasPassword:
; The password indices are held in c.  High nybble contains the group index, low nybble contains the word index.
; Load the password group pointer in hl.
	ld a, c
	swap a
	and $f
	ld hl, BuenasPasswordTable
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Get the password type and store it in b.
	ld a, [hli]
	ld b, a
	push hl
	inc hl
; Get the password index.
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, .StringFunctionJumptable
	ld e, b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; de now contains the pointer to the value of this week's password, in Blue Card Points.
	call _hl_
	pop hl
	ld c, [hl]
	ret

.StringFunctionJumptable:
; entries correspond to BUENA_* constants
	table_width 2, GetBuenasPassword.StringFunctionJumptable
	dw .Mon       ; BUENA_MON
	dw .Item      ; BUENA_ITEM
	dw .Move      ; BUENA_MOVE
	dw .RawString ; BUENA_STRING
	assert_table_length NUM_BUENA_FUNCTIONS

.Mon:
	call .GetTheIndex
	jp GetPokemonName

.Item:
	call .GetTheIndex
	jp GetItemName

.Move:
	call .GetTheIndex
	jp GetMoveName

.GetTheIndex:
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ret

.RawString:
; Get the string from the table...
	ld a, c
	and a
	jr z, .skip
.read_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .read_loop
	dec c
	jr nz, .read_loop
; ... and copy it into wStringBuffer1.
.skip
	ld hl, wStringBuffer1
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_loop
	ld de, wStringBuffer1
	ret

INCLUDE "data/radio/buenas_passwords.asm"

BuenasPassword5:
	ld hl, BuenaRadioText5
	ld a, BUENAS_PASSWORD_6
	jr BuenasPasswordNextRadioLine2

BuenasPassword6:
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_7
	jr BuenasPasswordNextRadioLine2

BuenasPassword7:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText7
	jr c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD
	jr BuenasPasswordNextRadioLine2

BuenasPasswordAfterMidnight:
	push hl
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	pop hl
	ld a, BUENAS_PASSWORD_8
	jr BuenasPasswordNextRadioLine2

BuenasPassword8:
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_9
	jr BuenasPasswordNextRadioLine2

BuenasPassword9:
	ld hl, BuenaRadioMidnightText1
	ld a, BUENAS_PASSWORD_10
	jr BuenasPasswordNextRadioLine2

BuenasPassword10:
	ld hl, BuenaRadioMidnightText2
	ld a, BUENAS_PASSWORD_11
BuenasPasswordNextRadioLine2:
	jp NextRadioLine

BuenasPassword11:
	ld hl, BuenaRadioMidnightText3
	ld a, BUENAS_PASSWORD_12
	jr BuenasPasswordNextRadioLine2

BuenasPassword12:
	ld hl, BuenaRadioMidnightText4
	ld a, BUENAS_PASSWORD_13
	jr BuenasPasswordNextRadioLine2

BuenasPassword13:
	ld hl, BuenaRadioMidnightText5
	ld a, BUENAS_PASSWORD_14
	jr BuenasPasswordNextRadioLine2

BuenasPassword14:
	ld hl, BuenaRadioMidnightText6
	ld a, BUENAS_PASSWORD_15
	jr BuenasPasswordNextRadioLine2

BuenasPassword15:
	ld hl, BuenaRadioMidnightText7
	ld a, BUENAS_PASSWORD_16
	jr BuenasPasswordNextRadioLine2

BuenasPassword16:
	ld hl, BuenaRadioMidnightText8
	ld a, BUENAS_PASSWORD_17
	jr BuenasPasswordNextRadioLine2

BuenasPassword17:
	ld hl, BuenaRadioMidnightText9
	ld a, BUENAS_PASSWORD_18
	jr BuenasPasswordNextRadioLine2

BuenasPassword18:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_19
	jr BuenasPasswordNextRadioLine2

BuenasPassword19:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_20
	jr BuenasPasswordNextRadioLine2

BuenasPassword20:
	ldh a, [hBGMapMode]
	push af
	farcall NoRadioMusic
	farcall NoRadioName
	pop af
	ldh [hBGMapMode], a
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	ld a, BUENAS_PASSWORD
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jr BuenasPasswordNextRadioLine2

BuenasPassword21:
	ld a, BUENAS_PASSWORD
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	call BuenasPasswordCheckTime
	jp nc, BuenasPassword1
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jr BuenasPasswordNextRadioLine2

BuenasPasswordCheckTime:
	call UpdateTime
	ldh a, [hHours]
	cp NITE_HOUR
	ret

BuenasPasswordChannelName:
	db "BUENA'S PASSWORD@"

BuenaRadioText1:
	text_far _BuenaRadioText1
	text_end

BuenaRadioText2:
	text_far _BuenaRadioText2
	text_end

BuenaRadioText3:
	text_far _BuenaRadioText3
	text_end

BuenaRadioText4:
	text_far _BuenaRadioText4
	text_end

BuenaRadioText5:
	text_far _BuenaRadioText5
	text_end

BuenaRadioText6:
	text_far _BuenaRadioText6
	text_end

BuenaRadioText7:
	text_far _BuenaRadioText7
	text_end

BuenaRadioMidnightText1:
	text_far _BuenaRadioMidnightText1
	text_end

BuenaRadioMidnightText2:
	text_far _BuenaRadioMidnightText2
	text_end

BuenaRadioMidnightText3:
	text_far _BuenaRadioMidnightText3
	text_end

BuenaRadioMidnightText4:
	text_far _BuenaRadioMidnightText4
	text_end

BuenaRadioMidnightText5:
	text_far _BuenaRadioMidnightText5
	text_end

BuenaRadioMidnightText6:
	text_far _BuenaRadioMidnightText6
	text_end

BuenaRadioMidnightText7:
	text_far _BuenaRadioMidnightText7
	text_end

BuenaRadioMidnightText8:
	text_far _BuenaRadioMidnightText8
	text_end

BuenaRadioMidnightText9:
	text_far _BuenaRadioMidnightText9
	text_end

BuenaRadioMidnightText10:
	text_far _BuenaRadioMidnightText10
	text_end

BuenaOffTheAirText:
	text_far _BuenaOffTheAirText
	text_end

MewtwoRadio1:
	call StartRadioStation
	ld hl, MewtwoRadioText1
	ld a, MEWTWO_RADIO_2
	jr NextRadioLine

MewtwoRadio2:
	ld hl, MewtwoRadioText2
	ld a, MEWTWO_RADIO_3
	jr NextRadioLine

MewtwoRadio3:
	ld hl, MewtwoRadioText3
	ld a, MEWTWO_RADIO_4
	jr NextRadioLine

MewtwoRadio4:
	ld hl, MewtwoRadioText4
	ld a, MEWTWO_RADIO_5
	jr NextRadioLine

MewtwoRadio5:
	ld hl, MewtwoRadioText5
	ld a, MEWTWO_RADIO_6
	jr NextRadioLine

MewtwoRadio6:
	ld hl, MewtwoRadioText6
	ld a, MEWTWO_RADIO_7
	; fallthrough

NextRadioLine:
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine

MewtwoRadio7:
	ld hl, MewtwoRadioText7
	ld a, MEWTWO_RADIO_8
	jr NextRadioLine

MewtwoRadio8:
	ld hl, MewtwoRadioText8
	ld a, MEWTWO_RADIO_9
	jr NextRadioLine

MewtwoRadio9:
	ld hl, MewtwoRadioText9
	ld a, MEWTWO_RADIO_10
	jr NextRadioLine

MewtwoRadio10:
	ld hl, MewtwoRadioText10
	ld a, MEWTWO_RADIO
	jr NextRadioLine

MewtwoRadioText1:
	text_far _MewtwoRadioText1
	text_end

MewtwoRadioText2:
	text_far _MewtwoRadioText2
	text_end

MewtwoRadioText3:
	text_far _MewtwoRadioText3
	text_end

MewtwoRadioText4:
	text_far _MewtwoRadioText4
	text_end

MewtwoRadioText5:
	text_far _MewtwoRadioText5
	text_end

MewtwoRadioText6:
	text_far _MewtwoRadioText6
	text_end

MewtwoRadioText7:
	text_far _MewtwoRadioText7
	text_end

MewtwoRadioText8:
	text_far _MewtwoRadioText8
	text_end

MewtwoRadioText9:
	text_far _MewtwoRadioText9
	text_end

MewtwoRadioText10:
	text_far _MewtwoRadioText10
	text_end

MergeFishingRadio1A:
	call StartRadioStation
	; Fishing group
	; d = map num
	; e = map group
	ld a, [wMapGroup]
	ld e, a
	ld a, [wMapNumber]
	ld d, a
	; given map info in 'de'
	; return: string ptr in 'de'
	; if 'de' is zero, no fishing group on map
	farcall GetMapsFishGroup
	ld a, BANK(FishGroups_Names)
	hlcoord 1, 14
	jp PlaceFarString

JohtoFishingRadio1:
	call MergeFishingRadio1A
	ld a, JOHTO_FISHING_RADIO2
	jr MergeFishingRadio1B

KantoFishingRadio1:
	call MergeFishingRadio1A
	ld a, KANTO_FISHING_RADIO2
	; fallthrough

MergeFishingRadio1B:
	ld [wNextRadioLine], a
	ld a, 1
	ld [wNumRadioLinesPrinted], a	
	ret

JohtoFishingRadio2:
	ld a, JOHTO_FISHING_RADIO2
	jr MergeFishingRadio2

KantoFishingRadio2:
	ld a, KANTO_FISHING_RADIO2
	; fallthrough

MergeFishingRadio2:
	ld [wNextRadioLine], a
	ld a, 1
	ld [wNumRadioLinesPrinted], a

	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

CopyRadioTextToRAM:
	ld a, [hl]
	cp TX_FAR
	jp z, FarCopyRadioText
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	jp CopyBytes

StartRadioStation:
	ld a, [wNumRadioLinesPrinted]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wCurRadioLine]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	callfar RadioMusicRestartDE
	ret

INCLUDE "data/radio/channel_music.asm"
