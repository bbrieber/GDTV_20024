extends StateTransition


func should_transition() -> bool:
	return player.velocity.y >= 0
