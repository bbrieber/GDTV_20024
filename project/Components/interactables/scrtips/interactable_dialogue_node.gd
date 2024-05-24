extends InteractableDialogueNode


@export var dialogue_id :  StringName

func _on_interact() -> void:
	print("dlg")
	GlobalSignalDispatcher.show_dialogue(dialogue_id)
