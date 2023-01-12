	object_const_def
	const SILPHCO8F_SCIENTIST
	const SILPHCO8F_POKE_BALL

SilphCo8F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistElvin:
	trainer SCIENTIST, ELVIN, EVENT_BEAT_SCIENTIST_ELVIN, ScientistElvinSeenText, ScientistElvinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistElvinAfterBattleText
	waitbutton
	closetext
	end

SilphCo8FDuskBall:
	itemball DUSK_BALL

SilphCo8FSign:
	jumptext SilphCo8FSignText

ScientistElvinSeenText:
	text "Eeheehee… I'm the"
	line "one who invented"
	cont "the SILPH SCOPE!"
	done

ScientistElvinBeatenText:
	text "Ooh! You know your"
	line "ghostbusting!"
	done

ScientistElvinAfterBattleText:
	text "Ghost #MON are"
	line "the most fascinat-"
	cont "ing kind!"

	para "Why, some of them"
	line "even used to be"
	cont "people!"
	done

SilphCo8FSignText:
	text "SILPH CO. 8F"
	done

SilphCo8F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, SILPH_CO_7F, 2
	warp_event 17,  2, SILPH_CO_9F, 1
	warp_event  3, 15, SILPH_CO_2F, 3
	warp_event 11,  5, SILPH_CO_2F, 4
	warp_event 11,  9, SILPH_CO_8F, 6
	warp_event  3, 11, SILPH_CO_8F, 5

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo8FSign

	def_object_events
	object_event  4,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistElvin, -1
	object_event  3,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo8FDuskBall, EVENT_SILPH_CO_8F_DUSK_BALL
