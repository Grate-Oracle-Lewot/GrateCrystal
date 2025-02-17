BattleCommand_StartSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetWeatherTurns
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
