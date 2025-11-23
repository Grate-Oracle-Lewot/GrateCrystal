roms := \
	GrateCrystal.gbc \
	GrateCrystal_KantoStarters.gbc \
	GrateCrystal_EvolvedJohtoStarters.gbc \
	GrateCrystal_EvolvedKantoStarters.gbc \
	GrateCrystal_PikachuEeveeStarters.gbc \
	GrateCrystal_PikachuSandshrewMarillStarters.gbc \
	GrateCrystal_SixPikachuStarters.gbc \
	GrateCrystal_JynxMagmarElectabuzzStarters.gbc \
	GrateCrystal_HitmonStarters.gbc \
	GrateCrystal_NidoranStarters.gbc \
	GrateCrystal_DoduoMagnemiteDiglettStarters.gbc \
	GrateCrystal_TaurosMiltankGirafarigStarters.gbc \
	GrateCrystal_SnorlaxMisdreavusFarfetchdStarters.gbc \
	GrateCrystal_SlowpokeSlugmaStarters.gbc \
	GrateCrystal_ShuckleSmeargleDelibirdStarters.gbc \
	GrateCrystal_NewStarters1.gbc \
	GrateCrystal_NewStarters2.gbc \
	GrateCrystal_FossilStarters.gbc \
	GrateCrystal_EvolvedFossilStarters.gbc \
	GrateCrystal_DratiniLarvitarStarters.gbc \
	GrateCrystal_DragoniteTyranitarStarters.gbc \
	GrateCrystal_LegendaryBirdStarters.gbc \
	GrateCrystal_LegendaryBeastStarters.gbc \
	GrateCrystal_MewDittoMewtwoStarters.gbc \
	GrateCrystal_HoOhLugiaStarters.gbc \
	GrateCrystal_CelebiWobbuffetStarters.gbc \
	GrateCrystal_Alt_MissingNo.gbc \
	GrateCrystal_Alt_MissingnoStarters.gbc \
	GrateCrystal_Alt_Turbin.gbc \
	GrateCrystal_Alt_AbraShellderStarters.gbc \
	GrateCrystal_StartWithHMReplacementItems.gbc \
	GrateCrystal_NoExperienceGains.gbc \
	GrateCrystal_NoPokemonCenterHealing.gbc \
	GrateCrystal_LittleCup.gbc \
	GrateCrystal_Alt_MetronomeOnly.gbc \
	GrateCrystal_Alt_VanillaTypes.gbc \
	GrateCrystal11.gbc
patches := GrateCrystal11.patch

rom_obj := \
	audio.o \
	home.o \
	main.o \
	wram.o \
	data/text/common.o \
	data/maps/map_data.o \
	data/pokemon/dex_entries.o \
	data/pokemon/egg_moves.o \
	data/pokemon/evos_attacks.o \
	engine/movie/credits.o \
	engine/overworld/events.o \
	gfx/misc.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o \
	lib/mobile/main.o

GrateCrystal_obj                                     := $(rom_obj:.o=.o)
GrateCrystal_KantoStarters_obj                       := $(rom_obj:.o=kanto.o)
GrateCrystal_EvolvedJohtoStarters_obj                := $(rom_obj:.o=evolve.o)
GrateCrystal_EvolvedKantoStarters_obj                := $(rom_obj:.o=kantevo.o)
GrateCrystal_PikachuEeveeStarters_obj                := $(rom_obj:.o=letsgo.o)
GrateCrystal_PikachuSandshrewMarillStarters_obj      := $(rom_obj:.o=mice.o)
GrateCrystal_SixPikachuStarters_obj                  := $(rom_obj:.o=six.o)
GrateCrystal_JynxMagmarElectabuzzStarters_obj        := $(rom_obj:.o=jinx.o)
GrateCrystal_HitmonStarters_obj                      := $(rom_obj:.o=hit.o)
GrateCrystal_NidoranStarters_obj                     := $(rom_obj:.o=nido.o)
GrateCrystal_DoduoMagnemiteDiglettStarters_obj       := $(rom_obj:.o=trio.o)
GrateCrystal_TaurosMiltankGirafarigStarters_obj      := $(rom_obj:.o=cattle.o)
GrateCrystal_SnorlaxMisdreavusFarfetchdStarters_obj  := $(rom_obj:.o=far.o)
GrateCrystal_SlowpokeSlugmaStarters_obj              := $(rom_obj:.o=slow.o)
GrateCrystal_ShuckleSmeargleDelibirdStarters_obj     := $(rom_obj:.o=shucks.o)
GrateCrystal_NewStarters1_obj                        := $(rom_obj:.o=new1.o)
GrateCrystal_NewStarters2_obj                        := $(rom_obj:.o=new2.o)
GrateCrystal_FossilStarters_obj                      := $(rom_obj:.o=fossil.o)
GrateCrystal_EvolvedFossilStarters_obj               := $(rom_obj:.o=evossil.o)
GrateCrystal_DratiniLarvitarStarters_obj             := $(rom_obj:.o=pseudo.o)
GrateCrystal_DragoniteTyranitarStarters_obj          := $(rom_obj:.o=pseudevo.o)
GrateCrystal_LegendaryBirdStarters_obj               := $(rom_obj:.o=bird.o)
GrateCrystal_LegendaryBeastStarters_obj              := $(rom_obj:.o=beast.o)
GrateCrystal_MewDittoMewtwoStarters_obj              := $(rom_obj:.o=mew.o)
GrateCrystal_HoOhLugiaStarters_obj                   := $(rom_obj:.o=dragon.o)
GrateCrystal_CelebiWobbuffetStarters_obj             := $(rom_obj:.o=onion.o)
GrateCrystal_Alt_MissingNo_obj                       := $(rom_obj:.o=miss.o)
GrateCrystal_Alt_MissingnoStarters_obj               := $(rom_obj:.o=no.o)
GrateCrystal_Alt_Turbin_obj                          := $(rom_obj:.o=turbid.o)
GrateCrystal_Alt_AbraShellderStarters_obj            := $(rom_obj:.o=startur.o)
GrateCrystal_StartWithHMReplacementItems_obj         := $(rom_obj:.o=hm.o)
GrateCrystal_NoExperienceGains_obj                   := $(rom_obj:.o=noexp.o)
GrateCrystal_NoPokemonCenterHealing_obj              := $(rom_obj:.o=centre.o)
GrateCrystal_LittleCup_obj                           := $(rom_obj:.o=little.o)
GrateCrystal_Alt_MetronomeOnly_obj                   := $(rom_obj:.o=metro.o)
GrateCrystal_Alt_VanillaTypes_obj                    := $(rom_obj:.o=bland.o)
GrateCrystal11_obj                                   := $(rom_obj:.o=11.o)
GrateCrystal11_vc_obj                                := $(rom_obj:.o=11_vc.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all grate kanto evolve kantevo letsgo mice six jinx hit nido trio cattle far slow shucks new1 new2 fossil evossil pseudo pseudevo bird beast mew dragon onion miss no turbid startur hm noexp centre little metro bland crystal11 clean tidy tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: grate kanto evolve kantevo letsgo mice six jinx hit nido trio cattle far slow shucks new1 new2 fossil evossil pseudo pseudevo bird beast mew dragon onion miss no turbid startur hm noexp little metro bland
grate:        GrateCrystal.gbc
kanto:        GrateCrystal_KantoStarters.gbc
evolve:       GrateCrystal_EvolvedJohtoStarters.gbc
kantevo:      GrateCrystal_EvolvedKantoStarters.gbc
letsgo:       GrateCrystal_PikachuEeveeStarters.gbc
mice:         GrateCrystal_PikachuSandshrewMarillStarters.gbc
six:          GrateCrystal_SixPikachuStarters.gbc
jinx:         GrateCrystal_JynxMagmarElectabuzzStarters.gbc
hit:          GrateCrystal_HitmonStarters.gbc
nido:         GrateCrystal_NidoranStarters.gbc
trio:         GrateCrystal_DoduoMagnemiteDiglettStarters.gbc
cattle:       GrateCrystal_TaurosMiltankGirafarigStarters.gbc
far:          GrateCrystal_SnorlaxMisdreavusFarfetchdStarters.gbc
slow:         GrateCrystal_SlowpokeSlugmaStarters.gbc
shucks:       GrateCrystal_ShuckleSmeargleDelibirdStarters.gbc
new1:         GrateCrystal_NewStarters1.gbc
new2:         GrateCrystal_NewStarters2.gbc
fossil:       GrateCrystal_FossilStarters.gbc
evossil:      GrateCrystal_EvolvedFossilStarters.gbc
pseudo:       GrateCrystal_DratiniLarvitarStarters.gbc
pseudevo:     GrateCrystal_DragoniteTyranitarStarters.gbc
bird:         GrateCrystal_LegendaryBirdStarters.gbc
beast:        GrateCrystal_LegendaryBeastStarters.gbc
mew:          GrateCrystal_MewDittoMewtwoStarters.gbc
dragon:       GrateCrystal_HoOhLugiaStarters.gbc
onion:        GrateCrystal_CelebiWobbuffetStarters.gbc
miss:         GrateCrystal_Alt_MissingNo.gbc
no:           GrateCrystal_Alt_MissingnoStarters.gbc
turbid:       GrateCrystal_Alt_Turbin.gbc
startur:      GrateCrystal_Alt_AbraShellderStarters.gbc
hm:           GrateCrystal_StartWithHMReplacementItems.gbc
noexp:        GrateCrystal_NoExperienceGains.gbc
centre:       GrateCrystal_NoPokemonCenterHealing.gbc
little:       GrateCrystal_LittleCup.gbc
metro:        GrateCrystal_Alt_MetronomeOnly.gbc
bland:        GrateCrystal_Alt_VanillaTypes.gbc
crystal11:    GrateCrystal11.gbc
crystal11_vc: GrateCrystal11.patch

clean: tidy
	find gfx \
	     \( -name "*.[12]bpp" \
	        -o -name "*.lz" \
	        -o -name "*.gbcpal" \
	        -o -name "*.sgb.tilemap" \) \
	     -delete
	find gfx/pokemon -mindepth 1 \
	     ! -path "gfx/pokemon/unown/*" \
	     \( -name "bitmask.asm" \
	        -o -name "frames.asm" \
	        -o -name "front.animated.tilemap" \
	        -o -name "front.dimensions" \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(GrateCrystal_obj) \
	      $(GrateCrystal_KantoStarters_obj) \
	      $(GrateCrystal_EvolvedJohtoStarters_obj) \
	      $(GrateCrystal_EvolvedKantoStarters_obj) \
	      $(GrateCrystal_PikachuEeveeStarters_obj) \
	      $(GrateCrystal_PikachuSandshrewMarillStarters_obj) \
	      $(GrateCrystal_SixPikachuStarters_obj) \
	      $(GrateCrystal_JynxMagmarElectabuzzStarters_obj) \
	      $(GrateCrystal_HitmonStarters_obj) \
	      $(GrateCrystal_NidoranStarters_obj) \
	      $(GrateCrystal_DoduoMagnemiteDiglettStarters_obj) \
	      $(GrateCrystal_TaurosMiltankGirafarigStarters_obj) \
	      $(GrateCrystal_SnorlaxMisdreavusFarfetchd_obj) \
	      $(GrateCrystal_SlowpokeSlugmaStarters_obj) \
	      $(GrateCrystal_ShuckleSmeargleDelibirdStarters_obj) \
	      $(GrateCrystal_NewStarters1_obj) \
	      $(GrateCrystal_NewStarters2_obj) \
	      $(GrateCrystal_FossilStarters_obj) \
	      $(GrateCrystal_EvolvedFossilStarters_obj) \
	      $(GrateCrystal_DratiniLarvitarStarters_obj) \
	      $(GrateCrystal_DragoniteTyranitarStarters_obj) \
	      $(GrateCrystal_LegendaryBirdStarters_obj) \
	      $(GrateCrystal_LegendaryBeastStarters_obj) \
	      $(GrateCrystal_MewDittoMewtwoStarters_obj) \
	      $(GrateCrystal_HoOhLugiaStarters_obj) \
	      $(GrateCrystal_CelebiWobbuffetStarters_obj) \
	      $(GrateCrystal_Alt_MissingNo_obj) \
	      $(GrateCrystal_Alt_MissingnoStarters_obj) \
	      $(GrateCrystal_Alt_Turbin_obj) \
	      $(GrateCrystal_Alt_AbraShellderStarters_obj) \
	      $(GrateCrystal_StartWithHMReplacementItems_obj) \
	      $(GrateCrystal_NoExperienceGains_obj) \
	      $(GrateCrystal_NoPokemonCenterHealing_obj) \
	      $(GrateCrystal_LittleCup_obj) \
	      $(GrateCrystal_Alt_MetronomeOnly_obj) \
	      $(GrateCrystal_Alt_VanillaTypes_obj) \
	      $(GrateCrystal11_obj) \
	      $(GrateCrystal11_vc_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

tools:
	$(MAKE) -C tools/

grate:
	tools/free_space.awk BANK=all GrateCrystal.map
kanto:
	tools/free_space.awk BANK=all GrateCrystal_KantoStarters.map
evolve:
	tools/free_space.awk BANK=all GrateCrystal_EvolvedJohtoStarters.map
kantevo:
	tools/free_space.awk BANK=all GrateCrystal_EvolvedKantoStarters.map
letsgo:
	tools/free_space.awk BANK=all GrateCrystal_PikachuEeveeStarters.map
mice:
	tools/free_space.awk BANK=all GrateCrystal_PikachuSandshrewMarillStarters.map
six:
	tools/free_space.awk BANK=all GrateCrystal_SixPikachuStarters.map
jinx:
	tools/free_space.awk BANK=all GrateCrystal_JynxMagmarElectabuzzStarters.map
hit:
	tools/free_space.awk BANK=all GrateCrystal_HitmonStarters.map
nido:
	tools/free_space.awk BANK=all GrateCrystal_NidoranStarters.map
trio:
	tools/free_space.awk BANK=all GrateCrystal_DoduoMagnemiteDiglettStarters.map
cattle:
	tools/free_space.awk BANK=all GrateCrystal_TaurosMiltankGirafarigStarters.map
far:
	tools/free_space.awk BANK=all GrateCrystal_SnorlaxMisdreavusFarfetchdStarters.map
slow:
	tools/free_space.awk BANK=all GrateCrystal_SlowpokeSlugmaStarters.map
shucks:
	tools/free_space.awk BANK=all GrateCrystal_ShuckleSmeargleDelibirdStarters.map
new1:
	tools/free_space.awk BANK=all GrateCrystal_NewStarters1.map
new2:
	tools/free_space.awk BANK=all GrateCrystal_NewStarters2.map
fossil:
	tools/free_space.awk BANK=all GrateCrystal_FossilStarters.map
evossil:
	tools/free_space.awk BANK=all GrateCrystal_EvolvedFossilStarters.map
pseudo:
	tools/free_space.awk BANK=all GrateCrystal_DratiniLarvitarStarters.map
pseudevo:
	tools/free_space.awk BANK=all GrateCrystal_DragoniteTyranitarStarters.map
bird:
	tools/free_space.awk BANK=all GrateCrystal_LegendaryBirdStarters.map
beast:
	tools/free_space.awk BANK=all GrateCrystal_LegendaryBeastStarters.map
mew:
	tools/free_space.awk BANK=all GrateCrystal_MewDittoMewtwoStarters.map
dragon:
	tools/free_space.awk BANK=all GrateCrystal_HoOhLugiaStarters.map
onion:
	tools/free_space.awk BANK=all GrateCrystal_CelebiWobbuffetStarters.map
miss:
	tools/free_space.awk BANK=all GrateCrystal_Alt_MissingNo.map
no:
	tools/free_space.awk BANK=all GrateCrystal_Alt_MissingnoStarters.map
turbid:
	tools/free_space.awk BANK=all GrateCrystal_Alt_Turbin.map
startur:
	tools/free_space.awk BANK=all GrateCrystal_Alt_AbraShellderStarters.map
hm:
	tools/free_space.awk BANK=all GrateCrystal_StartWithHMReplacementItems.map
noexp:
	tools/free_space.awk BANK=all GrateCrystal_NoExperienceGains.map
centre:
	tools/free_space.awk BANK=all GrateCrystal_NoPokemonCenterHealing.map
little:
	tools/free_space.awk BANK=all GrateCrystal_LittleCup.map
metro:
	tools/free_space.awk BANK=all GrateCrystal_Alt_MetronomeOnly.map
bland:
	tools/free_space.awk BANK=all GrateCrystal_Alt_VanillaTypes.map

RGBASMFLAGS = -L -Weverything -Wnumeric-string=2 -Wtruncation=1
RGBASMFLAGS += -E

$(GrateCrystal_obj):                                    RGBASMFLAGS +=
$(GrateCrystal_KantoStarters_obj):                      RGBASMFLAGS += -D _KANTO_STARTERS
$(GrateCrystal_EvolvedJohtoStarters_obj):               RGBASMFLAGS += -D _EVOLVED_JOHTO
$(GrateCrystal_EvolvedKantoStarters_obj):               RGBASMFLAGS += -D _EVOLVED_KANTO
$(GrateCrystal_PikachuEeveeStarters_obj):               RGBASMFLAGS += -D _LETS_GO_STARTERS
$(GrateCrystal_PikachuSandshrewMarillStarters_obj):     RGBASMFLAGS += -D _MOUSEKETEERS
$(GrateCrystal_SixPikachuStarters_obj):                 RGBASMFLAGS += -D _SIX_PIKACHUS
$(GrateCrystal_JynxMagmarElectabuzzStarters_obj):       RGBASMFLAGS += -D _JYNX_MAGMAR_ELECTABUZZ
$(GrateCrystal_HitmonStarters_obj):                     RGBASMFLAGS += -D _HITMON_STARTERS
$(GrateCrystal_NidoranStarters_obj):                    RGBASMFLAGS += -D _NIDORAN_STARTERS
$(GrateCrystal_DoduoMagnemiteDiglettStarters_obj):      RGBASMFLAGS += -D _TRIO_STARTERS
$(GrateCrystal_TaurosMiltankGirafarigStarters_obj):     RGBASMFLAGS += -D _CATTLE_STARTERS
$(GrateCrystal_SnorlaxMisdreavusFarfetchdStarters_obj): RGBASMFLAGS += -D _SNORLAX_MISDREAVUS_FARFETCHD
$(GrateCrystal_SlowpokeSlugmaStarters_obj):             RGBASMFLAGS += -D _SLOW_STARTERS
$(GrateCrystal_ShuckleSmeargleDelibirdStarters_obj):    RGBASMFLAGS += -D _SHUCKLE_SMEARGLE_DELIBIRD
$(GrateCrystal_NewStarters1_obj):                       RGBASMFLAGS += -D _NEWCOMERS1
$(GrateCrystal_NewStarters2_obj):                       RGBASMFLAGS += -D _NEWCOMERS2
$(GrateCrystal_FossilStarters_obj):                     RGBASMFLAGS += -D _FOSSIL_STARTERS
$(GrateCrystal_EvolvedFossilStarters_obj):              RGBASMFLAGS += -D _EVOLVED_FOSSIL
$(GrateCrystal_DratiniLarvitarStarters_obj):            RGBASMFLAGS += -D _PSEUDO_LEGENDS
$(GrateCrystal_DragoniteTyranitarStarters_obj):         RGBASMFLAGS += -D _EVOLVED_PSEUDO
$(GrateCrystal_LegendaryBirdStarters_obj):              RGBASMFLAGS += -D _LEGENDARY_BIRDS
$(GrateCrystal_LegendaryBeastStarters_obj):             RGBASMFLAGS += -D _LEGENDARY_BEASTS
$(GrateCrystal_MewDittoMewtwoStarters_obj):             RGBASMFLAGS += -D _MEW_STARTERS
$(GrateCrystal_HoOhLugiaStarters_obj):                  RGBASMFLAGS += -D _HO_OH_LUGIA
$(GrateCrystal_CelebiWobbuffetStarters_obj):            RGBASMFLAGS += -D _CELEBI_STARTERS
$(GrateCrystal_Alt_MissingNo_obj):                      RGBASMFLAGS += -D _ADD_MISSINGNO
$(GrateCrystal_Alt_MissingnoStarters_obj):              RGBASMFLAGS += -D _MISSINGNO_STARTERS
$(GrateCrystal_Alt_Turbin_obj):                         RGBASMFLAGS += -D _ADD_TURBIN
$(GrateCrystal_Alt_AbraShellderStarters_obj):           RGBASMFLAGS += -D _TURBIN_STARTERS
$(GrateCrystal_StartWithHMReplacementItems_obj):        RGBASMFLAGS += -D _HM_ITEMS_START
$(GrateCrystal_NoExperienceGains_obj):                  RGBASMFLAGS += -D _NO_EXPERIENCE
$(GrateCrystal_NoPokemonCenterHealing_obj):             RGBASMFLAGS += -D _NO_POKEMON_CENTERS
$(GrateCrystal_LittleCup_obj):                          RGBASMFLAGS += -D _LITTLE_CUP
$(GrateCrystal_Alt_MetronomeOnly_obj):                  RGBASMFLAGS += -D _METRONOME_ONLY
$(GrateCrystal_Alt_VanillaTypes_obj):                   RGBASMFLAGS += -D _VANILLA_TYPES
$(GrateCrystal11_obj):                                  RGBASMFLAGS += -D _CRYSTAL11
$(GrateCrystal11_vc_obj):                               RGBASMFLAGS += -D _CRYSTAL11 -D _CRYSTAL11_VC

%.patch: vc/%.constants.sym %_vc.gbc %.gbc vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for shared objects objects
$(foreach obj, $(GrateCrystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))
$(foreach obj, $(GrateCrystal_KantoStarters_obj), $(eval $(call DEP,$(obj),$(obj:kanto.o=.asm))))
$(foreach obj, $(GrateCrystal_EvolvedJohtoStarters_obj), $(eval $(call DEP,$(obj),$(obj:evolve.o=.asm))))
$(foreach obj, $(GrateCrystal_EvolvedKantoStarters_obj), $(eval $(call DEP,$(obj),$(obj:kantevo.o=.asm))))
$(foreach obj, $(GrateCrystal_PikachuEeveeStarters_obj), $(eval $(call DEP,$(obj),$(obj:letsgo.o=.asm))))
$(foreach obj, $(GrateCrystal_PikachuSandshrewMarillStarters_obj), $(eval $(call DEP,$(obj),$(obj:mice.o=.asm))))
$(foreach obj, $(GrateCrystal_SixPikachuStarters_obj), $(eval $(call DEP,$(obj),$(obj:six.o=.asm))))
$(foreach obj, $(GrateCrystal_JynxMagmarElectabuzzStarters_obj), $(eval $(call DEP,$(obj),$(obj:jinx.o=.asm))))
$(foreach obj, $(GrateCrystal_HitmonStarters_obj), $(eval $(call DEP,$(obj),$(obj:hit.o=.asm))))
$(foreach obj, $(GrateCrystal_NidoranStarters_obj), $(eval $(call DEP,$(obj),$(obj:nido.o=.asm))))
$(foreach obj, $(GrateCrystal_DoduoMagnemiteDiglettStarters_obj), $(eval $(call DEP,$(obj),$(obj:trio.o=.asm))))
$(foreach obj, $(GrateCrystal_TaurosMiltankGirafarigStarters_obj), $(eval $(call DEP,$(obj),$(obj:cattle.o=.asm))))
$(foreach obj, $(GrateCrystal_SnorlaxMisdreavusFarfetchdStarters_obj), $(eval $(call DEP,$(obj),$(obj:far.o=.asm))))
$(foreach obj, $(GrateCrystal_SlowpokeSlugmaStarters_obj), $(eval $(call DEP,$(obj),$(obj:slow.o=.asm))))
$(foreach obj, $(GrateCrystal_ShuckleSmeargleDelibirdStarters_obj), $(eval $(call DEP,$(obj),$(obj:shucks.o=.asm))))
$(foreach obj, $(GrateCrystal_NewStarters1_obj), $(eval $(call DEP,$(obj),$(obj:new1.o=.asm))))
$(foreach obj, $(GrateCrystal_NewStarters2_obj), $(eval $(call DEP,$(obj),$(obj:new2.o=.asm))))
$(foreach obj, $(GrateCrystal_FossilStarters_obj), $(eval $(call DEP,$(obj),$(obj:fossil.o=.asm))))
$(foreach obj, $(GrateCrystal_EvolvedFossilStarters_obj), $(eval $(call DEP,$(obj),$(obj:evossil.o=.asm))))
$(foreach obj, $(GrateCrystal_DratiniLarvitarStarters_obj), $(eval $(call DEP,$(obj),$(obj:pseudo.o=.asm))))
$(foreach obj, $(GrateCrystal_DragoniteTyranitarStarters_obj), $(eval $(call DEP,$(obj),$(obj:pseudevo.o=.asm))))
$(foreach obj, $(GrateCrystal_LegendaryBirdStarters_obj), $(eval $(call DEP,$(obj),$(obj:bird.o=.asm))))
$(foreach obj, $(GrateCrystal_LegendaryBeastStarters_obj), $(eval $(call DEP,$(obj),$(obj:beast.o=.asm))))
$(foreach obj, $(GrateCrystal_MewDittoMewtwoStarters_obj), $(eval $(call DEP,$(obj),$(obj:mew.o=.asm))))
$(foreach obj, $(GrateCrystal_HoOhLugiaStarters_obj), $(eval $(call DEP,$(obj),$(obj:dragon.o=.asm))))
$(foreach obj, $(GrateCrystal_CelebiWobbuffetStarters_obj), $(eval $(call DEP,$(obj),$(obj:onion.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_MissingNo_obj), $(eval $(call DEP,$(obj),$(obj:miss.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_MissingnoStarters_obj), $(eval $(call DEP,$(obj),$(obj:no.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_Turbin_obj), $(eval $(call DEP,$(obj),$(obj:turbid.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_AbraShellderStarters_obj), $(eval $(call DEP,$(obj),$(obj:startur.o=.asm))))
$(foreach obj, $(GrateCrystal_StartWithHMReplacementItems_obj), $(eval $(call DEP,$(obj),$(obj:hm.o=.asm))))
$(foreach obj, $(GrateCrystal_NoExperienceGains_obj), $(eval $(call DEP,$(obj),$(obj:noexp.o=.asm))))
$(foreach obj, $(GrateCrystal_NoPokemonCenterHealing_obj), $(eval $(call DEP,$(obj),$(obj:centre.o=.asm))))
$(foreach obj, $(GrateCrystal_LittleCup_obj), $(eval $(call DEP,$(obj),$(obj:little.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_MetronomeOnly_obj), $(eval $(call DEP,$(obj),$(obj:metro.o=.asm))))
$(foreach obj, $(GrateCrystal_Alt_VanillaTypes_obj), $(eval $(call DEP,$(obj),$(obj:bland.o=.asm))))
$(foreach obj, $(GrateCrystal11_obj), $(eval $(call DEP,$(obj),$(obj:11.o=.asm))))
$(foreach obj, $(GrateCrystal11_vc_obj), $(eval $(call DEP,$(obj),$(obj:11_vc.o=.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) | rgbdscheck.o
	$(RGBASM) $< > $@

endif


GrateCrystal_opt                                     = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_KantoStarters_opt                       = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_EvolvedJohtoStarters_opt                = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_EvolvedKantoStarters_opt                = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_PikachuEeveeStarters_opt                = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_PikachuSandshrewMarillStarters_opt      = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_SixPikachuStarters_opt                  = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_JynxMagmarElectabuzzStarters_opt        = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_HitmonStarters_opt                      = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NidoranStarters_opt                     = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_DoduoMagnemiteDiglettStarters_opt       = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_TaurosMiltankGirafarigStarters_opt      = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_SnorlaxMisdreavusFarfetchdStarters_opt  = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_SlowpokeSlugmaStarters_opt              = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_ShuckleSmeargleDelibirdStarters_opt     = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NewStarters1_opt                        = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NewStarters2_opt                        = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_FossilStarters_opt                      = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_EvolvedFossilStarters_opt               = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_DratiniLarvitarStarters_opt             = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_DragoniteTyranitarStarters_opt          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_LegendaryBirdStarters_opt               = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_LegendaryBeastStarters_opt              = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_MewDittoMewtwoStarters_opt              = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_HoOhLugiaStarters_opt                   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_CelebiWobbuffetStarters_opt             = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_MissingNo_opt                       = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_MissingnoStarters_opt               = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_Turbin_opt                          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_AbraShellderStarters_opt            = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_StartWithHMReplacementItems_opt         = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NoExperienceGains_opt                   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NoPokemonCenterHealing_opt              = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_LittleCup_opt                           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_MetronomeOnly_opt                   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_Alt_VanillaTypes_opt                    = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal11_opt                                   = -Cjv -t PM_CRYSTAL -i BYTE -n 1 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal11_vc_opt                                = -Cjv -t PM_CRYSTAL -i BYTE -n 1 -k 01 -l 0x33 -m 0x10 -r 3 -p 0

GrateCrystal_base                                    = us
GrateCrystal_KantoStarters_base                      = us
GrateCrystal_EvolvedJohtoStarters_base               = us
GrateCrystal_EvolvedKantoStarters_base               = us
GrateCrystal_PikachuEeveeStarters_base               = us
GrateCrystal_PikachuSandshrewMarillStarters_base     = us
GrateCrystal_SixPikachuStarters_base                 = us
GrateCrystal_JynxMagmarElectabuzzStarters_base       = us
GrateCrystal_HitmonStarters_base                     = us
GrateCrystal_NidoranStarters_base                    = us
GrateCrystal_DoduoMagnemiteDiglettStarters_base      = us
GrateCrystal_TaurosMiltankGirafarigStarters_base     = us
GrateCrystal_SnorlaxMisdreavusFarfetchdStarters_base = us
GrateCrystal_SlowpokeSlugmaStarters_base             = us
GrateCrystal_ShuckleSmeargleDelibirdStarters_base    = us
GrateCrystal_NewStarters1_base                       = us
GrateCrystal_NewStarters2_base                       = us
GrateCrystal_FossilStarters_base                     = us
GrateCrystal_EvolvedFossilStarters_base              = us
GrateCrystal_DratiniLarvitarStarters_base            = us
GrateCrystal_DragoniteTyranitarStarters_base         = us
GrateCrystal_LegendaryBirdStarters_base              = us
GrateCrystal_LegendaryBeastStarters_base             = us
GrateCrystal_MewDittoMewtwoStarters_base             = us
GrateCrystal_HoOhLugiaStarters_base                  = us
GrateCrystal_CelebiWobbuffetStarters_base            = us
GrateCrystal_Alt_MissingNo_base                      = us
GrateCrystal_Alt_MissingnoStarters_base              = us
GrateCrystal_Alt_Turbin_base                         = us
GrateCrystal_Alt_AbraShellderStarters_base           = us
GrateCrystal_StartWithHMReplacementItems_base        = us
GrateCrystal_NoExperienceGains_base                  = us
GrateCrystal_NoPokemonCenterHealing_base             = us
GrateCrystal_LittleCup_base                          = us
GrateCrystal_Alt_MetronomeOnly_base                  = us
GrateCrystal_Alt_VanillaTypes_base                   = us
GrateCrystal11_base                                  = us
GrateCrystal11_vc_base                               = us

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -n $*.sym -m $*.map -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $($*_opt) $@


### LZ compression rules

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Misc file-specific graphics rules

gfx/pokemon/%/back.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/pokemon/egg/unused_front.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h
gfx/player/kris.2bpp: rgbgfx += -h
gfx/player/kris_back.2bpp: rgbgfx += -h

gfx/trainer_card/chris_card.2bpp: rgbgfx += -h
gfx/trainer_card/kris_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin ; tr < $< -d '\000' > $@

gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/dialpad_cursor.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball.2bpp: tools/gfx += --remove-duplicates --remove-xflip --preserve=0x39
gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/card.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_2.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/card_folder.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/phone_tiles.2bpp: tools/gfx += --remove-whitespace
gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/stadium2_n64.2bpp: tools/gfx += --trim-whitespace


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@
