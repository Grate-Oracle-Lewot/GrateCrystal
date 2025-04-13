GOLDENRODGAMECORNER_TM25_COINS EQU 5000
GOLDENRODGAMECORNER_TM14_COINS EQU 5000
GOLDENRODGAMECORNER_TM38_COINS EQU 5000
GOLDENRODGAMECORNER_ABRA_COINS      EQU 500
GOLDENRODGAMECORNER_PORYGON_COINS   EQU 1000
GOLDENRODGAMECORNER_WOBBUFFET_COINS EQU 1500
GOLDENRODGAMECORNER_SWINUB_COINS    EQU 1000
GOLDENRODGAMECORNER_GLIGAR_COINS    EQU 3000
GOLDENRODGAMECORNER_SKARMORY_COINS  EQU 3000

	object_const_def
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_MOVETUTOR

GoldenrodGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_BEAT_WHITNEY
	iftrue .double_check
	appear GOLDENRODGAMECORNER_MOVETUTOR
	endcallback

.double_check
	checkitem COIN_CASE
	iftrue .move_tutor_outside
	appear GOLDENRODGAMECORNER_MOVETUTOR
	endcallback

.move_tutor_outside
	disappear GOLDENRODGAMECORNER_MOVETUTOR
	endcallback

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_MOVETUTOR, RIGHT
	end

GoldenrodGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNER_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM25_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNER_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM14_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNER_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM38_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    {d:GOLDENRODGAMECORNER_TM25_COINS}@"
	db "TM14    {d:GOLDENRODGAMECORNER_TM14_COINS}@"
	db "TM38    {d:GOLDENRODGAMECORNER_TM38_COINS}@"
	db "CANCEL@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	readvar VAR_WEEKDAY
	ifequal SATURDAY, GoldenrodGameCornerPrizeMonVendorWeekendScript
	ifequal SUNDAY, GoldenrodGameCornerPrizeMonVendorWeekendScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Porygon
	ifequal 3, .Wobbuffet
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetAbra
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetAbra:
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 10
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.Porygon:
	checkcoins GOLDENRODGAMECORNER_PORYGON_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetPorygon
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetPorygon:
	getmonname STRING_BUFFER_3, PORYGON
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 10
	takecoins GOLDENRODGAMECORNER_PORYGON_COINS
	sjump .loop

.Wobbuffet:
	checkcoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetWobbuffet
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetWobbuffet:
	getmonname STRING_BUFFER_3, WOBBUFFET
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval WOBBUFFET
	special GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 20
	takecoins GOLDENRODGAMECORNER_WOBBUFFET_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        {d:GOLDENRODGAMECORNER_ABRA_COINS}@"
	db "PORYGON    {d:GOLDENRODGAMECORNER_PORYGON_COINS}@"
	db "WOBBUFFET  {d:GOLDENRODGAMECORNER_WOBBUFFET_COINS}@"
	db "CANCEL@"

GoldenrodGameCornerPrizeMonVendorWeekendScript:
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Swinub
	ifequal 2, .Gligar
	ifequal 3, .Skarmory
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Swinub:
	checkcoins GOLDENRODGAMECORNER_SWINUB_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetSwinub
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetSwinub:
	getmonname STRING_BUFFER_3, SWINUB
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval SWINUB
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 15
	takecoins GOLDENRODGAMECORNER_SWINUB_COINS
	sjump .loop

.Gligar:
	checkcoins GOLDENRODGAMECORNER_GLIGAR_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetGligar
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetGligar:
	getmonname STRING_BUFFER_3, GLIGAR
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval GLIGAR
	special GameCornerPrizeMonCheckDex
	givepoke GLIGAR, 15
	takecoins GOLDENRODGAMECORNER_GLIGAR_COINS
	sjump .loop

.Skarmory:
	checkcoins GOLDENRODGAMECORNER_SKARMORY_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .GetSkarmory
	readvar VAR_BOXSPACE
	ifequal 0, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
.GetSkarmory:
	getmonname STRING_BUFFER_3, SKARMORY
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval SKARMORY
	special GameCornerPrizeMonCheckDex
	givepoke SKARMORY, 15
	takecoins GOLDENRODGAMECORNER_SKARMORY_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SWINUB     {d:GOLDENRODGAMECORNER_SWINUB_COINS}@"
	db "GLIGAR     {d:GOLDENRODGAMECORNER_GLIGAR_COINS}@"
	db "SKARMORY   {d:GOLDENRODGAMECORNER_SKARMORY_COINS}@"
	db "CANCEL@"

GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerLuckySlotsMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

GoldenrodGameCornerVoltorbFlipMachineScript:
	special VoltorbFlip
	end

GoldenrodGameCornerPosterScript:
	opentext
	writetext GoldenrodGameCornerBehindPosterText
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_ENTER_DOOR
	warp GOLDENROD_GAME_CORNER_BACKROOM, 2, 7
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "You have no room"
	line "for this prize!"
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

GoldenrodGameCornerPokefanM1Text:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

GoldenrodGameCornerCooltrainerMText:
	text "The prize #MON"
	line "are different on"
	cont "weekends!"

	para "I'm going to flip"
	line "cards until I have"

	para "enough coins for a"
	line "SKARMORY!"
	done

GoldenrodGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

GoldenrodGameCornerCooltrainerFText:
	text "I've heard voices"
	line "coming from behind"
	cont "the back wall…"
	done

GoldenrodGameCornerGentlemanText:
	text "Voltsweeper is the"
	line "newest game."

	para "It's a bit more"
	line "strategic than the"
	cont "others."
	done

GoldenrodGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

GoldenrodGameCornerBehindPosterText:
	text "…There's something"
	line "behind the poster!"
	done

GoldenrodGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, GOLDENROD_CITY, 10
	warp_event  3, 13, GOLDENROD_CITY, 10
	warp_event  9,  1, GOLDENROD_GAME_CORNER_BACKROOM, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerVoltorbFlipMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event  9,  0, BGEVENT_READ, GoldenrodGameCornerPosterScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	object_event 17, 10, SPRITE_UNUSED_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
