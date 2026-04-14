	object_const_def
	const DARKCAVEVIOLETENTRANCE_COOLTRAINER_M
	const DARKCAVEVIOLETENTRANCE_ROCK1
	const DARKCAVEVIOLETENTRANCE_ROCK2
	const DARKCAVEVIOLETENTRANCE_ROCK3
	const DARKCAVEVIOLETENTRANCE_ROCK4
	const DARKCAVEVIOLETENTRANCE_POKE_BALL1
	const DARKCAVEVIOLETENTRANCE_POKE_BALL2
	const DARKCAVEVIOLETENTRANCE_POKE_BALL3
	const DARKCAVEVIOLETENTRANCE_POKE_BALL4
	const DARKCAVEVIOLETENTRANCE_POKE_BALL5
	const DARKCAVEVIOLETENTRANCE_POKE_BALL6

DarkCaveVioletEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end

DarkCaveVioletEntranceRock:
	jumpstd SmashRockScript

DarkCaveVioletEntranceSuperPotion:
	itemball SUPER_POTION

DarkCaveVioletEntranceFullHeal:
	itemball FULL_HEAL

DarkCaveVioletEntranceHyperPotion:
	itemball HYPER_POTION

DarkCaveVioletEntranceDireHit:
	itemball DIRE_HIT

DarkCaveVioletEntranceEscapeRope:
	itemball ESCAPE_ROPE

DarkCaveVioletEntranceDuskBall:
	itemball DUSK_BALL

DarkCaveVioletEntranceHiddenElixer:
	hiddenitem ELIXER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER

DarkCaveVioletEntranceHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_X_ACCURACY

DarkCaveVioletEntranceHiddenXEvade:
	hiddenitem X_EVADE, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_X_EVADE

CooltrainermTylerSeenText:
	text "I like training"
	line "here in the dark."

	para "It's more exciting"
	line "this way!"
	done

CooltrainermTylerBeatenText:
	text "I didn't even see"
	line "what happened!"
	done

CooltrainermTylerAfterBattleText:
	text "Hello darkness, my"
	line "old friend…"
	done

DarkCaveVioletEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, ROUTE_31, 3
	warp_event 17,  1, DARK_CAVE_BLACKTHORN_ENTRANCE, 2
	warp_event 35, 33, ROUTE_46, 3
	warp_event 11,  7, DARK_CAVE_VIOLET_ENTRANCE, 5
	warp_event 15, 27, DARK_CAVE_VIOLET_ENTRANCE, 4
	warp_event  8, 29, DARK_CAVE_VIOLET_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event 26,  3, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenElixer
	bg_event  3, 22, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenXAccuracy
	bg_event  3, 22, BGEVENT_ITEM, DarkCaveVioletEntranceHiddenXEvade

	def_object_events
	object_event 35, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermTyler, -1
	object_event 16, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 27,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event  7, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event 36, 31, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveVioletEntranceRock, -1
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceSuperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
	object_event 36, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceFullHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	object_event 35,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceHyperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	object_event 30, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceDireHit, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
	object_event 11, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceEscapeRope, EVENT_DARK_CAVE_VIOLET_ENTRANCE_ESCAPE_ROPE
	object_event  7, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntranceDuskBall, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DUSK_BALL
