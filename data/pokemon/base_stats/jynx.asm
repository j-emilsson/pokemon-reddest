	db DEX_JYNX ; pokedex id

	db  75,  50,  65, 110, 125 ; 550
	;   hp  atk  def  spd  spc

	db ICE, PSYCHIC ; type
	db 45 ; catch rate
	db 137 ; base exp

	INCBIN "gfx/pokemon/front/jynx.pic", 0, 1 ; sprite dimensions
	dw JynxPicFront, JynxPicBack

	db POUND, LOVELY_KISS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     METRONOME,    SKULL_BASH,   DREAM_EATER,  REST,         \
	     PSYWAVE,      SUBSTITUTE,   SHADOW_BALL,  DRAIN_PUNCH,  FLASH
	; end

	db 0 ; padding
