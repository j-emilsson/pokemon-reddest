	db DEX_SQUIRTLE ; pokedex id

	db  44,  48,  65,  43,  50 ; 300
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp

	INCBIN "gfx/pokemon/front/squirtle.pic", 0, 1 ; sprite dimensions
	dw SquirtlePicFront, SquirtlePicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, DIG,          \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      SKULL_BASH,   \
	     REST,         SUBSTITUTE,   FLASH_CANNON, DARK_PULSE,   DRAGON_PULSE, \
		 SURF,         STRENGTH
	; end

	db 0 ; padding
