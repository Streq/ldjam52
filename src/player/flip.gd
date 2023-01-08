extends CharacterState

onready var blade: Node2D = $"../../pivot/blade"

func _enter(params):
	blade.flip()
	blade.connect("flipped",self,"_on_flipped")
	pass

func _exit():
	blade.disconnect("flipped",self,"_on_flipped")


func _on_flipped():
	goto(state_on_end)
