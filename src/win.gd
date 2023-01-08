extends ColorRect
signal finished()

onready var end: Label = $"%end"
onready var thanks: Label = $"%thanks"

export var chars_per_sec := 20.0

func _ready() -> void:
	hide()
	set_process_input(false)
func trigger():
	show()
	var tween = create_tween()
	get_tree().paused = true
	end.percent_visible = 0
	thanks.percent_visible = 0
	tween.tween_property(end,"visible_characters",end.get_total_character_count(),end.get_total_character_count()/chars_per_sec)
	tween.tween_property(thanks,"visible_characters",thanks.get_total_character_count(),thanks.get_total_character_count()/chars_per_sec)
	yield(tween,"finished")

	set_process_input(true)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cut"):
		hide()
		get_tree().paused = false
		set_process_input(false)
		emit_signal("finished")
