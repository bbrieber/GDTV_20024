extends StateTransition



func should_transition() -> bool:
	return not player.player_state.can_climb() 
