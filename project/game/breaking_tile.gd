@tool
class_name BreakingTile extends StaticBody2D


@onready var anim_player : AnimationPlayer = %AnimationPlayer
@export var destroy_vfx : PackedScene 


func destroy_tile()->void:
	var particles = destroy_vfx.instantiate() as GPUParticles2D
	
	get_parent().add_child(particles)
	particles.global_position = global_position
	particles.emitting = true
	particles.finished.connect( particles.queue_free)
	queue_free()



func _on_body_entered(body) -> void:
	if not anim_player.is_playing():
		anim_player.speed_scale = 2
		anim_player.play("destroy")


func init_tile()->void:
	print("hey")
	anim_player.play("default")
	anim_player.stop()
