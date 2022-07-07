INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evolution_moves.asm"
INCLUDE "data/pokemon/evos_attacks_pointers.asm"

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWTH
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 25, SLAM
	db 32, ACID_ARMOR
	db 39, SYNTHESIS
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWTH
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 29, SLAM
	db 38, ACID_ARMOR
	db 47, SYNTHESIS
	db 56, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWTH
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 29, SLAM
	db 41, ACID_ARMOR
	db 53, SYNTHESIS
	db 65, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 16, DRAGONBREATH
	db 19, RAGE
	db 25, SCARY_FACE
	db 31, FLAMETHROWER
	db 37, SLASH
	db 43, DRAGON_RAGE
	db 49, FIRE_SPIN
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 16, DRAGONBREATH
	db 20, RAGE
	db 27, SCARY_FACE
	db 34, FLAMETHROWER
	db 41, SLASH
	db 48, DRAGON_RAGE
	db 55, FIRE_SPIN
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 16, DRAGONBREATH
	db 20, RAGE
	db 27, SCARY_FACE
	db 34, FLAMETHROWER
	db 36, WING_ATTACK
	db 44, SLASH
	db 54, DRAGON_RAGE
	db 64, FIRE_SPIN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 18, BITE
	db 23, VITAL_THROW
	db 28, PROTECT
	db 33, RAIN_DANCE
	db 40, SKULL_BASH
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 19, BITE
	db 25, VITAL_THROW
	db 31, PROTECT
	db 37, RAIN_DANCE
	db 45, SKULL_BASH
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 19, BITE
	db 25, VITAL_THROW
	db 31, PROTECT
	db 42, RAIN_DANCE
	db 55, SKULL_BASH
	db 68, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, BIDE
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWEET_SCENT
	db 1, GUST
	db 10, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 18, SAND_ATTACK
	db 23, WHIRLWIND
	db 28, WING_ATTACK
	db 34, PSYBEAM
	db 40, SAFEGUARD
	db 45, SILVER_WIND
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, BIDE
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, TWINEEDLE
	db 10, FURY_ATTACK
	db 15, FOCUS_ENERGY
	db 20, AGILITY
	db 25, RAGE
	db 30, PURSUIT
	db 35, PIN_MISSILE
	db 40, DRILL_PECK
	db 45, HORN_DRILL
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 17, TWISTER
	db 21, WHIRLWIND
	db 29, WING_ATTACK
	db 37, AGILITY
	db 47, MIRROR_MOVE
	db 57, SILVER_WIND
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 17, TWISTER
	db 23, WHIRLWIND
	db 33, WING_ATTACK
	db 43, AGILITY
	db 55, MIRROR_MOVE
	db 60, SILVER_WIND
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 17, TWISTER
	db 23, WHIRLWIND
	db 33, WING_ATTACK
	db 46, AGILITY
	db 61, MIRROR_MOVE
	db 70, SILVER_WIND
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 13, HYPER_FANG
	db 20, FOCUS_ENERGY
	db 27, PURSUIT
	db 34, SUPER_FANG
	db 40, CRUNCH
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 10, BITE
	db 13, HYPER_FANG
	db 21, FOCUS_ENERGY
	db 30, PURSUIT
	db 40, SUPER_FANG
	db 50, CRUNCH
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 2, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 17, SWIFT
	db 20, STEEL_WING
	db 25, PURSUIT
	db 31, MIRROR_MOVE
	db 37, DRILL_PECK
	db 43, AGILITY
	db 50, SKY_ATTACK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 2, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 18, SWIFT
	db 21, STEEL_WING
	db 26, PURSUIT
	db 32, MIRROR_MOVE
	db 40, DRILL_PECK
	db 47, AGILITY
	db 59, SKY_ATTACK
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 2, LEER
	db 9, POISON_STING
	db 15, BITE
	db 23, GLARE
	db 29, SCREECH
	db 33, DIG
	db 37, ACID
	db 43, HAZE
	db 51, CRUNCH
	db 64, SLAM
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 2, LEER
	db 9, POISON_STING
	db 15, BITE
	db 25, GLARE
	db 33, SCREECH
	db 37, DIG
	db 43, ACID
	db 51, HAZE
	db 64, CRUNCH
	db 72, SLAM
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 2, TAIL_WHIP
	db 6, THUNDER_WAVE
	db 8, QUICK_ATTACK
	db 11, DOUBLE_TEAM
	db 15, SKULL_BASH
	db 20, THUNDERBOLT
	db 26, DAZZLY_GLEAM
	db 33, AGILITY
	db 41, THUNDER
	db 50, LIGHT_SCREEN
	db 59, SIGNAL_BEAM
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 6, DEFENSE_CURL
	db 11, FURY_SWIPES
	db 17, FURY_CUTTER
	db 23, SLASH
	db 30, SWIFT
	db 33, DIG
	db 37, METAL_CLAW
	db 42, SANDSTORM
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 6, DEFENSE_CURL
	db 11, FURY_SWIPES
	db 17, FURY_CUTTER
	db 24, SLASH
	db 33, SWIFT
	db 36, DIG
	db 42, METAL_CLAW
	db 47, SANDSTORM
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 8, POISON_STING
	db 12, DOUBLE_KICK
	db 17, FURY_SWIPES
	db 23, TAIL_WHIP
	db 30, BITE
	db 38, MEGA_KICK
	db 40, TOXIC
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db EVOLVE_ITEM, SUN_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 8, POISON_STING
	db 12, DOUBLE_KICK
	db 19, FURY_SWIPES
	db 27, TAIL_WHIP
	db 36, BITE
	db 46, MEGA_KICK
	db 50, TOXIC
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, POISON_STING
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 23, BODY_SLAM
	db 35, SLUDGE_BOMB
	db 46, EARTH_POWER
	db 50, BELLY_DRUM
	db 60, FISSURE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 2, LEER
	db 8, POISON_STING
	db 12, DOUBLE_KICK
	db 17, FURY_ATTACK
	db 23, FOCUS_ENERGY
	db 30, MEGA_KICK
	db 38, HORN_DRILL
	db 40, TOXIC
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db EVOLVE_ITEM, SUN_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 2, LEER
	db 8, POISON_STING
	db 12, DOUBLE_KICK
	db 19, FURY_ATTACK
	db 27, FOCUS_ENERGY
	db 36, MEGA_KICK
	db 46, HORN_DRILL
	db 50, TOXIC
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POISON_STING
	db 1, DOUBLE_KICK
	db 1, FOCUS_ENERGY
	db 23, THRASH
	db 35, MEGAHORN
	db 46, EARTHQUAKE
	db 50, BELLY_DRUM
	db 60, FISSURE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 12, FAIRY_WIND
	db 16, DOUBLESLAP
	db 19, MINIMIZE
	db 22, LIGHT_SCREEN
	db 26, METRONOME
	db 38, MOONLIGHT
	db 44, DAZZLY_GLEAM
	db 53, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, POWDER_SNOW
	db 3, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, ROAR
	db 19, CONFUSE_RAY
	db 25, SAFEGUARD
	db 29, ICY_WIND
	db 33, FLAMETHROWER
	db 37, FIRE_SPIN
	db 43, ICE_BEAM
	db 50, TRI_ATTACK
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, POWDER_SNOW
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD
	db 43, FIRE_BLAST
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 12, FAIRY_WIND
	db 16, DISABLE
	db 19, ROLLOUT
	db 24, PLAY_ROUGH
	db 29, REST
	db 34, BODY_SLAM
	db 39, DOUBLE_EDGE
	db 43, BELLY_DRUM
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, PLAY_ROUGH
	db 42, PERISH_SONG
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, SUPERSONIC
	db 6, HAZE
	db 12, BITE
	db 15, ACID
	db 19, CONFUSE_RAY
	db 23, WING_ATTACK
	db 27, SCREECH
	db 36, MEAN_LOOK
	db 42, SWAGGER
	db 46, HYPER_FANG
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, SUPERSONIC
	db 6, HAZE
	db 12, BITE
	db 15, ACID
	db 19, CONFUSE_RAY
	db 26, WING_ATTACK
	db 30, SCREECH
	db 42, MEAN_LOOK
	db 49, SWAGGER
	db 55, HYPER_FANG
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 7, SWEET_SCENT
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 23, SMOG
	db 27, MEGA_DRAIN
	db 32, MOONLIGHT
	db 37, SILVER_WIND
	db 39, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 7, SWEET_SCENT
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 24, SMOG
	db 29, MEGA_DRAIN
	db 35, MOONLIGHT
	db 42, SILVER_WIND
	db 44, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, POISONPOWDER
	db 1, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, GROWTH
	db 3, LEECH_LIFE
	db 7, STUN_SPORE
	db 13, POISONPOWDER
	db 19, FURY_CUTTER
	db 25, SPORE
	db 31, SLASH
	db 37, FLAIL
	db 43, CRABHAMMER
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, GROWTH
	db 3, LEECH_LIFE
	db 7, STUN_SPORE
	db 13, POISONPOWDER
	db 19, FURY_CUTTER
	db 28, SPORE
	db 37, SLASH
	db 46, FLAIL
	db 55, CRABHAMMER
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, FORESIGHT
	db 5, SUPERSONIC
	db 9, DISABLE
	db 17, ACID
	db 20, POISONPOWDER
	db 25, PSYBEAM
	db 28, STUN_SPORE
	db 33, SILVER_WIND
	db 36, SLEEP_POWDER
	db 41, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, FORESIGHT
	db 5, SUPERSONIC
	db 9, DISABLE
	db 17, ACID
	db 20, POISONPOWDER
	db 25, PSYBEAM
	db 28, STUN_SPORE
	db 30, GUST
	db 36, SILVER_WIND
	db 42, SLEEP_POWDER
	db 52, PSYCHIC_M
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, GROWL
	db 9, MUD_SLAP
	db 12, MAGNITUDE
	db 17, DIG
	db 25, SAND_ATTACK
	db 28, EARTH_POWER
	db 33, SLASH
	db 41, EARTHQUAKE
	db 49, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, GROWL
	db 9, MUD_SLAP
	db 12, MAGNITUDE
	db 17, DIG
	db 25, SAND_ATTACK
	db 25, TRI_ATTACK
	db 29, EARTH_POWER
	db 37, SLASH
	db 49, EARTHQUAKE
	db 61, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, FURY_SWIPES
	db 2, GROWL
	db 6, FORESIGHT
	db 11, BITE
	db 15, METAL_CLAW
	db 20, PAY_DAY
	db 28, FAINT_ATTACK
	db 35, SCREECH
	db 41, PLAY_ROUGH
	db 46, SLASH
	db 52, IRON_HEAD
	db 60, DARK_PULSE
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_SWIPES
	db 2, GROWL
	db 6, FORESIGHT
	db 11, BITE
	db 15, METAL_CLAW
	db 20, PAY_DAY
	db 29, FAINT_ATTACK
	db 38, SCREECH
	db 46, PLAY_ROUGH
	db 52, SLASH
	db 60, IRON_HEAD
	db 71, DARK_PULSE
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 3, TAIL_WHIP
	db 5, FURY_SWIPES
	db 10, DISABLE
	db 16, CONFUSION
	db 23, SCREECH
	db 31, PSYCH_UP
	db 34, AMNESIA
	db 40, FUTURE_SIGHT
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 3, TAIL_WHIP
	db 5, FURY_SWIPES
	db 10, DISABLE
	db 16, CONFUSION
	db 23, SCREECH
	db 31, PSYCH_UP
	db 32, PAY_DAY
	db 37, AMNESIA
	db 44, FUTURE_SIGHT
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, LEER
	db 9, KARATE_CHOP
	db 12, PURSUIT
	db 15, LOW_KICK
	db 19, SWAGGER
	db 21, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 33, SEISMIC_TOSS
	db 39, CROSS_CHOP
	db 45, SCREECH
	db 51, THRASH
	db 56, OUTRAGE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, LEER
	db 9, KARATE_CHOP
	db 12, PURSUIT
	db 15, LOW_KICK
	db 19, SWAGGER
	db 21, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 36, SEISMIC_TOSS
	db 45, CROSS_CHOP
	db 54, SCREECH
	db 63, THRASH
	db 69, OUTRAGE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, LICK
	db 1, GROWL
	db 4, BITE
	db 9, EMBER
	db 12, ROAR
	db 21, FLAME_WHEEL
	db 29, PLAY_ROUGH
	db 34, CRUNCH
	db 42, AGILITY
	db 50, FLAMETHROWER
	db 56, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, BITE
	db 1, PLAY_ROUGH
	db 1, FLAME_WHEEL
	db 50, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, MUD_SLAP
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 25, RAIN_DANCE
	db 31, BODY_SLAM
	db 37, BELLY_DRUM
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db EVOLVE_HAPPINESS, TR_NITE, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, MUD_SLAP
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 24, ENCORE
	db 27, RAIN_DANCE
	db 35, BODY_SLAM
	db 43, BELLY_DRUM
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, ROLLING_KICK
	db 21, SEISMIC_TOSS
	db 35, SUBMISSION
	db 42, VITAL_THROW
	db 51, MIND_READER
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_ITEM, LINK_VOUCHER, ALAKAZAM
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, KINESIS
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 51, MIND_READER
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, KINESIS
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 38, PSYCHIC_M
	db 45, REFLECT
	db 51, MIND_READER
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 3, LEER
	db 7, FOCUS_ENERGY
	db 13, LOW_KICK
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 31, VITAL_THROW
	db 37, CROSS_CHOP
	db 43, SCARY_FACE
	db 49, SUBMISSION
	db 52, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_ITEM, LINK_VOUCHER, MACHAMP
	db EVOLVE_TRADE, -1, MACHAMP
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 3, LEER
	db 7, FOCUS_ENERGY
	db 13, LOW_KICK
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 34, VITAL_THROW
	db 43, CROSS_CHOP
	db 52, SCARY_FACE
	db 61, SUBMISSION
	db 64, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 3, LEER
	db 7, FOCUS_ENERGY
	db 13, LOW_KICK
	db 19, SEISMIC_TOSS
	db 25, FORESIGHT
	db 34, VITAL_THROW
	db 43, CROSS_CHOP
	db 52, SCARY_FACE
	db 61, SUBMISSION
	db 64, DYNAMICPUNCH
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 23, ACID
	db 29, SWEET_SCENT
	db 30, RAZOR_LEAF
	db 37, SLUDGE_BOMB
	db 45, SLAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 24, ACID
	db 32, SWEET_SCENT
	db 34, RAZOR_LEAF
	db 42, SLUDGE_BOMB
	db 54, SLAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLUDGE_BOMB
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, POISON_STING
	db 6, SUPERSONIC
	db 12, WATER_GUN
	db 15, SCREECH
	db 19, ACID
	db 25, BUBBLEBEAM
	db 30, SLAM
	db 36, ACID_ARMOR
	db 43, SLUDGE_BOMB
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, POISON_STING
	db 6, SUPERSONIC
	db 12, WATER_GUN
	db 15, SCREECH
	db 19, ACID
	db 25, BUBBLEBEAM
	db 30, SLAM
	db 38, ACID_ARMOR
	db 47, SLUDGE_BOMB
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, HARDEN
	db 6, ROCK_THROW
	db 11, SPARK
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 26, DEFENSE_CURL
	db 31, ROLLOUT
	db 36, EARTHQUAKE
	db 41, ROCK_SLIDE
	db 44, IRON_HEAD
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_ITEM, LINK_VOUCHER, GOLEM
	db EVOLVE_TRADE, -1, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, HARDEN
	db 6, ROCK_THROW
	db 11, SPARK
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 27, DEFENSE_CURL
	db 34, ROLLOUT
	db 41, EARTHQUAKE
	db 48, ROCK_SLIDE
	db 52, IRON_HEAD
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, HARDEN
	db 6, ROCK_THROW
	db 11, SPARK
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 27, DEFENSE_CURL
	db 34, ROLLOUT
	db 41, EARTHQUAKE
	db 48, ROCK_SLIDE
	db 52, IRON_HEAD
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 4, GROWL
	db 8, TAIL_WHIP
	db 10, EMBER
	db 15, FLAME_WHEEL
	db 16, FAIRY_WIND
	db 19, STOMP
	db 23, FIRE_SPIN
	db 27, DAZZLY_GLEAM
	db 34, TAKE_DOWN
	db 43, AGILITY
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 4, GROWL
	db 8, TAIL_WHIP
	db 10, EMBER
	db 15, FLAME_WHEEL
	db 16, FAIRY_WIND
	db 19, STOMP
	db 23, FIRE_SPIN
	db 27, DAZZLY_GLEAM
	db 34, TAKE_DOWN
	db 40, FURY_ATTACK
	db 45, MEGAHORN
	db 47, AGILITY
	db 59, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_STAT, 37, ATK_LT_DEF, SLOWBRO
	db EVOLVE_STAT, 37, ATK_GT_DEF, SLOWKING
	db EVOLVE_STAT, 37, ATK_EQ_DEF, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, ACID
	db 29, DISABLE
	db 34, HEADBUTT
	db 43, AMNESIA
	db 48, PSYCHIC_M
	db 54, VITAL_THROW
	db 60, HYDRO_PUMP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, ACID
	db 29, DISABLE
	db 34, HEADBUTT
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 60, VITAL_THROW
	db 68, CRABHAMMER
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, SWIFT
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 23, METAL_CLAW
	db 27, LOCK_ON
	db 33, DAZZLY_GLEAM
	db 39, SCREECH
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWIFT
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 23, METAL_CLAW
	db 27, LOCK_ON
	db 29, TRI_ATTACK
	db 35, DAZZLY_GLEAM
	db 43, SCREECH
	db 53, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 3, VINE_WHIP
	db 7, SAND_ATTACK
	db 10, FURY_ATTACK
	db 13, FORESIGHT
	db 19, FURY_CUTTER
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 37, SLASH
	db 44, STEEL_WING
	db 50, SEISMIC_TOSS
	db 59, CROSS_CHOP
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 2, GROWL
	db 9, PURSUIT
	db 13, DOUBLE_KICK
	db 21, TWINEEDLE
	db 25, RAGE
	db 30, JUMP_KICK
	db 33, DRILL_PECK
	db 37, AGILITY
	db 42, THRASH
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 3, GROWL
	db 9, PURSUIT
	db 13, DOUBLE_KICK
	db 21, TWINEEDLE
	db 25, RAGE
	db 30, JUMP_KICK
	db 30, TRIPLE_KICK
	db 38, DRILL_PECK
	db 47, AGILITY
	db 51, THRASH
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 2, ENCORE
	db 5, HEADBUTT
	db 10, AURORA_BEAM
	db 16, MIST
	db 21, REST
	db 26, BUBBLEBEAM
	db 32, SKULL_BASH
	db 37, ICE_BEAM
	db 48, SAFEGUARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 2, ENCORE
	db 5, HEADBUTT
	db 10, AURORA_BEAM
	db 16, MIST
	db 21, REST
	db 26, BUBBLEBEAM
	db 32, SKULL_BASH
	db 43, ICE_BEAM
	db 60, SAFEGUARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POUND
	db 2, POISON_GAS
	db 5, HARDEN
	db 7, MUD_SLAP
	db 10, DISABLE
	db 16, SLUDGE
	db 20, BITE
	db 23, MINIMIZE
	db 31, SCREECH
	db 40, ACID_ARMOR
	db 45, CRUNCH
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 2, POISON_GAS
	db 5, HARDEN
	db 7, MUD_SLAP
	db 10, DISABLE
	db 16, SLUDGE
	db 20, BITE
	db 23, MINIMIZE
	db 31, SCREECH
	db 45, ACID_ARMOR
	db 55, CRUNCH
	db 60, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, WITHDRAW
	db 9, SUPERSONIC
	db 13, CLAMP
	db 17, AURORA_BEAM
	db 25, PAY_DAY
	db 33, IRON_HEAD
	db 37, BUBBLEBEAM
	db 41, ICE_BEAM
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKE_CANNON
	db 2, WITHDRAW
	db 9, SUPERSONIC
	db 13, CLAMP
	db 17, AURORA_BEAM
	db 25, PAY_DAY
	db 33, IRON_HEAD
	db 37, DRILL_PECK
	db 41, MEGAHORN
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 23, FAINT_ATTACK
	db 28, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, SHADOW_BALL
	db 41, DARK_PULSE
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_ITEM, LINK_VOUCHER, GENGAR
	db EVOLVE_TRADE, -1, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 25, FAINT_ATTACK
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, SHADOW_BALL
	db 53, DARK_PULSE
	db 59, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 25, FAINT_ATTACK
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, SHADOW_BALL
	db 53, DARK_PULSE
	db 59, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_ITEM, METAL_COAT, STEELIX
	db EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	db 1, BIND
	db 2, HARDEN
	db 10, RAGE
	db 14, ROCK_THROW
	db 23, SCREECH
	db 27, IRON_HEAD
	db 31, DRAGONBREATH
	db 36, ROCK_SLIDE
	db 40, IRON_TAIL
	db 45, SKULL_BASH
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, HYPNOSIS
	db 5, DISABLE
	db 8, CONFUSION
	db 17, PURSUIT
	db 25, FAINT_ATTACK
	db 31, DREAM_EATER
	db 36, MEDITATE
	db 40, PSYCHIC_M
	db 43, NIGHTMARE
	db 45, PSYCH_UP
	db 49, NIGHT_TERROR
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, HYPNOSIS
	db 5, DISABLE
	db 8, CONFUSION
	db 17, PURSUIT
	db 25, FAINT_ATTACK
	db 33, DREAM_EATER
	db 40, MEDITATE
	db 46, PSYCHIC_M
	db 50, NIGHTMARE
	db 55, PSYCH_UP
	db 60, NIGHT_TERROR
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 8, VICEGRIP
	db 12, MUD_SLAP
	db 16, HARDEN
	db 19, METAL_CLAW
	db 23, STOMP
	db 27, CRABHAMMER
	db 30, SWORDS_DANCE
	db 34, PROTECT
	db 38, SLAM
	db 41, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 8, VICEGRIP
	db 12, MUD_SLAP
	db 16, HARDEN
	db 19, METAL_CLAW
	db 23, STOMP
	db 27, CRABHAMMER
	db 32, SWORDS_DANCE
	db 38, PROTECT
	db 42, SLAM
	db 49, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 9, SCREECH
	db 13, SPARK
	db 17, SONICBOOM
	db 23, SELFDESTRUCT
	db 29, ROLLOUT
	db 33, LIGHT_SCREEN
	db 37, SWIFT
	db 39, FLAME_WHEEL
	db 41, MIRROR_COAT
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 9, SCREECH
	db 13, SPARK
	db 17, SONICBOOM
	db 23, SELFDESTRUCT
	db 29, ROLLOUT
	db 34, LIGHT_SCREEN
	db 40, SWIFT
	db 44, FLAME_WHEEL
	db 48, MIRROR_COAT
	db 60, ZAP_CANNON
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, ABSORB
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 15, MEGA_DRAIN
	db 19, CONFUSION
	db 25, SOFTBOILED
	db 31, EGG_BOMB
	db 37, GIGA_DRAIN
	db 40, PSYCHIC_M
	db 43, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, RAZOR_LEAF
	db 1, SYNTHESIS
	db 1, STOMP
	db 31, EGG_BOMB
	db 42, OUTRAGE
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 2, GROWL
	db 3, TAIL_WHIP
	db 5, BONE_CLUB
	db 9, HEADBUTT
	db 13, LEER
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 30, RAGE
	db 33, SKULL_BASH
	db 37, THRASH
	db 41, BONE_RUSH
	db 47, NIGHT_TERROR
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 2, GROWL
	db 3, TAIL_WHIP
	db 5, BONE_CLUB
	db 9, HEADBUTT
	db 13, LEER
	db 17, FOCUS_ENERGY
	db 21, BONEMERANG
	db 27, NIGHT_SHADE
	db 32, RAGE
	db 39, SKULL_BASH
	db 46, THRASH
	db 53, BONE_RUSH
	db 60, NIGHT_TERROR
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 6, MEDITATE
	db 11, LOW_KICK
	db 16, JUMP_KICK
	db 21, FOCUS_ENERGY
	db 26, HI_JUMP_KICK
	db 31, MIND_READER
	db 36, FORESIGHT
	db 41, ENDURE
	db 46, MEGA_KICK
	db 51, REVERSAL
	db 56, SUBMISSION
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, AGILITY
	db 13, PURSUIT
	db 20, MACH_PUNCH
	db 21, DIZZY_PUNCH
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, MEGA_PUNCH
	db 38, DYNAMICPUNCH
	db 44, PROTECT
	db 50, COUNTER
	db 56, CRABHAMMER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 3, WRAP
	db 7, DEFENSE_CURL
	db 13, DRAIN_KISS
	db 19, STOMP
	db 25, SEISMIC_TOSS
	db 31, DISABLE
	db 37, SLAM
	db 43, SCREECH
	db 49, BELLY_DRUM
	db 55, VITAL_THROW
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, FAIRY_WIND
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 27, ROLLOUT
	db 33, HAZE
	db 35, SLUDGE_BOMB
	db 41, SILVER_WIND
	db 45, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, FAIRY_WIND
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 27, ROLLOUT
	db 33, HAZE
	db 37, SLUDGE_BOMB
	db 44, SILVER_WIND
	db 51, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 3, TAIL_WHIP
	db 13, STOMP
	db 19, FURY_ATTACK
	db 24, ROCK_SLIDE
	db 31, SCARY_FACE
	db 37, IRON_HEAD
	db 41, TAKE_DOWN
	db 49, IRON_TAIL
	db 55, HORN_DRILL
	db 60, MEGAHORN
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 3, TAIL_WHIP
	db 13, STOMP
	db 19, FURY_ATTACK
	db 24, ROCK_SLIDE
	db 31, SCARY_FACE
	db 37, IRON_HEAD
	db 43, TAKE_DOWN
	db 54, IRON_TAIL
	db 65, HORN_DRILL
	db 72, MEGAHORN
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SWEET_KISS
	db 4, TAIL_WHIP
	db 7, CHARM
	db 10, SOFTBOILED
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 23, SING
	db 28, EGG_BOMB
	db 33, DEFENSE_CURL
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIND
	db 2, STRING_SHOT
	db 3, BUBBLE
	db 4, SLEEP_POWDER
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 19, BUBBLEBEAM
	db 25, SPIDER_WEB
	db 31, MEGA_DRAIN
	db 34, STUN_SPORE
	db 40, SLAM
	db 46, GROWTH
	db 51, GIGA_DRAIN
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, TAIL_WHIP
	db 4, MILK_DRINK
	db 7, LEER
	db 13, COMET_PUNCH
	db 16, STOMP
	db 19, LOW_KICK
	db 25, MEGA_PUNCH
	db 31, DIZZY_PUNCH
	db 34, VITAL_THROW
	db 37, ENDURE
	db 40, SKULL_BASH
	db 43, REVERSAL
	db 49, OUTRAGE
	db 57, DYNAMICPUNCH
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 3, LEER
	db 8, SMOKESCREEN
	db 15, WATER_GUN
	db 22, TWISTER
	db 29, BUBBLEBEAM
	db 32, DRAGONBREATH
	db 36, AGILITY
	db 43, HYDRO_PUMP
	db 47, RAIN_DANCE
	db 52, SLAM
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, LINK_VOUCHER, KINGDRA
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 3, LEER
	db 8, SMOKESCREEN
	db 15, WATER_GUN
	db 22, TWISTER
	db 29, BUBBLEBEAM
	db 35, DRAGONBREATH
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 60, SLAM
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 2, TAIL_WHIP
	db 4, PECK
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 38, AGILITY
	db 42, MEGAHORN
	db 49, HYDRO_PUMP
	db 52, HORN_DRILL
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 2, TAIL_WHIP
	db 4, PECK
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 41, AGILITY
	db 45, MEGAHORN
	db 53, HYDRO_PUMP
	db 61, HORN_DRILL
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 2, FORESIGHT
	db 7, WATER_GUN
	db 13, SWIFT
	db 19, RECOVER
	db 25, PSYBEAM
	db 31, BUBBLEBEAM
	db 37, MINIMIZE
	db 43, LIGHT_SCREEN
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 1, MINIMIZE
	db 37, CONFUSE_RAY
	db 42, PSYCHIC_M
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 16, MIRROR_MOVE
	db 21, DOUBLESLAP
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 31, ENCORE
	db 36, PSYBEAM
	db 41, BATON_PASS
	db 46, SAFEGUARD
	db 51, BELLY_DRUM
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_ITEM, METAL_COAT, SCIZOR
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FURY_CUTTER
	db 24, AGILITY
	db 30, WING_ATTACK
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 54, CROSS_CHOP
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 1, GROWL
	db 9, LOVELY_KISS
	db 13, POWDER_SNOW
	db 17, DRAIN_KISS
	db 21, DOUBLESLAP
	db 25, ICE_PUNCH
	db 35, MEAN_LOOK
	db 41, BODY_SLAM
	db 51, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 36, SCREECH
	db 41, LOW_KICK
	db 47, THUNDERBOLT
	db 58, THUNDER
	db 64, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 33, SUNNY_DAY
	db 37, SOFTBOILED
	db 42, FLAMETHROWER
	db 49, CONFUSE_RAY
	db 57, FIRE_BLAST
	db 64, HYPER_BEAM
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIND
	db 3, FOCUS_ENERGY
	db 7, TWINEEDLE
	db 10, VICEGRIP
	db 13, CLAMP
	db 19, SEISMIC_TOSS
	db 25, HARDEN
	db 31, CROSS_CHOP
	db 37, SWORDS_DANCE
	db 43, SUBMISSION
	db 50, GUILLOTINE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, RAGE
	db 13, HORN_ATTACK
	db 19, SCARY_FACE
	db 26, PURSUIT
	db 34, IRON_HEAD
	db 39, SKULL_BASH
	db 43, THRASH
	db 53, TAKE_DOWN
	db 60, OUTRAGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, LEER
	db 15, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, BITE
	db 25, TWISTER
	db 30, DRAGON_RAGE
	db 35, OUTRAGE
	db 40, HYDRO_PUMP
	db 45, HYPER_FANG
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 2, GROWL
	db 3, SING
	db 8, MIST
	db 11, AURORA_BEAM
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, RAIN_DANCE
	db 50, SAFEGUARD
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, GROWL
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, PLAY_ROUGH
	db 42, TAKE_DOWN
	db 51, TRI_ATTACK
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, WATER_GUN
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, AURORA_BEAM
	db 42, HAZE
	db 47, ACID_ARMOR
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, THUNDERSHOCK
	db 23, QUICK_ATTACK
	db 30, DOUBLE_KICK
	db 36, PIN_MISSILE
	db 42, THUNDER_WAVE
	db 47, AGILITY
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, EMBER
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, FLAME_WHEEL
	db 42, FLAMETHROWER
	db 47, LEER
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, UP_GRADE, PORYGON2
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CONVERSION
	db 9, MINIMIZE
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, PAY_DAY
	db 29, SIGNAL_BEAM
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, BIND
	db 2, WITHDRAW
	db 5, MUD_SLAP
	db 13, BITE
	db 19, WATER_GUN
	db 26, ROLLOUT
	db 31, LEER
	db 37, PROTECT
	db 49, ANCIENTPOWER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIND
	db 2, WITHDRAW
	db 5, MUD_SLAP
	db 13, BITE
	db 19, WATER_GUN
	db 26, ROLLOUT
	db 31, LEER
	db 37, PROTECT
	db 39, SPIKE_CANNON
	db 45, MEGAHORN
	db 54, ANCIENTPOWER
	db 65, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, HARDEN
	db 5, MUD_SLAP
	db 10, METAL_CLAW
	db 19, LEER
	db 27, FURY_CUTTER
	db 35, ENDURE
	db 39, SLASH
	db 46, CRABHAMMER
	db 55, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, HARDEN
	db 5, MUD_SLAP
	db 10, METAL_CLAW
	db 19, LEER
	db 27, FURY_CUTTER
	db 35, ENDURE
	db 39, SLASH
	db 39, CROSS_CHOP
	db 51, CRABHAMMER
	db 65, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 4, ANCIENTPOWER
	db 8, SUPERSONIC
	db 10, BITE
	db 16, AGILITY
	db 22, ROCK_SLIDE
	db 29, STEEL_WING
	db 33, CRUNCH
	db 36, SCARY_FACE
	db 43, TAKE_DOWN
	db 50, HYPER_BEAM
	db 54, SKY_ATTACK
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, LICK
	db 4, SOFTBOILED
	db 8, DEFENSE_CURL
	db 11, BITE
	db 15, AMNESIA
	db 22, BELLY_DRUM
	db 29, SKULL_BASH
	db 36, SNORE
	db 36, REST
	db 43, BODY_SLAM
	db 50, ROLLOUT
	db 57, MEGA_PUNCH
	db 61, CRUNCH
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 25, ICY_WIND
	db 37, MIND_READER
	db 49, ICE_BEAM
	db 61, REFLECT
	db 73, BLIZZARD
	db 85, AGILITY
	db 97, SILVER_WIND
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, THUNDERBOLT
	db 37, DISABLE
	db 49, DRILL_PECK
	db 61, LIGHT_SCREEN
	db 73, THUNDER
	db 85, AGILITY
	db 97, SILVER_WIND
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, SOLARBEAM
	db 37, ENDURE
	db 49, FLAMETHROWER
	db 61, SAFEGUARD
	db 73, SKY_ATTACK
	db 85, AGILITY
	db 97, SILVER_WIND
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 2, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 36, AGILITY
	db 43, SAFEGUARD
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 2, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 56, OUTRAGE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 2, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 54, WING_ATTACK
	db 61, OUTRAGE
	db 75, HYPER_BEAM
	db 88, BELLY_DRUM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 11, PSYCH_UP
	db 22, DISABLE
	db 33, AURA_SPHERE
	db 44, RECOVER
	db 55, REVERSAL
	db 66, PSYCHIC_M
	db 77, FUTURE_SIGHT
	db 88, SAFEGUARD
	db 99, KINESIS
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 10, METRONOME
	db 20, SAFEGUARD
	db 30, AURA_SPHERE
	db 40, PSYCHIC_M
	db 50, TRANSFORM
	db 60, RECOVER
	db 70, FUTURE_SIGHT
	db 80, ANCIENTPOWER
	db 90, MOONBLAST
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, POUND
	db 2, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, LIGHT_SCREEN
	db 15, SLEEP_POWDER
	db 22, SYNTHESIS
	db 29, BODY_SLAM
	db 36, EARTH_POWER
	db 39, LEECH_SEED
	db 43, SAFEGUARD
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, POUND
	db 2, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, LIGHT_SCREEN
	db 15, SLEEP_POWDER
	db 23, SYNTHESIS
	db 31, BODY_SLAM
	db 39, EARTH_POWER
	db 43, LEECH_SEED
	db 47, SAFEGUARD
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 2, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, LIGHT_SCREEN
	db 15, SLEEP_POWDER
	db 23, SYNTHESIS
	db 31, BODY_SLAM
	db 41, EARTH_POWER
	db 47, LEECH_SEED
	db 51, SAFEGUARD
	db 60, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, DEFENSE_CURL
	db 6, SMOKESCREEN
	db 12, EMBER
	db 15, FURY_SWIPES
	db 19, QUICK_ATTACK
	db 27, FLAME_WHEEL
	db 31, ROLLOUT
	db 36, SWIFT
	db 41, FLAMETHROWER
	db 46, FIRE_BLAST
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, DEFENSE_CURL
	db 6, SMOKESCREEN
	db 12, EMBER
	db 16, FURY_SWIPES
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 37, ROLLOUT
	db 42, SWIFT
	db 49, FLAMETHROWER
	db 54, FIRE_BLAST
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, DEFENSE_CURL
	db 6, SMOKESCREEN
	db 12, EMBER
	db 16, FURY_SWIPES
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 40, ROLLOUT
	db 45, SWIFT
	db 54, FLAMETHROWER
	db 60, FIRE_BLAST
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 2, TAIL_WHIP
	db 7, RAGE
	db 12, WATER_GUN
	db 17, VICEGRIP
	db 20, BITE
	db 26, SCARY_FACE
	db 30, SCREECH
	db 35, SLASH
	db 39, THRASH
	db 43, CRUNCH
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 2, TAIL_WHIP
	db 7, RAGE
	db 12, WATER_GUN
	db 17, VICEGRIP
	db 22, BITE
	db 28, SCARY_FACE
	db 32, SCREECH
	db 37, SLASH
	db 40, THRASH
	db 45, CRUNCH
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 2, TAIL_WHIP
	db 7, RAGE
	db 12, WATER_GUN
	db 17, VICEGRIP
	db 22, BITE
	db 28, SCARY_FACE
	db 33, SCREECH
	db 38, SLASH
	db 42, THRASH
	db 47, CRUNCH
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, FURY_SWIPES
	db 25, RETURN
	db 28, PLAY_ROUGH
	db 33, CHARM
	db 37, SLAM
	db 41, AMNESIA
	db 42, BATON_PASS
	db 47, MEGA_KICK
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 2, GROWL
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 18, FURY_SWIPES
	db 28, RETURN
	db 33, PLAY_ROUGH
	db 38, CHARM
	db 42, SLAM
	db 48, AMNESIA
	db 50, BATON_PASS
	db 60, MEGA_KICK
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, PECK
	db 2, GROWL
	db 6, FORESIGHT
	db 11, HYPNOSIS
	db 16, NIGHTMARE
	db 22, REFLECT
	db 28, TAKE_DOWN
	db 34, DREAM_EATER
	db 40, MOONLIGHT
	db 48, MOONBLAST
	db 54, NIGHT_TERROR
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 2, GROWL
	db 6, FORESIGHT
	db 11, HYPNOSIS
	db 16, NIGHTMARE
	db 19, MEAN_LOOK
	db 25, REFLECT
	db 33, NIGHT_SHADE
	db 41, DREAM_EATER
	db 50, MOONLIGHT
	db 57, MOONBLAST
	db 64, NIGHT_TERROR
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, SUPERSONIC
	db 8, MACH_PUNCH
	db 8, AGILITY
	db 15, MORNING_SUN
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 22, SAFEGUARD
	db 29, BATON_PASS
	db 36, SWIFT
	db 42, DIZZY_PUNCH
	db 42, FIRE_PUNCH
	db 42, ICE_PUNCH
	db 42, THUNDERPUNCH
	db 50, MEGA_PUNCH
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, SUPERSONIC
	db 8, MACH_PUNCH
	db 8, AGILITY
	db 15, MORNING_SUN
	db 24, LIGHT_SCREEN
	db 24, REFLECT
	db 24, SAFEGUARD
	db 33, BATON_PASS
	db 42, SWIFT
	db 50, DIZZY_PUNCH
	db 50, FIRE_PUNCH
	db 50, ICE_PUNCH
	db 50, THUNDERPUNCH
	db 60, MEGA_PUNCH
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, SCARY_FACE
	db 11, LEECH_LIFE
	db 17, NIGHT_SHADE
	db 23, PIN_MISSILE
	db 30, ACID
	db 37, SPIDER_WEB
	db 45, AGILITY
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, SCARY_FACE
	db 11, LEECH_LIFE
	db 17, NIGHT_SHADE
	db 25, PIN_MISSILE
	db 34, ACID
	db 43, SPIDER_WEB
	db 53, AGILITY
	db 63, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 2, SUPERSONIC
	db 6, HAZE
	db 12, BITE
	db 15, ACID
	db 19, CONFUSE_RAY
	db 26, WING_ATTACK
	db 30, SCREECH
	db 42, MEAN_LOOK
	db 49, SWAGGER
	db 55, HYPER_FANG
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, FLAIL
	db 2, THUNDER_WAVE
	db 5, SUPERSONIC
	db 13, AURORA_BEAM
	db 17, SPARK
	db 25, SIGNAL_BEAM
	db 29, CONFUSE_RAY
	db 37, DAZZLY_GLEAM
	db 41, HYDRO_PUMP
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAIL
	db 2, THUNDER_WAVE
	db 5, SUPERSONIC
	db 13, AURORA_BEAM
	db 17, SPARK
	db 25, SIGNAL_BEAM
	db 33, CONFUSE_RAY
	db 45, DAZZLY_GLEAM
	db 53, HYDRO_PUMP
	db 61, SOLARBEAM
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 2, CHARM
	db 6, THUNDER_WAVE
	db 8, SWEET_KISS
	db 11, DOUBLE_TEAM
	db 14, THUNDERBOLT
	db 20, DAZZLY_GLEAM
	db 24, AGILITY
	db 30, THUNDER
	db 36, LIGHT_SCREEN
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 12, FAIRY_WIND
	db 16, SWEET_KISS
	db 21, METRONOME
	db 30, DAZZLY_GLEAM
	db 42, MOONBLAST
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 12, FAIRY_WIND
	db 16, SWEET_KISS
	db 19, ROLLOUT
	db 23, PLAY_ROUGH
	db 27, REST
	db 32, BODY_SLAM
	db 37, DOUBLE_EDGE
	db 42, BELLY_DRUM
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, PRESENT
	db 2, CHARM
	db 3, ENCORE
	db 7, METRONOME
	db 18, DRAIN_KISS
	db 25, BATON_PASS
	db 31, SAFEGUARD
	db 38, EGG_BOMB
	db 42, MORNING_SUN
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 1, WING_ATTACK
	db 2, CHARM
	db 3, ENCORE
	db 7, METRONOME
	db 18, DRAIN_KISS
	db 25, BATON_PASS
	db 31, SAFEGUARD
	db 38, EGG_BOMB
	db 42, MORNING_SUN
	db 50, SKY_ATTACK
	db 60, SILVER_WIND
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FORESIGHT
	db 10, TELEPORT
	db 20, NIGHT_SHADE
	db 30, FUTURE_SIGHT
	db 40, CONFUSE_RAY
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FORESIGHT
	db 10, TELEPORT
	db 20, NIGHT_SHADE
	db 35, FUTURE_SIGHT
	db 50, CONFUSE_RAY
	db 65, PSYCHIC_M
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 21, COTTON_SPORE
	db 25, SIGNAL_BEAM
	db 30, LIGHT_SCREEN
	db 37, THUNDER
	db 42, SKULL_BASH
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 24, COTTON_SPORE
	db 29, SIGNAL_BEAM
	db 36, LIGHT_SCREEN
	db 45, THUNDER
	db 51, SKULL_BASH
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 2, GROWL
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 24, DRAGONBREATH
	db 29, SIGNAL_BEAM
	db 29, THUNDERPUNCH
	db 42, LIGHT_SCREEN
	db 57, THUNDER
	db 64, SKULL_BASH
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 35, EARTH_POWER
	db 45, MORNING_SUN
	db 45, MOONLIGHT
	db 50, SUNNY_DAY
	db 55, SOLARBEAM
	db 60, MOONBLAST
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, TAIL_WHIP
	db 6, DEFENSE_CURL
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 18, PLAY_ROUGH
	db 21, BUBBLEBEAM
	db 28, DOUBLE_EDGE
	db 36, RAIN_DANCE
	db 42, BELLY_DRUM
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, TAIL_WHIP
	db 6, DEFENSE_CURL
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 18, PLAY_ROUGH
	db 25, BUBBLEBEAM
	db 36, DOUBLE_EDGE
	db 48, RAIN_DANCE
	db 56, BELLY_DRUM
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, MEDITATE
	db 10, LOW_KICK
	db 19, MIRROR_MOVE
	db 28, FAINT_ATTACK
	db 37, BIDE
	db 46, ROCK_SLIDE
	db 55, MEGA_PUNCH
	db 64, VITAL_THROW
	db 73, IRON_HEAD
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, SING
	db 1, LICK
	db 5, SUPERSONIC
	db 15, SONICBOOM
	db 25, BUBBLEBEAM
	db 35, PERISH_SONG
	db 42, NIGHT_SHADE
	db 51, SWAGGER
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 2, TAIL_WHIP
	db 5, SYNTHESIS
	db 10, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, COTTON_SPORE
	db 30, MEGA_DRAIN
	db 37, GIGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, ABSORB
	db 2, TAIL_WHIP
	db 5, SYNTHESIS
	db 10, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 29, COTTON_SPORE
	db 36, MEGA_DRAIN
	db 42, GIGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 2, TAIL_WHIP
	db 5, SYNTHESIS
	db 10, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 33, COTTON_SPORE
	db 44, MEGA_DRAIN
	db 50, GIGA_DRAIN
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 1, TAIL_WHIP
	db 6, ENCORE
	db 12, BATON_PASS
	db 19, DIZZY_PUNCH
	db 27, SWIFT
	db 33, SCREECH
	db 36, AGILITY
	db 42, SEISMIC_TOSS
	db 47, MEGA_PUNCH
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, GROWTH
	db 10, MEGA_DRAIN
	db 19, SUNNY_DAY
	db 31, SYNTHESIS
	db 46, GIGA_DRAIN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWTH
	db 10, RAZOR_LEAF
	db 19, SUNNY_DAY
	db 26, FLAME_WHEEL
	db 31, PETAL_DANCE
	db 39, DAZZLY_GLEAM
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, YANMEGA
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 2, FORESIGHT
	db 6, WING_ATTACK
	db 11, DOUBLE_TEAM
	db 14, SONICBOOM
	db 17, LEECH_LIFE
	db 22, SUPERSONIC
	db 30, PURSUIT
	db 33, SILVER_WIND
	db 38, HYPNOSIS
	db 43, CRUNCH
	db 46, SCREECH
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, MUD_SLAP
	db 1, TAIL_WHIP
	db 11, LOW_KICK
	db 21, ACID_ARMOR
	db 21, AMNESIA
	db 31, EARTH_POWER
	db 41, SLAM
	db 51, MIST
	db 51, HAZE
	db 61, VITAL_THROW
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, MUD_SLAP
	db 1, TAIL_WHIP
	db 11, LOW_KICK
	db 23, ACID_ARMOR
	db 23, AMNESIA
	db 35, EARTH_POWER
	db 47, SLAM
	db 59, MIST
	db 59, HAZE
	db 71, VITAL_THROW
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, CONFUSION
	db 23, QUICK_ATTACK
	db 30, SWIFT
	db 36, PSYBEAM
	db 42, PSYCH_UP
	db 47, PSYCHIC_M
	db 52, MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, PURSUIT
	db 23, QUICK_ATTACK
	db 30, CONFUSE_RAY
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 47, DARK_PULSE
	db 52, MOONLIGHT
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, SAND_ATTACK
	db 11, PURSUIT
	db 16, HAZE
	db 21, WING_ATTACK
	db 26, NIGHT_SHADE
	db 31, FAINT_ATTACK
	db 36, SHADOW_BALL
	db 41, MEAN_LOOK
	db 46, DESTINY_BOND
	db 51, PERISH_SONG
	db 56, DARK_PULSE
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 10, WATER_GUN
	db 15, CONFUSION
	db 20, ACID
	db 29, DISABLE
	db 34, IRON_HEAD
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 60, VITAL_THROW
	db 68, CRABHAMMER
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 2, GROWL
	db 6, SPITE
	db 6, BITE
	db 12, CONFUSE_RAY
	db 19, MEAN_LOOK
	db 27, PSYBEAM
	db 36, SUPER_FANG
	db 41, SHADOW_BALL
	db 46, PERISH_SONG
	db 54, NIGHT_TERROR
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 2, SUBSTITUTE
	db 3, BEAT_UP
	db 4, HIDDEN_POWER
	db 5, HYPNOSIS
	db 6, BARRIER
	db 11, DISABLE
	db 17, FOCUS_ENERGY
	db 21, SONICBOOM
	db 26, PSYWAVE
	db 33, PSYCH_UP
	db 37, MIND_READER
	db 42, FUTURE_SIGHT
	db 51, MINIMIZE
	db 55, DESTINY_BOND
	db 64, METRONOME
	db 84, SKY_ATTACK
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, DESTINY_BOND
	db 1, SAFEGUARD
	db 1, MIRROR_COAT
	db 1, COUNTER
	db 50, BIDE
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 2, GROWL
	db 4, SPITE
	db 6, LICK
	db 11, STOMP
	db 22, NIGHT_SHADE
	db 33, SKULL_BASH
	db 44, PSYBEAM
	db 55, CRUNCH
	db 66, NIGHT_TERROR
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 2, PROTECT
	db 4, LEECH_SEED
	db 9, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, TWISTER
	db 29, BIDE
	db 36, IRON_HEAD
	db 43, SPIKES
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 2, PROTECT
	db 4, LEECH_SEED
	db 9, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, TWISTER
	db 29, BIDE
	db 39, IRON_HEAD
	db 49, SPIKES
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, DEFENSE_CURL
	db 4, MUD_SLAP
	db 8, ROLLOUT
	db 13, TWISTER
	db 18, SPITE
	db 21, PURSUIT
	db 26, PLAY_ROUGH
	db 30, SCREECH
	db 32, BODY_SLAM
	db 38, DRILL_PECK
	db 44, DOUBLE_EDGE
	db 53, MOONBLAST
	db 64, HORN_DRILL
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, WING_ATTACK
	db 6, SAND_ATTACK
	db 13, HARDEN
	db 16, FURY_CUTTER
	db 20, QUICK_ATTACK
	db 28, FAINT_ATTACK
	db 32, SEISMIC_TOSS
	db 36, SLASH
	db 44, SCREECH
	db 50, SWORDS_DANCE
	db 52, GUILLOTINE
	db 64, CRABHAMMER
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, BIND
	db 2, HARDEN
	db 10, RAGE
	db 14, ROCK_THROW
	db 23, SCREECH
	db 27, IRON_HEAD
	db 31, DAZZLY_GLEAM
	db 36, ROCK_SLIDE
	db 40, IRON_TAIL
	db 49, SKULL_BASH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, TAIL_WHIP
	db 4, LICK
	db 7, CHARM
	db 10, BITE
	db 13, SCARY_FACE
	db 19, DRAIN_KISS
	db 26, ROAR
	db 34, HYPER_FANG
	db 43, PLAY_ROUGH
	db 50, CRUNCH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 2, TAIL_WHIP
	db 4, LICK
	db 7, CHARM
	db 10, BITE
	db 13, SCARY_FACE
	db 20, DRAIN_KISS
	db 28, ROAR
	db 38, HYPER_FANG
	db 51, PLAY_ROUGH
	db 60, CRUNCH
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 5, WATER_GUN
	db 10, HARDEN
	db 10, MINIMIZE
	db 19, FLAME_WHEEL
	db 28, PIN_MISSILE
	db 37, TAKE_DOWN
	db 46, HYDRO_PUMP
	db 55, SELFDESTRUCT
	db 64, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, METAL_CLAW
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FURY_CUTTER
	db 24, AGILITY
	db 30, WING_ATTACK
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 54, CROSS_CHOP
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, WITHDRAW
	db 2, BIND
	db 9, LEECH_LIFE
	db 14, ROLLOUT
	db 23, SAFEGUARD
	db 28, BIDE
	db 37, REST
	db 42, SPIDER_WEB
	db 64, ACID_ARMOR
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 1, LEER
	db 5, FURY_ATTACK
	db 10, ENDURE
	db 15, HORN_ATTACK
	db 20, COUNTER
	db 25, TAKE_DOWN
	db 30, VITAL_THROW
	db 35, SWORDS_DANCE
	db 45, REVERSAL
	db 50, MEGAHORN
	db 55, SKULL_BASH
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_SWIPES
	db 2, LEER
	db 9, QUICK_ATTACK
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 33, METAL_CLAW
	db 37, ICY_WIND
	db 41, AGILITY
	db 49, SLASH
	db 57, BEAT_UP
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, LICK
	db 2, SWEET_SCENT
	db 3, LEER
	db 8, FURY_SWIPES
	db 15, BELLY_DRUM
	db 22, PLAY_ROUGH
	db 29, REST
	db 29, SNORE
	db 36, SLASH
	db 43, CRUNCH
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 2, SWEET_SCENT
	db 3, LEER
	db 8, FURY_SWIPES
	db 15, BELLY_DRUM
	db 22, PLAY_ROUGH
	db 29, REST
	db 29, SNORE
	db 39, SLASH
	db 49, CRUNCH
	db 59, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, SMOG
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 43, ROCK_SLIDE
	db 50, BODY_SLAM
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, SMOG
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 37, ROLLOUT
	db 48, ROCK_SLIDE
	db 60, BODY_SLAM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, MUD_SLAP
	db 5, POWDER_SNOW
	db 10, ENDURE
	db 15, FLAIL
	db 19, TAKE_DOWN
	db 28, MIST
	db 37, EARTHQUAKE
	db 46, BLIZZARD
	db 55, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 3, MUD_SLAP
	db 5, POWDER_SNOW
	db 10, ENDURE
	db 15, FLAIL
	db 19, TAKE_DOWN
	db 28, MIST
	db 32, FURY_ATTACK
	db 42, EARTHQUAKE
	db 56, BLIZZARD
	db 70, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWTH
	db 7, HARDEN
	db 13, BUBBLE
	db 19, RECOVER
	db 25, BUBBLEBEAM
	db 31, SPIKE_CANNON
	db 37, MIRROR_COAT
	db 42, ANCIENTPOWER
	db 50, CRABHAMMER
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, FOCUS_ENERGY
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 22, SIGNAL_BEAM
	db 33, LOCK_ON
	db 44, ICE_BEAM
	db 44, SOLARBEAM
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, FOCUS_ENERGY
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 22, SIGNAL_BEAM
	db 24, OCTAZOOKA
	db 38, LOCK_ON
	db 54, ICE_BEAM
	db 54, SOLARBEAM
	db 70, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 1, MILK_DRINK
	db 1, SUBSTITUTE
	db 1, BATON_PASS
	db 10, PAY_DAY
	db 20, ROCK_THROW
	db 30, EGG_BOMB
	db 40, SPIKES
	db 50, HEAL_BELL
	db 60, BONE_RUSH
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 2, TACKLE
	db 10, SUPERSONIC
	db 18, BUBBLEBEAM
	db 25, TAKE_DOWN
	db 32, AGILITY
	db 40, WING_ATTACK
	db 44, STEEL_WING
	db 49, CONFUSE_RAY
	db 56, HYDRO_PUMP
	db 64, SKY_ATTACK
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 2, LEER
	db 7, METAL_CLAW
	db 13, SAND_ATTACK
	db 16, SWIFT
	db 20, AGILITY
	db 26, STEEL_WING
	db 37, DRILL_PECK
	db 42, DAZZLY_GLEAM
	db 49, SPIKES
	db 58, SKY_ATTACK
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LICK
	db 2, LEER
	db 4, EMBER
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 25, BEAT_UP
	db 28, FAINT_ATTACK
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 2, LEER
	db 4, EMBER
	db 7, ROAR
	db 13, SMOG
	db 20, BITE
	db 26, BEAT_UP
	db 30, FAINT_ATTACK
	db 41, FLAMETHROWER
	db 52, CRUNCH
	db 60, FIRE_BLAST
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 3, LEER
	db 8, SMOKESCREEN
	db 15, WATER_GUN
	db 22, TWISTER
	db 29, BUBBLEBEAM
	db 35, DRAGONBREATH
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 64, SLAM
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 2, GROWL
	db 5, DEFENSE_CURL
	db 9, STOMP
	db 17, FLAIL
	db 24, BODY_SLAM
	db 33, ROLLOUT
	db 41, ENDURE
	db 49, EARTHQUAKE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 2, GROWL
	db 5, DEFENSE_CURL
	db 9, STOMP
	db 17, FLAIL
	db 24, BODY_SLAM
	db 24, HORN_ATTACK
	db 25, FURY_ATTACK
	db 33, ROLLOUT
	db 41, ENDURE
	db 49, EARTHQUAKE
	db 64, MEGAHORN
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CONVERSION
	db 1, CONVERSION2
	db 9, MINIMIZE
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, PAY_DAY
	db 29, SIGNAL_BEAM
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 2, LEER
	db 4, PSYWAVE
	db 8, DOUBLE_KICK
	db 15, HYPNOSIS
	db 15, NIGHTMARE
	db 23, STOMP
	db 27, SIGNAL_BEAM
	db 31, CONFUSE_RAY
	db 36, JUMP_KICK
	db 40, TAKE_DOWN
	db 49, MOONBLAST
	db 55, SKULL_BASH
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 10, SKETCH
	db 20, SKETCH
	db 30, SKETCH
	db 40, SKETCH
	db 50, SKETCH
	db 60, SKETCH
	db 70, SKETCH
	db 80, SKETCH
	db 90, SKETCH
	db 100, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, MEDITATE
	db 30, BELLY_DRUM
	db 50, VITAL_THROW
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAPID_SPIN
	db 7, WHIRLWIND
	db 10, TWISTER
	db 13, DOUBLESLAP
	db 19, ROLLING_KICK
	db 20, TRIPLE_KICK
	db 25, DRILL_PECK
	db 31, COUNTER
	db 37, AGILITY
	db 43, PROTECT
	db 49, SKULL_BASH
	db 54, HORN_DRILL
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_HAPPINESS, TR_NITE, JYNX
	db 0 ; no more evolutions
	db 1, LICK
	db 1, GROWL
	db 9, SWEET_KISS
	db 13, POWDER_SNOW
	db 17, DRAIN_KISS
	db 21, DOUBLESLAP
	db 25, CONFUSION
	db 33, CHARM
	db 37, PLAY_ROUGH
	db 45, SING
	db 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 33, SCREECH
	db 37, LOW_KICK
	db 41, THUNDERBOLT
	db 49, THUNDER
	db 54, MEGA_KICK
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_MORNDAY, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 54, MEGA_PUNCH
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 22, HEADBUTT
	db 28, BIDE
	db 34, ROLLOUT
	db 43, BODY_SLAM
	db 48, PLAY_ROUGH
	db 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SWEET_KISS
	db 5, TAIL_WHIP
	db 9, CHARM
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 29, SING
	db 35, EGG_BOMB
	db 41, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, EXTREMESPEED
	db 11, THUNDERSHOCK
	db 21, ROAR
	db 31, QUICK_ATTACK
	db 41, SPARK
	db 51, REFLECT
	db 61, CRUNCH
	db 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, EXTREMESPEED
	db 11, EMBER
	db 21, ROAR
	db 31, FIRE_SPIN
	db 41, STOMP
	db 51, FLAMETHROWER
	db 61, SWAGGER
	db 71, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, EXTREMESPEED
	db 11, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 31, GUST
	db 41, AURORA_BEAM
	db 51, MIST
	db 61, MIRROR_COAT
	db 71, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 2, LEER
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 36, SCARY_FACE
	db 43, CRUNCH
	db 50, EARTHQUAKE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 2, LEER
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 56, EARTHQUAKE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 2, LEER
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 61, EARTHQUAKE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TWISTER
	db 11, SAFEGUARD
	db 22, AEROBLAST
	db 33, ANCIENTPOWER
	db 44, HYDRO_PUMP
	db 55, SWIFT
	db 66, RECOVER
	db 77, HAIL
	db 88, MOONBLAST
	db 99, OUTRAGE
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, TWISTER
	db 11, SAFEGUARD
	db 22, SACRED_FIRE
	db 33, ANCIENTPOWER
	db 44, FIRE_BLAST
	db 55, SWIFT
	db 66, RECOVER
	db 77, SUNNY_DAY
	db 88, SOLARBEAM
	db 99, OUTRAGE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 20, ANCIENTPOWER
	db 30, FUTURE_SIGHT
	db 40, BATON_PASS
	db 50, EARTH_POWER
	db 60, DAZZLY_GLEAM
	db 70, PSYCHIC_M
	db 80, PETAL_DANCE
	db 90, MINIMIZE
	db 0 ; no more level-up moves

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 2, FORESIGHT
	db 6, WING_ATTACK
	db 11, DOUBLE_TEAM
	db 14, SONICBOOM
	db 17, LEECH_LIFE
	db 22, SUPERSONIC
	db 30, PURSUIT
	db 33, ANCIENTPOWER
	db 38, HYPNOSIS
	db 43, CRUNCH
	db 46, SCREECH
	db 0 ; no more level-up moves

WhimsicottEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 3, FAIRY_WIND
	db 6, STUN_SPORE
	db 12, RAZOR_LEAF
	db 15, MEGA_DRAIN
	db 18, GROWTH
	db 21, POISONPOWDER
	db 24, GIGA_DRAIN
	db 27, CHARM
	db 30, LEECH_SEED
	db 33, COTTON_SPORE
	db 39, SUNNY_DAY
	db 42, PLAY_ROUGH
	db 48, SOLARBEAM
	db 0 ; no more level-up moves
