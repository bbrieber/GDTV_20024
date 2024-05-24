class_name UI_SceneTransition extends CanvasLayer


func change_scene(target_scene: PackedScene) -> void:
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(target_scene)
	$AnimationPlayer.play_backwards("fade_out")
	
