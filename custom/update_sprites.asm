UpdateSprites_Custom::
	ld hl, hSkipOAMUpdates
	set 0, [hl]
	homecall _UpdateSprites
	ld hl, hSkipOAMUpdates
	res 0, [hl]
	ret