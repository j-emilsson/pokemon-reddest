; Used in .trainerEngaging
ClearTrainerPreBattleFlags::
	ld hl, wd730
	res 0, [hl] ; clear NPC movement flag to avoid softlock if this trainer doesn't move
	res 3, [hl] ; clear Trainer encounter reset flag
	ret

; Used in ResetButtonPressedAndMapScript
ResetTrainerAfterBattleFlags::
	ld hl, wd730
	res 0, [hl] ; clear NPC movement flag to avoid potential softlocks
	set 3, [hl] ; set Trainer encounter reset flag to avoid Mew Glitch
	ld hl, wFlags_0xcd60
	res 0, [hl] ; player is no longer engaged by any trainer
	ret