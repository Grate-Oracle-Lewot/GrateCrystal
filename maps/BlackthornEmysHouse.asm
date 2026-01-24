	object_const_def
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Emy:
	checknuzlocke
	iftrue .nuzlocke
	faceplayer
	opentext
	trade NPC_TRADE_EMY
	waitbutton
	closetext
	end

.nuzlocke
	jumpstd NuzlockeNPCScript

BlackthornEmysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 3
	warp_event  3,  7, BLACKTHORN_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
