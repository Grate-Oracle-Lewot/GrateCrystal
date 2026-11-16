BugContestantPointers:
	table_width 2, BugContestantPointers
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp
	assert_table_length NUM_BUG_CONTESTANTS + 1

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw KAKUNA,     220
	dbw METAPOD,    210
	dbw CATERPIE,   200

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw HERACROSS,  510
	dbw BUTTERFREE, 475
	dbw YANMA,      420

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw PINSIR,     515
	dbw SCYTHER,    505
	dbw BUTTERFREE, 495

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     500
	dbw BEEDRILL,   450
	dbw VENONAT,    300

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw HERACROSS,  480
	dbw SPINARAK,   260
	dbw LEDYBA,     240

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw SHUCKLE,    400
	dbw VENONAT,    310
	dbw KAKUNA,     190

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw BUTTERFREE, 380
	dbw METAPOD,    185
	dbw CATERPIE,   175

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    475
	dbw BEEDRILL,   375
	dbw METAPOD,    150

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw YANMA,      330
	dbw LEDYBA,     230
	dbw SPINARAK,   130

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw KRABBY,     275
	dbw JIRK,       225
	dbw PARAS,      185
