class_name Dialogue_Manager extends Node


@export var dialogue_hud : Dialogue_HUD

var dialogue :Dialogue_Resource
var snippet_id :int = -1

func _ready() -> void:
	GlobalSignalDispatcher.on_show_dialogue.connect(load_dialogue)
	dialogue_hud.dialogue_closed.connect(on_dialogue_snippet_closed)
	
func load_dialogue(dialogue_id : StringName)->void:
	dialogue_hud.visible = true
	var content = _load_dialogue_file(dialogue_id)
	
	dialogue  = Dialogue_Resource.generate_from_dict(content)
	
	var first_snippet:Dialogue_Snippet = dialogue.dialogue_snippets[0];
	snippet_id = 0
	
	dialogue_hud.show_dialogue_snippet(first_snippet)
	
	
func on_dialogue_snippet_closed():
	snippet_id = snippet_id +1
	if dialogue.dialogue_snippets.size() > snippet_id :
		dialogue_hud.show_dialogue_snippet( dialogue.dialogue_snippets[snippet_id])
	else:
		snippet_id = -1
		dialogue = null
		dialogue_hud.visible = false
	

func _load_dialogue_file(dialogue_id : StringName) -> Dictionary:
	var file = FileAccess.open("res://Components/UI/Dialogue/sample/foo.dialogue.json", FileAccess.READ)
	var content = file.get_as_text()
	
	var json = JSON.new()
	var error = json.parse(content)
	if error == OK:
		return json.data
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", content, " at line ", json.get_error_line())
	
	return {}


