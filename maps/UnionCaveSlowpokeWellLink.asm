	object_const_def
	const UNIONSLOWPOKELINK_BOULDER
	const UNIONSLOWPOKELINK_ROCKER
	const UNIONSLOWPOKELINK_ROCKET
	const UNIONSLOWPOKELINK_POKE_BALL

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

TrainerGruntM27:
	trainer GRUNTM, GRUNTM_27, EVENT_BEAT_ROCKET_GRUNTM_27, GruntM27SeenText, GruntM27BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext GruntM27AfterBattleText
	waitbutton
	closetext
	end

UnionCaveSlowpokeWellLinkPickaxe:
	itemball PICKAXE

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

GruntM27SeenText:
	text "Where'd everybody"
	line "go? Are we still"

	para "stealing SLOWPOKE"
	line "TAILS?"
	done

GruntM27BeatenText:
	text "Aw, nuts."
	done

GruntM27AfterBattleText:
	text "I got left behind!"
	done

UnionCaveSlowpokeWellLink_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31,  5, UNION_CAVE_B2F, 2
	warp_event  7, 13, SLOWPOKE_WELL_B2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveSlowpokeWellLinkBoulder, -1
	object_event 28,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBurglarFizbo, -1
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM27, -1
	object_event 34, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_GREEN, OBJECTTYPE_ITEMBALL, 0, UnionCaveSlowpokeWellLinkPickaxe, EVENT_UNION_CAVE_SLOWPOKE_WELL_LINK_PICKAXE
