class_name FxcState extends Resource

@export var foo:StringName


var name : StringName = "Any"

func get_state_name() -> StringName:
	return name


# Called when the node enters the scene tree for the first time.
func enter()->void:
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func exit()->void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta)->void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta)->void:
	pass
