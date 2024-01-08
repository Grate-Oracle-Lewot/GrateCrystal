BattleCommand_StartSandstorm:
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox
