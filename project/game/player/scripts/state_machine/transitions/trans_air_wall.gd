extends StateTransition



func should_transition() -> bool:
	return player.player_state.can_climb()
