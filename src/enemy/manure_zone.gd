extends Area2D


func trigger():
	for area in get_overlapping_areas():
		area.get_parent().get_manured()
