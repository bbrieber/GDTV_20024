extends Node

@onready var ui_stream : AudioStreamPlayer =  $UI_AudioStreamPlayer

@export var focus_changed_stream : AudioStream
@export var button_pressed_stream : AudioStream

@export var menu_root :Control 

func _ready() -> void:
	#connect_children(menu_root.get_children())
	pass
	
func connect_children(children : Array[Node])->void:
	for child : Node in children:
		if child is BaseButton:
			var btn_child : BaseButton = child as BaseButton
			if btn_child.focus_mode != 0 :
				btn_child.pressed.connect(_on_button_pressed)
		#if child is Control and child.focus_mode != 0 :
		#	child.focus_exited.connect(_on_focus_changed)
		connect_children(child.get_children())

func _on_focus_changed() -> void:
	ui_stream.stream = focus_changed_stream
	ui_stream.play()

func _on_button_pressed() -> void:
	ui_stream.stream = button_pressed_stream
	ui_stream.play()

func _on_sfx_value_changed(_value: float) -> void:
	_on_button_pressed()
