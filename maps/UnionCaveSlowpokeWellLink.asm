	object_const_def
	const UNIONCAVESLOWPOKEWELLLINK_BOULDER
	const UNIONCAVESLOWPOKEWELLLINK_PHARMACIST
	const UNIONCAVESLOWPOKEWELLLINK_ROCKET
	const UNIONCAVESLOWPOKEWELLLINK_POKE_BALL

UnionCaveSlowpokeWellLink_MapScripts:
	def_scene_scripts

	def_callbacks

UnionCaveSlowpokeWellLinkBoulder:
	jumpstd StrengthBoulderScript

TrainerBurglarFizbo:
	trainer BURGLAR, FIZBO, EVENT_BEAT_BURGLAR_FIZBO, BurglarFizboSeenText, BurglarFizboBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BurglarFizboAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntMStray:
	trainer GRUNTM, GRUNTM_STRAY, EVENT_BEAT_ROCKET_GRUNTM_STRAY, GruntMStraySeenText, GruntMStrayBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext GruntMStrayAfterBattleText
	waitbutton
	closetext
	end

UnionCaveSlowpokeWellLinkPickaxe:
	itemball PICKAXE

UnionCaveSlowpokeWellLinkHiddenDuskBall:
	hiddenitem DUSK_BALL, EVENT_UNION_CAVE_SLOWPOKE_WELL_LINK_HIDDEN_DUSK_BALL

BurglarFizboSeenText:
	text "Hands up, kid!"
	line "Gimme your money!"

	para "What? A battle?"

	para "Heh. OK, let's do"
	line "it that way!"
	done

BurglarFizboBeatenText:
	text "Robble robble…"
	done

BurglarFizboAfterBattleText:
	text "I didn't want to"
	line "be a burglar."
	
	para "But I flunked out"
	line "of clown school…"
	done

GruntMStraySeenText:
	text "Where'd everybody"
	line "go? Are we still"

	para "stealing SLOWPOKE"
	line "TAILS?"
	done

GruntMStrayBeatenText:
	text "Aw, nuts."
	done

GruntMStrayAfterBattleText:
	text "I got left behind!"
	done

UnionCaveSlowpokeWellLink_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31,  5, UNION_CAVE_B2F, 2
	warp_event  7, 13, SLOWPOKE_WELL_B2F, 2

	def_coord_events

	def_bg_events
	bg_event 10,  3, BGEVENT_ITEM, UnionCaveSlowpokeWellLinkHiddenDuskBall

	def_object_events
	object_event  8,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveSlowpokeWellLinkBoulder, -1
	object_event 28,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBurglarFizbo, -1
	object_event 13,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntMStray, -1
	object_event 34, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_GREEN, OBJECTTYPE_ITEMBALL, 0, UnionCaveSlowpokeWellLinkPickaxe, EVENT_UNION_CAVE_SLOWPOKE_WELL_LINK_PICKAXE
