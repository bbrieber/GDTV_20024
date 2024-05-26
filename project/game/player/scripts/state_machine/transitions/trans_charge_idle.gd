extends StateTransition



func should_transition() -> bool:
	return not player.input_processor.wanna_charge
