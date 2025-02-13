	db DEX_GROWLITHE ; pokedex id

	db  60,  80,  50,  75,  50 ; 365
	;   hp  atk  def  spd  spc

	db FIRE, DARK ; type
	db 190 ; catch rate
	db 91 ; base exp

	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
	dw GrowlithePicFront, GrowlithePicBack

	db BITE, ROAR, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   OUTRAGE,      DRAGON_BREATH,CRUNCH,       IRON_HEAD,    \
		 DARK_PULSE,   PLAY_ROUGH,   STRENGTH
	; end

	db 0 ; padding
