extends Node2D

onready var blade: Node2D = $blade

func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_pressed("cut"):
		blade.cut()
		blade.rotation+=PI*2*delta

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("cut"):
#		blade.cut()
