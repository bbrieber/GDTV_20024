class_name FxcState extends Resource

@export var init_state : bool = false
var owner:Node

func set_owner(m_owner:Node)->void:
	owner = m_owner

func is_any_state()->bool:
	return false


var name : StringName = "Any"
var graph_position : Vector2i



func get_state_name() -> StringName:
	return name


# Called when the node enters the scene tree for the first time.
func enter(_msg:Dictionary = {})->void:
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func exit()->void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(_delta:float)->void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(_delta:float)->void:
	pass

func handle_input(_event: InputEvent)->void:
	pass
