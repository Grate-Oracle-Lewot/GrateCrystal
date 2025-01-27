treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ROUTE_26,                  TREEMON_SET_KANTO
	treemon_map ROUTE_27,                  TREEMON_SET_TOWN
	treemon_map ROUTE_28,                  TREEMON_SET_KANTO
	treemon_map ROUTE_29,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_30,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_31,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_32,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_33,                  TREEMON_SET_TOWN
	treemon_map ROUTE_34,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_35,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_36,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_37,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_38,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_39,                  TREEMON_SET_CITY
	treemon_map ROUTE_42,                  TREEMON_SET_CITY
	treemon_map ROUTE_43,                  TREEMON_SET_LAKE
	treemon_map ROUTE_44,                  TREEMON_SET_CITY
	treemon_map ROUTE_46,                  TREEMON_SET_CITY
	treemon_map NEW_BARK_TOWN,             TREEMON_SET_TOWN
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_TOWN
	treemon_map VIOLET_CITY,               TREEMON_SET_TOWN
	treemon_map AZALEA_TOWN,               TREEMON_SET_TOWN
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_TOWN
	treemon_map MAHOGANY_TOWN,             TREEMON_SET_TOWN
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map BATTLE_TOWER_OUTSIDE,      TREEMON_SET_CITY
	treemon_map LAKE_OF_RAGE,              TREEMON_SET_LAKE
	treemon_map DRAGONS_DEN_B1F,           TREEMON_SET_LAKE
	treemon_map MEW_ANTECHAMBER,           TREEMON_SET_FOREST
	treemon_map SILVER_CAVE_OUTSIDE,       TREEMON_SET_KANTO
	db -1

RockMonMaps:
	treemon_map ROUTE_3,                   ROCKMON_SET_MOUNTAIN
	treemon_map ROUTE_40,                  ROCKMON_SET_BEACH
	treemon_map BURNED_TOWER_1F,           ROCKMON_SET_HOT
	treemon_map CIANWOOD_CITY,             ROCKMON_SET_BEACH
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, ROCKMON_SET_NORMAL
	treemon_map ICE_PATH_B3F,              ROCKMON_SET_COLD
	treemon_map TOHJO_FALLS,               ROCKMON_SET_MID
	treemon_map MOUNT_MOON_B2F,            ROCKMON_SET_MOUNTAIN
	treemon_map ROCK_TUNNEL_B1F,           ROCKMON_SET_MOUNTAIN
	treemon_map CERULEAN_CAVE_2F,          ROCKMON_SET_STRONG
	treemon_map CERULEAN_CAVE_B1F,         ROCKMON_SET_STRONG
	treemon_map SAFARI_ZONE_GATE,          ROCKMON_SET_GATE
	db -1
