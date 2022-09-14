	object_const_def
	const ABANDONEDLABROOF_POKE_BALL

AbandonedLabRoof_MapScripts:
	def_scene_scripts

	def_callbacks

AbandonedLabRoofTwistedspoon:
	itemball TWISTEDSPOON

AbandonedLabRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  9, ABANDONED_LAB_2F, 2
	warp_event 10, 25, ABANDONED_LAB_2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedLabRoofTwistedspoon, EVENT_ABANDONED_LAB_ROOF_TWISTEDSPOON
