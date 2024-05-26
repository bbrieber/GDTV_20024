class_name State_Glide extends StateMovementBase



var fall_gravity : float 
var glide_gravity : float


func enter(_msg :Dictionary= {}) -> void:
	
	fall_gravity  = (-2* player.player_movement_config.jump_height) / (player.player_movement_config.jump_time_to_descend *player.player_movement_config.jump_time_to_descend)
	glide_gravity = (-2* player.player_movement_config.jump_height) / (player.player_movement_config.glide_time_to_descend *player.player_movement_config.glide_time_to_descend)

	player.player_skin.play_animation(PlayerSkin.ANIMATION_STATE.FALL)
	print("FALL")
	
	
func exit() -> void:
	pass
	print("stop FALL")




func physics_update(_ownerBody: CharacterBody2D,delta: float) -> void:
	max_fall_speed = _get_gravity() * player.player_movement_config.time_to_max_fallspeed * -1
	
	var direction :Vector2= player.input_processor.direction
	update_locomotion(direction.x,delta)





func _get_gravity() -> float:
	return glide_gravity if player.player_state.is_gliding() else fall_gravity

			
