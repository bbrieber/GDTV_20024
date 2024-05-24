extends Node


var config_file : ConfigFile= ConfigFile.new()
var config_path : StringName = "user://game_settings.cfg"

func _ready() -> void:
	if load_game_settings() != OK:
		print("could not load settings")
		load_default_settings()
	
	print("settings loaded")


func load_game_settings()->Error:
	var err = config_file.load(config_path)

	# If the file didn't load, ignore it.
	if err != OK:
		return err

	load_sound_settings()
		
	
	return OK

var sound_section_name :StringName = "SOUND"

var sound_settings :Dictionary = {
		"Main":0.5,
		"SFX":0.5,
		"Music":0.5,
		}


func load_sound_settings()->void:
	if not config_file.has_section ( sound_section_name ):
		return 
	for key : String in sound_settings.keys():
		var sound_value : float = config_file.get_value(sound_section_name, key) as float
		_update_sound_value(key,sound_value)
		
func set_sound_value(bus_name: String, value:float, min_value:float = 0.05)->void:
	_update_sound_value(bus_name,value,min_value)
	save_game_settings()

func _update_sound_value( bus_name: String, value:float, min_value:float = 0.05)-> void:
	print("update Sound to",value)
	
	sound_settings[bus_name] = value
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))
	AudioServer.set_bus_mute(bus_index,value < min_value)
	config_file.set_value(sound_section_name,bus_name,value)
		
	
func load_default_settings()->void:
	for key : String in sound_settings.keys():
		_update_sound_value(key,sound_settings[key])
	save_game_settings()
	
	

func save_game_settings()->void:
	config_file.save(config_path)
	
