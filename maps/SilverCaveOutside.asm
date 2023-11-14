	object_const_def
	const SILVERCAVEOUTSIDE_BIKER
	const SILVERCAVEOUTSIDE_SWIMMER_GIRL
	const SILVERCAVEOUTSIDE_POKE_BALL

SilverCaveOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

TrainerBikerTBone:
	trainer BIKER, T_BONE, EVENT_BEAT_BIKER_T_BONE, BikerTBoneSeenText, BikerTBoneBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BikerTBoneAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end

MtSilverOutsideTMNightTerror:
	itemball TM_NIGHT_TERROR

MtSilverPokecenterSign:
	jumpstd PokecenterSignScript

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

BikerTBoneSeenText:
	text "I love this place!"
	line "The #MON are"

	para "super tough, just"
	line "like me!"
	done

BikerTBoneBeatenText:
	text "I said I was super"
	line "tough, not my"
	cont "#MON."
	done

BikerTBoneAfterBattleText:
	text "Part of being"
	line "tough is admitting"

	para "when someone else"
	line "is tougher."

	para "Don't spread tox-"
	line "ic masculinity!"
	done

SwimmerfMarySeenText:
	text "Let's do this."
	done

SwimmerfMaryBeatenText:
	text "I should've done"
	line "more than grind"
	cont "my starter."
	done

SwimmerfMaryAfterBattleText:
	text "There's no better"
	line "way to build up"

	para "swimming stamina"
	line "than being chased"

	para "by a super-strong"
	line "#MON!"
	done

MtSilverSignText:
	text "MT.SILVER"
	done

SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1
	warp_event 18, 11, SILVER_CAVE_ROOM_1, 1

	def_coord_events

	def_bg_events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event  9, 25, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

	def_object_events
	object_event 25, 29, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBikerTBone, -1
	object_event 16, 26, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfMary, -1
	object_event  4, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_ITEMBALL, 0, MtSilverOutsideTMNightTerror, EVENT_SILVER_CAVE_OUTSIDE_TM_NIGHT_TERROR
