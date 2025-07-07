	db DEX_LICKITUNG ; pokedex id

	db  155, 110, 100, 50, 80 ; 575
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 45 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db LICK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	           MIMIC,        DOUBLE_TEAM,  SELFDESTRUCT, \
		 FIRE_BLAST,   SKULL_BASH,   DREAM_EATER,  REST,         ROCK_SLIDE,   \
		 SUBSTITUTE,   SHADOW_BALL,  SHOCK_WAVE,   DRAIN_PUNCH,  POISON_JAB,   \
		 CUT,          SURF,         STRENGTH
	; end

	db 0 ; padding
