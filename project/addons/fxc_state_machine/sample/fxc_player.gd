class_name FxcPlayer extends FxcActor


@export var movement_config : FxcActorMovementConfig

func get_actor_skin()->FxcActorSkin:
	return %PlayerSkin

func get_actor_input()->FxcActorInput:
	return %FxcPlayerInput
	
	
func get_actor_status()->FxcActorStatus:
	return %FxcPlayerStatus
	
	
func get_actor_movement_config()->FxcActorMovementConfig:
	return movement_config
	
func get_actor_movement_core()->FxcActorMovementCore:
	return %FxcPlayerMovementCore
