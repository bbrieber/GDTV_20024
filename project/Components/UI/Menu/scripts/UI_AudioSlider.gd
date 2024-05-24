class_name UI_AudioSlider extends Slider


@export var bus_name :String

var bus_index:int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	set_value_no_signal( db_to_linear(AudioServer.get_bus_volume_db(bus_index)))
	value_changed.connect(_on_value_changed)
	
	
func _on_value_changed(new_value : float)-> void:
	GameSettingsManager.set_sound_value(bus_name,new_value)
#	AudioServer.set_bus_volume_db(bus_index,linear_to_db(new_value))
#	AudioServer.set_bus_mute(bus_index,new_value < step)
		
