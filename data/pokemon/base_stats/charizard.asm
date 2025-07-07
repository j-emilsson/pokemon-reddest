	db DEX_CHARIZARD ; pokedex id

	db  80,  90,  75, 115, 100 ; 560
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBack

	db SCRATCH, GROWL, EMBER, AIR_SLASH ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, SOLARBEAM,    DRAGON_RAGE,  EARTHQUAKE,         \
		 DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   \
		 SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 DRAGON_BREATH,DRAGON_PULSE, CUT,          FLY,          STRENGTH
	; end

	db 0 ; padding
