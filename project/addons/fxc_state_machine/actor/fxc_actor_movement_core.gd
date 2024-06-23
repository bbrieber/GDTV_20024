class_name FxcActorMovementCore extends Node


@export var actor : FxcActor

var gravity: float = - ProjectSettings.get_setting("physics/2d/default_gravity")

var run_acceleration : float 
var run_deceleration : float 
var max_fall_speed : float 



var target_velocity:Vector2 = Vector2.ZERO

var movement_config:FxcActorMovementConfig

func init()->void:
	movement_config  = actor.get_actor_movement_config()
	run_acceleration  = movement_config.run_velocity / movement_config.run_time_to_peak
	run_deceleration = (-movement_config.run_velocity) / movement_config.run_time_to_stop
	max_fall_speed = _get_gravity() * movement_config.time_to_max_fallspeed * -1
	


func update_locomotion(direction: float, delta: float, update_view_dir:bool = true, freeze_x:bool = false, freeze_y:bool = false) -> void:
	
	if update_view_dir:
		actor.get_actor_skin().set_view_direction(direction)
		
	## Get linear velocity	
	if not freeze_x:
		if direction != 0:
			actor.velocity.x = _get_run_velocity(direction,delta)
		else:
			actor.velocity.x = 0
			#player.velocity.x =  _get_stop_velocity(direction,delta)#
			
			
	if not freeze_y:
		actor.velocity.y -=  _get_gravity() * delta
		actor.velocity.y = minf(actor.velocity.y,max_fall_speed)
	
	actor.move_and_slide()
	



	
func _get_stop_velocity(direction: float,delta:float) ->float:
	
	var target_dir_sign : int = 1 if direction > 0 else -1
	var current_dir_sign : int = 1 if actor.velocity.x > 0 else -1

	
	var out:float = run_deceleration * delta *target_dir_sign
	if current_dir_sign > 1:
		out = min(out,0)
	else:
		out = max(out,0)
	return out


func _get_run_velocity(direction: float,delta:float) ->float:
	var out:float = actor.velocity.x
	var target_dir_sign : int = 1 if direction > 0 else -1
	target_velocity.x = direction  * movement_config.run_velocity

	var accelerate : bool = true if ( 
		(target_dir_sign > 0 and target_velocity.x >= actor.velocity.x) or
		(target_dir_sign < 0 and target_velocity.x <= actor.velocity.x) 
		or
		(target_dir_sign > 0 and target_velocity.x < 0) or
		(target_dir_sign < 0 and target_velocity.x > 0)
		 ) else false
		
	if accelerate:
		out += run_acceleration * delta *target_dir_sign

	else:
		out += run_deceleration * delta *target_dir_sign
	
	if target_dir_sign > 0:
		out = max(out,target_velocity.x)
	else:
		out = min(out,target_velocity.x)
		

	return out
	
	
func set_gravity(m_gravity:float)->void:
	gravity = m_gravity
	
func _get_gravity()->float:
	return gravity 

 
