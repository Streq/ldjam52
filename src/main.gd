extends Node2D
signal begin()
signal end()
onready var player: KinematicBody2D = $player
onready var player_spawn_pos: Position2D = $player_spawn_pos


var restarting = false
func restart():
	if restarting:
		return
	restarting = true
	
	yield(get_tree(),"idle_frame")
	emit_signal("end")
	player.global_position = player_spawn_pos.global_position
	get_tree().call_group("zombie","queue_free")
	get_tree().call_group("crop","normalize")
	get_tree().call_group("crop","to_full_growth")
	get_tree().call_group("player","heal",10000.0)
	get_tree().call_group("score","restart")
	restarting = false


	
func begin_game():
	emit_signal("begin")


func _on_start_game_area_body_entered(body: Node) -> void:
	begin_game()


func _on_score_win() -> void:
	restart()
	
