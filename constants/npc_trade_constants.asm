; npctrade struct members (see data/events/npc_trades.asm)
rsreset
NPCTRADE_DIALOG   rb
NPCTRADE_GIVEMON  rb
NPCTRADE_GETMON   rb
NPCTRADE_NICKNAME rb MON_NAME_LENGTH
NPCTRADE_DVS      rw
NPCTRADE_ITEM     rb
NPCTRADE_OT_ID    rw
NPCTRADE_OT_NAME  rb NAME_LENGTH
NPCTRADE_GENDER   rb
                  rb_skip
NPCTRADE_STRUCT_LENGTH EQU _RS

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_KYLE    ;  0
	const NPC_TRADE_MIKE    ;  1
	const NPC_TRADE_FLORIA  ;  2
	const NPC_TRADE_TIM     ;  3
	const NPC_TRADE_KOJI    ;  4
	const NPC_TRADE_LIAM    ;  5
	const NPC_TRADE_EMY     ;  6
	const NPC_TRADE_JUAN    ;  7
	const NPC_TRADE_KIM     ;  8
	const NPC_TRADE_FOREST  ;  9
	const NPC_TRADE_COPYCAT ; 10
NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER ; 0
	const TRADE_GENDER_MALE   ; 1
	const TRADE_GENDER_FEMALE ; 2

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO    ; 0
	const TRADE_DIALOG_CANCEL   ; 1
	const TRADE_DIALOG_WRONG    ; 2
	const TRADE_DIALOG_COMPLETE ; 3
	const TRADE_DIALOG_AFTER    ; 4

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR ; 0
	const TRADE_DIALOGSET_HAPPY     ; 1
	const TRADE_DIALOGSET_NEWBIE    ; 2
	const TRADE_DIALOGSET_GIRL      ; 3
