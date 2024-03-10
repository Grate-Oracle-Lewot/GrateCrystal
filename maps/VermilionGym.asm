	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .NextCheck
	changeblock 4, 4, $0e ; blocking machines
	endcallback

.NextCheck:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .OpenPath
	changeblock 4, 4, $0e ; blocking machines
	endcallback

.OpenPath
	changeblock 4, 4, $01 ; walkable floor
	endcallback

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	promptbutton
.FightDone:
	checkevent EVENT_GOT_TM_THUNDER_FROM_SURGE
	iftrue .GotThunderTM
	writetext LtSurgeGiveThunderTMText
	promptbutton
	verbosegiveitem TM_THUNDER
	iffalse .NoRoomForThunderTM
	setevent EVENT_GOT_TM_THUNDER_FROM_SURGE
	writetext LtSurgeExplainThunderTMText
	setevent EVENT_DECO_BED_4
	playsound SFX_2ND_PLACE
	waitsfx
	writetext LtSurgePikachuBedText
	waitbutton
	closetext
	end

.GotThunderTM:
	writetext LtSurgeFightDoneText
	waitbutton
.NoRoomForThunderTM:
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymSwitch1:
	opentext
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .AlreadyFlipped
	writetext VermilionGymSwitch1FlipText
	waitbutton
	closetext
	setevent EVENT_VERMILION_GYM_SWITCH_1
	playsound SFX_TRANSACTION
	waitsfx
	end

.AlreadyFlipped:
	writetext VermilionGymSwitchesAfterText
	waitbutton
	closetext
	end

VermilionGymSwitch2:
	opentext
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .AlreadyFlipped
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .CompletePuzzle
	writetext VermilionGymTrashCanText
	waitbutton
	closetext
	end

.CompletePuzzle:
	writetext VermilionGymSwitch2FlipText
	waitbutton
	closetext
	playsound SFX_TRANSACTION
	pause 21
	earthquake 42
	pause 21
	playsound SFX_STRENGTH
	changeblock 4, 4, $01 ; walkable floor
	reloadmappart
	earthquake 42
	setevent EVENT_VERMILION_GYM_SWITCH_2
	setscene SCENE_FINISHED
	end

.AlreadyFlipped:
	writetext VermilionGymSwitchesAfterText
	waitbutton
	closetext
	end

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> received"
	line "THUNDERBADGE!"
	done

LtSurgeThunderBadgeText:
	text "Consider it proof"
	line "that you defeated"

	para "me. You wear it"
	line "proudly, hear?"
	done

LtSurgeGiveThunderTMText:
	text "SURGE: And take"
	line "this too!"
	done

LtSurgeExplainThunderTMText:
	text "SURGE: That there"
	line "is THUNDER! It's"

	para "super strong, but"
	line "not too accurate."

	para "But do you know?"
	line "If you use RAIN"
	cont "DANCE first, it"
	cont "always hits!"

	para "I like you, kid."
	line "Here's a really"
	cont "special reward!"

	para "<PLAYER> received"
	line "PIKACHU BED!"
	done

LtSurgePikachuBedText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

LtSurgeFightDoneText:
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done

GentlemanGregorySeenText:
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done

GentlemanGregoryAfterBattleText:
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done

GuitaristVincentSeenText:
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how shocking!"
	done

GuitaristVincentAfterBattleText:
	text "If this were a"
	line "guitar battle, you"

	para "would have been"
	line "toast…"
	done

JugglerHortonSeenText:
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "I was overpowered…"
	done

JugglerHortonAfterBattleText:
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "LT.SURGE is tough."
	done

VermilionGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "LT.SURGE uses el-"
	line "ectric #MON."

	para "Only one type is"
	line "good against elec-"
	cont "tric: ground."

	para "And of course, el-"
	line "ectric is good ag-"
	cont "ainst water and"
	cont "flying."

	para "To reach LT.SURGE,"
	line "you have to flip"

	para "two switches hidd-"
	line "en in the trash"
	cont "cans."
	done

VermilionGymGuideWinText:
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done

VermilionGymTrashCanText:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGymSwitch1FlipText:
	text "A hidden switch!"
	line "That's one!"
	done

VermilionGymSwitch2FlipText:
	text "The second switch!"
	line "That's both!"
	done

VermilionGymSwitchesAfterText:
	text "This switch is al-"
	line "ready flipped."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymSwitch2
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymSwitch1
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
