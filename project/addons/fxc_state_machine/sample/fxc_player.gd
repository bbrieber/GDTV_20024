class_name FxcPlayer extends FxcActor




func get_actor_skin()->FxcActorSkin:
	return %PlayerSkin



func get_actor_input()->FxcActorInput:
	assert(false, "This method must be implemented")
	return null
	
	
func get_actor_status()->FxcActorStatus:
	assert(false, "This method must be implemented")
	return null
	
	
func get_actor_movement_config()->FxcActorMovementConfig:
	assert(false, "This method must be implemented")
	return null
	
func get_actor_movement_core()->FxcActorMovementCore:
	assert(false, "This method must be implemented")
	return null
