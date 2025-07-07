	db DEX_MAGMAR ; pokedex id

	db  80,  60,  60, 120, 115 ; 550
	;   hp  atk  def  spd  spc

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBack

	db EMBER, SMOG, THUNDERPUNCH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     SOLARBEAM,    THUNDERBOLT,  EARTHQUAKE,   PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  METRONOME,    \
	     FIRE_BLAST,   SKULL_BASH,   REST,         PSYWAVE,      ROCK_SLIDE,   \
		 SUBSTITUTE,   DRAIN_PUNCH,  STRENGTH
	; end

	db 0 ; padding
