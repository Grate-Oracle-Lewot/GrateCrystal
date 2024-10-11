CELADONGAMECORNERPRIZEROOM_TM32_COINS EQU 4200
CELADONGAMECORNERPRIZEROOM_TM29_COINS EQU 4200
CELADONGAMECORNERPRIZEROOM_TM57_COINS EQU 4200
CELADONGAMECORNERPRIZEROOM_PORYGON2_COINS  EQU 4000
CELADONGAMECORNERPRIZEROOM_TOGETIC_COINS   EQU 5000
CELADONGAMECORNERPRIZEROOM_DRAGONITE_COINS EQU 9999

	object_const_def
	const CELADONGAMECORNERPRIZEROOM_EKANS
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST

CeladonGameCornerPrizeRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerPrizeRoomPorygonScript:
	opentext
	writetext CeladonGameCornerPrizeRoomPorygonText
	cry PORYGON
	pause 10
	waitbutton
	closetext
	end

CeladonGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPharmacistText

CeladonGameCornerPrizeRoomTMVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
	writetext CeladonPrizeRoom_AskWhichPrizeText
CeladonPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu CeladonPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .DoubleTeam
	ifequal 2, .Psychic
	ifequal 3, .ShadowClaw
	sjump CeladonPrizeRoom_CancelPurchaseScript

.DoubleTeam:
	checkcoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_DOUBLE_TEAM
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_DOUBLE_TEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	sjump CeladonPrizeRoom_purchased

.Psychic:
	checkcoins CELADONGAMECORNERPRIZEROOM_TM29_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_PSYCHIC_M
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_PSYCHIC_M
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM29_COINS
	sjump CeladonPrizeRoom_purchased

.ShadowClaw:
	checkcoins CELADONGAMECORNERPRIZEROOM_TM57_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	getitemname STRING_BUFFER_3, TM_SHADOW_CLAW
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_SHADOW_CLAW
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM57_COINS
	sjump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	sjump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_CancelPurchaseScript:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM32    {d:CELADONGAMECORNERPRIZEROOM_TM32_COINS}@"
	db "TM29    {d:CELADONGAMECORNERPRIZEROOM_TM29_COINS}@"
	db "TM57    {d:CELADONGAMECORNERPRIZEROOM_TM57_COINS}@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomPokemonVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
.loop
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Porygon2
	ifequal 2, .Togetic
	ifequal 3, .Dragonite
	sjump CeladonPrizeRoom_CancelPurchaseScript

.Porygon2:
	checkcoins CELADONGAMECORNERPRIZEROOM_PORYGON2_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetPorygon2
	readvar VAR_BOXSPACE
	ifequal 0, CeladonPrizeRoom_notenoughroom
.GetPorygon2:
	getmonname STRING_BUFFER_3, PORYGON2
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval PORYGON2
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON2, 40
	takecoins CELADONGAMECORNERPRIZEROOM_PORYGON2_COINS
	sjump .loop

.Togetic:
	checkcoins CELADONGAMECORNERPRIZEROOM_TOGETIC_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetTogetic
	readvar VAR_BOXSPACE
	ifequal 0, CeladonPrizeRoom_notenoughroom
.GetTogetic:
	getmonname STRING_BUFFER_3, TOGETIC
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval TOGETIC
	special GameCornerPrizeMonCheckDex
	givepoke TOGETIC, 50
	takecoins CELADONGAMECORNERPRIZEROOM_TOGETIC_COINS
	sjump .loop

.Dragonite:
	checkcoins CELADONGAMECORNERPRIZEROOM_DRAGONITE_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetDragonite
	readvar VAR_BOXSPACE
	ifequal 0, CeladonPrizeRoom_notenoughroom
.GetDragonite:
	getmonname STRING_BUFFER_3, DRAGONITE
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval DRAGONITE
	special GameCornerPrizeMonCheckDex
	givepoke DRAGONITE, 60
	takecoins CELADONGAMECORNERPRIZEROOM_DRAGONITE_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PORYGON2   {d:CELADONGAMECORNERPRIZEROOM_PORYGON2_COINS}@"
	db "TOGETIC    {d:CELADONGAMECORNERPRIZEROOM_TOGETIC_COINS}@"
	db "DRAGONITE  {d:CELADONGAMECORNERPRIZEROOM_DRAGONITE_COINS}@"
	db "CANCEL@"

CeladonGameCornerPrizeRoomPorygonText:
	text "PORYGON: 00110100"
	line "00110010!"
	done

CeladonGameCornerPrizeRoomPharmacistText:
	text "Whew…"

	para "I've got to stay"
	line "calm and cool…"

	para "I can't lose my"
	line "cool, or I'll lose"
	cont "all my money…"
	done

CeladonPrizeRoom_PrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text "OK, so you wanted"
	line "a @"
	text_ram wStringBuffer3
	text "?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "Here you go!"
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "You have no room"
	line "for it."
	done

CeladonPrizeRoom_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

CeladonGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, CELADON_CITY, 7
	warp_event  3,  5, CELADON_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomTMVendor
	bg_event  4,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomPokemonVendor

	def_object_events
	object_event  0,  2, SPRITE_EKANS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPorygonScript, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPharmacistScript, -1
