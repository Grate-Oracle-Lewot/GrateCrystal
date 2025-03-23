DoItemEffect::
	farcall _DoItemEffect
	ret

CheckTossableItem::
	push hl
	push de
	push bc
	farcall _CheckTossableItem
	pop bc
	pop de
	pop hl
	ret

TossItem::
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_TossItem)
	rst Bankswitch

	call _TossItem

	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret

ReceiveItem::
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_ReceiveItem)
	rst Bankswitch
	push hl
	push de

	call _ReceiveItem

	pop de
	pop hl
	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	ret

CheckItem::
	push hl
	push de
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(_CheckItem)
	rst Bankswitch

	call _CheckItem

	pop bc
	ld a, b
	rst Bankswitch
	pop bc
	pop de
	pop hl
	ret

ItemNameOrder::
 	table_width 1, ItemNameOrder
	db NO_ITEM      ; 00

	db REPEL        ; 01
	db SUPER_REPEL  ; 02
	db MAX_REPEL    ; 03
	db POKE_DOLL    ; 04
	db SMOKE_BALL   ; 05
	db ESCAPE_ROPE  ; 06
	db SWAG_BEACON  ; 07
	db EXP_SHARE    ; 08
	db LUCKY_EGG    ; 09

	db REVIVE       ; 0a
	db MAX_REVIVE   ; 0b
	db POTION       ; 0c
	db RAGECANDYBAR ; 0d
	db SUPER_POTION ; 0e
	db FRESH_WATER  ; 0f
	db SODA_POP     ; 10
	db LEMONADE     ; 11
	db MOOMOO_MILK  ; 12
	db HYPER_POTION ; 13
	db MAX_POTION   ; 14
	db FULL_RESTORE ; 15
	db FULL_HEAL    ; 16
	db AWAKENING    ; 17
	db PARLYZ_HEAL  ; 18
	db ANTIDOTE     ; 19
	db BURN_HEAL    ; 1a
	db ICE_HEAL     ; 1b

	db ENERGYPOWDER ; 1c
	db ENERGY_ROOT  ; 1d
	db REVIVAL_HERB ; 1e
	db HEAL_POWDER  ; 1f

	db ETHER        ; 20
	db MAX_ETHER    ; 21
	db ELIXER       ; 22
	db MAX_ELIXER   ; 23

	db X_ATTACK     ; 24
	db X_DEFEND     ; 25
	db X_SPECIAL    ; 26
	db X_SP_DEFEND  ; 27
	db X_SPEED      ; 28
	db X_ACCURACY   ; 29
	db X_EVADE      ; 2a
	db DIRE_HIT     ; 2b
	db GUARD_SPEC   ; 2c

	db SACRED_ASH   ; 2d
	db RARE_CANDY   ; 2e
	db PP_UP        ; 2f
	db HP_UP        ; 30
	db PROTEIN      ; 31
	db IRON         ; 32
	db CARBOS       ; 33
	db CALCIUM      ; 34

	db UP_GRADE     ; 35
	db LEAF_STONE   ; 36
	db FIRE_STONE   ; 37
	db WATER_STONE  ; 38
	db THUNDERSTONE ; 39
	db MOON_STONE   ; 3a
	db SUN_STONE    ; 3b
	db EVERSTONE    ; 3c

	db SLOWPOKETAIL ; 3d
	db LEFTOVERS    ; 3e
	db CANDIED_YAM  ; 3f

	db QUICK_CLAW   ; 40
	db KINGS_ROCK   ; 41
	db FOCUS_BAND   ; 42
	db SCOPE_LENS   ; 43
	db BRIGHTPOWDER ; 44
	db DICTIONARY   ; 45
	db NOISEMAKER   ; 46
	db LIMBO_STICK  ; 47
	db ANTIVENOM    ; 48
	db ALOE_VERA    ; 49
	db HANDWARMER   ; 4a
	db BIG_PEARL    ; 4b
	db HARDHAT      ; 4c
	db AMULET_COIN  ; 4d
	db CATCH_CHARM  ; 4e
	db CLEANSE_TAG  ; 4f

	db PINK_BOW     ; 50
	db BLACKBELT_I  ; 51
	db BLACKGLASSES ; 52
	db MIRACLE_SEED ; 53
	db CHARCOAL     ; 54
	db MYSTIC_WATER ; 55
	db NEVERMELTICE ; 56
	db MAGNET       ; 57
	db HARD_STONE   ; 58
	db SOFT_SAND    ; 59
	db METAL_COAT   ; 5a
	db SHARP_BEAK   ; 5b
	db SILVERPOWDER ; 5c
	db POISON_BARB  ; 5d
	db TWISTEDSPOON ; 5e
	db SPELL_TAG    ; 5f
	db DRAGON_FANG  ; 60
	db POLKADOT_BOW ; 61
	db TRIDENT      ; 62

	db LIGHT_BALL   ; 63
	db THICK_CLUB   ; 64
	db STICK        ; 65
	db LUCKY_PUNCH  ; 66
	db DRAGON_SCALE ; 67

	db NUGGET       ; 68
	db PEARL        ; 69
	db STARDUST     ; 6a
	db STAR_PIECE   ; 6b
	db TINYMUSHROOM ; 6c
	db BIG_MUSHROOM ; 6d
	db GOLD_LEAF    ; 6e
	db SILVER_LEAF  ; 6f
	db HELIX_FOSSIL ; 70
	db DOME_FOSSIL  ; 71
	db OLD_AMBER    ; 72
	db BRICK_PIECE  ; 73

	db FLOWER_MAIL  ; 74
	db LOVELY_MAIL  ; 75
	db MUSIC_MAIL   ; 76
	db SURF_MAIL    ; 77
	db EON_MAIL     ; 78
	db MORPH_MAIL   ; 79
	db LITEBLUEMAIL ; 7a
	db BLUESKY_MAIL ; 7b
	db MIRAGE_MAIL  ; 7c
	db PORTRAITMAIL ; 7d

	db POKE_BALL    ; 7e
	db GREAT_BALL   ; 7f
	db ULTRA_BALL   ; 80
	db DUSK_BALL    ; 81
	db TIMER_BALL   ; 82
	db LEVEL_BALL   ; 83
	db LURE_BALL    ; 84
	db FAST_BALL    ; 85
	db FRIEND_BALL  ; 86
	db LOVE_BALL    ; 87
	db HEAVY_BALL   ; 88
	db MOON_BALL    ; 89
	db MASTER_BALL  ; 8a
	db PARK_BALL    ; 8b

	db BERRY        ; 8c
	db GOLD_BERRY   ; 8d
	db BERRY_JUICE  ; 8e
	db MYSTERYBERRY ; 8f
	db MIRACLEBERRY ; 90
	db MINT_BERRY   ; 91
	db PRZCUREBERRY ; 92
	db PSNCUREBERRY ; 93
	db BURNT_BERRY  ; 94
	db ICE_BERRY    ; 95
	db BITTER_BERRY ; 96

	db RED_APRICORN ; 97
	db BLU_APRICORN ; 98
	db YLW_APRICORN ; 99
	db GRN_APRICORN ; 9a
	db PNK_APRICORN ; 9b
	db BLK_APRICORN ; 9c
	db WHT_APRICORN ; 9d

	db POCKET_PC    ; 9e
	db CLEAR_BELL   ; 9f
	db FEAROWBOT    ; a0
	db DISCO_BALL   ; a1
	db SUPER_ROD    ; a2
	db ODD_ROD      ; a3
	db GOOD_ROD     ; a4
	db OLD_ROD      ; a5
	db BICYCLE      ; a6
	db HEDGER       ; a7
	db PICKAXE      ; a8
	db FLOATIE      ; a9
	db EGG_BEATER   ; aa
	db GRAVITY_BUOY ; ab
	db COIN_CASE    ; ac
	db BLUE_CARD    ; ad
	db S_S_TICKET   ; ae
	db PASS         ; af
	db MYSTERY_EGG  ; b0
	db SQUIRTBOTTLE ; b1
	db GS_BALL      ; b2
	db SECRETPOTION ; b3
	db RED_SCALE    ; b4
	db BASEMENT_KEY ; b5
	db CARD_KEY     ; b6
	db LOST_ITEM    ; b7
	db MACHINE_PART ; b8
	db RAINBOW_WING ; b9
	db SILVER_WING  ; ba

	assert_table_length NUM_ITEMS + 1
	db -1 ; end
