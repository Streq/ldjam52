extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if !OS.is_debug_build():
		return
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
