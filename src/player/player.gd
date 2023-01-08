extends KinematicBody2D
signal die()
export var speed = 200.0
onready var blade: Node2D = $pivot/blade

onready var health: Node = $health
onready var state_animation: AnimationPlayer = $state_animation
onready var state_machine: Node = $state_machine

func _ready() -> void:
	state_machine.initialize()

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	state_machine.physics_update(delta)
	move_and_slide(dir*speed)
	


#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("flip"):
#		blade.flip()

func rotate_to_mouse(delta):
	var target_angle = (get_global_mouse_position() - global_position).angle()
	blade.rotation = lerp_angle(blade.rotation,target_angle,delta*10.0)
	
func rotate_to_blade_side(delta,side):
	var target_angle = blade.rotation+blade.side*side*delta*10.0
#	blade.rotation = lerp_angle(blade.rotation,target_angle,delta*10.0)
	blade.rotation = target_angle
func die():
	emit_signal("die")
func heal(amount):
	health.value = health.value+amount
