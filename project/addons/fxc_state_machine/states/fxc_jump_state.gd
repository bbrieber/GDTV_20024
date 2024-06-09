class_name FxcJumpState extends FxcActorState

func get_state_name() -> StringName:
	return "Jump"


var jump_velocity : float
var jump_gravity : float 

var jump_factor :float = 1

func enter(_msg :Dictionary= {}) -> void:
	jump_velocity  = (2*actor.get_actor_movement_config().jump_height) / actor.get_actor_movement_config().jump_time_to_peak
	jump_gravity  = (-2*actor.get_actor_movement_config().jump_height) / (actor.get_actor_movement_config().jump_time_to_peak *actor.get_actor_movement_config().jump_time_to_peak)

	start_jump(jump_velocity)

	
func start_jump(m_jump_velocity:float,m_jump_factor: int =1)->void:
	actor.get_actor_skin().play_animation(FxcActorSkin.JUMP)
	#print("JUMP")
	jump_factor = m_jump_factor
	actor.velocity.y = - m_jump_velocity




	

	
func physics_update(ownerBody: CharacterBody2D,delta: float) -> void:
	var direction:Vector2 = actor.get_actor_input().direction
	if actor.get_actor_input().is_action_requested("JUMP"):
		jump_factor = actor.get_actor_movement_config().jump_stop_factor
	
	var head_bounce_offset :int= actor.get_actor_status().get_jump_shift() 
	if head_bounce_offset != 0:
		ownerBody.position.x += head_bounce_offset
	
	actor.get_actor_movement_core().update_locomotion(direction.x,delta)





func _get_gravity() -> float:
	return jump_gravity * jump_factor

			
