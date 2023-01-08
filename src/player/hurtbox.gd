extends Area2D
signal hurt


onready var health: Node = $"../health"

var already_hurt = false

func get_hurt(damage):
	if already_hurt:
		return
	already_hurt = true
	health.value = health.value-damage
	emit_signal("hurt")

func _physics_process(delta: float) -> void:
	already_hurt = false
