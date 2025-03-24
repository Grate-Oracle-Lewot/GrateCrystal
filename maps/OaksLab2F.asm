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
	scene_script .DummyScene
	scene_script .BugsyScene

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .InverseQuest

.BugsyScene:
	sdefer .BugsySceneScript
.DummyScene:
	end

.BugsySceneScript:
	pause 5
	turnobject OAKSLAB2F_BUGSY1, DOWN
	showemote EMOTE_SHOCK, OAKSLAB2F_BUGSY1, 15
	applymovement OAKSLAB2F_BUGSY1, OaksLab2FBugsyStepDownMovement
	turnobject PLAYER, UP
	opentext
	writetext OaksLab2FBugsyIntroText1
	waitbutton
	closetext
	follow OAKSLAB2F_BUGSY1, PLAYER
	applymovement OAKSLAB2F_BUGSY1, OaksLab2FBugsyWalkToComputerMovement
	stopfollow
	turnobject OAKSLAB2F_BUGSY1, LEFT
	opentext
	writetext OaksLab2FBugsyIntroText2
	waitbutton
	closetext
	turnobject OAKSLAB2F_BUGSY1, UP
	setevent EVENT_STARTED_INVERSE_QUEST
	setscene SCENE_OAKSLAB2F_NOTHING
	appear OAKSLAB2F_BUGSY2
	disappear OAKSLAB2F_BUGSY1
	end

.InverseQuest:
	appear OAKSLAB2F_BUGSY1
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
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_BUG_CATCHER_ROB
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_SCIENTIST_TAYLOR
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_SCIENTIST_ELVIN
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_FISHER_JONAH
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_COOLTRAINERM_BLAKE
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_COOLTRAINERF_STELLA
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_SUPER_NERD_SHAWN
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_POKEMANIAC_TANNER
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_POKEFANM_JOSHUA
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_HIKER_KENNY
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_POKEFANF_GEORGIA
	iffalse .NotDone
	checkevent EVENT_INVERSE_BEAT_BLACKBELT_WAI
	iffalse .NotDone
	checkevent EVENT_BUGSY_WANTS_NEUTRAL_BATTLE
	iftrue .Battle
	writetext OaksLab2FBugsyPreBattleText1
	waitbutton
	closetext
	turnobject OAKSLAB2F_BUGSY2, UP
	playsound SFX_BOOT_PC
	waitsfx
	faceplayer
	opentext
	writetext OaksLab2FBugsyPreBattleText2
	waitbutton
	closetext
	setevent EVENT_BUGSY_WANTS_NEUTRAL_BATTLE
	end

.Battle:
	writetext OaksLab2FBugsyPreBattleText3
	waitbutton
	closetext
	winlosstext OaksLab2FBugsyBeatenText, 0
	loadtrainer BUGSY, BUGSY2
	loadvar VAR_BATTLETYPE, BATTLETYPE_TYPELESS
	startbattle
	reloadmap
	opentext
	writetext OaksLabBugsyAfterBattleText1
	waitbutton
	closetext
	playsound SFX_CALL
	waitsfx
	showemote EMOTE_SHOCK, OAKSLAB2F_BUGSY2, 15
	readvar VAR_FACING
	ifequal RIGHT, .Right
	ifequal LEFT, .Left
	turnobject OAKSLAB2F_BUGSY2, UP
.Merge1:
	opentext
	writetext OaksLabBugsyPhoneCallText
	waitbutton
	closetext
	playsound SFX_HANG_UP
	waitsfx
	faceplayer
	opentext
	writetext OaksLabBugsyAfterBattleText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal RIGHT, .Around
	applymovement OAKSLAB2F_BUGSY2, OaksLab2FBugsyLeaveDirectMovement
.Merge2:
	setevent EVENT_COMPLETED_INVERSE_QUEST
	setevent EVENT_BATTLE_TOWER_TYPE_MODES_UNLOCKED
	disappear OAKSLAB2F_BUGSY2
	end

.Right:
	turnobject OAKSLAB2F_BUGSY2, RIGHT
	sjump .Merge1

.Left:
	turnobject OAKSLAB2F_BUGSY2, LEFT
	sjump .Merge1

.Around:
	applymovement OAKSLAB2F_BUGSY2, OaksLab2FBugsyLeaveAroundMovement
	sjump .Merge2

.NotDone:
	writetext OaksLab2FBugsyWaitingText
	waitbutton
	closetext
	turnobject OAKSLAB2F_BUGSY2, UP
	end

OaksLab2FBugCatcherRobScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_BUG_CATCHER_ROB
	iftrue .AfterBattle
	writetext InverseBugCatcherRobSeenText
	waitbutton
	closetext
	winlosstext InverseBugCatcherRobBeatenText, 0
	loadtrainer BUG_CATCHER, ROB
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_BUG_CATCHER_ROB
	closetext
	end

.AfterBattle:
	writetext InverseBugCatcherRobAfterBattleText
OaksLab2F_EndText:
	waitbutton
	closetext
	end

OaksLab2FScientistTaylorScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_SCIENTIST_TAYLOR
	iftrue .AfterBattle
	writetext InverseScientistTaylorSeenText
	waitbutton
	closetext
	winlosstext InverseScientistTaylorBeatenText, 0
	loadtrainer SCIENTIST, TAYLOR
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_SCIENTIST_TAYLOR
	closetext
	end

.AfterBattle:
	writetext InverseScientistTaylorAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FScientistElvinScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_SCIENTIST_ELVIN
	iftrue .AfterBattle
	writetext InverseScientistElvinSeenText
	waitbutton
	closetext
	winlosstext InverseScientistElvinBeatenText, 0
	loadtrainer SCIENTIST, ELVIN
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_SCIENTIST_ELVIN
	closetext
	end

.AfterBattle:
	writetext InverseScientistElvinAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FFisherJonahScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_FISHER_JONAH
	iftrue .AfterBattle
	writetext InverseFisherJonahSeenText
	waitbutton
	closetext
	winlosstext InverseFisherJonahBeatenText, 0
	loadtrainer FISHER, JONAH
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_FISHER_JONAH
	closetext
	end

.AfterBattle:
	writetext InverseFisherJonahAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FCooltrainerMBlakeScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_COOLTRAINERM_BLAKE
	iftrue .AfterBattle
	writetext InverseCooltrainerMBlakeSeenText
	waitbutton
	closetext
	winlosstext InverseCooltrainerMBlakeBeatenText, 0
	loadtrainer COOLTRAINERM, BLAKE
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_COOLTRAINERM_BLAKE
	closetext
	end

.AfterBattle:
	writetext InverseCooltrainerMBlakeAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FCooltrainerFStellaScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_COOLTRAINERF_STELLA
	iftrue .AfterBattle
	writetext InverseCooltrainerFStellaSeenText
	waitbutton
	closetext
	winlosstext InverseCooltrainerFStellaBeatenText, 0
	loadtrainer COOLTRAINERF, STELLA
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_COOLTRAINERF_STELLA
	closetext
	end

.AfterBattle:
	writetext InverseCooltrainerFStellaAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FSuperNerdShawnScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_SUPER_NERD_SHAWN
	iftrue .AfterBattle
	writetext InverseSuperNerdShawnSeenText
	waitbutton
	closetext
	winlosstext InverseSuperNerdShawnBeatenText, 0
	loadtrainer SUPER_NERD, SHAWN
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_SUPER_NERD_SHAWN
	closetext
	end

.AfterBattle:
	writetext InverseSuperNerdShawnAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FPokemaniacTannerScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_POKEMANIAC_TANNER
	iftrue .AfterBattle
	writetext InversePokemaniacTannerSeenText
	waitbutton
	closetext
	winlosstext InversePokemaniacTannerBeatenText, 0
	loadtrainer POKEMANIAC, TANNER
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_POKEMANIAC_TANNER
	closetext
	end

.AfterBattle:
	writetext InversePokemaniacTannerAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FPokefanMJoshuaScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_POKEFANM_JOSHUA
	iftrue .AfterBattle
	writetext InversePokefanMJoshuaSeenText
	waitbutton
	closetext
	winlosstext InversePokefanMJoshuaBeatenText, 0
	loadtrainer POKEFANM, JOSHUA
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_POKEFANM_JOSHUA
	closetext
	end

.AfterBattle:
	writetext InversePokefanMJoshuaAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FHikerKennyScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_HIKER_KENNY
	iftrue .AfterBattle
	writetext InverseHikerKennySeenText
	waitbutton
	closetext
	winlosstext InverseHikerKennyBeatenText, 0
	loadtrainer HIKER, KENNY
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_HIKER_KENNY
	closetext
	end

.AfterBattle:
	writetext InverseHikerKennyAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FPokefanFGeorgiaScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_POKEFANF_GEORGIA
	iftrue .AfterBattle
	writetext InversePokefanFGeorgiaSeenText
	waitbutton
	closetext
	winlosstext InversePokefanFGeorgiaBeatenText, 0
	loadtrainer POKEFANF, GEORGIA
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_POKEFANF_GEORGIA
	closetext
	end

.AfterBattle:
	writetext InversePokefanFGeorgiaAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FBlackbeltWaiScript:
	faceplayer
	opentext
	checkevent EVENT_INVERSE_BEAT_BLACKBELT_WAI
	iftrue .AfterBattle
	writetext InverseBlackbeltWaiSeenText
	waitbutton
	closetext
	winlosstext InverseBlackbeltWaiBeatenText, 0
	loadtrainer BLACKBELT_T, WAI
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	setevent EVENT_INVERSE_BEAT_BLACKBELT_WAI
	closetext
	end

.AfterBattle:
	writetext InverseBlackbeltWaiAfterBattleText
	sjump OaksLab2F_EndText

OaksLab2FPokedexMachine:
	jumptext OaksLab2FPokedexMachineText

OaksLab2FBugsyStepDownMovement:
	step DOWN
	step_end

OaksLab2FBugsyWalkToComputerMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

OaksLab2FBugsyLeaveAroundMovement:
	step DOWN
OaksLab2FBugsyLeaveDirectMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

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
	line "some of his data"
	cont "from the web."

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

InverseBugCatcherRobSeenText:
	text "I owe BUGSY a"
	line "favor, so here it"
	cont "goes!"
	done

InverseBugCatcherRobBeatenText:
	text "Well, that could've"
	line "gone better."
	done

InverseBugCatcherRobAfterBattleText:
	text "I was hoping bug"
	line "types would fare"

	para "better in this"
	line "format…"
	done

InverseScientistTaylorSeenText:
	text "I'm on loan from"
	line "SILPH."

	para "They'll be very"
	line "interested in this"
	cont "project."
	done

InverseScientistTaylorBeatenText:
	text "I see…"
	done

InverseScientistTaylorAfterBattleText:
	text "It'll be SILPH's job"
	line "to find out how to"

	para "make this research"
	line "profitable."
	done

InverseScientistElvinSeenText:
	text "Usually, ghost and"
	line "normal types have"

	para "no effect on each"
	line "other…"

	para "But in an inverse"
	line "battle, they're"

	para "super effective on"
	line "each other!"
	done

InverseScientistElvinBeatenText:
	text "Egad!"
	done

InverseScientistElvinAfterBattleText:
	text "That GYM LEADER"
	line "from JOHTO is one"
	cont "clever child!"
	done

InverseFisherJonahSeenText:
	text "I was roped into"
	line "this, but I just"

	para "want to get back"
	line "to fishing."
	done

InverseFisherJonahBeatenText:
	text "That was… weird."
	done

InverseFisherJonahAfterBattleText:
	text "I wonder how long"
	line "PROF.OAK will let"
	cont "us stay here…"
	done

InverseCooltrainerMBlakeSeenText:
	text "I'm up for anything"
	line "you can dish out!"
	done

InverseCooltrainerMBlakeBeatenText:
	text "Yow!"
	done

InverseCooltrainerMBlakeAfterBattleText:
	text "Immunities are"
	line "hard to keep track"
	cont "of in inverse"
	cont "mode…"
	done

InverseCooltrainerFStellaSeenText:
	text "Steel has lots of"
	line "resistances, so in"

	para "an inverse battle"
	line "that means…"

InverseCooltrainerFStellaBeatenText:
	text "Oh dear."
	done

InverseCooltrainerFStellaAfterBattleText:
	text "Even if I lost, I'm"
	line "glad I could con-"
	cont "tribute to such an"
	cont "exciting project!"
	done

InverseSuperNerdShawnSeenText:
	text "I wanna be the"
	line "first on scene to"

	para "study this new"
	line "battle type!"
	done

InverseSuperNerdShawnBeatenText:
	text "OK! OK! Uncle!"
	done

InverseSuperNerdShawnAfterBattleText:
	text "I wonder how"
	line "FORESIGHT affects"
	cont "immunities…"
	done

InversePokemaniacTannerSeenText:
	text "My team is varied"
	line "enough to win even"
	cont "an inverse battle!"
	done

InversePokemaniacTannerBeatenText:
	text "How'd you do that?"
	done

InversePokemaniacTannerAfterBattleText:
	text "Type variety is"
	line "still the key to"
	cont "victory."
	done

InversePokefanMJoshuaSeenText:
	text "Me and my rodent"
	line "gang are just here"
	cont "for fun!"
	done

InversePokefanMJoshuaBeatenText:
	text "Criminitly!"
	done

InversePokefanMJoshuaAfterBattleText:
	text "You didn't have to"
	line "beat us that hard…"
	done

InverseHikerKennySeenText:
	text "A new type of"
	line "battle is like a"

	para "new mountain to"
	line "climb!"
	done

InverseHikerKennyBeatenText:
	text "I fell off that"
	line "cliff."
	done

InverseHikerKennyAfterBattleText:
	text "That was kind of"
	line "like climbing a"

	para "hill while walking"
	line "backwards."
	done

InversePokefanFGeorgiaSeenText:
	text "Don't tell BUGSY,"
	line "but I think some-"
	cont "one already did"
	cont "this in KALOS."
	done

InversePokefanFGeorgiaBeatenText:
	text "I can't even re-"
	line "member the normal"
	cont "type matchups."
	done

InversePokefanFGeorgiaAfterBattleText:
	text "In inverse mode,"
	line "normal-type moves"

	text "finally get to be"
	line "super effective"
	cont "against something!"
	done

InverseBlackbeltWaiSeenText:
	text "This will take my"
	line "training to the"
	cont "next level!"
	done

InverseBlackbeltWaiBeatenText:
	text "Is that what it's"
	line "like?"
	done

InverseBlackbeltWaiAfterBattleText:
	text "Inverse battles"
	line "make fighting"

	para "#MON immune to"
	line "ghost moves!"
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
	object_event  3,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, OaksLab2FBugCatcherRobScript, EVENT_OAKS_LAB_2F_BUG_CATCHER_ROB
	object_event 16, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, OaksLab2FScientistTaylorScript, EVENT_OAKS_LAB_2F_SCIENTIST_TAYLOR
	object_event 12, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, OaksLab2FScientistElvinScript, EVENT_OAKS_LAB_2F_SCIENTIST_ELVIN
	object_event 24,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, OaksLab2FFisherJonahScript, EVENT_OAKS_LAB_2F_FISHER_JONAH
	object_event 21, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, OaksLab2FCooltrainerMBlakeScript, EVENT_OAKS_LAB_2F_COOLTRAINERM_BLAKE
	object_event 23, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, OaksLab2FCooltrainerFStellaScript, EVENT_OAKS_LAB_2F_COOLTRAINERF_STELLA
	object_event  5, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, OaksLab2FSuperNerdShawnScript, EVENT_OAKS_LAB_2F_SUPER_NERD_SHAWN
	object_event  5, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, OaksLab2FPokemaniacTannerScript, EVENT_OAKS_LAB_2F_POKEMANIAC_TANNER
	object_event  7, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, OaksLab2FPokefanMJoshuaScript, EVENT_OAKS_LAB_2F_POKEFANM_JOSHUA
	object_event 15, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, OaksLab2FHikerKennyScript, EVENT_OAKS_LAB_2F_HIKER_KENNY
	object_event  4, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, OaksLab2FPokefanFGeorgiaScript, EVENT_OAKS_LAB_2F_POKEFANF_GEORGIA
	object_event 20, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, OaksLab2FBlackbeltWaiScript, EVENT_OAKS_LAB_2F_BLACKBELT_WAI
