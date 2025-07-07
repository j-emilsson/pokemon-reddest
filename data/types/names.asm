; TypeNames:
	; table_width 2, TypeNames

	; dw .Normal
	; dw .Fighting
	; dw .Flying
	; dw .Poison
	; dw .Ground
	; dw .Rock
	; dw .Bird
	; dw .Bug
	; dw .Ghost
	; dw .Steel ; new steel type

; REPT FIRE - STEEL - 1
	; dw .Normal
; ENDR

	; dw .Fire
	; dw .Water
	; dw .Grass
	; dw .Electric
	; dw .Psychic
	; dw .Ice
	; dw .Dragon
	; dw .Dark ; new dark type
	; dw .Fairy ; new fairy type
	
TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bug
	dw .Ghost
	dw .Steel ; new steel type

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon
	dw .Dark ; new dark type
	dw .Fairy ; new fairy type

	dw .Typeless ; new type for Struggle

	assert_table_length NUM_TYPES

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Dragon:   db "DRAGON@"
.Dark:	   db "DARK@"
.Steel:    db "STEEL@"
.Fairy:	   db "FAIRY@"
.Typeless: db "TYPELESS@"
