class_name BtnChangeScene extends Button


@export var target_scene : PackedScene

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	SceneTransition.change_scene(target_scene)
