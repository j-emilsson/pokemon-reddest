	db DEX_KABUTO ; pokedex id

	db  50,  90,  90,  85,  45 ; 405
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
	dw KabutoPicFront, KabutoPicBack

	db SCRATCH, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     MEGA_DRAIN,   \
	     DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   GIGA_DRAIN,   SURF
	; end

	db 0 ; padding
