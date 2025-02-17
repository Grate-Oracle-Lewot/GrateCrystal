BattleCommand_StartRain:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	call GetWeatherTurns
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox
