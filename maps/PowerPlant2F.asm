	object_const_def
	const POWERPLANT2F_MANAGER
	const POWERPLANT2F_FISHING_GURU1
	const POWERPLANT2F_FISHING_GURU2
	const POWERPLANT2F_FISHING_GURU3
	const POWERPLANT2F_FISHING_GURU4
	const POWERPLANT2F_FISHING_GURU5
	const POWERPLANT2F_FISHING_GURU6

PowerPlant2F_MapScripts:
	def_scene_scripts

	def_callbacks

PowerPlant2FManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlant2FManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setmapscene POER_PLANT, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlant2FManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlant2FManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlant2FManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlant2FManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlant2FManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

TrainerEngineerBaily:
	trainer ENGINEER, BAILY, EVENT_BEAT_ENGINEER_BAILY, EngineerBailySeenText, EngineerBailyBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerBailyAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerBernie:
	trainer ENGINEER, BERNIE, EVENT_BEAT_ENGINEER_BERNIE, EngineerBernieSeenText, EngineerBernieBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerBernieAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerBraxton:
	trainer ENGINEER, BRAXTON, EVENT_BEAT_ENGINEER_BRAXTON, EngineerBraxtonSeenText, EngineerBraxtonBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerBraxtonAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDylan:
	trainer ENGINEER, DYLAN, EVENT_BEAT_ENGINEER_DYLAN, EngineerDylanSeenText, EngineerDylanBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerDylanAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerCamden:
	trainer ENGINEER, CAMDEN, EVENT_BEAT_ENGINEER_CAMDEN, EngineerCamdenSeenText, EngineerCamdenBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerCamdenAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerFlint:
	trainer ENGINEER, FLINT, EVENT_BEAT_ENGINEER_FLINT, EngineerFlintSeenText, EngineerFlintBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext EngineerFlintAfterBattleText
	waitbutton
	closetext
	end

PowerPlant2FTrapdoorScript:
	opentext
	writetext PowerPlant2FTrapdoorText
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_ENTER_DOOR
	warp POWER_PLANT, 2, 1
	end

PowerPlant2FBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlant2FManagerWhoWouldRuinMyGeneratorText:
	text "MANAGER: I, I, I'm"
	line "ready to blast"
	cont "someone!"

	para "Who would dare"
	line "ruin my generator?"

	para "I spent so much"
	line "time on it!"

	para "If I catch him,"
	line "he's going to get"

	para "a taste of my ZAP"
	line "CANNON!"
	done

PowerPlant2FManagerIWontForgiveCulpritText:
	text "MANAGER: I won't"
	line "forgive him!"

	para "The culprit can"
	line "cry and apologize,"

	para "but I'll still"
	line "hammer him!"
	done

PowerPlant2FManagerThatsThePartText:
	text "MANAGER: Ah! Yeah!"

	para "That's the missing"
	line "PART from my be-"
	cont "loved generator!"
	cont "You found it?"
	done

PowerPlant2FManagerTakeThisTMText:
	text "Wahah! Thanks!"

	para "Here! Take this TM"
	line "as a reward!"
	done

PowerPlant2FManagerTM07IsZapCannonText:
	text "MANAGER: TM07 is"
	line "my ZAP CANNON."

	para "It's a powerful"
	line "technique!"

	para "It's not what any-"
	line "one would consider"

	para "accurate, but it's"
	line "sure to paralyze!"
	done

PowerPlant2FManagerMyBelovedGeneratorText:
	text "MANAGER: You're"
	line "pretty good at"
	cont "solving mysteries!"

	para "What's that? You're"
	line "the CHAMPION?!"

	para "Well, no wonder!"
	done

EngineerBailySeenText:
	para "Whoa! What's a kid"
	line "doing in here?!"
	done

EngineerBailyBeatenText:
	para "Huhwhah?!"
	done

EngineerBailyAfterBattleText:
	para "The MANAGER? He's"
	line "in the back."
	done

EngineerBernieSeenText:
	para "It's time for the"
	line "workers to rise"

	para "up against the"
	line "ruling class!"
	done

EngineerBernieBeatenText:
	para "You rose to the"
	line "occasion!"
	done

EngineerBernieAfterBattleText:
	para "I guess I'm not"
	line "strong enough to"

	para "lead a revolution…"
	line "Yet."
	done

EngineerBraxtonSeenText:
	para "What? Don't interr-"
	line "upt my work!"
	done

EngineerBraxtonBeatenText:
	para "How'd that happen?"
	done

EngineerBraxtonAfterBattleText:
	para "I need to get back"
	line "to work."
	done

EngineerDylanSeenText:
	para "I need a break."
	line "Howbout a battle?"
	done

EngineerDylanBeatenText:
	para "You worked me into"
	line "the ground!"
	done

EngineerDylanAfterBattleText:
	para "To be honest, this"
	line "place is a bit"

	para "overkill for one"
	line "train."
	done

EngineerCamdenSeenText:
	para "Whose kid is this?"
	done

EngineerCamdenBeatenText:
	para "Whoever's kid this"
	line "is beat me."
	done

EngineerCamdenAfterBattleText:
	para "Pure water is act-"
	line "ually an insulator"

	para "against electrical"
	line "conductivity."

	para "It's the minerals"
	line "in the water that"
	cont "are conductive!"
	done

EngineerFlintSeenText:
	para "A battle? Eh…"
	line "Alright."
	done

EngineerFlintBeatenText:
	para "Battle's over."
	done

EngineerFlintAfterBattleText:
	para "Righty tighty,"
	line "lefty loosey…"
	done

PowerPlant2FTrapdoorText:
	para "Huh?"

	para "There's a hidden"
	line "trapdoor!"
	done

PowerPlant2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 35, POWER_PLANT, 3
	warp_event  5, 35, POWER_PLANT, 3

	def_coord_events

	def_bg_events
	bg_event  0, 11, BGEVENT_READ, PowerPlant2FTrapdoorScript
	bg_event  2, 15, BGEVENT_READ, PowerPlant2FBookshelf
	bg_event  3, 15, BGEVENT_READ, PowerPlant2FBookshelf

	def_object_events
	object_event  4,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FManager, -1
	object_event 19, 32, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerEngineerBaily, -1
	object_event 35, 32, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerEngineerBernie, -1
	object_event 18, 17, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerEngineerBraxton, -1
	object_event 29,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerEngineerDylan, -1
	object_event 38,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerEngineerCamden, -1
	object_event 21, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerEngineerFlint, -1
