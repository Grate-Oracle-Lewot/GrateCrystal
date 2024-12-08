	object_const_def
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_BIRD
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end

ViridianMartDelibirdScript:
	jumpstd MartDelibirdScript

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartLassText

ViridianMartCooltrainerMScript:
	jumptextfaceplayer ViridianMartCooltrainerMText

ViridianMartLassText:
	text "Other regions have"
	line "special battle"
	cont "phenomena."
	done

ViridianMartCooltrainerMText:
	text "The most intense"
	line "battles I've seen"
	cont "were in FERRUM."

	para "It's a long way"
	line "from here."
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  1,  2, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianMartDelibirdScript, -1
	object_event  7,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
