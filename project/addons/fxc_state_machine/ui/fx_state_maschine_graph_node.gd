@tool
class_name FxcStateMaschineGraphNode extends GraphNode



@export var state: FxcState
@export var transitions: Array[FxcTransition]


# Called when the node enters the scene tree for the first time.
func _ready():
	set_slot ( 0, true, 1, Color.GRAY, false, 1, Color.GRAY)
	set_slot ( 1, false,1, Color.GRAY, true, 1, Color.GRAY)
	set_slot ( 2, false, 1, Color.GRAY, true, 1, Color.GRAY)
	set_slot ( 3, false, 1, Color.GRAY, true, 1, Color.GRAY)
	pass # Replace with function body.

func _on_node_selected():
	print("selected")
	EditorInterface.edit_resource(state)
