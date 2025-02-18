BattleCommand_StartSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetWeatherTurns
	cp 6
	jr nc, .done
	call GetUserItem
	ld a, b
	cp HELD_SUN_STONE
	jr nz, .five
	ld a, 8
	jr .done
.five
	ld a, 5
.done
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
