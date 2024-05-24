class_name Btn_Remap extends Button


@export var action_name : StringName
@export var input_type : UI_Constants.enum_input_type

var used_event:InputEvent


func _init() -> void:
	toggle_mode = true
	theme_type_variation = "Btn_Remap"
	
	
func _ready() -> void:
	set_process_unhandled_input(false)
	update_key_text()

func _toggled(toggled_on: bool) -> void:
	set_process_unhandled_input(button_pressed)
	if(button_pressed):
		text = "--- Waiting for Input ---"
	else:
		update_key_text()
		grab_focus()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed() :
		if !event.is_action("Escape"):
			InputMap.action_erase_event(action_name,used_event)
			InputMap.action_add_event(action_name,event)
		
			used_event = event
		
		release_focus()
		button_pressed = false
	
func update_key_text()->void:
	var events : Array[InputEvent] = InputMap.action_get_events(action_name)
	used_event = null
	for e: InputEvent in events:
		if e is InputEventKey and input_type == 0:
			
			used_event = e
			
			text = get_text_from_event(e)
			break
		elif (e is InputEventJoypadButton or e is InputEventJoypadMotion) and input_type == 1:
			used_event = e 
			text = get_text_from_event(e)
			
			break

	if not used_event:
		text = "undefined"
	print(text)
	#print(event.as_text())
	
func get_text_from_event(event : InputEvent) -> String:
	var ui_text = event.as_text()
	ui_text = ui_text.split("(")[0]
	
	ui_text = ui_text.replace("Joypad ", "")
	ui_text = ui_text.replace("Motion on ", "")
	return ui_text
	
