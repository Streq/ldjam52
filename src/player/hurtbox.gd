extends Area2D

onready var health: Node = $"../health"

func get_hurt(damage):
	health.value = health.value-damage
