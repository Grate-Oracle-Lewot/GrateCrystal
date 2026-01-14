OLIVINECAFE_BIGMUSHROOM_MONEY EQU 20000
OLIVINECAFE_CANDIEDYAM_MONEY  EQU 50000

	object_const_def
	const OLIVINECAFE_SAGE
	const OLIVINECAFE_COOK
	const OLIVINECAFE_SAILOR

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeSageText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeSageText_GotStrength
OlivineCafe_EndText:
	waitbutton
	closetext
	end

OlivineCafeChefScript:
	faceplayer
	checkmoney YOUR_MONEY, MAX_MONEY - OLIVINECAFE_CANDIEDYAM_MONEY
	ifequal HAVE_MORE, .Skip1
	checkitem CANDIED_YAM
	iftrue .Yam
.Skip1:
	checkmoney YOUR_MONEY, MAX_MONEY - OLIVINECAFE_BIGMUSHROOM_MONEY
	ifequal HAVE_MORE, .Skip2
	checkitem BIG_MUSHROOM
	iftrue .Mushroom
.Skip2:
	jumptext OlivineCafeChefText

.Mushroom:
	showemote EMOTE_SHOCK, OLIVINECAFE_COOK, 15
	opentext
	writetext OlivineCafeChef_AromaText
	promptbutton
	writetext OlivineCafeChef_HaveMushroomText
	promptbutton
	writetext OlivineCafeChef_MourselText
	promptbutton
	writetext OlivineCafeChef_AskMushroomText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem BIG_MUSHROOM
	givemoney YOUR_MONEY, OLIVINECAFE_BIGMUSHROOM_MONEY
	sjump .Finish

.Yam:
	showemote EMOTE_SHOCK, OLIVINECAFE_COOK, 15
	opentext
	writetext OlivineCafeChef_AromaText
	promptbutton
	writetext OlivineCafeChef_HaveYamText
	promptbutton
	writetext OlivineCafeChef_MourselText
	promptbutton
	writetext OlivineCafeChef_AskYamText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	takeitem CANDIED_YAM
	givemoney YOUR_MONEY, OLIVINECAFE_CANDIEDYAM_MONEY
.Finish:
	playsound SFX_TRANSACTION
	waitsfx
	writetext OlivineCafeChef_ThankYouText
	sjump OlivineCafe_EndText

.Refused
	writetext OlivineCafeChef_RefusedText
	sjump OlivineCafe_EndText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeSageText:
	text "A long time ago in"
	line "a galaxy far, far"
	cont "away…"

	para "A devout order"
	line "known as the JEDI"

	para "learned to tap"
	line "into the energy"

	para "field given off by"
	line "all life, which"

	para "they called THE"
	line "FORCE."

	para "With this HM, your"
	line "#MON can do the"
	cont "same thing!"
	done

OlivineCafeSageText_GotStrength:
	text "Using THE FORCE,"
	line "#MON can move"

	para "large boulders"
	line "with the power of"
	cont "their minds."
	done

OlivineCafeChefText:
	text "OLIVINE CAFé's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy SAILORS!"
	done

OlivineCafeChef_AromaText:
	text "That aroma…!"
	done

OlivineCafeChef_HaveMushroomText:
	text "You have a"
	line "BIG MUSHROOM!"
	done

OlivineCafeChef_HaveYamText:
	text "You have a"
	line "CANDIED YAM!"
	done

OlivineCafeChef_MourselText:
	text "That is a rare"
	line "moursel indeed!"
	done

OlivineCafeChef_AskMushroomText:
	text "Would you sell it"
	line "for ¥{d:OLIVINECAFE_BIGMUSHROOM_MONEY}?"
	done

OlivineCafeChef_AskYamText:
	text "Would you sell it"
	line "for ¥{d:OLIVINECAFE_CANDIEDYAM_MONEY}?"
	done

OlivineCafeChef_ThankYouText:
	text "Thank you! It will"
	line "make a fine meal!"
	done

OlivineCafeChef_RefusedText:
	text "Ah… what a shame!"
	done

OlivineCafeSailorText:
	text "You know weather"
	line "moves, like RAIN"
	cont "DANCE and SUNNY"
	cont "DAY?"

	para "If your #MON"
	line "holds a rare"

	para "BLACK PEARL, its"
	line "weather moves will"

	para "last for 8 turns"
	line "instead of 5!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineCafeSageScript, -1
	object_event  7,  3, SPRITE_COOK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivineCafeChefScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
