	db DEX_VENONAT ; pokedex id

	db  60,  45,  50,  50,  80 ; 365
	;   hp  atk  def  spd  spc

	db BUG, PSYCHIC ; type
	db 190 ; catch rate
	db 75 ; base exp

	INCBIN "gfx/pokemon/front/venonat.pic", 0, 1 ; sprite dimensions
	dw VenonatPicFront, VenonatPicBack

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         MEGA_DRAIN,   \
	     SOLARBEAM,    PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        REST,         PSYWAVE,      SUBSTITUTE,   \
		 SLUDGE_BOMB,  GIGA_DRAIN,   BUG_BUZZ,     FLASH
	; end

	db 0 ; padding
