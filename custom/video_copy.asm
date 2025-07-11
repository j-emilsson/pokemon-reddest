LoadHpBarAndStatusTilePatterns_Custom::
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 tile $62
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / $10
	call GoodCopyVideoData

	ld de, EXPBarGraphics
	ld hl, vChars1 tile $40
	lb bc, BANK(EXPBarGraphics), (EXPBarGraphicsEnd - EXPBarGraphics) / $10
	jp GoodCopyVideoData

GoodCopyVideoData:
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, CopyVideoData ; if LCD is on, transfer during V-blank

	ld a, b
	push hl
	push de
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop hl
	pop de
	jp FarCopyData2 ; if LCD is off, transfer all at once
