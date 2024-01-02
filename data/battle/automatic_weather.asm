; AutomaticWeatherEffects indexes
	const_def 1
	const AUTOMATIC_SUN
	const AUTOMATIC_RAIN
	const AUTOMATIC_SANDSTORM
	const AUTOMATIC_HAIL

AutomaticWeatherMaps:
auto_weather_map: MACRO
	map_id \1 ; map
	db \2 ; AUTOMATIC_* weather index
ENDM
	auto_weather_map NATIONAL_PARK, AUTOMATIC_SUN
	auto_weather_map NATIONAL_PARK_BUG_CONTEST, AUTOMATIC_SUN
	auto_weather_map SEAFOAM_GYM, AUTOMATIC_SUN
	auto_weather_map TIN_TOWER_ROOF, AUTOMATIC_SUN
	auto_weather_map SLOWPOKE_WELL_B1F, AUTOMATIC_RAIN
	auto_weather_map SLOWPOKE_WELL_B2F, AUTOMATIC_RAIN
	auto_weather_map CERULEAN_GYM, AUTOMATIC_RAIN
	auto_weather_map WHIRL_ISLAND_1F, AUTOMATIC_RAIN
	auto_weather_map WHIRL_ISLAND_B1F, AUTOMATIC_RAIN
	auto_weather_map WHIRL_ISLAND_B2F, AUTOMATIC_RAIN
	auto_weather_map WHIRL_ISLAND_LUGIA_CHAMBER, AUTOMATIC_HAIL
	auto_weather_map MAHOGANY_GYM, AUTOMATIC_HAIL
	auto_weather_map ICE_PATH_1F, AUTOMATIC_HAIL
	auto_weather_map ICE_PATH_B1F, AUTOMATIC_HAIL
	auto_weather_map ICE_PATH_B2F_MAHOGANY_SIDE, AUTOMATIC_HAIL
	auto_weather_map ICE_PATH_B2F_BLACKTHORN_SIDE, AUTOMATIC_HAIL
	auto_weather_map ICE_PATH_B3F, AUTOMATIC_HAIL
	auto_weather_map SILVER_CAVE_ROOM_1, AUTOMATIC_SANDSTORM
	auto_weather_map SILVER_CAVE_ROOM_2, AUTOMATIC_SANDSTORM
	auto_weather_map SILVER_CAVE_ITEM_ROOMS, AUTOMATIC_SANDSTORM
	auto_weather_map VICTORY_ROAD, AUTOMATIC_SANDSTORM
	auto_weather_map PEWTER_GYM, AUTOMATIC_SANDSTORM
	db 0 ; end

AutomaticWeatherEffects:
; entries correspond to AUTOMATIC_* constants
auto_weather_effect: MACRO
	db \1 ; battle weather
	dw \2 ; animation
	dw \3 ; text
ENDM
	auto_weather_effect WEATHER_SUN, SUNNY_DAY, SunGotBrightText
	auto_weather_effect WEATHER_RAIN, RAIN_DANCE, DownpourText
	auto_weather_effect WEATHER_SANDSTORM, ANIM_IN_SANDSTORM, SandstormBrewedText
	auto_weather_effect WEATHER_HAIL, HAIL, ItStartedToHailText
