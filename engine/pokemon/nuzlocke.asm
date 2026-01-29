NuzlockeCheckAreaFlag::
; return in wScriptVar TRUE for an invalid encounter, FALSE for valid
	xor a
	ld [wScriptVar], a

; catch anything if Nuzlocke mode is off
	ld a, [wOptions2]
	bit NUZLOCKE, a
	ret z

; don't check battle data in the field (gift/trade/egg)
	ld a, [wBattleMode]
	and a
	jr z, .check

; wTempEnemyMonSpecies accounts for Transform
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	jr z, .check

; dupe
	ld a, TRUE
	ld [wScriptVar], a
	ret

.check
	ld d, CHECK_FLAG
	jr NuzlockeAreaFlagMerge

NuzlockeSetAreaFlag::
; don't check battle data in the field (gift/trade/egg)
	ld a, [wBattleMode]
	and a
	jr z, .set

; trainer battle
	dec a
	ret nz

; catching tutorial
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	ret z

; don't set flag if a roamer fled or used Roar (or if player ran), but do if it was caught or KO'd
	cp BATTLETYPE_ROAMING
	jr nz, .skip
	ld a, [wForcedSwitch]
	and a
	ret nz
.skip

; dupe
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret nz

; don't set flags until getting first Poke Balls from Elm's aide
	ld b, CHECK_FLAG
	ld de, EVENT_GAVE_MYSTERY_EGG_TO_ELM
	call EventFlagAction
	ld a, c
	and a
	ret z

.set
	ld d, SET_FLAG
	; fallthrough

NuzlockeAreaFlagMerge:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld c, a
	ld a, d
	ld b, a
	ld a, c
	cp LANDMARK_FAST_SHIP
	jp z, .fast_ship
	cp LANDMARK_ROUTE_28
	jp z, .route_28
	cp LANDMARK_TOHJO_FALLS
	jp z, .tohjo_falls
	cp LANDMARK_ROUTE_27
	jp z, .route_27
	cp LANDMARK_ROUTE_26
	jp z, .route_26
	cp LANDMARK_INDIGO_PLATEAU
	jp z, .indigo_plateau
	cp LANDMARK_ROUTE_23
	jp z, .route_23
	cp LANDMARK_VICTORY_ROAD
	jp z, .victory_road
	cp LANDMARK_ROUTE_22
	jp z, .route_22
	cp LANDMARK_ROUTE_21
	jp z, .route_21
	cp LANDMARK_CINNABAR_ISLAND
	jp z, .cinnabar_island
	cp LANDMARK_SEAFOAM_ISLANDS
	jp z, .seafoam_islands
	cp LANDMARK_ROUTE_20
	jp z, .route_20
	cp LANDMARK_ROUTE_19
	jp z, .route_19
	cp LANDMARK_SAFARI_ZONE
	jp z, .safari_zone
	cp LANDMARK_FUCHSIA_CITY
	jp z, .fuchsia_city
	cp LANDMARK_ROUTE_18
	jp z, .route_18
	cp LANDMARK_ROUTE_17
	jp z, .route_17
	cp LANDMARK_ROUTE_16
	jp z, .route_16
	cp LANDMARK_ROUTE_15
	jp z, .route_15
	cp LANDMARK_ROUTE_14
	jp z, .route_14
	cp LANDMARK_ROUTE_13
	jp z, .route_13
	cp LANDMARK_ROUTE_12
	jp z, .route_12
	cp LANDMARK_ROUTE_11
	jp z, .route_11
	cp LANDMARK_SILPH_CO
	jp z, .silph_co
	cp LANDMARK_SAFFRON_CITY
	jp z, .saffron_city
	cp LANDMARK_CELADON_CITY
	jp z, .celadon_city
	cp LANDMARK_LAV_RADIO_TOWER
	jp z, .lav_radio_tower
	cp LANDMARK_LAVENDER_TOWN
	jp z, .lavender_town
	cp LANDMARK_POWER_PLANT
	jp z, .power_plant
	cp LANDMARK_ROUTE_10
	jp z, .route_10
	cp LANDMARK_ROCK_TUNNEL
	jp z, .rock_tunnel
	cp LANDMARK_ROUTE_9
	jp z, .route_9
	cp LANDMARK_ROUTE_8
	jp z, .route_8
	cp LANDMARK_ROUTE_7
	jp z, .route_7
	cp LANDMARK_DIGLETTS_CAVE
	jp z, .digletts_cave
	cp LANDMARK_VERMILION_CITY
	jp z, .vermilion_city
	cp LANDMARK_ROUTE_6
	jp z, .route_6
	cp LANDMARK_UNDERGROUND_PATH
	jp z, .underground_path
	cp LANDMARK_ROUTE_5
	jp z, .route_5
	cp LANDMARK_CERULEAN_CAVE
	jp z, .cerulean_cave
	cp LANDMARK_ROUTE_25
	jp z, .route_25
	cp LANDMARK_ROUTE_24
	jp z, .route_24
	cp LANDMARK_CERULEAN_CITY
	jp z, .cerulean_city
	cp LANDMARK_ROUTE_4
	jp z, .route_4
	cp LANDMARK_MT_MOON
	jp z, .mt_moon
	cp LANDMARK_ROUTE_3
	jp z, .route_3
	cp LANDMARK_PEWTER_CITY
	jp z, .pewter_city
	cp LANDMARK_VIRIDIAN_FOREST
	jp z, .viridian_forest
	cp LANDMARK_ROUTE_2
	jp z, .route_2
	cp LANDMARK_VIRIDIAN_CITY
	jp z, .viridian_city
	cp LANDMARK_ROUTE_1
	jp z, .route_1
	cp LANDMARK_PALLET_TOWN
	jp z, .pallet_town
	cp LANDMARK_SILVER_CAVE
	jp z, .silver_cave
	cp LANDMARK_ROUTE_46
	jp z, .route_46
	cp LANDMARK_DARK_CAVE
	jp z, .dark_cave
	cp LANDMARK_ROUTE_45
	jp z, .route_45
	cp LANDMARK_DRAGONS_DEN
	jp z, .dragons_den
	cp LANDMARK_BLACKTHORN_CITY
	jp z, .blackthorn_city
	cp LANDMARK_ICE_PATH
	jp z, .ice_path
	cp LANDMARK_ROUTE_44
	jp z, .route_44
	cp LANDMARK_LAKE_OF_RAGE
	jp z, .lake_of_rage
	cp LANDMARK_ROUTE_43
	jp z, .route_43
	cp LANDMARK_MAHOGANY_TOWN
	jp z, .mahogany_town
	cp LANDMARK_MT_MORTAR
	jp z, .mt_mortar
	cp LANDMARK_ROUTE_42
	jp z, .route_42
	cp LANDMARK_CIANWOOD_CITY
	jp z, .ciandwood_city
	cp LANDMARK_ROUTE_41
	jp z, .route_41
	cp LANDMARK_WHIRL_ISLANDS
	jp z, .whirl_islands
	cp LANDMARK_ROUTE_40
	jp z, .route_40
	cp LANDMARK_BATTLE_TOWER
	jp z, .battle_tower
	cp LANDMARK_LIGHTHOUSE
	jp z, .lighthouse
	cp LANDMARK_OLIVINE_CITY
	jp z, .olivine_city
	cp LANDMARK_ROUTE_39
	jp z, .route_39
	cp LANDMARK_ROUTE_38
	jp z, .route_38
	cp LANDMARK_BURNED_TOWER
	jp z, .burned_tower
	cp LANDMARK_TIN_TOWER
	jp z, .tin_tower
	cp LANDMARK_ECRUTEAK_CITY
	jp z, .ecruteak_city
	cp LANDMARK_ROUTE_37
	jp z, .route_37
	cp LANDMARK_ROUTE_36
	jp z, .route_36
	cp LANDMARK_NATIONAL_PARK
	jp z, .national_park
	cp LANDMARK_ROUTE_35
	jp z, .route_35
	cp LANDMARK_RADIO_TOWER
	jp z, .radio_tower
	cp LANDMARK_GOLDENROD_CITY
	jp z, .goldenrod_city
	cp LANDMARK_ROUTE_34
	jp z, .route_34
	cp LANDMARK_ILEX_FOREST
	jp z, .ilex_forest
	cp LANDMARK_SLOWPOKE_WELL
	jr z, .slowpoke_well
	cp LANDMARK_AZALEA_TOWN
	jr z, .azalea_town
	cp LANDMARK_ROUTE_33
	jr z, .route_33
	cp LANDMARK_UNION_CAVE
	jr z, .union_cave
	cp LANDMARK_RUINS_OF_ALPH
	jr z, .ruins_of_alph
	cp LANDMARK_ROUTE_32
	jr z, .route_32
	cp LANDMARK_SPROUT_TOWER
	jr z, .sprout_tower
	cp LANDMARK_VIOLET_CITY
	jr z, .violet_city
	cp LANDMARK_ROUTE_31
	jr z, .route_31
	cp LANDMARK_ROUTE_30
	jr z, .route_30
	cp LANDMARK_CHERRYGROVE_CITY
	jr z, .cherrygrove_city
	cp LANDMARK_ROUTE_29
	jr z, .route_29
	cp LANDMARK_NEW_BARK_TOWN
	jr z, .new_bark_town
.no
	ld a, TRUE
	ld [wScriptVar], a
	ret

.flag
	call EventFlagAction
	ld a, c
	and a
	jr nz, .no
	ret

.new_bark_town
	ld de, EVENT_NUZLOCKE_NEW_BARK_TOWN
	jr .flag
.route_29
	ld de, EVENT_NUZLOCKE_ROUTE_29
	jr .flag
.cherrygrove_city
	ld de, EVENT_NUZLOCKE_CHERRYGROVE_CITY
	jr .flag
.route_30
	ld de, EVENT_NUZLOCKE_ROUTE_30
	jr .flag
.route_31
	ld de, EVENT_NUZLOCKE_ROUTE_31
	jr .flag
.violet_city
	ld de, EVENT_NUZLOCKE_VIOLET_CITY
	jr .flag
.sprout_tower
	ld de, EVENT_NUZLOCKE_SPROUT_TOWER
	jr .flag
.route_32
	ld de, EVENT_NUZLOCKE_ROUTE_32
	jr .flag
.ruins_of_alph
	ld de, EVENT_NUZLOCKE_RUINS_OF_ALPH
	jr .flag
.union_cave
	ld de, EVENT_NUZLOCKE_UNION_CAVE
	jr .flag
.route_33
	ld de, EVENT_NUZLOCKE_ROUTE_33
	jr .flag
.azalea_town
	ld de, EVENT_NUZLOCKE_AZALEA_TOWN
	jr .flag
.slowpoke_well
	ld de, EVENT_NUZLOCKE_SLOWPOKE_WELL
	jr .flag
.ilex_forest
	ld de, EVENT_NUZLOCKE_ILEX_FOREST
	jr .flag
.route_34
	ld de, EVENT_NUZLOCKE_ROUTE_34
	jr .flag
.goldenrod_city
	ld de, EVENT_NUZLOCKE_GOLDENROD_CITY
	jr .flag
.radio_tower
	ld de, EVENT_NUZLOCKE_RADIO_TOWER
	jr .flag
.route_35
	ld de, EVENT_NUZLOCKE_ROUTE_35
	jr .flag
.national_park
	ld de, EVENT_NUZLOCKE_NATIONAL_PARK
	jr .flag
.route_36
	ld de, EVENT_NUZLOCKE_ROUTE_36
	jr .flag
.route_37
	ld de, EVENT_NUZLOCKE_ROUTE_37
	jr .flag
.ecruteak_city
	ld de, EVENT_NUZLOCKE_ECRUTEAK_CITY
	jr .flag
.tin_tower
	ld de, EVENT_NUZLOCKE_TIN_TOWER
	jr .flag
.burned_tower
	ld de, EVENT_NUZLOCKE_BURNED_TOWER
	jr .flag
.route_38
	ld de, EVENT_NUZLOCKE_ROUTE_38
	jp .flag
.route_39
	ld de, EVENT_NUZLOCKE_ROUTE_39
	jp .flag
.olivine_city
	ld de, EVENT_NUZLOCKE_OLIVINE_CITY
	jp .flag
.lighthouse
	ld de, EVENT_NUZLOCKE_LIGHTHOUSE
	jp .flag
.battle_tower
	ld de, EVENT_NUZLOCKE_BATTLE_TOWER
	jp .flag
.route_40
	ld de, EVENT_NUZLOCKE_ROUTE_40
	jp .flag
.whirl_islands
	ld de, EVENT_NUZLOCKE_WHIRL_ISLANDS
	jp .flag
.route_41
	ld de, EVENT_NUZLOCKE_ROUTE_41
	jp .flag
.ciandwood_city
	ld de, EVENT_NUZLOCKE_CIANWOOD_CITY
	jp .flag
.route_42
	ld de, EVENT_NUZLOCKE_ROUTE_42
	jp .flag
.mt_mortar
	ld de, EVENT_NUZLOCKE_MT_MORTAR
	jp .flag
.mahogany_town
	ld de, EVENT_NUZLOCKE_MAHOGANY_TOWN
	jp .flag
.route_43
	ld de, EVENT_NUZLOCKE_ROUTE_43
	jp .flag
.lake_of_rage
	ld de, EVENT_NUZLOCKE_LAKE_OF_RAGE
	jp .flag
.route_44
	ld de, EVENT_NUZLOCKE_ROUTE_44
	jp .flag
.ice_path
	ld de, EVENT_NUZLOCKE_ICE_PATH
	jp .flag
.blackthorn_city
	ld de, EVENT_NUZLOCKE_BLACKTHORN_CITY
	jp .flag
.dragons_den
	ld de, EVENT_NUZLOCKE_DRAGONS_DEN
	jp .flag
.route_45
	ld de, EVENT_NUZLOCKE_ROUTE_45
	jp .flag
.dark_cave
	ld de, EVENT_NUZLOCKE_DARK_CAVE
	jp .flag
.route_46
	ld de, EVENT_NUZLOCKE_ROUTE_46
	jp .flag
.silver_cave
	ld de, EVENT_NUZLOCKE_SILVER_CAVE
	jp .flag
.pallet_town
	ld de, EVENT_NUZLOCKE_PALLET_TOWN
	jp .flag
.route_1
	ld de, EVENT_NUZLOCKE_ROUTE_1
	jp .flag
.viridian_city
	ld de, EVENT_NUZLOCKE_VIRIDIAN_CITY
	jp .flag
.route_2
	ld de, EVENT_NUZLOCKE_ROUTE_2
	jp .flag
.viridian_forest
	ld de, EVENT_NUZLOCKE_VIRIDIAN_FOREST
	jp .flag
.pewter_city
	ld de, EVENT_NUZLOCKE_PEWTER_CITY
	jp .flag
.route_3
	ld de, EVENT_NUZLOCKE_ROUTE_3
	jp .flag
.mt_moon
	ld de, EVENT_NUZLOCKE_MT_MOON
	jp .flag
.route_4
	ld de, EVENT_NUZLOCKE_ROUTE_4
	jp .flag
.cerulean_city
	ld de, EVENT_NUZLOCKE_CERULEAN_CITY
	jp .flag
.route_24
	ld de, EVENT_NUZLOCKE_ROUTE_24
	jp .flag
.route_25
	ld de, EVENT_NUZLOCKE_ROUTE_25
	jp .flag
.cerulean_cave
	ld de, EVENT_NUZLOCKE_CERULEAN_CAVE
	jp .flag
.route_5
	ld de, EVENT_NUZLOCKE_ROUTE_5
	jp .flag
.underground_path
	ld de, EVENT_NUZLOCKE_UNDERGROUND_PATH
	jp .flag
.route_6
	ld de, EVENT_NUZLOCKE_ROUTE_6
	jp .flag
.vermilion_city
	ld de, EVENT_NUZLOCKE_VERMILION_CITY
	jp .flag
.digletts_cave
	ld de, EVENT_NUZLOCKE_DIGLETTS_CAVE
	jp .flag
.route_7
	ld de, EVENT_NUZLOCKE_ROUTE_7
	jp .flag
.route_8
	ld de, EVENT_NUZLOCKE_ROUTE_8
	jp .flag
.route_9
	ld de, EVENT_NUZLOCKE_ROUTE_9
	jp .flag
.rock_tunnel
	ld de, EVENT_NUZLOCKE_ROCK_TUNNEL
	jp .flag
.route_10
	ld de, EVENT_NUZLOCKE_ROUTE_10
	jp .flag
.power_plant
	ld de, EVENT_NUZLOCKE_POWER_PLANT
	jp .flag
.lavender_town
	ld de, EVENT_NUZLOCKE_LAVENDER_TOWN
	jp .flag
.lav_radio_tower
	ld de, EVENT_NUZLOCKE_LAV_RADIO_TOWER
	jp .flag
.celadon_city
	ld de, EVENT_NUZLOCKE_CELADON_CITY
	jp .flag
.saffron_city
	ld de, EVENT_NUZLOCKE_SAFFRON_CITY
	jp .flag
.silph_co
	ld de, EVENT_NUZLOCKE_SILPH_CO
	jp .flag
.route_11
	ld de, EVENT_NUZLOCKE_ROUTE_11
	jp .flag
.route_12
	ld de, EVENT_NUZLOCKE_ROUTE_12
	jp .flag
.route_13
	ld de, EVENT_NUZLOCKE_ROUTE_13
	jp .flag
.route_14
	ld de, EVENT_NUZLOCKE_ROUTE_14
	jp .flag
.route_15
	ld de, EVENT_NUZLOCKE_ROUTE_15
	jp .flag
.route_16
	ld de, EVENT_NUZLOCKE_ROUTE_16
	jp .flag
.route_17
	ld de, EVENT_NUZLOCKE_ROUTE_17
	jp .flag
.route_18
	ld de, EVENT_NUZLOCKE_ROUTE_18
	jp .flag
.fuchsia_city
	ld de, EVENT_NUZLOCKE_FUCHSIA_CITY
	jp .flag
.safari_zone
	ld de, EVENT_NUZLOCKE_SAFARI_ZONE
	jp .flag
.route_19
	ld de, EVENT_NUZLOCKE_ROUTE_19
	jp .flag
.route_20
	ld de, EVENT_NUZLOCKE_ROUTE_20
	jp .flag
.seafoam_islands
	ld de, EVENT_NUZLOCKE_SEAFOAM_ISLANDS
	jp .flag
.cinnabar_island
	ld de, EVENT_NUZLOCKE_CINNABAR_ISLAND
	jp .flag
.route_21
	ld de, EVENT_NUZLOCKE_ROUTE_21
	jp .flag
.route_22
	ld de, EVENT_NUZLOCKE_ROUTE_22
	jp .flag
.victory_road
	ld de, EVENT_NUZLOCKE_VICTORY_ROAD
	jp .flag
.route_23
	ld de, EVENT_NUZLOCKE_ROUTE_23
	jp .flag
.indigo_plateau
	ld de, EVENT_NUZLOCKE_INDIGO_PLATEAU
	jp .flag
.route_26
	ld de, EVENT_NUZLOCKE_ROUTE_26
	jp .flag
.route_27
	ld de, EVENT_NUZLOCKE_ROUTE_27
	jp .flag
.tohjo_falls
	ld de, EVENT_NUZLOCKE_TOHJO_FALLS
	jp .flag
.route_28
	ld de, EVENT_NUZLOCKE_ROUTE_28
	jp .flag
.fast_ship
	ld de, EVENT_NUZLOCKE_FAST_SHIP
	jp .flag
