PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db " NORMAL @"
	db "FIGHTING@"
	db "  DARK  @"
	db " FLYING @"
	db " GRASS  @"
	db "  FIRE  @"
	db " WATER  @"
	db "ELECTRIC@"
	db "  ROCK  @"
	db " GROUND @"
	db " STEEL  @"
	db "  ICE   @"
	db " POISON @"
	db "PSYCHIC @"
	db "  BUG   @"
	db " GHOST  @"
	db " DRAGON @"
	db " FAIRY  @"
	assert_table_length NUM_TYPES + 1
