extends Node


export var dps := 0.0


func _physics_process(delta: float) -> void:
	get_parent().get_hurt(delta*dps)
