class_name FxcStateMaschineResource extends Resource


@export var states : Array[FxcState] 
@export var transitions : Array[FxcTransition] 

@export var init_state : FxcState
@export var any_state : FxcState



func get_init_state() -> FxcState:
	return init_state

func get_any_state() -> FxcState:
	return any_state

func get_states()->  Array[FxcState] :
	if states.is_empty():
		states.append(FxcIdleState.new())
		states.append(FxcState.new())
		
	return states
