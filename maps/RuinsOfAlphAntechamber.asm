	object_const_def

RuinsOfAlphAntechamber_MapScripts:
	def_scene_scripts

	def_callbacks

RuinsOfAlphAntechamberAncientReplica:
	jumptext RuinsOfAlphAntechamberAncientReplicaText

RuinsOfAlphAntechamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphAntechamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  3,  5, RUINS_OF_ALPH_INNER_CHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphAntechamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphAntechamberAncientReplica

	def_object_events
