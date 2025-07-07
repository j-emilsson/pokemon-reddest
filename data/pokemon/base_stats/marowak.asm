	db DEX_MAROWAK ; pokedex id

	db  90, 115, 125,  70,  70 ; 540
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 75 ; catch rate
	db 124 ; base exp

	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
	dw MarowakPicFront, MarowakPicBack

	db BONE_CLUB, GROWL, LEER, HEADBUTT ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     EARTHQUAKE,         DIG,          MIMIC,        \
	     DOUBLE_TEAM,  FIRE_BLAST,   SKULL_BASH,   DREAM_EATER,  \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   SHADOW_BALL,  DARK_PULSE,   \ 
		 STRENGTH
	; end

	db 0 ; padding
