class_name ViewportLinkTarget extends Control


@onready var linkController : Control = $LinkContainer
@onready var vp :Viewport = get_viewport() 

var anchor : ViewportAnchor = null

var vp_size :Vector2


func _ready() -> void:
	GlobalViewportLink.register_link_target(self)
	set_process(false)


func _process(_delta: float) -> void:
	if anchor != null :
		vp_size = vp.size
		var v : Vector2 = anchor.get_viewport_position()
		position = Vector2(v.x* vp_size.x,v.y* vp_size.y)
	
func link_anchor(m_anchor: ViewportAnchor)-> void:
	set_process(true)
	vp  = get_viewport() 
	
	anchor = m_anchor
	linkController.visible = true

	
	
func release_anchor(_m_anchor: ViewportAnchor)-> void:
	set_process(false)
	anchor = null
	linkController.visible = false

