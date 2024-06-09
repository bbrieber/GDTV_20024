class_name FxcActorSkin extends Node2D


const IDLE:StringName = "IDLE"
const JUMP:StringName = "JUMP"
const FALL:StringName = "FALL"


signal animation_finished

func play_animation(name :StringName)->void:
	pass

func pause_animation() -> void:
	pass

func set_view_direction(dir: float) -> void:
	pass
