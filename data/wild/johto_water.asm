; Johto Pokémon in water

JohtoWaterWildMons:

	def_water_wildmons ROUTE_30
	db 2 percent ; encounter rate
	db 20, POLIWAG
	db 15, POLIWAG
	db 20, POLIWHIRL
	db 15, YANMA
	end_water_wildmons

	def_water_wildmons ROUTE_31
	db 2 percent ; encounter rate
	db 20, POLIWAG
	db 15, POLIWAG
	db 20, POLIWHIRL
	db 15, YANMA
	end_water_wildmons

	def_water_wildmons ROUTE_32
	db 6 percent ; encounter rate
	db 15, TENTACOOL
	db 15, SEEL
	db 20, TENTACRUEL
	db 20, QUAGSIRE
	end_water_wildmons

	def_water_wildmons ROUTE_34
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 15, JIRK
	end_water_wildmons

	def_water_wildmons ROUTE_35
	db 4 percent ; encounter rate
	db 20, PSYDUCK
	db 15, PSYDUCK
	db 20, GOLDUCK
	db 15, FARFETCH_D
	end_water_wildmons

	def_water_wildmons ROUTE_40
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 20, TENTACRUEL
	db 20, MANTINE
	db 20, CASTAWEIGH
	end_water_wildmons

	def_water_wildmons ROUTE_41
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 20, TENTACRUEL
	db 20, MANTINE
	db 20, CASTAWEIGH
	end_water_wildmons

	def_water_wildmons ROUTE_42
	db 4 percent ; encounter rate
	db 20, GOLDEEN
	db 15, GOLDEEN
	db 20, SEAKING
	db 20, FARFETCH_D
	end_water_wildmons

	def_water_wildmons ROUTE_43
	db 2 percent ; encounter rate
	db 20, MAGIKARP
	db 15, MAGIKARP
	db 10, MAGIKARP
	db 20, FARFETCH_D
	end_water_wildmons

	def_water_wildmons ROUTE_44
	db 2 percent ; encounter rate
	db 25, POLIWAG
	db 20, POLIWAG
	db 25, POLIWHIRL
	db 20, EXEGGCUTE
	end_water_wildmons

	def_water_wildmons ROUTE_45
	db 2 percent ; encounter rate
	db 20, MAGIKARP
	db 15, MAGIKARP
	db 5, MAGIKARP
	db 20, GYARADOS
	end_water_wildmons

	def_water_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 2 percent ; encounter rate
	db 15, MAGIKARP
	db 10, MAGIKARP
	db 5,  MAGIKARP
	db 10, TANGELA
	end_water_wildmons

	def_water_wildmons DARK_CAVE_BLACKTHORN_ENTRANCE
	db 2 percent ; encounter rate
	db 30, GOLDUCK
	db 30, GOLBAT
	db 30, GYARADOS
	db 30, TANGELA
	end_water_wildmons

	def_water_wildmons RUINS_OF_ALPH_OUTSIDE
	db 2 percent ; encounter rate
	db 15, WOOPER
	db 15, PSYDUCK
	db 15, POLIWAG
	db 15, SLOWPOKE
	end_water_wildmons

	def_water_wildmons UNION_CAVE_1F
	db 2 percent ; encounter rate
	db 15, WOOPER
	db 20, QUAGSIRE
	db 15, QUAGSIRE
	db 20, WOOPER
	end_water_wildmons

	def_water_wildmons UNION_CAVE_B1F
	db 2 percent ; encounter rate
	db 20, WOOPER
	db 20, QUAGSIRE
	db 15, WOOPER
	db 15, QUAGSIRE
	end_water_wildmons

	def_water_wildmons UNION_CAVE_B2F
	db 4 percent ; encounter rate
	db 15, TENTACOOL
	db 20, QUAGSIRE
	db 20, TENTACRUEL
	db 20, GOLBAT
	end_water_wildmons

	def_water_wildmons UNION_CAVE_SLOWPOKE_WELL_LINK
	db 4 percent ; encounter rate
	db 20, SLOWBRO
	db 20, SLOWKING
	db 15, SLOWPOKE
if DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	db 20, TURBIN
else
	db 20, QUAGSIRE
endc
	end_water_wildmons

	def_water_wildmons SLOWPOKE_WELL_B1F
	db 2 percent ; encounter rate
	db 15, SLOWPOKE
	db 20, SLOWPOKE
	db 10, SLOWPOKE
	db 5,  SLOWPOKE
	end_water_wildmons

	def_water_wildmons SLOWPOKE_WELL_B2F
	db 2 percent ; encounter rate
	db 15, SLOWPOKE
if DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	db 20, TURBIN
else
	db 20, SLOWPOKE
endc
	db 20, SLOWBRO
	db 20, SLOWKING
	end_water_wildmons

	def_water_wildmons ILEX_FOREST
	db 2 percent ; encounter rate
	db 15, PSYDUCK
	db 15, PINECO
	db 15, FARFETCH_D
	db 15, MARILL
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_1F
	db 4 percent ; encounter rate
	db 20, TENTACOOL
	db 15, HORSEA
	db 20, TENTACRUEL
	db 25, VAPOREON
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_B2F
	db 4 percent ; encounter rate
	db 15, HORSEA
	db 20, HORSEA
	db 20, TENTACRUEL
	db 25, VAPOREON
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_LUGIA_CHAMBER
	db 4 percent ; encounter rate
	db 25, UNOWN
	db 25, UNOWN
	db 25, ZUBAT
	db 25, GOLBAT
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 4 percent ; encounter rate
	db 15, GOLDEEN
	db 20, MARILL
	db 20, SEAKING
	db 20, GOLBAT
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_2F_INSIDE
	db 2 percent ; encounter rate
	db 20, GOLDEEN
	db 25, MARILL
	db 25, SEAKING
	db 20, GOLBAT
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_B1F
	db 2 percent ; encounter rate
	db 15, GOLDEEN
	db 20, MARILL
	db 20, SEAKING
	db 20, GOLBAT
	end_water_wildmons

	def_water_wildmons DRAGONS_DEN_B1F
	db 4 percent ; encounter rate
	db 25, MAGIKARP
	db 30, YANMA
	db 25, DRATINI
	db 30, GYARADOS
	end_water_wildmons

	def_water_wildmons SILVER_CAVE_OUTSIDE
	db 2 percent ; encounter rate
	db 40, CASTAWEIGH
	db 40, POLIWHIRL
	db 40, POLIWAG
	db 40, FERALIGATR
	end_water_wildmons

	def_water_wildmons SILVER_CAVE_ROOM_2
	db 2 percent ; encounter rate
	db 50, SEAKING
	db 50, GOLDUCK
	db 50, CASTAWEIGH
	db 50, BLASTOISE
	end_water_wildmons

	def_water_wildmons NEW_BARK_TOWN
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 15, MARILL
	end_water_wildmons

	def_water_wildmons CHERRYGROVE_CITY
	db 6 percent ; encounter rate
	db 15, SEEL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 15, TANGELA
	end_water_wildmons

	def_water_wildmons VIOLET_CITY
	db 2 percent ; encounter rate
	db 20, POLIWAG
	db 15, POLIWAG
	db 20, POLIWHIRL
	db 15, JIRK
	end_water_wildmons

	def_water_wildmons ECRUTEAK_CITY
	db 2 percent ; encounter rate
	db 20, POLIWAG
	db 15, POLIWAG
	db 20, POLIWHIRL
	db 20, JIRK
	end_water_wildmons

	def_water_wildmons OLIVINE_CITY
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 15, MANTINE
	end_water_wildmons

	def_water_wildmons OLIVINE_PORT
	db 2 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 20, VAPOREON
	end_water_wildmons

	def_water_wildmons CIANWOOD_CITY
	db 6 percent ; encounter rate
	db 20, TENTACOOL
	db 15, TENTACOOL
	db 20, TENTACRUEL
	db 15, MANTINE
	end_water_wildmons

	def_water_wildmons LAKE_OF_RAGE
	db 6 percent ; encounter rate
	db 20, MAGIKARP
	db 15, MAGIKARP
	db 20, GYARADOS
	db 25, GYARADOS
	end_water_wildmons

	def_water_wildmons BLACKTHORN_CITY
	db 4 percent ; encounter rate
	db 25, MAGIKARP
	db 20, MAGIKARP
	db 30, GYARADOS
	db 5, DRATINI
	end_water_wildmons

	db -1 ; end
