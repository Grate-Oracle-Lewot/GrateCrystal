Music_Tetris:
	musicheader 4, 1, Music_Tetris_Ch1
	musicheader 1, 2, Music_Tetris_Ch2
	musicheader 1, 3, Music_Tetris_Ch3
	musicheader 1, 4, Music_Tetris_Ch4

Music_Tetris_Ch1:
	tempo $96
	volume $77
	stereopanning $77
	callchannel Music_Tetris_Ch1_Intro ; could add the long one-time opening notes here instead
Music_Tetris_Ch1_Loop:
	dutycycle 1
	vibrato $00, $13
	notetype $C, $A5
	callchannel Music_Tetris_Ch1_Rest
	callchannel Music_Tetris_Ch1_Main1
	callchannel Music_Tetris_Ch1_Main2
	callchannel Music_Tetris_Ch1_Main1
	callchannel Music_Tetris_Ch1_Main3
	callchannel Music_Tetris_Ch1_Main4
	callchannel Music_Tetris_Ch1_Rest
	; rest for 2 additional
	note __, 16
	note __, 16
	loopchannel 0, Music_Tetris_Ch1_Loop

Music_Tetris_Ch1_Intro:
	dutycycle 2
	vibrato $00, $13
	notetype $C, $B7
	octave 3
	note D_, 16
	note __, 16
	note C#, 16
	note __, 16
	octave 2
	note B_, 16
	note __, 16
	octave 3
	note C#, 16
	note __, 16
	endchannel

Music_Tetris_Ch1_Rest:
	note __, 16
	loopchannel 8, Music_Tetris_Ch1_Rest
	endchannel

Music_Tetris_Ch1_Main1:
	octave 4
	note F#, 4
	note C#, 2
	note D_, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note B_, 2
	octave 4
	note D_, 2
	note F#, 4
	note E_, 2
	note D_, 2
	note C#, 4
	note C#, 2
	note D_, 2
	note E_, 4
	note F#, 4
	note D_, 4
	octave 3
	note B_, 4
	note B_, 4
	note __, 6
	endchannel
; part 3
Music_Tetris_Ch1_Main3:
	octave 4
	note G_, 4
	note A_, 2
	note B_, 4
	jumpchannel Music_Tetris_Ch1_Main2a
; part 2
Music_Tetris_Ch1_Main2:
	octave 4
	note E_, 4
	note G_, 2
	note B_, 4
Music_Tetris_Ch1_Main2a:
	octave 4
	note A_, 2
	note G_, 2
	note F#, 4
	note __, 2
	note D_, 2
	note F#, 4
	note E_, 2
	note D_, 2
	note C#, 4
	note C#, 2
	note D_, 2
	note E_, 4
	note F#, 4
	note D_, 4
	octave 3
	note B_, 4
	note B_, 4
	note __, 4
	endchannel

Music_Tetris_Ch1_Main4:
	octave 4
	note B_, 6
	note A_, 1
	note B_, 1
	octave 5
	note E_, 6
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	note F#, 6
	note E_, 1
	note F#, 1
	note A_, 4
	note B_, 4
	loopchannel 4, Music_Tetris_Ch1_Main4
	endchannel

Music_Tetris_Ch2_Intro:
	dutycycle 2
	vibrato $00, $13
	notetype $C, $B7
	octave 3
	note F#, 16
	note __, 16
	note E_, 16
	note __, 16
	note D_, 16
	note __, 16
	note E_, 16
	note __, 16
	endchannel

Music_Tetris_Ch2:
	; sound duty and vibrato changes between loops
	; intro notes/intro rest

	callchannel Music_Tetris_Ch2_Intro
	;notetype $C, $A5 ; for the rest
	;callchannel Music_Tetris_Ch1_Rest ; ch1 rest loops 8 times

Music_Tetris_Ch2_Loop:
	vibrato $00, $00
	sound_duty $50
	notetype $6, $A5 ; 6 is the length of the note(in frames?) and A5 is the envelope
	octave 2
	note A_, 2
	note B_, 2
	note B_, 2

	octave 3
	note B_, 2

	octave 2
	note B_, 2
	note B_, 2

	octave 4
	note D_, 2

	octave 2
	note B_, 2

	octave 3
	note B_, 2

	octave 2
	note B_, 2

	octave 4
	note D_, 2

	octave 2
	note B_, 2

	octave 3
	note E_, 2
	note A_, 2

	octave 2
	note B_, 2

	octave 3
	note D_, 2

	loopchannel 7, Music_Tetris_Ch2_Loop
	;fallthrough
Music_Tetris_Ch2_Main1End:
	octave 2
	note A_, 2
	note B_, 2
	note B_, 2

	octave 3
	note B_, 2

	octave 2
	note B_, 2
	note B_, 2

	octave 4
	note D_, 2

	octave 2
	note B_, 2

	octave 3
	note B_, 2

	octave 2
	note B_, 2

	octave 4
	note D_, 2

	octave 2
	note B_, 2
	note __, 8
	;fallthrough
Music_TetrisTest_Ch2_Main2:
	notetype $C, $A7
	sound_duty $AA
	octave 3
	note C#, 16
	note D_, 16
	note C#, 16

	note D_, 8

	note C#, 4
	note D_, 4

	note E_, 16
	note D_, 16
	note C#, 16
	note D_, 16
	;fallthrough
Music_TetrisTest_Ch2_Main3:
	notetype $C, $A7
	sound_duty $AA
	octave 4
	note E_, 4
	octave 3
	note A#, 2
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A#, 2
	note F#, 4
	note F#, 2
	note B_, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A#, 4
	note A#, 2
	note B_, 2
	octave 4
	note C#, 4
	note D_, 4
	octave 3
	note B_, 4
	note F#, 4
	note F#, 4

	note __, 6

	octave 4
	note E_, 4
	note F#, 2
	note G_, 4
	note F#, 2
	note E_, 2
	note D_,  4
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 4
	note C#, 2
	octave 3
	note B_, 2
	note A#, 4
	note A#, 2
	note B_, 2
	octave 4
	note C#, 4
	note D_, 4
	octave 3
	note B_, 4
	note F#, 4
	note F#, 4
	octave 7
	note __, 4
	;fallthrough

	sound_duty $FF
	vibrato $00, $12
	notetype $6, $A7
Music_TetrisTest_Ch2_Main4:
	octave 3

	note C#, 2
	note __, 2
	note C#, 2
	note C#, 2

	note __, 2
	note C#, 2
	note C#, 2
	note __, 2

	note E_, 2
	note __, 2
	note F#, 2
	note E_, 2

	note __, 2
	note F#, 2
	note E_, 2
	note __, 2

	octave 2

	note B_, 2
	note __, 2
	note B_, 2
	note B_, 2

	note __, 2
	note B_, 2
	note B_, 2
	note __, 2

	octave 3

	note D_, 2
	note __, 2
	note E_, 2
	note D_, 2

	note __, 2
	note E_, 2
	note D_, 2
	note __, 2

	loopchannel 4, Music_TetrisTest_Ch2_Main4
	;fallthrough
;Rainbow loop

	notetype $6, $A7
	sound_duty $AA
	;sound_duty $00 ; normal
	;sound_duty $05
	callchannel Music_TetrisTest_Ch2_Rainbow
	sound_duty $AB
	;sound_duty $55 ; normal
	;sound_duty $50
	callchannel Music_TetrisTest_Ch2_Rainbow
	sound_duty $AC
	;sound_duty $AA ; normal
	;sound_duty $A5
	callchannel Music_TetrisTest_Ch2_Rainbow
	sound_duty $AD
	;sound_duty $FF ; normal
	;sound_duty $FA
	callchannel Music_TetrisTest_Ch2_Rainbow
	; insert rest
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	; insert loop
	loopchannel 0, Music_Tetris_Ch2_Loop

Music_TetrisTest_Ch2_Rainbow:
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	note F#, 2
	note B_, 2
	octave 3
	note E_, 2
	note F#, 2
	note B_, 2
	octave 4
	note E_, 2
	note F#, 2
	note E_, 2
	octave 3
	note B_, 2
	note F#, 2
	note E_, 2
	octave 2
	note B_, 2
	note F#, 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note F#, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note D_, 2
	octave 3
	note B_, 2
	note F#, 2
	note D_, 2
	octave 2
	note B_, 2
	note F#, 2
	note D_, 2
	endchannel

Music_Tetris_Ch3:
	dutycycle 7 ; instrument
	vibrato $00, $13
;main loop
Music_Tetris_Ch3_MainLoop1:
	callchannel Music_Tetris_Ch3_Main
	loopchannel 8, Music_Tetris_Ch3_MainLoop1
Music_Tetris_Ch3_Loop:
	callchannel Music_Tetris_Ch3_Main
	loopchannel 7, Music_Tetris_Ch3_Loop
	jumpchannel Music_Tetris_Ch3_DrumSoloBassEnd

Music_Tetris_Ch3_MainLoop3:
	callchannel Music_Tetris_Ch3_Main
	loopchannel 18, Music_Tetris_Ch3_MainLoop3
	loopchannel 0, Music_Tetris_Ch3_Loop


Music_Tetris_Ch3_Main:
	notetype $6, $17
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 3
	note __, 1
	endchannel

Music_Tetris_Ch3_DrumSoloBassEnd:
	notetype $6, $17
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 9
	; fallthrough

Music_Tetris_Ch3_MainMedley:
	notetype $6, $17
	octave 1
	note F#, 4
	note __, 2
	note F#, 4
	note __, 2
	note F#, 4
	note __, 4
	note F#, 4
	note __, 4
	note F#, 4

	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 4
	note __, 4
	note B_, 4
	note __, 4
	note B_, 4

	note A#, 4
	note __, 2
	note A#, 4
	note __, 2
	note F#, 4
	note __, 4
	note F#, 4
	note __, 4
	note F#, 4

	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 4
	note __, 4
	note B_, 4
	octave 2
	note C#, 4
	note D_, 4

	note E_, 4
	note __, 2
	note E_, 4
	note __, 2
	note E_, 4
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4

	note D_, 4
	note __, 2
	note D_, 4
	note __, 2
	note D_, 4
	note __, 4
	note D_, 4
	note __, 4
	note D_, 4

	note C#, 4
	note __, 2
	note C#, 4
	note __, 2
	octave 1
	note F#, 4
	note __, 4
	note F#, 4
	note __, 4
	note F#, 4

	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 4
	note __, 4
	note B_, 4
	note __, 4
	note B_, 4


	loopchannel 2, Music_Tetris_Ch3_MainMedley ;loops twice
	jumpchannel Music_Tetris_Ch3_MainLoop3


;--------------------------------------------------------------------
;----------------------------CHANNEL 4-------------------------------
;--------------------------------------------------------------------

Music_Tetris_Ch4:
	;endchannel
	togglenoise 0
	notetype $1
	;callchannel Music_Tetris_Ch4_DrumBeat1 ; loops 8 times
	callchannel Music_Tetris_Ch4_BigRest
Music_Tetris_Ch4_loop:
	callchannel Music_Tetris_Ch4_DrumBeat2 ; loops 7 times
	callchannel Music_Tetris_Ch4_DrumSolo1 ; plays once
	callchannel Music_Tetris_Ch4_DrumBeat1 ; loops 8 times

	;callchannel Music_Tetris_Ch4_DrumBeat1 ; loops 8 times
	callchannel Music_Tetris_Ch4_DrumBeat2 ; loops 7 times
	callchannel Music_Tetris_Ch4_DrumSolo1 ; plays once

	callchannel Music_Tetris_Ch4_DrumBeat4 ; loops 4 times
	callchannel Music_Tetris_Ch4_DrumBeat3 ; loops 31 times
	callchannel Music_Tetris_Ch4_DrumSolo2 ; plays once
	; wait two seconds
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16 ; tweak ?
	loopchannel 0, Music_Tetris_Ch4_loop

Music_Tetris_Ch4_BigRest:
	note __, 16
	loopchannel 96, Music_Tetris_Ch4_BigRest
	jumpchannel Music_Tetris_Ch4_loop

; beat type 1
Music_Tetris_Ch4_DrumBeat1:
	note D_, 11
	note __, 13

	note G#, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 12
	note C_, 12
	note D_, 12
	note C_, 12

	note D_, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 11
	note __, 13
; end beat type 1
	loopchannel 8, Music_Tetris_Ch4_DrumBeat1
	endchannel

; beat type 2
Music_Tetris_Ch4_DrumBeat2:
	note E_, 11
	note __, 13

	note G#, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 12
	note C_, 12
	note E_, 12
	note C_, 12

	note E_, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 11
	note __, 13
; end beat type 2
	loopchannel 7, Music_Tetris_Ch4_DrumBeat2
	endchannel

Music_Tetris_Ch4_DrumBeat3:
; beat type 3
	note __, 12
	note __, 12
	note G#, 12
	note __, 12
; end beat type 3
	loopchannel 31, Music_Tetris_Ch4_DrumBeat3
	endchannel

;drum solo 1
Music_Tetris_Ch4_DrumSolo1:
	note E_, 11
	note __, 13

	note G#, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 12
	note C_, 12
	note E_, 12
	note C_, 12

	note E_, 11
	note __, 13

;overflows into solo 2
Music_Tetris_Ch4_DrumSolo2:
	note A#, 12
	note A#, 12
	note A#, 12
	note A#, 12
; end drum solo 2
	endchannel

Music_Tetris_Ch4_DrumBeat4:
	note D_, 11
	note __, 13

	note G#, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 12
	note C_, 12
	note D_, 12
	note C_, 12

	note D_, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 11
	note __, 13

	note E_, 11
	note __, 13

	note G#, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 12
	note C_, 12
	note E_, 12
	note C_, 12

	note E_, 11
	note __, 13

	note A#, 11
	note __, 13

	note G#, 11
	note __, 13
; end beat type 2
	loopchannel 4, Music_Tetris_Ch4_DrumBeat4
	endchannel
