PokedexTypeSearchConversionTable:
; entries correspond with PokedexTypeSearchStrings (see data/types/search_strings.asm)
	table_width 1, PokedexTypeSearchConversionTable
	db NORMAL
	db FIGHTING
	db DARK
	db FLYING
	db GRASS
	db FIRE
	db WATER
	db ELECTRIC
	db ROCK
	db GROUND
	db STEEL
	db ICE
	db POISON
	db PSYCHIC_TYPE
	db BUG
	db GHOST
	db DRAGON
	db FAIRY
	assert_table_length NUM_TYPES
