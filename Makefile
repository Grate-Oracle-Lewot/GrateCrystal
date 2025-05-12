roms := \
	GrateCrystal.gbc \
	GrateCrystal_KantoStarters.gbc \
	GrateCrystal_PikachuEevee.gbc \
	GrateCrystal_PikachuSandshrewMarill.gbc \
	GrateCrystal_JynxMagmarElectabuzz.gbc \
	GrateCrystal_HitmonStarters.gbc \
	GrateCrystal_NidoranStarters.gbc \
	GrateCrystal_TaurosMiltankGirafarig.gbc \
	GrateCrystal_SlowpokeSlugma \
	GrateCrystal_ShuckleSmeargleDelibird.gbc \
	GrateCrystal_NewStarters1.gbc \
	GrateCrystal_NewStarters2.gbc \
	GrateCrystal_FossilStarters.gbc \
	GrateCrystal_DratiniLarvitar.gbc \
	GrateCrystal_LegendaryBirds.gbc \
	GrateCrystal_LegendaryBeasts.gbc \
	GrateCrystal_MewDittoMewtwo.gbc \
	GrateCrystal_HoOhLugia.gbc \
	GrateCrystal_CelebiWobbuffet.gbc \
	GrateCrystal_MissingNo.gbc \
	GrateCrystal_MissingnoStarters.gbc \
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

GrateCrystal_obj                         := $(rom_obj:.o=.o)
GrateCrystal_KantoStarters_obj           := $(rom_obj:.o=kanto.o)
GrateCrystal_PikachuEevee_obj            := $(rom_obj:.o=letsgo.o)
GrateCrystal_PikachuSandshrewMarill_obj  := $(rom_obj:.o=mice.o)
GrateCrystal_JynxMagmarElectabuzz_obj    := $(rom_obj:.o=jinx.o)
GrateCrystal_HitmonStarters_obj          := $(rom_obj:.o=hitmon.o)
GrateCrystal_NidoranStarters_obj         := $(rom_obj:.o=nido.o)
GrateCrystal_TaurosMiltankGirafarig_obj  := $(rom_obj:.o=cattle.o)
GrateCrystal_SlowpokeSlugma_obj          := $(rom_obj:.o=slow.o)
GrateCrystal_ShuckleSmeargleDelibird_obj := $(rom_obj:.o=shucks.o)
GrateCrystal_NewStarters1_obj            := $(rom_obj:.o=new1.o)
GrateCrystal_NewStarters2_obj            := $(rom_obj:.o=new2.o)
GrateCrystal_FossilStarters_obj          := $(rom_obj:.o=fossil.o)
GrateCrystal_DratiniLarvitar_obj         := $(rom_obj:.o=pseudo.o)
GrateCrystal_LegendaryBirds_obj          := $(rom_obj:.o=bird.o)
GrateCrystal_LegendaryBeasts_obj         := $(rom_obj:.o=beast.o)
GrateCrystal_MewDittoMewtwo_obj          := $(rom_obj:.o=mew.o)
GrateCrystal_HoOhLugia_obj               := $(rom_obj:.o=dragon.o)
GrateCrystal_CelebiWobbuffet_obj         := $(rom_obj:.o=onion.o)
GrateCrystal_MissingNo_obj               := $(rom_obj:.o=miss.o)
GrateCrystal_MissingnoStarters_obj       := $(rom_obj:.o=no.o)
GrateCrystal11_obj                       := $(rom_obj:.o=11.o)
GrateCrystal11_vc_obj                    := $(rom_obj:.o=11_vc.o)


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
.PHONY: all crystal kanto letsgo mice jinx hitmon nido cattle slow shucks new1 new2 fossil pseudo bird beast mew dragon onion miss no crystal11 clean tidy tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: crystal
crystal:      GrateCrystal.gbc
kanto:        GrateCrystal_KantoStarters.gbc
letsgo:       GrateCrystal_PikachuEevee.gbc
mice:         GrateCrystal_PikachuSandshrewMarill.gbc
jinx:         GrateCrystal_JynxMagmarElectabuzz.gbc
hitmon:       GrateCrystal_HitmonStarters.gbc
nido:         GrateCrystal_NidoranStarters.gbc
cattle:       GrateCrystal_TaurosMiltankGirafarig.gbc
slow:         GrateCrystal_SlowpokeSlugma.gbc
shucks:       GrateCrystal_ShuckleSmeargleDelibird.gbc
new1:         GrateCrystal_NewStarters1.gbc
new2:         GrateCrystal_NewStarters1.gbc
fossil:       GrateCrystal_FossilStarters.gbc
pseudo:       GrateCrystal_DratiniLarvitar.gbc
bird:         GrateCrystal_LegendaryBirds.gbc
beast:        GrateCrystal_LegendaryBeasts.gbc
mew:          GrateCrystal_MewDittoMewtwo.gbc
dragon:       GrateCrystal_HoOhLugia.gbc
onion:        GrateCrystal_CelebiWobbuffet.gbc
miss:         GrateCrystal_MissingNo.gbc
no:           GrateCrystal_MissingnoStarters.gbc
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
	      $(GrateCrystal_PikachuEevee_obj) \
	      $(GrateCrystal_PikachuSandshrewMarill_obj) \
	      $(GrateCrystal_JynxMagmarElectabuzz_obj) \
	      $(GrateCrystal_HitmonStarters_obj) \
	      $(GrateCrystal_NidoranStarters_obj) \
	      $(GrateCrystal_TaurosMiltankGirafarig_obj) \
	      $(GrateCrystal_SlowpokeSlugma_obj) \
	      $(GrateCrystal_ShuckleSmeargleDelibird_obj) \
	      $(GrateCrystal_NewStarters1_obj) \
	      $(GrateCrystal_NewStarters2_obj) \
	      $(GrateCrystal_FossilStarters_obj) \
	      $(GrateCrystal_DratiniLarvitar_obj) \
	      $(GrateCrystal_LegendaryBirds_obj) \
	      $(GrateCrystal_LegendaryBeasts_obj) \
	      $(GrateCrystal_MewDittoMewtwo_obj) \
	      $(GrateCrystal_HoOhLugia_obj) \
	      $(GrateCrystal_CelebiWobbuffet_obj) \
	      $(GrateCrystal_MissingNo_obj) \
	      $(GrateCrystal_MissingnoStarters_obj) \
	      $(GrateCrystal11_obj) \
	      $(GrateCrystal11_vc_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

tools:
	$(MAKE) -C tools/

all:
	tools/free_space.awk BANK=all GrateCrystal.map

RGBASMFLAGS = -L -Weverything -Wnumeric-string=2 -Wtruncation=1
RGBASMFLAGS += -E

$(GrateCrystal_obj):                         RGBASMFLAGS +=
$(GrateCrystal_KantoStarters_obj):           RGBASMFLAGS += -D _KANTO_STARTERS
$(GrateCrystal_PikachuEevee_obj):            RGBASMFLAGS += -D _LETS_GO_STARTERS
$(GrateCrystal_PikachuSandshrewMarill_obj):  RGBASMFLAGS += -D _MOUSEKETEERS
$(GrateCrystal_JynxMagmarElectabuzz_obj):    RGBASMFLAGS += -D _JYNX_MAGMAR_ELECTABUZZ
$(GrateCrystal_HitmonStarters_obj):          RGBASMFLAGS += -D _HITMON_STARTERS
$(GrateCrystal_NidoranStarters_obj):         RGBASMFLAGS += -D _NIDORAN_STARTERS
$(GrateCrystal_TaurosMiltankGirafarig_obj):  RGBASMFLAGS += -D _CATTLE_STARTERS
$(GrateCrystal_SlowpokeSlugma_obj):          RGBASMFLAGS += -D _SLOW_STARTERS
$(GrateCrystal_ShuckleSmeargleDelibird_obj): RGBASMFLAGS += -D _SHUCKLE_SMEARGLE_DELIBIRD
$(GrateCrystal_NewStarters1_obj):            RGBASMFLAGS += -D _NEWCOMERS1
$(GrateCrystal_NewStarters2_obj):            RGBASMFLAGS += -D _NEWCOMERS2
$(GrateCrystal_FossilStarters_obj):          RGBASMFLAGS += -D _FOSSIL_STARTERS
$(GrateCrystal_DratiniLarvitar_obj):         RGBASMFLAGS += -D _PSEUDO_LEGENDS
$(GrateCrystal_LegendaryBirds_obj):          RGBASMFLAGS += -D _LEGENDARY_BIRDS
$(GrateCrystal_LegendaryBeasts_obj):         RGBASMFLAGS += -D _LEGENDARY_BEASTS
$(GrateCrystal_MewDittoMewtwo_obj):          RGBASMFLAGS += -D _MEW_STARTERS
$(GrateCrystal_HoOhLugia_obj):               RGBASMFLAGS += -D _HO_OH_LUGIA
$(GrateCrystal_CelebiWobbuffet_obj):         RGBASMFLAGS += -D _CELEBI_STARTERS
$(GrateCrystal_MissingNo_obj):               RGBASMFLAGS += -D _ADD_MISSINGNO
$(GrateCrystal_MissingnoStarters_obj):       RGBASMFLAGS += -D _MISSINGNO_STARTERS
$(GrateCrystal11_obj):                       RGBASMFLAGS += -D _CRYSTAL11
$(GrateCrystal11_vc_obj):                    RGBASMFLAGS += -D _CRYSTAL11 -D _CRYSTAL11_VC

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
$(foreach obj, $(GrateCrystal_PikachuEevee_obj), $(eval $(call DEP,$(obj),$(obj:letsgo.o=.asm))))
$(foreach obj, $(GrateCrystal_PikachuSandshrewMarill_obj), $(eval $(call DEP,$(obj),$(obj:mice.o=.asm))))
$(foreach obj, $(GrateCrystal_JynxMagmarElectabuzz_obj), $(eval $(call DEP,$(obj),$(obj:jinx.o=.asm))))
$(foreach obj, $(GrateCrystal_HitmonStarters_obj), $(eval $(call DEP,$(obj),$(obj:hitmon.o=.asm))))
$(foreach obj, $(GrateCrystal_NidoranStarters_obj), $(eval $(call DEP,$(obj),$(obj:nido.o=.asm))))
$(foreach obj, $(GrateCrystal_TaurosMiltankGirafarig_obj), $(eval $(call DEP,$(obj),$(obj:cattle.o=.asm))))
$(foreach obj, $(GrateCrystal_SlowpokeSlugma_obj), $(eval $(call DEP,$(obj),$(obj:slow.o=.asm))))
$(foreach obj, $(GrateCrystal_ShuckleSmeargleDelibird_obj), $(eval $(call DEP,$(obj),$(obj:shucks.o=.asm))))
$(foreach obj, $(GrateCrystal_NewStarters1_obj), $(eval $(call DEP,$(obj),$(obj:new1.o=.asm))))
$(foreach obj, $(GrateCrystal_NewStarters2_obj), $(eval $(call DEP,$(obj),$(obj:new2.o=.asm))))
$(foreach obj, $(GrateCrystal_FossilStarters_obj), $(eval $(call DEP,$(obj),$(obj:fossil.o=.asm))))
$(foreach obj, $(GrateCrystal_DratiniLarvitar_obj), $(eval $(call DEP,$(obj),$(obj:pseudo.o=.asm))))
$(foreach obj, $(GrateCrystal_LegendaryBirds_obj), $(eval $(call DEP,$(obj),$(obj:bird.o=.asm))))
$(foreach obj, $(GrateCrystal_LegendaryBeasts_obj), $(eval $(call DEP,$(obj),$(obj:beast.o=.asm))))
$(foreach obj, $(GrateCrystal_MewDittoMewtwo_obj), $(eval $(call DEP,$(obj),$(obj:mew.o=.asm))))
$(foreach obj, $(GrateCrystal_HoOhLugia_obj), $(eval $(call DEP,$(obj),$(obj:dragon.o=.asm))))
$(foreach obj, $(GrateCrystal_CelebiWobbuffet_obj), $(eval $(call DEP,$(obj),$(obj:onion.o=.asm))))
$(foreach obj, $(GrateCrystal_MissingNo_obj), $(eval $(call DEP,$(obj),$(obj:miss.o=.asm))))
$(foreach obj, $(GrateCrystal_MissingnoStarters_obj), $(eval $(call DEP,$(obj),$(obj:no.o=.asm))))
$(foreach obj, $(GrateCrystal11_obj), $(eval $(call DEP,$(obj),$(obj:11.o=.asm))))
$(foreach obj, $(GrateCrystal11_vc_obj), $(eval $(call DEP,$(obj),$(obj:11_vc.o=.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) | rgbdscheck.o
	$(RGBASM) $< > $@

endif


GrateCrystal_opt                          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_KantoStarters_opt            = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_PikachuEevee_opt             = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_PikachuSandshrewMarill_opt   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_JynxMagmarElectabuzz_opt     = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_HitmonStarters_opt           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NidoranStarters_opt          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_TaurosMiltankGirafarig_opt   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_SlowpokeSlugma_opt           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_ShuckleSmeargleDelibird_opt  = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NewStarters1_opt             = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_NewStarters2_opt             = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_FossilStarters_opt           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_DratiniLarvitar_opt          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_LegendaryBirds_opt           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_LegendaryBeasts_opt          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_MewDittoMewtwo_opt           = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_HoOhLugia_opt                = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_CelebiWobbuffet_opt          = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_MissingNo_opt                = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal_MissingnoStarters_opt        = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal11_opt                        = -Cjv -t PM_CRYSTAL -i BYTE -n 1 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
GrateCrystal11_vc_opt                     = -Cjv -t PM_CRYSTAL -i BYTE -n 1 -k 01 -l 0x33 -m 0x10 -r 3 -p 0

GrateCrystal_base                         = us
GrateCrystal_KantoStarters_base           = us
GrateCrystal_PikachuEevee_base            = us
GrateCrystal_PikachuSandshrewMarill_base  = us
GrateCrystal_JynxMagmarElectabuzz_base    = us
GrateCrystal_HitmonStarters_base          = us
GrateCrystal_NidoranStarters_base         = us
GrateCrystal_TaurosMiltankGirafarig_base  = us
GrateCrystal_SlowpokeSlugma_base          = us
GrateCrystal_ShuckleSmeargleDelibird_base = us
GrateCrystal_NewStarters1_base            = us
GrateCrystal_NewStarters2_base            = us
GrateCrystal_FossilStarters_base          = us
GrateCrystal_DratiniLarvitar_base         = us
GrateCrystal_LegendaryBirds_base          = us
GrateCrystal_LegendaryBeasts_base         = us
GrateCrystal_MewDittoMewtwo_base          = us
GrateCrystal_HoOhLugia_base               = us
GrateCrystal_CelebiWobbuffet_base         = us
GrateCrystal_MissingNo_base               = us
GrateCrystal_MissingnoStarters_base       = us
GrateCrystal11_base                       = us
GrateCrystal11_vc_base                    = us

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
