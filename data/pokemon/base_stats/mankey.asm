	db DEX_MANKEY ; pokedex id

	db  70,  85,  50,  70,  45 ; 365
	;   hp  atk  def  spd  spc

	db FIGHTING, DARK ; type
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBack

	db SCRATCH, LEER, LOW_KICK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     THUNDERBOLT,  THUNDER,      EARTHQUAKE,         \
	     DIG,          MIMIC,        DOUBLE_TEAM,  METRONOME,    \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 DRAIN_PUNCH,  POISON_JAB,   DARK_PULSE,   STRENGTH
	; end

	db 0 ; padding
