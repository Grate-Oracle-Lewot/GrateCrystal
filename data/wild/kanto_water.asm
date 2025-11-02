; Kanto Pokémon in water

KantoWaterWildMons:

	def_water_wildmons ROUTE_4
	db 4 percent ; encounter rate
	db 10, GOLDEEN
	db 5, GOLDEEN
if DEF(_LITTLE_CUP)
	db 10, GOLDEEN
else
	db 10, SEAKING
endc
	db 5, YANMA
	end_water_wildmons

	def_water_wildmons ROUTE_6
	db 2 percent ; encounter rate
	db 10, PSYDUCK
	db 5, PSYDUCK
if DEF(_LITTLE_CUP)
	db 10, PSYDUCK
	db 10, PSYDUCK
else
	db 10, GOLDUCK
	db 10, FARFETCH_D
endc
	end_water_wildmons

	def_water_wildmons ROUTE_9
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 10, GOLDEEN
if DEF(_LITTLE_CUP)
	db 15, GOLDEEN
else
	db 15, SEAKING
endc
	db 10, MAGNEMITE
	end_water_wildmons

	def_water_wildmons ROUTE_10_NORTH
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 10, GOLDEEN
if DEF(_LITTLE_CUP)
	db 15, GOLDEEN
else
	db 15, SEAKING
endc
	db 10, MAGNEMITE
	end_water_wildmons

	def_water_wildmons ROUTE_12
	db 6 percent ; encounter rate
	db 25, TENTACOOL
	db 25, SEEL
if DEF(_LITTLE_CUP)
	db 25, TENTACOOL
	db 25, HORSEA
else
	db 25, TENTACRUEL
	db 25, SEADRA
endc
	end_water_wildmons

	def_water_wildmons ROUTE_13
	db 6 percent ; encounter rate
	db 25, TENTACOOL
	db 25, SEEL
if DEF(_LITTLE_CUP)
	db 25, TENTACOOL
	db 25, HORSEA
else
	db 25, TENTACRUEL
	db 25, SEADRA
endc
	end_water_wildmons

	def_water_wildmons ROUTE_19
	db 6 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 35, TENTACOOL
	db 35, MAGIKARP
	db 35, REMORAID
else
	db 35, TENTACOOL
	db 35, TENTACRUEL
	db 35, CASTAWEIGH
	db 35, MANTINE
endc
	end_water_wildmons

	def_water_wildmons ROUTE_20
	db 6 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 35, TENTACOOL
	db 35, MAGIKARP
	db 35, REMORAID
else
	db 35, TENTACOOL
	db 35, TENTACRUEL
	db 35, CASTAWEIGH
	db 35, MANTINE
endc
	end_water_wildmons

	def_water_wildmons ROUTE_21
	db 6 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 35, TENTACOOL
	db 35, MAGIKARP
	db 35, REMORAID
else
	db 35, TENTACOOL
	db 35, TENTACRUEL
	db 35, CASTAWEIGH
	db 35, MANTINE
endc
	end_water_wildmons

	def_water_wildmons ROUTE_22
	db 2 percent ; encounter rate
	db 10, POLIWAG
	db 5, POLIWAG
if DEF(_LITTLE_CUP)
	db 10, POLIWAG
else
	db 10, POLIWHIRL
endc
	db 5, WOOPER
	end_water_wildmons

	def_water_wildmons ROUTE_24
	db 4 percent ; encounter rate
	db 10, GOLDEEN
	db 5, GOLDEEN
if DEF(_LITTLE_CUP)
	db 10, GOLDEEN
else
	db 10, SEAKING
endc
	db 5, YANMA
	end_water_wildmons

	def_water_wildmons ROUTE_25
	db 4 percent ; encounter rate
	db 10, GOLDEEN
	db 5, GOLDEEN
if DEF(_LITTLE_CUP)
	db 10, GOLDEEN
else
	db 10, SEAKING
endc
	db 5, YANMA
	end_water_wildmons

	def_water_wildmons ROUTE_26
	db 6 percent ; encounter rate
	db 35, TENTACOOL
	db 30, TENTACOOL
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 30, PSYDUCK
else
	db 35, TENTACRUEL
	db 30, GOLDUCK
endc
	end_water_wildmons

	def_water_wildmons ROUTE_27
	db 6 percent ; encounter rate
	db 25, TENTACOOL
	db 20, TENTACOOL
if DEF(_LITTLE_CUP)
	db 25, TENTACOOL
else
	db 25, TENTACRUEL
endc
	db 20, PSYDUCK
	end_water_wildmons

	def_water_wildmons ROUTE_28
	db 2 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 40, POLIWAG
	db 35, POLIWAG
	db 35, MAGIKARP
	db 35, YANMA
else
	db 40, POLIWAG
	db 35, POLIWHIRL
	db 35, CASTAWEIGH
	db 35, YANMEGA
endc
	end_water_wildmons

	def_water_wildmons SAFARI_ZONE
	db 1 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, SEEL
else
	db 35, LAPRAS
endc
	db 35, YANMA
	db 5, SQUIRTLE
	db 5, TOTODILE
	end_water_wildmons

	def_water_wildmons TOHJO_FALLS
	db 4 percent ; encounter rate
	db 30, GOLDEEN
	db 30, SLOWPOKE
if DEF(_LITTLE_CUP)
	db 30, GOLDEEN
else
	db 30, SEAKING
endc
	db 25, MARILL
	end_water_wildmons

	def_water_wildmons MEW_ANTECHAMBER
	db 1 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 25, GOLDEEN
	db 25, ABRA
	db 25, SLOWPOKE
	db 25, SLOWPOKE
else
	db 25, SEAKING
	db 25, UNOWN
	db 25, SLOWBRO
	db 25, SLOWKING
endc
	end_water_wildmons

	def_water_wildmons PALLET_TOWN
	db 6 percent ; encounter rate
	db 35, TENTACOOL
	db 30, TENTACOOL
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 30, EXEGGCUTE
else
	db 35, TENTACRUEL
	db 30, TANGELA
endc
	end_water_wildmons

	def_water_wildmons VIRIDIAN_CITY
	db 2 percent ; encounter rate
	db 10, POLIWAG
	db 5, POLIWAG
if DEF(_LITTLE_CUP)
	db 10, POLIWAG
else
	db 10, POLIWHIRL
endc
	db 5, WOOPER
	end_water_wildmons

	def_water_wildmons CERULEAN_CITY
	db 4 percent ; encounter rate
	db 10, GOLDEEN
	db 5, GOLDEEN
if DEF(_LITTLE_CUP)
	db 10, GOLDEEN
else
	db 10, SEAKING
endc
	db 5, YANMA
	end_water_wildmons

	def_water_wildmons VERMILION_CITY
	db 6 percent ; encounter rate
	db 35, TENTACOOL
	db 30, TENTACOOL
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 30, REMORAID
else
	db 35, TENTACRUEL
	db 30, MANTINE
endc
	end_water_wildmons

	def_water_wildmons VERMILION_PORT
	db 2 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 30, TENTACOOL
	db 35, TENTACOOL
	db 30, REMORAID
else
	db 35, TENTACOOL
	db 30, TENTACOOL
	db 35, TENTACRUEL
if DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	db 35, TURBIN
else
	db 30, MANTINE
endc
endc
	end_water_wildmons

	def_water_wildmons CELADON_CITY
	db 2 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 15, GRIMER
	db 15, GRIMER
	db 15, WOOPER
	db 15, YANMA
else
	db 15, GRIMER
	db 15, MUK
	db 15, QUAGSIRE
	db 15, JIRK
endc
	end_water_wildmons

	def_water_wildmons FUCHSIA_CITY
	db 2 percent ; encounter rate
	db 10, MAGIKARP
	db 20, MAGIKARP
if DEF(_LITTLE_CUP)
	db 15, YANMA
	db 20, MAGIKARP
else
	db 15, JIRK
	db 20, GYARADOS
endc
	end_water_wildmons

	def_water_wildmons CINNABAR_ISLAND
	db 6 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, TENTACOOL
	db 35, MAGIKARP
	db 35, TENTACOOL
	db 35, SLOWPOKE
else
	db 35, TENTACOOL
	db 35, CASTAWEIGH
	db 35, TENTACRUEL
if DEF(_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS)
	db 95, MISSINGNO
else
	db 95, UNOWN
endc
endc
	end_water_wildmons

	def_water_wildmons CERULEAN_CAVE_1F
	db 8 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 35, PSYDUCK
	db 35, SLOWPOKE
	db 35, ZUBAT
	db 35, YANMA
else
	db 35, GOLDUCK
	db 35, SLOWPOKE
	db 35, GOLBAT
	db 35, JIRK
endc
	end_water_wildmons

	def_water_wildmons CERULEAN_CAVE_B1F
	db 6 percent ; encounter rate
if DEF(_LITTLE_CUP)
	db 40, PSYDUCK
	db 40, MAGIKARP
	db 40, ZUBAT
	db 40, MARILL
else
	db 40, GOLDUCK
	db 40, GYARADOS
	db 40, CROBAT
	db 40, AZUMARILL
endc
	end_water_wildmons

	db -1 ; end
