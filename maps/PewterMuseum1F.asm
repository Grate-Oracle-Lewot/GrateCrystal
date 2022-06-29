	object_const_def
	const PEWTERMUSEUM1F_SCIENTIST

PewterMuseum1F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum1FScientistScript:
	jumptextfaceplayer PewterMuseum1FScientistText

AerodactylFossilSignScript:
	refreshscreen $0
	trainerpic AEROBONES
	waitbutton
	closepokepic
	jumptext AerodactylFossilSignText

KabutopsFossilSignScript:
	refreshscreen $0
	trainerpic KABUBONES
	waitbutton
	closepokepic
	jumptext KabutopsFossilSignText

PewterMuseum1FScientistText:
	text "Thanks to our"
	line "successful fossil"

	para "breeding program,"
	line "you can now find"

	para "once-extinct #-"
	line "MON in the wild!"

	para "That means fewer"
	line "people come here"

	para "to see our fossil"
	line "exhibits, though…"
	done

AerodactylFossilSignText:
	text "A fossil of a"
	line "#MON that ruled"

	para "the skies in anci-"
	line "ent times, now"

	para "identified as"
	line "AERODACTYL."

	para "Originally hypoth-"
	line "esized to have"

	para "gained the rock"
	line "type through the"

	para "fossilization pro-"
	line "cess, research in-"
	cont "to mega evolution"

	para "has shown that it"
	line "had the typing"

	para "even in its pre-"
	line "historic form."
	done

KabutopsFossilSignText:
	text "A fossil of a"
	line "#MON that ruled"

	para "the seas in anci-"
	line "ent times, now"

	para "identified as"
	line "KABUTOPS."

	para "Despite its lanky"
	line "appearance, it was"

	para "a swift swimmer"
	line "and could quickly"

	para "attack prey with"
	line "its scythe-like"

	para "arms while being"
	line "protected by its"
	cont "rocky carapace."
	done

PewterMuseum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 6
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, AerodactylFossilSignScript
	bg_event  2,  6, BGEVENT_READ, KabutopsFossilSignScript

	def_object_events
	object_event 12,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FScientistScript, -1
