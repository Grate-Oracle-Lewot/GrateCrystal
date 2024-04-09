	object_const_def
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_SUPER_NERD
	const FIGHTINGDOJO_POKE_BALL

FightingDojo_MapScripts:
	def_scene_scripts

	def_callbacks

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
