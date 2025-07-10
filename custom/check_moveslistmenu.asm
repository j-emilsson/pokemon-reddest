CheckMovesListMenu::
	ld a, [wListMenuID]
	cp MOVESLISTMENU
	ret nz ; not MOVESLISTMENU, continue as normal

	; If MOVESLISTMENU, exit early — duplicate .skipStoringItemName logic
	ld a, CHOSE_MENU_ITEM ;skip here if skipping storing item name
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	xor a
	ld [hJoy7], a ; joypad state update flag
	ld hl, wd730
	res 6, [hl] ; turn on letter printing delay
	jp BankswitchBack