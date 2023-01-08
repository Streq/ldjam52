extends Node

func _ready() -> void:
	yield(get_parent(),"ready")
	get_parent().trigger()
