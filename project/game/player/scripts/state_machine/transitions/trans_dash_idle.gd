extends StateTransition


func should_transition() -> bool:
	return  player.player_state.is_dashing() == false and player.is_on_floor() and player.input_processor.horizontal_dir == 0
