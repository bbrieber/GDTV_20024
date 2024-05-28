class_name WaterSpring extends Node2D
	
@onready var collision : CollisionShape2D = %CollisionShape2D 	

var velocity: float = 0
var force: float = 0


var height: float = 0
var target_height: float = 0


func spring_update(spring_constant : float,dampening: float) ->void:
	height = position.y
	
	var x = height - target_height
	var loss = -dampening * velocity
	
	
	force = -spring_constant *x +loss
	velocity += force
	
	position.y += velocity


func initialize(x_position:float,width:float,id:int)->void:
	position.x = x_position
	height = position.y
	target_height = position.y
	velocity = 0
	index = id
	set_collision_width(width)
	

func set_collision_width(width : float) -> void:
	var size :Vector2 = collision.shape.size
	collision.shape.size = Vector2(width,size.y) 
	

var index :int = 0
var motion_modifier :float = 1

signal splash(index:int,speed:float)

func _on_body_entered(body:Node2D):
	var speed = motion_modifier
	splash.emit(index,speed)
	
	
	pass # Replace with function body.
