extends StateTransition



func should_transition() -> bool:
	return player.player_state.is_fade_active()
