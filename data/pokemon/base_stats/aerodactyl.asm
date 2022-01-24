	db DEX_AERODACTYL ; pokedex id

	db  80, 125,  70, 135,  75 ; 560
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  EARTHQUAKE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        \
	     SKY_ATTACK,   REST,         ROCK_SLIDE,   SUBSTITUTE,   DRAGON_BREATH,\
		 IRON_HEAD,    EARTH_POWER,  DRAGON_PULSE, FLY,          STRENGTH
	; end

	db 0 ; padding
