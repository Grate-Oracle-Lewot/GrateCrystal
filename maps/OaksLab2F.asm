	object_const_def

OaksLab2F_MapScripts:
	def_scene_scripts

	def_callbacks

OaksLab2FPokedexMachine:
	jumptext OaksLab2FPokedexMachineText

OaksLab2FPokedexMachineText:
	text "This looks like it"
	line "fabricates copies"
	cont "of the #DEX."
	done

OaksLab2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 24, OAKS_LAB, 3

	def_coord_events

	def_bg_events
	bg_event 27,  1, BGEVENT_READ, OaksLab2FPokedexMachine

	def_object_events
