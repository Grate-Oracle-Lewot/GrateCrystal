	object_const_def
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_JESSIE
	const GOLDENRODUNDERGROUNDWAREHOUSE_JAMES
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

TrainerGruntMWare1:
	trainer GRUNTM, GRUNTM_WARE1, EVENT_BEAT_ROCKET_GRUNTM_WARE1, GruntMWare1SeenText, GruntMWare1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMWare1AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntMTrickster:
	trainer GRUNTM, GRUNTM_TRICKSTER, EVENT_BEAT_ROCKET_GRUNTM_TRICKSTER, GruntMTricksterSeenText, GruntMTricksterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMTricksterAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntMHyuck2:
	trainer GRUNTM, GRUNTM_HYUCK2, EVENT_BEAT_ROCKET_GRUNTM_HYUCK2, GruntMHyuck2SeenText, GruntMHyuck2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMHyuck2AfterBattleText
	waitbutton
	closetext
	end

TrainerJessieJames2:
	trainer JESSIE, JAMES2, EVENT_BEAT_JESSIE_JAMES_2, JessieJames2SeenText, JessieJames2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JessieJames2AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseJamesScript:
	jumptextfaceplayer GoldenrodUndergroundWarehouseJamesText

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK, 5

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntMWare1SeenText:
	text "You're not going"
	line "any farther!"

	para "I don't show mercy"
	line "to my enemies, not"
	cont "even brats!"
	done

GruntMWare1BeatenText:
	text "Blast it!"
	done

GruntMWare1AfterBattleText:
	text "I lost…"

	para "Please forgive me,"
	line "GIOVANNI!"
	done

GruntMTricksterSeenText:
	text "You want that"
	line "item, don't you?"

	para "Haha! I knew you'd"
	line "take the bait!"
	done

GruntMTricksterBeatenText:
	text "How'd that happen?"
	done

GruntMTricksterAfterBattleText:
	text "You have to admit,"
	line "it was a good"
	cont "trap, right?"
	done

GruntMHyuck2SeenText:
	text "Hyuck-hyuck-hyuck!"
	line "I remember you!"

	para "You got me good"
	line "at our hideout!"
	done

GruntMHyuck2BeatenText:
	text "Hyuck-hyuck-hyuck!"
	line "So, that's how?"
	done

GruntMHyuck2AfterBattleText:
	text "Hyuck-hyuck-hyuck!"
	line "That was a blast!"
	cont "I'll remember you!"
	done

JessieJames2SeenText:
	text "JESSIE: You again?"

	para "Prepare for"
	line "trouble!"

	para "JAMES: Make it"
	line "double!"

	para "MEOWTH: You know"
	line "the rest."

	para "JESSIE: They're"
	line "using the radio to"

	para "call the boss out"
	line "of hiding."

	para "JAMES: Which means"
	line "this is our chance"
	cont "to impress him!"

	para "JESSIE: It's the"
	line "end of the line"
	cont "for you, twerp!"

	para "JAMES: We'll be"
	line "basement grunts…"
	cont "nevermore!"
	done

JessieJames2BeatenText:
	text "Looks like TEAM"
	line "ROCKET's blasting"
	cont "off again!"
	done

JessieJames2AfterBattleText:
	text "JESSIE: Fine then,"
	line "go talk to the"
	cont "DIRECTOR."

	para "That won't stop"
	line "our plans!"
	done

GoldenrodUndergroundWarehouseJamesText:
	text "JAMES: Shouldn't"
	line "you be in school?"
	done

DirectorIntroText:
	text "DIRECTOR: Who?"
	line "What? You came to"
	cont "rescue me?"

	para "Thank you!"

	para "The RADIO TOWER!"

	para "What's happening"
	line "there?"

	para "Taken over by TEAM"
	line "ROCKET?"

	para "Here. Take this"
	line "CARD KEY."
	done

DirectorCardKeyText:
	text "DIRECTOR: Use that"
	line "to open the shut-"
	cont "ters on 3F."
	done

DirectorAfterText:
	text "I'm begging you to"
	line "help."

	para "There's no telling"
	line "what they'll do if"

	para "they control the"
	line "transmitter."

	para "They may even be"
	line "able to control"

	para "#MON using a"
	line "special signal!"

	para "You're the only"
	line "one I can call on."

	para "Please save the"
	line "RADIO TOWER…"

	para "And all the #-"
	line "MON nationwide!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntMWare1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntMHyuck2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntMTrickster, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerJessieJames2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  6, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseJamesScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
