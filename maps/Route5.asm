	object_const_def
	const ROUTE5_SUPER_NERD
	const ROUTE5_POKEFAN_M

Route5_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokemaniacTanner:
	trainer POKEMANIAC, TANNER, EVENT_BEAT_POKEMANIAC_TANNER, PokemaniacTannerSeenText, PokemaniacTannerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacTannerAfterBattleText
	waitbutton
	closetext
	end

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

PokemaniacTannerSeenText:
	text "I've assembled the"
	line "ultimate collect-"
	cont "ion!"
	done

PokemaniacTannerBeatenText:
	text "Nooooooooo!"
	done

PokemaniacTannerAfterBattleText:
	text "You made me take"
	line "my #MON out of"
	cont "their BALLS!"
	done

Route5PokefanMText:
	text "The POWER PLANT's"
	line "MANAGER paid me to"

	para "stand here. I"
	line "don't care why."
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 15, UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 18, 17, ROUTE_5_SAFFRON_GATE, 1
	warp_event 19, 17, ROUTE_5_SAFFRON_GATE, 2
	warp_event 20, 11, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 27, 17, BGEVENT_READ, Route5UndergroundPathSign

	def_object_events
	object_event 13,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacTanner, -1
	object_event 27, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
