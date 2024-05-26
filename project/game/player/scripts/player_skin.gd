class_name PlayerSkin extends Node2D


@onready var anim_player : AnimationPlayer = $SkinAnimationPlayer
@onready var sprite : Sprite2D = $SkinSprite
@export var player : Player 


@export var ghost_scene : PackedScene
@onready var _ghost_timer = Timer.new()

signal respawn_animation_finished
signal fade_animation_finished

enum ANIMATION_STATE {
	IDLE,
	RUN,
	START_JUMP,
	JUMP,
	FALL,
	CLIMB,
	WALL_SLIDE,
	DASH_FORWARD,
	DIE
}

	
	

func play_animation(animation: ANIMATION_STATE):
	if animation == ANIMATION_STATE.IDLE:
		anim_player.play("idle")
	elif animation == ANIMATION_STATE.RUN:
		anim_player.play("run")
	elif animation == ANIMATION_STATE.JUMP:
		anim_player.play("jump")
	elif animation == ANIMATION_STATE.FALL:
		anim_player.play("fall")
	elif animation == ANIMATION_STATE.DASH_FORWARD:
		anim_player.play("dashForward")
	elif animation == ANIMATION_STATE.DIE:
		anim_player.play("die")
		
	
	

func start_dash():
	_ghost_timer.start()

func stop_dash():
	_ghost_timer.stop()
	
func _add_ghost() -> void:
	print("adding ")
	var ghost = ghost_scene.instantiate() as Ghost
	ghost.texture = sprite.texture
	ghost.position = sprite.global_position
	ghost.scale = sprite.global_scale
	ghost.hframes = sprite.hframes
	ghost.vframes = sprite.vframes
	ghost.frame = sprite.frame
	get_tree().current_scene.add_child(ghost)
	
func pause_animation() -> void:
	anim_player.pause()

var current_view_dir: float = 0
	
func set_view_direction(dir: float) -> void:
	if dir < 0:
		sprite.flip_h = true
	elif dir > 0:
		sprite.flip_h = false
		
	
func play_idle():
	anim_player.play(name)
	
func _ready():	
	_ghost_timer.timeout.connect(_add_ghost)
	_ghost_timer.wait_time = 0.05
	_ghost_timer.one_shot = false
	add_child(_ghost_timer)
	



func respawn_player():
	anim_player.play_backwards("Die")
	await anim_player.animation_finished
	respawn_animation_finished.emit()
	
		
