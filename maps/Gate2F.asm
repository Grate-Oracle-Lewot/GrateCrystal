	object_const_def

Gate2F_MapScripts:
	def_scene_scripts

	def_callbacks

Gate2FLeftBinocularsScript:
  jumptext Gate2FLeftBinocularsText

Gate2FRightBinocularsScript:
  checktime MORN
  iftrue .Morn
  checktime DAY
  iftrue .Day
  checktime NITE
  iftrue .Nite
  sjump Gate2FLeftBinocularsScript

.Morn:
  jumptext Gate2FRightBinocularsMorningText

.Day:
  jumptext Gate2FRightBinocularsDayText

.Nite:
  jumptext Gate2FRightBinocularsNightText

Gate2FLeftBinocularsText:
  text "I can see for"
  line "miles!"
  done

Gate2FRightBinocularsMorningText:
  text "The sunrise is"
  line "magnificent!"
  done

Gate2FRightBinocularsDayText:
  text "KANTO is bustling"
  line "during the day!"
  done

Gate2FRightBinocularsNightText:
  text "KANTO looks so"
  line "peaceful at night."
  done

Gate2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Gate2FLeftBinocularsScript
	bg_event  6,  2, BGEVENT_UP, Gate2FRightBinocularsScript

	def_object_events
