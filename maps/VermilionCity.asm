	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionEggMoveTutor:
	faceplayer
	opentext
	checkevent EVENT_UNLOCKED_EGG_MOVE_TUTOR
	iftrue .TeachEggMoves
	checkevent EVENT_GOT_EGG_TUTOR_BRICK_QUEST
	iftrue .CountBrickPieces
	writetext EggTutorIntroText
	promptbutton
	setevent EVENT_GOT_EGG_TUTOR_BRICK_QUEST
.CountBrickPieces:
	writetext EggTutorAskGiveBrickText
	yesorno
	iffalse .RefusedToGiveBrick
	checkitem BRICK_PIECE
	iffalse .NoBricksInBag
	takeitem BRICK_PIECE
	readmem wEggTutorBricks
	addval 1
	writemem wEggTutorBricks
	ifequal 10, .BetterWay
	writetext EggTutorGiveBrickText
	waitbutton
	closetext
	end

.BetterWay:
	writetext EggTutorGiveBrickText
	promptbutton
	writetext EggTutorBetterWayText
	waitbutton
	closetext
	setevent EVENT_UNLOCKED_EGG_MOVE_TUTOR
	end

.NoBricksInBag:
	writetext EggTutorNoBricksText
	waitbutton
	closetext
	end

.RefusedToGiveBrick:
	writetext EggTutorNoGiveBrickText
	waitbutton
	closetext
	end

.TeachEggMoves:
	special EggMoveTutor
	waitbutton
	closetext
	end

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	checkevent EVENT_UNLOCKED_EGG_MOVE_TUTOR
	iftrue .MachopEggMoves
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

.MachopEggMoves:
	writetext VermilionMachopText3
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext VermilionCityBadgeGuyDecorationText
	promptbutton
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "VERMILION PORT is"
	line "KANTO's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

EggTutorIntroText:
	text "My MACHOP got this"
	line "plot ready for"

	para "development three"
	line "years ago, but"

	para "then I blew all my"
	line "money at the GAME"
	cont "CORNER…"

	para "I need to find a"
	line "way to gather the"

	para "building materials"
	line "myself…"

	para "Hmm…"

	para "Have you noticed"
	line "that when you"

	para "smash rocks, you"
	line "sometimes find a"
	cont "BRICK PIECE?"

	para "If you bring me"
	line "BRICK PIECES, I'll"

	para "be sure to reward"
	line "you."
	done

EggTutorAskGiveBrickText:
	text "May I have a BRICK"
	line "PIECE?"
	done

EggTutorNoGiveBrickText:
	text "But…"
	line "I need materials…"
	done

EggTutorNoBricksText:
	text "Oh, you don't have"
	line "one…"
	done

EggTutorGiveBrickText:
	text "A BRICK PIECE!"
	line "Thank you!"
	done

EggTutorBetterWayText:
	text "…"

	para "Sigh…"

	para "This is going to"
	line "take forever."

	para "There must be a"
	line "better way…"

	para "<……> <……>"
	line "<……> <……>"

	para "Aha! I've got it!"

	para "Did you know that"
	line "when a #MON"

	para "hatches from an"
	line "EGG, it may know"

	para "moves learned by"
	line "its parent?"

	para "Including moves"
	line "it can't normally"
	cont "learn!"

	para "I'm actually an"
	line "expert in this"
	cont "subject."

	para "I can teach your"
	line "#MON to use"

	para "these moves after"
	line "they're already"
	cont "hatched!"

	para "It will cost you"
	line "some money for"

	para "these special"
	line "moves, but I'll"

	para "use the funds to"
	line "buy the materials"
	cont "for my project!"

	para "The building I"
	line "want to put up is"

	para "supposed to be a"
	line "school for #-"
	cont "MON to learn egg"
	cont "moves, you see."

	para "So please, take a"
	line "look and see if"

	para "any of these moves"
	line "interest you!"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "MACHOP's annoyed"
	line "with its trainer…"
	done

VermilionMachopText3:
	text "MACHOP is practic-"
	line "ing egg moves!"
	done

VermilionCitySuperNerdText:
	text "There are eight"
	line "GYMS in KANTO."

	para "That big building"
	line "is VERMILION's"
	cont "#MON GYM."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX is snoring"
	line "laxly."
	done

VermilionCityRadioNearSnorlaxText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

VermilionCityBadgeGuyTrainerText:
	text "Skilled trainers"
	line "gather in KANTO."

	para "GYM LEADERS are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect KANTO GYM"
	cont "BADGES?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of KANTO"
	line "GYMS soon."

	para "Let me know if"
	line "you get all eight"
	cont "BADGES."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Congratulations!"

	para "You got all the"
	line "KANTO GYM BADGES."

	para "I've got a reward"
	line "for your efforts."

	para "<PLAYER> received"
	line "SURF PIKACHU DOLL!"
	done

VermilionCityBadgeGuyDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "I'm sure the KANTO"
	line "GYM BADGES will"
	cont "help you."
	done

VermilionCitySignText:
	text "VERMILION CITY"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning"
	line "American"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "All #MON Fans"
	line "Welcome!"
	done

VermilionCityDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

VermilionCityPortSignText:
	text "VERMILION PORT"
	line "ENTRANCE"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, VermilionEggMoveTutor, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
