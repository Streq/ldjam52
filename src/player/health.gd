extends Node
signal value_changed(value, max_value)
signal changed()
signal empty()
signal full()

export var max_value := 100.0 setget set_max_value
export var value := 100.0 setget set_value

func set_max_value(val):
	max_value = val
	set_value(value)
	pass
	
func set_value(val):
	value = clamp(val, 0, max_value)
	emit_signal("value_changed", value, max_value)
	emit_signal("changed")
	if value == 0.0:
		emit_signal("empty")
	if value == max_value:
		emit_signal("full")

func _ready() -> void:
	set_value(value)
