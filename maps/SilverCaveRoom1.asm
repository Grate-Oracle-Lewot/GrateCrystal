	object_const_def
	const SILVERCAVEROOM1_POKE_BALL1
	const SILVERCAVEROOM1_POKE_BALL2
	const SILVERCAVEROOM1_POKE_BALL3
	const SILVERCAVEROOM1_POKE_BALL4
	const SILVERCAVEROOM1_CHRIS
	const SILVERCAVEROOM1_KIMONO_GIRL
	const SILVERCAVEROOM1_SWIMMER_M

SilverCaveRoom1_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveRoom1MaxElixer:
	itemball MAX_ELIXER

SilverCaveRoom1Protein:
	itemball PROTEIN

SilverCaveRoom1EscapeRope:
	itemball ESCAPE_ROPE

SilverCaveRoom1UltraBall:
	itemball ULTRA_BALL

TrainerIggy:
	trainer CAL, IGGY, EVENT_BEAT_TRAINER_IGGY, TrainerIggySeenText, TrainerIggyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TrainerIggyAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKyoshi:
	trainer KIMONO_GIRL, KYOSHI, EVENT_BEAT_KIMONO_GIRL_KYOSHI, KimonoGirlKyoshiSeenText, KimonoGirlKyoshiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext KimonoGirlKyoshiAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerMPhelps:
	trainer SWIMMERM, PHELPS, EVENT_BEAT_SWIMMERM_PHELPS, SwimmerMPhelpsSeenText, SwimmerMPhelpsBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SwimmerMPhelpsAfterBattleText
	waitbutton
	closetext
	end

SilverCaveRoom1HiddenDireHit:
	hiddenitem DIRE_HIT, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_DIRE_HIT

SilverCaveRoom1HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_SILVER_CAVE_ROOM_1_HIDDEN_ULTRA_BALL

TrainerIggySeenText:
	text "I wanna be the"
	line "very best…"

	para "like no one ever"
	line "was!"
	done

TrainerIggyBeatenText:
	text "That wasn't my"
	line "very best."
	done

TrainerIggyAfterBattleText:
	text "You're pretty"
	line "strong. I'll have"
	cont "to train more."
	done

KimonoGirlKyoshiSeenText:
	text "Interrupting my"
	line "dance? How rude!"
	done

KimonoGirlKyoshiBeatenText:
	text "Very well. I"
	line "yield."
	done

KimonoGirlKyoshiAfterBattleText:
	text "You must be the"
	line "one who defeated"
	cont "my granddaughters."

	para "Now I understand"
	line "how. Your spirit"
	cont "is true."
	done

SwimmerMPhelpsSeenText:
	text "That's right, I'm"
	line "so extreme I'm"

	para "swimming in the"
	line "solid ground!"
	done

SwimmerMPhelpsBeatenText:
	text "Buried alive!"
	done

SwimmerMPhelpsAfterBattleText:
	text "I think I'm stuck"
	line "in this hole…"
	done

SilverCaveRoom1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_OUTSIDE, 2
	warp_event 15,  1, SILVER_CAVE_ROOM_2, 1

	def_coord_events

	def_bg_events
	bg_event 16, 23, BGEVENT_ITEM, SilverCaveRoom1HiddenDireHit
	bg_event 17, 12, BGEVENT_ITEM, SilverCaveRoom1HiddenUltraBall

	def_object_events
	object_event  4,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1MaxElixer, EVENT_SILVER_CAVE_ROOM_1_MAX_ELIXER
	object_event 15, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1Protein, EVENT_SILVER_CAVE_ROOM_1_PROTEIN
	object_event  5, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1EscapeRope, EVENT_SILVER_CAVE_ROOM_1_ESCAPE_ROPE
	object_event  7, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom1UltraBall, EVENT_SILVER_CAVE_ROOM_1_ULTRA_BALL
	object_event 11,  3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerIggy, -1
	object_event  6, 21, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKyoshi, -1
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSwimmerMPhelps, -1
