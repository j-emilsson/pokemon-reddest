	db DEX_PRIMEAPE ; pokedex id

	db 110, 120,  60, 120,  60 ; 530
	;   hp  atk  def  spd  spc

	db FIGHTING, DARK ; type
	db 75 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBack

	db SCRATCH, LEER, LOW_KICK, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	           DIG,          MIMIC,        DOUBLE_TEAM,  \
	     METRONOME,    SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   \
		 SUBSTITUTE,   DRAIN_PUNCH,  POISON_JAB,   DARK_PULSE,   STRENGTH
	; end

	db 0 ; padding
