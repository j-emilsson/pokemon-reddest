	db DEX_CHANSEY ; pokedex id

	db 250,   5,  35,  40, 110 ; 550
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
	dw ChanseyPicFront, ChanseyPicBack

	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, SOLARBEAM,    \
		 THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     MIMIC,        \
		 DOUBLE_TEAM,  REFLECT,      METRONOME,    EGG_BOMB,     FIRE_BLAST,   \
		 SKULL_BASH,   SOFTBOILED,   DREAM_EATER,  REST,         THUNDER_WAVE, \
		 PSYWAVE,      ROCK_SLIDE,   TRI_ATTACK,   SUBSTITUTE,   SHADOW_BALL,  \
		 DRAIN_PUNCH,  STRENGTH,     FLASH
	; end

	db 0 ; padding
