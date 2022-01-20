	db DEX_PARASECT ; pokedex id

	db  90, 120,  90,  40,  80 ; 500
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBack

	db SCRATCH, STUN_SPORE, ABSORB, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      RAGE,         MEGA_DRAIN,   SOLARBEAM,    \
	     DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SLUDGE_BOMB,  GIGA_DRAIN,   \
		 LEAF_BLADE,   CUT,          FLASH
	; end

	db 0 ; padding
