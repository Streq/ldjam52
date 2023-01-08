extends Node2D
signal yields_crop(value)
signal red_crop()

#onready var animation_player: AnimationPlayer = $AnimationPlayer


enum STATE {
	BUD,
	SAPPLING,
	PLANT,
	FULLY_GROWN
}


export var crop_yield := 1.0
export var fully_grown := false
export var manured = false
func get_cut():
	if fully_grown:
		emit_signal("yields_crop", crop_yield)
		if manured:
#			emit_signal("red_crop")
			pass
	normalize()
	restart_growth()
	
func restart_growth():
#	animation_player.play("growth")
#	animation_player.seek(0)
#	animation_player.advance(0)
#	animation_player.stop(false)
#	animation_player.stop()
	pass


func normalize():
	modulate = Color.white
	crop_yield = 1.0
#	animation_player.playback_speed = 0.0
	manured = false

func to_full_growth():
#	animation_player.play("RESET")
#	animation_player.advance(0)
#	animation_player.stop(false)
	pass

func get_manured():
	if fully_grown:
		return
#	manured = true
#	animation_player.play("growth")
#	animation_player.playback_speed = 8.0
#	animation_player.playback_speed -= randf()*4
	
	crop_yield = 0.0
	modulate = Color.red
#	yield(animation_player,"animation_finished")
#	animation_player.stop(false)
