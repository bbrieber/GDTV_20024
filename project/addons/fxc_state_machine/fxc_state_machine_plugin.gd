@tool
extends EditorPlugin




const MainPanel = preload("res://addons/fxc_state_machine/FxcStateMachine.tscn")

var main_panel_instance


func _enter_tree():
	main_panel_instance = MainPanel.instantiate()
	# Add the main panel to the editor's main viewport.
	add_control_to_bottom_panel(main_panel_instance,_get_plugin_name())

#	EditorInterface.get_editor_main_screen().add_child(main_panel_instance)
	# Hide the main panel. Very much required.
	_make_visible(false)


func _exit_tree():
	if main_panel_instance:
		remove_control_from_bottom_panel(main_panel_instance)
		main_panel_instance.queue_free()




func _has_main_screen():
	return false


func _make_visible(visible):	
	if main_panel_instance:
		main_panel_instance.visible = visible


func _get_plugin_name():
	return "State Maschine"


func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")
