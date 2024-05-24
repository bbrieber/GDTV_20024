class_name ViewportAnchor extends Control

@export var control_node : Control

var vp_size :Vector2 
@onready var vp :SubViewport = get_viewport() as SubViewport
	
func _ready() -> void:
	
	get_viewport_position()

func get_viewport_position() -> Vector2:
	vp_size = vp.size
	var pos :Vector2 = get_global_transform_with_canvas().get_origin()#position
	var vec:Vector2 = Vector2(pos.x/vp_size.x,pos.y/vp_size.y)
	
	return vec
