class_name FxcActorInput extends Node



func get_axis_value(axis_name:StringName)->float:
	return 0.0



func get_direction(input_name:StringName)->Vector2:
	return Vector2.ZERO

func start_action_requested(action_name:StringName)->bool:
	return false


func stop_action_requested(action_name:StringName)->bool:
	return false

func is_action_active(action_name:StringName)->bool:
	return false
