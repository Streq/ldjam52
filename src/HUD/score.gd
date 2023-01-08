extends Control

onready var crops: Label = $crops

var score = 0

func _on_crop(value):
	score += value
	crops.text = "CROPS:%d"%score

func restart():
	score = 0
	_on_crop(0)
