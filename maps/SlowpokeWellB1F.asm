	object_const_def
	const SLOWPOKEWELLB1F_JESSIE
	const SLOWPOKEWELLB1F_JAMES
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB1FKurtScript:
	jumptext SlowpokeWellB1FKurtText

TrainerJessieJames1:
	trainer JESSIE, JAMES1, EVENT_BEAT_JESSIE_JAMES_1, JessieJames1SeenText, JessieJames1BeatenText, 0, .Script

.Script:
	opentext
	writetext JessieJames1AfterBattleText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_JESSIE
	disappear SLOWPOKEWELLB1F_JAMES
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 10
	playsound SFX_RUN
	waitsfx
	pause 10
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntMWell1:
	trainer GRUNTM, GRUNTM_WELL1, EVENT_BEAT_ROCKET_GRUNTM_WELL1, GruntMWell1SeenText, GruntMWell1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMWell1AfterBattleText
	sjump SlowpokeWellB1F_EndText

TrainerGruntMWell2:
	trainer GRUNTM, GRUNTM_WELL2, EVENT_BEAT_ROCKET_GRUNTM_WELL2, GruntMWell2SeenText, GruntMWell2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMWell2AfterBattleText
SlowpokeWellB1F_EndText:
	waitbutton
	closetext
	end

TrainerGruntMWell3:
	trainer GRUNTM, GRUNTM_WELL3, EVENT_BEAT_ROCKET_GRUNTM_WELL3, GruntMWell3SeenText, GruntMWell3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntMWell3AfterBattleText
	sjump SlowpokeWellB1F_EndText

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	sjump SlowpokeWellB1F_EndText

SlowpokeWellB1FSlowpokeWithMailScript:
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	promptbutton
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	sjump SlowpokeWellB1F_EndText

SlowpokeWellB1FTaillessSlowpokeScript:
	jumptext SlowpokeWellB1FTaillessSlowpokeText

SlowpokeWellB1FBoulder:
	jumpstd StrengthBoulderScript

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "KURT: Hey there,"
	line "<PLAYER>!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "WELL."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #MON"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para "<PLAYER>, show them"
	line "how gutsy you are"
	cont "in my place!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Way to go,"
	line "<PLAYER>!"

	para "TEAM ROCKET has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done

JessieJames1SeenText:
	text "JESSIE: Prepare"
	line "for trouble!"

	para "JAMES: Make it"
	line "double!"

	para "To protect the"
	line "world from"
	cont "devastation!"

	para "To unite all"
	line "peoples within our"
	cont "nation!"

	para "To denounce the"
	line "evils of truth and"
	cont "love!"

	para "To extend our"
	line "reach to the stars"
	cont "above!"

	para "JESSIE: JESSIE!"
	line "JAMES: JAMES!"

	para "TEAM ROCKET! Blast"
	line "off at the speed"
	cont "of light!"

	para "Surrender now or"
	line "prepare to fight!"
	done

JessieJames1BeatenText:
	text "Looks like TEAM"
	line "ROCKET's blasting"
	cont "off again!"
	done

JessieJames1AfterBattleText:
	text "JESSIE: Yeah, the"
	line "boss disbanded"

	para "TEAM ROCKET three"
	line "years ago after a"

	para "twerp like you"
	line "interfered with"
	cont "our plans."

	para "JAMES: But don't"
	line "you worry, this"

	para "isn't the last"
	line "you'll hear of us!"

	para "MEOWTH: That's"
	line "right!"
	done

GruntMWell1SeenText:
	text "Darn! I was stand-"
	line "ing guard up top"

	para "when some old coot"
	line "yelled at me."

	para "He startled me so"
	line "much that I fell"
	cont "down here."

	para "I think I'll vent"
	line "my anger by taking"
	cont "it out on you!"
	done

GruntMWell1BeatenText:
	text "Arrgh! This is NOT"
	line "my day!"
	done

GruntMWell1AfterBattleText:
	text "Sure, we've been"
	line "hacking the tails"

	para "off SLOWPOKE and"
	line "selling them."

	para "Everything we do"
	line "is for profit."
	done

GruntMWell2SeenText:
	text "Quit taking SLOW-"
	line "POKETAILS?"

	para "If we obeyed you,"
	line "TEAM ROCKET's rep"
	cont "would be ruined!"
	done

GruntMWell2BeatenText:
	text "Just…"
	line "Too strong…"
	done

GruntMWell2AfterBattleText:
	text "We need the money,"
	line "but selling SLOW-"
	cont "POKETAILS?"

	para "It's tough being a"
	line "ROCKET GRUNT!"
	done

GruntMWell3SeenText:
	text "You want us to"
	line "stop?"

	para "You ever try"
	line "sucking on a"
	cont "SLOWPOKETAIL?"
	cont "Delicious!"
	done

GruntMWell3BeatenText:
	text "This sucks."
	done

GruntMWell3AfterBattleText:
	text "I don't really"
	line "care about the"
	cont "money."

	para "I just want to"
	line "suck on the TAILS."
	done

GruntF1SeenText:
	text "Stop taking TAILS?"

	para "Yeah, just try to"
	line "defeat all of us!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "SLOWPOKETAILS"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Huh? It has MAIL."
	line "Read it?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> read the"
	line "MAIL."

	para "Be good and look"
	line "after the house"

	para "with Grandpa and"
	line "SLOWPOKE."

	para "Love, Dad"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "A SLOWPOKE with"
	line "its TAIL cut off…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerJessieJames1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  4,  2, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerJessieJames1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntMWell1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntMWell2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  4,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntMWell3, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
