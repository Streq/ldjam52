extends Node2D
signal yields_crop(value)
signal amount_of_crops(value)
onready var texture_rect: TextureRect = $TextureRect
export var CROP : PackedScene

export (int, LAYERS_2D_PHYSICS) var UNSPAWNABLE_LAYER
var total_crops = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = texture_rect.texture
	var data = texture.get_data()
	data.lock()
	total_crops = 0
	for x in texture.get_width():
		for y in texture.get_height():
			var pixel_position = Vector2(x,y)
			if data.get_pixelv(pixel_position).r:
				var instance_position = global_position + pixel_position*2
				if query_circle(instance_position+Vector2(0,-8)):
					continue
				var crop = CROP.instance()
				owner.call_deferred("add_child", crop)
				crop.global_position = instance_position
				total_crops += 1
				crop.connect("yields_crop",self,"_yield_crop")
				crop.connect("red_crop",owner,"restart")
	emit_signal("amount_of_crops",total_crops)
	data.unlock()
	texture_rect.queue_free()

func _yield_crop(value):
	emit_signal("yields_crop",value)
	
func query_circle(query_position):
	var query_shape := CircleShape2D.new()
	query_shape.radius = 8.0
	var query = Physics2DShapeQueryParameters.new()
	query.collision_layer = UNSPAWNABLE_LAYER
	query.shape_rid = query_shape.get_rid()
	query.transform = Transform2D.IDENTITY.translated(query_position)
	return get_world_2d().direct_space_state.intersect_shape(query)
