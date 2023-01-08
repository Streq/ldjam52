extends CharacterState
onready var pivot: Node2D = $"../../pivot"


func _physics_update(delta: float) -> void:
	var target_angle = pivot.get_global_mouse_position().angle_to_point(pivot.global_position)
#	pivot.rotation = lerp_angle(pivot.rotation, target_angle, delta*20.0)
	pivot.rotation = target_angle
	if Input.is_action_pressed("cut"):
		goto("slash")
		return
	


