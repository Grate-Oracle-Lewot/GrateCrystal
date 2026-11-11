PhoneContactRematchDays:
; Each contact's rematch day and the daily flag a call sets once it has set up that day's rematch
; (-1 = no rematch day). The days must match the ones in the contacts' callee scripts.
; entries correspond to PHONE_* constants
	table_width 3
	dbw -1,        -1                       ; PHONE_00
	dbw -1,        -1                       ; PHONE_MOM
	dbw -1,        -1                       ; PHONE_OAK
	dbw -1,        -1                       ; PHONE_BILL
	dbw -1,        -1                       ; PHONE_ELM
	dbw MONDAY,    ENGINE_JACK_MONDAY       ; PHONE_SCHOOLBOY_JACK
	dbw -1,        -1                       ; PHONE_POKEFAN_BEVERLY
	dbw WEDNESDAY, ENGINE_HUEY_WEDNESDAY    ; PHONE_SAILOR_HUEY
	dbw -1,        -1                       ; unused
	dbw -1,        -1                       ; unused
	dbw -1,        -1                       ; unused
	dbw THURSDAY,  ENGINE_GAVEN_THURSDAY    ; PHONE_COOLTRAINERM_GAVEN
	dbw FRIDAY,    ENGINE_BETH_FRIDAY       ; PHONE_COOLTRAINERF_BETH
	dbw SATURDAY,  ENGINE_JOSE_SATURDAY     ; PHONE_BIRDKEEPER_JOSE
	dbw SUNDAY,    ENGINE_REENA_SUNDAY      ; PHONE_COOLTRAINERF_REENA
	dbw MONDAY,    ENGINE_JOEY_MONDAY       ; PHONE_YOUNGSTER_JOEY
	dbw TUESDAY,   ENGINE_WADE_TUESDAY      ; PHONE_BUG_CATCHER_WADE
	dbw WEDNESDAY, ENGINE_RALPH_WEDNESDAY   ; PHONE_FISHER_RALPH
	dbw THURSDAY,  ENGINE_LIZ_THURSDAY      ; PHONE_PICNICKER_LIZ
	dbw FRIDAY,    ENGINE_ANTHONY_FRIDAY    ; PHONE_HIKER_ANTHONY
	dbw SATURDAY,  ENGINE_TODD_SATURDAY     ; PHONE_CAMPER_TODD
	dbw SUNDAY,    ENGINE_GINA_SUNDAY       ; PHONE_PICNICKER_GINA
	dbw -1,        -1                       ; PHONE_JUGGLER_IRWIN
	dbw TUESDAY,   ENGINE_ARNIE_TUESDAY     ; PHONE_BUG_CATCHER_ARNIE
	dbw WEDNESDAY, ENGINE_ALAN_WEDNESDAY    ; PHONE_SCHOOLBOY_ALAN
	dbw -1,        -1                       ; unused
	dbw THURSDAY,  ENGINE_DANA_THURSDAY     ; PHONE_LASS_DANA
	dbw FRIDAY,    ENGINE_CHAD_FRIDAY       ; PHONE_SCHOOLBOY_CHAD
	dbw -1,        -1                       ; PHONE_POKEFANM_DEREK
	dbw SUNDAY,    ENGINE_TULLY_SUNDAY      ; PHONE_FISHER_TULLY
	dbw MONDAY,    ENGINE_BRENT_MONDAY      ; PHONE_POKEMANIAC_BRENT
	dbw TUESDAY,   ENGINE_TIFFANY_TUESDAY   ; PHONE_PICNICKER_TIFFANY
	dbw WEDNESDAY, ENGINE_VANCE_WEDNESDAY   ; PHONE_BIRDKEEPER_VANCE
	dbw THURSDAY,  ENGINE_WILTON_THURSDAY   ; PHONE_FISHER_WILTON
	dbw -1,        -1                       ; PHONE_BLACKBELT_KENJI
	dbw FRIDAY,    ENGINE_PARRY_FRIDAY      ; PHONE_HIKER_PARRY
	dbw SATURDAY,  ENGINE_ERIN_SATURDAY     ; PHONE_PICNICKER_ERIN
	dbw -1,        -1                       ; PHONE_BUENA
	assert_table_length NUM_PHONE_CONTACTS + 1
