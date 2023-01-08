extends TextureProgress



func _on_health_value_changed(value, max_value) -> void:
	self.max_value = max_value
	self.value = value
