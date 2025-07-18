	db DEX_GASTLY ; pokedex id

	db  35,  30,  35,  85, 100 ; 385
	;   hp  atk  def  spd  spc

	db GHOST, GHOST ; type
	db 190 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBack

	db LICK, CONFUSE_RAY, HYPNOSIS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  SELFDESTRUCT, \
	     DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   \
		 SLUDGE_BOMB,  SHADOW_BALL,  GIGA_DRAIN,   POISON_JAB,   DARK_PULSE
	; end

	db 0 ; padding
