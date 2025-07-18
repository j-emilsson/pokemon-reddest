	db DEX_SANDSLASH ; pokedex id

	db  85, 110, 115,  95,  60 ; 525
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 90 ; catch rate
	db 163 ; base exp

	INCBIN "gfx/pokemon/front/sandslash.pic", 0, 1 ; sprite dimensions
	dw SandslashPicFront, SandslashPicBack

	db SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, EARTHQUAKE,   \
	           DIG,          MIMIC,        DOUBLE_TEAM,  \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     FLASH_CANNON, POISON_JAB,   CUT,          STRENGTH
	; end

	db 0 ; padding
