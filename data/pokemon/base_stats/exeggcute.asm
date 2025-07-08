	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60 ; 340
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC ; type
	db 90 ; catch rate
	db 98 ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBack

	db BARRAGE, HYPNOSIS, ABSORB, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      SELFDESTRUCT, EGG_BOMB,     \
	     DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   \
		 SLUDGE_BOMB,  GIGA_DRAIN,   FLASH
	; end

	db 0 ; padding
