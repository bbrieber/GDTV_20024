extends StateTransition


func should_transition() -> bool:
	return player.player_state.is_dead() and state_machine.state != target_state
