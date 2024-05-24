extends Node


var link_target:ViewportLinkTarget

	

func register_link_target(target : ViewportLinkTarget)->void:
	link_target = target
	
func link_anchor_to_target(anchor : ViewportAnchor) -> void:
	link_target.link_anchor(anchor)	
	
func unlink_anchor_from_target(anchor : ViewportAnchor) -> void:
	link_target.release_anchor(anchor)	
	
