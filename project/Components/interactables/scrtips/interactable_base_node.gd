class_name InteractableDialogueNode extends Area2D



@export var interaction_container :  Control
@export var anchor :  ViewportAnchor

var active : bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _unhandled_input(event : InputEvent) -> void:	
	if not active:
		return
	if event.is_action_pressed("interact"):
		get_viewport().set_input_as_handled()
		_on_interact()
		
	

func _on_interact() -> void:
	pass


func _on_body_entered(_body : Node2D) -> void:
	active = true
	if anchor:
		GlobalViewportLink.link_anchor_to_target(anchor)	
	
	if interaction_container:
		interaction_container.visible = true


func _on_body_exited(_body : Node2D) -> void:
	active = false
	if anchor:
		GlobalViewportLink.unlink_anchor_from_target(anchor)	
	
	if interaction_container:
		interaction_container.visible = false
