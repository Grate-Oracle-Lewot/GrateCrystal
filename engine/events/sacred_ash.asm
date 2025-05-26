_SacredAsh:
	ld hl, SacredAshScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

SacredAshScript:
	special HealParty
	reloadmappart
	playsound SFX_WARP_TO
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	opentext
	writetext .UseSacredAshText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	closetext
	end

.UseSacredAshText:
	text_far _UseSacredAshText
	text_end
