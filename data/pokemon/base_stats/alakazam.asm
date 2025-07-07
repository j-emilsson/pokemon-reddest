	db DEX_ALAKAZAM ; pokedex id

	db  65,  50,  60, 120, 135 ; 565
	;   hp  atk  def  spd  spc

	db PSYCHIC, PSYCHIC ; type
	db 50 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBack

	db TELEPORT, CONFUSION, KINESIS, DISABLE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     DIG,          PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
		 REFLECT,      METRONOME,    SKULL_BASH,   REST,         THUNDER_WAVE, \
		 PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   SHADOW_BALL,  DRAIN_PUNCH,  \
		 FLASH
	; end

	db 0 ; padding
