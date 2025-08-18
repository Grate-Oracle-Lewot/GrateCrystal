BattleCommand_StartSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, b
	cp HELD_WEATHER_BOOST
	jr nc, .eight ; HELD_SUN_STONE is the only held effect after HELD_WEATHER_BOOST
	ld a, 5
	jr .done

.eight
	ld a, 8
.done
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
