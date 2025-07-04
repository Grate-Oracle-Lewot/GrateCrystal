newgroup: MACRO
;\1: group id
	const_skip
MAPGROUP_\1 EQU const_value
CURRENT_NUM_MAPGROUP_MAPS EQUS "NUM_\1_MAPS"
__map_value__ = 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
MAP_\1 EQU __map_value__
__map_value__ += 1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

endgroup: MACRO
{CURRENT_NUM_MAPGROUP_MAPS} EQU __map_value__ - 1
PURGE CURRENT_NUM_MAPGROUP_MAPS
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; - MapGroupNum_Names (see data/maps/map_names.asm)
; `map_const` indexes are for the sub-tables of MapGroupPointers and MapGroupNum_Names
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup CABLE_CLUB                                     ; group  1
	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const MOBILE_TRADE_ROOM,                            5,  4 ;  4
	map_const MOBILE_BATTLE_ROOM,                           5,  4 ;  5
	endgroup

	newgroup PALLET                                         ; group  2
	map_const PALLET_TOWN,                                 10,  9 ;  1
	map_const OAKS_LAB,                                     5,  6 ;  2
	map_const OAKS_LAB_2F,                                 15, 14 ;  3
	map_const REDS_HOUSE_1F,                                4,  4 ;  4
	map_const REDS_HOUSE_2F,                                4,  4 ;  5
	map_const BLUES_HOUSE,                                  4,  4 ;  6
	map_const ROUTE_1,                                     10, 18 ;  7
	endgroup

	newgroup VIRIDIAN                                       ; group  3
	map_const VIRIDIAN_CITY,                               20, 18 ;  1
	map_const VIRIDIAN_POKECENTER_1F,                       5,  4 ;  2
	map_const VIRIDIAN_MART,                                6,  4 ;  3
	map_const VIRIDIAN_GYM,                                10,  9 ;  4
	map_const TRAINER_HOUSE_1F,                             5,  7 ;  5
	map_const TRAINER_HOUSE_B1F,                            5,  8 ;  6
	map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE,               4,  4 ;  7
	map_const ROUTE_2,                                     10, 23 ;  8
	map_const ROUTE_2_NUGGET_HOUSE,                         4,  4 ;  9
	map_const ROUTE_2_SOUTH_GATE,                           5,  4 ; 10
	map_const ROUTE_2_NORTH_GATE,                           5,  4 ; 11
	map_const VIRIDIAN_FOREST,                             15, 27 ; 12
	map_const ROUTE_22,                                    18, 48 ; 13
	map_const ROUTE_22_HOUSE,                               5,  4 ; 14
	map_const VICTORY_ROAD_GATE,                           10,  9 ; 15
	endgroup

	newgroup PEWTER                                         ; group  4
	map_const PEWTER_CITY,                                 20, 18 ;  1
	map_const PEWTER_POKECENTER_1F,                         5,  4 ;  2
	map_const PEWTER_MART,                                  6,  4 ;  3
	map_const PEWTER_GYM,                                   5,  7 ;  4
	map_const PEWTER_MUSEUM_1F,                            10,  4 ;  5
	map_const PEWTER_MUSEUM_2F,                             7,  4 ;  6
	map_const PEWTER_NIDORAN_SPEECH_HOUSE,                  4,  4 ;  7
	map_const PEWTER_SNOOZE_SPEECH_HOUSE,                   4,  4 ;  8
	map_const ROUTE_3,                                     30,  9 ;  9
	map_const ROUTE_3_POKECENTER_1F,                        5,  4 ; 10
	endgroup

	newgroup CERULEAN                                       ; group  5
	map_const CERULEAN_CITY,                               20, 18 ;  1
	map_const CERULEAN_POKECENTER_1F,                       5,  4 ;  2
	map_const CERULEAN_MART,                                6,  4 ;  3
	map_const CERULEAN_GYM,                                 5,  8 ;  4
	map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE,              4,  4 ;  5
	map_const CERULEAN_POLICE_STATION,                      4,  4 ;  6
	map_const CERULEAN_TRADE_SPEECH_HOUSE,                  4,  4 ;  7
	map_const ROUTE_4,                                     20,  9 ;  8
	map_const ROUTE_9,                                     30,  9 ;  9
	map_const ROUTE_10_NORTH,                              10,  9 ; 10
	map_const ROUTE_10_POKECENTER_1F,                       5,  4 ; 11
	map_const POWER_PLANT,                                 10,  9 ; 12
	map_const POWER_PLANT_2F,                              20, 18 ; 13
	map_const ROUTE_24,                                    10,  9 ; 14
	map_const ROUTE_25,                                    30,  9 ; 15
	map_const BILLS_HOUSE,                                  4,  4 ; 16
	endgroup

	newgroup VERMILION                                      ; group  6
	map_const VERMILION_CITY,                              20, 18 ;  1
	map_const VERMILION_POKECENTER_1F,                      5,  4 ;  2
	map_const VERMILION_MART,                               6,  4 ;  3
	map_const VERMILION_GYM,                                5,  9 ;  4
	map_const POKEMON_FAN_CLUB,                             5,  4 ;  5
	map_const VERMILION_FISHING_SPEECH_HOUSE,               4,  4 ;  6
	map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,          4,  4 ;  7
	map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE,         4,  4 ;  8
	map_const ROUTE_6,                                     10,  9 ;  9
	map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 10
	map_const ROUTE_6_SAFFRON_GATE,                         5,  4 ; 11
	map_const ROUTE_11,                                    20,  9 ; 12
	endgroup

	newgroup LAVENDER                                       ; group  7
	map_const LAVENDER_TOWN,                               10,  9 ;  1
	map_const LAVENDER_POKECENTER_1F,                       5,  4 ;  2
	map_const LAVENDER_MART,                                6,  4 ;  3
	map_const LAV_RADIO_TOWER_1F,                          10,  4 ;  4
	map_const LAV_RADIO_TOWER_2F,                          10,  9 ;  5
	map_const SOUL_HOUSE,                                   5,  4 ;  6
	map_const LAVENDER_NAME_RATER,                          4,  4 ;  7
	map_const MR_FUJIS_HOUSE,                               5,  4 ;  8
	map_const LAVENDER_SPEECH_HOUSE,                        4,  4 ;  9
	map_const ROUTE_8,                                     20,  9 ; 10
	map_const ROUTE_8_SAFFRON_GATE,                         5,  4 ; 11
	map_const ROUTE_10_SOUTH,                              10,  9 ; 12
	map_const ROUTE_12,                                    10, 27 ; 13
	map_const ROUTE_12_SUPER_ROD_HOUSE,                     4,  4 ; 14
	endgroup

	newgroup CELADON                                        ; group  8
	map_const CELADON_CITY,                                20, 18 ;  1
	map_const CELADON_POKECENTER_1F,                        5,  4 ;  2
	map_const CELADON_DEPT_STORE_1F,                        8,  4 ;  3
	map_const CELADON_DEPT_STORE_2F,                        8,  4 ;  4
	map_const CELADON_DEPT_STORE_3F,                        8,  4 ;  5
	map_const CELADON_DEPT_STORE_4F,                        8,  4 ;  6
	map_const CELADON_DEPT_STORE_5F,                        8,  4 ;  7
	map_const CELADON_DEPT_STORE_6F,                        8,  4 ;  8
	map_const CELADON_DEPT_STORE_ELEVATOR,                  2,  2 ;  9
	map_const CELADON_GYM,                                  5,  9 ; 10
	map_const CELADON_GAME_CORNER,                         10,  7 ; 11
	map_const CELADON_GAME_CORNER_PRIZE_ROOM,               3,  3 ; 12
	map_const CELADON_MANSION_1F,                           4,  5 ; 13
	map_const CELADON_MANSION_2F,                           4,  5 ; 14
	map_const CELADON_MANSION_3F,                           4,  5 ; 15
	map_const CELADON_MANSION_ROOF,                         4,  5 ; 16
	map_const CELADON_MANSION_ROOF_HOUSE,                   4,  4 ; 17
	map_const CELADON_CAFE,                                 6,  4 ; 18
	map_const ROUTE_7,                                     10,  9 ; 19
	map_const ROUTE_7_SAFFRON_GATE,                         5,  4 ; 20
	map_const ROUTE_16,                                    10,  9 ; 21
	map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE,                4,  4 ; 22
	map_const ROUTE_16_GATE,                                5,  4 ; 23
	map_const ROUTE_17,                                    10, 45 ; 24
	map_const ROUTE_17_ROUTE_18_GATE,                       5,  4 ; 25
	endgroup

	newgroup FUCHSIA                                        ; group  9
	map_const FUCHSIA_CITY,                                20, 18 ;  1
	map_const FUCHSIA_POKECENTER_1F,                        5,  4 ;  2
	map_const FUCHSIA_MART,                                 6,  4 ;  3
	map_const FUCHSIA_GYM,                                  5,  9 ;  4
	map_const BILLS_BROTHERS_HOUSE,                         4,  4 ;  5
	map_const SAFARI_ZONE_MAIN_OFFICE,                      4,  4 ;  6
	map_const SAFARI_ZONE_WARDENS_HOME,                     5,  4 ;  7
	map_const SAFARI_ZONE_GATE,                             5,  4 ;  8
	map_const ROUTE_13,                                    30,  9 ;  9
	map_const ROUTE_14,                                    10, 18 ; 10
	map_const ROUTE_15,                                    20,  9 ; 11
	map_const ROUTE_15_FUCHSIA_GATE,                        5,  4 ; 12
	map_const ROUTE_18,                                    10,  9 ; 13
	endgroup

	newgroup SAFARI                                         ; group 10
	map_const SAFARI_ZONE,                                 30, 27 ;  1
	endgroup

	newgroup SAFFRON_INNER                                  ; group 11
	map_const SAFFRON_CITY,                                20, 18 ;  1
	map_const SAFFRON_POKECENTER_1F,                        5,  4 ;  2
	map_const SAFFRON_MART,                                 6,  4 ;  3
	map_const SAFFRON_GYM,                                 10,  9 ;  4
	map_const FIGHTING_DOJO,                                5,  6 ;  5
	map_const SILPH_CO_1F,                                  8,  4 ;  6
	map_const SAFFRON_MAGNET_TRAIN_STATION,                10,  9 ;  7
	map_const COPYCATS_HOUSE_1F,                            4,  4 ;  8
	map_const COPYCATS_HOUSE_2F,                            5,  3 ;  9
	map_const MR_PSYCHICS_HOUSE,                            4,  4 ; 10
	endgroup

	newgroup SAFFRON_OUTER                                  ; group 12
	map_const ROUTE_5,                                     10,  9 ;  1
	map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ;  2
	map_const ROUTE_5_CLEANSE_TAG_HOUSE,                    4,  4 ;  3
	map_const ROUTE_5_SAFFRON_GATE,                         5,  4 ;  4
	endgroup

	newgroup CINNABAR                                       ; group 13
	map_const CINNABAR_ISLAND,                             10,  9 ;  1
	map_const CINNABAR_POKECENTER_1F,                       5,  4 ;  2
	map_const ROUTE_19,                                    10, 18 ;  3
	map_const ROUTE_19_FUCHSIA_GATE,                        5,  4 ;  4
	map_const ROUTE_20,                                    30,  9 ;  5
	map_const SEAFOAM_GYM,                                 10,  9 ;  6
	map_const ROUTE_21,                                    10, 18 ;  7
	endgroup

	newgroup INDIGO                                         ; group 14
	map_const ROUTE_23,                                    10, 18 ;  1
	map_const INDIGO_PLATEAU_POKECENTER_1F,                 9,  7 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8
	map_const LOUNGE_1F,                                   10,  9 ;  9
	map_const LOUNGE_2F,                                   10,  9 ; 10
	endgroup

	newgroup SILVER                                         ; group 15
	map_const ROUTE_28,                                    20,  9 ;  1
	map_const ROUTE_28_STEEL_WING_HOUSE,                    4,  4 ;  2
	map_const SILVER_CAVE_OUTSIDE,                         20, 18 ;  3
	map_const SILVER_CAVE_POKECENTER_1F,                    5,  4 ;  4
	endgroup

	newgroup NEW_BARK                                       ; group 16
	map_const NEW_BARK_TOWN,                               10,  9 ;  1
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  2
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  3
	map_const ELMS_LAB,                                     5,  6 ;  4
	map_const ELMS_HOUSE,                                   4,  4 ;  5
	map_const PLAYERS_NEIGHBORS_HOUSE,                      4,  4 ;  6
	map_const ROUTE_26,                                    10, 54 ;  7
	map_const ROUTE_26_HEAL_HOUSE,                          4,  4 ;  8
	map_const DAY_OF_WEEK_SIBLINGS_HOUSE,                   4,  4 ;  9
	map_const ROUTE_27,                                    40,  9 ; 10
	map_const ROUTE_27_SANDSTORM_HOUSE,                     4,  4 ; 11
	map_const ROUTE_29,                                    30,  9 ; 12
	map_const ROUTE_29_ROUTE_46_GATE,                       5,  4 ; 13
	endgroup

	newgroup CHERRYGROVE                                    ; group 17
	map_const CHERRYGROVE_CITY,                            20,  9 ;  1
	map_const CHERRYGROVE_POKECENTER_1F,                    5,  4 ;  2
	map_const CHERRYGROVE_MART,                             6,  4 ;  3
	map_const GUIDE_GENTS_HOUSE,                            4,  4 ;  4
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  5
	map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,           4,  4 ;  6
	map_const ROUTE_30,                                    10, 27 ;  7
	map_const MR_POKEMONS_HOUSE,                            4,  4 ;  8
	map_const ROUTE_30_BERRY_HOUSE,                         4,  4 ;  9
	map_const ROUTE_31,                                    20,  9 ; 10
	map_const ROUTE_31_VIOLET_GATE,                         5,  4 ; 11
	endgroup

	newgroup VIOLET                                         ; group 18
	map_const VIOLET_CITY,                                 20, 18 ;  1
	map_const VIOLET_POKECENTER_1F,                         5,  4 ;  2
	map_const VIOLET_MART,                                  6,  4 ;  3
	map_const VIOLET_GYM,                                   5,  8 ;  4
	map_const EARLS_POKEMON_ACADEMY,                        4,  8 ;  5
	map_const VIOLET_KYLES_HOUSE,                           4,  4 ;  6
	map_const VIOLET_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  7
	map_const ROUTE_32,                                    10, 45 ;  8
	map_const ROUTE_32_POKECENTER_1F,                       5,  4 ;  9
	map_const ROUTE_32_RUINS_OF_ALPH_GATE,                  5,  4 ; 10
	map_const ROUTE_35,                                    10, 18 ; 11
	map_const ROUTE_35_GOLDENROD_GATE,                      5,  4 ; 12
	map_const ROUTE_35_NATIONAL_PARK_GATE,                  4,  4 ; 13
	map_const ROUTE_36,                                    30,  9 ; 14
	map_const ROUTE_36_RUINS_OF_ALPH_GATE,                  5,  4 ; 15
	map_const ROUTE_36_NATIONAL_PARK_GATE,                  5,  4 ; 16
	map_const ROUTE_37,                                    10,  9 ; 17
	endgroup

	newgroup AZALEA                                         ; group 19
	map_const AZALEA_TOWN,                                 20,  9 ;  1
	map_const AZALEA_POKECENTER_1F,                         5,  4 ;  2
	map_const AZALEA_MART,                                  6,  4 ;  3
	map_const AZALEA_GYM,                                   5,  8 ;  4
	map_const KURTS_HOUSE,                                  8,  4 ;  5
	map_const CHARCOAL_KILN,                                4,  4 ;  6
	map_const ROUTE_33,                                    10,  9 ;  7
	endgroup

	newgroup GOLDENROD                                      ; group 20
	map_const GOLDENROD_CITY,                              20, 18 ;  1
	map_const GOLDENROD_POKECENTER_1F,                      5,  4 ;  2
	map_const GOLDENROD_DEPT_STORE_1F,                      8,  4 ;  3
	map_const GOLDENROD_DEPT_STORE_2F,                      8,  4 ;  4
	map_const GOLDENROD_DEPT_STORE_3F,                      8,  4 ;  5
	map_const GOLDENROD_DEPT_STORE_4F,                      8,  4 ;  6
	map_const GOLDENROD_DEPT_STORE_5F,                      8,  4 ;  7
	map_const GOLDENROD_DEPT_STORE_6F,                      8,  4 ;  8
	map_const GOLDENROD_DEPT_STORE_ELEVATOR,                2,  2 ;  9
	map_const GOLDENROD_DEPT_STORE_ROOF,                    8,  4 ; 10
	map_const GOLDENROD_GYM,                               10,  9 ; 11
	map_const GOLDENROD_GAME_CORNER,                       10,  7 ; 12
	map_const GOLDENROD_GAME_CORNER_BACKROOM,               5,  4 ; 13
	map_const GOLDENROD_MAGNET_TRAIN_STATION,              10,  9 ; 14
	map_const GOLDENROD_BIKE_SHOP,                          4,  4 ; 15
	map_const GOLDENROD_NAME_RATER,                         4,  4 ; 16
	map_const GOLDENROD_HAPPINESS_RATER,                    4,  4 ; 17
	map_const GOLDENROD_FLOWER_SHOP,                        4,  4 ; 18
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ; 19
	map_const GOLDENROD_PP_SPEECH_HOUSE,                    4,  4 ; 20
	map_const ROUTE_34,                                    10, 27 ; 21
	map_const DAY_CARE,                                     5,  4 ; 22
	map_const ROUTE_34_ILEX_FOREST_GATE,                    5,  4 ; 23
	map_const ILEX_FOREST_AZALEA_GATE,                      5,  4 ; 24
	endgroup

	newgroup ECRUTEAK                                       ; group 21
	map_const ECRUTEAK_CITY,                               20, 18 ;  1
	map_const ECRUTEAK_POKECENTER_1F,                       5,  4 ;  2
	map_const ECRUTEAK_MART,                                6,  4 ;  3
	map_const ECRUTEAK_GYM,                                 5,  9 ;  4
	map_const DANCE_THEATRE,                                6,  7 ;  5
	map_const ECRUTEAK_TIN_TOWER_ENTRANCE,                 10,  9 ;  6
	map_const WISE_TRIOS_ROOM,                              4,  4 ;  7
	map_const ECRUTEAK_LUGIA_SPEECH_HOUSE,                  4,  4 ;  8
	endgroup

	newgroup OLIVINE                                        ; group 22
	map_const OLIVINE_CITY,                                20, 18 ;  1
	map_const OLIVINE_POKECENTER_1F,                        5,  4 ;  2
	map_const OLIVINE_MART,                                 6,  4 ;  3
	map_const OLIVINE_GYM,                                 14, 22 ;  4
	map_const OLIVINE_CAFE,                                 4,  4 ;  5
	map_const OLIVINE_GOOD_ROD_HOUSE,                       4,  4 ;  6
	map_const OLIVINE_TIMS_HOUSE,                           4,  4 ;  7
	map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE,              4,  4 ;  8
	map_const ROUTE_38,                                    20,  9 ;  9
	map_const ROUTE_38_ECRUTEAK_GATE,                       5,  4 ; 10
	map_const ROUTE_39,                                    10, 18 ; 11
	map_const ROUTE_39_FARMHOUSE,                           4,  4 ; 12
	map_const ROUTE_39_BARN,                                4,  4 ; 13
	endgroup

	newgroup CIANWOOD                                       ; group 23
	map_const CIANWOOD_CITY,                               15, 27 ;  1
	map_const CIANWOOD_POKECENTER_1F,                       5,  4 ;  2
	map_const CIANWOOD_GYM,                                 5,  9 ;  3
	map_const CIANWOOD_PHARMACY,                            4,  4 ;  4
	map_const POKE_SEERS_HOUSE,                             4,  4 ;  5
	map_const CIANWOOD_PHOTO_STUDIO,                        4,  4 ;  6
	map_const CIANWOOD_DARKROOM,                            6,  6 ;  7
	map_const MANIAS_HOUSE,                                 4,  4 ;  8
	map_const CIANWOOD_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	map_const ROUTE_40,                                    10, 18 ; 10
	map_const ROUTE_40_BATTLE_TOWER_GATE,                   5,  4 ; 11
	map_const ROUTE_41,                                    25, 27 ; 12
	map_const BATTLE_TOWER_OUTSIDE,                        10, 14 ; 13
	map_const BATTLE_TOWER_1F,                              8,  5 ; 14
	map_const BATTLE_TOWER_ELEVATOR,                        2,  2 ; 15
	map_const BATTLE_TOWER_HALLWAY,                        11,  2 ; 16
	map_const BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 17
	endgroup

	newgroup MAHOGANY                                       ; group 24
	map_const MAHOGANY_TOWN,                               10,  9 ;  1
	map_const MAHOGANY_POKECENTER_1F,                       5,  4 ;  2
	map_const MAHOGANY_GYM,                                 5,  9 ;  3
	map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE,           4,  4 ;  4
	map_const ROUTE_42,                                    30,  9 ;  5
	map_const ROUTE_42_ECRUTEAK_GATE,                       5,  4 ;  6
	map_const ROUTE_44,                                    30,  9 ;  7
	endgroup

	newgroup LAKE_OF_RAGE                                   ; group 25
	map_const LAKE_OF_RAGE,                                20, 18 ;  1
	map_const LAKE_OF_RAGE_MAGIKARP_HOUSE,                  4,  4 ;  2
	map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,              4,  4 ;  3
	map_const ROUTE_43,                                    10, 27 ;  4
	map_const ROUTE_43_GATE,                                5,  4 ;  5
	map_const ROUTE_43_MAHOGANY_GATE,                       5,  4 ;  6
	endgroup

	newgroup BLACKTHORN                                     ; group 26
	map_const BLACKTHORN_CITY,                             20, 18 ;  1
	map_const BLACKTHORN_POKECENTER_1F,                     5,  4 ;  2
	map_const BLACKTHORN_MART,                              6,  4 ;  3
	map_const BLACKTHORN_GYM_1F,                            5,  9 ;  4
	map_const BLACKTHORN_GYM_2F,                            5,  9 ;  5
	map_const MOVE_DELETERS_HOUSE,                          4,  4 ;  6
	map_const BLACKTHORN_EMYS_HOUSE,                        4,  4 ;  7
	map_const BLACKTHORN_DRAGON_SPEECH_HOUSE,               4,  4 ;  8
	map_const ROUTE_45,                                    10, 45 ;  9
	map_const ROUTE_46,                                    10, 18 ; 10
	endgroup

; NOTE: Mt. Moon Square and the Tin Tower Roof are purposely in this group.
; EnterMapWarp in engine/overworld/warp_connection.asm checks for them specifically.
; This way it only has to check for one group prior to checking the individual map.
	newgroup FAST_SHIP                                      ; group 27
	map_const MOUNT_MOON_SQUARE,                           15,  9 ;  1
	map_const MOUNT_MOON_GIFT_SHOP,                         4,  4 ;  2
	map_const FAST_SHIP_1F,                                16,  9 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                  4, 16 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                   4, 16 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,       5, 17 ;  6
	map_const FAST_SHIP_B1F,                               16,  8 ;  7
	map_const VERMILION_PORT_PASSAGE,                      10,  9 ;  9
	map_const VERMILION_PORT,                              10, 18 ; 10
	map_const OLIVINE_PORT_PASSAGE,                        10,  9 ; 11
	map_const OLIVINE_PORT,                                10, 18 ; 12
	map_const TIN_TOWER_ROOF,                              10,  9 ; 13
	endgroup

	newgroup DUNGEONS                                       ; group 28
	map_const MOUNT_MOON_1F,                               20, 18 ;   1
	map_const MOUNT_MOON_B1F,                              20, 18 ;   2
	map_const MOUNT_MOON_B2F,                              25, 19 ;   3
	map_const UNDERGROUND_PATH,                             3, 14 ;   4
	map_const DIGLETTS_CAVE,                               10, 18 ;   5
	map_const ROCK_TUNNEL_1F,                              15, 18 ;   6
	map_const ROCK_TUNNEL_B1F,                             15, 18 ;   7
	map_const ROCK_TUNNEL_ZAPDOS_CHAMBER,                  10, 18 ;   8
	map_const SILPH_CO_2F,                                 15,  9 ;   9
	map_const SILPH_CO_3F,                                 15,  9 ;  10
	map_const SILPH_CO_4F,                                 15,  9 ;  11
	map_const SILPH_CO_5F,                                 15,  9 ;  12
	map_const SILPH_CO_6F,                                 13,  9 ;  13
	map_const SILPH_CO_7F,                                 13,  9 ;  14
	map_const SILPH_CO_8F,                                 13,  9 ;  15
	map_const SILPH_CO_9F,                                 13,  9 ;  16
	map_const SILPH_CO_10F,                                 8,  9 ;  17
	map_const SILPH_CO_11F,                                 8,  9 ;  18
	map_const SEAFOAM_CAVE_PUZZLE_CHAMBER,                  4,  5 ;  19
	map_const SEAFOAM_CAVE_1F,                             15,  4 ;  20
	map_const SEAFOAM_CAVE_B1F,                            24, 22 ;  21
	map_const SEAFOAM_CAVE_B2F,                            10, 18 ;  22
	map_const CERULEAN_CAVE_1F,                            17, 11 ;  23
	map_const CERULEAN_CAVE_2F,                            20, 14 ;  24
	map_const CERULEAN_CAVE_B1F,                           18, 11 ;  25
	map_const DARK_CAVE_VIOLET_ENTRANCE,                   20, 18 ;  26
	map_const DARK_CAVE_BLACKTHORN_ENTRANCE,               15, 18 ;  27
	map_const DARK_CAVE_2F,                                10,  9 ;  28
	map_const SPROUT_TOWER_1F,                             10,  8 ;  29
	map_const SPROUT_TOWER_2F,                             10,  8 ;  30
	map_const SPROUT_TOWER_3F,                             10,  8 ;  31
	map_const RUINS_OF_ALPH_OUTSIDE,                       10, 18 ;  32
	map_const RUINS_OF_ALPH_ANTECHAMBER,                    4,  5 ;  33
	map_const RUINS_OF_ALPH_INNER_CHAMBER,                 10, 14 ;  34
	map_const RUINS_OF_ALPH_KABUTO_CHAMBER,                 4,  5 ;  35
	map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM,               4,  5 ;  36
	map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,              10,  7 ;  37
	map_const RUINS_OF_ALPH_OMANYTE_CHAMBER,                4,  5 ;  38
	map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM,              4,  5 ;  39
	map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,             10,  8 ;  40
	map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER,             4,  5 ;  41
	map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM,           4,  5 ;  42
	map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,          10,  7 ;  43
	map_const RUINS_OF_ALPH_HO_OH_CHAMBER,                  4,  5 ;  44
	map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM,                4,  5 ;  45
	map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,               10, 12 ;  46
	map_const RUINS_OF_ALPH_RESEARCH_CENTER,                4,  4 ;  47
	map_const UNION_CAVE_1F,                               10, 18 ;  48
	map_const UNION_CAVE_B1F,                              10, 18 ;  49
	map_const UNION_CAVE_B2F,                              10, 18 ;  50
	map_const UNION_CAVE_SLOWPOKE_WELL_LINK,               20,  9 ;  51
	map_const SLOWPOKE_WELL_B1F,                           10,  9 ;  52
	map_const SLOWPOKE_WELL_B2F,                           10,  9 ;  53
	map_const ILEX_FOREST,                                 15, 27 ;  54
	map_const GOLDENROD_DEPT_STORE_B1F,                    10,  9 ;  55
	map_const GOLDENROD_UNDERGROUND,                       15, 18 ;  56
	map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 15, 18 ;  57
	map_const GOLDENROD_UNDERGROUND_WAREHOUSE,             10,  9 ;  58
	map_const RADIO_TOWER_1F,                               9,  4 ;  59
	map_const RADIO_TOWER_2F,                               9,  4 ;  60
	map_const RADIO_TOWER_3F,                               9,  4 ;  61
	map_const RADIO_TOWER_4F,                               9,  4 ;  62
	map_const RADIO_TOWER_5F,                               9,  4 ;  63
	map_const NATIONAL_PARK,                               20, 27 ;  64
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ;  65
	map_const BURNED_TOWER_1F,                             10,  9 ;  66
	map_const BURNED_TOWER_B1F,                            10,  9 ;  67
	map_const TIN_TOWER_1F,                                10,  9 ;  68
	map_const TIN_TOWER_2F,                                10,  9 ;  69
	map_const TIN_TOWER_3F,                                10,  9 ;  70
	map_const TIN_TOWER_4F,                                10,  9 ;  71
	map_const TIN_TOWER_5F,                                10,  9 ;  72
	map_const TIN_TOWER_6F,                                10,  9 ;  73
	map_const TIN_TOWER_7F,                                10,  9 ;  74
	map_const TIN_TOWER_8F,                                10,  9 ;  75
	map_const TIN_TOWER_9F,                                10,  9 ;  76
	map_const OLIVINE_LIGHTHOUSE_1F,                       10,  9 ;  77
	map_const OLIVINE_LIGHTHOUSE_2F,                       10,  9 ;  78
	map_const OLIVINE_LIGHTHOUSE_3F,                       10,  9 ;  79
	map_const OLIVINE_LIGHTHOUSE_4F,                       10,  9 ;  80
	map_const OLIVINE_LIGHTHOUSE_5F,                       10,  9 ;  81
	map_const OLIVINE_LIGHTHOUSE_6F,                       10,  9 ;  82
	map_const WHIRL_ISLAND_1F,                             20, 28 ;  83
	map_const WHIRL_ISLAND_B1F,                            20, 18 ;  84
	map_const WHIRL_ISLAND_B2F,                            10, 18 ;  85
	map_const WHIRL_ISLAND_LUGIA_CHAMBER,                  10,  9 ;  86
	map_const MOUNT_MORTAR_1F_OUTSIDE,                     20, 18 ;  87
	map_const MOUNT_MORTAR_1F_INSIDE,                      20, 27 ;  88
	map_const MOUNT_MORTAR_2F_INSIDE,                      20, 18 ;  89
	map_const MOUNT_MORTAR_B1F,                            20, 18 ;  90
	map_const MAHOGANY_MART_1F,                             4,  4 ;  91
	map_const TEAM_ROCKET_BASE_B1F,                        15,  9 ;  92
	map_const TEAM_ROCKET_BASE_B2F,                        15,  9 ;  93
	map_const TEAM_ROCKET_BASE_B3F,                        15,  9 ;  94
	map_const ICE_PATH_1F,                                 20, 18 ;  95
	map_const ICE_PATH_B1F,                                10, 18 ;  96
	map_const ICE_PATH_B2F_MAHOGANY_SIDE,                  10,  9 ;  97
	map_const ICE_PATH_B2F_BLACKTHORN_SIDE,                 5,  9 ;  98
	map_const ICE_PATH_B3F,                                10,  9 ;  99
	map_const ICE_PATH_ARTICUNO_CHAMBER,                   10, 18 ; 100
	map_const DRAGONS_DEN_1F,                               5,  9 ; 101
	map_const DRAGONS_DEN_B1F,                             20, 18 ; 102
	map_const DRAGON_SHRINE,                                5,  5 ; 103
	map_const TOHJO_FALLS,                                 15,  9 ; 104
	map_const MEW_ANTECHAMBER,                              6, 12 ; 105
	map_const MEW_CHAMBER,                                 10,  9 ; 106
	map_const VICTORY_ROAD,                                10, 36 ; 107
	map_const SILVER_CAVE_ROOM_1,                          10, 18 ; 108
	map_const SILVER_CAVE_ROOM_2,                          15, 18 ; 109
	map_const SILVER_CAVE_ROOM_3,                          10, 18 ; 110
	map_const SILVER_CAVE_ITEM_ROOMS,                      10,  9 ; 111
	map_const SILVER_CAVE_MOLTRES_CHAMBER,                 13, 20 ; 112
	endgroup

NUM_MAP_GROUPS EQU const_value ; 28
