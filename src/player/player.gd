extends Node2D

onready var blade: Node2D = $blade
export var speed = 200.0


func _physics_process(delta: float) -> void:
	if !blade.flipping and Input.is_action_pressed("cut"):
		rotate_to_blade_side(delta)
#	rotate_to_mouse(delta)
	
	var dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	global_position += dir*speed*delta


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("flip"):
		blade.flip()

func rotate_to_mouse(delta):
	var target_angle = (get_global_mouse_position() - global_position).angle()
	blade.rotation = lerp_angle(blade.rotation,target_angle,delta*10.0)
	
func rotate_to_blade_side(delta):
	var target_angle = blade.rotation+blade.side*delta*10.0
#	blade.rotation = lerp_angle(blade.rotation,target_angle,delta*10.0)
	blade.rotation = target_angle
