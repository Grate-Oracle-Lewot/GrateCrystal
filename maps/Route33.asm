	object_const_def
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE
	const ROUTE33_BEAUTY

Route33_MapScripts:
	def_scene_scripts

	def_callbacks

Route33LassScript:
	jumptextfaceplayer Route33LassText

TrainerHikerAnthony:
	trainer HIKER, ANTHONY1, EVENT_BEAT_HIKER_ANTHONY, HikerAnthonySeenText, HikerAnthonyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_ANTHONY
	opentext
	checkflag ENGINE_ANTHONY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_HIKER_ANTHONY
	iftrue .NumberAccepted
	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext HikerAnthonyAfterText
	promptbutton
	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForPhoneNumber

.AskAgain:
	scall .AskNumber2
.AskForPhoneNumber:
	askforphonenumber PHONE_HIKER_ANTHONY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY1
	scall .RegisteredNumber
.NumberAccepted:
	jumpstd NumberAcceptedMScript

.Rematch:
	scall .RematchStd
	winlosstext HikerAnthonyBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer HIKER, ANTHONY1
	sjump .Done

.LoadFight1:
	loadtrainer HIKER, ANTHONY2
	sjump .Done

.LoadFight2:
	loadtrainer HIKER, ANTHONY3
	sjump .Done

.LoadFight3:
	loadtrainer HIKER, ANTHONY4
	sjump .Done

.LoadFight4:
	loadtrainer HIKER, ANTHONY5
.Done:
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ANTHONY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript

.AskNumber2:
	jumpstd AskNumber2MScript

.RegisteredNumber:
	jumpstd RegisteredNumberMScript

.NumberDeclined:
	jumpstd NumberDeclinedMScript

.PhoneFull:
	jumpstd PhoneFullMScript

.RematchStd:
	jumpstd RematchMScript

TrainerBeautyBrenda:
	trainer BEAUTY, BRENDA, EVENT_BEAT_BEAUTY_BRENDA, BeautyBrendaSeenText, BeautyBrendaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyBrendaAfterBattleText
	waitbutton
	closetext
	end

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

HikerAnthonySeenText:
	text "I came through the"
	line "tunnel, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthonyBeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthonyAfterText:
	text "We HIKERS are at"
	line "our best in the"
	cont "mountains."
	done

HikerAnthonyDunsparceText:
	text "Hey, did you get a"
	line "DUNSPARCE?"

	para "I caught one too."

	para "Take a look at it"
	line "in the light. It's"
	cont "got a funny face!"
	done

Route33LassText:
	text "Pant, pant…"

	para "I finally got"
	line "through that cave."

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done

Route33SignText:
	text "ROUTE 33"
	done

BeautyBrendaSeenText:
	text "Aren't these flow-"
	line "ers pretty?"
	done

BeautyBrendaBeatenText:
	text "Ooh, you have some"
	line "real power there!"
	done

BeautyBrendaAfterBattleText:
	text "AZALEA is a bit"
	line "too heavy on the"
	cont "SLOWPOKE for me."
	done

Route33_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  5, UNION_CAVE_1F, 3

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, Route33Sign

	def_object_events
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 13, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
	object_event 13, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyBrenda, -1
