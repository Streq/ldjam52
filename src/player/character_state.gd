extends State
class_name CharacterState

export var animation := ""
export var state_on_end := ""


func enter(params):
	var state_animation: AnimationPlayer = owner.state_animation
	state_animation.play("RESET")
	state_animation.advance(0)
	state_animation.play(animation)
	state_animation.connect("animation_finished",self,"_on_animation_finished")
	.enter(params)

func exit():
	owner.state_animation.disconnect("animation_finished",self,"_on_animation_finished")
	.exit()

func _on_animation_finished(animation):
	if state_on_end:
		goto(state_on_end)
