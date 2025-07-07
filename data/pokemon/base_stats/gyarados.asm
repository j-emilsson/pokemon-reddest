	db DEX_GYARADOS ; pokedex id

	db  95, 125,  75,  90,  90 ; 565
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBack

	db BITE, DRAGON_RAGE, LEER, HYDRO_PUMP ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      EARTHQUAKE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SKULL_BASH,   \
	     REST,         SUBSTITUTE,   DRAGON_BREATH,DARK_PULSE,   DRAGON_PULSE, \
		 SURF,         STRENGTH
	; end

	db 0 ; padding
