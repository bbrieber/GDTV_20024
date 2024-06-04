class_name FxcStateMaschineResource extends Resource


@export var states : Array[FxcState] 
@export var transitions : Array[FxcTransition] 


func get_states()->  Array[FxcState] :
	if states.is_empty():
		states.append(FxcIdleState.new())
		states.append(FxcState.new())
		
	return states
