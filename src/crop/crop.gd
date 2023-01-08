extends Node2D
signal yields_crop(value)
signal red_crop()
signal cut()
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var hitbox: Area2D = $hitbox

export var crop_yield := 1.0
export var fully_grown := false
export var manured = false
var cut = false
func get_cut():
	if manured and fully_grown:
		return
	if cut:
		return
	cut = true
	if fully_grown:
		emit_signal("yields_crop", crop_yield)
		if manured:
			emit_signal("red_crop")
			pass
	SFX.play("crop_cut", global_position)
	animation_player.playback_speed = 1.0
	animation_player.play("cut")
	yield(animation_player,"animation_finished")
	animation_player.play("RESET")
	animation_player.advance(0)
	cut = false
	normalize()
	restart_growth()
	emit_signal("cut")
func restart_growth():
	animation_player.play("growth")
	animation_player.seek(0)
	animation_player.advance(0)
	animation_player.stop(false)
#	animation_player.stop()


func normalize():
	modulate = Color.white
	crop_yield = 1.0
	animation_player.playback_speed = 0.0
	manured = false

func to_full_growth():
	animation_player.play("RESET")
	animation_player.advance(0)
	animation_player.stop(false)

func get_manured():
	if fully_grown:
		return
	manured = true
	hitbox.monitoring = true
	animation_player.play("growth")
	animation_player.playback_speed = 8.0
	animation_player.playback_speed -= randf()*4
	
	crop_yield = 0.0
	modulate = Color.red
	yield(animation_player,"animation_finished")
	animation_player.stop(false)
