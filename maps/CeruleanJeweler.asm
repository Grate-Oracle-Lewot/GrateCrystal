CERULEANJEWELER_STARDUST_MONEY    EQU 1000
CERULEANJEWELER_PEARL_MONEY       EQU 4000
CERULEANJEWELER_BLACK_PEARL_MONEY EQU 5000
CERULEANJEWELER_STAR_PIECE_MONEY  EQU 10000
CERULEANJEWELER_NUGGET_MONEY      EQU 50000

	object_const_def
	const CERULEANJEWELER_BEAUTY
	const CERULEANJEWELER_GENTLEMAN
	const CERULEANJEWELER_PERSIAN
	const CERULEANJEWELER_GOLD_TROPHY
	const CERULEANJEWELER_SILVER_TROPHY
	const CERULEANJEWELER_POKE_BALL

CeruleanJeweler_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanJewelerBeautyScript:
	faceplayer
	opentext
	writetext CeruleanJewelerBeauty_StdText
	waitbutton
	checkmoney YOUR_MONEY, MAX_MONEY - CERULEANJEWELER_NUGGET_MONEY
	ifequal HAVE_MORE, .Skip1
	checkitem NUGGET
	iftrue .Nugget
.Skip1:
	checkmoney YOUR_MONEY, MAX_MONEY - CERULEANJEWELER_STAR_PIECE_MONEY
	ifequal HAVE_MORE, .Skip2
	checkitem STAR_PIECE
	iftrue .StarPiece
.Skip2:
	checkmoney YOUR_MONEY, MAX_MONEY - CERULEANJEWELER_BLACK_PEARL_MONEY
	ifequal HAVE_MORE, .Skip3
	checkitem BLACK_PEARL
	iftrue .BlackPearl
.Skip3:
	checkmoney YOUR_MONEY, MAX_MONEY - CERULEANJEWELER_PEARL_MONEY
	ifequal HAVE_MORE, .Skip4
	checkitem PEARL
	iftrue .Pearl
.Skip4:
	checkmoney YOUR_MONEY, MAX_MONEY - CERULEANJEWELER_STARDUST_MONEY
	ifequal HAVE_MORE, .Skip5
	checkitem STARDUST
	iftrue .Stardust
.Skip5:
	closetext
	end

.Stardust:
	writetext CeruleanJewelerBeauty_StardustText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem STARDUST
	givemoney YOUR_MONEY, CERULEANJEWELER_STARDUST_MONEY
	sjump .Finish

.Pearl:
	writetext CeruleanJewelerBeauty_PearlText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem PEARL
	givemoney YOUR_MONEY, CERULEANJEWELER_PEARL_MONEY
	sjump .Finish

.BlackPearl:
	writetext CeruleanJewelerBeauty_BlackPearlText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem BLACK_PEARL
	givemoney YOUR_MONEY, CERULEANJEWELER_BLACK_PEARL_MONEY
	sjump .Finish

.StarPiece:
	writetext CeruleanJewelerBeauty_StarPieceText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem STAR_PIECE
	givemoney YOUR_MONEY, CERULEANJEWELER_STAR_PIECE_MONEY
	sjump .Finish

.Nugget:
	writetext CeruleanJewelerBeauty_NuggetText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem NUGGET
	givemoney YOUR_MONEY, CERULEANJEWELER_NUGGET_MONEY
.Finish:
	playsound SFX_TRANSACTION
	waitsfx
	writetext CeruleanJewelerBeauty_ThankYouText
	sjump CeruleanJeweler_EndText

.Refused:
	writetext CeruleanJewelerBeauty_RefusedText
CeruleanJeweler_EndText:
	waitbutton
	closetext
	end

CeruleanJewelerGentlemanScript:
	faceplayer
	opentext
	writetext CeruleanJewelerGentlemanText
	waitbutton
	closetext
	turnobject CERULEANJEWELER_GENTLEMAN, UP
	end

CeruleanJewelerPersianScript:
	opentext
	writetext CeruleanJewelerPersianText
	cry PERSIAN
	sjump CeruleanJeweler_EndText

CeruleanJewelerTrophyScript:
	jumptext CeruleanJewelerTrophyText

CeruleanJewelerNuggetTrophyScript:
	jumptext CeruleanJewelerNuggetText

CeruleanJewelerCaseScript:
	jumptext CeruleanJewelerCaseText

CeruleanJewelerBeauty_StdText:
	text "If you have any"
	line "valuables, we'll"

	para "gladly buy them"
	line "off you for above"
	cont "market price."
	done

CeruleanJewelerBeauty_StardustText:
	text "You've brought some"
	line "STARDUST?"

	para "Would you accept"
	line "¥{d:CERULEANJEWELER_STARDUST_MONEY}?"
	done

CeruleanJewelerBeauty_PearlText:
	text "You've brought a"
	line "PEARL?"

	para "Would you accept"
	line "¥{d:CERULEANJEWELER_PEARL_MONEY}?"
	done

CeruleanJewelerBeauty_BlackPearlText:
	text "You've brought a"
	line "BLACK PEARL?"

	para "Would you accept"
	line "¥{d:CERULEANJEWELER_BLACK_PEARL_MONEY}?"
	done

CeruleanJewelerBeauty_StarPieceText:
	text "You've brought a"
	line "STAR PIECE?"

	para "Would you accept"
	line "¥{d:CERULEANJEWELER_STAR_PIECE_MONEY}?"
	done

CeruleanJewelerBeauty_NuggetText:
	text "You've brought a"
	line "NUGGET?"

	para "Would you accept"
	line "¥{d:CERULEANJEWELER_NUGGET_MONEY}?"
	done

CeruleanJewelerBeauty_ThankYouText:
	text "Thank you very"
	line "much!"
	done

CeruleanJewelerBeauty_RefusedText:
	text "Come back if you"
	line "change your mind."
	done

CeruleanJewelerGentlemanText:
	text "They say beauty is"
	line "in the eye of the"
	cont "beyolder…"

	para "That's why I'm"
	line "looking for a new"
	cont "monocle!"
	done

CeruleanJewelerPersianText:
	text "PERSIAN: Perrrrrr…"
	done

CeruleanJewelerTrophyText:
	text "It's an expensive-"
	line "looking trophy."
	done

CeruleanJewelerNuggetText:
	text "It's a giant,"
	line "carved NUGGET."
	done

CeruleanJewelerCaseText:
	text "It's filled with"
	line "expensive jewelry."
	done

CeruleanJeweler_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CERULEAN_CITY, 8
	warp_event  5,  9, CERULEAN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  3,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  4,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  5,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  6,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  7,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  8,  7, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  1,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  2,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  3,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  4,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  5,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  6,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  7,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  8,  6, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  1,  2, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  1,  3, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  3,  3, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  5,  3, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  7,  3, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  8,  3, BGEVENT_READ, CeruleanJewelerCaseScript
	bg_event  8,  2, BGEVENT_READ, CeruleanJewelerCaseScript

	def_object_events
	object_event  6,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerBeautyScript, -1
	object_event  2,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerGentlemanScript, -1
	object_event  1,  1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerPersianScript, -1
	object_event  2,  4, SPRITE_GOLD_TROPHY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerTrophyScript, -1
	object_event  4,  4, SPRITE_SILVER_TROPHY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerTrophyScript, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanJewelerNuggetScript, -1
