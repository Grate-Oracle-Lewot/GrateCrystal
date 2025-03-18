	object_const_def
	const OAKSLAB2F_BUGSY1
	const OAKSLAB2F_BUGSY2
	const OAKSLAB2F_BUG_CATCHER
	const OAKSLAB2F_SCIENTIST1
	const OAKSLAB2F_SCIENTIST2
	const OAKSLAB2F_FISHER
	const OAKSLAB2F_COOLTRAINERM
	const OAKSLAB2F_COOLTRAINERF
	const OAKSLAB2F_SUPER_NERD1
	const OAKSLAB2F_SUPER_NERD2
	const OAKSLAB2F_POKEFANM1
	const OAKSLAB2F_POKEFANM2
	const OAKSLAB2F_POKEFANF
	const OAKSLAB2F_BLACKBELT

OaksLab2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .InverseQuest

.InverseQuest:
	checkevent EVENT_BUGSY_ON_ROUTE_14
	iffalse .NobodyHere
	appear OAKSLAB2F_BUG_CATCHER
	appear OAKSLAB2F_SCIENTIST1
	appear OAKSLAB2F_SCIENTIST2
	appear OAKSLAB2F_FISHER
	appear OAKSLAB2F_COOLTRAINERM
	appear OAKSLAB2F_COOLTRAINERF
	appear OAKSLAB2F_SUPER_NERD1
	appear OAKSLAB2F_SUPER_NERD2
	appear OAKSLAB2F_POKEFANM1
	appear OAKSLAB2F_POKEFANM2
	appear OAKSLAB2F_POKEFANF
	appear OAKSLAB2F_BLACKBELT
	checkevent EVENT_STARTED_INVERSE_QUEST
	iftrue .Bugsy2
	disappear OAKSLAB2F_BUGSY2
	appear OAKSLAB2F_BUGSY1
	endcallback

.Bugsy2:
	disappear OAKSLAB2F_BUGSY1
	checkevent EVENT_COMPLETED_INVERSE_QUEST
	iftrue .NoBugsy
	appear OAKSLAB2F_BUGSY2
	endcallback

.NoBugsy:
	disappear OAKSLAB2F_BUGSY2
	endcallback

.NobodyHere:
	disappear OAKSLAB2F_BUGSY1
	disappear OAKSLAB2F_BUGSY2
	disappear OAKSLAB2F_BUG_CATCHER
	disappear OAKSLAB2F_SCIENTIST1
	disappear OAKSLAB2F_SCIENTIST2
	disappear OAKSLAB2F_FISHER
	disappear OAKSLAB2F_COOLTRAINERM
	disappear OAKSLAB2F_COOLTRAINERF
	disappear OAKSLAB2F_SUPER_NERD1
	disappear OAKSLAB2F_SUPER_NERD2
	disappear OAKSLAB2F_POKEFANM1
	disappear OAKSLAB2F_POKEFANM2
	disappear OAKSLAB2F_POKEFANF
	disappear OAKSLAB2F_BLACKBELT
	endcallback

OaksLab2FBugsyScript:

	end

OaksLab2FBugCatcherRobScript:

	end

OaksLab2FScientistTaylorScript:

	end

OaksLab2FScientistElvinScript:

	end

OaksLab2FFisherJonahScript:

	end

OaksLab2FCooltrainMBlakeScript:

	end

OaksLab2FCooltrainerFStellaScript:

	end

OaksLab2FSuperNerdShawnScript:

	end

OaksLab2FPokemaniacTannerScript:

	end

OaksLab2FPokefanMJoshuaScript:

	end

OaksLab2FHikerKennyScript:

	end

OaksLab2FPokefanFGeorgiaScript:

	end

OaksLab2FBlackbeltWaiScript:

	end

OaksLab2FPokedexMachine:
	jumptext OaksLab2FPokedexMachineText

OaksLab2FBugsyIntroText1:
	text "BUGSY: Aha,"
	line "<PLAYER>!"

	para "I figured you'd be"
	line "up for this!"

	para "Follow me!"
	done

OaksLab2FBugsyIntroText2:
	text "Alright, backstory"
	line "time…"

	para "So one of the sci-"
	line "entists working at"

	para "the CINNABAR lab"
	line "was DR. DREW CAB…"

	para "He had a personal"
	line "side project that"

	para "I was interested"
	line "in."

	para "I'm not sure what"
	line "happened to him,"

	para "but we've salvaged"
	line "some of his data."

	para "Did you feel a"
	line "tingle when you"
	cont "came upstairs?"

	para "We're projecting an"
	line "energy field into"

	para "this room that has"
	line "a very interesting"

	para "effect on #MON"
	line "types in battle."

	para "It reverses their"
	line "strengths and"
	cont "weaknesses, so"

	para "fire becomes good"
	line "against water, and"

	para "grass good against"
	line "fire, that kind of"
	cont "thing."

	para "It really twists"
	line "your brain when"

	para "thinking about"
	line "battles!"

	para "I've collected a"
	line "hodgepodge of"

	para "trainers who are"
	line "interested in"

	para "these inverted"
	line "battles."

	para "I need you to"
	line "battle them all!"

	para "Once you do, come"
	line "back and see me."

	para "Have fun!"
	done

OaksLab2FBugsyWaitingText:
	text "BUGSY: I need you"
	line "to battle everyone"

	para "here to collect"
	line "enough data on"

	para "these inverse type"
	line "matchups."

	para "I know you can do"
	line "it! You're the"
	cont "CHAMPION!"
	done

OaksLab2FBugsyPreBattleText1:
	text "BUGSY: Looks like"
	line "you got 'em all!"

	para "Thanks for gather-"
	line "ing all that data!"

	para "Now, here's my"
	line "thinking…"

	para "Inverse battles"
	line "are neat, but"

	para "they're kind of a"
	line "gimmick…"

	para "But if I adjust"
	line "the settings like"
	cont "so…"
	done

OaksLab2FBugsyPreBattleText2:
	text "Now, all types"
	line "should be neutral"
	cont "to each other!"

	para "In this kind of"
	line "battle, you won't"

	para "be able to rely on"
	line "type advantages to"
	cont "carry you."

	para "It'll be a test of"
	line "pure power!"

	para "<PLAYER>, when"
	line "you're ready…"

	para "Let's have a"
	line "neutral battle!"
	done

OaksLab2FBugsyPreBattleText3:
	text "BUGSY: Let's both"
	line "give this battle"
	cont "all we've got!"
	done

OaksLab2FBugsyBeatenText:
	text "Wow! Wasn't that"
	line "fascinating?"
	done

OaksLabBugsyAfterBattleText1:
	text "BUGSY: Thanks for"
	line "helping with my"
	cont "research, <PLAYER>!"
	done

OaksLabBugsyPhoneCallText:
	text "BUGSY: Hello?"

	para "This is them…"

	para "Uh-huh…"

	para "Really? Great!"

	para "Yeah, we'll talk"
	line "more later."

	para "Bye-bye!"
	done

OaksLabBugsyAfterBattleText2:
	text "BUGSY: <PLAYER>,"
	line "great news!"

	para "Do you know the"
	line "BATTLE TOWER near"
	cont "OLIVINE?"

	para "I contacted them"
	line "earlier, and it"

	para "sounds like they"
	line "want to use our"

	para "discoveries here"
	line "to create more"

	para "challenge modes in"
	line "the TOWER!"

	para "I've gotta run over"
	line "there to help them"

	para "install the field"
	line "generators."

	para "See you around!"
	done

OaksLab2FPokedexMachineText:
	text "This looks like it"
	line "fabricates copies"
	cont "of the #DEX."
	done

OaksLab2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 24, OAKS_LAB, 3

	def_coord_events

	def_bg_events
	bg_event 27,  1, BGEVENT_READ, OaksLab2FPokedexMachine

	def_object_events
	object_event 27, 22, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLab2FBugsyScript, EVENT_OAKS_LAB_2F_BUGSY1
	object_event 14,  9, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLab2FBugsyScript, EVENT_OAKS_LAB_2F_BUGSY2
	object_event  3,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLab2FBugCatcherRobScript, EVENT_OAKS_LAB_2F_BUG_CATCHER_ROB
	object_event 16, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLab2FScientistTaylorScript, EVENT_OAKS_LAB_2F_SCIENTIST_TAYLOR
	object_event 12, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLab2FScientistElvinScript, EVENT_OAKS_LAB_2F_SCIENTIST_ELVIN
	object_event 24,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OaksLab2FFisherJonahScript, EVENT_OAKS_LAB_2F_FISHER_JONAH
	object_event 21, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLab2FCooltrainMBlakeScript, EVENT_OAKS_LAB_2F_COOLTRAINERM_BLAKE
	object_event 23, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLab2FCooltrainerFStellaScript, EVENT_OAKS_LAB_2F_COOLTRAINERF_STELLA
	object_event  5, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OaksLab2FSuperNerdShawnScript, EVENT_OAKS_LAB_2F_SUPER_NERD_SHAWN
	object_event  5, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLab2FPokemaniacTannerScript, EVENT_OAKS_LAB_2F_POKEMANIAC_TANNER
	object_event  7, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLab2FPokefanMJoshuaScript, EVENT_OAKS_LAB_2F_POKEFANM_JOSHUA
	object_event 15, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OaksLab2FHikerKennyScript, EVENT_OAKS_LAB_2F_HIKER_KENNY
	object_event  4, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLab2FPokefanFGeorgiaScript, EVENT_OAKS_LAB_2F_POKEFANF_GEORGIA
	object_event 20, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OaksLab2FBlackbeltWaiScript, EVENT_OAKS_LAB_2F_BLACKBELT_WAI
