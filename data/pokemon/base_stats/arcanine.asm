	db DEX_ARCANINE ; pokedex id

	db  90, 120,  80, 105,  85 ; 565
	;   hp  atk  def  spd  spc

	db FIRE, DARK ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBack

	db ROAR, EMBER, LEER, TAKE_DOWN ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         SOLARBEAM,    DRAGON_RAGE,  DIG,          TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   OUTRAGE,      \
		 DRAGON_BREATH,CRUNCH,       HYPER_VOICE,  IRON_HEAD,    DARK_PULSE,   \
		 DRAGON_PULSE, PLAY_ROUGH,   STRENGTH
	; end

	db 0 ; padding
