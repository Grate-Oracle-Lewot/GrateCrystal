AI_Redundant:
; Check if move effect c will fail (already established, Sleep/Snore/Dream Eater, Substitute immunities, etc.).
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves:
	dbw EFFECT_LEECH_HIT,    .LeechHit
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_ATTACK_UP,    .AttackUp
	dbw EFFECT_DEFENSE_UP,   .DefenseUp
	dbw EFFECT_SP_ATK_UP,    .SpAtkUp
	dbw EFFECT_EVASION_UP,   .EvasionUp
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_ATTACK_UP_2,  .AttackUp
	dbw EFFECT_DEFENSE_UP_2, .DefenseUp
	dbw EFFECT_SPEED_UP_2,   .SpeedUp
	dbw EFFECT_SP_ATK_UP_2,  .SpAtkUp
	dbw EFFECT_SP_DEF_UP_2,  .SpDefUp
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SNORE,        .Snore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_NIGHTMARE,    .Nightmare
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_MORNING_SUN,  .Heal
	dbw EFFECT_SYNTHESIS,    .Heal
	dbw EFFECT_MOONLIGHT,    .Heal
	dbw EFFECT_SWAGGER,      .Confuse
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	dbw EFFECT_HAIL,         .Hail
	db -1

.LeechHit:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LightScreen:
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.Confuse:
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret nz
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.Transform:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect:
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.LeechSeed:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret nz
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.Disable:
	ld a, [wPlayerDisableCount]
	and a
	ret

.Encore:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.MeanLook:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret

.Nightmare:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_NIGHTMARE, a
	ret

.Foresight:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Safeguard:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.FutureSight:
	ld a, [wEnemyFutureSightCount]
	and a
	ret

.AttackUp:
	ld a, [wEnemyAtkLevel]
	ld b, [wEnemyAttack]
	jr .Stat_Up

.DefenseUp:
	ld a, [wEnemyDefLevel]
	ld b, [wEnemyDefense]
	jr .Stat_Up

.SpeedUp:
	ld a, [wEnemySpdLevel]
	ld b, [wEnemySpeed]
	jr .Stat_Up

.SpAtkUp:
	ld a, [wEnemySAtkLevel]
	ld b, [wEnemySpAtk]
	jr .Stat_Up

.SpDefUp:
	ld a, [wEnemySDefLevel]
	ld b, [wEnemySpDef]
	; fallthrough

.Stat_Up:
	cp MAX_STAT_LEVEL
	jr nc, .Redundant
	ld a, b
	cp MAX_STAT_VALUE
	jr nc, .Redundant
	jr .NotRedundant

.EvasionUp:
	ld a, [wEnemyEvaLevel]
	cp MAX_STAT_LEVEL
	jr nc, .Redundant
	jr .NotRedundant

.Snore:
.SleepTalk:
	ld a, [wEnemyMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Sandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .Redundant
	jr .NotRedundant

.Attract:
	farcall CheckOppositeGender
	jr c, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.RainDance:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .Redundant
	jr .NotRedundant

.SunnyDay:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .Redundant
	jr .NotRedundant

.DreamEater:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .Redundant
	ld a, [wBattleMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Hail:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .Redundant
	jr .NotRedundant

.Heal:
	farcall AICheckEnemyMaxHP
	jr nc, .NotRedundant

.Redundant:
	ld a, 1
	and a
	ret

.NotRedundant:
	xor a
	ret
