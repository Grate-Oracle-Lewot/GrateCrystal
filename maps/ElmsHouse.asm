	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	opentext
	writetext ElmsHousePCText
	promptbutton
	closetext
	refreshscreen
	pokepic MUK
	waitbutton
	closepokepic
	opentext
	writetext ElmsHouseMukMemeText
	promptbutton
	closetext
	refreshscreen
	trainerpic AEROBONES
	waitbutton
	closepokepic
	opentext
	writetext ElmsHouseMeowthMemeText
	promptbutton
	closetext
	refreshscreen
	pokepic LICKITUNG
	waitbutton
	closepokepic
	opentext
	writetext ElmsHouseLickitungMemeText
	promptbutton
	closetext
	refreshscreen
	pokepic SMEARGLE
	waitbutton
	closepokepic
	opentext
	writetext ElmsHouseSmeargleMemeText
	promptbutton
	closetext
	refreshscreen
	pokepic WOOPER
	waitbutton
	closepokepic
	opentext
	writetext ElmsHouseWooperMemeText
	waitbutton
	closetext
	end

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Hi, <PLAY_G>! My"
	line "husband's always"

	para "so busy--I hope"
	line "he's OK."

	para "When he's caught"
	line "up in his #MON"

	para "research, he even"
	line "forgets to eat."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my dad!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	done

ElmsHousePCText:
	text "It's PROF.ELM's"
	line "meme collection."
	done

ElmsHouseMukMemeText:
	text "get muk'd"
	done

ElmsHouseMeowthMemeText:
	text "i can has"
	line "leftovers?"
	done

ElmsHouseLickitungMemeText:
	text "do u even lick bro"
	done

ElmsHouseSmeargleMemeText:
	text "draw me like 1 of"
	line "ur kalos girls"
	done

ElmsHouseWooperMemeText:
	text "w00p"
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
