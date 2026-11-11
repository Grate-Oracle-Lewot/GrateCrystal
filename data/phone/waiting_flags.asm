PhoneContactWaitingFlags:
; The engine flags that mean a contact has something waiting for the player:
; a rematch, then an item (-1 = none). A contact with either set doesn't call.
; entries correspond to PHONE_* constants
	table_width 4
	dw -1,                               -1                             ; PHONE_00
	dw -1,                               -1                             ; PHONE_MOM
	dw -1,                               -1                             ; PHONE_OAK
	dw -1,                               -1                             ; PHONE_BILL
	dw -1,                               -1                             ; PHONE_ELM
	dw ENGINE_JACK_READY_FOR_REMATCH,    -1                             ; PHONE_SCHOOLBOY_JACK
	dw -1,                               ENGINE_BEVERLY_HAS_NUGGET      ; PHONE_POKEFAN_BEVERLY
	dw ENGINE_HUEY_READY_FOR_REMATCH,    -1                             ; PHONE_SAILOR_HUEY
	dw -1,                               -1                             ; unused
	dw -1,                               -1                             ; unused
	dw -1,                               -1                             ; unused
	dw ENGINE_GAVEN_READY_FOR_REMATCH,   -1                             ; PHONE_COOLTRAINERM_GAVEN
	dw ENGINE_BETH_READY_FOR_REMATCH,    -1                             ; PHONE_COOLTRAINERF_BETH
	dw ENGINE_JOSE_READY_FOR_REMATCH,    ENGINE_JOSE_HAS_STAR_PIECE     ; PHONE_BIRDKEEPER_JOSE
	dw ENGINE_REENA_READY_FOR_REMATCH,   -1                             ; PHONE_COOLTRAINERF_REENA
	dw ENGINE_JOEY_READY_FOR_REMATCH,    -1                             ; PHONE_YOUNGSTER_JOEY
	dw ENGINE_WADE_READY_FOR_REMATCH,    ENGINE_WADE_HAS_ITEM           ; PHONE_BUG_CATCHER_WADE
	dw ENGINE_RALPH_READY_FOR_REMATCH,   -1                             ; PHONE_FISHER_RALPH
	dw ENGINE_LIZ_READY_FOR_REMATCH,     -1                             ; PHONE_PICNICKER_LIZ
	dw ENGINE_ANTHONY_READY_FOR_REMATCH, -1                             ; PHONE_HIKER_ANTHONY
	dw ENGINE_TODD_READY_FOR_REMATCH,    -1                             ; PHONE_CAMPER_TODD
	dw ENGINE_GINA_READY_FOR_REMATCH,    ENGINE_GINA_HAS_LEAF_STONE     ; PHONE_PICNICKER_GINA
	dw -1,                               -1                             ; PHONE_JUGGLER_IRWIN
	dw ENGINE_ARNIE_READY_FOR_REMATCH,   -1                             ; PHONE_BUG_CATCHER_ARNIE
	dw ENGINE_ALAN_READY_FOR_REMATCH,    ENGINE_ALAN_HAS_FIRE_STONE     ; PHONE_SCHOOLBOY_ALAN
	dw -1,                               -1                             ; unused
	dw ENGINE_DANA_READY_FOR_REMATCH,    ENGINE_DANA_HAS_THUNDERSTONE   ; PHONE_LASS_DANA
	dw ENGINE_CHAD_READY_FOR_REMATCH,    -1                             ; PHONE_SCHOOLBOY_CHAD
	dw -1,                               ENGINE_DEREK_HAS_NUGGET        ; PHONE_POKEFANM_DEREK
	dw ENGINE_TULLY_READY_FOR_REMATCH,   ENGINE_TULLY_HAS_WATER_STONE   ; PHONE_FISHER_TULLY
	dw ENGINE_BRENT_READY_FOR_REMATCH,   -1                             ; PHONE_POKEMANIAC_BRENT
	dw ENGINE_TIFFANY_READY_FOR_REMATCH, ENGINE_TIFFANY_HAS_PINK_BOW    ; PHONE_PICNICKER_TIFFANY
	dw ENGINE_VANCE_READY_FOR_REMATCH,   -1                             ; PHONE_BIRDKEEPER_VANCE
	dw ENGINE_WILTON_READY_FOR_REMATCH,  ENGINE_WILTON_HAS_ITEM         ; PHONE_FISHER_WILTON
	dw -1,                               -1                             ; PHONE_BLACKBELT_KENJI
	dw ENGINE_PARRY_READY_FOR_REMATCH,   -1                             ; PHONE_HIKER_PARRY
	dw ENGINE_ERIN_READY_FOR_REMATCH,    -1                             ; PHONE_PICNICKER_ERIN
	dw -1,                               -1                             ; PHONE_BUENA
	assert_table_length NUM_PHONE_CONTACTS + 1
