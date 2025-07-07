	db DEX_PARASECT ; pokedex id

	db 120, 125,  95,  50,  75 ; 540
	;   hp  atk  def  spd  spc

	db GRASS, GHOST ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBack

	db SCRATCH, ABSORB, LICK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   SOLARBEAM,    \
	     DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SLUDGE_BOMB,  GIGA_DRAIN,   \
		 CUT,          FLASH
	; end

	db 0 ; padding
