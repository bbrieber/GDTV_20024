extends StateTransition


func should_transition() -> bool:
	return owner.is_on_floor() and player.input_processor.direction.x == 0
