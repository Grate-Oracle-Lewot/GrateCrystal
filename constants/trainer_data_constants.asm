; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
rsreset
TRNATTR_ITEM1           rb ; 0
TRNATTR_ITEM2           rb ; 1
TRNATTR_BASEMONEY       rb ; 2
TRNATTR_AI_MOVE_WEIGHTS rw ; 3
TRNATTR_AI_ITEM_SWITCH  rw ; 5
NUM_TRAINER_ATTRIBUTES EQU _RS

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
	shift_const AI_BASIC        ; 0
	shift_const AI_SETUP        ; 1
	shift_const AI_TYPES        ; 2
	shift_const AI_OFFENSIVE    ; 3
	shift_const AI_SMART        ; 4
	shift_const AI_OPPORTUNIST  ; 5
	shift_const AI_AGGRESSIVE   ; 6
	shift_const AI_CAUTIOUS     ; 7
	shift_const AI_STATUS       ; 0
	shift_const AI_RISKY        ; 1
	shift_const AI_PRAGMATIC    ; 2
	shift_const AI_TROLL        ; 3
	shift_const AI_SIMPLE       ; 4
	shift_const AI_STUBBORN     ; 5
	shift_const AI_IMMUNITIES   ; 6
	shift_const AI_AGGRESSIVE_2 ; 7
NO_AI EQU 0

; TRNATTR_AI_ITEM_SWITCH bit flags
	const_def
	const SWITCH_SOMETIMES_F ; 0
	const SWITCH_OFTEN_F     ; 1
	const SWITCH_RARELY_F    ; 2
	const SWITCH_STATUS_F    ; 3
	const CONTEXT_USE_F      ; 4
	const ALWAYS_USE_F       ; 5

SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_STATUS      EQU 1 << SWITCH_STATUS_F
CONTEXT_USE        EQU 1 << CONTEXT_USE_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F

; TrainerTypes bits (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_MOVES_F    ; 0
	const TRAINERTYPE_ITEM_F     ; 1
	const TRAINERTYPE_NICKNAME_F ; 2
	const TRAINERTYPE_DVS_F      ; 3
	const TRAINERTYPE_STAT_EXP_F ; 4

; Trainer party types (see data/trainers/parties.asm)
TRAINERTYPE_NORMAL     EQU 0
TRAINERTYPE_MOVES      EQU 1 << TRAINERTYPE_MOVES_F
TRAINERTYPE_ITEM       EQU 1 << TRAINERTYPE_ITEM_F
TRAINERTYPE_NICKNAME   EQU 1 << TRAINERTYPE_NICKNAME_F
TRAINERTYPE_DVS        EQU 1 << TRAINERTYPE_DVS_F
TRAINERTYPE_STAT_EXP   EQU 1 << TRAINERTYPE_STAT_EXP_F
