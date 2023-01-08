extends Node2D


func restart():
	get_tree().call_group("zombie","queue_free")
	get_tree().call_group("crop","normalize")
	get_tree().call_group("crop","to_full_growth")
	get_tree().call_group("player","heal",10000.0)
	get_tree().call_group("score","restart")
