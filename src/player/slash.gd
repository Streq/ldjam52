extends CharacterState

onready var blade: Node2D = $"../../pivot/blade"

var unit_spin := 1.0 setget set_unit_spin

func set_unit_spin(val):
	unit_spin = val
	if blade:
		blade.rotation = -PI+PI*2*unit_spin
func _enter(params):
	elongation()

func do_slash():
	pass

func elongation():
	var tween = create_tween()
	
	var target_length = blade.global_position.distance_to(blade.get_global_mouse_position())
	var length = 32.0
	var required_scale = min(target_length/length,2.0)
	
	tween.tween_property(blade,"scale",Vector2(required_scale,blade.scale.y),0.25)
	tween.tween_property(blade,"scale",Vector2(0.1,blade.scale.y),0.25)
	var spin_tween = create_tween()
	spin_tween.tween_property(self,"unit_spin",(1.0+blade.side)*0.5,0.5)
	
