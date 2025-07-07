	db DEX_CUBONE ; pokedex id

	db  70,  85, 105,  55,  55 ; 425
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 190 ; catch rate
	db 87 ; base exp

	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
	dw CubonePicFront, CubonePicBack

	db BONE_CLUB, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     EARTHQUAKE,         DIG,          MIMIC,        DOUBLE_TEAM,  \
	     FIRE_BLAST,   SKULL_BASH,   DREAM_EATER,  REST,         \
		 ROCK_SLIDE,   SUBSTITUTE,   SHADOW_BALL,  DARK_PULSE,   STRENGTH
	; end

	db 0 ; padding
