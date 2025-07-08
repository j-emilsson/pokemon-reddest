	db DEX_SPEAROW ; pokedex id

	db  60,  65,  30,  85,  30 ; 300
	;   hp  atk  def  spd  spc

	db FLYING, DARK ; type
	db 255 ; catch rate
	db 58 ; base exp

	INCBIN "gfx/pokemon/front/spearow.pic", 0, 1 ; sprite dimensions
	dw SpearowPicFront, SpearowPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     MIMIC,        DOUBLE_TEAM,  SWIFT,        \
	     SKY_ATTACK,   REST,         TRI_ATTACK,   SUBSTITUTE,   DARK_PULSE,   \
		 FLY
	; end

	db 0 ; padding
