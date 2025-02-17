BattleCommand_StartSandstorm:
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	call GetWeatherTurns
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox
