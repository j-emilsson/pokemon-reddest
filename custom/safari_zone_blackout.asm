HandleSafariZoneBlackout::
	CheckEvent EVENT_IN_SAFARI_ZONE
	ret z

	xor a
	ld [wNumSafariBalls], a
	ld [wSafariSteps], a
	ld [wSafariSteps + 1], a
	ResetEvent EVENT_IN_SAFARI_ZONE
	ld [wcf0d], a
	ld [wSafariZoneGateCurScript], a
	ret