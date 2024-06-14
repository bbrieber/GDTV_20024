class_name FxcFallState extends FxcActorState

func get_state_name() -> StringName:
	return "Fall"


func enter(_msg :Dictionary= {}) -> void:
	actor.get_actor_skin().play_animation(FxcActorSkin.IDLE)
	actor.velocity = Vector2.ZERO
	
func update(delta: float) -> void:	
	actor.move_and_slide()
	
