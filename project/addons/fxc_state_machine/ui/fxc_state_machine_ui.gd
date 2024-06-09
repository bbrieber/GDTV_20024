@tool
extends Control



@export var state_maschine : FxcStateMaschineResource




# Called when the node enters the scene tree for the first time.
func _ready():
	for state :FxcState in state_maschine.get_states():
		print(state.get_state_name())
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_graph_node_node_selected():
	pass # Replace with function body.


func _on_node_selected():
	pass # Replace with function body.


func _on_graph_edit_connection_request(from_node, from_port, to_node, to_port):
	%GraphEdit.connect_node(from_node, from_port, to_node, to_port)
	pass 
	
func _on_disconnection_request(from_node, from_port, to_node, to_port):
	%GraphEdit.disconnect_node(from_node, from_port, to_node, to_port)


func _on_graph_edit_disconnection_request(from_node, from_port, to_node, to_port):
	%GraphEdit.disconnect_node(from_node, from_port, to_node, to_port)

