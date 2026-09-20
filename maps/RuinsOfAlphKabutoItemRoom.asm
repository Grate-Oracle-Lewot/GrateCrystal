	object_const_def
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL1
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL3
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL4

RuinsOfAlphKabutoItemRoom_MapScripts:
	def_scene_scripts

	def_callbacks

RuinsOfAlphKabutoItemRoomGoldBerry:
	itemball GOLD_BERRY

RuinsOfAlphKabutoItemRoomTMFalseSwipe:
	itemball TM_FALSE_SWIPE, 5

RuinsOfAlphKabutoItemRoomOldGateau:
	itemball OLD_GATEAU

RuinsOfAlphKabutoItemRoomBugwort:
	itemball BUGWORT

RuinsOfAlphKabutoItemRoomAncientReplica:
	jumptext RuinsOfAlphKabutoItemRoomAncientReplicaText

RuinsOfAlphKabutoItemRoomAncientReplicaText:
	text_far _AncientPokemonStatueText
	text_end

RuinsOfAlphKabutoItemRoom_MapEvents:
	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 5
	warp_event  4,  9, RUINS_OF_ALPH_KABUTO_CHAMBER, 5
	warp_event  3,  1, RUINS_OF_ALPH_KABUTO_WORD_ROOM, 1
	warp_event  4,  1, RUINS_OF_ALPH_KABUTO_WORD_ROOM, 2

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, RuinsOfAlphKabutoItemRoomAncientReplica
	bg_event  5,  1, BGEVENT_READ, RuinsOfAlphKabutoItemRoomAncientReplica

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomGoldBerry, EVENT_PICKED_UP_GOLD_BERRY_FROM_KABUTO_ITEM_ROOM
	object_event  5,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomTMFalseSwipe, EVENT_PICKED_UP_TM_FALSE_SWIPE_FROM_KABUTO_ITEM_ROOM
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomOldGateau, EVENT_PICKED_UP_OLD_GATEAU_FROM_KABUTO_ITEM_ROOM
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomBugwort, EVENT_PICKED_UP_BUGWORT_FROM_KABUTO_ITEM_ROOM
