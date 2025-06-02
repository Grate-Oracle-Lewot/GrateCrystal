MovesDexOrder:
	table_width 1, MovesDexOrder

; Normal, physical
	db POUND
	db TACKLE
	db SCRATCH

	db RAGE
	db QUICK_ATTACK
	db EXTREMESPEED
	db RAPID_SPIN
	db BIND
	db FALSE_SWIPE
	db VICEGRIP
	db HORN_ATTACK
	db STOMP
	db HEADBUTT
	db SLASH
	db DIZZY_PUNCH
	db HYPER_FANG
	db BODY_SLAM
	db MEGA_PUNCH
	db TAKE_DOWN
	db DOUBLE_EDGE
	db THRASH
	db EGG_BOMB
	db MEGA_KICK
	db SKULL_BASH
	db SELFDESTRUCT

	db FURY_SWIPES

	db FLAIL
	db SUPER_FANG
	db RETURN

; Normal, special
	db SNORE
	db SONICBOOM
	db SWIFT
	db HYPER_BEAM

; Fighting, physical
	db ROCK_SMASH
	db MACH_PUNCH
	db KARATE_CHOP
	db LOW_KICK
	db ROLLING_KICK
	db VITAL_THROW
	db JUMP_KICK
	db HI_JUMP_KICK
	db SUBMISSION
	db DYNAMICPUNCH
	db CROSS_CHOP

	db DOUBLE_KICK
	db TRIPLE_KICK
	db COMET_PUNCH

	db SEISMIC_TOSS
	db REVERSAL

; Fighting, special
	db AURA_SPHERE

; Dark, physical
	db THIEF
	db PURSUIT
	db FAINT_ATTACK
	db BITE
	db CRUNCH

	db BEAT_UP

; Dark, special
	db DARK_PULSE

; Flying, physical
	db PECK
	db WING_ATTACK
	db FLY
	db DRILL_PECK
	db SKY_ATTACK

	db FURY_ATTACK

; Flying, special
	db GUST
	db AIR_SLASH

; Grass, physical
	db VINE_WHIP
	db RAZOR_LEAF
	db PETAL_DANCE

; Grass, special
	db ABSORB
	db MEGA_DRAIN
	db GIGA_DRAIN
	db SOLARBEAM

; Fire, physical
	db FLAME_WHEEL
	db FIRE_PUNCH
	db SACRED_FIRE

; Fire, special
	db EMBER
	db FIRE_SPIN
	db FLAMETHROWER
	db FIRE_BLAST

; Water, physical
	db CLAMP
	db WATERFALL
	db CRABHAMMER

; Water, special
	db BUBBLE
	db WATER_GUN
	db WHIRLPOOL
	db BUBBLEBEAM
	db OCTAZOOKA
	db SCALD
	db SURF
	db HYDRO_PUMP

; Electric, physical
	db SPARK
	db THUNDERPUNCH

; Electric, special
	db THUNDERSHOCK
	db THUNDERBOLT
	db ZAP_CANNON
	db THUNDER

; Rock, physical
	db ROCK_THROW
	db ROCK_SLIDE

	db ROLLOUT

; Rock, special
	db ANCIENTPOWER
	db POWER_GEM

; Ground, physical
	db DIG
	db EARTHQUAKE

	db MAGNITUDE

	db BONE_CLUB
	db BONEMERANG
	db BONE_RUSH

; Ground, special
	db MUD_SLAP
	db EARTH_POWER

; Steel, physical
	db PAY_DAY
	db METAL_CLAW
	db STEEL_WING
	db IRON_HEAD
	db IRON_TAIL

	db SPIKE_CANNON

; Steel, special
	db FLASH

; Ice, physical
	db AVALANCHE
	db ICE_PUNCH

; Ice, special
	db POWDER_SNOW
	db AURORA_BEAM
	db ICE_BEAM
	db AEROBLAST
	db BLIZZARD

; Poison, physical
	db POISON_STING
	db POISON_JAB

; Poison, special
	db SMOG
	db ACID
	db SLUDGE
	db SLUDGE_BOMB

; Psychic, physical
	db STRENGTH

; Psychic, special
	db CONFUSION
	db PSYBEAM
	db PSYCHIC_M
	db DREAM_EATER

	db FUTURE_SIGHT

; Bug, physical
	db LEECH_LIFE
	db U_TURN
	db CUT
	db MEGAHORN

	db FURY_CUTTER

	db PIN_MISSILE
	db TWINEEDLE

; Bug, special
	db SILVER_WIND
	db SIGNAL_BEAM

; Ghost, physical
	db LICK
	db SHADOW_CLAW
	db NIGHT_TERROR

; Ghost, special
	db SHADOW_BALL

	db NIGHT_SHADE

; Dragon, physical
	db WRAP
	db OUTRAGE
	db SLAM

; Dragon, special
	db TWISTER
	db DRAGON_RAGE
	db DRAGONBREATH
	db DRAGON_PULSE

; Fairy, physical
	db LOVELY_KISS
	db PLAY_ROUGH

	db DOUBLESLAP

	db PRESENT

; Fairy, special
	db FAIRY_WIND
	db DAZZLY_GLEAM
	db MOONBLAST

; ???-type
	db HIDDEN_POWER
	db TRI_ATTACK

; Return damage
	db COUNTER
	db MIRROR_COAT
	db BIDE

; OHKO
	db FISSURE
	db HORN_DRILL
	db GUILLOTINE

; Attack down
	db GROWL
	db CHARM

; Sp.Attack down
	db COTTON_SPORE

; Defense down
	db TAIL_WHIP
	db SCREECH

; Sp.Defense down
	db LEER
	db METAL_SOUND

; Speed down
	db STRING_SHOT
	db SCARY_FACE

; Accuracy down
	db SAND_ATTACK
	db SMOKESCREEN

; Evasion down
	db SWEET_SCENT

; Attack up
	db MEDITATE
	db SWORDS_DANCE
	db BELLY_DRUM

; Sp.Attack up
	db GROWTH
	db KINESIS

; Defense up
	db HARDEN
	db DEFENSE_CURL
	db ACID_ARMOR
	db BARRIER

; Sp.Defense up
	db AMNESIA

; Speed up
	db AGILITY
	db ROCK_POLISH

; Evasion up
	db DOUBLE_TEAM
	db MINIMIZE

; Stat-up adjacent
	db FOCUS_ENERGY

	db CURSE

	db PSYCH_UP

	db FORESIGHT

	db HAZE
	db MIST

	db REFLECT
	db LIGHT_SCREEN

; Heal
	db RECOVER
	db MILK_DRINK
	db SOFTBOILED

	db SYNTHESIS

	db REST

; Survive
	db ENDURE

	db PROTECT

; Sleep
	db SING
	db HYPNOSIS
	db SLEEP_POWDER
	db SPORE

	db NIGHTMARE

; Paralyze
	db STUN_SPORE
	db GLARE
	db THUNDER_WAVE

; Poison, Toxic
	db POISONPOWDER

	db TOXIC

; Confuse
	db SUPERSONIC
	db CONFUSE_RAY

	db SWAGGER

; Block/heal status
	db SAFEGUARD

	db HEAL_BELL

; Weather
	db RAIN_DANCE
	db SUNNY_DAY

	db SANDSTORM
	db HAIL

; Hazards
	db SPIKES

; Unique status
	db LEECH_SEED

	db ATTRACT

; Move interference
	db SPITE

	db DISABLE

	db ENCORE

; Force switch
	db ROAR
	db WHIRLWIND

; Switch w/ stat changes
	db BATON_PASS
	db TELEPORT

; Trap target
	db MEAN_LOOK
	db SPIDER_WEB

; Guarantee next hit
	db LOCK_ON
	db MIND_READER

; Conditional KO
	db DESTINY_BOND

	db PERISH_SONG

; Substitute
	db SUBSTITUTE

; User alteration
	db CONVERSION2

	db TRANSFORM

; Call another move
	db MIRROR_MOVE
	db SLEEP_TALK
	db METRONOME

; Sketch
	db SKETCH

; Struggle, end list
	db STRUGGLE ; -1
	assert_table_length NUM_ATTACKS
