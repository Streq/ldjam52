extends Node2D

onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D

export var ENEMY : PackedScene

func spawn():
	var spawn = ENEMY.instance()
	get_parent().add_child(spawn)
	path_follow_2d.unit_offset = randf()
	spawn.global_position = path_follow_2d.global_position
