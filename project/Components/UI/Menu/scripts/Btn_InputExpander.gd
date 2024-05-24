extends Button

@export var input_category : UI_Constants.enum_input_type

@export var grid_container : GridContainer

var action_map : Dictionary= {
	"jump" : "Jump",
	"move_left" : "Left",
	"move_right" : "Right",
	"move_up" : "Up",
	"move_down" : "Down"
}

func _ready() -> void:
	for child in grid_container.get_children():
		grid_container.remove_child(child)
	var input_actions : Array[StringName] = InputMap.get_actions()
	for action_name : StringName in action_map.keys():
		var con : Control = Control.new()  
		grid_container.add_child(con)
		var lbl : Label = Label.new()
		lbl.text = action_name  
		grid_container.add_child(lbl)
		var btn : Btn_Remap = Btn_Remap.new()
		btn.action_name = action_name
		btn.input_type = input_category
		btn.size_flags_horizontal = 3
		grid_container.add_child(btn)
		
	pass
	
func event_is_in_category(event:InputEvent, category:UI_Constants.enum_input_type) -> bool:
	if category == 0:
		return event is InputEventKey
	elif category == 1:
		return event is InputEventJoypadButton or event is InputEventJoypadMotion
	return false
