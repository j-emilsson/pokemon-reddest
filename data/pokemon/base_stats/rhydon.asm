	db DEX_RHYDON ; pokedex id

	db 115, 130, 120,  50,  65 ; 545
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, MEGA_PUNCH,   MEGA_KICK,    TOXIC,        HORN_DRILL,   \
	     BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE,   OUTRAGE,      CRUNCH,       IRON_HEAD,    FLASH_CANNON, \
		 EARTH_POWER,  POISON_JAB,   DRAGON_PULSE, CUT,          SURF,         \
		 STRENGTH
	; end

	db 0 ; padding
