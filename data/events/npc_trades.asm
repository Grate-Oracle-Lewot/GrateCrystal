npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, DROWZEE,    MACHOP,     "MAPIGNON@@@", $58, $67, ANTIVENOM,    37460, "MIKE@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    BELLSPROUT, ONIX,       "SOLIDSNAKE@", $96, $66, NOISEMAKER,   48926, "KYLE@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     VOLTORB,    "WHEATLEY@@@", $98, $98, SMOKE_BALL,   29189, "TIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRAGONAIR,  TOGETIC,    "HERETIC@@@@", $78, $6D, DICTIONARY,   00283, "EMY@@@@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "XAVIER@@@@@", $66, $6B, MYSTERYBERRY, 15616, "CHRIS@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "PTERRY@@@@@", $E6, $E7, LUCKY_EGG,    26491, "KIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "TRIHARD@@@@", $BB, $BB, TRIDENT,      50082, "FOREST@@@@@", TRADE_GENDER_MALE
	npctrade TRADE_DIALOGSET_GIRL,      FLOGISTAN,  SNOCONEY,   "INLé@@@@@@@", $F0, $F0, GOLD_LEAF,    86753, "FLORIA@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
