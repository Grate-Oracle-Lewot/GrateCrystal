; radio channel ids
; indexes for:
; - RadioChannelSongs (see data/radio/channel_music.asm)
; - PlayRadioShow/RadioJumptable (see engine/pokegear/radio.asm)
; - RadioChannels (see engine/pokegear/pokegear.asm)
	const_def
	const OAKS_POKEMON_TALK      ; 00
	const POKEDEX_SHOW           ; 01
	const POKEMON_MUSIC          ; 02
	const LUCKY_CHANNEL          ; 03
	const BUENAS_PASSWORD        ; 04
	const PLACES_AND_PEOPLE      ; 05
	const LETS_ALL_SING          ; 06
	const ROCKET_RADIO           ; 07
	const POKE_FLUTE_RADIO       ; 08
	const UNOWN_RADIO            ; 09
	const EVOLUTION_RADIO        ; 0a
	const MEWTWO_RADIO           ; 0b
	const JOHTO_FISHING_RADIO    ; 0c
	const KANTO_FISHING_RADIO    ; 0d
NUM_RADIO_CHANNELS EQU const_value
; internal indexes for channel segments
	const OAKS_POKEMON_TALK_2    ; 0e
	const OAKS_POKEMON_TALK_3    ; 0f
	const OAKS_POKEMON_TALK_4    ; 10
	const OAKS_POKEMON_TALK_5    ; 11
	const OAKS_POKEMON_TALK_6    ; 12
	const OAKS_POKEMON_TALK_7    ; 13
	const OAKS_POKEMON_TALK_8    ; 14
	const OAKS_POKEMON_TALK_9    ; 15
	const POKEDEX_SHOW_2         ; 16
	const POKEDEX_SHOW_3         ; 17
	const POKEDEX_SHOW_4         ; 18
	const POKEDEX_SHOW_5         ; 19
	const POKEMON_MUSIC_2        ; 1a
	const POKEMON_MUSIC_3        ; 1b
	const POKEMON_MUSIC_4        ; 1c
	const POKEMON_MUSIC_5        ; 1d
	const POKEMON_MUSIC_6        ; 1e
	const POKEMON_MUSIC_7        ; 1f
	const LETS_ALL_SING_2        ; 20
	const LUCKY_NUMBER_SHOW_2    ; 21
	const LUCKY_NUMBER_SHOW_3    ; 22
	const LUCKY_NUMBER_SHOW_4    ; 23
	const LUCKY_NUMBER_SHOW_5    ; 24
	const LUCKY_NUMBER_SHOW_6    ; 25
	const LUCKY_NUMBER_SHOW_7    ; 26
	const LUCKY_NUMBER_SHOW_8    ; 27
	const LUCKY_NUMBER_SHOW_9    ; 28
	const LUCKY_NUMBER_SHOW_10   ; 29
	const LUCKY_NUMBER_SHOW_11   ; 2a
	const LUCKY_NUMBER_SHOW_12   ; 2b
	const LUCKY_NUMBER_SHOW_13   ; 2c
	const LUCKY_NUMBER_SHOW_14   ; 2d
	const LUCKY_NUMBER_SHOW_15   ; 2e
	const PLACES_AND_PEOPLE_2    ; 2f
	const PLACES_AND_PEOPLE_3    ; 30
	const PLACES_AND_PEOPLE_4    ; 31
	const PLACES_AND_PEOPLE_5    ; 32
	const PLACES_AND_PEOPLE_6    ; 33
	const PLACES_AND_PEOPLE_7    ; 34
	const ROCKET_RADIO_2         ; 35
	const ROCKET_RADIO_3         ; 36
	const ROCKET_RADIO_4         ; 37
	const ROCKET_RADIO_5         ; 38
	const ROCKET_RADIO_6         ; 39
	const ROCKET_RADIO_7         ; 3a
	const ROCKET_RADIO_8         ; 3b
	const ROCKET_RADIO_9         ; 3c
	const ROCKET_RADIO_10        ; 3d
	const OAKS_POKEMON_TALK_10   ; 3e
	const OAKS_POKEMON_TALK_11   ; 3f
	const OAKS_POKEMON_TALK_12   ; 40
	const OAKS_POKEMON_TALK_13   ; 41
	const OAKS_POKEMON_TALK_14   ; 42
	const BUENAS_PASSWORD_2      ; 43
	const BUENAS_PASSWORD_3      ; 44
	const BUENAS_PASSWORD_4      ; 45
	const BUENAS_PASSWORD_5      ; 46
	const BUENAS_PASSWORD_6      ; 47
	const BUENAS_PASSWORD_7      ; 48
	const BUENAS_PASSWORD_8      ; 49
	const BUENAS_PASSWORD_9      ; 4a
	const BUENAS_PASSWORD_10     ; 4b
	const BUENAS_PASSWORD_11     ; 4c
	const BUENAS_PASSWORD_12     ; 4d
	const BUENAS_PASSWORD_13     ; 4e
	const BUENAS_PASSWORD_14     ; 4f
	const BUENAS_PASSWORD_15     ; 50
	const BUENAS_PASSWORD_16     ; 51
	const BUENAS_PASSWORD_17     ; 52
	const BUENAS_PASSWORD_18     ; 53
	const BUENAS_PASSWORD_19     ; 54
	const BUENAS_PASSWORD_20     ; 55
	const BUENAS_PASSWORD_21     ; 56
	const RADIO_SCROLL           ; 57
	const POKEDEX_SHOW_6         ; 58
	const POKEDEX_SHOW_7         ; 59
	const POKEDEX_SHOW_8         ; 5a
	const MEWTWO_RADIO_2         ; 5b
	const MEWTWO_RADIO_3         ; 5c
	const MEWTWO_RADIO_4         ; 5d
	const MEWTWO_RADIO_5         ; 5e
	const MEWTWO_RADIO_6         ; 5f
	const MEWTWO_RADIO_7         ; 60
	const MEWTWO_RADIO_8         ; 61
	const MEWTWO_RADIO_9         ; 62
	const MEWTWO_RADIO_10        ; 63
	const JOHTO_FISHING_RADIO2   ; 64
	const KANTO_FISHING_RADIO2   ; 65
NUM_RADIO_SEGMENTS EQU const_value

; PlayRadioStationPointers indexes (see engine/pokegear/pokegear.asm)
	const_def
	const MAPRADIO_POKEMON_CHANNEL
	const MAPRADIO_OAKS_POKEMON_TALK
	const MAPRADIO_POKEDEX_SHOW
	const MAPRADIO_POKEMON_MUSIC
	const MAPRADIO_LUCKY_CHANNEL
	const MAPRADIO_UNOWN
	const MAPRADIO_PLACES_PEOPLE
	const MAPRADIO_LETS_ALL_SING
	const MAPRADIO_ROCKET
NUM_MAP_RADIO_STATIONS EQU const_value

; These tables in engine/pokegear/radio.asm are all sized to a power of 2
; so there's no need for a rejection sampling loop
NUM_OAKS_POKEMON_TALK_ADVERBS    EQU 16 ; OaksPKMNTalk8.Adverbs
NUM_OAKS_POKEMON_TALK_ADJECTIVES EQU 16 ; OaksPKMNTalk9.Adjectives
NUM_PNP_PEOPLE_ADJECTIVES        EQU 16 ; PeoplePlaces5.Adjectives
NUM_PNP_PLACES_ADJECTIVES        EQU 16 ; PeoplePlaces7.Adjectives

; BuenasPasswordTable sizes (see data/radio/buenas_passwords.asm)
NUM_PASSWORD_CATEGORIES    EQU 11
NUM_PASSWORDS_PER_CATEGORY EQU  3

; BuenaPrizeItems size (see data/items/buena_prizes.asm)
NUM_BUENA_PRIZES EQU 9

; GetBuenasPassword.StringFunctionJumpTable indexes (see engine/pokegear/radio.asm)
	const_def
	const BUENA_MON
	const BUENA_ITEM
	const BUENA_MOVE
	const BUENA_STRING
NUM_BUENA_FUNCTIONS EQU const_value
