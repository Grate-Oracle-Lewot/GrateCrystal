	object_const_def
	const DARKCAVE2F_POKE_BALL

DarkCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCave2FFocusBand:
	itemball FOCUS_BAND

DarkCave2FHiddenAmuletCoin:
	hiddenitem AMULET_COIN, EVENT_DARK_CAVE_2F_HIDDEN_AMULET_COIN

DarkCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event 10,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 4

	def_coord_events

	def_bg_events
  bg_event 17,  3, BGEVENT_ITEM, DarkCave2FHiddenAmuletCoin

	def_object_events
	object_event  6,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave2FFocusBand, EVENT_DARK_CAVE_2F_FOCUS_BAND
