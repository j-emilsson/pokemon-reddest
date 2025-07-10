VBlank_Custom::
	ld a, [hSkipOAMUpdates]
	bit 0, a
	jr nz, .skipOAM
	call hDMARoutine
	ld a, BANK(PrepareOAMData)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call PrepareOAMData
.skipOAM
	ret