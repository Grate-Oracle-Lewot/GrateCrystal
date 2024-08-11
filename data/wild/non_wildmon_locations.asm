specialencounter: MACRO
; requested mon, offered mon, item, OT ID, OT name, gender requested
	db \1
	dw \2
	map_id \3
	dw \4
ENDM

EventWildMons::
; 	specialencounter SPECIES,	EVENT_FLAG,					map_id, blurb string ptr
	specialencounter OMANYTE,	-1,						PEWTER_MUSEUM_1F, OmanyteFossil_Str
	specialencounter OMASTAR,	-1,						PEWTER_MUSEUM_1F, OmanyteFossil_Str
	specialencounter KABUTO,	-1,						PEWTER_MUSEUM_1F, KabutoFossil_Str
	specialencounter KABUTOPS,	-1,						PEWTER_MUSEUM_1F, KabutoFossil_Str
	specialencounter AERODACTYL,	-1,						UNION_CAVE_B2F, AerodactylFriday_Str
	specialencounter AERODACTYL,	-1,						PEWTER_MUSEUM_1F, AerodactylFossil_Str
	db -1

; LoadWildMon Dex Hints, max 18 chars per line
OmanyteFossil_Str:
	db   "Revive from HELIX"
	next "FOSSILS found by"
	next "smashing rocks.@"

KabutoFossil_Str:
	db   "Revive from DOME"
	next "FOSSILS found by"
	next "smashing rocks.@"

AerodactylFriday_Str:
	db   "Appears once every"
	next "Friday deep inside"
	next "UNION CAVE.@"

AerodactylFossil_Str:
	db   "Revive from OLD"
	next "AMBER found by"
	next "smashing rocks.@"
