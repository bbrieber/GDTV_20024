extends Node


signal on_show_dialogue(dialogue_id : StringName)



signal on_dialogue_closed(dialogue_id : StringName)


func show_dialogue(dialogue_id : StringName) -> void:
	on_show_dialogue.emit(dialogue_id)	
	
func close_dialogue(dialogue_id : StringName) -> void:
	on_dialogue_closed.emit(dialogue_id)	
