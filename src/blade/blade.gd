extends Node2D
onready var hitbox: Area2D = $hitbox
onready var arc: Area2D = $arc
onready var sprite: Sprite = $Sprite

onready var old_rotation = rotation

export (float, -1.0, 1.0, 2.0) var side := 1.0 setget set_side

func set_side(val):
	if val == side:
		return
	side = val
	_flip()

func _physics_process(delta: float) -> void:
	if !flipping and sign(Math.angle_distance(old_rotation,rotation)) == side:
		cut()
	
	old_rotation = rotation
	



func cut():
	for area in hitbox.get_overlapping_areas():
		area.get_parent().get_cut()
	
	for area in arc.get_overlapping_areas():
		var crop_angle = get_angle_to(area.global_position)
		var angle_distance = Math.angle_distance(rotation, old_rotation)
		if (
			sign(crop_angle) == sign(angle_distance)
		and abs(crop_angle)<abs(angle_distance)
		):
			area.get_parent().get_cut()


func flip():
	set_side(-side)

var flipping := false
func _flip():
	flipping = true
	var tween = create_tween()
	
	sprite.z_index = int(!bool(sprite.z_index))
	print(sprite.z_index)
	tween.tween_property(sprite,"scale",Vector2(scale.x,side),0.1)
	yield(tween,"finished")
	flipping = false
