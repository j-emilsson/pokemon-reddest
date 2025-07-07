	db DEX_KABUTOPS ; pokedex id

	db  80, 125, 105, 110,  70 ; 560
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp

	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
	dw KabutopsPicFront, KabutopsPicBack

	db SCRATCH, HARDEN, WATER_GUN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, \
	     MEGA_DRAIN,   DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 GIGA_DRAIN,   CUT,          SURF
	; end

	db 0 ; padding
