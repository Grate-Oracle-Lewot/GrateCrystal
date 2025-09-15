	object_const_def
	const MEWCHAMBER_MEW

MewChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Mew

.Mew:
	checkevent EVENT_FOUGHT_MEW
	iffalse .Appear
	disappear MEWCHAMBER_MEW
	endcallback

.Appear:
	appear MEWCHAMBER_MEW
	endcallback

MewChamberMewScript:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 20
	closetext
	setevent EVENT_FOUGHT_MEW
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	loadwildmon MEW, 42
	startbattle
	disappear MEWCHAMBER_MEW
	reloadmapafterbattle
	end

MewText:
	text "Mew."
	done

MewChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 15, MEW_ANTECHAMBER, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewChamberMewScript, MEWCHAMBER_MEW
