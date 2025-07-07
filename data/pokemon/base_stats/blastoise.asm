	db DEX_BLASTOISE ; pokedex id

	db  85,  60, 115,  80, 110 ; 560
	;   hp  atk  def  spd  spc

	db WATER, STEEL ; type
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
	dw BlastoisePicFront, BlastoisePicBack

	db TACKLE, TAIL_WHIP, WATER_GUN, FLASH_CANNON ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, EARTHQUAKE,   \
		       DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
		 SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   FLASH_CANNON, \
		 DARK_PULSE,   DRAGON_PULSE, CUT,          SURF,         STRENGTH
	; end

	db 0 ; padding
