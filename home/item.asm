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

	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db POKE_DOLL
	db SMOKE_BALL
	db ESCAPE_ROPE
	db SWAG_BEACON
	db EXP_SHARE
	db LUCKY_EGG

	db REVIVE
	db MAX_REVIVE
	db POTION
	db RAGECANDYBAR
	db SUPER_POTION
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db MOOMOO_MILK
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FULL_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL

	db ETHER
	db MAX_ETHER
	db ELIXER
	db MAX_ELIXER

	db ENERGYPOWDER
	db ENERGY_ROOT
	db REVIVAL_HERB
	db HEAL_POWDER
	db SACRED_ASH

	db X_ATTACK
	db X_DEFEND
	db X_SPECIAL
	db X_SP_DEFEND
	db X_SPEED
	db X_ACCURACY
	db X_EVADE
	db DIRE_HIT
	db GUARD_SPEC

	db RARE_CANDY
	db PP_UP
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM

	db UP_GRADE
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db EVERSTONE

	db SLOWPOKETAIL
	db LEFTOVERS
	db CANDIED_YAM

	db QUICK_CLAW
	db KINGS_ROCK
	db FOCUS_BAND
	db SCOPE_LENS
	db BRIGHTPOWDER
	db DICTIONARY
	db NOISEMAKER
	db LIMBO_STICK
	db ANTIVENOM
	db ALOE_VERA
	db HANDWARMER
	db BIG_PEARL
	db HARDHAT
	db AMULET_COIN
	db CATCH_CHARM
	db CLEANSE_TAG

	db PINK_BOW
	db BLACKBELT_I
	db BLACKGLASSES
	db MIRACLE_SEED
	db CHARCOAL
	db MYSTIC_WATER
	db NEVERMELTICE
	db MAGNET
	db HARD_STONE
	db SOFT_SAND
	db METAL_COAT
	db SHARP_BEAK
	db SILVERPOWDER
	db POISON_BARB
	db TWISTEDSPOON
	db SPELL_TAG
	db DRAGON_FANG
	db POLKADOT_BOW
	db TRIDENT

	db LIGHT_BALL
	db THICK_CLUB
	db STICK
	db LUCKY_PUNCH
	db DRAGON_SCALE

	db NUGGET
	db PEARL
	db STARDUST
	db STAR_PIECE
	db TINYMUSHROOM
	db BIG_MUSHROOM
	db GOLD_LEAF
	db SILVER_LEAF
	db HELIX_FOSSIL
	db DOME_FOSSIL
	db OLD_AMBER
	db BRICK_PIECE

	db FLOWER_MAIL
	db LOVELY_MAIL
	db MUSIC_MAIL
	db SURF_MAIL
	db EON_MAIL
	db MORPH_MAIL
	db LITEBLUEMAIL
	db BLUESKY_MAIL
	db MIRAGE_MAIL
	db PORTRAITMAIL

	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db DUSK_BALL
	db TIMER_BALL
	db LEVEL_BALL
	db LURE_BALL
	db FAST_BALL
	db FRIEND_BALL
	db LOVE_BALL
	db HEAVY_BALL
	db MOON_BALL
	db MASTER_BALL
	db PARK_BALL

	db BERRY
	db GOLD_BERRY
	db BERRY_JUICE
	db MYSTERYBERRY
	db MIRACLEBERRY
	db MINT_BERRY
	db PRZCUREBERRY
	db PSNCUREBERRY
	db BURNT_BERRY
	db ICE_BERRY
	db BITTER_BERRY

	db RED_APRICORN
	db BLU_APRICORN
	db YLW_APRICORN
	db GRN_APRICORN
	db PNK_APRICORN
	db BLK_APRICORN
	db WHT_APRICORN

	db POCKET_PC
	db CLEAR_BELL
	db FEAROWBOT
	db DISCO_BALL
	db SUPER_ROD
	db ODD_ROD
	db GOOD_ROD
	db OLD_ROD
	db BICYCLE
	db HEDGER
	db PICKAXE
	db FLOATIE
	db EGG_BEATER
	db GRAVITY_BUOY
	db COIN_CASE
	db BLUE_CARD
	db S_S_TICKET
	db PASS
	db MYSTERY_EGG
	db SQUIRTBOTTLE
	db GS_BALL
	db SECRETPOTION
	db RED_SCALE
	db BASEMENT_KEY
	db CARD_KEY
	db LOST_ITEM
	db MACHINE_PART
	db RAINBOW_WING
	db SILVER_WING

	db NO_ITEM
	assert_table_length NUM_ITEMS + 1
	db -1 ; end
