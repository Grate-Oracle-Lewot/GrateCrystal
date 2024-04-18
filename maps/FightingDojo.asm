	object_const_def
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_SUPER_NERD
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_KIYO
	const FIGHTINGDOJO_SABRINA

FightingDojo_MapScripts:
	def_scene_scripts
	scene_script .DojoSabrinaScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SabrinaAndKiyo

.DojoSabrinaScene:
	pause 5
	opentext
	writetext FightingDojoSabrinaSceneText1
	waitbutton
	closetext
	applymovement FIGHTINGDOJO_KIYO, FightingDojo_KiyoMovement
	playsound SFX_EXIT_BUILDING
	disappear FIGHTINGDOJO_KIYO
	turnobject PLAYER, RIGHT
	pause 30
	opentext
	writetext FightingDojoSabrinaSceneText2
	waitbutton
	closetext
	applymovement FIGHTINGDOJO_SABRINA, FightingDojo_SabrinaMovement
	opentext
	writetext FightingDojoSabrinaSceneText3
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	disappear FIGHTINGDOJO_SABRINA
	turnobject PLAYER, DOWN
	setevent EVENT_SABRINA_IN_FIGHTING_DOJO
	setscene SCENE_FINISHED
	end

.DummyScene:
	end

.SabrinaAndKiyo:
	checkevent EVENT_SABRINA_IN_FIGHTING_DOJO
	iftrue .Disappear
	appear FIGHTINGDOJO_KIYO
	appear FIGHTINGDOJO_SABRINA
	end

.Disappear:
	disappear FIGHTINGDOJO_KIYO
	disappear FIGHTINGDOJO_SABRINA
	end

FightingDojoBlackBelt:
	jumptextfaceplayer FightingDojoBlackBeltText

TrainerJugglerIrving:
	trainer JUGGLER, IRVING, EVENT_BEAT_JUGGLER_IRVING, JugglerIrvingSeenText, JugglerIrvingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerIrvingAfterBattleText
	waitbutton
	closetext
	end

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

FightingDojo_KiyoMovement:
	turn_head UP
	turn_head RIGHT
	step DOWN
	turn_head RIGHT
	turn_head UP
	turn_head LEFT
	step DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

FightingDojo_SabrinaMovement:
	step RIGHT
	step DOWN
	step DOWN
	step_end

FightingDojoBlackBeltText:
	text "I'm sorry. Our"
	line "KARATE KING is not"
	cont "here."

	para "He is training to"
	line "challenge SABRINA"

	para "for the title of"
	line "GYM LEADER."

	para "He sought out a"
	line "cave in JOHTO as a"
	cont "training ground."

	para "I believe it was"
	line "called MT.MORTAR."
	done

JugglerIrvingSeenText:
	text "You're the first"
	line "visitor in years!"
	done

JugglerIrvingBeatenText:
	text "Oh! My BALLS!"
	done

JugglerIrvingAfterBattleText:
	text "Nobody comes here"
	line "anymore. It's a"
	cont "shame."
	done

FightingDojoSabrinaSceneText1:
	text "SABRINA: How many"
	line "times must we"

	para "battle before you"
	line "realize what it is"
	cont "that you lack?"

	para "KIYO: Hurrrgh!"

	para "I will train hard-"
	line "er than ever!"
	done

FightingDojoSabrinaSceneText2:
	text "SABRINA: Sigh…"
	done

FightingDojoSabrinaSceneText3:
	text "SABRINA: …See you"
	line "soon…"
	done

FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	def_object_events
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  6,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerIrving, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  5,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIGHTINGDOJO_KIYO
	object_event  4,  9, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIGHTINGDOJO_SABRINA
