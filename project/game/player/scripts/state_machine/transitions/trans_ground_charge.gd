extends StateTransition



func should_transition() -> bool:
	return player.input_processor.wanna_charge
