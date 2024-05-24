class_name UI_ControlFader extends Control

@export var initial_focus : Control
@export var fade_out_offset : Vector2 = Vector2(500,0)
@export var start_active : bool 
@export var fade_time : float = 0.25 


var initial_position : Vector2

func _ready() -> void:
	
	initial_position = position
	if start_active:
		on_load()
	else:
		position= initial_position + fade_out_offset
		visible = false
	

func on_load()->void:
	initial_focus.grab_focus()
		


func fade_to(fade_target : UI_ControlFader) -> void:
	var tween : Tween = create_tween()
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", initial_position + fade_out_offset,fade_time)
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "modulate:a", 0, fade_time)

	await tween.finished
	visible = false
	fade_target.fade_in()

func fade_in() -> void:
	on_load()
	visible = true
	var tween : Tween = create_tween()
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", initial_position , fade_time)
	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "modulate:a", 1, fade_time)


#func _on_toggle(toggled_on: bool) -> void:
#	pass # Replace with function body.
