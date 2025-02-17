BattleCommand_StartHail:
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	call GetWeatherTurns
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToHailText
	jp StdBattleTextbox
