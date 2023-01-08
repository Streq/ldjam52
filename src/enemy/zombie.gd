extends Node2D
signal die()
signal physics_update()


export var speed := 40.0
func _physics_process(delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if !players:
		return 
	look_at(players[0].global_position)
	global_position += speed * Vector2.RIGHT.rotated(rotation) * delta
	emit_signal("physics_update")
func die():
	emit_signal("die")
	queue_free()
