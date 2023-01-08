extends Node2D


export var sound := ""


func trigger():
	SFX.play(sound, global_position)
