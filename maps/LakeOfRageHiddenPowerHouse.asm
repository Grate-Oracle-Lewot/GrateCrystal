	object_const_def
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER
	const LAKEOFRAGEHIDDENPOWERHOUSE_SUPER_NERD

LakeOfRageHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	promptbutton
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

TrainerSupernerdDave:
	trainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, SupernerdDaveSeenText, SupernerdDaveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdDaveAfterBattleText
	waitbutton
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd DifficultBookshelfScript

HiddenPowerGuyText1:
	text "…You have strayed"
	line "far…"

	para "Here I have medi-"
	line "tated. Inside me,"

	para "a new power has"
	line "been awakened."

	para "Let me share my"
	line "power with your"

	para "#MON."
	line "Take this, child."
	done

HiddenPowerGuyText2:
	text "Do you see it? It"
	line "is HIDDEN POWER!"

	para "It draws out a"
	line "#MON's inner"
	cont "potential."

	para "Its type depends"
	line "on the #MON"

	para "using it--not just"
	line "the species, but"
	cont "the individual!"
	done

HiddenPowerGuyText3:
	text "I am meditating…"
	done

SupernerdDaveSeenText:
	text "They ain't the"
	line "greatest #MON,"

	para "but they're the"
	line "only ones I've"
	cont "got!"
	done

SupernerdDaveBeatenText:
	text "Bajabbers!"
	done

SupernerdDaveAfterBattleText:
	text "I hate you so much"
	line "right now."
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	def_object_events
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
	object_event  0,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSupernerdDave, -1
