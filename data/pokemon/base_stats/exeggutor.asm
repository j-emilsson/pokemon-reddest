	db DEX_EXEGGUTOR ; pokedex id

	db  95,  80,  85,  55, 125 ; 565
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC ; type
	db 45 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFront, ExeggutorPicBack

	db BARRAGE, HYPNOSIS, ABSORB, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SELFDESTRUCT, \
	     EGG_BOMB,     DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    \
		 SUBSTITUTE,   SLUDGE_BOMB,  OUTRAGE,      GIGA_DRAIN,   DRAGON_PULSE, \
		 STRENGTH,     FLASH
	; end

	db 0 ; padding
