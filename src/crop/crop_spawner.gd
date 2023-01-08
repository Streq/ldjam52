extends Node2D
signal yields_crop(value)

onready var texture_rect: TextureRect = $TextureRect
export var CROP : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = texture_rect.texture
	var data = texture.get_data()
	data.lock()
	var i = 0
	for x in texture.get_width():
		for y in texture.get_height():
			var pixel_position = Vector2(x,y)
			if data.get_pixelv(pixel_position).r:
				var crop = CROP.instance()
				owner.call_deferred("add_child", crop)
				crop.global_position = global_position + pixel_position*2
				i += 1
				crop.connect("yields_crop",self,"_yield_crop")
				crop.connect("red_crop",owner,"restart")
	data.unlock()

func _yield_crop(value):
	emit_signal("yields_crop",value)
