	db DEX_ABRA ; pokedex id

	db  35,  20,  30,  90, 105 ; 385
	;   hp  atk  def  spd  spc

	db PSYCHIC, PSYCHIC ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBack

	db CONFUSION, TELEPORT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, PSYCHIC_M,    \
		 TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      METRONOME,    \
		 SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      TRI_ATTACK,   \
		 SUBSTITUTE,   SHADOW_BALL,  DRAIN_PUNCH,  FLASH
	; end

	db 0 ; padding
