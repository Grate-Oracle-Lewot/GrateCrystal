	object_const_def
	const ROUTE28_BEAUTY
	const ROUTE28_EUSINE

Route28_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBeautyMaeve:
	trainer BEAUTY, MAEVE, EVENT_BEAT_BEAUTY_MAEVE, BeautyMaeveSeenText, BeautyMaeveBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BeautyMaeveAfterBattleText
	waitbutton
	closetext
	end

TrainerMysticalmanOlie:
	trainer MYSTICALMAN, OLIE, EVENT_BEAT_MYSTICALMAN_OLIE, MysticalmanOlieSeenText, MysticalmanOlieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MysticalmanOlieAfterBattleText
	waitbutton
	closetext
	end

Route28Sign:
	jumptext Route28SignText

Route28HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_28_HIDDEN_RARE_CANDY

BeautyMaeveSeenText:
	text "There's beauty in"
	line "power, and there's"
	cont "power in beauty."
	done

BeautyMaeveBeatenText:
	text "I didn't have"
	line "enough power."
	done

BeautyMaeveAfterBattleText:
	text "Painting is a gr-"
	line "eat way to relax."
	done

MysticalmanOlieSeenText:
	text "Behold the grace"
	line "and potency of my"
	cont "#MON!"
	done

MysticalmanOlieBeatenText:
	text "Serenity now!"
	done

MysticalmanOlieAfterBattleText:
	text "What's it take to"
	line "become a MYSTIC?"

	para "Easy! You just"
	line "have to…"

	para "…"
	line "…"

	para "Call yourself a"
	line "MYSTIC!"
	done

Route28SignText:
	text "ROUTE 28"

	para "Someone's scrawled"
	line "the word DANGER"
	cont "underneath…"
	done

Route28_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, ROUTE_28_STEEL_WING_HOUSE, 1
	warp_event 33,  5, VICTORY_ROAD_GATE, 7

	def_coord_events

	def_bg_events
	bg_event 31,  5, BGEVENT_READ, Route28Sign
	bg_event 25,  3, BGEVENT_ITEM, Route28HiddenRareCandy

	def_object_events
	object_event 16, 14, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyMaeve, -1
	object_event  4,  9, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerMysticalmanOlie, -1
