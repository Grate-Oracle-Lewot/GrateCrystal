; Johto Pokémon in grass

JohtoGrassWildMons:

	def_grass_wildmons ROUTE_29
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 1, PIDGEY
	db 1, SENTRET
	db 1, RATTATA
	db 1, RATTATA
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 1, HOPPIP
	db 1, LEDYBA
	db 2, LEDYBA
	; day
	db 1, PIDGEY
	db 1, SENTRET
	db 2, PIDGEY
	db 2, SENTRET
	db 1, RATTATA
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 1, HOPPIP
	db 2, HOPPIP
	; nite
	db 1, HOOTHOOT
	db 1, RATTATA
	db 2, HOOTHOOT
	db 2, RATTATA
	db 1, SENTRET
if DEF(_LITTLE_CUP)
	db 1, RATTATA
else
	db 1, FLOGISTAN
endc
	db 1, SPINARAK
	db 2, SPINARAK
	end_grass_wildmons

	def_grass_wildmons ROUTE_30
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 1, CATERPIE
if DEF(_LITTLE_CUP)
	db 2, CATERPIE
else
	db 2, METAPOD
endc
	db 1, PIDGEY
	db 2, PIDGEY
	db 1, SENTRET
	db 1, RATTATA
	db 1, LEDYBA
	db 2, LEDYBA
	; day
	db 1, CATERPIE
	db 1, WEEDLE
	db 1, PIDGEY
	db 2, PIDGEY
	db 1, SENTRET
	db 2, SENTRET
	db 1, HOPPIP
	db 2, HOPPIP
	; nite
	db 1, WEEDLE
if DEF(_LITTLE_CUP)
	db 2, WEEDLE
else
	db 2, KAKUNA
endc
	db 1, HOOTHOOT
	db 1, ZUBAT
	db 1, RATTATA
	db 1, POLIWAG
	db 1, SPINARAK
	db 2, SPINARAK
	end_grass_wildmons

	def_grass_wildmons ROUTE_31
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, CATERPIE
if DEF(_LITTLE_CUP)
	db 3, CATERPIE
else
	db 3, METAPOD
endc
	db 2, PIDGEY
	db 3, PIDGEY
	db 2, SENTRET
	db 2, RATTATA
	db 2, BELLSPROUT
	db 3, BELLSPROUT
	; day
	db 2, CATERPIE
	db 2, WEEDLE
	db 2, PIDGEY
	db 3, PIDGEY
	db 2, SENTRET
	db 3, SENTRET
	db 2, BELLSPROUT
	db 3, BELLSPROUT
	; nite
	db 2, WEEDLE
if DEF(_LITTLE_CUP)
	db 3, WEEDLE
else
	db 3, KAKUNA
endc
	db 2, HOOTHOOT
	db 2, ZUBAT
	db 2, RATTATA
	db 2, POLIWAG
	db 2, BELLSPROUT
	db 3, BELLSPROUT
	end_grass_wildmons

	def_grass_wildmons ROUTE_32
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 3, EKANS
	db 3, MAREEP
	db 5, BELLSPROUT
	db 4, SENTRET
	db 5, SPEAROW
	db 5, SENTRET
	db 5, PIDGEY
	db 4, COTTONEE
	; day
	db 3, EKANS
	db 3, MAREEP
	db 5, BELLSPROUT
	db 4, RATTATA
	db 5, SPEAROW
	db 5, SENTRET
	db 5, PIDGEY
	db 4, COTTONEE
	; nite
	db 3, WOOPER
	db 3, MAREEP
	db 5, BELLSPROUT
	db 4, RATTATA
	db 5, HOOTHOOT
	db 5, RATTATA
	db 5, ZUBAT
	db 4, COTTONEE
	end_grass_wildmons

	def_grass_wildmons ROUTE_33
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 6, EKANS
	db 6, HOPPIP
	db 7, RATTATA
if DEF(_LITTLE_CUP)
	db 6, RATTATA
else
	db 6, FLOGISTAN
endc
	db 7, SPEAROW
	db 6, SPEAROW
	db 7, PIDGEY
	db 7, GEODUDE
	; day
	db 6, EKANS
	db 6, HOPPIP
	db 7, RATTATA
if DEF(_LITTLE_CUP)
	db 6, RATTATA
else
	db 6, FLOGISTAN
endc
	db 7, SPEAROW
	db 6, SPEAROW
	db 7, PIDGEY
	db 7, GEODUDE
	; nite
	db 6, WOOPER
	db 6, HOPPIP
	db 7, RATTATA
if DEF(_LITTLE_CUP)
	db 6, RATTATA
else
	db 6, FLOGISTAN
endc
	db 7, HOOTHOOT
	db 7, SPEAROW
	db 7, ZUBAT
	db 7, GEODUDE
	end_grass_wildmons

	def_grass_wildmons ROUTE_34
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, PIDGEY
	db 11, RATTATA
	db 12, DROWZEE
	db 10, ABRA
	db 13, RATTATA
if DEF(_LITTLE_CUP)
	db 10, GRIMER
else
	db 10, DITTO
endc
	db 10, SNUBBULL
	db 12, JIGGLYPUFF
	; day
	db 13, PIDGEY
	db 11, RATTATA
	db 12, DROWZEE
	db 10, ABRA
	db 13, RATTATA
if DEF(_LITTLE_CUP)
	db 10, GRIMER
else
	db 10, DITTO
endc
	db 10, SNUBBULL
	db 12, JIGGLYPUFF
	; nite
	db 13, HOOTHOOT
	db 12, DROWZEE
	db 11, RATTATA
	db 10, ABRA
	db 13, RATTATA
	db 12, GRIMER
	db 10, SNUBBULL
	db 12, CLEFAIRY
	end_grass_wildmons

	def_grass_wildmons ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_F
	db 12, NIDORAN_M
	db 13, GROWLITHE
	db 11, ABRA
	db 14, DROWZEE
if DEF(_LITTLE_CUP)
	db 11, GRIMER
else
	db 11, DITTO
endc
	db 12, YANMA
	db 12, JIGGLYPUFF
	; day
	db 12, NIDORAN_F
	db 12, NIDORAN_M
	db 13, GROWLITHE
	db 11, ABRA
	db 14, DROWZEE
if DEF(_LITTLE_CUP)
	db 11, GRIMER
else
	db 11, DITTO
endc
	db 12, YANMA
	db 12, JIGGLYPUFF
	; nite
	db 14, DROWZEE
	db 13, VULPIX
	db 12, NIDORAN_F
	db 12, NIDORAN_M
	db 11, ABRA
	db 9, GRIMER
	db 12, YANMA
	db 12, CLEFAIRY
	end_grass_wildmons

	def_grass_wildmons ROUTE_36
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, GROWLITHE
	db 13, PIDGEY
	db 13, NIDORAN_F
	db 13, NIDORAN_M
	db 11, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 15, GRIMER
	db 15, LEDYBA
	db 13, RATTATA
else
	db 15, DITTO
	db 15, LEDYBA
	db 13, STANTLER
endc
	; day
	db 12, GROWLITHE
	db 15, PIDGEY
	db 13, NIDORAN_F
	db 13, NIDORAN_M
	db 11, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 15, GRIMER
else
	db 15, DITTO
endc
	db 13, HOPPIP
	db 13, ABRA
	; nite
	db 12, VULPIX
	db 14, HOOTHOOT
	db 13, NIDORAN_F
	db 13, NIDORAN_M
	db 11, BELLSPROUT
	db 14, DROWZEE
	db 13, SPINARAK
if DEF(_LITTLE_CUP)
	db 15, RATTATA
else
	db 15, STANTLER
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_37
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 21, RATTATA
	db 21, PIDGEY
	db 23, RATTATA
	db 23, PIDGEY
	db 20, LEDYBA
	db 21, GROWLITHE
	db 23, LEDYBA
else
	db 21, STANTLER
	db 21, PIDGEY
	db 23, STANTLER
	db 23, PIDGEOTTO
	db 20, LEDYBA
	db 21, GROWLITHE
	db 23, LEDIAN
endc
	db 23, GROWLITHE
	; day
	db 21, PONYTA
	db 21, PIDGEY
if DEF(_LITTLE_CUP)
	db 23, RATTATA
	db 23, PIDGEY
else
	db 23, STANTLER
	db 23, PIDGEOTTO
endc
	db 20, COTTONEE
	db 21, GROWLITHE
	db 23, COTTONEE
	db 23, GROWLITHE
	; nite
if DEF(_LITTLE_CUP)
	db 21, RATTATA
	db 21, HOOTHOOT
	db 23, RATTATA
	db 23, HOOTHOOT
	db 20, SPINARAK
	db 21, VULPIX
	db 23, SPINARAK
else
	db 21, STANTLER
	db 21, HOOTHOOT
	db 23, STANTLER
	db 23, NOCTOWL
	db 20, SPINARAK
	db 21, VULPIX
	db 23, ARIADOS
endc
	db 23, VULPIX
	end_grass_wildmons

	def_grass_wildmons ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SENTRET
if DEF(_LITTLE_CUP)
	db 23, PIDGEY
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, SENTRET
	db 20, SENTRET
	db 20, RATTATA
else
	db 23, PIDGEOTTO
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, FURRET
	db 20, MILTANK
	db 20, TAUROS
endc
	; day
	db 23, RATTATA
	db 23, PIDGEY
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, PONYTA
	db 20, SENTRET
	db 20, RATTATA
	; nite
	db 23, RATTATA
if DEF(_LITTLE_CUP)
	db 23, HOOTHOOT
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, RATTATA
	db 19, PSYDUCK
	db 22, RATTATA
else
	db 23, NOCTOWL
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, RATICATE
	db 19, FARFETCH_D
	db 22, STANTLER
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_39
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SENTRET
if DEF(_LITTLE_CUP)
	db 23, PIDGEY
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 24, SENTRET
	db 22, SENTRET
	db 22, RATTATA
else
	db 23, PIDGEOTTO
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 24, FURRET
	db 22, MILTANK
	db 22, TAUROS
endc
	; day
	db 23, RATTATA
if DEF(_LITTLE_CUP)
	db 23, PIDGEY
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, PONYTA
	db 22, SENTRET
	db 22, RATTATA
else
	db 23, PIDGEOTTO
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 23, PONYTA
	db 22, MILTANK
	db 22, TAUROS
endc
	; nite
	db 23, RATTATA
if DEF(_LITTLE_CUP)
	db 23, HOOTHOOT
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 24, RATTATA
	db 21, PSYDUCK
	db 23, RATTATA
else
	db 23, NOCTOWL
	db 23, MAGNEMITE
	db 23, SNUBBULL
	db 23, MEOWTH
	db 24, RATICATE
	db 21, FARFETCH_D
	db 23, STANTLER
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_42
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SPEAROW
	db 23, MAREEP
	db 22, MANKEY
	db 22, EKANS
if DEF(_LITTLE_CUP)
	db 22, EKANS
	db 23, SPEAROW
else
	db 22, ARBOK
	db 23, FEAROW
endc
	db 23, COTTONEE
	db 23, MARILL
	; day
	db 23, SPEAROW
	db 23, MAREEP
	db 22, MANKEY
	db 22, EKANS
if DEF(_LITTLE_CUP)
	db 22, EKANS
	db 23, SPEAROW
else
	db 22, ARBOK
	db 23, FEAROW
endc
	db 22, COTTONEE
	db 23, MARILL
	; nite
	db 22, MANKEY
	db 22, RATTATA
	db 23, MAREEP
	db 23, ZUBAT
if DEF(_LITTLE_CUP)
	db 22, RATTATA
	db 23, ZUBAT
	db 22, RATTATA
else
	db 22, RATICATE
	db 23, GOLBAT
	db 22, GIRAFARIG
endc
	db 23, CLEFAIRY
	end_grass_wildmons

	def_grass_wildmons ROUTE_43
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SENTRET
if DEF(_LITTLE_CUP)
	db 23, PSYDUCK
	db 23, MAREEP
	db 23, MAREEP
	db 24, SENTRET
	db 23, DODUO
	db 23, COTTONEE
	db 23, RATTATA
else
	db 23, FARFETCH_D
	db 23, MAREEP
	db 23, FLAAFFY
	db 24, FURRET
	db 23, DODUO
	db 23, COTTONEE
	db 23, GIRAFARIG
endc
	; day
	db 23, SENTRET
if DEF(_LITTLE_CUP)
	db 23, PIDGEY
	db 23, MAREEP
	db 23, MAREEP
	db 24, SENTRET
	db 23, DODUO
	db 23, COTTONEE
	db 23, RATTATA
else
	db 23, PIDGEOTTO
	db 23, MAREEP
	db 23, FLAAFFY
	db 24, FURRET
	db 23, DODUO
	db 23, COTTONEE
	db 23, GIRAFARIG
endc
	; nite
	db 23, RATTATA
if DEF(_LITTLE_CUP)
	db 23, HOOTHOOT
	db 22, RATTATA
	db 24, RATTATA
	db 24, RATTATA
	db 23, DODUO
	db 23, MAREEP
	db 23, MAREEP
else
	db 23, NOCTOWL
	db 22, GIRAFARIG
	db 24, GIRAFARIG
	db 24, RATICATE
	db 23, DODUO
	db 23, MAREEP
	db 23, FLAAFFY
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_44
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 28, BELLSPROUT
	db 28, SENTRET
	db 30, BELLSPROUT
	db 31, SENTRET
	db 28, SUNKERN
	db 31, EXEGGCUTE
	db 30, PIKACHU
	db 32, PIKACHU
else
	db 28, WEEPINBELL
	db 28, LICKITUNG
	db 30, WEEPINBELL
	db 31, LICKITUNG
	db 28, TANGELA
	db 31, EXEGGCUTE
	db 30, ELECTABUZZ
	db 32, ELECTABUZZ
endc
	; day
if DEF(_LITTLE_CUP)
	db 28, BELLSPROUT
	db 28, SENTRET
	db 30, BELLSPROUT
	db 31, SENTRET
	db 28, SUNKERN
	db 31, EXEGGCUTE
	db 30, PIKACHU
	db 32, PIKACHU
else
	db 28, WEEPINBELL
	db 28, LICKITUNG
	db 30, WEEPINBELL
	db 31, LICKITUNG
	db 28, TANGELA
	db 31, EXEGGCUTE
	db 30, ELECTABUZZ
	db 32, ELECTABUZZ
endc
	; nite
if DEF(_LITTLE_CUP)
	db 28, BELLSPROUT
	db 28, POLIWAG
	db 30, BELLSPROUT
	db 31, POLIWAG
	db 28, SUNKERN
	db 31, EXEGGCUTE
	db 30, PIKACHU
	db 32, PIKACHU
else
	db 28, WEEPINBELL
	db 28, POLIWHIRL
	db 30, WEEPINBELL
	db 31, POLIWAG
	db 28, TANGELA
	db 31, EXEGGCUTE
	db 30, ELECTABUZZ
	db 32, ELECTABUZZ
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_45
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 31, GEODUDE
if DEF(_LITTLE_CUP)
	db 33, GEODUDE
	db 32, ZUBAT
	db 33, SPEAROW
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, PHANPY
	db 35, TEDDIURSA
else
	db 33, GRAVELER
	db 32, GLIGAR
	db 33, SKARMORY
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, DONPHAN
	db 35, URSARING
endc
	; day
	db 31, GEODUDE
if DEF(_LITTLE_CUP)
	db 33, GEODUDE
	db 32, ZUBAT
	db 33, SPEAROW
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, PHANPY
	db 35, TEDDIURSA
else
	db 33, GRAVELER
	db 32, GLIGAR
	db 33, SKARMORY
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, DONPHAN
	db 35, URSARING
endc
	; nite
	db 31, GEODUDE
if DEF(_LITTLE_CUP)
	db 33, GEODUDE
	db 32, ZUBAT
	db 33, SPEAROW
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, PHANPY
	db 35, TEDDIURSA
else
	db 33, GRAVELER
	db 32, GLIGAR
	db 33, SKARMORY
	db 23, PHANPY
	db 23, TEDDIURSA
	db 35, DONPHAN
	db 35, URSARING
endc
	end_grass_wildmons

	def_grass_wildmons ROUTE_46
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, PHANPY
	db 2, JIGGLYPUFF
	db 2, SENTRET
	db 2, RATTATA
	db 2, PIDGEY
if DEF(_LITTLE_CUP)
	db 2, RATTATA
else
	db 2, FLOGISTAN
endc
	db 2, GEODUDE
	db 2, SPEAROW
	; day
	db 2, PHANPY
	db 2, JIGGLYPUFF
	db 2, SENTRET
	db 3, SENTRET
	db 2, PIDGEY
	db 3, PIDGEY
	db 2, GEODUDE
	db 2, SPEAROW
	; nite
	db 2, PHANPY
	db 2, CLEFAIRY
	db 2, RATTATA
	db 3, RATTATA
	db 2, HOOTHOOT
	db 3, HOOTHOOT
	db 3, GEODUDE
	db 3, SPEAROW
	end_grass_wildmons

	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 2, GEODUDE
	db 2, ZUBAT
	db 3, GEODUDE
	db 3, ZUBAT
	db 2, CUBONE
	db 2, GASTLY
	db 2, TEDDIURSA
	db 3, TEDDIURSA
	; day
	db 2, GEODUDE
	db 2, ZUBAT
	db 3, GEODUDE
	db 3, ZUBAT
	db 2, CUBONE
	db 2, GASTLY
	db 2, TEDDIURSA
	db 3, TEDDIURSA
	; nite
	db 2, GEODUDE
	db 3, ZUBAT
	db 2, RATTATA
	db 3, RATTATA
	db 2, CUBONE
	db 2, GASTLY
	db 2, LARVITAR
	db 3, LARVITAR
	end_grass_wildmons

	def_grass_wildmons DARK_CAVE_BLACKTHORN_ENTRANCE
	db 4 percent, 4 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 30, GEODUDE
	db 28, ZUBAT
if DEF(_LITTLE_CUP)
	db 32, GEODUDE
	db 31, ZUBAT
	db 33, ABRA
	db 31, TEDDIURSA
	db 29, ABRA
else
	db 32, GRAVELER
	db 31, GOLBAT
	db 33, WOBBUFFET
	db 31, URSARING
	db 29, WOBBUFFET
endc
	db 34, TEDDIURSA
	; day
	db 30, GEODUDE
	db 28, ZUBAT
if DEF(_LITTLE_CUP)
	db 32, GEODUDE
	db 31, ZUBAT
	db 33, ABRA
	db 31, TEDDIURSA
	db 29, ABRA
else
	db 32, GRAVELER
	db 31, GOLBAT
	db 33, WOBBUFFET
	db 31, URSARING
	db 29, WOBBUFFET
endc
	db 34, TEDDIURSA
	; nite
	db 30, GEODUDE
if DEF(_LITTLE_CUP)
	db 33, ABRA
	db 32, GEODUDE
	db 31, ZUBAT
	db 28, ZUBAT
	db 27, LARVITAR
	db 30, LARVITAR
	db 31, TEDDIURSA
else
	db 33, WOBBUFFET
	db 32, GRAVELER
	db 31, GOLBAT
	db 28, ZUBAT
	db 27, LARVITAR
	db 30, PUPITAR
	db 31, URSARING
endc
	end_grass_wildmons

	def_grass_wildmons SPROUT_TOWER_2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 2, RATTATA
	db 2, BELLSPROUT
	db 3, RATTATA
	db 4, RATTATA
	db 2, HOPPIP
	db 3, HOPPIP
	db 2, COTTONEE
if DEF(_LITTLE_CUP)
	db 2, BELLSPROUT
else
	db 2, SUDOWOODO
endc
	; day
	db 2, RATTATA
	db 2, BELLSPROUT
	db 3, RATTATA
	db 4, RATTATA
	db 2, HOPPIP
	db 3, HOPPIP
	db 2, COTTONEE
if DEF(_LITTLE_CUP)
	db 2, BELLSPROUT
else
	db 2, SUDOWOODO
endc
	; nite
	db 2, GASTLY
	db 2, BELLSPROUT
	db 3, GASTLY
	db 4, GASTLY
	db 2, ODDISH
	db 3, ODDISH
	db 2, COTTONEE
if DEF(_LITTLE_CUP)
	db 2, BELLSPROUT
else
	db 2, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons SPROUT_TOWER_3F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 2, RATTATA
	db 3, BELLSPROUT
	db 3, RATTATA
	db 4, RATTATA
	db 3, HOPPIP
	db 4, HOPPIP
	db 3, COTTONEE
if DEF(_LITTLE_CUP)
	db 3, BELLSPROUT
else
	db 3, SUDOWOODO
endc
	; day
	db 2, RATTATA
	db 3, BELLSPROUT
	db 3, RATTATA
	db 4, RATTATA
	db 3, HOPPIP
	db 4, HOPPIP
	db 3, COTTONEE
if DEF(_LITTLE_CUP)
	db 3, BELLSPROUT
else
	db 3, SUDOWOODO
endc
	; nite
	db 2, GASTLY
	db 3, BELLSPROUT
	db 3, GASTLY
	db 4, GASTLY
	db 3, ODDISH
	db 4, ODDISH
	db 3, COTTONEE
if DEF(_LITTLE_CUP)
	db 3, BELLSPROUT
else
	db 3, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons RUINS_OF_ALPH_OUTSIDE
	db 5 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, SENTRET
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, GROWLITHE
	db 19, GROWLITHE
	db 26, EEVEE
	db 25, CUBONE
else
	db 24, LICKITUNG
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, SMEARGLE
	db 19, SMEARGLE
	db 26, EEVEE
	db 25, KANGASKHAN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, SENTRET
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, GROWLITHE
	db 19, GROWLITHE
	db 26, EEVEE
	db 25, CUBONE
else
	db 24, LICKITUNG
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, SMEARGLE
	db 19, SMEARGLE
	db 26, EEVEE
	db 25, KANGASKHAN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, SENTRET
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, HOUNDOUR
	db 19, HOUNDOUR
	db 26, EEVEE
	db 25, CUBONE
else
	db 24, LICKITUNG
	db 28, NATU
	db 30, NATU
	db 32, NATU
	db 9, SMEARGLE
	db 19, SMEARGLE
	db 26, EEVEE
	db 25, KANGASKHAN
endc
	end_grass_wildmons

	def_grass_wildmons RUINS_OF_ALPH_INNER_CHAMBER
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
if DEF(_LITTLE_CUP)
	db 1, ABRA
	db 2, ABRA
	db 3, ABRA
	db 4, ABRA
	db 5, ABRA
	db 6, ABRA
	db 7, ABRA
	db 8, ABRA
	; day
	db 1, ABRA
	db 2, ABRA
	db 3, ABRA
	db 4, ABRA
	db 5, ABRA
	db 6, ABRA
	db 7, ABRA
	db 8, ABRA
	; nite
	db 2, ABRA
	db 3, ABRA
	db 4, ABRA
	db 5, ABRA
	db 6, ABRA
	db 7, ABRA
	db 8, ABRA
	db 9, ABRA
else
	; morn
	db 1, UNOWN
	db 2, UNOWN
	db 3, UNOWN
	db 4, UNOWN
	db 5, UNOWN
	db 6, UNOWN
	db 7, UNOWN
	db 8, UNOWN
	; day
	db 1, UNOWN
	db 2, UNOWN
	db 3, UNOWN
	db 4, UNOWN
	db 5, UNOWN
	db 6, UNOWN
	db 7, UNOWN
	db 8, UNOWN
	; nite
	db 2, UNOWN
	db 3, UNOWN
	db 4, UNOWN
	db 5, UNOWN
	db 6, UNOWN
	db 7, UNOWN
	db 8, UNOWN
	db 9, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 4, GEODUDE
	db 4, SANDSHREW
	db 3, ZUBAT
	db 5, ZUBAT
	db 4, ONIX
	db 5, ONIX
	db 4, RHYHORN
	db 5, SANDSHREW
	; day
	db 4, GEODUDE
	db 4, SANDSHREW
	db 3, ZUBAT
	db 5, ZUBAT
	db 4, ONIX
	db 5, ONIX
	db 4, RHYHORN
	db 5, SANDSHREW
	; nite
	db 4, GEODUDE
	db 4, WOOPER
	db 3, ZUBAT
	db 5, ZUBAT
	db 4, ONIX
	db 5, ONIX
	db 4, RHYHORN
	db 5, WOOPER
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 5, GEODUDE
	db 5, SANDSHREW
	db 4, ZUBAT
	db 6, ZUBAT
	db 5, ONIX
	db 6, CUBONE
	db 5, RHYHORN
	db 6, SANDSHREW
	; day
	db 5, GEODUDE
	db 5, SANDSHREW
	db 4, ZUBAT
	db 6, ZUBAT
	db 5, ONIX
	db 6, ONIX
	db 5, RHYHORN
	db 6, SANDSHREW
	; nite
	db 5, GEODUDE
	db 5, WOOPER
	db 4, ZUBAT
	db 6, ZUBAT
	db 5, ONIX
	db 6, ONIX
	db 5, RHYHORN
	db 6, WOOPER
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_B2F
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 20, GEODUDE
	db 21, SANDSHREW
	db 19, ZUBAT
	db 21, ZUBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 23, CUBONE
else
	db 20, GRAVELER
	db 21, SANDSLASH
	db 19, ZUBAT
	db 21, GOLBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 23, KANGASKHAN
endc
	; day
if DEF(_LITTLE_CUP)
	db 20, GEODUDE
	db 21, SANDSHREW
	db 19, ZUBAT
	db 21, ZUBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 22, CUBONE
else
	db 20, GRAVELER
	db 21, SANDSLASH
	db 19, ZUBAT
	db 21, GOLBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 22, KANGASKHAN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 20, GEODUDE
	db 21, WOOPER
	db 19, ZUBAT
	db 21, ZBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 22, CUBONE
else
	db 20, GRAVELER
	db 21, QUAGSIRE
	db 19, ZUBAT
	db 21, GOLBAT
	db 20, ONIX
	db 21, ONIX
	db 22, RHYHORN
	db 22, KANGASKHAN
endc
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_SLOWPOKE_WELL_LINK
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 20, SLOWPOKE
	db 23, DIGLETT
	db 19, ZUBAT
if DEF(_LITTLE_CUP)
	db 21, ZUBAT
	db 20, GEODUDE
	db 21, ONIX
	db 22, SLOWPOKE
	db 22, SLOWPOKE
else
	db 21, GOLBAT
	db 20, GRAVELER
	db 21, ONIX
	db 22, SLOWBRO
	db 22, SLOWKING
endc
	; day
	db 20, SLOWPOKE
	db 23, DIGLETT
	db 19, ZUBAT
if DEF(_LITTLE_CUP)
	db 21, ZUBAT
	db 20, GEODUDE
	db 21, ONIX
	db 22, SLOWPOKE
	db 22, SLOWPOKE
else
	db 21, GOLBAT
	db 20, GRAVELER
	db 21, ONIX
	db 22, SLOWBRO
	db 22, SLOWKING
endc
	; nite
	db 20, SLOWPOKE
if DEF(_LITTLE_CUP)
	db 23, WOOPER
	db 19, ZUBAT
	db 21, ZUBAT
	db 20, GEODUDE
	db 21, ONIX
	db 22, SLOWPOKE
	db 22, SLOWPOKE
else
	db 23, QUAGSIRE
	db 19, ZUBAT
	db 21, GOLBAT
	db 20, GRAVELER
	db 21, ONIX
	db 22, SLOWBRO
	db 22, SLOWKING
endc
	end_grass_wildmons

	def_grass_wildmons SLOWPOKE_WELL_B1F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 4, SLOWPOKE
	db 4, SLUGMA
	db 5, SLOWPOKE
	db 5, DIGLETT
	db 6, SLOWPOKE
	db 6, SLUGMA
	db 5, SHELLDER
if DEF(_LITTLE_CUP)
	db 9, SLOWPOKE
else
	db 9, MR__MIME
endc
	; day
	db 4, SLOWPOKE
	db 4, SLUGMA
	db 5, SLOWPOKE
	db 5, DIGLETT
	db 6, SLOWPOKE
	db 6, SLUGMA
	db 4, SHELLDER
if DEF(_LITTLE_CUP)
	db 4, SLOWPOKE
else
	db 4, MR__MIME
endc
	; nite
	db 4, SLOWPOKE
	db 4, ZUBAT
	db 5, SLOWPOKE
	db 5, DIGLETT
	db 6, SLOWPOKE
	db 6, ZUBAT
	db 7, SHELLDER
if DEF(_LITTLE_CUP)
	db 3, SLOWPOKE
else
	db 3, MR__MIME
endc
	end_grass_wildmons

	def_grass_wildmons SLOWPOKE_WELL_B2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 17, SLOWPOKE
	db 17, SLUGMA
	db 19, SLOWPOKE
	db 20, SLUGMA
	db 21, SLOWPOKE
if DEF(_LITTLE_CUP)
	db 23, DIGLETT
	db 17, SHELLDER
	db 24, SLOWPOKE
else
	db 23, DUGTRIO
	db 17, SHELLDER
	db 24, MR__MIME
endc
	; day
	db 17, SLOWPOKE
	db 17, SLUGMA
	db 19, SLOWPOKE
	db 20, SLUGMA
	db 21, SLOWPOKE
if DEF(_LITTLE_CUP)
	db 23, DIGLETT
	db 19, SHELLDER
	db 19, SLOWPOKE
else
	db 23, DUGTRIO
	db 19, SHELLDER
	db 19, MR__MIME
endc
	; nite
	db 17, SLOWPOKE
	db 17, ZUBAT
	db 19, SLOWPOKE
	db 20, ZUBAT
	db 21, SLOWPOKE
if DEF(_LITTLE_CUP)
	db 23, DIGLETT
	db 23, SHELLDER
	db 17, SLOWPOKE
else
	db 23, DUGTRIO
	db 23, SHELLDER
	db 17, MR__MIME
endc
	end_grass_wildmons

	def_grass_wildmons ILEX_FOREST
	db 4 percent, 5 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 7, CATERPIE
	db 7, WEEDLE
if DEF(_LITTLE_CUP)
	db 8, CATERPIE
	db 8, WEEDLE
else
	db 8, METAPOD
	db 8, KAKUNA
endc
	db 7, PIDGEY
	db 6, PARAS
	db 7, PARAS
	db 6, CHIKORITA
	; day
	db 6, CATERPIE
	db 6, WEEDLE
if DEF(_LITTLE_CUP)
	db 8, CATERPIE
	db 8, WEEDLE
else
	db 8, METAPOD
	db 8, KAKUNA
endc
	db 7, PIDGEY
	db 6, PARAS
	db 7, PARAS
	db 6, PIKACHU
	; nite
	db 6, ODDISH
	db 7, VENONAT
	db 7, ODDISH
	db 6, PSYDUCK
	db 7, HOOTHOOT
	db 6, PARAS
	db 7, MANKEY
	db 5, BULBASAUR
	end_grass_wildmons

	def_grass_wildmons NATIONAL_PARK
	db 10 percent, 10 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 9, SUNKERN
	db 12, SUNKERN
	db 10, NIDORAN_F
	db 10, NIDORAN_M
	db 8, CATERPIE
	db 8, WEEDLE
	db 11, EXEGGCUTE
	db 10, CHANSEY
	; day
	db 9, SUNKERN
	db 12, SUNKERN
	db 10, NIDORAN_F
	db 10, NIDORAN_M
	db 8, CATERPIE
	db 8, WEEDLE
	db 10, EXEGGCUTE
	db 11, CHANSEY
	; nite
	db 9, ODDISH
	db 12, ODDISH
	db 8, VENONAT
	db 10, VENONAT
	db 8, PSYDUCK
	db 10, PSYDUCK
	db 13, EXEGGCUTE
	db 6, CHANSEY
	end_grass_wildmons

	def_grass_wildmons BURNED_TOWER_1F
	db 4 percent, 3 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 11, RATTATA
	db 12, KOFFING
	db 13, RATTATA
	db 14, KOFFING
if DEF(_LITTLE_CUP)
	db 13, RATTATA
	db 14, CHARMANDER
	db 11, CHARMANDER
else
	db 13, RATICATE
	db 14, MAGMAR
	db 11, MAGMAR
endc
	db 11, CHARMANDER
	; day
	db 11, RATTATA
	db 12, KOFFING
	db 13, RATTATA
	db 14, KOFFING
if DEF(_LITTLE_CUP)
	db 13, RATTATA
	db 13, CHARMANDER
	db 14, CHARMANDER
	db 14, EEVEE
else
	db 13, RATICATE
	db 13, MAGMAR
	db 14, MAGMAR
	db 14, FLAREON
endc
	; nite
if DEF(_LITTLE_CUP)
	db 11, GASTLY
	db 12, KOFFING
	db 13, GASTLY
	db 14, KOFFING
	db 14, CUBONE
	db 12, ZUBAT
	db 14, ZUBAT
else
	db 11, MISDREAVUS
	db 12, KOFFING
	db 13, MISDREAVUS
	db 14, KOFFING
	db 14, MAROWAK
	db 12, MURKROW
	db 14, MURKROW
endc
	db 12, HOUNDOUR
	end_grass_wildmons

	def_grass_wildmons BURNED_TOWER_B1F
	db 6 percent, 5 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 12, RATTATA
	db 12, KOFFING
	db 14, RATTATA
	db 15, KOFFING
if DEF(_LITTLE_CUP)
	db 15, KOFFING
	db 14, CHARMANDER
	db 13, CHARMANDER
else
	db 15, WEEZING
	db 14, MAGMAR
	db 13, MAGMAR
endc
	db 11, CYNDAQUIL
	; day
	db 12, RATTATA
	db 12, KOFFING
	db 14, RATTATA
	db 15, KOFFING
if DEF(_LITTLE_CUP)
	db 15, KOFFING
	db 15, CHARMANDER
	db 17, CHARMANDER
	db 16, EEVEE
else
	db 15, WEEZING
	db 15, MAGMAR
	db 17, MAGMAR
	db 16, FLAREON
endc
	; nite
if DEF(_LITTLE_CUP)
	db 12, GASTLY
	db 12, KOFFING
	db 15, CUBONE
	db 15, KOFFING
	db 17, GASTLY
	db 13, ZUBAT
	db 14, ZUBAT
else
	db 12, MISDREAVUS
	db 12, KOFFING
	db 15, MAROWAK
	db 15, KOFFING
	db 17, MISDREAVUS
	db 13, MURKROW
	db 14, MURKROW
endc
	db 18, HOUNDOUR
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 18, RATTATA
	db 18, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 19, EEVEE
	db 19, MEOWTH
	db 19, PINECO
	db 21, SCYTHER
	db 18, BELLSPROUT
	db 21, BELLSPROUT
else
	db 19, ESPEON
	db 19, MEOWTH
	db 19, FORRETRESS
	db 21, SCIZOR
	db 18, SUDOWOODO
	db 21, SUDOWOODO
endc
	; day
	db 18, RATTATA
	db 18, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 19, EEVEE
	db 19, MEOWTH
	db 19, PINECO
	db 21, SCYTHER
	db 18, BELLSPROUT
	db 21, BELLSPROUT
else
	db 19, ESPEON
	db 19, MEOWTH
	db 19, FORRETRESS
	db 21, SCIZOR
	db 18, SUDOWOODO
	db 21, SUDOWOODO
endc
	; nite
	db 18, GASTLY
	db 18, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 19, EEVEE
	db 19, MEOWTH
	db 19, PINECO
	db 21, SCYTHER
	db 18, BELLSPROUT
	db 21, BELLSPROUT
else
	db 19, UMBREON
	db 19, MEOWTH
	db 19, FORRETRESS
	db 21, SCIZOR
	db 18, SUDOWOODO
	db 21, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_3F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 19, RATTATA
	db 19, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 20, EEVEE
	db 20, MEOWTH
	db 20, PINECO
	db 22, SCYTHER
	db 19, BELLSPROUT
	db 22, BELLSPROUT
else
	db 20, ESPEON
	db 20, MEOWTH
	db 20, FORRETRESS
	db 22, SCIZOR
	db 19, SUDOWOODO
	db 22, SUDOWOODO
endc
	; day
	db 19, RATTATA
	db 19, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 20, EEVEE
	db 20, MEOWTH
	db 20, PINECO
	db 22, SCYTHER
	db 19, BELLSPROUT
	db 22, BELLSPROUT
else
	db 20, ESPEON
	db 20, MEOWTH
	db 20, FORRETRESS
	db 22, SCIZOR
	db 19, SUDOWOODO
	db 22, SUDOWOODO
endc
	; nite
	db 19, GASTLY
	db 19, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 20, EEVEE
	db 20, MEOWTH
	db 20, PINECO
	db 22, SCYTHER
	db 19, BELLSPROUT
	db 22, BELLSPROUT
else
	db 20, UMBREON
	db 20, MEOWTH
	db 20, FORRETRESS
	db 22, SCIZOR
	db 19, SUDOWOODO
	db 22, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_4F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 20, RATTATA
	db 20, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 21, EEVEE
	db 21, MEOWTH
	db 21, PINECO
	db 23, SCYTHER
	db 20, BELLSPROUT
	db 23, BELLSPROUT
else
	db 21, ESPEON
	db 21, MEOWTH
	db 21, FORRETRESS
	db 23, SCIZOR
	db 20, SUDOWOODO
	db 23, SUDOWOODO
endc
	; day
	db 20, RATTATA
	db 20, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 21, EEVEE
	db 21, MEOWTH
	db 21, PINECO
	db 23, SCYTHER
	db 20, BELLSPROUT
	db 23, BELLSPROUT
else
	db 21, ESPEON
	db 21, MEOWTH
	db 21, FORRETRESS
	db 23, SCIZOR
	db 20, SUDOWOODO
	db 23, SUDOWOODO
endc
	; nite
	db 20, GASTLY
	db 20, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 21, EEVEE
	db 21, MEOWTH
	db 21, PINECO
	db 23, SCYTHER
	db 20, BELLSPROUT
	db 23, BELLSPROUT
else
	db 21, UMBREON
	db 21, MEOWTH
	db 21, FORRETRESS
	db 23, SCIZOR
	db 20, SUDOWOODO
	db 23, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_5F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 21, RATTATA
	db 21, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 22, EEVEE
	db 22, MEOWTH
	db 22, PINECO
	db 24, SCYTHER
	db 21, BELLSPROUT
	db 24, BELLSPROUT
else
	db 22, ESPEON
	db 22, MEOWTH
	db 22, FORRETRESS
	db 24, SCIZOR
	db 21, SUDOWOODO
	db 24, SUDOWOODO
endc
	; day
	db 21, RATTATA
	db 21, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 22, EEVEE
	db 22, MEOWTH
	db 22, PINECO
	db 24, SCYTHER
	db 21, BELLSPROUT
	db 24, BELLSPROUT
else
	db 22, ESPEON
	db 22, MEOWTH
	db 22, FORRETRESS
	db 24, SCIZOR
	db 21, SUDOWOODO
	db 24, SUDOWOODO
endc
	; nite
	db 21, GASTLY
	db 21, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 22, EEVEE
	db 22, MEOWTH
	db 22, PINECO
	db 24, SCYTHER
	db 21, BELLSPROUT
	db 24, BELLSPROUT
else
	db 22, UMBREON
	db 22, MEOWTH
	db 22, FORRETRESS
	db 24, SCIZOR
	db 21, SUDOWOODO
	db 24, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_6F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 22, RATTATA
	db 22, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 23, EEVEE
	db 23, MEOWTH
	db 23, PINECO
	db 25, SCYTHER
	db 22, BELLSPROUT
	db 25, BELLSPROUT
else
	db 23, ESPEON
	db 23, MEOWTH
	db 23, FORRETRESS
	db 25, SCIZOR
	db 22, SUDOWOODO
	db 25, SUDOWOODO
endc
	; day
	db 22, RATTATA
	db 22, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 23, EEVEE
	db 23, MEOWTH
	db 23, PINECO
	db 25, SCYTHER
	db 22, BELLSPROUT
	db 25, BELLSPROUT
else
	db 23, ESPEON
	db 23, MEOWTH
	db 23, FORRETRESS
	db 25, SCIZOR
	db 22, SUDOWOODO
	db 25, SUDOWOODO
endc
	; nite
	db 22, GASTLY
	db 22, BELLSPROUT
if DEF(_LITTLE_CUP)
	db 23, EEVEE
	db 23, MEOWTH
	db 23, PINECO
	db 25, SCYTHER
	db 22, BELLSPROUT
	db 25, BELLSPROUT
else
	db 23, UMBREON
	db 23, MEOWTH
	db 23, FORRETRESS
	db 25, SCIZOR
	db 22, SUDOWOODO
	db 25, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_7F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 23, RATTATA
	db 23, BELLSPROUT
	db 24, EEVEE
	db 24, MEOWTH
	db 24, PINECO
	db 26, SCYTHER
	db 23, BELLSPROUT
	db 26, BELLSPROUT
else
	db 23, RATICATE
	db 23, BELLSPROUT
	db 24, ESPEON
	db 24, MEOWTH
	db 24, FORRETRESS
	db 26, SCIZOR
	db 23, SUDOWOODO
	db 26, SUDOWOODO
endc
	; day
if DEF(_LITTLE_CUP)
	db 23, RATTATA
	db 23, BELLSPROUT
	db 24, EEVEE
	db 24, MEOWTH
	db 24, PINECO
	db 26, SCYTHER
	db 23, BELLSPROUT
	db 26, BELLSPROUT
else
	db 23, RATICATE
	db 23, BELLSPROUT
	db 24, ESPEON
	db 24, MEOWTH
	db 24, FORRETRESS
	db 26, SCIZOR
	db 23, SUDOWOODO
	db 26, SUDOWOODO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 23, GASTLY
	db 23, BELLSPROUT
	db 24, EEVEE
	db 24, MEOWTH
	db 24, PINECO
	db 26, SCYTHER
	db 23, BELLSPROUT
	db 26, BELLSPROUT
else
	db 23, HAUNTER
	db 23, BELLSPROUT
	db 24, UMBREON
	db 24, MEOWTH
	db 24, FORRETRESS
	db 26, SCIZOR
	db 23, SUDOWOODO
	db 26, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_8F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, RATTATA
	db 24, BELLSPROUT
	db 25, EEVEE
	db 25, MEOWTH
	db 25, PINECO
	db 27, SCYTHER
	db 24, ABRA
	db 27, BELLSPROUT
else
	db 24, RATICATE
	db 24, BELLSPROUT
	db 25, ESPEON
	db 25, MEOWTH
	db 25, FORRETRESS
	db 27, SCIZOR
	db 24, UNOWN
	db 27, SUDOWOODO
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, RATTATA
	db 24, BELLSPROUT
	db 25, EEVEE
	db 25, MEOWTH
	db 25, PINECO
	db 27, SCYTHER
	db 24, ABRA
	db 27, BELLSPROUT
else
	db 24, RATICATE
	db 24, BELLSPROUT
	db 25, ESPEON
	db 25, MEOWTH
	db 25, FORRETRESS
	db 27, SCIZOR
	db 24, UNOWN
	db 27, SUDOWOODO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, GASTLY
	db 24, BELLSPROUT
	db 25, EEVEE
	db 25, MEOWTH
	db 25, PINECO
	db 27, SCYTHER
	db 24, ABRA
	db 27, BELLSPROUT
else
	db 24, HAUNTER
	db 24, BELLSPROUT
	db 25, UMBREON
	db 25, MEOWTH
	db 25, FORRETRESS
	db 27, SCIZOR
	db 24, UNOWN
	db 27, SUDOWOODO
endc
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_9F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 22, RATTATA
	db 25, RATTATA
	db 22, RATTATA
	db 25, RATTATA
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 22, RATTATA
	db 25, RATTATA
	db 22, RATICATE
	db 25, RATICATE
	db 26, UNOWN
	db 1, UNOWN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 22, RATTATA
	db 25, RATTATA
	db 22, RATTATA
	db 25, RATTATA
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 22, RATTATA
	db 25, RATTATA
	db 22, RATICATE
	db 25, RATICATE
	db 26, UNOWN
	db 1, UNOWN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 22, GASTLY
	db 26, GASTLY
	db 22, GASTLY
	db 26, GASTLY
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 22, GASTLY
	db 26, GASTLY
	db 22, HAUNTER
	db 26, HAUNTER
	db 26, UNOWN
	db 1, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 20, POLIWAG
	db 21, ZUBAT
	db 22, POLIWAG
	db 23, ZUBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, SEEL
else
	db 20, POLIWHIRL
	db 21, ZUBAT
	db 22, POLIWHIRL
	db 23, GOLBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, LAPRAS
endc
	; day
if DEF(_LITTLE_CUP)
	db 20, POLIWAG
	db 21, ZUBAT
	db 22, POLIWAG
	db 23, ZUBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, TYROGUE
else
	db 20, POLIWHIRL
	db 21, ZUBAT
	db 22, POLIWHIRL
	db 23, GOLBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, HITMONTOP
endc
	; nite
if DEF(_LITTLE_CUP)
	db 20, POLIWAG
	db 21, ZUBAT
	db 22, POLIWAG
	db 23, ZUBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, TYROGUE
else
	db 20, POLIWHIRL
	db 21, ZUBAT
	db 22, POLIWHIRL
	db 23, GOLBAT
	db 20, KRABBY
	db 22, SEEL
	db 22, KRABBY
	db 22, HITMONTOP
endc
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 21, POLIWAG
	db 22, ZUBAT
	db 23, POLIWAG
	db 24, ZUBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, SEEL
else
	db 21, POLIWHIRL
	db 22, ZUBAT
	db 23, POLIWHIRL
	db 24, GOLBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, LAPRAS
endc
	; day
if DEF(_LITTLE_CUP)
	db 21, POLIWAG
	db 22, ZUBAT
	db 23, POLIWAG
	db 24, ZUBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, TYROGUE
else
	db 21, POLIWHIRL
	db 22, ZUBAT
	db 23, POLIWHIRL
	db 24, GOLBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, HITMONTOP
endc
	; nite
if DEF(_LITTLE_CUP)
	db 21, POLIWAG
	db 22, ZUBAT
	db 23, POLIWAG
	db 24, ZUBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, TYROGUE
else
	db 21, POLIWHIRL
	db 22, ZUBAT
	db 23, POLIWHIRL
	db 24, GOLBAT
	db 21, KRABBY
	db 23, SEEL
	db 23, KRABBY
	db 23, HITMONTOP
endc
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_B2F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 22, POLIWAG
	db 23, ZUBAT
	db 24, POLIWAG
	db 25, ZUBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, SEEL
else
	db 22, POLIWHIRL
	db 23, ZUBAT
	db 24, POLIWHIRL
	db 25, GOLBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, LAPRAS
endc
	; day
if DEF(_LITTLE_CUP)
	db 22, POLIWAG
	db 23, ZUBAT
	db 24, POLIWAG
	db 25, ZUBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, TYROGUE
else
	db 22, POLIWHIRL
	db 23, ZUBAT
	db 24, POLIWHIRL
	db 25, GOLBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, HITMONTOP
endc
	; nite
if DEF(_LITTLE_CUP)
	db 22, POLIWAG
	db 23, ZUBAT
	db 24, POLIWAG
	db 25, ZUBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, TYROGUE
else
	db 22, POLIWHIRL
	db 23, ZUBAT
	db 24, POLIWHIRL
	db 25, GOLBAT
	db 22, KRABBY
	db 24, SEEL
	db 24, KRABBY
	db 24, HITMONTOP
endc
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_LUGIA_CHAMBER
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 25, ZUBAT
	db 25, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 25, ZUBAT
	db 25, ZUBAT
	db 25, GOLBAT
	db 26, GOLBAT
	db 26, UNOWN
	db 1, UNOWN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 24, ZUBAT
	db 25, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 24, ZUBAT
	db 25, ZUBAT
	db 25, GOLBAT
	db 26, GOLBAT
	db 26, UNOWN
	db 1, UNOWN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, ABRA
	db 25, ABRA
	db 24, ZUBAT
	db 25, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 26, ABRA
	db 1, ABRA
else
	db 24, UNOWN
	db 25, UNOWN
	db 24, ZUBAT
	db 25, ZUBAT
	db 25, GOLBAT
	db 26, GOLBAT
	db 26, UNOWN
	db 1, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 22, MACHOP
	db 22, GEODUDE
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 21, ONIX
if DEF(_LITTLE_CUP)
	db 24, RATTATA
else
	db 24, RATICATE
endc
	db 22, MARILL
	; day
	db 22, MACHOP
	db 22, GEODUDE
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 21, ONIX
if DEF(_LITTLE_CUP)
	db 24, RATTATA
else
	db 24, RATICATE
endc
	db 22, MARILL
	; nite
	db 22, MACHOP
	db 22, GEODUDE
if DEF(_LITTLE_CUP)
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 21, ONIX
	db 24, RATTATA
else
	db 21, GOLBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 21, ONIX
	db 24, RATICATE
endc
	db 22, MARILL
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 22, MACHOP
	db 22, GEODUDE
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 23, ONIX
if DEF(_LITTLE_CUP)
	db 24, RATTATA
else
	db 24, RATICATE
endc
	db 22, MARILL
	; day
	db 22, MACHOP
	db 22, GEODUDE
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 23, ONIX
if DEF(_LITTLE_CUP)
	db 24, RATTATA
else
	db 24, RATICATE
endc
	db 22, MARILL
	; nite
	db 22, MACHOP
	db 22, GEODUDE
if DEF(_LITTLE_CUP)
	db 21, ZUBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 23, ONIX
	db 24, RATTATA
else
	db 21, GOLBAT
	db 23, ZUBAT
	db 22, RATTATA
	db 23, ONIX
	db 24, RATICATE
endc
	db 22, MARILL
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_2F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 30, MACHOP
	db 29, GEODUDE
	db 28, ZUBAT
	db 28, RATTATA
	db 28, TYROGUE
	db 28, TYROGUE
	db 28, TYROGUE
else
	db 30, MACHOKE
	db 29, GRAVELER
	db 28, GOLBAT
	db 28, RATICATE
	db 28, HITMONLEE
	db 28, HITMONCHAN
	db 28, HITMONTOP
endc
	db 26, MARILL
	; day
if DEF(_LITTLE_CUP)
	db 30, MACHOP
	db 29, GEODUDE
	db 28, ZUBAT
	db 28, RATTATA
	db 28, TYROGUE
	db 28, TYROGUE
	db 28, TYROGUE
else
	db 30, MACHOKE
	db 29, GRAVELER
	db 28, GOLBAT
	db 28, RATICATE
	db 28, HITMONLEE
	db 28, HITMONCHAN
	db 28, HITMONTOP
endc
	db 26, MARILL
	; nite
if DEF(_LITTLE_CUP)
	db 30, MACHOP
	db 29, GEODUDE
	db 28, ZUBAT
	db 28, RATTATA
	db 28, TYROGUE
	db 28, TYROGUE
	db 28, TYROGUE
else
	db 30, MACHOKE
	db 29, GRAVELER
	db 28, GOLBAT
	db 28, RATICATE
	db 28, HITMONLEE
	db 28, HITMONCHAN
	db 28, HITMONTOP
endc
	db 26, MARILL
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 24, MACHOP
	db 24, GEODUDE
	db 23, ZUBAT
	db 25, ZUBAT
	db 24, RATTATA
	db 25, ONIX
if DEF(_LITTLE_CUP)
	db 26, RATTATA
else
	db 26, RATICATE
endc
	db 24, MARILL
	; day
	db 24, MACHOP
	db 24, GEODUDE
	db 23, ZUBAT
	db 25, ZUBAT
	db 24, RATTATA
	db 25, ONIX
if DEF(_LITTLE_CUP)
	db 26, RATTATA
else
	db 26, RATICATE
endc
	db 24, MARILL
	; nite
	db 24, MACHOP
	db 24, GEODUDE
if DEF(_LITTLE_CUP)
	db 23, ZUBAT
	db 25, ZUBAT
	db 24, RATTATA
	db 25, ONIX
	db 26, RATTATA
else
	db 23, GOLBAT
	db 25, ZUBAT
	db 24, RATTATA
	db 25, ONIX
	db 26, RATICATE
endc
	db 24, MARILL
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_1F
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 28, SWINUB
	db 29, SEEL
	db 27, VULPIX
if DEF(_LITTLE_CUP)
	db 28, SWINUB
	db 28, SLOWPOKE
	db 26, ZUBAT
	db 27, SLOWPOKE
else
	db 28, SNOCONEY
	db 28, JYNX
	db 26, DELIBIRD
	db 27, MR__MIME
endc
	db 27, SANDSHREW
	; day
	db 28, SWINUB
	db 29, SEEL
	db 27, VULPIX
if DEF(_LITTLE_CUP)
	db 28, SWINUB
	db 28, SLOWPOKE
	db 26, ZUBAT
	db 27, SLOWPOKE
else
	db 28, SNOCONEY
	db 28, JYNX
	db 26, DELIBIRD
	db 27, MR__MIME
endc
	db 27, SANDSHREW
	; nite
if DEF(_LITTLE_CUP)
	db 28, SWINUB
	db 29, SEEL
	db 27, VULPIX
	db 28, SWINUB
	db 28, SLOWPOKE
	db 26, ZUBAT
	db 27, SLOWPOKE
else
	db 28, SNEASEL
	db 29, SEEL
	db 27, VULPIX
	db 28, SNOCONEY
	db 28, JYNX
	db 26, DELIBIRD
	db 27, MR__MIME
endc
	db 27, SANDSHREW
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B1F
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 29, SWINUB
	db 30, SEEL
	db 28, VULPIX
if DEF(_LITTLE_CUP)
	db 29, SWINUB
	db 29, SLOWPOKE
	db 27, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 29, SNOCONEY
	db 29, JYNX
	db 27, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; day
	db 29, SWINUB
	db 30, SEEL
	db 28, VULPIX
if DEF(_LITTLE_CUP)
	db 29, SWINUB
	db 29, SLOWPOKE
	db 27, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 29, SNOCONEY
	db 29, JYNX
	db 27, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; nite
if DEF(_LITTLE_CUP)
	db 29, SWINUB
	db 30, SEEL
	db 28, VULPIX
	db 29, SWINUB
	db 29, SLOWPOKE
	db 27, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 29, SNEASEL
	db 30, SEEL
	db 28, VULPIX
	db 29, SNOCONEY
	db 29, JYNX
	db 27, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 29, SWINUB
if DEF(_LITTLE_CUP)
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; day
	db 29, SWINUB
if DEF(_LITTLE_CUP)
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; nite
if DEF(_LITTLE_CUP)
	db 29, SWINUB
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 29, SNEASEL
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
	db 29, SWINUB
if DEF(_LITTLE_CUP)
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; day
	db 29, SWINUB
if DEF(_LITTLE_CUP)
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	; nite
if DEF(_LITTLE_CUP)
	db 29, SWINUB
	db 30, SEEL
	db 28, VULPIX
	db 30, SWINUB
	db 29, SLOWPOKE
	db 28, ZUBAT
	db 28, SLOWPOKE
	db 28, SANDSHREW
else
	db 29, SNEASEL
	db 30, DEWGONG
	db 28, VULPIX
	db 30, SNOCONEY
	db 29, JYNX
	db 28, DELIBIRD
	db 28, MR__MIME
	db 28, SANDSLASH
endc
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B3F
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 32, SWINUB
	db 30, SEEL
	db 29, VULPIX
	db 30, SWINUB
	db 30, SLOWPOKE
	db 30, ZUBAT
	db 30, SLOWPOKE
	db 29, SANDSHREW
else
	db 32, PILOSWINE
	db 30, DEWGONG
	db 29, VULPIX
	db 30, SNOCONEY
	db 30, JYNX
	db 30, DELIBIRD
	db 30, MR__MIME
	db 29, SANDSLASH
endc
	; day
if DEF(_LITTLE_CUP)
	db 32, SWINUB
	db 30, SEEL
	db 29, VULPIX
	db 30, SWINUB
	db 30, SLOWPOKE
	db 30, ZUBAT
	db 30, SLOWPOKE
	db 29, SANDSHREW
else
	db 32, PILOSWINE
	db 30, DEWGONG
	db 29, VULPIX
	db 30, SNOCONEY
	db 30, JYNX
	db 30, DELIBIRD
	db 30, MR__MIME
	db 29, SANDSLASH
endc
	; nite
if DEF(_LITTLE_CUP)
	db 30, SWINUB
	db 30, SEEL
	db 29, VULPIX
	db 30, SWINUB
	db 30, SLOWPOKE
	db 30, ZUBAT
	db 30, SLOWPOKE
	db 29, SANDSHREW
else
	db 30, SNEASEL
	db 30, DEWGONG
	db 29, NINETALES
	db 30, SNOCONEY
	db 30, JYNX
	db 30, DELIBIRD
	db 30, MR__MIME
	db 29, SANDSLASH
endc
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_ARTICUNO_CHAMBER
	db 2 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, ZUBAT
	db 31, ZUBAT
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, GOLBAT
	db 31, DELIBIRD
	db 26, UNOWN
	db 1, UNOWN
endc
	; day
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, ZUBAT
	db 31, ZUBAT
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, GOLBAT
	db 31, DELIBIRD
	db 26, UNOWN
	db 1, UNOWN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 24, ZUBAT
	db 25, ZUBAT
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, ZUBAT
	db 31, ZUBAT
	db 26, ZUBAT
	db 1, ZUBAT
else
	db 24, UNOWN
	db 25, UNOWN
	db 26, ZUBAT
	db 30, ZUBAT
	db 30, GOLBAT
	db 31, DELIBIRD
	db 26, UNOWN
	db 1, UNOWN
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_OUTSIDE
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 41, BELLSPROUT
	db 42, SCYTHER
	db 45, RATTATA
	db 44, MAGNEMITE
	db 43, SENTRET
	db 42, SLUGMA
	db 43, TEDDIURSA
	db 43, PHANPY
else
	db 41, VICTREEBEL
	db 42, HERACROSS
	db 45, STANTLER
	db 44, MAGNETON
	db 43, LICKITUNG
	db 42, MAGCARGO
	db 43, URSARING
	db 43, DONPHAN
endc
	; day
if DEF(_LITTLE_CUP)
	db 41, SUNKERN
	db 42, SCYTHER
	db 45, PONYTA
	db 44, DODUO
	db 43, EKANS
	db 42, SNUBBULL
	db 43, TEDDIURSA
	db 43, PHANPY
else
	db 41, TANGELA
	db 42, HERACROSS
	db 45, RAPIDASH
	db 44, DODRIO
	db 43, ARBOK
	db 42, GRANBULL
	db 43, URSARING
	db 43, DONPHAN
endc
	; nite
if DEF(_LITTLE_CUP)
	db 41, ODDISH
	db 42, SWINUB
	db 45, RATTATA
	db 44, DODUO
	db 44, MEOWTH
	db 42, HOUNDOUR
	db 43, ZUBAT
	db 43, POLIWAG
else
	db 41, VILEPLUME
	db 42, SNEASEL
	db 45, STANTLER
	db 44, DODRIO
	db 44, PERSIAN
	db 42, HOUNDOOM
	db 43, GOLBAT
	db 43, POLIWRATH
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_1
	db 6 percent, 6 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 41, GEODUDE
	db 41, ONIX
	db 42, TEDDIURSA
	db 42, PHANPY
	db 43, ZUBAT
	db 43, CHARMANDER
	db 41, WOOPER
	db 41, MACHOP
else
	db 41, GRAVELER
	db 41, STEELIX
	db 42, URSARING
	db 42, DONPHAN
	db 43, GOLBAT
	db 43, MAGMAR
	db 41, QUAGSIRE
	db 41, MACHOKE
endc
	; day
if DEF(_LITTLE_CUP)
	db 41, GEODUDE
	db 41, ONIX
	db 42, TEDDIURSA
	db 42, PHANPY
	db 43, ZUBAT
	db 43, CHARMANDER
	db 41, PSYDUCK
	db 41, MACHOP
else
	db 41, GRAVELER
	db 41, STEELIX
	db 42, URSARING
	db 42, DONPHAN
	db 43, GOLBAT
	db 43, MAGMAR
	db 41, GOLDUCK
	db 41, MACHOKE
endc
	; nite
if DEF(_LITTLE_CUP)
	db 41, GEODUDE
	db 41, ONIX
	db 42, TEDDIURSA
	db 42, PHANPY
	db 43, ZUBAT
	db 43, LARVITAR
	db 41, MANKEY
	db 41, GASTLY
else
	db 41, GRAVELER
	db 41, STEELIX
	db 42, URSARING
	db 42, DONPHAN
	db 43, GOLBAT
	db 43, PUPITAR
	db 41, PRIMEAPE
	db 41, MISDREAVUS
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_2
	db 6 percent, 6 percent, 7 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 44, SWINUB
	db 47, MACHOP
	db 45, TEDDIURSA
	db 45, PHANPY
	db 46, ZUBAT
	db 45, CHARMANDER
	db 46, GEODUDE
	db 44, ONIX
else
	db 44, PILOSWINE
	db 47, MACHOKE
	db 45, URSARING
	db 45, DONPHAN
	db 46, GOLBAT
	db 45, MAGMAR
	db 46, GRAVELER
	db 44, STEELIX
endc
	; day
if DEF(_LITTLE_CUP)
	db 44, SWINUB
	db 47, MACHOP
	db 45, TEDDIURSA
	db 45, PHANPY
	db 46, ZUBAT
	db 45, CHARMANDER
	db 46, GEODUDE
	db 44, ONIX
else
	db 44, PILOSWINE
	db 47, MACHOKE
	db 45, URSARING
	db 45, DONPHAN
	db 46, GOLBAT
	db 45, MAGMAR
	db 46, GRAVELER
	db 44, STEELIX
endc
	; nite
if DEF(_LITTLE_CUP)
	db 44, SWINUB
	db 47, GASTLY
	db 45, TEDDIURSA
	db 45, PHANPY
	db 46, ZUBAT
	db 45, LARVITAR
	db 46, GEODUDE
	db 44, ONIX
else
	db 44, PILOSWINE
	db 47, MISDREAVUS
	db 45, URSARING
	db 45, DONPHAN
	db 46, GOLBAT
	db 45, PUPITAR
	db 46, GRAVELER
	db 44, STEELIX
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_3
	db 6 percent, 6 percent, 5 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 53, ZUBAT
	db 49, ONIX
	db 50, GEODUDE
	db 48, TEDDIURSA
	db 48, PHANPY
	db 53, MAGNEMITE
	db 55, CHANSEY
	db 59, CHANSEY
else
	db 53, CROBAT
	db 49, STEELIX
	db 50, GOLEM
	db 48, URSARING
	db 48, DONPHAN
	db 53, MAGNETON
	db 55, BLISSEY
	db 59, BLISSEY
endc
	; day
if DEF(_LITTLE_CUP)
	db 53, ZUBAT
	db 49, ONIX
	db 50, GEODUDE
	db 48, TEDDIURSA
	db 48, PHANPY
	db 59, DIGLETT
	db 55, DRATINI
	db 59, DRATINI
else
	db 53, CROBAT
	db 49, STEELIX
	db 50, GOLEM
	db 48, URSARING
	db 48, DONPHAN
	db 59, DUGTRIO
	db 55, DRAGONITE
	db 59, DRAGONITE
endc
	; nite
if DEF(_LITTLE_CUP)
	db 53, ZUBAT
	db 49, ONIX
	db 50, GEODUDE
	db 48, TEDDIURSA
	db 48, PHANPY
	db 48, GASTLY
	db 55, LARVITAR
	db 59, LARVITAR
else
	db 53, CROBAT
	db 49, STEELIX
	db 50, GOLEM
	db 48, URSARING
	db 48, DONPHAN
	db 48, MISDREAVUS
	db 55, TYRANITAR
	db 59, TYRANITAR
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ITEM_ROOMS
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 50, PARAS
	db 48, ZUBAT
	db 47, CHARMANDER
	db 47, TEDDIURSA
	db 47, PHANPY
	db 48, GEODUDE
	db 48, WOOPER
	db 50, MAGNEMITE
else
	db 50, PARASECT
	db 48, GOLBAT
	db 47, MAGMAR
	db 47, URSARING
	db 47, DONPHAN
	db 48, GRAVELER
	db 48, QUAGSIRE
	db 50, MAGNETON
endc
	; day
if DEF(_LITTLE_CUP)
	db 50, PARAS
	db 48, ZUBAT
	db 47, CHARMANDER
	db 47, TEDDIURSA
	db 47, PHANPY
	db 48, GEODUDE
	db 48, PSYDUCK
	db 50, DIGLETT
else
	db 50, PARASECT
	db 48, GOLBAT
	db 47, MAGMAR
	db 47, URSARING
	db 47, DONPHAN
	db 48, GRAVELER
	db 48, GOLDUCK
	db 50, DUGTRIO
endc
	; nite
if DEF(_LITTLE_CUP)
	db 50, PARAS
	db 48, ZUBAT
	db 45, LARVITAR
	db 47, TEDDIURSA
	db 47, PHANPY
	db 48, LARVITAR
	db 48, MANKEY
	db 44, GASTLY
else
	db 50, PARASECT
	db 48, GOLBAT
	db 45, PUPITAR
	db 47, URSARING
	db 47, DONPHAN
	db 48, PUPITAR
	db 48, PRIMEAPE
	db 44, MISDREAVUS
endc
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_MOLTRES_CHAMBER
	db 6 percent, 6 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
if DEF(_LITTLE_CUP)
	db 48, ZUBAT
	db 40, ZUBAT
	db 48, ZUBAT
	db 40, ZUBAT
	db 53, ZUBAT
	db 24, ZUBAT
	db 24, SLUGMA
	db 43, CHARMANDER
else
	db 48, UNOWN
	db 40, UNOWN
	db 48, GOLBAT
	db 40, GOLBAT
	db 53, CROBAT
	db 24, UNOWN
	db 24, SLUGMA
	db 43, CHARIZARD
endc
	; day
if DEF(_LITTLE_CUP)
	db 48, ZUBAT
	db 40, ZUBAT
	db 48, ZUBAT
	db 40, ZUBAT
	db 53, ZUBAT
	db 24, ZUBAT
	db 48, SLUGMA
	db 43, CHARMANDER
else
	db 48, UNOWN
	db 40, UNOWN
	db 48, GOLBAT
	db 40, GOLBAT
	db 53, CROBAT
	db 24, UNOWN
	db 48, MAGCARGO
	db 43, CHARIZARD
endc
	; nite
if DEF(_LITTLE_CUP)
	db 48, ZUBAT
	db 40, ZUBAT
	db 48, ZUBAT
	db 40, ZUBAT
	db 53, ZUBAT
	db 24, ZUBAT
	db 1, ZUBAT
	db 43, CHARMANDER
else
	db 48, UNOWN
	db 40, UNOWN
	db 48, GOLBAT
	db 40, GOLBAT
	db 53, CROBAT
	db 24, UNOWN
	db 1, UNOWN
	db 43, CHARIZARD
endc
	end_grass_wildmons

	db -1 ; end
