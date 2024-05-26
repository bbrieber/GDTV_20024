extends StateTransition



func should_transition() -> bool:
	return player.input_processor.direction.x != 0
