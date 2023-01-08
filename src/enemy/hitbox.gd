extends Area2D

export var dps := 10.0
export var HURTER :PackedScene

var hurter = null
func _ready() -> void:
	hurter = HURTER.instance()
func _on_hitbox_area_entered(area: Area2D) -> void:
	if hurter.is_inside_tree():
		hurter.get_parent().remove_child(hurter)
	hurter.dps = dps
	area.add_child(hurter)


func _on_hitbox_area_exited(area: Area2D) -> void:
	if hurter.is_inside_tree():
		hurter.get_parent().remove_child(hurter)
	
