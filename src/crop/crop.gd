extends Node2D

onready var animation_player: AnimationPlayer = $AnimationPlayer

func get_cut():
	animation_player.play("growth")
	animation_player.seek(0)
	animation_player.advance(0)
#	animation_player.stop()
	animation_player.playback_speed = 1.0 + (randf()-0.5)
	
