MACRO map_icon
; overworld sprite, NPC palette: as the trainer's object_event has them
	db SPRITE_\1, PAL_OW_\2
	assert PAL_OW_\2 < NUM_MAP_TRAINER_PALS, "the map views only load the red, blue, green and brown NPC colors"
ENDM

PhoneContactMapIcons:
; Each contact's icon in the Pokegear map's and the Fly map's REMATCH and GIFTS views. Only contacts
; with a rematch or item flag (data/phone/waiting_flags.asm) ever show; the rest are 0.
; entries correspond to PHONE_* constants
	table_width 2
	db 0, 0                              ; PHONE_00
	db 0, 0                              ; PHONE_MOM
	db 0, 0                              ; PHONE_OAK
	db 0, 0                              ; PHONE_BILL
	db 0, 0                              ; PHONE_ELM
	map_icon YOUNGSTER,          BLUE    ; PHONE_SCHOOLBOY_JACK
	map_icon POKEFAN_F,          RED     ; PHONE_POKEFAN_BEVERLY
	map_icon SAILOR,             BLUE    ; PHONE_SAILOR_HUEY
	db 0, 0                              ; unused
	db 0, 0                              ; unused
	db 0, 0                              ; unused
	map_icon COOLTRAINER_M,      RED     ; PHONE_COOLTRAINERM_GAVEN
	map_icon COOLTRAINER_F,      RED     ; PHONE_COOLTRAINERF_BETH
	map_icon YOUNGSTER,          BLUE    ; PHONE_BIRDKEEPER_JOSE
	map_icon COOLTRAINER_F,      RED     ; PHONE_COOLTRAINERF_REENA
	map_icon YOUNGSTER,          BLUE    ; PHONE_YOUNGSTER_JOEY
	map_icon BUG_CATCHER,        BROWN   ; PHONE_BUG_CATCHER_WADE
	map_icon FISHER,             GREEN   ; PHONE_FISHER_RALPH
	map_icon LASS,               GREEN   ; PHONE_PICNICKER_LIZ
	map_icon POKEFAN_M,          BROWN   ; PHONE_HIKER_ANTHONY
	map_icon YOUNGSTER,          GREEN   ; PHONE_CAMPER_TODD
	map_icon LASS,               GREEN   ; PHONE_PICNICKER_GINA
	db 0, 0                              ; PHONE_JUGGLER_IRWIN
	map_icon BUG_CATCHER,        BROWN   ; PHONE_BUG_CATCHER_ARNIE
	map_icon YOUNGSTER,          BLUE    ; PHONE_SCHOOLBOY_ALAN
	db 0, 0                              ; unused
	map_icon LASS,               BLUE    ; PHONE_LASS_DANA
	map_icon STANDING_YOUNGSTER, BLUE    ; PHONE_SCHOOLBOY_CHAD
	map_icon POKEFAN_M,          RED     ; PHONE_POKEFANM_DEREK
	map_icon FISHER,             GREEN   ; PHONE_FISHER_TULLY
	map_icon SUPER_NERD,         BLUE    ; PHONE_POKEMANIAC_BRENT
	map_icon LASS,               GREEN   ; PHONE_PICNICKER_TIFFANY
	map_icon YOUNGSTER,          BLUE    ; PHONE_BIRDKEEPER_VANCE
	map_icon FISHER,             GREEN   ; PHONE_FISHER_WILTON
	db 0, 0                              ; PHONE_BLACKBELT_KENJI
	map_icon POKEFAN_M,          BROWN   ; PHONE_HIKER_PARRY
	map_icon LASS,               GREEN   ; PHONE_PICNICKER_ERIN
	db 0, 0                              ; PHONE_BUENA
	assert_table_length NUM_PHONE_CONTACTS + 1
