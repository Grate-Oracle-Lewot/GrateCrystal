	object_const_def
	const ICEPATHB3F_YOUNGSTER
	const ICEPATHB3F_ROCK
	const ICEPATHB3F_BOULDER
	const ICEPATHB3F_POKE_BALL

IcePathB3F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPsychicMelvin:
	trainer PSYCHIC_T, MELVIN, EVENT_BEAT_PSYCHIC_MELVIN, PsychicMelvinSeenText, PsychicMelvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMelvinAfterBattleText
	waitbutton
	closetext
	end

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd SmashRockScript

IcePathB3FBoulder:
	jumpstd StrengthBoulderScript

PsychicMelvinSeenText:
	text "I've learned to"
	line "insulate my body"

	para "from the cold"
	line "using only my"
	cont "mind!"
	done

PsychicMelvinBeatenText:
	text "You broke my"
	line "concentration…"
	done

PsychicMelvinAfterBattleText:
	text "I am cold."
	done

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2
	warp_event  3, 11, ICE_PATH_ARTICUNO_CHAMBER, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerPsychicMelvin, -1
	object_event  6,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
	object_event  8, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FBoulder, -1
	object_event  5,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
