	object_const_def
	const SILPHCO11F_GENTLEMAN
	const SILPHCO11F_SCIENTIST
	const SILPHCO11F_BEAUTY

SilphCo11F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanSylvain:
	trainer GENTLEMAN, SYLVAIN, EVENT_BEAT_GENTLEMAN_SYLVAIN, GentlemanSylvainSeenText, GentlemanSylvainBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext GentlemanSylvainOfferUpGradeText
	yesorno
	iftrue .GiveUpGrade
	writetext GentlemanSylvainRefusedUpGradeText
	waitbutton
	closetext
	end

.GiveUpGrade:
	verbosegiveitem UP_GRADE
	iffalse .BagFull
	end

.BagFull:
	writetext GentlemanSylvainBagFullText
	waitbutton
	closetext
	end

TrainerScientistTravis:
	trainer SCIENTIST, TRAVIS, EVENT_BEAT_SCIENTIST_TRAVIS, ScientistTravisSeenText, ScientistTravisBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistTravisAfterBattleText
	waitbutton
	closetext
	end

SilphCo11FBeautyScript:
	faceplayer
	opentext
	writetext SilphCo11FBeautyText
	waitbutton
	closetext
	turnobject SILPHCO11F_BEAUTY, UP
	end

SilphCo11FSign:
	jumptext SilphCo11FSignText

SilphCoChiefsOfficeSign:
	jumptext SilphCoChiefsOfficeSignText

GentlemanSylvainSeenText:
	text "Hahah! You made it"
	line "all the way up"
	cont "here?"

	para "I like your moxie!"

	para "If you can beat me"
	line "in a battle, I'll"
	cont "give you a reward!"
	done

GentlemanSylvainBeatenText:
	text "A splendid"
	line "performance!"
	done

GentlemanSylvainOfferUpGradeText:
	text "SILPH makes the"
	line "UP-GRADE, which"

	para "can be used to"
	line "evolve PORYGON!"

	para "I'll give you as"
	line "many as you like!"

	para "Do you want one"
	line "now?"
	done

GentlemanSylvainRefusedUpGradeText:
	text "That's OK! Come"
	line "back later if you"
	cont "need one!"
	done

GentlemanSylvainBagFullText:
	text "Whoops! You don't"
	line "have room for it!"
	done

ScientistTravisSeenText:
	text "You're not suppos-"
	line "ed to be up here!"
	done

ScientistTravisBeatenText:
	text "Well, I guess I"
	line "can't stop you."
	done

ScientistTravisAfterBattleText:
	text "You're not the"
	line "CHIEF's kid, are"
	cont "you?"
	done

SilphCo11FBeautyText:
	text "Do you have an"
	line "appointment?"
	done

SilphCo11FSignText:
	text "SILPH CO. 11F"
	done

SilphCoChiefsOfficeSignText:
	text "CHIEF's OFFICE"
	done

SilphCo11F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  2, SILPH_CO_10F, 2
	warp_event  3,  3, SILPH_CO_7F, 5

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_READ, SilphCo11FSign
	bg_event  6, 13, BGEVENT_READ, SilphCoChiefsOfficeSign

	def_object_events
	object_event  7,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerGentlemanSylvain, -1
	object_event  3, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistTravis, -1
	object_event  8,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilphCo11FBeautyScript, -1
