; Kanto Pokémon in grass

KantoGrassWildMons:

	def_grass_wildmons ROUTE_1
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 1, PIDGEY
	db 1, SENTRET
	db 2, PIDGEY
	db 2, SENTRET
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 2, PIKACHU
	db 1, LEDYBA
	db 2, LEDYBA
	; day
	db 1, PIDGEY
	db 1, SENTRET
	db 2, PIDGEY
	db 2, SENTRET
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 2, RATTATA
	db 1, PIKACHU
	db 2, PIKACHU
	; nite
	db 1, HOOTHOOT
	db 1, RATTATA
	db 2, HOOTHOOT
	db 2, RATTATA
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 1, PIKACHU
	db 1, SPINARAK
	db 2, SPINARAK
	end_grass_wildmons

	def_grass_wildmons ROUTE_3
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 3, SPEAROW
	db 3, RATTATA
	db 6, EKANS
	db 8, RATTATA
	db 8, EKANS
	db 8, SANDSHREW
	db 9, SANDSHREW
	db 8, MANKEY
else
	db 3, SPEAROW
	db 3, RATTATA
	db 6, EKANS
	db 8, RATICATE
	db 8, ARBOK
	db 8, SANDSHREW
	db 9, SANDSLASH
	db 8, MANKEY
endc
	; day
if DEF(_LITTLE_CUP)
	db 3, SPEAROW
	db 3, RATTATA
	db 7, EKANS
	db 8, RATTATA
	db 8, EKANS
	db 8, SANDSHREW
	db 9, SANDSHREW
	db 7, MANKEY
else
	db 3, SPEAROW
	db 3, RATTATA
	db 7, EKANS
	db 8, RATICATE
	db 8, ARBOK
	db 8, SANDSHREW
	db 9, SANDSLASH
	db 7, MANKEY
endc
	; nite
	db 3, RATTATA
	db 8, RATTATA
if DEF(_LITTLE_CUP)
	db 11, RATTATA
else
	db 11, RATICATE
endc
	db 6, ZUBAT
	db 5, RATTATA
	db 4, CLEFAIRY
	db 6, CLEFAIRY
	db 6, MANKEY
	end_grass_wildmons

	def_grass_wildmons ROUTE_4
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 10, RATTATA
	db 10, EKANS
	db 10, SANDSHREW
	db 11, SANDSHREW
	db 12, JIGGLYPUFF
else
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 10, RATICATE
	db 10, ARBOK
	db 10, SANDSHREW
	db 11, SANDSLASH
	db 12, JIGGLYPUFF
endc
	; day
if DEF(_LITTLE_CUP)
	db 5, SPEAROW
	db 5, RATTATA
	db 9, EKANS
	db 10, RATTATA
	db 10, EKANS
	db 10, SANDSHREW
	db 11, SANDSHREW
	db 9, JIGGLYPUFF
else
	db 5, SPEAROW
	db 5, RATTATA
	db 9, EKANS
	db 10, RATICATE
	db 10, ARBOK
	db 10, SANDSHREW
	db 11, SANDSLASH
	db 9, JIGGLYPUFF
endc
	; nite
	db 5, RATTATA
	db 10, RATTATA
if DEF(_LITTLE_CUP)
	db 13, RATTATA
else
	db 13, RATICATE
endc
	db 6, ZUBAT
	db 7, RATTATA
	db 6, CLEFAIRY
	db 8, CLEFAIRY
	db 8, JIGGLYPUFF
	end_grass_wildmons

	def_grass_wildmons ROUTE_5
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 11, PIDGEY
	db 11, SNUBBULL
	db 13, PIDGEY
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 12, ABRA
	db 13, ABRA
	db 14, PSYDUCK
else
	db 11, PIDGEY
	db 11, SNUBBULL
	db 13, PIDGEOTTO
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 12, ABRA
	db 13, ABRA
	db 14, FARFETCH_D
endc
	; day
if DEF(_LITTLE_CUP)
	db 11, PIDGEY
	db 11, SNUBBULL
	db 13, PIDGEY
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 12, ABRA
	db 13, ABRA
	db 14, PSYDUCK
else
	db 11, PIDGEY
	db 11, SNUBBULL
	db 13, PIDGEOTTO
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 12, ABRA
	db 13, ABRA
	db 14, FARFETCH_D
endc
	; nite
	db 11, HOOTHOOT
	db 11, MEOWTH
if DEF(_LITTLE_CUP)
	db 13, HOOTHOOT
else
	db 13, NOCTOWL
endc
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 12, ABRA
	db 13, ABRA
	db 14, PSYDUCK
	end_grass_wildmons

	def_grass_wildmons ROUTE_6
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 11, RATTATA
	db 11, SNUBBULL
	db 12, MAGNEMITE
	db 13, RATTATA
	db 10, JIGGLYPUFF
	db 13, SNUBBULL
	db 13, MANKEY
	db 12, MANKEY
else
	db 11, RATTATA
	db 11, SNUBBULL
	db 12, MAGNEMITE
	db 13, RATICATE
	db 10, JIGGLYPUFF
	db 13, GRANBULL
	db 13, MANKEY
	db 12, MANKEY
endc
	; day
if DEF(_LITTLE_CUP)
	db 11, RATTATA
	db 11, SNUBBULL
	db 12, MAGNEMITE
	db 13, RATTATA
	db 10, JIGGLYPUFF
	db 13, SNUBBULL
	db 12, SNUBBULL
	db 12, BELLSPROUT
else
	db 11, RATTATA
	db 11, SNUBBULL
	db 12, MAGNEMITE
	db 13, RATICATE
	db 10, JIGGLYPUFF
	db 13, GRANBULL
	db 12, GRANBULL
	db 12, BELLSPROUT
endc
	; nite
	db 11, MEOWTH
	db 11, DROWZEE
	db 12, MAGNEMITE
	db 13, PSYDUCK
	db 10, JIGGLYPUFF
if DEF(_LITTLE_CUP)
	db 13, RATTATA
	db 12, RATTATA
else
	db 13, RATICATE
	db 12, RATICATE
endc
	db 12, ODDISH
	end_grass_wildmons

	def_grass_wildmons ROUTE_7
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, RATTATA
	db 15, SPEAROW
	db 16, SNUBBULL
if DEF(_LITTLE_CUP)
	db 16, RATTATA
else
	db 16, RATICATE
endc
	db 16, JIGGLYPUFF
	db 14, ABRA
	db 15, ABRA
	db 17, GROWLITHE
	; day
	db 15, RATTATA
	db 15, SPEAROW
	db 16, SNUBBULL
if DEF(_LITTLE_CUP)
	db 16, RATTATA
else
	db 16, RATICATE
endc
	db 16, JIGGLYPUFF
	db 14, ABRA
	db 15, ABRA
	db 17, GROWLITHE
	; nite
	db 15, MEOWTH
	db 15, MURKROW
	db 16, HOUNDOUR
if DEF(_LITTLE_CUP)
	db 16, MEOWTH
else
	db 16, PERSIAN
endc
	db 16, JIGGLYPUFF
	db 14, ABRA
	db 15, ABRA
	db 17, VULPIX
	end_grass_wildmons

	def_grass_wildmons ROUTE_8
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 15, SNUBBULL
	db 17, PIDGEY
	db 14, ABRA
	db 15, GROWLITHE
	db 14, JIGGLYPUFF
	db 16, ABRA
	db 19, ABRA
	db 19, MANKEY
else
	db 15, SNUBBULL
	db 17, PIDGEOTTO
	db 14, ABRA
	db 15, GROWLITHE
	db 14, JIGGLYPUFF
	db 16, KADABRA
	db 19, KADABRA
	db 19, AIPOM
endc
	; day
if DEF(_LITTLE_CUP)
	db 15, SNUBBULL
	db 17, PIDGEY
	db 14, ABRA
	db 15, GROWLITHE
	db 14, JIGGLYPUFF
	db 16, ABRA
	db 19, ABRA
	db 17, MANKEY
else
	db 15, SNUBBULL
	db 17, PIDGEOTTO
	db 14, ABRA
	db 15, GROWLITHE
	db 14, JIGGLYPUFF
	db 16, KADABRA
	db 19, KADABRA
	db 17, AIPOM
endc
	; nite
if DEF(_LITTLE_CUP)
	db 15, MEOWTH
	db 18, HOOTHOOT
	db 14, ABRA
	db 15, GASTLY
	db 14, JIGGLYPUFF
	db 16, ABRA
	db 19, ABRA
	db 15, MANKEY
else
	db 15, MEOWTH
	db 18, NOCTOWL
	db 14, ABRA
	db 15, HAUNTER
	db 14, JIGGLYPUFF
	db 16, KADABRA
	db 19, KADABRA
	db 15, AIPOM
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_9
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, SENTRET
	db 13, SPEAROW
if DEF(_LITTLE_CUP)
	db 13, SENTRET
	db 15, SPEAROW
	db 13, SPEAROW
	db 16, RATTATA
else
	db 13, FURRET
	db 15, FEAROW
	db 13, FEAROW
	db 16, RATICATE
endc
	db 16, NIDORAN_F
	db 16, NIDORAN_M
	; day
	db 13, SENTRET
	db 13, SPEAROW
if DEF(_LITTLE_CUP)
	db 13, RATTATA
	db 15, SPEAROW
	db 13, SPEAROW
	db 16, SENTRET
else
	db 13, RATICATE
	db 15, FEAROW
	db 13, FEAROW
	db 16, FURRET
endc
	db 16, NIDORAN_F
	db 16, NIDORAN_M
	; nite
if DEF(_LITTLE_CUP)
	db 13, RATTATA
	db 13, VENONAT
	db 13, RATTATA
	db 15, VENONAT
	db 13, ZUBAT
	db 16, CUBONE
	db 16, NIDORAN_F
	db 16, NIDORAN_M
else
	db 13, RATTATA
	db 13, VENONAT
	db 13, RATICATE
	db 15, VENOMOTH
	db 13, ZUBAT
	db 16, MAROWAK
	db 16, NIDORAN_F
	db 16, NIDORAN_M
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_10_NORTH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 13, SPEAROW
	db 15, VOLTORB
	db 13, SENTRET
	db 15, SPEAROW
	db 14, MAGNEMITE
	db 13, PIKACHU
	db 14, PIKACHU
	db 8, PORYGON
else
	db 13, SPEAROW
	db 15, VOLTORB
	db 13, FURRET
	db 15, FEAROW
	db 14, MAGNEMITE
	db 13, ELECTABUZZ
	db 14, ELECTABUZZ
	db 8, PORYGON
endc
	; day
if DEF(_LITTLE_CUP)
	db 13, SPEAROW
	db 15, VOLTORB
	db 13, SENTRET
	db 15, SPEAROW
	db 14, MAGNEMITE
	db 16, PIKACHU
	db 15, PIKACHU
	db 8, PORYGON
else
	db 13, SPEAROW
	db 15, VOLTORB
	db 13, FURRET
	db 15, FEAROW
	db 14, MAGNEMITE
	db 16, ELECTABUZZ
	db 15, ELECTABUZZ
	db 8, PORYGON
endc
	; nite
if DEF(_LITTLE_CUP)
	db 13, VENONAT
	db 15, VOLTORB
	db 13, RATTATA
	db 15, VENONAT
	db 14, MAGNEMITE
	db 13, PIKACHU
	db 14, PIKACHU
	db 8, PORYGON
else
	db 13, VENONAT
	db 15, VOLTORB
	db 13, RATTATA
	db 15, VENONAT
	db 14, MAGNEMITE
	db 13, PIKACHU
	db 14, PIKACHU
	db 8, PORYGON
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_11
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, PONYTA
	db 11, MEOWTH
	db 13, MAGNEMITE
if DEF(_LITTLE_CUP)
	db 14, PIDGEY
else
	db 14, PIDGEOTTO
endc
	db 14, RATTATA
	db 12, HOPPIP
	db 14, HOPPIP
	db 13, SANDSHREW
	; day
	db 13, PONYTA
	db 11, MEOWTH
	db 13, MAGNEMITE
if DEF(_LITTLE_CUP)
	db 14, PIDGEY
else
	db 14, PIDGEOTTO
endc
	db 14, RATTATA
	db 12, HOPPIP
	db 14, HOPPIP
	db 13, EKANS
	; nite
if DEF(_LITTLE_CUP)
	db 13, DROWZEE
	db 11, RATTATA
	db 13, MAGNEMITE
	db 14, HOOTHOOT
	db 14, RATTATA
	db 12, DROWZEE
	db 14, DROWZEE
	db 13, EKANS
else
	db 13, DROWZEE
	db 11, RATICATE
	db 13, MAGNEMITE
	db 14, NOCTOWL
	db 14, RATICATE
	db 12, HYPNO
	db 14, HYPNO
	db 13, EKANS
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_13
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 21, NIDORAN_M
	db 21, NIDORAN_F
	db 23, PIDGEY
	db 23, HOPPIP
	db 25, BELLSPROUT
	db 25, PSYDUCK
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, NIDORINO
	db 21, NIDORINA
	db 23, PIDGEOTTO
	db 23, HOPPIP
	db 25, WEEPINBELL
	db 25, FARFETCH_D
	db 23, BLISSEY
	db 23, DITTO
endc
	; day
if DEF(_LITTLE_CUP)
	db 21, NIDORAN_M
	db 21, NIDORAN_F
	db 23, PIDGEY
	db 23, HOPPIP
	db 25, BELLSPROUT
	db 25, PSYDUCK
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, NIDORINO
	db 21, NIDORINA
	db 23, PIDGEOTTO
	db 23, HOPPIP
	db 25, WEEPINBELL
	db 25, FARFETCH_D
	db 23, CHANSEY
	db 23, DITTO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 21, VENONAT
	db 21, WOOPER
	db 23, HOOTHOOT
	db 23, VENONAT
	db 25, ODDISH
	db 25, KOFFING
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, VENONAT
	db 21, QUAGSIRE
	db 23, NOCTOWL
	db 23, VENOMOTH
	db 25, GLOOM
	db 25, WEEZING
	db 23, CHANSEY
	db 23, DITTO
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_14
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, NIDORAN_M
	db 24, NIDORAN_F
	db 26, PIDGEY
	db 29, HOPPIP
	db 30, BELLSPROUT
	db 29, DODUO
	db 26, CHANSEY
	db 27, EEVEE
else
	db 24, NIDORINO
	db 24, NIDORINA
	db 26, PIDGEOTTO
	db 29, SKIPLOOM
	db 30, WEEPINBELL
	db 29, DODRIO
	db 26, BLISSEY
	db 27, DITTO
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, NIDORAN_M
	db 24, NIDORAN_F
	db 26, PIDGEY
	db 29, HOPPIP
	db 30, BELLSPROUT
	db 29, DODUO
	db 26, CHANSEY
	db 27, EEVEE
else
	db 24, NIDORINO
	db 24, NIDORINA
	db 26, PIDGEOTTO
	db 29, SKIPLOOM
	db 30, WEEPINBELL
	db 29, DODRIO
	db 26, CHANSEY
	db 27, DITTO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, VENONAT
	db 24, WOOPER
	db 26, HOOTHOOT
	db 29, VENONAT
	db 30, ODDISH
	db 29, KOFFING
	db 26, CHANSEY
	db 27, EEVEE
else
	db 24, VENONAT
	db 24, QUAGSIRE
	db 26, NOCTOWL
	db 29, VENOMOTH
	db 30, GLOOM
	db 29, WEEZING
	db 26, CHANSEY
	db 27, DITTO
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_15
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 21, NIDORAN_M
	db 21, NIDORAN_F
	db 23, PIDGEY
	db 23, HOPPIP
	db 25, BELLSPROUT
	db 25, DODUO
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, NIDORINO
	db 21, NIDORINA
	db 23, PIDGEOTTO
	db 23, HOPPIP
	db 25, WEEPINBELL
	db 25, DODUO
	db 23, BLISSEY
	db 23, DITTO
endc
	; day
if DEF(_LITTLE_CUP)
	db 21, NIDORAN_M
	db 21, NIDORAN_F
	db 23, PIDGEY
	db 23, HOPPIP
	db 25, BELLSPROUT
	db 25, DODUO
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, NIDORINO
	db 21, NIDORINA
	db 23, PIDGEOTTO
	db 23, HOPPIP
	db 25, WEEPINBELL
	db 25, DODUO
	db 23, CHANSEY
	db 23, DITTO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 21, VENONAT
	db 21, WOOPER
	db 23, HOOTHOOT
	db 23, VENONAT
	db 25, ODDISH
	db 25, KOFFING
	db 23, CHANSEY
	db 23, EEVEE
else
	db 21, VENONAT
	db 21, QUAGSIRE
	db 23, NOCTOWL
	db 23, VENOMOTH
	db 25, GLOOM
	db 25, KOFFING
	db 23, CHANSEY
	db 23, DITTO
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_16
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, SPEAROW
	db 26, GRIMER
	db 29, SPEAROW
	db 27, SLUGMA
	db 28, GRIMER
	db 29, GRIMER
	db 29, SENTRET
else
	db 24, GRIMER
	db 25, FEAROW
	db 26, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 28, MUK
	db 29, MUK
	db 29, LICKITUNG
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, SPEAROW
	db 26, GRIMER
	db 29, SPEAROW
	db 27, SLUGMA
	db 28, GRIMER
	db 29, GRIMER
	db 29, TEDDIURSA
else
	db 24, GRIMER
	db 25, FEAROW
	db 26, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 28, MUK
	db 29, MUK
	db 29, SNORLAX
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, HOOTHOOT
	db 26, GRIMER
	db 29, HOOTHOOT
	db 27, SLUGMA
	db 28, GRIMER
	db 29, GRIMER
	db 29, SENTRET
else
	db 24, GRIMER
	db 25, MURKROW
	db 26, GRIMER
	db 29, MURKROW
	db 27, MAGCARGO
	db 28, MUK
	db 29, MUK
	db 29, LICKITUNG
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_17
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 28, SPEAROW
	db 27, GRIMER
	db 29, GRIMER
	db 30, SPEAROW
	db 30, SLUGMA
	db 31, GRIMER
	db 32, GRIMER
	db 29, RATTATA
else
	db 28, FEAROW
	db 27, GRIMER
	db 29, GRIMER
	db 30, FEAROW
	db 30, SLUGMA
	db 31, MUK
	db 32, MUK
	db 29, STANTLER
endc
	; day
if DEF(_LITTLE_CUP)
	db 28, SPEAROW
	db 27, SLUGMA
	db 27, GRIMER
	db 30, SPEAROW
	db 30, SLUGMA
	db 31, GRIMER
	db 32, GRIMER
	db 29, RATTATA
else
	db 28, FEAROW
	db 27, SLUGMA
	db 27, GRIMER
	db 30, FEAROW
	db 30, SLUGMA
	db 31, MUK
	db 32, MUK
	db 29, STANTLER
endc
	; nite
if DEF(_LITTLE_CUP)
	db 28, HOOTHOOT
	db 27, GRIMER
	db 29, GRIMER
	db 30, HOOTHOOT
	db 30, GRIMER
	db 31, GRIMER
	db 32, GRIMER
	db 29, RATTATA
else
	db 28, MURKROW
	db 27, GRIMER
	db 29, GRIMER
	db 30, MURKROW
	db 30, GRIMER
	db 31, MUK
	db 32, MUK
	db 29, GIRAFARIG
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_18
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, SPEAROW
	db 26, RATTATA
	db 26, SENTRET
	db 27, SLUGMA
	db 29, SPEAROW
	db 29, GRIMER
	db 29, RATTATA
else
	db 24, GRIMER
	db 25, FEAROW
	db 26, TAUROS
	db 26, MILTANK
	db 27, SLUGMA
	db 29, FEAROW
	db 29, MUK
	db 29, STANTLER
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, SPEAROW
	db 26, RATTATA
	db 26, SENTRET
	db 27, SLUGMA
	db 29, SPEAROW
	db 29, GRIMER
	db 29, RATTATA
else
	db 24, GRIMER
	db 25, FEAROW
	db 26, TAUROS
	db 26, MILTANK
	db 27, SLUGMA
	db 29, FEAROW
	db 29, MUK
	db 29, STANTLER
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, GRIMER
	db 25, HOOTHOOT
	db 26, RATTATA
	db 26, SENTRET
	db 27, SLUGMA
	db 29, HOOTHOOT
	db 29, GRIMER
	db 29, RATTATA
else
	db 24, GRIMER
	db 25, MURKROW
	db 26, TAUROS
	db 26, MILTANK
	db 27, MAGCARGO
	db 29, MURKROW
	db 29, MUK
	db 29, GIRAFARIG
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_21
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 26, EXEGGCUTE
	db 23, RATTATA
	db 31, EXEGGCUTE
	db 18, RATTATA
	db 28, RATTATA
	db 28, ABRA
	db 26, ABRA
	db 29, KRABBY
else
	db 26, EXEGGUTOR
	db 23, RATTATA
	db 31, EXEGGUTOR
	db 18, RATICATE
	db 28, FLOGISTAN
	db 28, MR__MIME
	db 26, MR__MIME
	db 29, PINSIR
endc
	; day
if DEF(_LITTLE_CUP)
	db 28, EXEGGCUTE
	db 23, RATTATA
	db 33, EXEGGCUTE
	db 18, RATTATA
	db 28, RATTATA
	db 28, ABRA
	db 26, ABRA
	db 29, KRABBY
else
	db 28, EXEGGUTOR
	db 23, RATTATA
	db 33, EXEGGUTOR
	db 18, RATICATE
	db 28, FLOGISTAN
	db 28, MR__MIME
	db 26, MR__MIME
	db 29, PINSIR
endc
	; nite
if DEF(_LITTLE_CUP)
	db 28, SUNKERN
	db 23, RATTATA
	db 33, SUNKERN
	db 18, RATTATA
	db 28, RATTATA
	db 28, KRABBY
	db 26, KRABBY
	db 29, ABRA
else
	db 28, TANGELA
	db 23, RATTATA
	db 33, TANGELA
	db 18, RATICATE
	db 28, FLOGISTAN
	db 28, PINSIR
	db 26, PINSIR
	db 29, MR__MIME
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_22
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, RATTATA
	db 2, SPEAROW
	db 3, SPEAROW
	db 2, DODUO
	db 6, PONYTA
if DEF(_LITTLE_CUP)
	db 6, SPEAROW
	db 4, ZUBAT
	db 5, SPEAROW
else
	db 6, FEAROW
	db 4, GLIGAR
	db 5, SKARMORY
endc
	; day
	db 2, RATTATA
	db 2, SPEAROW
	db 3, SPEAROW
	db 2, DODUO
	db 6, PONYTA
if DEF(_LITTLE_CUP)
	db 6, SPEAROW
	db 4, ZUBAT
	db 5, SPEAROW
else
	db 6, FEAROW
	db 4, GLIGAR
	db 5, SKARMORY
endc
	; nite
	db 2, RATTATA
	db 2, PSYDUCK
	db 3, PSYDUCK
	db 2, POLIWAG
	db 6, NIDORAN_F
	db 6, NIDORAN_M
if DEF(_LITTLE_CUP)
	db 4, ZUBAT
	db 5, SPEAROW
else
	db 4, GLIGAR
	db 5, SKARMORY
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_24
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 6, CATERPIE
	db 6, WEEDLE
	db 10, ABRA
	db 8, BELLSPROUT
	db 16, CATERPIE
	db 16, WEEDLE
	db 10, SUNKERN
	db 15, PIDGEY
else
	db 6, CATERPIE
	db 6, WEEDLE
	db 10, ABRA
	db 8, BELLSPROUT
	db 16, BUTTERFREE
	db 16, BEEDRILL
	db 10, SUNKERN
	db 15, PIDGEOTTO
endc
	; morn
if DEF(_LITTLE_CUP)
	db 8, CATERPIE
	db 8, WEEDLE
	db 10, ABRA
	db 8, BELLSPROUT
	db 12, CATERPIE
	db 12, WEEDLE
	db 8, SUNKERN
	db 15, PIDGEY
else
	db 8, CATERPIE
	db 8, WEEDLE
	db 10, ABRA
	db 8, BELLSPROUT
	db 12, BUTTERFREE
	db 12, BEEDRILL
	db 8, SUNKERN
	db 15, PIDGEOTTO
endc
	; morn
if DEF(_LITTLE_CUP)
	db 8, CATERPIE
	db 8, WEEDLE
	db 10, ABRA
	db 8, ODDISH
	db 10, VENONAT
	db 8, VENONAT
	db 5, VENONAT
	db 15, HOOTHOOT
else
	db 8, METAPOD
	db 8, KAKUNA
	db 10, ABRA
	db 8, ODDISH
	db 10, VENONAT
	db 8, VENOMOTH
	db 5, VENOMOTH
	db 15, NOCTOWL
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_25
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, MAREEP
	db 8, PIDGEY
	db 10, ABRA
	db 8, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 16, CATERPIE
	db 16, WEEDLE
	db 16, MAREEP
	db 17, SUNKERN
else
	db 16, BUTTERFREE
	db 16, BEEDRILL
	db 16, FLAAFFY
	db 17, SUNFLORA
endc
	; day
	db 8, MAREEP
	db 8, PIDGEY
	db 10, ABRA
	db 8, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 12, CATERPIE
	db 12, WEEDLE
	db 16, MAREEP
	db 8, SUNKERN
else
	db 12, BUTTERFREE
	db 12, BEEDRILL
	db 16, FLAAFFY
	db 8, SUNFLORA
endc
	; nite
	db 8, MAREEP
	db 8, HOOTHOOT
	db 10, ABRA
	db 8, ODDISH
if DEF(_LITTLE_CUP)
	db 8, CATERPIE
	db 8, WEEDLE
	db 16, MAREEP
	db 8, VENONAT
else
	db 8, METAPOD
	db 8, KAKUNA
	db 16, FLAAFFY
	db 8, VENOMOTH
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_26
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 34, PONYTA
	db 35, DODUO
if DEF(_LITTLE_CUP)
	db 39, SENTRET
	db 35, EKANS
	db 35, SANDSHREW
	db 33, WEEDLE
	db 35, PIDGEY
	db 36, DODUO
else
	db 39, FURRET
	db 35, ARBOK
	db 35, SANDSLASH
	db 33, BEEDRILL
	db 35, PIDGEOT
	db 36, DODRIO
endc
	; day
	db 34, PONYTA
	db 35, DODUO
if DEF(_LITTLE_CUP)
	db 39, SENTRET
	db 35, EKANS
	db 35, SANDSHREW
	db 33, WEEDLE
	db 35, PIDGEY
	db 36, DODUO
else
	db 39, FURRET
	db 35, ARBOK
	db 35, SANDSLASH
	db 33, BEEDRILL
	db 35, PIDGEOT
	db 36, DODRIO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 34, WOOPER
	db 35, HOOTHOOT
	db 39, RATTATA
	db 35, EKANS
	db 35, SANDSHREW
	db 35, VENONAT
	db 37, HOOTHOOT
	db 36, DODUO
else
	db 34, QUAGSIRE
	db 35, NOCTOWL
	db 39, RATICATE
	db 35, ARBOK
	db 35, SANDSLASH
	db 35, VENOMOTH
	db 37, NOCTOWL
	db 36, DODRIO
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_27
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 33, PONYTA
	db 34, DODUO
if DEF(_LITTLE_CUP)
	db 38, SENTRET
	db 34, EKANS
	db 34, SANDSHREW
	db 33, CATERPIE
	db 34, PIDGEY
	db 35, DODUO
else
	db 38, FURRET
	db 34, ARBOK
	db 34, SANDSLASH
	db 33, BUTTERFREE
	db 34, PIDGEOT
	db 35, DODRIO
endc
	; day
	db 33, PONYTA
	db 34, DODUO
if DEF(_LITTLE_CUP)
	db 38, SENTRET
	db 34, EKANS
	db 34, SANDSHREW
	db 33, CATERPIE
	db 34, PIDGEY
	db 35, DODUO
else
	db 38, FURRET
	db 34, ARBOK
	db 34, SANDSLASH
	db 33, BUTTERFREE
	db 34, PIDGEOT
	db 35, DODRIO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 33, WOOPER
	db 34, HOOTHOOT
	db 38, RATTATA
	db 34, EKANS
	db 34, SANDSHREW
	db 33, VENONAT
	db 36, HOOTHOOT
	db 35, DODUO
else
	db 33, QUAGSIRE
	db 34, NOCTOWL
	db 38, RATICATE
	db 34, ARBOK
	db 34, SANDSLASH
	db 33, VENOMOTH
	db 36, NOCTOWL
	db 35, DODRIO
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_28
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 40, HOPPIP
	db 41, PONYTA
	db 44, PONYTA
	db 42, EKANS
	db 41, DODUO
	db 43, DODUO
	db 42, TEDDIURSA
	db 42, PHANPY
else
	db 40, JUMPLUFF
	db 41, PONYTA
	db 44, RAPIDASH
	db 42, ARBOK
	db 41, DODUO
	db 43, DODRIO
	db 42, URSARING
	db 42, DONPHAN
endc
	; day
if DEF(_LITTLE_CUP)
	db 40, HOPPIP
	db 41, PONYTA
	db 44, PONYTA
	db 42, EKANS
	db 41, DODUO
	db 43, DODUO
	db 42, TEDDIURSA
	db 42, PHANPY
else
	db 40, JUMPLUFF
	db 41, PONYTA
	db 44, RAPIDASH
	db 42, ARBOK
	db 41, DODUO
	db 43, DODRIO
	db 42, URSARING
	db 42, DONPHAN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 40, SUNKERN
	db 41, SCYTHER
	db 44, PONYTA
	db 42, EKANS
	db 41, HOUNDOUR
	db 43, HOUNDOUR
	db 42, ZUBAT
	db 42, POLIWAG
else
	db 40, TANGELA
	db 41, SNEASEL
	db 44, RAPIDASH
	db 42, ARBOK
	db 41, HOUNDOOM
	db 43, HOUNDOUR
	db 42, GOLBAT
	db 42, POLIWHIRL
endc
	end_grass_wildmons

	def_grass_wildmons VIRIDIAN_FOREST
	db 10 percent, 8 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, CATERPIE
	db 2, LEDYBA
	db 3, PIDGEY
if DEF(_LITTLE_CUP)
	db 5, CATERPIE
	db 5, LEDIAN
else
	db 5, BUTTERFREE
	db 5, LEDIAN
endc
	db 2, PIKACHU
	db 4, PIKACHU
	db 5, BULBASAUR
	; day
	db 2, CATERPIE
	db 2, PIDGEY
	db 3, PIDGEY
if DEF(_LITTLE_CUP)
	db 5, CATERPIE
	db 5, PIDGEY
else
	db 5, BUTTERFREE
	db 5, PIDGEOTTO
endc
	db 2, PIKACHU
	db 4, PIKACHU
	db 4, BULBASAUR
	; nite
if DEF(_LITTLE_CUP)
	db 2, HOOTHOOT
	db 2, SPINARAK
	db 3, HOOTHOOT
	db 5, HOOTHOOT
	db 5, SPINARAK
	db 2, HOOTHOOT
	db 4, HOOTHOOT
	db 2, BULBASAUR
else
	db 2, HOOTHOOT
	db 2, SPINARAK
	db 3, HOOTHOOT
	db 5, NOCTOWL
	db 5, ARIADOS
	db 2, NOCTOWL
	db 4, NOCTOWL
	db 2, BULBASAUR
endc
	end_grass_wildmons

	def_grass_wildmons MOUNT_MOON_1F
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 4, ZUBAT
	db 6, GEODUDE
	db 6, SANDSHREW
	db 9, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 5, CLEFAIRY
else
	db 5, CLEFABLE
endc
	db 10, COTTONEE
	; day
	db 4, ZUBAT
	db 6, GEODUDE
	db 6, SANDSHREW
	db 10, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
	db 7, CLEFAIRY
	db 7, COTTONEE
	; nite
	db 4, ZUBAT
	db 6, GEODUDE
	db 6, CLEFAIRY
	db 11, PARAS
	db 9, GEODUDE
	db 10, CLEFAIRY
	db 11, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 8, ABRA
else
	db 8, WOBBUFFET
endc
	end_grass_wildmons

	def_grass_wildmons MOUNT_MOON_B1F
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 5, ZUBAT
	db 6, GEODUDE
	db 7, SANDSHREW
	db 9, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 5, TOGEPI
	db 10, COTTONEE
else
	db 5, TOGETIC
	db 10, WHIMSICOTT
endc
	; day
	db 5, ZUBAT
	db 6, GEODUDE
	db 7, SANDSHREW
	db 10, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
	db 7, CLEFAIRY
	db 7, COTTONEE
	; nite
	db 5, ZUBAT
	db 6, GEODUDE
	db 6, CLEFAIRY
	db 11, PARAS
	db 9, GEODUDE
	db 10, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 11, CLEFAIRY
	db 9, ABRA
else
	db 11, CLEFABLE
	db 9, WOBBUFFET
endc
	end_grass_wildmons

	def_grass_wildmons MOUNT_MOON_B2F
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 6, ZUBAT
	db 6, GEODUDE
	db 9, SANDSHREW
	db 9, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 5, TOGEPI
	db 10, COTTONEE
else
	db 5, TOGETIC
	db 10, WHIMSICOTT
endc
	; day
	db 6, ZUBAT
	db 6, GEODUDE
	db 9, SANDSHREW
	db 10, PARAS
	db 9, GEODUDE
	db 6, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 7, CLEFAIRY
	db 7, COTTONEE
else
	db 7, CLEFABLE
	db 7, WHIMSICOTT
endc
	; nite
	db 6, ZUBAT
	db 6, GEODUDE
	db 6, CLEFAIRY
	db 11, PARAS
	db 10, GEODUDE
	db 10, CLEFAIRY
if DEF(_LITTLE_CUP)
	db 11, CLEFAIRY
	db 10, ABRA
else
	db 11, CLEFABLE
	db 10, WOBBUFFET
endc
	end_grass_wildmons

	def_grass_wildmons DIGLETTS_CAVE
	db 4 percent, 2 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 2, DIGLETT
	db 6, DIGLETT
	db 10, DIGLETT
	db 23, DIGLETT
if DEF(_LITTLE_CUP)
	db 22, DIGLETT
	db 26, DIGLETT
	db 30, DIGLETT
	db 34, DIGLETT
else
	db 22, DUGTRIO
	db 26, DUGTRIO
	db 30, DUGTRIO
	db 34, DUGTRIO
endc
	; day
	db 2, DIGLETT
	db 6, DIGLETT
	db 10, DIGLETT
	db 14, DIGLETT
if DEF(_LITTLE_CUP)
	db 14, DIGLETT
	db 18, DIGLETT
	db 22, DIGLETT
	db 26, DIGLETT
else
	db 14, DUGTRIO
	db 18, DUGTRIO
	db 22, DUGTRIO
	db 26, DUGTRIO
endc
	; nite
	db 5, DIGLETT
	db 10, DIGLETT
	db 15, DIGLETT
	db 30, DIGLETT
if DEF(_LITTLE_CUP)
	db 30, DIGLETT
	db 34, DIGLETT
	db 38, DIGLETT
	db 42, DIGLETT
else
	db 30, DUGTRIO
	db 34, DUGTRIO
	db 38, DUGTRIO
	db 42, DUGTRIO
endc
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 8, CUBONE
	db 9, GEODUDE
	db 10, MACHOP
	db 10, ZUBAT
if DEF(_LITTLE_CUP)
	db 13, MACHOP
	db 10, CUBONE
	db 11, CUBONE
else
	db 13, MACHOKE
	db 10, MAROWAK
	db 11, MAROWAK
endc
	db 14, CUBONE
	; day
	db 8, CUBONE
	db 9, GEODUDE
	db 11, MACHOP
	db 10, ZUBAT
if DEF(_LITTLE_CUP)
	db 12, MACHOP
	db 10, CUBONE
	db 11, CUBONE
else
	db 12, MACHOKE
	db 10, MAROWAK
	db 11, MAROWAK
endc
	db 15, CUBONE
	; nite
	db 10, ZUBAT
	db 9, GEODUDE
	db 10, GEODUDE
if DEF(_LITTLE_CUP)
	db 15, GASTLY
	db 13, ZUBAT
	db 10, CUBONE
	db 11, CUBONE
	db 15, CUBONE
else
	db 15, HAUNTER
	db 13, ZUBAT
	db 10, MAROWAK
	db 11, MAROWAK
	db 15, MAROWAK
endc
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 10, CUBONE
	db 12, GEODUDE
	db 14, ONIX
	db 10, ZUBAT
if DEF(_LITTLE_CUP)
	db 13, CUBONE
	db 13, CUBONE
	db 14, CUBONE
	db 15, CUBONE
else
	db 13, MAROWAK
	db 13, KANGASKHAN
	db 14, KANGASKHAN
	db 15, MAROWAK
endc
	; day
	db 10, CUBONE
	db 12, GEODUDE
	db 14, ONIX
	db 10, ZUBAT
if DEF(_LITTLE_CUP)
	db 13, CUBONE
	db 13, CUBONE
	db 14, CUBONE
	db 15, CUBONE
else
	db 13, MAROWAK
	db 13, KANGASKHAN
	db 14, KANGASKHAN
	db 15, MAROWAK
endc
	; nite
	db 10, ZUBAT
	db 12, GEODUDE
	db 14, ONIX
	db 13, ZUBAT
if DEF(_LITTLE_CUP)
	db 13, GASTLY
	db 13, ZUBAT
	db 14, ZUBAT
	db 15, CUBONE
else
	db 13, HAUNTER
	db 13, GOLBAT
	db 14, GOLBAT
	db 15, MAROWAK
endc
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_ZAPDOS_CHAMBER
	db 4 percent, 4 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 9, VOLTORB
	db 9, MAGNEMITE
	db 14, EEVEE
	db 15, PIKACHU
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 9, VOLTORB
	db 9, MAGNEMITE
	db 14, JOLTEON
	db 15, ELECTABUZZ
	db 26, UNOWN
	db 1, UNOWN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 9, VOLTORB
	db 9, MAGNEMITE
	db 14, EEVEE
	db 15, PIKACHU
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 9, VOLTORB
	db 9, MAGNEMITE
	db 14, JOLTEON
	db 15, ELECTABUZZ
	db 26, UNOWN
	db 1, UNOWN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 9, ZUBAT
	db 10, ZUBAT
	db 11, ZUBAT
	db 17, ZUBAT
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 9, ZUBAT
	db 10, ZUBAT
	db 11, ZUBAT
	db 17, ZUBAT
	db 26, UNOWN
	db 1, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_CAVE_1F
	db 1 percent, 1 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 37, ZUBAT
	db 37, GEODUDE
	db 37, SLOWPOKE
	db 37, WOOPER
	db 38, SEEL
	db 38, ZUBAT
	db 37, VULPIX
	db 38, VULPIX
else
	db 37, GOLBAT
	db 37, GRAVELER
	db 37, SLOWPOKE
	db 37, QUAGSIRE
	db 38, DEWGONG
	db 38, DELIBIRD
	db 37, SNOCONEY
	db 38, SNOCONEY
endc
	; day
if DEF(_LITTLE_CUP)
	db 37, ZUBAT
	db 38, GEODUDE
	db 37, SLOWPOKE
	db 37, WOOPER
	db 38, SEEL
	db 38, ZUBAT
	db 37, CHINCHOU
	db 38, CHINCHOU
else
	db 37, GOLBAT
	db 38, GRAVELER
	db 37, SLOWPOKE
	db 37, QUAGSIRE
	db 38, DEWGONG
	db 38, DELIBIRD
	db 37, CHINCHOU
	db 38, CHINCHOU
endc
	; nite
if DEF(_LITTLE_CUP)
	db 38, ZUBAT
	db 37, GEODUDE
	db 37, SLOWPOKE
	db 37, WOOPER
	db 38, SEEL
	db 38, ZUBAT
	db 37, GASTLY
	db 38, GASTLY
else
	db 38, GOLBAT
	db 37, GRAVELER
	db 37, SLOWPOKE
	db 37, QUAGSIRE
	db 38, DEWGONG
	db 38, DELIBIRD
	db 37, HAUNTER
	db 38, HAUNTER
endc
	end_grass_wildmons

	def_grass_wildmons CERULEAN_CAVE_1F
	db 8 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 40, ZUBAT
	db 40, GEODUDE
	db 40, RHYHORN
	db 40, MAGNEMITE
	db 40, MACHOP
	db 40, SWINUB
	db 40, EEVEE
	db 40, PIKACHU
else
	db 40, GOLBAT
	db 40, GRAVELER
	db 40, RHYHORN
	db 40, MAGNETON
	db 40, MACHOKE
	db 40, PILOSWINE
	db 40, DITTO
	db 40, RAICHU
endc
	; day
if DEF(_LITTLE_CUP)
	db 40, ZUBAT
	db 40, GEODUDE
	db 40, ABRA
	db 40, MAGNEMITE
	db 40, MACHOP
	db 40, SANDSHREW
	db 40, EEVEE
	db 40, RHYHORN
else
	db 40, GOLBAT
	db 40, GRAVELER
	db 40, KADABRA
	db 40, MAGNETON
	db 40, MACHOKE
	db 40, SANDSLASH
	db 40, DITTO
	db 40, RHYHORN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 40, ZUBAT
	db 40, GEODUDE
	db 40, RHYHORN
	db 40, MAGNEMITE
	db 40, MANKEY
	db 40, CUBONE
	db 40, ABRA
	db 40, VENONAT
else
	db 40, GOLBAT
	db 40, GRAVELER
	db 40, RHYHORN
	db 40, MAGNETON
	db 40, PRIMEAPE
	db 40, MAROWAK
	db 40, WOBBUFFET
	db 40, VENOMOTH
endc
	end_grass_wildmons

	def_grass_wildmons CERULEAN_CAVE_2F
	db 8 percent, 8 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 41, ZUBAT
	db 41, GEODUDE
	db 41, RHYHORN
	db 41, MAGNEMITE
	db 41, MACHOP
	db 41, SWINUB
	db 41, EEVEE
	db 41, CHANSEY
else
	db 41, GOLBAT
	db 41, GRAVELER
	db 41, RHYHORN
	db 41, MAGNETON
	db 41, MACHOKE
	db 41, PILOSWINE
	db 41, DITTO
	db 41, CHANSEY
endc
	; day
if DEF(_LITTLE_CUP)
	db 41, ZUBAT
	db 41, GEODUE
	db 41, JIGGLYPUFF
	db 41, MAGNEMITE
	db 41, MACHOP
	db 41, SANDSHREW
	db 41, EEVEE
	db 41, RHYHORN
else
	db 41, GOLBAT
	db 41, GRAVELER
	db 41, WIGGLYTUFF
	db 41, MAGNETON
	db 41, MACHOKE
	db 41, SANDSLASH
	db 41, DITTO
	db 41, RHYHORN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 41, ZUBAT
	db 41, GEODUDE
	db 41, DROWZEE
	db 41, MAGNEMITE
	db 41, MANKEY
	db 41, CUBONE
	db 41, ABRA
	db 41, RHYHORN
else
	db 41, GOLBAT
	db 41, GRAVELER
	db 41, HYPNO
	db 41, MAGNETON
	db 41, PRIMEAPE
	db 41, MAROWAK
	db 41, WOBBUFFET
	db 41, RHYHORN
endc
	end_grass_wildmons

	def_grass_wildmons CERULEAN_CAVE_B1F
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 42, ZUBAT
	db 42, GEODUDE
	db 42, RHYHORN
	db 42, MAGNEMITE
	db 42, MACHOP
	db 42, SWINUB
	db 42, ABRA
	db 42, SENTRET
else
	db 42, GOLBAT
	db 42, GOLEM
	db 42, RHYDON
	db 42, MAGNETON
	db 42, MACHAMP
	db 42, PILOSWINE
	db 42, UNOWN
	db 42, LICKITUNG
endc
	; day
if DEF(_LITTLE_CUP)
	db 42, ZUBAT
	db 42, GEODUDE
	db 42, RHYHORN
	db 42, MAGNEMITE
	db 42, MACHOP
	db 42, SANDSHREW
	db 42, ABRA
	db 42, TEDDIURSA
else
	db 42, GOLBAT
	db 42, GOLEM
	db 42, RHYDON
	db 42, MAGNETON
	db 42, MACHAMP
	db 42, SANDSLASH
	db 42, UNOWN
	db 42, SNORLAX
endc
	; nite
if DEF(_LITTLE_CUP)
	db 42, ZUBAT
	db 42, GEODUDE
	db 42, PARAS
	db 42, MAGNEMITE
	db 42, MANKEY
	db 42, CUBONE
	db 42, ABRA
	db 42, RHYHORN
else
	db 42, CROBAT
	db 42, GOLEM
	db 42, PARASECT
	db 42, MAGNETON
	db 42, PRIMEAPE
	db 42, MAROWAK
	db 42, UNOWN
	db 42, RHYDON
endc
	end_grass_wildmons

	def_grass_wildmons SAFARI_ZONE
	db 14 percent, 14 percent, 14 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 28, YANMA
	db 28, RATTATA
	db 1, BULBASAUR
	db 1, CHIKORITA
	db 1, CHARMANDER
	db 1, CYNDAQUIL
	db 19, MANKEY
	db 45, SUNKERN
else
	db 28, YANMA
	db 28, FLOGISTAN
	db 1, BULBASAUR
	db 1, CHIKORITA
	db 1, CHARMANDER
	db 1, CYNDAQUIL
	db 19, AIPOM
	db 45, SUNKERN
endc
	; day
if DEF(_LITTLE_CUP)
	db 30, PARAS
	db 30, RHYHORN
	db 30, RATTATA
	db 30, SENTRET
	db 33, SCYTHER
	db 33, KRABBY
	db 19, CHANSEY
	db 21, CUBONE
else
	db 30, PARAS
	db 30, RHYHORN
	db 30, TAUROS
	db 30, MILTANK
	db 33, SCYTHER
	db 33, PINSIR
	db 19, CHANSEY
	db 21, KANGASKHAN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 30, GASTLY
	db 30, RATTATA
	db 30, CUBONE
	db 30, DROWZEE
	db 33, GASTLY
	db 33, RATTATA
	db 30, VENONAT
	db 28, YANMA
else
	db 30, HAUNTER
	db 30, GIRAFARIG
	db 30, MAROWAK
	db 30, HYPNO
	db 33, MISDREAVUS
	db 33, RATICATE
	db 30, VENOMOTH
	db 28, YANMEGA
endc
	end_grass_wildmons

	def_grass_wildmons TOHJO_FALLS
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 20, ZUBAT
	db 20, RATTATA
	db 22, ZUBAT
	db 18, RATTATA
	db 26, ZUBAT
	db 24, GEODUDE
	db 22, ABRA
	db 23, MARILL
else
	db 20, ZUBAT
	db 20, RATICATE
	db 22, GOLBAT
	db 18, RATTATA
	db 26, GLIGAR
	db 24, GRAVELER
	db 22, KADABRA
	db 23, MARILL
endc
	; day
if DEF(_LITTLE_CUP)
	db 20, ZUBAT
	db 20, RATTATA
	db 22, ZUBAT
	db 18, RATTATA
	db 26, ZUBAT
	db 24, GEODUDE
	db 22, ABRA
	db 23, MARILL
else
	db 20, ZUBAT
	db 20, RATICATE
	db 22, GOLBAT
	db 18, RATTATA
	db 26, GLIGAR
	db 24, GRAVELER
	db 22, KADABRA
	db 23, MARILL
endc
	; nite
if DEF(_LITTLE_CUP)
	db 20, ZUBAT
	db 20, RATTATA
	db 22, ZUBAT
	db 18, RATTATA
	db 26, ZUBAT
	db 24, GEODUDE
	db 22, ABRA
	db 23, MARILL
else
	db 20, ZUBAT
	db 20, RATICATE
	db 22, GOLBAT
	db 18, RATTATA
	db 26, GLIGAR
	db 24, GRAVELER
	db 22, KADABRA
	db 23, MARILL
endc
	end_grass_wildmons

	def_grass_wildmons MEW_ANTECHAMBER
	db 4 percent, 2 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 24, EEVEE
	db 20, GROWLITHE
	db 23, NATU
	db 20, BULBASAUR
	db 20, CHIKORITA
	db 20, CYNDAQUIL
	db 1, ABRA
else
	db 24, UNOWN
	db 24, DITTO
	db 20, SMEARGLE
	db 23, XATU
	db 20, IVYSAUR
	db 20, BAYLEEF
	db 20, QUILAVA
	db 1, UNOWN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 28, EEVEE
	db 20, GROWLITHE
	db 22, NATU
	db 21, BULBASAUR
	db 21, CHIKORITA
	db 19, CYNDAQUIL
	db 1, ABRA
else
	db 24, UNOWN
	db 28, DITTO
	db 20, SMEARGLE
	db 22, XATU
	db 21, IVYSAUR
	db 21, BAYLEEF
	db 19, QUILAVA
	db 1, UNOWN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 26, GASTLY
	db 20, HOUNDOUR
	db 24, NATU
	db 19, BULBASAUR
	db 19, CHIKORITA
	db 21, CYNDAQUIL
	db 1, ABRA
else
	db 24, UNOWN
	db 26, HAUNTER
	db 20, SMEARGLE
	db 24, XATU
	db 19, IVYSAUR
	db 19, BAYLEEF
	db 21, QUILAVA
	db 1, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 35, GEODUDE
	db 35, RHYHORN
	db 34, ONIX
	db 34, ZUBAT
	db 35, SANDSHREW
	db 35, TEDDIURSA
	db 40, ONIX
	db 41, RHYHORN
else
	db 35, GRAVELER
	db 35, RHYHORN
	db 34, ONIX
	db 34, GOLBAT
	db 35, SANDSLASH
	db 35, SNORLAX
	db 40, STEELIX
	db 41, RHYDON
endc
	; day
if DEF(_LITTLE_CUP)
	db 35, GEODUDE
	db 35, RHYHORN
	db 34, ONIX
	db 34, ZUBAT
	db 35, SANDSHREW
	db 35, MACHOP
	db 40, ONIX
	db 41, RHYHORN
else
	db 35, GRAVELER
	db 35, RHYHORN
	db 34, ONIX
	db 34, GOLBAT
	db 35, SANDSLASH
	db 35, MACHOKE
	db 40, STEELIX
	db 41, RHYDON
endc
	; nite
if DEF(_LITTLE_CUP)
	db 35, GEODUDE
	db 35, RHYHORN
	db 34, ONIX
	db 34, ZUBAT
	db 35, SANDSHREW
	db 35, EKANS
	db 40, ONIX
	db 41, RHYHORN
else
	db 35, GRAVELER
	db 35, RHYHORN
	db 34, ONIX
	db 34, GOLBAT
	db 35, SANDSLASH
	db 35, ARBOK
	db 40, STEELIX
	db 41, RHYDON
endc
	end_grass_wildmons

	db -1 ; end
