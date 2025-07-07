	db DEX_AERODACTYL ; pokedex id

	db  85, 130,  70, 140,  75 ; 575
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
		 DRAGON_RAGE,  EARTHQUAKE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
		 FIRE_BLAST,   SWIFT,        SKY_ATTACK,   REST,         ROCK_SLIDE,   \
		 SUBSTITUTE,   DRAGON_BREATH,DRAGON_PULSE, FLY,          STRENGTH
	; end

	db 0 ; padding
