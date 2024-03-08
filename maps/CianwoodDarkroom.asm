	object_const_def

CianwoodDarkroom_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodDarkroomSign:
  jumptext CianwoodDarkroomSignText

CianwoodDarkroomMachine:
  jumptext CianwoodDarkroomMachineText

CianwoodDarkroomLoreleiPhoto:
  opentext
  writetext CianwoodDarkroomLoreleiPhotoIntroText
  promptbutton
  writetext CianwoodDarkroomLoreleiPhotoNoBattleText
  waitbutton
  closetext
  end

CianwoodDarkroomAgathaPhoto:
  opentext
  writetext CianwoodDarkroomAgathaPhotoIntroText
  promptbutton
  writetext CianwoodDarkroomAgathaPhotoNoBattleText
  waitbutton
  closetext
  end

CianwoodDarkroomBrunoPhoto:
  opentext
  writetext CianwoodDarkroomBrunoPhotoIntroText
  promptbutton
  writetext CianwoodDarkroomBrunoPhotoNoBattleText
  waitbutton
  closetext
  end

CianwoodDarkroomWillPhoto:
  opentext
  writetext CianwoodDarkroomWillPhotoIntroText
  promptbutton
  writetext CianwoodDarkroomWillPhotoNoBattleText
  waitbutton
  closetext
  end

CianwoodDarkroom_PlayerMovement:
	turn_head LEFT
	step_end

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

CianwoodDarkroom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_PHOTO_STUDIO, 3

	def_coord_events

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
