extends Node2D
signal flipped()
onready var cut_hitbox: Area2D = $cut_hitbox
onready var cut_arc: Area2D = $cut_arc
onready var blade_hitbox: Area2D = $blade_hitbox

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
	for area in cut_hitbox.get_overlapping_areas():
		area.get_parent().get_cut()
	
	for area in cut_arc.get_overlapping_areas():
		var crop_angle = get_angle_to(area.global_position)
		var angle_distance = Math.angle_distance(rotation, old_rotation)
		if (
			sign(crop_angle) == sign(angle_distance)
		and abs(crop_angle)<abs(angle_distance)
		):
			area.get_parent().get_cut()

	for area in blade_hitbox.get_overlapping_areas():
		var enemy = area.get_parent()
		enemy.die()
	
func flip():
	set_side(-side)

var flipping := false
func _flip():
	flipping = true
	var tween = create_tween()
	
	sprite.z_index = int(!bool(sprite.z_index))
	tween.tween_property(sprite,"scale",Vector2(sprite.scale.x,side),0.1)
	yield(tween,"finished")
	flipping = false
	emit_signal("flipped")
