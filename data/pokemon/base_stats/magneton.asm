	db DEX_MAGNETON ; pokedex id

	db  70,  60,  90,  70, 130 ; 550
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBack

	db TACKLE, THUNDERSHOCK, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     THUNDERBOLT,  THUNDER,      TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SWIFT,        REST,         THUNDER_WAVE, \
	     TRI_ATTACK,   SUBSTITUTE,   IRON_HEAD,    FLASH_CANNON, FLASH
	; end

	db 0 ; padding
