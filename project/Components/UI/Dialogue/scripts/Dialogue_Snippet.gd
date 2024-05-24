class_name Dialogue_Snippet extends Object


var speaker_name :StringName
var speaker_position :StringName
var speaker_image :StringName
var text :StringName
var color :StringName

static func generate_from_dict(dict: Dictionary) -> Dialogue_Snippet:
	var snippet :Dialogue_Snippet= Dialogue_Snippet.new()

	snippet.speaker_name = dict["speaker_name"]
	snippet.speaker_position = dict["speaker_position"]
	snippet.speaker_image = dict["speaker_image"]
	
	snippet.text = dict["text"]
	snippet.color = dict["color"]
	
	
	return snippet
