	db DEX_NINETALES ; pokedex id

	db  80,  60,  85, 100, 120 ; 565
	;   hp  atk  def  spd  spc

	db FIRE, FAIRY ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBack

	db EMBER, TAIL_WHIP, QUICK_ATTACK, CONFUSE_RAY ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     SOLARBEAM,    DIG,          PSYCHIC_M,    TELEPORT,     \
		 MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   \
		 SWIFT,        SKULL_BASH,   DREAM_EATER,  REST,         PSYWAVE,      \
		 DARK_PULSE,   SUBSTITUTE
	; end

	db 0 ; padding
