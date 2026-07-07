	object_const_def
	const CERULEANPOLICESTATION_OFFICER
	const CERULEANPOLICESTATION_OFFICER_JENNY
	const CERULEANPOLICESTATION_DIGLETT

CeruleanPoliceStation_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPoliceStationOfficerScript:
	jumptextfaceplayer CeruleanPoliceStationOfficerText

CeruleanPoliceStationPokefanFScript:
	jumptextfaceplayer CeruleanPoliceStationJennyText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

CeruleanPoliceStationOfficerText:
	text "I heard that some"
	line "shady characters"

	para "have been skulking"
	cont "about."

	para "I won't stand for"
	line "it if they turn"
	cont "out to be thieves."
	done

CeruleanPoliceStationJennyText:
	text "We've had to stop"
	line "keeping TMs here"

	para "to discourage"
	line "robbers."
	done

CeruleanDiglettText:
	text "DIGLETT: Dug dug."
	done

CeruleanPoliceStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationOfficerScript, -1
	object_event  5,  4, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationJennyScript, -1
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, -1
