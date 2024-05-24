extends Button

@export var init_scene : UI_ControlFader
@export var fade_to : UI_ControlFader


func _ready() -> void:
	pressed.connect(_on_pressed)
	
func _on_pressed() -> void:
	init_scene.fade_to(fade_to)
	#.set_trans(Tween.TRANS_BOUNCE)

