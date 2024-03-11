	object_const_def

CianwoodDarkroom_MapScripts:
	def_scene_scripts
	scene_script .ResetGauntlet ; SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	scene_script .DummyScene1 ; SCENE_CIANWOODDARKROOM_BEGIN_GAUNTLET
	scene_script .DummyScene2 ; SCENE_CIANWOODDARKROOM_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, .DarkroomStairs

.ResetGauntlet:
	sdefer ResetGauntletScript
	end

.DummyScene1:
	end

.DummyScene2: ; unused
	end

.DarkroomStairs:
	changeblock 2, 6, $2c
	reloadmappart
	endcallback

ResetGauntletScript:
	clearevent EVENT_DARKROOM_GAUNTLET
	clearevent EVENT_DARKROOM_BEAT_LORELEI
	clearevent EVENT_DARKROOM_BEAT_AGATHA
	clearevent EVENT_DARKROOM_BEAT_BRUNO
	clearevent EVENT_DARKROOM_BEAT_WILL
	setscene SCENE_CIANWOODDARKROOM_BEGIN_GAUNTLET
	end

CianwoodDarkroomSign:
	jumptext CianwoodDarkroomSignText

CianwoodDarkroomMachine:
	jumptext CianwoodDarkroomMachineText

CianwoodDarkroomGauntletScene:
	checkevent EVENT_DARKROOM_GAUNTLET
	iftrue .End
	readvar VAR_BADGES
	ifless NUM_BADGES, .End
	changeblock 2, 6, $1
	reloadmappart
	playsound SFX_ENTER_DOOR
	waitsfx
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	setevent EVENT_DARKROOM_GAUNTLET
.End:
	setscene SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	end

CianwoodDarkroomLoreleiPhoto:
	opentext
	writetext CianwoodDarkroomLoreleiPhotoIntroText
	promptbutton
	checkevent EVENT_DARKROOM_GAUNTLET
	iftrue .CheckFought
.NoBattle:
	writetext CianwoodDarkroomLoreleiPhotoNoBattleText
	waitbutton
	closetext
	end

.CheckFought:
	checkevent EVENT_DARKROOM_BEAT_LORELEI
	iftrue .NoBattle
	writetext CianwoodDarkroomLoreleiPhotoBattleText
	waitbutton
	closetext
	winlosstext CianwoodDarkroomLoreleiPhotoWinLossText, CianwoodDarkroomLoreleiPhotoWinLossText
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_DARKROOM_BEAT_LORELEI
	checkevent EVENT_DARKROOM_BEAT_AGATHA
	iftrue .CheckBruno
	end

.CheckBruno:
	checkevent EVENT_DARKROOM_BEAT_BRUNO
	iftrue .CheckWill
	end

.CheckWill:
	checkevent EVENT_DARKROOM_BEAT_WILL
	iftrue EndGauntlet
	end

CianwoodDarkroomAgathaPhoto:
	opentext
	writetext CianwoodDarkroomAgathaPhotoIntroText
	promptbutton
	checkevent EVENT_DARKROOM_GAUNTLET
	iftrue .CheckFought
.NoBattle:
	writetext CianwoodDarkroomAgathaPhotoNoBattleText
	waitbutton
	closetext
	end

.CheckFought:
	checkevent EVENT_DARKROOM_BEAT_AGATHA
	iftrue .NoBattle
	writetext CianwoodDarkroomAgathaPhotoBattleText
	waitbutton
	closetext
	winlosstext CianwoodDarkroomAgathaPhotoWinLossText, CianwoodDarkroomAgathaPhotoWinLossText
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_DARKROOM_BEAT_AGATHA
	checkevent EVENT_DARKROOM_BEAT_LORELEI
	iftrue .CheckBruno
	end

.CheckBruno:
	checkevent EVENT_DARKROOM_BEAT_BRUNO
	iftrue .CheckWill
	end

.CheckWill:
	checkevent EVENT_DARKROOM_BEAT_WILL
	iftrue EndGauntlet
	end

CianwoodDarkroomBrunoPhoto:
	opentext
	writetext CianwoodDarkroomBrunoPhotoIntroText
	promptbutton
	checkevent EVENT_DARKROOM_GAUNTLET
	iftrue .CheckFought
.NoBattle:
	writetext CianwoodDarkroomBrunoPhotoNoBattleText
	waitbutton
	closetext
	end

.CheckFought:
	checkevent EVENT_DARKROOM_BEAT_BRUNO
	iftrue .NoBattle
	writetext CianwoodDarkroomBrunoPhotoBattleText
	waitbutton
	closetext
	winlosstext CianwoodDarkroomBrunoPhotoWinLossText, CianwoodDarkroomBrunoPhotoWinLossText
	loadtrainer REAL_BRUNO, REAL_BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_DARKROOM_BEAT_BRUNO
	checkevent EVENT_DARKROOM_BEAT_LORELEI
	iftrue .CheckAgatha
	end

.CheckAgatha:
	checkevent EVENT_DARKROOM_BEAT_AGATHA
	iftrue .CheckWill
	end

.CheckWill:
	checkevent EVENT_DARKROOM_BEAT_WILL
	iftrue EndGauntlet
	end

CianwoodDarkroomWillPhoto:
	opentext
	writetext CianwoodDarkroomWillPhotoIntroText
	promptbutton
	checkevent EVENT_DARKROOM_GAUNTLET
	iftrue .CheckFought
.NoBattle:
	writetext CianwoodDarkroomWillPhotoNoBattleText
	waitbutton
	closetext
	end

.CheckFought:
	checkevent EVENT_DARKROOM_BEAT_WILL
	iftrue .NoBattle
	writetext CianwoodDarkroomWillPhotoBattleText
	waitbutton
	closetext
	winlosstext CianwoodDarkroomWillPhotoWinLossText, CianwoodDarkroomWillPhotoWinLossText
	loadtrainer REAL_WILL, REAL_WILL1
	startbattle
	reloadmapafterbattle
	setevent EVENT_DARKROOM_BEAT_WILL
	checkevent EVENT_DARKROOM_BEAT_LORELEI
	iftrue .CheckAgatha
	end

.CheckAgatha:
	checkevent EVENT_DARKROOM_BEAT_AGATHA
	iftrue .CheckBruno
	end

.CheckBruno:
	checkevent EVENT_DARKROOM_BEAT_BRUNO
	iftrue EndGauntlet
	end

EndGauntlet:
	pause 10
	special FadeOutPalettes
	playsound SFX_WARP_TO
	waitsfx
	setscene SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	warp CIANWOOD_PHOTO_STUDIO, 1, 2
	end

CianwoodDarkroomSignText:
	text "PLEASE ASK FOR"
	line "ASSISTANCE WITH"
	cont "DEVELOPING PHOTOS"
	done

CianwoodDarkroomMachineText:
	text "It's some kind of"
	line "photo development"
	cont "equipment."
	done

CianwoodDarkroomLoreleiPhotoIntroText:
	text "It's a photo of"
	line "LORELEI, a former"

	para "member of the"
	line "ELITE FOUR."
	done

CianwoodDarkroomLoreleiPhotoNoBattleText:
	text "She's sitting on"
	line "the back of a"
	cont "LAPRAS at sea."
	done

CianwoodDarkroomLoreleiPhotoBattleText:
	text "…"

	para "You feel a sudden"
	line "chill…"
	done

CianwoodDarkroomLoreleiPhotoWinLossText:
	text "The LORELEI"
	line "illusion faded!"
	done

CianwoodDarkroomAgathaPhotoIntroText:
	text "It's a photo of"
	line "AGATHA, a former"

	para "member of the"
	line "ELITE FOUR."
	done

CianwoodDarkroomAgathaPhotoNoBattleText:
	text "Is that PROF.OAK"
	line "in the background?"
	done

CianwoodDarkroomAgathaPhotoBattleText:
	text "…"

	para "You feel a ghostly"
	line "presence…"
	done

CianwoodDarkroomAgathaPhotoWinLossText:
	text "The AGATHA"
	line "illusion faded!"
	done

CianwoodDarkroomBrunoPhotoIntroText:
	text "It's a photo of"
	line "BRUNO, a former"

	para "member of the"
	line "ELITE FOUR."
	done

CianwoodDarkroomBrunoPhotoNoBattleText:
	text "He's sparring with"
	line "a MACHAMP!"
	done

CianwoodDarkroomBrunoPhotoBattleText:
	text "…"

	para "You feel a strong"
	line "fighting spirit!"
	done

CianwoodDarkroomBrunoPhotoWinLossText:
	text "The BRUNO illusion"
	line "faded away!"
	done

CianwoodDarkroomWillPhotoIntroText:
	text "It's a photo of"
	line "WILL, a former"

	para "member of the"
	line "ELITE FOUR."
	done

CianwoodDarkroomWillPhotoNoBattleText:
	text "He's meditating"
	line "with a XATU on top"
	cont "of a mountain."
	done

CianwoodDarkroomWillPhotoBattleText:
	text "…"

	para "You feel a strong"
	line "mental presence…"
	done

CianwoodDarkroomWillPhotoWinLossText:
	text "The WILL illusion"
	line "faded away!"
	done

CianwoodDarkroom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_PHOTO_STUDIO, 3

	def_coord_events
	coord_event  5,  7, SCENE_CIANWOODDARKROOM_BEGIN_GAUNTLET, CianwoodDarkroomGauntletScene

	def_bg_events
	bg_event  0,  3, BGEVENT_READ, CianwoodDarkroomSign
	bg_event  0,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  1,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  2,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  3,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  4,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  5,  8, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  4,  9, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  5,  9, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  8,  4, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  8,  5, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  8,  6, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  8,  7, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  9,  9, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event 10,  9, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event 11,  4, BGEVENT_READ, CianwoodDarkroomMachine
	bg_event  2,  0, BGEVENT_READ, CianwoodDarkroomLoreleiPhoto
	bg_event  4,  0, BGEVENT_READ, CianwoodDarkroomAgathaPhoto
	bg_event  6,  0, BGEVENT_READ, CianwoodDarkroomBrunoPhoto
	bg_event  8,  0, BGEVENT_READ, CianwoodDarkroomWillPhoto

	def_object_events
