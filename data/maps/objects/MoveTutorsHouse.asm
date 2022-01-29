MoveTutorsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 9
	warp_event  3,  7, LAST_MAP, 9

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GRAMPS, STAY, LEFT, 1				; move deleter
	object_event  5,  4, SPRITE_MIDDLE_AGED_MAN, STAY, LEFT, 2		; move relearner

	def_warps_to MOVE_TUTORS_HOUSE
