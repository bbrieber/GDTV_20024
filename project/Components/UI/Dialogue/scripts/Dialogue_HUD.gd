class_name Dialogue_HUD extends PanelContainer


@onready var left_image_container : Control = $MarginContainer/HBoxContainer/LeftImageContainer
@onready var right_image_container : Control = $MarginContainer/HBoxContainer/RightImageContainer

@onready var label_name : Label = $MarginContainer/HBoxContainer/VBoxContainer/Lbl_Name
@onready var label_text : Label = $MarginContainer/HBoxContainer/VBoxContainer/ScrollContainer/Lbl_Text


signal dialogue_closed()

func _ready() -> void:
	set_process_unhandled_key_input(false)

func show_dialogue_snippet(snippet:Dialogue_Snippet)->void:
	set_process_unhandled_key_input(true)
	get_tree().paused = true
	
	if snippet.speaker_position == "left":
		left_image_container.visible = true
		right_image_container.visible = false
	elif snippet.speaker_position == "right":
		left_image_container.visible = false
		right_image_container.visible = true
	else:
		left_image_container.visible = false
		right_image_container.visible = false
		
	label_name.text = snippet.speaker_name
	label_name.add_theme_color_override("font_color",Color.from_string(snippet.color,Color.GHOST_WHITE))
	label_text.text = snippet.text
	



func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_pressed() and event.is_action("interact"):
		
		get_viewport().set_input_as_handled()
		get_tree().paused = false
		set_process_unhandled_key_input(false)
		dialogue_closed.emit()
		

