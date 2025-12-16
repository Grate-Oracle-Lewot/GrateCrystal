	object_const_def
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL
	const ROUTE26_BEAUTY1
	const ROUTE26_BEAUTY2
	const ROUTE26_BEAUTY3
	const ROUTE26_BEAUTY4

Route26_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
Route26_EndText:
	waitbutton
	closetext
	end

TrainerCooltrainermGaven:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGavenSeenText, CooltrainermGavenBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftrue .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN1
	scall .RegisteredNumber
.NumberAccepted:
	jumpstd NumberAcceptedMScript

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGavenBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERM, GAVEN1
	sjump .Done

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN2
	sjump .Done

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN3
.Done:
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
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

.Rematch:
	jumpstd RematchMScript

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	sjump Route26_EndText

TrainerCooltrainerfBeth:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBethSeenText, CooltrainerfBethBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftrue .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall .RegisteredNumber
.NumberAccepted:
	jumpstd NumberAcceptedFScript

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBethBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, BETH1
	sjump .Done

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	sjump .Done

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
.Done:
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript

.AskNumber2:
	jumpstd AskNumber2FScript

.RegisteredNumber:
	jumpstd RegisteredNumberFScript

.NumberDeclined:
	jumpstd NumberDeclinedFScript

.PhoneFull:
	jumpstd PhoneFullFScript

.Rematch:
	jumpstd RematchFScript

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	sjump Route26_EndText

TrainerFisherScott:
	trainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherScottAfterBattleText
	sjump Route26_EndText

TrainerBeautyJulie:
	trainer BEAUTY, JULIE, EVENT_BEAT_BEAUTY_JULIE, BeautyJulieSeenText, BeautyJulieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyJulieAfterBattleText
	sjump Route26_EndText

TrainerBeautyTheresa:
	trainer BEAUTY, THERESA, EVENT_BEAT_BEAUTY_THERESA, BeautyTheresaSeenText, BeautyTheresaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyTheresaAfterBattleText
	sjump Route26_EndText

TrainerBeautyJaclyn:
	trainer BEAUTY, JACLYN, EVENT_BEAT_BEAUTY_JACLYN, BeautyJaclynSeenText, BeautyJaclynBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyJaclynAfterBattleText
	sjump Route26_EndText

TrainerBeautyCaroline:
	trainer BEAUTY, CAROLINE, EVENT_BEAT_BEAUTY_CAROLINE, BeautyCarolineSeenText, BeautyCarolineBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyCarolineAfterBattleText
	sjump Route26_EndText

Route26Sign:
	jumptext Route26SignText

Route26FruitTree:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball MAX_ELIXER

CooltrainermJakeSeenText:
	text "I'm making my"
	line "final preparations"

	para "for the #MON"
	line "LEAGUE."
	done

CooltrainermJakeBeatenText:
	text "I blew it!"
	done

CooltrainermJakeAfterBattleText:
	text "It's going to be"
	line "tough to win at"
	cont "the LEAGUE."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR are tougher"
	line "than GYM LEADERS."
	done

CooltrainermGavenSeenText:
	text "By experiencing"
	line "tough battles, you"
	cont "gain power."
	done

CooltrainermGavenBeatenText:
	text "Gaah! Life is even"
	line "tougher!"
	done

CooltrainermGavenAfterText:
	text "To get to #MON"
	line "LEAGUE, you have"

	para "to get through"
	line "VICTORY ROAD."

	para "But VICTORY ROAD"
	line "is tough."

	para "It's full of natu-"
	line "ral SANDSTORMS!"
	done

CooltrainerfJoyceSeenText:
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done

CooltrainerfJoyceBeatenText:
	text "No! I don't"
	line "believe this!"
	done

CooltrainerfJoyceAfterBattleText:
	text "I've defeated"
	line "eight GYM LEADERS,"

	para "so I was feeling"
	line "confident."

	para "I'll have to try"
	line "harder next time."
	done

CooltrainerfBethSeenText:
	text "I lost to a train-"
	line "er named <RIVAL>."

	para "He was really"
	line "strong, but…"

	para "It was as if he"
	line "just spewed words"
	cont "at random."

	para "I felt sorry for"
	line "his #MON."
	done

CooltrainerfBethBeatenText:
	text "#MON aren't"
	line "tools of war."
	done

CooltrainerfBethAfterText:
	text "#MON are in-"
	line "valuable, lifelong"
	cont "partners."
	done

PsychicRichardSeenText:
	text "Wow, look at all"
	line "those BADGES!"
	cont "I'm impressed."

	para "But you're not"
	line "satisfied by just"

	para "collecting them,"
	line "right?"
	done

PsychicRichardBeatenText:
	text "Good battle!"
	done

PsychicRichardAfterBattleText:
	text "People and #MON"
	line "grow from their"
	cont "experiences."

	para "Don't get lazy and"
	line "complacent."
	done

FisherScottSeenText:
	text "I'm feeling great"
	line "today!"

	para "I feel like I"
	line "could boot even"
	cont "the LEAGUE CHAMP!"
	done

FisherScottBeatenText:
	text "No! Not in this"
	line "battle!"
	done

FisherScottAfterBattleText:
	text "Just like in fish-"
	line "ing, it's all over"

	para "in #MON if you"
	line "give up."
	done

BeautyJulieSeenText:
	text "You've heard of"
	line "the ELITE FOUR,"

	para "but now you must"
	line "face us--the"
	cont "PETITE FOUR!"
	done

BeautyJulieBeatenText:
	text "You're amazing!"
	done

BeautyJulieAfterBattleText:
	text "We're not an offi-"
	line "cial league, but"
	cont "we have fun."
	done

BeautyTheresaSeenText:
	text "I'm the second"
	line "PETITE FOUR"
	cont "member. Come on!"
	done

BeautyTheresaBeatenText:
	text "You're incredible!"
	done

BeautyTheresaAfterBattleText:
	text "You're the first"
	line "one to actually"
	cont "challenge us."
	done

BeautyJaclynSeenText:
	text "I'm known as the"
	line "scariest member of"
	cont "the PETITE FOUR…"
	done

BeautyJaclynBeatenText:
	text "You're awesome!"
	done

BeautyJaclynAfterBattleText:
	text "I know, we're not"
	line "very scary."
	done

BeautyCarolineSeenText:
	text "I'm the final"
	line "challenge of the"
	cont "PETITE FOUR."

	para "Think you have"
	line "what it takes?"

	para "Let's find out!"
	done

BeautyCarolineBeatenText:
	text "You're the"
	line "BEEDRILL's knees!"
	done

BeautyCarolineAfterBattleText:
	text "Care to join our"
	line "league as the"
	cont "CHAMPION?"
	done

Route26SignText:
	text "ROUTE 26"

	para "#MON LEAGUE"
	line "RECEPTION GATE"
	done

Route26_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8,  6, BGEVENT_READ, Route26Sign

	def_object_events
	object_event 14, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJake, -1
	object_event  9, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainermGaven, -1
	object_event 10, 56, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth, -1
	object_event 13, 79, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerPsychicRichard, -1
	object_event 10, 92, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherScott, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FruitTree, -1
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
	object_event  1, 85, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulie, -1
	object_event  1, 86, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBeautyTheresa, -1
	object_event  1, 87, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerBeautyJaclyn, -1
	object_event  1, 88, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyCaroline, -1
