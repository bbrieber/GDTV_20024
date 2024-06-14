class_name FxcStateMaschine extends Node


@export var state_maschine : FxcStateMaschineResource


@export var current_state : FxcState 
@export var any_state : FxcState 


signal transitioned(state_name)

func _ready() -> void:
	current_state = state_maschine.get_init_state()
	any_state = state_maschine.get_any_state()
	
	if current_state:
		current_state.enter()
	pass
	
	
func _unhandled_input(event: InputEvent) -> void:
	current_state.handle_input(event)


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	check_transitions()
	current_state.update_physics(delta)




func check_transitions() ->void:
	for trans in state_maschine.transitions.filter(is_any_state):
		if trans.should_transition():
			trigger_transition(trans)
			return
			
	for trans in state_maschine.transitions.filter(is_current_state):
		if trans.should_transition():
			trigger_transition(trans)
			return
		
func is_any_state(state_transtion: StateTransition) -> bool:
	return any_state == state_transtion.start_state
	
func is_current_state(otherState: StateTransition) -> bool:
	return current_state.name == otherState.start_state.name
	
func trigger_transition(transition:FxcTransition, msg: Dictionary = {}) -> void:
	current_state.exit()
	current_state = transition.to
	current_state.enter(msg)
	emit_signal("transitioned", current_state.name)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings : PackedStringArray = PackedStringArray()
	if not state_maschine:
		return ["you need to specify a state maschine resource"]
		
	return []
