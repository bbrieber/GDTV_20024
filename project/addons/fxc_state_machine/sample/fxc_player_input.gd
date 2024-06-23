extends FxcActorInput


enum action_state {INACTIVE=0,JUST_PRESSED=1,JUST_RELEASED=2,ACTIVE=3}

var action_value :Dictionary = {}

const JUMP_ACTION:StringName = "JUMP"

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(JUMP_ACTION):
		action_value[JUMP_ACTION] = action_state.JUST_PRESSED
	elif Input.is_action_just_released(JUMP_ACTION):
		action_value[JUMP_ACTION] = action_state.JUST_RELEASED
	elif Input.is_action_pressed(JUMP_ACTION):
		action_value[JUMP_ACTION] = action_state.ACTIVE
	else:
		action_value[JUMP_ACTION] = action_state.INACTIVE
	
	

func get_axis_value(axis_name:StringName)->float:
	return 0.0



func get_direction(input_name:StringName)->Vector2:
	return Vector2.ZERO

func start_action_requested(action_name:StringName)->bool:
	if action_value.has(action_name):
		if action_value[action_name] == action_state.JUST_PRESSED :
			return true
	return false

func stop_action_requested(action_name:StringName)->bool:
	if action_value.has(action_name):
		if action_value[action_name] == action_state.JUST_RELEASED :
			return true
	return false
	
func is_action_active(action_name:StringName)->bool:
	if action_value.has(action_name):
		if action_value[action_name] == action_state.ACTIVE or action_value[action_name] == action_state.JUST_PRESSED :
			return true
	return false


func consume_action(action_name:StringName)->void:
	if action_value.has(action_name):
		if action_value[action_name] == action_state.JUST_PRESSED :
			action_value[action_name] =action_state.ACTIVE
