extends Area2D

export var dps := 10.0

func _physics_process(delta: float) -> void:
	for area in get_overlapping_areas():
		area.get_hurt(dps*delta)
