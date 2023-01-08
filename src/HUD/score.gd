extends Control
signal win()
onready var crops: Label = $"%crops"
onready var target_crops: Label = $"%target_crops"

var score = 0
var target = 0
func _on_crop(value):
	score += value
	crops.text = "CROPS:%d" % score
	if score>=target:
		crops.modulate = Color.green
		emit_signal("win")
func _on_total_crops(value):
	target = value * 0.8
	$"%target_crops".text = "GOAL:%d" % target
	

func restart():
	score = 0
	_on_crop(0)
	crops.modulate=Color.white
