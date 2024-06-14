class_name FxcPlayerState extends FxcActorSkin


@onready var anim_player:AnimationPlayer =  %SkinAnimationPlayer
@onready var sprite:Sprite2D =  %SkinSprite

func play_animation(name :StringName)->void:
	if name == FxcActorSkin.IDLE:
		anim_player.play("idle")
	elif name == FxcActorSkin.JUMP:
		anim_player.play("jump")
	elif name == FxcActorSkin.FALL:
		anim_player.play("fall")


func pause_animation() -> void:
	anim_player.pause()

var current_view_dir: float = 0
	
func set_view_direction(dir: float) -> void:
	if dir < 0:
		sprite.flip_h = true
	elif dir > 0:
		sprite.flip_h = false
