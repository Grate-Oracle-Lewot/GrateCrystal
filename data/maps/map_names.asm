MapGroupNum_Names::
	table_width 2, MapGroupNum_Names
	dw Cable_Club_Map_Names    ;  1
	dw Pallet_Map_Names        ;  2
	dw Viridian_Map_Names      ;  3
	dw Pewter_Map_Names        ;  4
	dw Cerulean_Map_Names      ;  5
	dw Vermilion_Map_Names     ;  6
	dw Lavender_Map_Names      ;  7
	dw Celadon_Map_Names       ;  8
	dw Fuchsia_Map_Names       ;  9
	dw Safari_Map_Names        ; 10
	dw Saffron_Inner_Map_Names ; 11
	dw Saffron_Outer_Map_Names ; 12
	dw Cinnabar_Map_Names      ; 13
	dw Indigo_Map_Names        ; 14
	dw Silver_Map_Names        ; 15
	dw New_Bark_Map_Names      ; 16
	dw Cherrygrove_Map_Names   ; 17
	dw Violet_Map_Names        ; 18
	dw Azalea_Map_Names        ; 19
	dw Goldenrod_Map_Names     ; 20
	dw Ecruteak_Map_Names      ; 21
	dw Olivine_Map_Names       ; 22
	dw Cianwood_Map_Names      ; 23
	dw Mahogany_Map_Names      ; 24
	dw Lake_of_Rage_Map_Names  ; 25
	dw Blackthorn_Map_Names    ; 26
	dw Fast_Ship_Map_Names     ; 27
	dw Dungeons_Map_Names      ; 28
	assert_table_length NUM_MAP_GROUPS

GetMapGroupNum_Name::
	dec d ; map num
	dec e ; map group
	push de
	ld d, 0
	ld hl, MapGroupNum_Names
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld h, d
	ld l, e
	pop de
	ld e, d
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	; return string ptr in de
	ret

Cable_Club_Map_Names: ; CABLE_CLUB
	table_width 2, Cable_Club_Map_Names
	dw Cable_Club_Map_Name1 ; POKECENTER_2F
	dw Cable_Club_Map_Name2 ; TRADE_CENTER
	dw Cable_Club_Map_Name3 ; COLOSSEUM
	dw Cable_Club_Map_Name4 ; MOBILE_TRADE_ROOM
	dw Cable_Club_Map_Name5 ; MOBILE_BATTLE_ROOM
	assert_table_length NUM_CABLE_CLUB_MAPS

Pallet_Map_Names: ; PALLET
	table_width 2, Pallet_Map_Names
	dw Pallet_Map_Name1 ; PALLET_TOWN
	dw Pallet_Map_Name2 ; OAKS_LAB
	dw Pallet_Map_Name3 ; REDS_HOUSE_1F
	dw Pallet_Map_Name4 ; REDS_HOUSE_2F
	dw Pallet_Map_Name5 ; BLUES_HOUSE
	dw Pallet_Map_Name6 ; ROUTE_1
	assert_table_length NUM_PALLET_MAPS

Viridian_Map_Names: ; VIRIDIAN
	table_width 2, Viridian_Map_Names
	dw Viridian_Map_Name1  ; VIRIDIAN_CITY
	dw Viridian_Map_Name2  ; VIRIDIAN_POKECENTER_1F
	dw Viridian_Map_Name3  ; VIRIDIAN_MART
	dw Viridian_Map_Name4  ; VIRIDIAN_GYM
	dw Viridian_Map_Name5  ; TRAINER_HOUSE_1F
	dw Viridian_Map_Name6  ; TRAINER_HOUSE_B1F
	dw Viridian_Map_Name7  ; VIRIDIAN_NICKNAME_SPEECH_HOUSE
	dw Viridian_Map_Name8  ; ROUTE_2
	dw Viridian_Map_Name9  ; ROUTE_2_NUGGET_HOUSE
	dw Viridian_Map_Name10 ; ROUTE_2_SOUTH_GATE
	dw Viridian_Map_Name11 ; ROUTE_2_NORTH_GATE
	dw Viridian_Map_Name12 ; VIRIDIAN_FOREST
	dw Viridian_Map_Name13 ; ROUTE_22
	dw Viridian_Map_Name14 ; ROUTE_22_HOUSE
	dw Viridian_Map_Name15 ; VICTORY_ROAD_GATE
	assert_table_length NUM_VIRIDIAN_MAPS

Pewter_Map_Names: ; PEWTER
	table_width 2, Pewter_Map_Names
	dw Pewter_Map_Name1  ; PEWTER_CITY
	dw Pewter_Map_Name2  ; PEWTER_POKECENTER_1F
	dw Pewter_Map_Name3  ; PEWTER_MART
	dw Pewter_Map_Name4  ; PEWTER_GYM
	dw Pewter_Map_Name5  ; PEWTER_MUSEUM_1F
	dw Pewter_Map_Name6  ; PEWTER_MUSEUM_2F
	dw Pewter_Map_Name7  ; PEWTER_NIDORAN_SPEECH_HOUSE
	dw Pewter_Map_Name8  ; PEWTER_SNOOZE_SPEECH_HOUSE
	dw Pewter_Map_Name9  ; ROUTE_3
	dw Pewter_Map_Name10 ; ROUTE_3_POKECENTER_1F
	assert_table_length NUM_PEWTER_MAPS

Cerulean_Map_Names: ; CERULEAN
	table_width 2, Cerulean_Map_Names
	dw Cerulean_Map_Name1  ; CERULEAN_CITY
	dw Cerulean_Map_Name2  ; CERULEAN_POKECENTER_1F
	dw Cerulean_Map_Name3  ; CERULEAN_MART
	dw Cerulean_Map_Name4  ; CERULEAN_GYM
	dw Cerulean_Map_Name5  ; CERULEAN_GYM_BADGE_SPEECH_HOUSE
	dw Cerulean_Map_Name6  ; CERULEAN_POLICE_STATION
	dw Cerulean_Map_Name7  ; CERULEAN_TRADE_SPEECH_HOUSE
	dw Cerulean_Map_Name8  ; ROUTE_4
	dw Cerulean_Map_Name9  ; ROUTE_9
	dw Cerulean_Map_Name10 ; ROUTE_10_NORTH
	dw Cerulean_Map_Name11 ; ROUTE_10_POKECENTER_1F
	dw Cerulean_Map_Name12 ; POWER_PLANT
	dw Cerulean_Map_Name13 ; POWER_PLANT_2F
	dw Cerulean_Map_Name14 ; ROUTE_24
	dw Cerulean_Map_Name15 ; ROUTE_25
	dw Cerulean_Map_Name16 ; BILLS_HOUSE
	assert_table_length NUM_CERULEAN_MAPS

Vermilion_Map_Names: ; VERMILION
	table_width 2, Vermilion_Map_Names
	dw Vermilion_Map_Name1  ; VERMILION_CITY
	dw Vermilion_Map_Name2  ; VERMILION_POKECENTER_1F
	dw Vermilion_Map_Name3  ; VERMILION_MART
	dw Vermilion_Map_Name4  ; VERMILION_GYM
	dw Vermilion_Map_Name5  ; POKEMON_FAN_CLUB
	dw Vermilion_Map_Name6  ; VERMILION_FISHING_SPEECH_HOUSE
	dw Vermilion_Map_Name7  ; VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	dw Vermilion_Map_Name8  ; VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE
	dw Vermilion_Map_Name9  ; ROUTE_6
	dw Vermilion_Map_Name10 ; ROUTE_6_UNDERGROUND_PATH_ENTRANCE
	dw Vermilion_Map_Name11 ; ROUTE_6_SAFFRON_GATE
	dw Vermilion_Map_Name12 ; ROUTE_11
	assert_table_length NUM_VERMILION_MAPS

Lavender_Map_Names: ; LAVENDER
	table_width 2, Lavender_Map_Names
	dw Lavender_Map_Name1  ; LAVENDER_TOWN
	dw Lavender_Map_Name2  ; LAVENDER_POKECENTER_1F
	dw Lavender_Map_Name3  ; LAVENDER_MART
	dw Lavender_Map_Name4  ; LAV_RADIO_TOWER_1F
	dw Lavender_Map_Name5  ; LAV_RADIO_TOWER_2F
	dw Lavender_Map_Name6  ; SOUL_HOUSE
	dw Lavender_Map_Name7  ; LAVENDER_NAME_RATER
	dw Lavender_Map_Name8  ; MR_FUJIS_HOUSE
	dw Lavender_Map_Name9  ; LAVENDER_SPEECH_HOUSE
	dw Lavender_Map_Name10 ; ROUTE_8
	dw Lavender_Map_Name11 ; ROUTE_8_SAFFRON_GATE
	dw Lavender_Map_Name12 ; ROUTE_10_SOUTH
	dw Lavender_Map_Name13 ; ROUTE_12
	dw Lavender_Map_Name14 ; ROUTE_12_SUPER_ROD_HOUSE
	assert_table_length NUM_LAVENDER_MAPS

Celadon_Map_Names: ; CELADON
	table_width 2, Celadon_Map_Names
	dw Celadon_Map_Name1  ; CELADON_CITY
	dw Celadon_Map_Name2  ; CELADON_POKECENTER_1F
	dw Celadon_Map_Name3  ; CELADON_DEPT_STORE_1F
	dw Celadon_Map_Name4  ; CELADON_DEPT_STORE_2F
	dw Celadon_Map_Name5  ; CELADON_DEPT_STORE_3F
	dw Celadon_Map_Name6  ; CELADON_DEPT_STORE_4F
	dw Celadon_Map_Name7  ; CELADON_DEPT_STORE_5F
	dw Celadon_Map_Name8  ; CELADON_DEPT_STORE_6F
	dw Celadon_Map_Name9  ; CELADON_DEPT_STORE_ELEVATOR
	dw Celadon_Map_Name10 ; CELADON_GYM
	dw Celadon_Map_Name11 ; CELADON_GAME_CORNER
	dw Celadon_Map_Name12 ; CELADON_GAME_CORNER_PRIZE_ROOM
	dw Celadon_Map_Name13 ; CELADON_MANSION_1F
	dw Celadon_Map_Name14 ; CELADON_MANSION_2F
	dw Celadon_Map_Name15 ; CELADON_MANSION_3F
	dw Celadon_Map_Name16 ; CELADON_MANSION_ROOF
	dw Celadon_Map_Name17 ; CELADON_MANSION_ROOF_HOUSE
	dw Celadon_Map_Name18 ; CELADON_CAFE
	dw Celadon_Map_Name19 ; ROUTE_7
	dw Celadon_Map_Name20 ; ROUTE_7_SAFFRON_GATE
	dw Celadon_Map_Name21 ; ROUTE_16
	dw Celadon_Map_Name22 ; ROUTE_16_FUCHSIA_SPEECH_HOUSE
	dw Celadon_Map_Name23 ; ROUTE_16_GATE
	dw Celadon_Map_Name24 ; ROUTE_17
	dw Celadon_Map_Name25 ; ROUTE_17_ROUTE_18_GATE
	assert_table_length NUM_CELADON_MAPS

Fuchsia_Map_Names: ; FUCHSIA
	table_width 2, Fuchsia_Map_Names
	dw Fuchsia_Map_Name1  ; FUCHSIA_CITY
	dw Fuchsia_Map_Name2  ; FUCHSIA_POKECENTER_1F
	dw Fuchsia_Map_Name3  ; FUCHSIA_MART
	dw Fuchsia_Map_Name4  ; FUCHSIA_GYM
	dw Fuchsia_Map_Name5  ; BILLS_BROTHERS_HOUSE
	dw Fuchsia_Map_Name6  ; SAFARI_ZONE_MAIN_OFFICE
	dw Fuchsia_Map_Name7  ; SAFARI_ZONE_WARDENS_HOME
	dw Fuchsia_Map_Name8  ; SAFARI_ZONE_GATE
	dw Fuchsia_Map_Name9  ; ROUTE_13
	dw Fuchsia_Map_Name10 ; ROUTE_14
	dw Fuchsia_Map_Name11 ; ROUTE_15
	dw Fuchsia_Map_Name12 ; ROUTE_15_FUCHSIA_GATE
	dw Fuchsia_Map_Name13 ; ROUTE_18
	assert_table_length NUM_FUCHSIA_MAPS

Safari_Map_Names: ; SAFARI
	table_width 2, Safari_Map_Names
	dw Safari_Map_Name1 ; SAFARI_ZONE
	assert_table_length NUM_SAFARI_MAPS

Saffron_Inner_Map_Names: ; SAFFRON_INNER
	table_width 2, Saffron_Inner_Map_Names
	dw Saffron_Inner_Map_Name1  ; SAFFRON_CITY
	dw Saffron_Inner_Map_Name2  ; SAFFRON_POKECENTER_1F
	dw Saffron_Inner_Map_Name3  ; SAFFRON_MART
	dw Saffron_Inner_Map_Name4  ; SAFFRON_GYM
	dw Saffron_Inner_Map_Name5  ; FIGHTING_DOJO
	dw Saffron_Inner_Map_Name6  ; SILPH_CO_1F
	dw Saffron_Inner_Map_Name7  ; SAFFRON_MAGNET_TRAIN_STATION
	dw Saffron_Inner_Map_Name8  ; COPYCATS_HOUSE_1F
	dw Saffron_Inner_Map_Name9  ; COPYCATS_HOUSE_2F
	dw Saffron_Inner_Map_Name10 ; MR_PSYCHICS_HOUSE
	assert_table_length NUM_SAFFRON_INNER_MAPS

Saffron_Outer_Map_Names: ; SAFFRON_OUTER
	table_width 2, Saffron_Outer_Map_Names
	dw Saffron_Outer_Map_Name1 ; ROUTE_5
	dw Saffron_Outer_Map_Name2 ; ROUTE_5_UNDERGROUND_PATH_ENTRANCE
	dw Saffron_Outer_Map_Name3 ; ROUTE_5_CLEANSE_TAG_HOUSE
	dw Saffron_Outer_Map_Name4 ; ROUTE_5_SAFFRON_GATE
	assert_table_length NUM_SAFFRON_OUTER_MAPS

Cinnabar_Map_Names: ; CINNABAR
	table_width 2, Cinnabar_Map_Names
	dw Cinnabar_Map_Name1 ; CINNABAR_ISLAND
	dw Cinnabar_Map_Name2 ; CINNABAR_POKECENTER_1F
	dw Cinnabar_Map_Name3 ; ROUTE_19
	dw Cinnabar_Map_Name4 ; ROUTE_19_FUCHSIA_GATE
	dw Cinnabar_Map_Name5 ; ROUTE_20
	dw Cinnabar_Map_Name6 ; SEAFOAM_GYM
	dw Cinnabar_Map_Name7 ; ROUTE_21
	assert_table_length NUM_CINNABAR_MAPS

Indigo_Map_Names: ; INDIGO
	table_width 2, Indigo_Map_Names
	dw Indigo_Map_Name1  ; ROUTE_23
	dw Indigo_Map_Name2  ; INDIGO_PLATEAU_POKECENTER_1F
	dw Indigo_Map_Name3  ; WILLS_ROOM
	dw Indigo_Map_Name4  ; KOGAS_ROOM
	dw Indigo_Map_Name5  ; BRUNOS_ROOM
	dw Indigo_Map_Name6  ; KARENS_ROOM
	dw Indigo_Map_Name7  ; LANCES_ROOM
	dw Indigo_Map_Name8  ; HALL_OF_FAME
	dw Indigo_Map_Name9  ; LOUNGE_1F
	dw Indigo_Map_Name10 ; LOUNGE_2F
	assert_table_length NUM_INDIGO_MAPS

Silver_Map_Names: ; SILVER
	table_width 2, Silver_Map_Names
	dw Silver_Map_Name1 ; ROUTE_28
	dw Silver_Map_Name2 ; ROUTE_28_STEEL_WING_HOUSE
	dw Silver_Map_Name3 ; SILVER_CAVE_OUTSIDE
	dw Silver_Map_Name4 ; SILVER_CAVE_POKECENTER_1F
	assert_table_length NUM_SILVER_MAPS

New_Bark_Map_Names: ; NEW_BARK
	table_width 2, New_Bark_Map_Names
	dw New_Bark_Map_Name1  ; NEW_BARK_TOWN
	dw New_Bark_Map_Name2  ; PLAYERS_HOUSE_1F
	dw New_Bark_Map_Name3  ; PLAYERS_HOUSE_2F
	dw New_Bark_Map_Name4  ; ELMS_LAB
	dw New_Bark_Map_Name5  ; ELMS_HOUSE
	dw New_Bark_Map_Name6  ; PLAYERS_NEIGHBORS_HOUSE
	dw New_Bark_Map_Name7  ; ROUTE_26
	dw New_Bark_Map_Name8  ; ROUTE_26_HEAL_HOUSE
	dw New_Bark_Map_Name9  ; DAY_OF_WEEK_SIBLINGS_HOUSE
	dw New_Bark_Map_Name10 ; ROUTE_27
	dw New_Bark_Map_Name11 ; ROUTE_27_SANDSTORM_HOUSE
	dw New_Bark_Map_Name12 ; ROUTE_29
	dw New_Bark_Map_Name13 ; ROUTE_29_ROUTE_46_GATE
	assert_table_length NUM_NEW_BARK_MAPS

Cherrygrove_Map_Names: ; CHERRYGROVE
	table_width 2, Cherrygrove_Map_Names
	dw Cherrygrove_Map_Name1  ; CHERRYGROVE_CITY
	dw Cherrygrove_Map_Name2  ; CHERRYGROVE_POKECENTER_1F
	dw Cherrygrove_Map_Name3  ; CHERRYGROVE_MART
	dw Cherrygrove_Map_Name4  ; GUIDE_GENTS_HOUSE
	dw Cherrygrove_Map_Name5  ; CHERRYGROVE_GYM_SPEECH_HOUSE
	dw Cherrygrove_Map_Name6  ; CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	dw Cherrygrove_Map_Name7  ; ROUTE_30
	dw Cherrygrove_Map_Name8  ; MR_POKEMONS_HOUSE
	dw Cherrygrove_Map_Name9  ; ROUTE_30_BERRY_HOUSE
	dw Cherrygrove_Map_Name10 ; ROUTE_31
	dw Cherrygrove_Map_Name11 ; ROUTE_31_VIOLET_GATE
	assert_table_length NUM_CHERRYGROVE_MAPS

Violet_Map_Names: ; VIOLET
	table_width 2, Violet_Map_Names
	dw Violet_Map_Name1  ; VIOLET_CITY
	dw Violet_Map_Name2  ; VIOLET_POKECENTER_1F
	dw Violet_Map_Name3  ; VIOLET_MART
	dw Violet_Map_Name4  ; VIOLET_GYM
	dw Violet_Map_Name5  ; EARLS_POKEMON_ACADEMY
	dw Violet_Map_Name6  ; VIOLET_KYLES_HOUSE
	dw Violet_Map_Name7  ; VIOLET_NICKNAME_SPEECH_HOUSE
	dw Violet_Map_Name8  ; ROUTE_32
	dw Violet_Map_Name9  ; ROUTE_32_POKECENTER_1F
	dw Violet_Map_Name10 ; ROUTE_32_RUINS_OF_ALPH_GATE
	dw Violet_Map_Name11 ; ROUTE_35
	dw Violet_Map_Name12 ; ROUTE_35_GOLDENROD_GATE
	dw Violet_Map_Name13 ; ROUTE_35_NATIONAL_PARK_GATE
	dw Violet_Map_Name14 ; ROUTE_36
	dw Violet_Map_Name15 ; ROUTE_36_RUINS_OF_ALPH_GATE
	dw Violet_Map_Name16 ; ROUTE_36_NATIONAL_PARK_GATE
	dw Violet_Map_Name17 ; ROUTE_37
	assert_table_length NUM_VIOLET_MAPS

Azalea_Map_Names: ; AZALEA
	table_width 2, Azalea_Map_Names
	dw Azalea_Map_Name1 ; AZALEA_TOWN
	dw Azalea_Map_Name2 ; AZALEA_POKECENTER_1F
	dw Azalea_Map_Name3 ; AZALEA_MART
	dw Azalea_Map_Name4 ; AZALEA_GYM
	dw Azalea_Map_Name5 ; KURTS_HOUSE
	dw Azalea_Map_Name6 ; CHARCOAL_KILN
	dw Azalea_Map_Name7 ; ROUTE_33
	assert_table_length NUM_AZALEA_MAPS

Goldenrod_Map_Names: ; GOLDENROD
	table_width 2, Goldenrod_Map_Names
	dw Goldenrod_Map_Name1  ; GOLDENROD_CITY
	dw Goldenrod_Map_Name2  ; GOLDENROD_POKECENTER_1F
	dw Goldenrod_Map_Name3  ; GOLDENROD_DEPT_STORE_1F
	dw Goldenrod_Map_Name4  ; GOLDENROD_DEPT_STORE_2F
	dw Goldenrod_Map_Name5  ; GOLDENROD_DEPT_STORE_3F
	dw Goldenrod_Map_Name6  ; GOLDENROD_DEPT_STORE_4F
	dw Goldenrod_Map_Name7  ; GOLDENROD_DEPT_STORE_5F
	dw Goldenrod_Map_Name8  ; GOLDENROD_DEPT_STORE_6F
	dw Goldenrod_Map_Name9  ; GOLDENROD_DEPT_STORE_ELEVATOR
	dw Goldenrod_Map_Name10 ; GOLDENROD_DEPT_STORE_ROOF
	dw Goldenrod_Map_Name11 ; GOLDENROD_GYM
	dw Goldenrod_Map_Name12 ; GOLDENROD_GAME_CORNER
	dw Goldenrod_Map_Name13 ; GOLDENROD_GAME_CORNER_BACKROOM
	dw Goldenrod_Map_Name14 ; GOLDENROD_MAGNET_TRAIN_STATION
	dw Goldenrod_Map_Name15 ; GOLDENROD_BIKE_SHOP
	dw Goldenrod_Map_Name16 ; GOLDENROD_NAME_RATER
	dw Goldenrod_Map_Name17 ; GOLDENROD_HAPPINESS_RATER
	dw Goldenrod_Map_Name18 ; GOLDENROD_FLOWER_SHOP
	dw Goldenrod_Map_Name19 ; BILLS_FAMILYS_HOUSE
	dw Goldenrod_Map_Name20 ; GOLDENROD_PP_SPEECH_HOUSE
	dw Goldenrod_Map_Name21 ; ROUTE_34
	dw Goldenrod_Map_Name22 ; DAY_CARE
	dw Goldenrod_Map_Name23 ; ROUTE_34_ILEX_FOREST_GATE
	dw Goldenrod_Map_Name24 ; ILEX_FOREST_AZALEA_GATE
	assert_table_length NUM_GOLDENROD_MAPS

Ecruteak_Map_Names: ; ECRUTEAK
	table_width 2, Ecruteak_Map_Names
	dw Ecruteak_Map_Name1 ; ECRUTEAK_CITY
	dw Ecruteak_Map_Name2 ; ECRUTEAK_POKECENTER_1F
	dw Ecruteak_Map_Name3 ; ECRUTEAK_MART
	dw Ecruteak_Map_Name4 ; ECRUTEAK_GYM
	dw Ecruteak_Map_Name5 ; DANCE_THEATRE
	dw Ecruteak_Map_Name6 ; ECRUTEAK_TIN_TOWER_ENTRANCE
	dw Ecruteak_Map_Name7 ; WISE_TRIOS_ROOM
	dw Ecruteak_Map_Name8 ; ECRUTEAK_ITEMFINDER_HOUSE
	dw Ecruteak_Map_Name9 ; ECRUTEAK_LUGIA_SPEECH_HOUSE
	assert_table_length NUM_ECRUTEAK_MAPS

Olivine_Map_Names: ; OLIVINE
	table_width 2, Olivine_Map_Names
	dw Olivine_Map_Name1  ; OLIVINE_CITY
	dw Olivine_Map_Name2  ; OLIVINE_POKECENTER_1F
	dw Olivine_Map_Name3  ; OLIVINE_MART
	dw Olivine_Map_Name4  ; OLIVINE_GYM
	dw Olivine_Map_Name5  ; OLIVINE_CAFE
	dw Olivine_Map_Name6  ; OLIVINE_GOOD_ROD_HOUSE
	dw Olivine_Map_Name7  ; OLIVINE_TIMS_HOUSE
	dw Olivine_Map_Name8  ; OLIVINE_PUNISHMENT_SPEECH_HOUSE
	dw Olivine_Map_Name9  ; ROUTE_38
	dw Olivine_Map_Name10 ; ROUTE_38_ECRUTEAK_GATE
	dw Olivine_Map_Name11 ; ROUTE_39
	dw Olivine_Map_Name12 ; ROUTE_39_FARMHOUSE
	dw Olivine_Map_Name13 ; ROUTE_39_BARN
	assert_table_length NUM_OLIVINE_MAPS

Cianwood_Map_Names: ; CIANWOOD
	table_width 2, Cianwood_Map_Names
	dw Cianwood_Map_Name1  ; CIANWOOD_CITY
	dw Cianwood_Map_Name2  ; CIANWOOD_POKECENTER_1F
	dw Cianwood_Map_Name3  ; CIANWOOD_GYM
	dw Cianwood_Map_Name4  ; CIANWOOD_PHARMACY
	dw Cianwood_Map_Name5  ; POKE_SEERS_HOUSE
	dw Cianwood_Map_Name6  ; CIANWOOD_PHOTO_STUDIO
	dw Cianwood_Map_Name7  ; CIANWOOD_DARKROOM
	dw Cianwood_Map_Name8  ; MANIAS_HOUSE
	dw Cianwood_Map_Name9  ; CIANWOOD_LUGIA_SPEECH_HOUSE
	dw Cianwood_Map_Name10 ; ROUTE_40
	dw Cianwood_Map_Name11 ; ROUTE_40_BATTLE_TOWER_GATE
	dw Cianwood_Map_Name12 ; ROUTE_41
	dw Cianwood_Map_Name13 ; BATTLE_TOWER_OUTSIDE
	dw Cianwood_Map_Name14 ; BATTLE_TOWER_1F
	dw Cianwood_Map_Name15 ; BATTLE_TOWER_ELEVATOR
	dw Cianwood_Map_Name16 ; BATTLE_TOWER_HALLWAY
	dw Cianwood_Map_Name17 ; BATTLE_TOWER_BATTLE_ROOM
	assert_table_length NUM_CIANWOOD_MAPS

Mahogany_Map_Names: ; MAHOGANY
	table_width 2, Mahogany_Map_Names
	dw Mahogany_Map_Name1 ; MAHOGANY_TOWN
	dw Mahogany_Map_Name2 ; MAHOGANY_POKECENTER_1F
	dw Mahogany_Map_Name3 ; MAHOGANY_GYM
	dw Mahogany_Map_Name4 ; MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	dw Mahogany_Map_Name5 ; ROUTE_42
	dw Mahogany_Map_Name6 ; ROUTE_42_ECRUTEAK_GATE
	dw Mahogany_Map_Name7 ; ROUTE_44
	assert_table_length NUM_MAHOGANY_MAPS

Lake_of_Rage_Map_Names: ; LAKE_OF_RAGE
	table_width 2, Lake_of_Rage_Map_Names
	dw Lake_of_Rage_Map_Name1 ; LAKE_OF_RAGE
	dw Lake_of_Rage_Map_Name2 ; LAKE_OF_RAGE_MAGIKARP_HOUSE
	dw Lake_of_Rage_Map_Name3 ; LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	dw Lake_of_Rage_Map_Name4 ; ROUTE_43
	dw Lake_of_Rage_Map_Name5 ; ROUTE_43_GATE
	dw Lake_of_Rage_Map_Name6 ; ROUTE_43_MAHOGANY_GATE
	assert_table_length NUM_LAKE_OF_RAGE_MAPS

Blackthorn_Map_Names: ; BLACKTHORN
	table_width 2, Blackthorn_Map_Names
	dw Blackthorn_Map_Name1  ; BLACKTHORN_CITY
	dw Blackthorn_Map_Name2  ; BLACKTHORN_POKECENTER_1F
	dw Blackthorn_Map_Name3  ; BLACKTHORN_MART
	dw Blackthorn_Map_Name4  ; BLACKTHORN_GYM_1F
	dw Blackthorn_Map_Name5  ; BLACKTHORN_GYM_2F
	dw Blackthorn_Map_Name6  ; MOVE_DELETERS_HOUSE
	dw Blackthorn_Map_Name7  ; BLACKTHORN_EMYS_HOUSE
	dw Blackthorn_Map_Name8  ; BLACKTHORN_DRAGON_SPEECH_HOUSE
	dw Blackthorn_Map_Name9  ; ROUTE_45
	dw Blackthorn_Map_Name10 ; ROUTE_46
	assert_table_length NUM_BLACKTHORN_MAPS

Fast_Ship_Map_Names: ; FAST_SHIP
	table_width 2, Fast_Ship_Map_Names
	dw Fast_Ship_Map_Name1  ; MOUNT_MOON_SQUARE
	dw Fast_Ship_Map_Name2  ; MOUNT_MOON_GIFT_SHOP
	dw Fast_Ship_Map_Name3  ; FAST_SHIP_1F
	dw Fast_Ship_Map_Name4  ; FAST_SHIP_CABINS_NNW_NNE_NE
	dw Fast_Ship_Map_Name5  ; FAST_SHIP_CABINS_SW_SSW_NW
	dw Fast_Ship_Map_Name6  ; FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	dw Fast_Ship_Map_Name7  ; FAST_SHIP_B1F
	dw Fast_Ship_Map_Name8  ; VERMILION_PORT_PASSAGE
	dw Fast_Ship_Map_Name9  ; VERMILION_PORT
	dw Fast_Ship_Map_Name10 ; OLIVINE_PORT_PASSAGE
	dw Fast_Ship_Map_Name11 ; OLIVINE_PORT
	dw Fast_Ship_Map_Name12 ; TIN_TOWER_ROOF
	assert_table_length NUM_FAST_SHIP_MAPS

Dungeons_Map_Names: ; DUNGEONS
	table_width 2, Dungeons_Map_Names
	dw Dungeons_Map_Name1   ; MOUNT_MOON_1F
	dw Dungeons_Map_Name2   ; MOUNT_MOON_B1F
	dw Dungeons_Map_Name3   ; MOUNT_MOON_B2F
	dw Dungeons_Map_Name4   ; UNDERGROUND_PATH
	dw Dungeons_Map_Name5   ; DIGLETTS_CAVE
	dw Dungeons_Map_Name6   ; ROCK_TUNNEL_1F
	dw Dungeons_Map_Name7   ; ROCK_TUNNEL_B1F
	dw Dungeons_Map_Name8   ; ROCK_TUNNEL_ZAPDOS_CHAMBER
	dw Dungeons_Map_Name9   ; SILPH_CO_2F
	dw Dungeons_Map_Name10  ; SILPH_CO_3F
	dw Dungeons_Map_Name11  ; SILPH_CO_4F
	dw Dungeons_Map_Name12  ; SILPH_CO_5F
	dw Dungeons_Map_Name13  ; SILPH_CO_6F
	dw Dungeons_Map_Name14  ; SILPH_CO_7F
	dw Dungeons_Map_Name15  ; SILPH_CO_8F
	dw Dungeons_Map_Name16  ; SILPH_CO_9F
	dw Dungeons_Map_Name17  ; SILPH_CO_10F
	dw Dungeons_Map_Name18  ; SILPH_CO_11F
	dw Dungeons_Map_Name19  ; SEAFOAM_CAVE_PUZZLE_CHAMBER
	dw Dungeons_Map_Name20  ; SEAFOAM_CAVE_1F
	dw Dungeons_Map_Name21  ; SEAFOAM_CAVE_B1F
	dw Dungeons_Map_Name22  ; SEAFOAM_CAVE_B2F
	dw Dungeons_Map_Name23  ; DARK_CAVE_VIOLET_ENTRANCE
	dw Dungeons_Map_Name24  ; DARK_CAVE_BLACKTHORN_ENTRANCE
	dw Dungeons_Map_Name25  ; DARK_CAVE_2F
	dw Dungeons_Map_Name26  ; SPROUT_TOWER_1F
	dw Dungeons_Map_Name27  ; SPROUT_TOWER_2F
	dw Dungeons_Map_Name28  ; SPROUT_TOWER_3F
	dw Dungeons_Map_Name29  ; RUINS_OF_ALPH_OUTSIDE
	dw Dungeons_Map_Name30  ; RUINS_OF_ALPH_ANTECHAMBER
	dw Dungeons_Map_Name31  ; RUINS_OF_ALPH_INNER_CHAMBER
	dw Dungeons_Map_Name32  ; RUINS_OF_ALPH_KABUTO_CHAMBER
	dw Dungeons_Map_Name33  ; RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	dw Dungeons_Map_Name34  ; RUINS_OF_ALPH_KABUTO_WORD_ROOM
	dw Dungeons_Map_Name35  ; RUINS_OF_ALPH_OMANYTE_CHAMBER
	dw Dungeons_Map_Name36  ; RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	dw Dungeons_Map_Name37  ; RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	dw Dungeons_Map_Name38  ; RUINS_OF_ALPH_AERODACTYL_CHAMBER
	dw Dungeons_Map_Name39  ; RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM
	dw Dungeons_Map_Name40  ; RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	dw Dungeons_Map_Name41  ; RUINS_OF_ALPH_HO_OH_CHAMBER
	dw Dungeons_Map_Name42  ; RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	dw Dungeons_Map_Name43  ; RUINS_OF_ALPH_HO_OH_WORD_ROOM
	dw Dungeons_Map_Name44  ; RUINS_OF_ALPH_RESEARCH_CENTER
	dw Dungeons_Map_Name45  ; UNION_CAVE_1F
	dw Dungeons_Map_Name46  ; UNION_CAVE_B1F
	dw Dungeons_Map_Name47  ; UNION_CAVE_B2F
	dw Dungeons_Map_Name48  ; UNION_CAVE_SLOWPOKE_WELL_LINK
	dw Dungeons_Map_Name49  ; SLOWPOKE_WELL_B1F
	dw Dungeons_Map_Name50  ; SLOWPOKE_WELL_B2F
	dw Dungeons_Map_Name51  ; ILEX_FOREST
	dw Dungeons_Map_Name52  ; GOLDENROD_DEPT_STORE_B1F
	dw Dungeons_Map_Name53  ; GOLDENROD_UNDERGROUND
	dw Dungeons_Map_Name54  ; GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES
	dw Dungeons_Map_Name55  ; GOLDENROD_UNDERGROUND_WAREHOUSE
	dw Dungeons_Map_Name56  ; RADIO_TOWER_1F
	dw Dungeons_Map_Name57  ; RADIO_TOWER_2F
	dw Dungeons_Map_Name58  ; RADIO_TOWER_3F
	dw Dungeons_Map_Name59  ; RADIO_TOWER_4F
	dw Dungeons_Map_Name60  ; RADIO_TOWER_5F
	dw Dungeons_Map_Name61  ; NATIONAL_PARK
	dw Dungeons_Map_Name62  ; NATIONAL_PARK_BUG_CONTEST
	dw Dungeons_Map_Name63  ; BURNED_TOWER_1F
	dw Dungeons_Map_Name64  ; BURNED_TOWER_B1F
	dw Dungeons_Map_Name65  ; TIN_TOWER_1F
	dw Dungeons_Map_Name66  ; TIN_TOWER_2F
	dw Dungeons_Map_Name67  ; TIN_TOWER_3F
	dw Dungeons_Map_Name68  ; TIN_TOWER_4F
	dw Dungeons_Map_Name69  ; TIN_TOWER_5F
	dw Dungeons_Map_Name70  ; TIN_TOWER_6F
	dw Dungeons_Map_Name71  ; TIN_TOWER_7F
	dw Dungeons_Map_Name72  ; TIN_TOWER_8F
	dw Dungeons_Map_Name73  ; TIN_TOWER_9F
	dw Dungeons_Map_Name74  ; OLIVINE_LIGHTHOUSE_1F
	dw Dungeons_Map_Name75  ; OLIVINE_LIGHTHOUSE_2F
	dw Dungeons_Map_Name76  ; OLIVINE_LIGHTHOUSE_3F
	dw Dungeons_Map_Name77  ; OLIVINE_LIGHTHOUSE_4F
	dw Dungeons_Map_Name78  ; OLIVINE_LIGHTHOUSE_5F
	dw Dungeons_Map_Name79  ; OLIVINE_LIGHTHOUSE_6F
	dw Dungeons_Map_Name80  ; WHIRL_ISLAND_1F
	dw Dungeons_Map_Name81  ; WHIRL_ISLAND_B1F
	dw Dungeons_Map_Name82  ; WHIRL_ISLAND_B2F
	dw Dungeons_Map_Name83  ; WHIRL_ISLAND_LUGIA_CHAMBER
	dw Dungeons_Map_Name84  ; MOUNT_MORTAR_1F_OUTSIDE
	dw Dungeons_Map_Name85  ; MOUNT_MORTAR_1F_INSIDE
	dw Dungeons_Map_Name86  ; MOUNT_MORTAR_2F_INSIDE
	dw Dungeons_Map_Name87  ; MOUNT_MORTAR_B1F
	dw Dungeons_Map_Name88  ; MAHOGANY_MART_1F
	dw Dungeons_Map_Name89  ; TEAM_ROCKET_BASE_B1F
	dw Dungeons_Map_Name90  ; TEAM_ROCKET_BASE_B2F
	dw Dungeons_Map_Name91  ; TEAM_ROCKET_BASE_B3F
	dw Dungeons_Map_Name92  ; ICE_PATH_1F
	dw Dungeons_Map_Name93  ; ICE_PATH_B1F
	dw Dungeons_Map_Name94  ; ICE_PATH_B2F_MAHOGANY_SIDE
	dw Dungeons_Map_Name95  ; ICE_PATH_B2F_BLACKTHORN_SIDE
	dw Dungeons_Map_Name96  ; ICE_PATH_B3F
	dw Dungeons_Map_Name97  ; ICE_PATH_ARTICUNO_CHAMBER
	dw Dungeons_Map_Name98  ; DRAGONS_DEN_1F
	dw Dungeons_Map_Name99  ; DRAGONS_DEN_B1F
	dw Dungeons_Map_Name100 ; DRAGON_SHRINE
	dw Dungeons_Map_Name101 ; TOHJO_FALLS
	dw Dungeons_Map_Name102 ; MEW_ANTECHAMBER
	dw Dungeons_Map_Name103 ; MEW_CHAMBER
	dw Dungeons_Map_Name104 ; VICTORY_ROAD
	dw Dungeons_Map_Name105 ; SILVER_CAVE_ROOM_1
	dw Dungeons_Map_Name106 ; SILVER_CAVE_ROOM_2
	dw Dungeons_Map_Name107 ; SILVER_CAVE_ROOM_3
	dw Dungeons_Map_Name108 ; SILVER_CAVE_ITEM_ROOMS
	dw Dungeons_Map_Name109 ; SILVER_CAVE_MOLTRES_CHAMBER
	assert_table_length NUM_DUNGEONS_MAPS

; MAX LENGTH: 17 (preferred: 16)
Cable_Club_Map_Name1: ; POKECENTER_2F
	db "<PKMN> CENTER 2F@"
Cable_Club_Map_Name2: ; TRADE_CENTER
	db "<PKMN> TRADE CENTER@"
Cable_Club_Map_Name3: ; COLOSSEUM
	db "<PKMN> COLOSSEUM@"
Cable_Club_Map_Name4: ; MOBILE_TRADE_ROOM
	db "MOBILE TRADE@"
Cable_Club_Map_Name5: ; MOBILE_BATTLE_ROOM
	db "MOBILE BATTLE@"

Pallet_Map_Name1: ; PALLET_TOWN
	db "PALLET TOWN@"
Pallet_Map_Name2: ; OAKS_LAB
	db "PROF. OAK'S LAB@"
Pallet_Map_Name3: ; REDS_HOUSE_1F
	db "RED'S HOUSE 1F@"
Pallet_Map_Name4: ; REDS_HOUSE_2F
	db "RED'S HOUSE 2F@"
Pallet_Map_Name5: ; BLUES_HOUSE
	db "BLUE'S HOUSE@"
Pallet_Map_Name6: ; ROUTE_1
	db "ROUTE 1@"

Viridian_Map_Name1: ; VIRIDIAN_CITY
	db "VIRIDIAN CITY@"
Viridian_Map_Name2: ; VIRIDIAN_POKECENTER_1F
	db "VIRIDIAN <PKMN>CENTER@"
Viridian_Map_Name3: ; VIRIDIAN_MART
	db "VIRIDIAN <POKE>MART@"
Viridian_Map_Name4: ; VIRIDIAN_GYM
	db "VIRIDIAN GYM@"
Viridian_Map_Name5: ; TRAINER_HOUSE_1F
	db "TRAINER HOUSE@"
Viridian_Map_Name6: ; TRAINER_HOUSE_B1F
	db "TRAINING HALL@"
Viridian_Map_Name7: ; VIRIDIAN_NICKNAME_SPEECH_HOUSE
	db "VIRIDIAN HOUSE@"
Viridian_Map_Name8: ; ROUTE_2
	db "ROUTE 2@"
Viridian_Map_Name9: ; ROUTE_2_NUGGET_HOUSE
	db "ROUTE 2 COTTAGE@"
Viridian_Map_Name10: ; ROUTE_2_SOUTH_GATE
	db "ROUTE 2 GATE S@"
Viridian_Map_Name11: ; ROUTE_2_NORTH_GATE
	db "ROUTE 2 GATE N@"
Viridian_Map_Name12: ; VIRIDIAN_FOREST
	db "VIRIDIAN FOREST@"
Viridian_Map_Name13: ; ROUTE_22
	db "ROUTE 22@"
Viridian_Map_Name14: ; ROUTE_22_HOUSE
	db "ROUTE 22 LODGE@"
Viridian_Map_Name15: ; VICTORY_ROAD_GATE
	db "VICTORY ROAD GATE@"

Pewter_Map_Name1: ; PEWTER_CITY
	db "PEWTER CITY@"
Pewter_Map_Name2: ; PEWTER_POKECENTER_1F
	db "PEWTER <PKMN>CENTER@"
Pewter_Map_Name3: ; PEWTER_MART
	db "PEWTER <POKE>MART@"
Pewter_Map_Name4: ; PEWTER_GYM
	db "PEWTER GYM@"
Pewter_Map_Name5: ; PEWTER_MUSEUM_1F
	db "PEWTER MUSEUM 1F@"
Pewter_Map_Name6: ; PEWTER_MUSEUM_2F
	db "PEWTER MUSEUM 2F@"
Pewter_Map_Name7: ; PEWTER_NIDORAN_SPEECH_HOUSE
	db "PEWTER HOUSE@"
Pewter_Map_Name8: ; PEWTER_SNOOZE_SPEECH_HOUSE
	db "PEWTER HOUSE@"
Pewter_Map_Name9: ; ROUTE_3
	db "ROUTE 3@"
Pewter_Map_Name10: ; ROUTE_3_POKECENTER_1F
	db "ROUTE 3 <PKMN>CENTER@"

Cerulean_Map_Name1: ; CERULEAN_CITY
	db "CERULEAN CITY@"
Cerulean_Map_Name2: ; CERULEAN_POKECENTER_1F
	db "CERULEAN <PKMN>CENTER@"
Cerulean_Map_Name3: ; CERULEAN_MART
	db "CERULEAN <POKE>MART@"
Cerulean_Map_Name4: ; CERULEAN_GYM
	db "CERULEAN GYM@"
Cerulean_Map_Name5: ; CERULEAN_GYM_BADGE_SPEECH_HOUSE
	db "BERRY SHOP@"
Cerulean_Map_Name6: ; CERULEAN_POLICE_STATION
	db "POLICE STATION@"
Cerulean_Map_Name7: ; CERULEAN_TRADE_SPEECH_HOUSE
	db "CERULEAN HOUSE@"
Cerulean_Map_Name8: ; ROUTE_4
	db "ROUTE 4@"
Cerulean_Map_Name9: ; ROUTE_9
	db "ROUTE 9@"
Cerulean_Map_Name10: ; ROUTE_10_NORTH
	db "ROUTE 10 NORTH@"
Cerulean_Map_Name11: ; ROUTE_10_POKECENTER_1F
	db "ROUTE 10 <PKMN>CENTER@"
Cerulean_Map_Name12: ; POWER_PLANT
	db "POWER PLANT 1F@"
Cerulean_Map_Name13: ; POWER_PLANT_2F
	db "POWER PLANT 2F@"
Cerulean_Map_Name14: ; ROUTE_24
	db "ROUTE 24@"
Cerulean_Map_Name15: ; ROUTE_25
	db "ROUTE 25@"
Cerulean_Map_Name16: ; BILLS_HOUSE
	db "BILL'S HOUSE@"

Vermilion_Map_Name1: ; VERMILION_CITY
	db "VERMILION CITY@"
Vermilion_Map_Name2: ; VERMILION_POKECENTER_1F
	db "VERMILION <PKMN>CEN.@"
Vermilion_Map_Name3: ; VERMILION_MART
	db "VERMILION <POKE>MART@"
Vermilion_Map_Name4: ; VERMILION_GYM
	db "VERMILION GYM@"
Vermilion_Map_Name5: ; POKEMON_FAN_CLUB
	db "#MON FAN CLUB@"
Vermilion_Map_Name6: ; VERMILION_FISHING_SPEECH_HOUSE
	db "VERMILION ANGLER@"
Vermilion_Map_Name7: ; VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	db "VERMILION HOUSE@"
Vermilion_Map_Name8: ; VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE
	db "VERMILION HOUSE@"
Vermilion_Map_Name9: ; ROUTE_6
	db "ROUTE 6@"
Vermilion_Map_Name10: ; ROUTE_6_SAFFRON_GATE
	db "ROUTE 6 GATE@"
Vermilion_Map_Name11: ; ROUTE_6_UNDERGROUND_PATH_ENTRANCE
	db "ROUTE 6 UTILITY@"
Vermilion_Map_Name12: ; ROUTE_11
	db "ROUTE 11@"

Lavender_Map_Name1: ; LAVENDER_TOWN
	db "LAVENDER TOWN@"
Lavender_Map_Name2: ; LAVENDER_POKECENTER_1F
	db "LAVENDER <PKMN>CENTER@"
Lavender_Map_Name3: ; LAVENDER_MART
	db "LAVENDER <POKE>MART@"
Lavender_Map_Name4: ; LAV_RADIO_TOWER_1F
	db "KANTO RADIO TOWER@"
Lavender_Map_Name5: ; LAV_RADIO_TOWER_2F
	db "KANTO RADIO TOWER@"
Lavender_Map_Name6: ; SOUL_HOUSE
	db "SOUL HOUSE@"
Lavender_Map_Name7: ; LAVENDER_NAME_RATER
	db "<PKMN> SERVICE CLUB@"
Lavender_Map_Name8: ; MR_FUJIS_HOUSE
	db "MR.FUJI'S HOUSE@"
Lavender_Map_Name9: ; LAVENDER_SPEECH_HOUSE
	db "LAVENDER HOUSE@"
Lavender_Map_Name10: ; ROUTE_8
	db "ROUTE 8@"
Lavender_Map_Name11: ; ROUTE_8_SAFFRON_GATE
	db "ROUTE 8 GATE@"
Lavender_Map_Name12: ; ROUTE_10_SOUTH
	db "ROUTE 10 SOUTH@"
Lavender_Map_Name13: ; ROUTE_12
	db "ROUTE 12@"
Lavender_Map_Name14: ; ROUTE_12_SUPER_ROD_HOUSE
	db "ROUTE 12 ANGLER@"

Celadon_Map_Name1: ; CELADON_CITY
	db "CELADON CITY@"
Celadon_Map_Name2: ; CELADON_POKECENTER_1F
	db "CELADON <PKMN>CENTER@"
Celadon_Map_Name3: ; CELADON_DEPT_STORE_1F
	db "CELADON DEPT 1F@"
Celadon_Map_Name4: ; CELADON_DEPT_STORE_2F
	db "CELADON DEPT 2F@"
Celadon_Map_Name5: ; CELADON_DEPT_STORE_3F
	db "CELADON DEPT 3F@"
Celadon_Map_Name6: ; CELADON_DEPT_STORE_4F
	db "CELADON DEPT 4F@"
Celadon_Map_Name7: ; CELADON_DEPT_STORE_5F
	db "CELADON DEPT 5F@"
Celadon_Map_Name8: ; CELADON_DEPT_STORE_6F
	db "CELADON DEPT 6F@"
Celadon_Map_Name9: ; CELADON_DEPT_STORE_ELEVATOR
	db "CELADON DEPT LIFT@"
Celadon_Map_Name10: ; CELADON_GYM
	db "CELADON GYM@"
Celadon_Map_Name11: ; CELADON_GAME_CORNER
	db "CEL. GAME CORNER@"
Celadon_Map_Name12: ; CELADON_GAME_CORNER_PRIZE_ROOM
	db "CEL. PRIZE ROOM@"
Celadon_Map_Name13: ; CELADON_MANSION_1F
	db "CELADON CONDOS 1F@"
Celadon_Map_Name14: ; CELADON_MANSION_2F
	db "CELADON CONDOS 2F@"
Celadon_Map_Name15: ; CELADON_MANSION_3F
	db "CELADON CONDOS 3F@"
Celadon_Map_Name16: ; CELADON_MANSION_ROOF
	db "CEL. CONDOS ROOF@"
Celadon_Map_Name17: ; CELADON_MANSION_ROOF_HOUSE
	db "CEL. PENTHOUSE@"
Celadon_Map_Name18: ; CELADON_CAFE
	db "CELADON CAFé@"
Celadon_Map_Name19: ; ROUTE_7
	db "ROUTE 7@"
Celadon_Map_Name20: ; ROUTE_7_SAFFRON_GATE
	db "ROUTE 7 GATE@"
Celadon_Map_Name21: ; ROUTE_16
	db "ROUTE 16@"
Celadon_Map_Name22: ; ROUTE_16_FUCHSIA_SPEECH_HOUSE
	db "APRICORN SHOP@"
Celadon_Map_Name23: ; ROUTE_16_GATE
	db "ROUTE 16 GATE@"
Celadon_Map_Name24: ; ROUTE_17
	db "ROUTE 17@"
Celadon_Map_Name25: ; ROUTE_17_ROUTE_18_GATE
	db "ROUTE 17-18 GATE@"

Fuchsia_Map_Name1: ; FUCHSIA_CITY
	db "FUCHSIA CITY@"
Fuchsia_Map_Name2: ; FUCHSIA_POKECENTER_1F
	db "FUCHSIA <PKMN>CENTER@"
Fuchsia_Map_Name3: ; FUCHSIA_MART
	db "FUCHSIA <POKE>MART@"
Fuchsia_Map_Name4: ; FUCHSIA_GYM
	db "FUCHSIA GYM@"
Fuchsia_Map_Name5: ; BILLS_BROTHERS_HOUSE
	db "FUCHSIA HOUSE@"
Fuchsia_Map_Name6: ; SAFARI_ZONE_MAIN_OFFICE
	db "SAFARI ZONE HQ@"
Fuchsia_Map_Name7: ; SAFARI_ZONE_WARDENS_HOME
	db "WARDEN'S HOUSE@"
Fuchsia_Map_Name8: ; SAFARI_ZONE_GATE
	db "SAFARI ZONE GATE@"
Fuchsia_Map_Name9: ; ROUTE_13
	db "ROUTE 13@"
Fuchsia_Map_Name10: ; ROUTE_14
	db "ROUTE 14@"
Fuchsia_Map_Name11: ; ROUTE_15
	db "ROUTE 15@"
Fuchsia_Map_Name12: ; ROUTE_15_FUCHSIA_GATE
	db "ROUTE 15 GATE@"
Fuchsia_Map_Name13: ; ROUTE_18
	db "ROUTE 18@"

Safari_Map_Name1: ; SAFARI_ZONE
	db "SAFARI ZONE@"

Saffron_Inner_Map_Name1: ; SAFFRON_CITY
	db "SAFFRON CITY@"
Saffron_Inner_Map_Name2: ; SAFFRON_POKECENTER_1F
	db "SAFFRON <PKMN>CENTER@"
Saffron_Inner_Map_Name3: ; SAFFRON_MART
	db "SAFFRON <POKE>MART@"
Saffron_Inner_Map_Name4: ; SAFFRON_GYM
	db "SAFFRON GYM@"
Saffron_Inner_Map_Name5: ; FIGHTING_DOJO
	db "FIGHTING DOJO@"
Saffron_Inner_Map_Name6: ; SILPH_CO_1F
	db "SILPH CO. 1F@"
Saffron_Inner_Map_Name7: ; SAFFRON_MAGNET_TRAIN_STATION
	db "SAFFRON STATION@"
Saffron_Inner_Map_Name8: ; COPYCATS_HOUSE_1F
	db "COPYCAT'S HOUSE@"
Saffron_Inner_Map_Name9: ; COPYCATS_HOUSE_2F
	db "COPYCAT'S ROOM@"
Saffron_Inner_Map_Name10: ; MR_PSYCHICS_HOUSE
	db "MR. PSYCHIC'S@"

Saffron_Outer_Map_Name1: ; ROUTE_5
	db "ROUTE 5@"
Saffron_Outer_Map_Name2: ; ROUTE_5_UNDERGROUND_PATH_ENTRANCE
	db "ROUTE 5 UTILITY@"
Saffron_Outer_Map_Name3: ; ROUTE_5_CLEANSE_TAG_HOUSE
	db "ROUTE 5 COTTAGE@"
Saffron_Outer_Map_Name4: ; ROUTE_5_SAFFRON_GATE
	db "ROUTE 5 GATE@"

Cinnabar_Map_Name1: ; CINNABAR_ISLAND
	db "CINNABAR ISLAND@"
Cinnabar_Map_Name2: ; CINNABAR_POKECENTER_1F
	db "CINNABAR <PKMN>CENTER@"
Cinnabar_Map_Name3: ; ROUTE_19
	db "ROUTE 19@"
Cinnabar_Map_Name4: ; ROUTE_19_FUCHSIA_GATE
	db "ROUTE 19 GATE@"
Cinnabar_Map_Name5: ; ROUTE_20
	db "ROUTE 20@"
Cinnabar_Map_Name6: ; SEAFOAM_GYM
	db "SEAFOAM GYM@"
Cinnabar_Map_Name7: ; ROUTE_21
	db "ROUTE 21@"

Indigo_Map_Name1: ; ROUTE_23
	db "ROUTE 23@"
Indigo_Map_Name2: ; INDIGO_PLATEAU_POKECENTER_1F
	db "INDIGO PLATEAU@"
Indigo_Map_Name3: ; WILLS_ROOM
	db "A.D.'S ROOM@"
Indigo_Map_Name4: ; KOGAS_ROOM
	db "LUCAS'S ROOM@"
Indigo_Map_Name5: ; BRUNOS_ROOM
	db "PERCY'S ROOM@"
Indigo_Map_Name6: ; KARENS_ROOM
	db "LEWOT'S ROOM@"
Indigo_Map_Name7: ; LANCES_ROOM
	db "LANCE'S ROOM@"
Indigo_Map_Name8: ; HALL_OF_FAME
	db "HALL OF FAME@"
Indigo_Map_Name9: ; LOUNGE_1F
	db "LEADERS LOUNGE 1F@"
Indigo_Map_Name10: ; LOUNGE_2F
	db "LEADERS LOUNGE 2F@"

Silver_Map_Name1: ; ROUTE_28
	db "ROUTE 28@"
Silver_Map_Name2: ; ROUTE_28_STEEL_WING_HOUSE
	db "R.28 SUMMERHOUSE@"
Silver_Map_Name3: ; SILVER_CAVE_OUTSIDE
	db "MT.SILVER PASS@"
Silver_Map_Name4: ; SILVER_CAVE_POKECENTER_1F
	db "SILVER <PKMN>CENTER@"

New_Bark_Map_Name1: ; NEW_BARK_TOWN
	db "NEW BARK TOWN@"
New_Bark_Map_Name2: ; PLAYERS_HOUSE_1F
	db "YOUR HOUSE@"
New_Bark_Map_Name3: ; PLAYERS_HOUSE_2F
	db "YOUR ROOM@"
New_Bark_Map_Name4: ; ELMS_LAB
	db "PROF. ELM'S LAB@"
New_Bark_Map_Name5: ; ELMS_HOUSE
	db "ELM'S HOUSE@"
New_Bark_Map_Name6: ; PLAYERS_NEIGHBORS_HOUSE
	db "NEW BARK HOUSE@"
New_Bark_Map_Name7: ; ROUTE_26
	db "ROUTE 26@"
New_Bark_Map_Name8: ; ROUTE_26_HEAL_HOUSE
	db "ROUTE 26 HOSTEL@"
New_Bark_Map_Name9: ; DAY_OF_WEEK_SIBLINGS_HOUSE
	db "DAY SIBLINGS'@"
New_Bark_Map_Name10: ; ROUTE_27
	db "ROUTE 27@"
New_Bark_Map_Name11: ; ROUTE_27_SANDSTORM_HOUSE
	db "ROUTE 27 COTTAGE@"
New_Bark_Map_Name12: ; ROUTE_29
	db "ROUTE 29@"
New_Bark_Map_Name13: ; ROUTE_29_ROUTE_46_GATE
	db "ROUTE 29 GATE@"

Cherrygrove_Map_Name1: ; CHERRYGROVE_CITY
	db "CHERRYGROVE CITY@"
Cherrygrove_Map_Name2: ; CHERRYGROVE_POKECENTER_1F
	db "CHERRYGROVE <PKMN>CEN@"
Cherrygrove_Map_Name3: ; CHERRYGROVE_MART
	db "CHERRYGROVE MART@"
Cherrygrove_Map_Name4: ; GUIDE_GENTS_HOUSE
	db "GUIDE GENT'S@"
Cherrygrove_Map_Name5: ; CHERRYGROVE_GYM_SPEECH_HOUSE
	db "CHERRYGROVE HOUSE@"
Cherrygrove_Map_Name6: ; CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	db "CHERRYGROVE HOUSE@"
Cherrygrove_Map_Name7: ; ROUTE_30
	db "ROUTE 30@"
Cherrygrove_Map_Name8: ; MR_POKEMONS_HOUSE
	db "POKEY MAN'S HOUSE@"
Cherrygrove_Map_Name9: ; ROUTE_30_BERRY_HOUSE
	db "ROUTE 30 COTTAGE@"
Cherrygrove_Map_Name10: ; ROUTE_31
	db "ROUTE 31@"
Cherrygrove_Map_Name11: ; ROUTE_31_VIOLET_GATE
	db "ROUTE 31 GATE@"

Violet_Map_Name1: ; VIOLET_CITY
	db "VIOLET CITY@"
Violet_Map_Name2: ; VIOLET_POKECENTER_1F
	db "VIOLET <PKMN>CENTER@"
Violet_Map_Name3: ; VIOLET_MART
	db "VIOLET <POKE>MART@"
Violet_Map_Name4: ; VIOLET_GYM
	db "VIOLET GYM@"
Violet_Map_Name5: ; EARLS_POKEMON_ACADEMY
	db "EARL'S ACADEMY@"
Violet_Map_Name6: ; VIOLET_KYLES_HOUSE
	db "KYLE'S HOUSE@"
Violet_Map_Name7: ; VIOLET_NICKNAME_SPEECH_HOUSE
	db "VIOLET HOUSE@"
Violet_Map_Name8: ; ROUTE_32
	db "ROUTE 32@"
Violet_Map_Name9: ; ROUTE_32_POKECENTER_1F
	db "ROUTE 32 <PKMN>CENTER@"
Violet_Map_Name10: ; ROUTE_32_RUINS_OF_ALPH_GATE
	db "ROUTE 32 GATE@"
Violet_Map_Name11: ; ROUTE_35
	db "ROUTE 35@"
Violet_Map_Name12: ; ROUTE_35_GOLDENROD_GATE
	db "ROUTE 35 GATE S@"
Violet_Map_Name13: ; ROUTE_35_NATIONAL_PARK_GATE
	db "ROUTE 35 GATE N@"
Violet_Map_Name14: ; ROUTE_36
	db "ROUTE 36@"
Violet_Map_Name15: ; ROUTE_36_RUINS_OF_ALPH_GATE
	db "ROUT 36 GATE E@"
Violet_Map_Name16: ; ROUTE_36_NATIONAL_PARK_GATE
	db "ROUTE 36 GATE W@"
Violet_Map_Name17: ; ROUTE_37
	db "ROUTE 37@"

Azalea_Map_Name1: ; AZALEA_TOWN
	db "AZALEA TOWN@"
Azalea_Map_Name2: ; AZALEA_POKECENTER_1F
	db "AZALEA <PKMN>CENTER@"
Azalea_Map_Name3: ; AZALEA_MART
	db "AZALEA <POKE>MART@"
Azalea_Map_Name4: ; AZALEA_GYM
	db "AZALEA GYM@"
Azalea_Map_Name5: ; KURTS_HOUSE
	db "KURT'S HOUSE@"
Azalea_Map_Name6: ; CHARCOAL_KILN
	db "CHARCOAL KILN@"
Azalea_Map_Name7: ; ROUTE_33
	db "ROUTE 33@"

Goldenrod_Map_Name1: ; GOLDENROD_CITY
	db "GOLDENROD CITY@"
Goldenrod_Map_Name2: ; GOLDENROD_POKECENTER_1F
	db "GOLDENROD <PKMN>CEN.@"
Goldenrod_Map_Name3: ; GOLDENROD_DEPT_STORE_1F
	db "GOLD. DEPT 1F@"
Goldenrod_Map_Name4: ; GOLDENROD_DEPT_STORE_2F
	db "GOLD. DEPT 2F@"
Goldenrod_Map_Name5: ; GOLDENROD_DEPT_STORE_3F
	db "GOLD. DEPT 3F@"
Goldenrod_Map_Name6: ; GOLDENROD_DEPT_STORE_4F
	db "GOLD. DEPT 4F@"
Goldenrod_Map_Name7: ; GOLDENROD_DEPT_STORE_5F
	db "GOLD. DEPT 5F@"
Goldenrod_Map_Name8: ; GOLDENROD_DEPT_STORE_6F
	db "GOLD. DEPT 6F@"
Goldenrod_Map_Name9: ; GOLDENROD_DEPT_STORE_ELEVATOR
	db "GOLD. DEPT LIFT@"
Goldenrod_Map_Name10: ; GOLDENROD_DEPT_STORE_ROOF
	db "GOLD. DEPT ROOF@"
Goldenrod_Map_Name11: ; GOLDENROD_GYM
	db "GOLDENROD GYM@"
Goldenrod_Map_Name12: ; GOLDENROD_GAME_CORNER
	db "GOLD. GAME CORNER@"
Goldenrod_Map_Name13: ; GOLDENROD_GAME_CORNER_BACKROOM
	db "GAME CORNER BACK@"
Goldenrod_Map_Name14: ; GOLDENROD_MAGNET_TRAIN_STATION
	db "GOLD. STATION@"
Goldenrod_Map_Name15: ; GOLDENROD_BIKE_SHOP
	db "GOLD. BIKE SHOP@"
Goldenrod_Map_Name16: ; GOLDENROD_NAME_RATER
	db "NAME RATER'S@"
Goldenrod_Map_Name17: ; GOLDENROD_HAPPINESS_RATER
	db "LOVE TESTER'S@"
Goldenrod_Map_Name18: ; GOLDENROD_FLOWER_SHOP
	db "FLOWER SHOP@"
Goldenrod_Map_Name19: ; BILLS_FAMILYS_HOUSE
	db "BILL'S FAMILY'S@"
Goldenrod_Map_Name20: ; GOLDENROD_PP_SPEECH_HOUSE
	db "GOLDENROD HOUSE"
Goldenrod_Map_Name21: ; ROUTE_34
	db "ROUTE 34@"
Goldenrod_Map_Name22: ; DAY_CARE
	db "DAY-CARE@"
Goldenrod_Map_Name23: ; ROUTE_34_ILEX_FOREST_GATE
	db "ROUTE 34 GATE@"
Goldenrod_Map_Name24: ; ILEX_FOREST_AZALEA_GATE
	db "ILEX GATE@"

Ecruteak_Map_Name1: ; ECRUTEAK_CITY
	db "ECRUTEAK CITY@"
Ecruteak_Map_Name2: ; ECRUTEAK_POKECENTER_1F
	db "ECRUTEAK <PKMN>CENTER@"
Ecruteak_Map_Name3: ; ECRUTEAK_MART
	db "ECRUTEAK <POKE>MART@"
Ecruteak_Map_Name4: ; ECRUTEAK_GYM
	db "ECRUTEAK GYM@"
Ecruteak_Map_Name5: ; DANCE_THEATRE
	db "DANCE THEATER@"
Ecruteak_Map_Name6: ; ECRUTEAK_TIN_TOWER_ENTRANCE
	db "BELLCHIME SHRINE@"
Ecruteak_Map_Name7: ; WISE_TRIOS_ROOM
	db "BELLCHIME SHRINE@"
Ecruteak_Map_Name8: ; ECRUTEAK_ITEMFINDER_HOUSE
	db "ECRUTEAK HOUSE@"
Ecruteak_Map_Name9: ; ECRUTEAK_LUGIA_SPEECH_HOUSE
	db "ECRUTEAK HOUSE@"

Olivine_Map_Name1: ; OLIVINE_CITY
	db "OLIVINE CITY@"
Olivine_Map_Name2: ; OLIVINE_POKECENTER_1F
	db "OLIVINE <PKMN>CENTER@"
Olivine_Map_Name3: ; OLIVINE_MART
	db "OLIVINE <POKE>MART@"
Olivine_Map_Name4: ; OLIVINE_GYM
	db "OLIVINE GYM@"
Olivine_Map_Name5: ; OLIVINE_CAFE
	db "OLIVINE CAFé@"
Olivine_Map_Name6: ; OLIVINE_GOOD_ROD_HOUSE
	db "OLIVINE ANGLER@"
Olivine_Map_Name7: ; OLIVINE_TIMS_HOUSE
	db "TIM'S HOUSE@"
Olivine_Map_Name8: ; OLIVINE_PUNISHMENT_SPEECH_HOUSE
	db "OLIVINE HOUSE@"
Olivine_Map_Name9: ; ROUTE_38
	db "ROUTE 38@"
Olivine_Map_Name10: ; ROUTE_38_ECRUTEAK_GATE
	db "ROUTE 38 GATE@"
Olivine_Map_Name11: ; ROUTE_39
	db "ROUTE 39@"
Olivine_Map_Name12: ; ROUTE_39_FARMHOUSE
	db "MOOMOO FARMHOUSE@"
Olivine_Map_Name13: ; ROUTE_39_BARN
	db "MOOMOO BARN@"

Cianwood_Map_Name1: ; CIANWOOD_CITY
	db "CIANWOOD CITY@"
Cianwood_Map_Name2: ; CIANWOOD_POKECENTER_1F
	db "CIANWOOD <PKMN>CENTER@"
Cianwood_Map_Name3: ; CIANWOOD_GYM
	db "CIANWOOD GYM@"
Cianwood_Map_Name4: ; CIANWOOD_PHARMACY
	db "CIANWOOD PHARMACY@"
Cianwood_Map_Name5: ; POKE_SEERS_HOUSE
	db "MEMORY GURU'S@"
Cianwood_Map_Name6: ; CIANWOOD_PHOTO_STUDIO
	db "PHOTO STUDIO@"
Cianwood_Map_Name7: ; CIANWOOD_DARKROOM
	db "PHOTO DARKROOM@"
Cianwood_Map_Name8: ; MANIAS_HOUSE
	db "MANIA'S HOUSE@"
Cianwood_Map_Name9: ; CIANWOOD_LUGIA_SPEECH_HOUSE
	db "CIANWOOD HOUSE@"
Cianwood_Map_Name10: ; ROUTE_40
	db "ROUTE 40@"
Cianwood_Map_Name11: ; ROUTE_40_BATTLE_TOWER_GATE
	db "ROUTE 40 GATE@"
Cianwood_Map_Name12: ; ROUTE_41
	db "ROUTE 41@"
Cianwood_Map_Name13: ; BATTLE_TOWER_OUTSIDE
	db "BATTLE TOWER LOT@"
Cianwood_Map_Name14: ; BATTLE_TOWER_1F
	db "BATTLE TOWER 1F@"
Cianwood_Map_Name15: ; BATTLE_TOWER_ELEVATOR
	db "BATTLE TOWER LIFT@"
Cianwood_Map_Name16: ; BATTLE_TOWER_HALLWAY
	db "BATTLE TOWER HALL@"
Cianwood_Map_Name17: ; BATTLE_TOWER_BATTLE_ROOM
	db "BATTLE TOWER@"

Mahogany_Map_Name1: ; MAHOGANY_TOWN
	db "MAHOGANY TOWN@"
Mahogany_Map_Name2: ; MAHOGANY_POKECENTER_1F
	db "MAHOGANY <PKMN>CENTER@"
Mahogany_Map_Name3: ; MAHOGANY_GYM
	db "MAHOGANY GYM@"
Mahogany_Map_Name4: ; MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	db "MAHOGANY HOUSE@"
Mahogany_Map_Name5: ; ROUTE_42
	db "ROUTE 42@"
Mahogany_Map_Name6: ; ROUTE_42_ECRUTEAK_GATE
	db "ROUTE 42 GATE@"
Mahogany_Map_Name7: ; ROUTE_44
	db "ROUTE 44@"

Lake_of_Rage_Map_Name1: ; LAKE_OF_RAGE
	db "LAKE OF RAGE@"
Lake_of_Rage_Map_Name2: ; LAKE_OF_RAGE_MAGIKARP_HOUSE
	db "MAGIKARP ANGLER@"
Lake_of_Rage_Map_Name3: ; LAKE_OF_RAGE_HIDDEN_POWER_HOUSE
	db "HIDDEN LAKEHOUSE@"
Lake_of_Rage_Map_Name4: ; ROUTE_43
	db "ROUTE 43@"
Lake_of_Rage_Map_Name5: ; ROUTE_43_GATE
	db "RT 43 GATE N@"
Lake_of_Rage_Map_Name6: ; ROUTE_43_MAHOGANY_GATE
	db "RT 43 GATE S@"

Blackthorn_Map_Name1: ; BLACKTHORN_CITY
	db "BLACKTHORN CITY@"
Blackthorn_Map_Name2: ; BLACKTHORN_POKECENTER_1F
	db "BLACKTHORN <PKMN>CEN.@"
Blackthorn_Map_Name3: ; BLACKTHORN_MART
	db "BLACKTHORN <POKE>MART@"
Blackthorn_Map_Name4: ; BLACKTHORN_GYM_1F
	db "BLACKTHORN GYM 1F@"
Blackthorn_Map_Name5: ; BLACKTHORN_GYM_2F
	db "BLACKTHORN GYM 2F@"
Blackthorn_Map_Name6: ; MOVE_DELETERS_HOUSE
	db "MOVE DELETER'S@"
Blackthorn_Map_Name7: ; BLACKTHORN_EMYS_HOUSE
	db "EMY'S HOUSE@"
Blackthorn_Map_Name8: ; BLACKTHORN_DRAGON_SPEECH_HOUSE
	db "BLACKTHORN HOUSE@"
Blackthorn_Map_Name9: ; ROUTE_45
	db "ROUTE 45@"
Blackthorn_Map_Name10: ; ROUTE_46
	db "ROUTE 46@"

Fast_Ship_Map_Name1: ; MOUNT_MOON_SQUARE
	db "MT.MOON SQUARE@"
Fast_Ship_Map_Name2: ; MOUNT_MOON_GIFT_SHOP
	db "MT.MOON GIFT SHOP@"
Fast_Ship_Map_Name3: ; FAST_SHIP_1F
	db "S.S. AQUA DECK@"
Fast_Ship_Map_Name4: ; FAST_SHIP_CABINS_NNW_NNE_NE
	db "S.S. AQUA CABIN@"
Fast_Ship_Map_Name5: ; FAST_SHIP_CABINS_SW_SSW_NW
	db "S.S. AQUA CABIN@"
Fast_Ship_Map_Name6: ; FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	db "S.S. AQUA CABIN@"
Fast_Ship_Map_Name7: ; FAST_SHIP_B1F
	db "S.S. AQUA HULL@"
Fast_Ship_Map_Name8: ; VERMILION_PORT_PASSAGE
	db "VERMILION PORT@"
Fast_Ship_Map_Name9: ; VERMILION_PORT
	db "VERMILION MARINA@"
Fast_Ship_Map_Name10: ; OLIVINE_PORT_PASSAGE
	db "OLIVINE PORT@"
Fast_Ship_Map_Name11: ; OLIVINE_PORT
	db "OLIVINE MARINA@"
Fast_Ship_Map_Name12: ; TIN_TOWER_ROOF
	db "TIN TOWER ROOF@"

Dungeons_Map_Name1: ; MOUNT_MOON_1F
	db "MT.MOON LANDING@"
Dungeons_Map_Name2: ; MOUNT_MOON_B1F
	db "MT.MOON DEPTHS@"
Dungeons_Map_Name3: ; MOUNT_MOON_B2F
	db "MT.MOON CORE@"
Dungeons_Map_Name4: ; UNDERGROUND_PATH
	db "UNDERGROUND PATH@"
Dungeons_Map_Name5: ; DIGLETTS_CAVE
	db "DIGLETT'S CAVE@"
Dungeons_Map_Name6: ; ROCK_TUNNEL_1F
	db "ROCK TUNNEL 1F@"
Dungeons_Map_Name7: ; ROCK_TUNNEL_B1F
	db "ROCK TUNNEL B1F@"
Dungeons_Map_Name8: ; ROCK_TUNNEL_ZAPDOS_CHAMBER
	db "DEEP ROCK TUNNEL@"
Dungeons_Map_Name9: ; SILPH_CO_2F
	db "SILPH CO. 2F@"
Dungeons_Map_Name10: ; SILPH_CO_3F
	db "SILPH CO. 3F@"
Dungeons_Map_Name11: ; SILPH_CO_4F
	db "SILPH CO. 4F@"
Dungeons_Map_Name12: ; SILPH_CO_5F
	db "SILPH CO. 5F@"
Dungeons_Map_Name13: ; SILPH_CO_6F
	db "SILPH CO. 6F@"
Dungeons_Map_Name14: ; SILPH_CO_7F
	db "SILPH CO. 7F@"
Dungeons_Map_Name15: ; SILPH_CO_8F
	db "SILPH CO. 8F@"
Dungeons_Map_Name16: ; SILPH_CO_9F
	db "SILPH CO. 9F@"
Dungeons_Map_Name17: ; SILPH_CO_10F
	db "SILPH CO. 10F@"
Dungeons_Map_Name18: ; SILPH_CO_11F
	db "SILPH CO. 11F@"
Dungeons_Map_Name19: ; SEAFOAM_CAVE_PUZZLE_CHAMBER
	db "UBEQC CHAMBER@"
Dungeons_Map_Name20: ; SEAFOAM_CAVE_1F
	db "SEAFOAM CAVE@"
Dungeons_Map_Name21: ; SEAFOAM_CAVE_B1F
	db "LEWOT'S HIDEOUT@"
Dungeons_Map_Name22: ; SEAFOAM_CAVE_B2F
	db "SEAFOAM DEPTHS@"
Dungeons_Map_Name23: ; DARK_CAVE_VIOLET_ENTRANCE
	db "DARK CAVE SW@"
Dungeons_Map_Name24: ; DARK_CAVE_BLACKTHORN_ENTRANCE
	db "DARK CAVE NE@"
Dungeons_Map_Name25: ; DARK_CAVE_2F
	db "DARK CAVE DOJO@"
Dungeons_Map_Name26: ; SPROUT_TOWER_1F
	db "SPROUT TOWER 1F@"
Dungeons_Map_Name27: ; SPROUT_TOWER_2F
	db "SPROUT TOWER 2F@"
Dungeons_Map_Name28: ; SPROUT_TOWER_3F
	db "SPROUT TOWER 3F@"
Dungeons_Map_Name29: ; RUINS_OF_ALPH_OUTSIDE
	db "ALPH GROUNDS@"
Dungeons_Map_Name30: ; RUINS_OF_ALPH_ANTECHAMBER
	db "ALPH ANTECHAMBER@"
Dungeons_Map_Name31: ; RUINS_OF_ALPH_INNER_CHAMBER
	db "ALPH MAIN CHAMBER@"
Dungeons_Map_Name32: ; RUINS_OF_ALPH_KABUTO_CHAMBER
	db "EARTH CHAMBER@"
Dungeons_Map_Name33: ; RUINS_OF_ALPH_KABUTO_ITEM_ROOM
	db "EARTH ALTAR@"
Dungeons_Map_Name34: ; RUINS_OF_ALPH_KABUTO_WORD_ROOM
	db "EARTH MISSIVE@"
Dungeons_Map_Name35: ; RUINS_OF_ALPH_OMANYTE_CHAMBER
	db "WATER CHAMBER@"
Dungeons_Map_Name36: ; RUINS_OF_ALPH_OMANYTE_ITEM_ROOM
	db "WATER ALTAR@"
Dungeons_Map_Name37: ; RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	db "WATER MISSIVE@"
Dungeons_Map_Name38: ; RUINS_OF_ALPH_AERODACTYL_CHAMBER
	db "AIR CHAMBER@"
Dungeons_Map_Name39: ; RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM
	db "AIR ALTAR@"
Dungeons_Map_Name40: ; RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	db "AIR MISSIVE@"
Dungeons_Map_Name41: ; RUINS_OF_ALPH_HO_OH_CHAMBER
	db "FIRE CHAMBER@"
Dungeons_Map_Name42: ; RUINS_OF_ALPH_HO_OH_ITEM_ROOM
	db "FIRE ALTAR@"
Dungeons_Map_Name43: ; RUINS_OF_ALPH_HO_OH_WORD_ROOM
	db "FIRE MISSIVE@"
Dungeons_Map_Name44: ; RUINS_OF_ALPH_RESEARCH_CENTER
	db "ALPH SURVEY LAB@"
Dungeons_Map_Name45: ; UNION_CAVE_1F
	db "UNION CAVE 1F@"
Dungeons_Map_Name46: ; UNION_CAVE_B1F
	db "UNION CAVE B1F@"
Dungeons_Map_Name47: ; UNION_CAVE_B2F
	db "UNION GROTTO@"
Dungeons_Map_Name48: ; UNION_CAVE_SLOWPOKE_WELL_LINK
	db "UNION WELLSPRING@"
Dungeons_Map_Name49: ; SLOWPOKE_WELL_B1F
	db "SLOWPOKEWELL B1F@"
Dungeons_Map_Name50: ; SLOWPOKE_WELL_B2F
	db "SLOWPOKEWELL B2F@"
Dungeons_Map_Name51: ; ILEX_FOREST
	db "ILEX FOREST@"
Dungeons_Map_Name52: ; GOLDENROD_DEPT_STORE_B1F
	db "GOLD. DEPT B1F@"
Dungeons_Map_Name53: ; GOLDENROD_UNDERGROUND
	db "GOLD. UNDERGROUND@"
Dungeons_Map_Name54: ; GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES
	db "UND. SWITCH ROOM@"
Dungeons_Map_Name55: ; GOLDENROD_UNDERGROUND_WAREHOUSE
	db "UNDER. WAREHOUSE@"
Dungeons_Map_Name56: ; RADIO_TOWER_1F
	db "RADIO TOWER 1F@"
Dungeons_Map_Name57: ; RADIO_TOWER_2F
	db "RADIO TOWER 2F@"
Dungeons_Map_Name58: ; RADIO_TOWER_3F
	db "RADIO TOWER 3F@"
Dungeons_Map_Name59: ; RADIO_TOWER_4F
	db "RADIO TOWER 4F@"
Dungeons_Map_Name60: ; RADIO_TOWER_5F
	db "RADIO TOWER 5F@"
Dungeons_Map_Name61: ; NATIONAL_PARK
	db "NATIONAL PARK@"
Dungeons_Map_Name62: ; NATIONAL_PARK_BUG_CONTEST
	db "BUG CONTEST@"
Dungeons_Map_Name63: ; BURNED_TOWER_1F
	db "BURNED TOWER 1F@"
Dungeons_Map_Name64: ; BURNED_TOWER_B1F
	db "BURNED TOWER B1F@"
Dungeons_Map_Name65: ; TIN_TOWER_1F
	db "TIN TOWER 1F@"
Dungeons_Map_Name66: ; TIN_TOWER_2F
	db "TIN TOWER 2F@"
Dungeons_Map_Name67: ; TIN_TOWER_3F
	db "TIN TOWER 3F@"
Dungeons_Map_Name68: ; TIN_TOWER_4F
	db "TIN TOWER 4F@"
Dungeons_Map_Name69: ; TIN_TOWER_5F
	db "TIN TOWER 5F@"
Dungeons_Map_Name70: ; TIN_TOWER_6F
	db "TIN TOWER 6F@"
Dungeons_Map_Name71: ; TIN_TOWER_7F
	db "TIN TOWER 7F@"
Dungeons_Map_Name72: ; TIN_TOWER_8F
	db "TIN TOWER 8F@"
Dungeons_Map_Name73: ; TIN_TOWER_9F
	db "TIN TOWER 9F@"
Dungeons_Map_Name74: ; OLIVINE_LIGHTHOUSE_1F
	db "LIGHTHOUSE 1F@"
Dungeons_Map_Name75: ; OLIVINE_LIGHTHOUSE_2F
	db "LIGHTHOUSE 2F@"
Dungeons_Map_Name76: ; OLIVINE_LIGHTHOUSE_3F
	db "LIGHTHOUSE 3F@"
Dungeons_Map_Name77: ; OLIVINE_LIGHTHOUSE_4F
	db "LIGHTHOUSE 4F@"
Dungeons_Map_Name78: ; OLIVINE_LIGHTHOUSE_5F
	db "LIGHTHOUSE 5F@"
Dungeons_Map_Name79: ; OLIVINE_LIGHTHOUSE_6F
	db "LIGHTHOUSE 6F@"
Dungeons_Map_Name80: ; WHIRL_ISLAND_1F
	db "WHIRL ISLANDS@"
Dungeons_Map_Name81: ; WHIRL_ISLAND_B1F
	db "WHIRL ISL B1F@"
Dungeons_Map_Name82: ; WHIRL_ISLAND_B2F
	db "WHIRL ISL B2F@"
Dungeons_Map_Name83: ; WHIRL_ISLAND_LUGIA_CHAMBER
	db "WHIRL ISL DEPTHS@"
Dungeons_Map_Name84: ; MOUNT_MORTAR_1F_OUTSIDE
	db "MT.MORTAR FALLS@"
Dungeons_Map_Name85: ; MOUNT_MORTAR_1F_INSIDE
	db "MT. MORTAR 1F@"
Dungeons_Map_Name86: ; MOUNT_MORTAR_2F_INSIDE
	db "MT. MORTAR 2F@"
Dungeons_Map_Name87: ; MOUNT_MORTAR_B1F
	db "MT. MORTAR B1F@"
Dungeons_Map_Name88: ; MAHOGANY_MART_1F
	db "MAHOGANY BOUTIQUE@"
Dungeons_Map_Name89: ; TEAM_ROCKET_BASE_B1F
	db "ROCKET BASE B1F@"
Dungeons_Map_Name90: ; TEAM_ROCKET_BASE_B2F
	db "ROCKET BASE B2F@"
Dungeons_Map_Name91: ; TEAM_ROCKET_BASE_B3F
	db "ROCKET BASE B3F@"
Dungeons_Map_Name92: ; ICE_PATH_1F
	db "ICE PATH 1F@"
Dungeons_Map_Name93: ; ICE_PATH_B1F
	db "ICE PATH B1F@"
Dungeons_Map_Name94: ; ICE_PATH_B2F_MAHOGANY_SIDE
	db "ICE PATH B2F W@"
Dungeons_Map_Name95: ; ICE_PATH_B2F_BLACKTHORN_SIDE
	db "ICE PATH B2F E@"
Dungeons_Map_Name96: ; ICE_PATH_B3F
	db "ICE PATH B3F@"
Dungeons_Map_Name97: ; ICE_PATH_ARTICUNO_CHAMBER
	db "ICE PATH DEPTHS@"
Dungeons_Map_Name98: ; DRAGONS_DEN_1F
	db "DRAGON'S DEN 1F@"
Dungeons_Map_Name99: ; DRAGONS_DEN_B1F
	db "DRAGON'S DEN B1F@"
Dungeons_Map_Name100: ; DRAGON_SHRINE
	db "DRAGON SHRINE@"
Dungeons_Map_Name101: ; TOHJO_FALLS
	db "TOHJO FALLS@"
Dungeons_Map_Name102: ; MEW_ANTECHAMBER
	db "TOHJO GROTTO@"
Dungeons_Map_Name103: ; MEW_CHAMBER
	db "????????????????@"
Dungeons_Map_Name104: ; VICTORY_ROAD
	db "VICTORY ROAD@"
Dungeons_Map_Name105: ; SILVER_CAVE_ROOM_1
	db "MT.SILVER FOYER@"
Dungeons_Map_Name106: ; SILVER_CAVE_ROOM_2
	db "MT.SILVER FALLS@"
Dungeons_Map_Name107: ; SILVER_CAVE_ROOM_3
	db "MT.SILVER SHAFT@"
Dungeons_Map_Name108: ; SILVER_CAVE_ITEM_ROOMS
	db "MT.SILVER DEPTHS@"
Dungeons_Map_Name109: ; SILVER_CAVE_MOLTRES_CHAMBER
	db "MT.SILVER RUINS@"
