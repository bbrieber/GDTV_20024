class_name FxcActorState extends FxcState


var actor : FxcActor

func set_owner(m_owner:Node)->void:
	assert (m_owner is FxcActor)
	
	owner = m_owner
	actor = m_owner as FxcActor
