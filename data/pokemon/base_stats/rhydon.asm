	db DEX_RHYDON ; pokedex id

	db 110, 130, 120,  50,  65 ; 540
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, MEGA_PUNCH,   MEGA_KICK,    TOXIC,           \
	     BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,         DIG,          MIMIC,        DOUBLE_TEAM,  \
	     FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE,   FLASH_CANNON, POISON_JAB,   DRAGON_PULSE, CUT,          \
		 SURF,         STRENGTH
	; end

	db 0 ; padding
