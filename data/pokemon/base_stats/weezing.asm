	db DEX_WEEZING ; pokedex id

	db  60,  75, 120,  60, 110 ; 535
	;   hp  atk  def  spd  spc

	db POISON, FAIRY ; type
	db 60 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBack

	db TACKLE, SMOG, SLUDGE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, FIRE_BLAST,   \
	     REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   SLUDGE_BOMB,  \
		 SHADOW_BALL,  DARK_PULSE,   PLAY_ROUGH,   FLASH
	; end

	db 0 ; padding
