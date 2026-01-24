	object_const_def
	const OLIVINETIMSHOUSE_TIM

OlivineTimsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Tim:
	checknuzlocke
	iftrue .nuzlocke
	faceplayer
	opentext
	trade NPC_TRADE_TIM
	waitbutton
	closetext
	end

.nuzlocke
	jumpstd NuzlockeNPCScript

OlivineTimsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 3
	warp_event  3,  7, OLIVINE_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Tim, -1
