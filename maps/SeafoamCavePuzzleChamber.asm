	object_const_def

SeafoamCavePuzzleChamber_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_SEAFOAM_CAVE
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	endcallback

SeafoamCaveUBEQCPuzzle:
	checkevent EVENT_WALL_OPENED_IN_SEAFOAM_CAVE
	iftrue .AlreadySolved
	refreshscreen
	setval UNOWNPUZZLE_UBEQC
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.AlreadySolved:
	opentext
	writetext SeafoamCavePuzzleChamberSolvedText
	waitbutton
	closetext
	end

.PuzzleComplete:
	setevent EVENT_WALL_OPENED_IN_SEAFOAM_CAVE
	pause 30
	earthquake 30
	showemote EMOTE_QUESTION, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

SeafoamCavePuzzleChamberAncientReplica:
	jumptext SeafoamCavePuzzleChamberAncientReplicaText

SeafoamCavePuzzleChamberDescriptionSign:
	jumptext SeafoamCavePuzzleChamberDescriptionText

SeafoamCavePuzzleChamberWallPatternLeft:
	opentext
	writetext SeafoamCavePuzzleChamberWallPatternLeftText
	setval UNOWNWORDS_GRATE
	special DisplayUnownWords
	closetext
	end

SeafoamCavePuzzleChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_SEAFOAM_CAVE
	iftrue .WallOpen
	opentext
	writetext SeafoamCavePuzzleChamberWallPatternRightText
	setval UNOWNWORDS_GRATE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext SeafoamCavePuzzleChamberWallHoleText
	waitbutton
	closetext
	end

SeafoamCavePuzzleChamberWallPatternLeftText:
	text "Familiar symbols"
	line "dot the walls…"
	done

SeafoamCavePuzzleChamberWallPatternRightText:
	text "Familiar symbols"
	line "dot the walls…"
	done

SeafoamCavePuzzleChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

SeafoamCavePuzzleChamberAncientReplicaText:
	text "It looks like a"
	line "FERALIGATR."
	done

SeafoamCavePuzzleChamberDescriptionText:
	text "The Universal"
	line "Balance of the"
	cont "Eternal Quantum"
	cont "Colors"
	done

SeafoamCavePuzzleChamberSolvedText:
	text "After being slid"
	line "into place, the"

	para "stones form a"
	line "peculiar symbol:"

	para "a square and a"
	line "circle balanced"
	cont "atop a triangle."
	done

SeafoamCavePuzzleChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, ROUTE_20, 2
	warp_event  4,  9, ROUTE_20, 2
	warp_event  4,  0, SEAFOAM_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, SeafoamCavePuzzleChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, SeafoamCavePuzzleChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, SeafoamCaveUBEQCPuzzle
	bg_event  4,  2, BGEVENT_UP, SeafoamCavePuzzleChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, SeafoamCavePuzzleChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, SeafoamCavePuzzleChamberWallPatternRight

	def_object_events
