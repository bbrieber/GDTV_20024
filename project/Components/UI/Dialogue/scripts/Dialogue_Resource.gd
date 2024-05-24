class_name Dialogue_Resource extends Object


var dialogue_id:StringName
var dialogue_position:StringName
var dialogue_snippets:Array[Dialogue_Snippet] = []


static func generate_from_dict(dict: Dictionary) -> Dialogue_Resource:
	var dialogue : Dialogue_Resource = Dialogue_Resource.new()
	dialogue.dialogue_id = dict["dialogue_id"]
	dialogue.dialogue_position = dict["dialogue_position"]
	for snip_dict :Dictionary in dict["dialogue_snippets"]:
		dialogue.dialogue_snippets.append(Dialogue_Snippet.generate_from_dict(snip_dict))
	
	return dialogue
